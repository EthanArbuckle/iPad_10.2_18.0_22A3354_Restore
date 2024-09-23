uint64_t sub_238083BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_238013814;
  return CryptexPolicy.evaluate(bundle:context:)(a1, a2);
}

void sub_238083BFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = type metadata accessor for SEP.SealedHash(0);
  __swift_allocate_value_buffer(v0, qword_2568C82C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C82C0);
  sub_2380BD238();
  swift_allocObject();
  v2 = 0x3000000000;
  v3 = sub_2380BD214();
  sub_238084418((int *)&v2, 0);
  v1 = v2;
  LOBYTE(v2) = 14;
  SEP.SealedHash.init(digest:flags:)(v1, v3 | 0x4000000000000000);
}

_OWORD *sub_238083CF8(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD **v7;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _OWORD *v23;
  _OWORD *result;
  unint64_t v25;
  char v26;

  v7 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_23800DEDC(a2, a3, a4, a5);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a6 & 1) != 0)
    {
LABEL_7:
      v22 = *v7;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = (_OWORD *)(v22[7] + 32 * v16);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
        return sub_23800ED10(a1, v23);
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a6 & 1) == 0)
    {
      sub_238089014();
      goto LABEL_7;
    }
    sub_23802D05C(v19, a6 & 1);
    v25 = sub_23800DEDC(a2, a3, a4, a5);
    if ((v20 & 1) == (v26 & 1))
    {
      v16 = v25;
      v22 = *v7;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_238084260(v16, a2, a3, a4, a5, a1, v22);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_2380BE1E0();
  __break(1u);
  return result;
}

uint64_t sub_238083E54(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_2380BD448();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23800DF54(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      v22 = type metadata accessor for SEP.SealedHash(0);
      return sub_238085A24(a1, v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, type metadata accessor for SEP.SealedHash);
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_2380891F0();
    goto LABEL_7;
  }
  sub_23802D360(v17, a3 & 1);
  v24 = sub_23800DF54(a2);
  if ((v18 & 1) != (v25 & 1))
  {
LABEL_14:
    result = sub_2380BE1E0();
    __break(1u);
    return result;
  }
  v14 = v24;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_2380842D0(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_238083FC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_23800DCFC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = type metadata accessor for Proto_SealedHash(0);
        return sub_238085A24(a1, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, type metadata accessor for Proto_SealedHash);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2380898CC();
      goto LABEL_7;
    }
    sub_23802E0DC(v15, a4 & 1);
    v22 = sub_23800DCFC(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_238084388(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_2380BE1E0();
  __break(1u);
  return result;
}

uint64_t sub_238084104(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23800DCFC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_238089B10();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23802E45C(v15, a4 & 1);
  v21 = sub_23800DCFC(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2380BE1E0();
  __break(1u);
  return result;
}

_OWORD *sub_238084260(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6, _QWORD *a7)
{
  _QWORD *v8;
  _OWORD *result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a7[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a7[6] + 32 * a1);
  *v8 = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  result = sub_23800ED10(a6, (_OWORD *)(a7[7] + 32 * a1));
  v10 = a7[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a7[2] = v12;
  return result;
}

uint64_t sub_2380842D0(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_2380BD448();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = type metadata accessor for SEP.SealedHash(0);
  result = sub_238001DE4(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, type metadata accessor for SEP.SealedHash);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_238084388(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for Proto_SealedHash(0);
  result = sub_238001DE4(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, type metadata accessor for Proto_SealedHash);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

char *sub_238084418(int *a1, int a2)
{
  char *result;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  size_t v11;

  result = (char *)sub_2380BD2EC();
  v5 = *a1;
  v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (char *)sub_2380BD208();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v7 = result;
  result = (char *)sub_2380BD22C();
  v8 = v5 - (_QWORD)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = v6 - v5;
  v10 = sub_2380BD220();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  return (char *)memset(&v7[v8], a2, v11);
}

unint64_t sub_238084498(uint64_t *a1)
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
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _OWORD v34[6];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = sub_2380BD448();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C66F0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SEP.SealedHash(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v11);
  v14 = 0;
  v15 = a1[1];
  if (v15 >> 60 != 15)
  {
    v29 = v13;
    v30 = (uint64_t)&v27 - v12;
    v16 = *a1;
    v17 = a1[3];
    v18 = a1[2];
    v32 = v16;
    sub_237FFBA20(v16, v15);
    v33 = v17;
    sub_237FFBA20(v18, v17);
    v14 = sub_23800BE54(MEMORY[0x24BEE4AF8]);
    if (qword_2568C5040 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v2, (uint64_t)qword_2568C82A8);
    v20 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v27 = v19;
    v28 = v20;
    v21 = ((uint64_t (*)(char *))v20)(v5);
    memset(v34, 0, 86);
    MEMORY[0x24BDAC7A8](v21);
    *(&v27 - 2) = (uint64_t)v5;
    *(&v27 - 1) = (uint64_t)v34;
    v31 = v18;
    sub_238034118((uint64_t)sub_238036830, (uint64_t)(&v27 - 4), v32, v15, v18, v33);
    v22 = *(void (**)(char *, uint64_t))(v3 + 8);
    v22(v5, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      sub_23804E940(v32, v15, v31, v33);
      sub_238005240((uint64_t)v8, &qword_2568C66F0);
    }
    else
    {
      v23 = v30;
      sub_238001DE4((uint64_t)v8, v30, type metadata accessor for SEP.SealedHash);
      v28(v5, v27, v2);
      v24 = v29;
      sub_238013570(v23, v29, type metadata accessor for SEP.SealedHash);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v34[0] = v14;
      sub_238083E54(v24, (uint64_t)v5, isUniquelyReferenced_nonNull_native);
      v14 = *(_QWORD *)&v34[0];
      swift_bridgeObjectRelease();
      v22(v5, v2);
      sub_23804E940(v32, v15, v31, v33);
      sub_237FFD540(v23, type metadata accessor for SEP.SealedHash);
    }
  }
  return v14;
}

uint64_t sub_2380847B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C66F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for CryptexPolicy.Error()
{
  uint64_t result;

  result = qword_2568C8378;
  if (!qword_2568C8378)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t assignWithCopy for CryptexPolicy(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for CryptexPolicy(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CryptexPolicy(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 9))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CryptexPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CryptexPolicy()
{
  return &type metadata for CryptexPolicy;
}

uint64_t *initializeBufferWithCopyOfBuffer for CryptexPolicy.Error(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  int EnumCaseMultiPayload;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = sub_2380BD448();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F0) + 48);
        v9 = (uint64_t *)((char *)a1 + v8);
        v10 = (uint64_t *)((char *)a2 + v8);
        type metadata accessor for SEP.SealedHash.Value(0);
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
        {
          v13 = *v10;
          v12 = v10[1];
          sub_237FFBA20(v13, v12);
          *v9 = v13;
          v9[1] = v12;
        }
        else
        {
          v25 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v9, v10, v25);
        }
        goto LABEL_16;
      case 3u:
        v16 = *a2;
        v17 = a2[1];
        sub_237FFBA20(*a2, v17);
        *a1 = v16;
        a1[1] = v17;
        v19 = a2[2];
        v18 = a2[3];
        sub_237FFBA20(v19, v18);
        a1[2] = v19;
        a1[3] = v18;
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        type metadata accessor for SEP.SealedHash.Value(0);
        v20 = swift_getEnumCaseMultiPayload();
        if (v20 == 2 || v20 == 1)
        {
          v21 = *a2;
          v22 = a2[1];
          sub_237FFBA20(*a2, v22);
          *a1 = v21;
          a1[1] = v22;
        }
        else
        {
          v26 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(a1, a2, v26);
        }
        swift_storeEnumTagMultiPayload();
        v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
        v28 = (uint64_t *)((char *)a1 + v27);
        v29 = (uint64_t *)((char *)a2 + v27);
        v30 = swift_getEnumCaseMultiPayload();
        if (v30 == 2 || v30 == 1)
        {
          v32 = *v29;
          v31 = v29[1];
          sub_237FFBA20(v32, v31);
          *v28 = v32;
          v28[1] = v31;
        }
        else
        {
          v33 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v28, v29, v33);
        }
LABEL_16:
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        v23 = (void *)*a2;
        v24 = v23;
        *a1 = (uint64_t)v23;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void destroy for CryptexPolicy.Error(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  int EnumCaseMultiPayload;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v2 = sub_2380BD448();
      (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
      v3 = (uint64_t *)((char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F0) + 48));
      type metadata accessor for SEP.SealedHash.Value(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
        goto LABEL_17;
      if (!EnumCaseMultiPayload)
        goto LABEL_5;
      break;
    case 3u:
      sub_237FFBAB0(*a1, a1[1]);
      v8 = a1[2];
      v9 = a1[3];
      goto LABEL_18;
    case 4u:
      type metadata accessor for SEP.SealedHash.Value(0);
      v6 = swift_getEnumCaseMultiPayload();
      if (v6 == 2 || v6 == 1)
      {
        sub_237FFBAB0(*a1, a1[1]);
      }
      else if (!v6)
      {
        v7 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
      }
      v3 = (uint64_t *)((char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48));
      v10 = swift_getEnumCaseMultiPayload();
      if (v10 == 2 || v10 == 1)
      {
LABEL_17:
        v8 = *v3;
        v9 = v3[1];
LABEL_18:
        sub_237FFBAB0(v8, v9);
      }
      else if (!v10)
      {
LABEL_5:
        v5 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
      }
      break;
    case 5u:

      break;
    default:
      return;
  }
}

uint64_t *initializeWithCopy for CryptexPolicy.Error(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  int EnumCaseMultiPayload;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = sub_2380BD448();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F0) + 48);
      v8 = (uint64_t *)((char *)a1 + v7);
      v9 = (uint64_t *)((char *)a2 + v7);
      type metadata accessor for SEP.SealedHash.Value(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        v12 = *v9;
        v11 = v9[1];
        sub_237FFBA20(v12, v11);
        *v8 = v12;
        v8[1] = v11;
      }
      else
      {
        v22 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v8, v9, v22);
      }
      goto LABEL_20;
    case 3u:
      v13 = *a2;
      v14 = a2[1];
      sub_237FFBA20(*a2, v14);
      *a1 = v13;
      a1[1] = v14;
      v16 = a2[2];
      v15 = a2[3];
      sub_237FFBA20(v16, v15);
      a1[2] = v16;
      a1[3] = v15;
      goto LABEL_21;
    case 4u:
      type metadata accessor for SEP.SealedHash.Value(0);
      v17 = swift_getEnumCaseMultiPayload();
      if (v17 == 2 || v17 == 1)
      {
        v18 = *a2;
        v19 = a2[1];
        sub_237FFBA20(*a2, v19);
        *a1 = v18;
        a1[1] = v19;
      }
      else
      {
        v23 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(a1, a2, v23);
      }
      swift_storeEnumTagMultiPayload();
      v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
      v25 = (uint64_t *)((char *)a1 + v24);
      v26 = (uint64_t *)((char *)a2 + v24);
      v27 = swift_getEnumCaseMultiPayload();
      if (v27 == 2 || v27 == 1)
      {
        v29 = *v26;
        v28 = v26[1];
        sub_237FFBA20(v29, v28);
        *v25 = v29;
        v25[1] = v28;
      }
      else
      {
        v30 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v25, v26, v30);
      }
LABEL_20:
      swift_storeEnumTagMultiPayload();
      goto LABEL_21;
    case 5u:
      v20 = (void *)*a2;
      v21 = v20;
      *a1 = (uint64_t)v20;
LABEL_21:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *assignWithCopy for CryptexPolicy.Error(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  int EnumCaseMultiPayload;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for CryptexPolicy.Error);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = sub_2380BD448();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F0) + 48);
        v8 = (uint64_t *)((char *)a1 + v7);
        v9 = (uint64_t *)((char *)a2 + v7);
        type metadata accessor for SEP.SealedHash.Value(0);
        EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
        {
          v12 = *v9;
          v11 = v9[1];
          sub_237FFBA20(v12, v11);
          *v8 = v12;
          v8[1] = v11;
        }
        else
        {
          v30 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v8, v9, v30);
        }
        goto LABEL_21;
      case 3u:
        v13 = *a2;
        v14 = a2[1];
        sub_237FFBA20(*a2, v14);
        *a1 = v13;
        a1[1] = v14;
        v16 = a2[2];
        v15 = a2[3];
        sub_237FFBA20(v16, v15);
        a1[2] = v16;
        a1[3] = v15;
        goto LABEL_22;
      case 4u:
        type metadata accessor for SEP.SealedHash.Value(0);
        v17 = swift_getEnumCaseMultiPayload();
        if (v17 == 2 || v17 == 1)
        {
          v18 = *a2;
          v19 = a2[1];
          sub_237FFBA20(*a2, v19);
          *a1 = v18;
          a1[1] = v19;
        }
        else
        {
          v22 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(a1, a2, v22);
        }
        swift_storeEnumTagMultiPayload();
        v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
        v24 = (uint64_t *)((char *)a1 + v23);
        v25 = (uint64_t *)((char *)a2 + v23);
        v26 = swift_getEnumCaseMultiPayload();
        if (v26 == 2 || v26 == 1)
        {
          v28 = *v25;
          v27 = v25[1];
          sub_237FFBA20(v28, v27);
          *v24 = v28;
          v24[1] = v27;
        }
        else
        {
          v29 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v24, v25, v29);
        }
LABEL_21:
        swift_storeEnumTagMultiPayload();
        goto LABEL_22;
      case 5u:
        v20 = (void *)*a2;
        v21 = v20;
        *a1 = (uint64_t)v20;
LABEL_22:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *initializeWithTake for CryptexPolicy.Error(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    v12 = type metadata accessor for SEP.SealedHash.Value(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v14 = sub_2380BD9AC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
      swift_storeEnumTagMultiPayload();
    }
    v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
    v16 = &a1[v15];
    v17 = &a2[v15];
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      v18 = sub_2380BD9AC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      swift_storeEnumTagMultiPayload();
    }
    goto LABEL_14;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = sub_2380BD448();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F0) + 48);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = type metadata accessor for SEP.SealedHash.Value(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      v13 = sub_2380BD9AC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v9, v10, v13);
      swift_storeEnumTagMultiPayload();
    }
LABEL_14:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for CryptexPolicy.Error(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for CryptexPolicy.Error);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      v12 = type metadata accessor for SEP.SealedHash.Value(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        v14 = sub_2380BD9AC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
        swift_storeEnumTagMultiPayload();
      }
      v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
      v16 = &a1[v15];
      v17 = &a2[v15];
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        v18 = sub_2380BD9AC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
        swift_storeEnumTagMultiPayload();
      }
      goto LABEL_15;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = sub_2380BD448();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F0) + 48);
      v9 = &a1[v8];
      v10 = &a2[v8];
      v11 = type metadata accessor for SEP.SealedHash.Value(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
      }
      else
      {
        v13 = sub_2380BD9AC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v9, v10, v13);
        swift_storeEnumTagMultiPayload();
      }
LABEL_15:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2380858A4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v5;
  char v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  void *v12;

  v0 = sub_2380BD448();
  if (v1 <= 0x3F)
  {
    v2 = type metadata accessor for SEP.SealedHash.Value(319);
    if (v3 > 0x3F)
    {
      return v2;
    }
    else
    {
      swift_getTupleTypeLayout2();
      v7 = &v6;
      v8 = &unk_2380C4478;
      v9 = &unk_2380C4478;
      v10 = &unk_2380C4490;
      swift_getTupleTypeLayout2();
      v11 = &v5;
      v12 = &unk_2380C44A8;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return v0;
}

_QWORD *initializeBufferWithCopyOfBuffer for CryptexPolicy.SealedHashesLoader(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CryptexPolicy.SealedHashesLoader(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for CryptexPolicy.SealedHashesLoader(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CryptexPolicy.SealedHashesLoader()
{
  return &type metadata for CryptexPolicy.SealedHashesLoader;
}

uint64_t sub_238085A24(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

_UNKNOWN **sub_238085A6C()
{
  return &off_2568C83F0;
}

_UNKNOWN **sub_238085A78()
{
  return &off_2509DCE68;
}

uint64_t SoftwareReleasePolicy.init(release:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_238085A8C(a1, a2);
}

uint64_t sub_238085A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SoftwareReleasePolicy.release.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_238013570(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for Release);
}

uint64_t SoftwareReleasePolicy.release.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_238085AFC(a1, v1);
}

uint64_t sub_238085AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*SoftwareReleasePolicy.release.modify())()
{
  return nullsub_1;
}

uint64_t sub_238085B50()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C8440);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C8440);
  return sub_2380BD7FC();
}

uint64_t static SoftwareReleasePolicy.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2568C5058 != -1)
    swift_once();
  v2 = sub_2380BD808();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2568C8440);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t SoftwareReleasePolicy.evaluate(bundle:context:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = a1;
  v2[7] = v1;
  type metadata accessor for SoftwareReleasePolicy();
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  type metadata accessor for Proto_AttestationBundle(0);
  v2[10] = swift_task_alloc();
  type metadata accessor for AttestationBundle(0);
  v2[11] = swift_task_alloc();
  v2[12] = type metadata accessor for Release();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_238085D40()
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
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t (*v36)(void);
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[2];

  v1 = v0[16];
  v3 = v0[10];
  v2 = v0[11];
  sub_238013570(v0[6], v2, type metadata accessor for AttestationBundle);
  sub_238013570(v2, v3, type metadata accessor for Proto_AttestationBundle);
  sub_23802AA78(v3, 0, v1);
  v4 = v0[16];
  v5 = v0[17];
  sub_237FFD540(v0[11], type metadata accessor for AttestationBundle);
  sub_238085A8C(v4, v5);
  if (qword_2568C5058 != -1)
    swift_once();
  v7 = v0[8];
  v6 = v0[9];
  v8 = v0[7];
  v9 = sub_2380BD808();
  __swift_project_value_buffer(v9, (uint64_t)qword_2568C8440);
  sub_238013570(v8, v6, (uint64_t (*)(_QWORD))type metadata accessor for SoftwareReleasePolicy);
  sub_238013570(v8, v7, (uint64_t (*)(_QWORD))type metadata accessor for SoftwareReleasePolicy);
  v10 = sub_2380BD7F0();
  v11 = sub_2380BDF70();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = v0[9];
    v39 = v0[8];
    v13 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v42[0] = v40;
    *(_DWORD *)v13 = 136446466;
    sub_238024CC8();
    v14 = sub_2380BE1A4();
    v0[4] = sub_238013968(v14, v15, v42);
    sub_2380BDF94();
    swift_bridgeObjectRelease();
    sub_237FFD540(v12, (uint64_t (*)(_QWORD))type metadata accessor for SoftwareReleasePolicy);
    *(_WORD *)(v13 + 12) = 2082;
    Release.jsonString.getter();
    v0[5] = sub_238013968(v16, v17, v42);
    sub_2380BDF94();
    swift_bridgeObjectRelease();
    sub_237FFD540(v39, (uint64_t (*)(_QWORD))type metadata accessor for SoftwareReleasePolicy);
    _os_log_impl(&dword_237FF6000, v10, v11, "Local device is running %{public}s:\n%{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B82B830](v40, -1, -1);
    MEMORY[0x23B82B830](v13, -1, -1);
  }
  else
  {
    v18 = v0[8];
    sub_237FFD540(v0[9], (uint64_t (*)(_QWORD))type metadata accessor for SoftwareReleasePolicy);
    sub_237FFD540(v18, (uint64_t (*)(_QWORD))type metadata accessor for SoftwareReleasePolicy);
  }

  v19 = v0[17];
  v20 = v0[14];
  sub_238013570(v19, v0[15], (uint64_t (*)(_QWORD))type metadata accessor for Release);
  sub_238013570(v19, v20, (uint64_t (*)(_QWORD))type metadata accessor for Release);
  v21 = sub_2380BD7F0();
  v22 = sub_2380BDF70();
  v23 = os_log_type_enabled(v21, v22);
  v25 = v0[14];
  v24 = v0[15];
  if (v23)
  {
    v26 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v42[0] = v41;
    *(_DWORD *)v26 = 136446466;
    sub_238024CC8();
    v27 = sub_2380BE1A4();
    v0[2] = sub_238013968(v27, v28, v42);
    sub_2380BDF94();
    swift_bridgeObjectRelease();
    sub_237FFD540(v24, (uint64_t (*)(_QWORD))type metadata accessor for Release);
    *(_WORD *)(v26 + 12) = 2082;
    Release.jsonString.getter();
    v0[3] = sub_238013968(v29, v30, v42);
    sub_2380BDF94();
    swift_bridgeObjectRelease();
    sub_237FFD540(v25, (uint64_t (*)(_QWORD))type metadata accessor for Release);
    _os_log_impl(&dword_237FF6000, v21, v22, "Remote device is running %{public}s:\n%{public}s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B82B830](v41, -1, -1);
    MEMORY[0x23B82B830](v26, -1, -1);
  }
  else
  {
    sub_237FFD540(v0[15], (uint64_t (*)(_QWORD))type metadata accessor for Release);
    sub_237FFD540(v25, (uint64_t (*)(_QWORD))type metadata accessor for Release);
  }

  sub_238013570(v0[7], v0[13], (uint64_t (*)(_QWORD))type metadata accessor for Release);
  if ((sub_2380BDA48() & 1) != 0
    && (v31 = *(int *)(v0[12] + 20), (sub_23802B050(*(_QWORD *)(v0[17] + v31), *(_QWORD *)(v0[13] + v31)) & 1) != 0))
  {
    sub_237FFD540(v0[13], (uint64_t (*)(_QWORD))type metadata accessor for Release);
    v32 = sub_2380BD7F0();
    v33 = sub_2380BDF70();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_237FF6000, v32, v33, "Remote device is running same release as local device", v34, 2u);
      MEMORY[0x23B82B830](v34, -1, -1);
    }
    v35 = v0[17];

    sub_237FFD540(v35, (uint64_t (*)(_QWORD))type metadata accessor for Release);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v36 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v37 = v0[17];
    sub_237FFD540(v0[13], (uint64_t (*)(_QWORD))type metadata accessor for Release);
    sub_238086400();
    swift_allocError();
    swift_willThrow();
    sub_237FFD540(v37, (uint64_t (*)(_QWORD))type metadata accessor for Release);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v36 = (uint64_t (*)(void))v0[1];
  }
  return v36();
}

uint64_t type metadata accessor for SoftwareReleasePolicy()
{
  uint64_t result;

  result = qword_2568C84D0;
  if (!qword_2568C84D0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_238086400()
{
  unint64_t result;

  result = qword_2568C8460;
  if (!qword_2568C8460)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for SoftwareReleasePolicy.Error, &type metadata for SoftwareReleasePolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8460);
  }
  return result;
}

uint64_t sub_238086444(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_238013814;
  return SoftwareReleasePolicy.evaluate(bundle:context:)(a1);
}

uint64_t static SoftwareReleasePolicy.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t SoftwareReleasePolicy.Error.hash(into:)()
{
  return sub_2380BE240();
}

uint64_t SoftwareReleasePolicy.Error.hashValue.getter()
{
  sub_2380BE234();
  sub_2380BE240();
  return sub_2380BE264();
}

unint64_t sub_238086500()
{
  unint64_t result;

  result = qword_2568C8470;
  if (!qword_2568C8470)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for SoftwareReleasePolicy.Error, &type metadata for SoftwareReleasePolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8470);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SoftwareReleasePolicy(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for Release();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    v7 = sub_2380BDA60();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(v6 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v6 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SoftwareReleasePolicy(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2380BDA60();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for Release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SoftwareReleasePolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2380BDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = type metadata accessor for Release();
  *(_QWORD *)(a1 + *(int *)(v5 + 20)) = *(_QWORD *)(a2 + *(int *)(v5 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SoftwareReleasePolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2380BDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = type metadata accessor for Release();
  *(_QWORD *)(a1 + *(int *)(v5 + 20)) = *(_QWORD *)(a2 + *(int *)(v5 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SoftwareReleasePolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2380BDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = type metadata accessor for Release();
  *(_QWORD *)(a1 + *(int *)(v5 + 20)) = *(_QWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t assignWithTake for SoftwareReleasePolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2380BDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = type metadata accessor for Release();
  *(_QWORD *)(a1 + *(int *)(v5 + 20)) = *(_QWORD *)(a2 + *(int *)(v5 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SoftwareReleasePolicy()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380867A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SoftwareReleasePolicy()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380867F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Release();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_238086830()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Release();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SoftwareReleasePolicy.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2380868D8 + 4 * byte_2380C4530[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2380868F8 + 4 * byte_2380C4535[v4]))();
}

_BYTE *sub_2380868D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2380868F8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_238086900(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_238086908(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_238086910(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_238086918(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SoftwareReleasePolicy.Error()
{
  return &type metadata for SoftwareReleasePolicy.Error;
}

_QWORD *Image4Manifest.properties.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *result;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
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
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  _OWORD *v81;
  __int128 v82;
  __int128 v83;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v85;
  unint64_t v86;
  unint64_t v87;
  _OWORD *v88;
  __int128 v89;
  __int128 v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  void (*v94)(char *, uint64_t);
  _QWORD *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  __int128 *v113;
  char *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;

  v1 = sub_2380BDD48();
  MEMORY[0x24BDAC7A8](v1);
  v114 = (char *)&v92 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = _s8PropertyV5ValueOMa(0);
  v3 = MEMORY[0x24BDAC7A8](v104);
  v99 = (uint64_t)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v97 = (uint64_t)&v92 - v5;
  v6 = (_OWORD *)sub_2380BDB50();
  v112 = *((_QWORD *)v6 - 1);
  v113 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v111 = (uint64_t *)((char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8508);
  MEMORY[0x24BDAC7A8](v8);
  v98 = (uint64_t)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = type metadata accessor for Image4Manifest.Property(0);
  v108 = *(_QWORD *)(v120 - 8);
  v10 = MEMORY[0x24BDAC7A8](v120);
  v12 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v105 = (uint64_t)&v92 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v92 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v103 = (uint64_t)&v92 - v18;
  v101 = sub_2380BDA30();
  v100 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v102 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = type metadata accessor for Image4Manifest.Manifest(0);
  v20 = MEMORY[0x24BDAC7A8](v107);
  v106 = (uint64_t)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v92 - v22;
  v24 = sub_2380BDAFC();
  v109 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v92 - v28;
  v31 = *v0;
  v30 = v0[1];
  sub_237FFBA20(v31, v30);
  sub_23802FBC8(v31, v30);
  v32 = v31;
  v33 = v29;
  sub_237FFBAB0(v32, v30);
  v34 = v110;
  sub_2380BDC1C();
  result = (_QWORD *)swift_release();
  if (v34)
    return result;
  v36 = v100;
  v37 = v101;
  v96 = v23;
  (*(void (**)(char *, char *, uint64_t))(v109 + 16))(v27, v33, v24);
  v38 = v102;
  _s16CloudAttestation7ReleaseV17defaultIdentifier9SwiftASN10gE0VvgZ_0();
  sub_2380BDC34();
  v110 = 0;
  v94 = *(void (**)(char *, uint64_t))(v109 + 8);
  v94(v27, v24);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v37);
  v39 = (uint64_t)v96;
  sub_238001DE4(v106, (uint64_t)v96, type metadata accessor for Image4Manifest.Manifest);
  v40 = *(_QWORD *)(v39 + *(int *)(v107 + 24));
  v41 = (char *)v24;
  v42 = *(_QWORD *)(v40 + 16);
  v102 = v41;
  v101 = (uint64_t)v33;
  if (v42)
  {
    v43 = v40 + ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80));
    v44 = *(_QWORD *)(v108 + 72);
    v109 = v40;
    swift_bridgeObjectRetain();
    v45 = v111;
    while (1)
    {
      sub_238013570(v43, (uint64_t)v17, type metadata accessor for Image4Manifest.Property);
      sub_2380BDB2C();
      v46 = MEMORY[0x23B82A9CC](v17, v45);
      (*(void (**)(_QWORD *, __int128 *))(v112 + 8))(v45, v113);
      if ((v46 & 1) != 0)
        break;
      sub_237FFD540((uint64_t)v17, type metadata accessor for Image4Manifest.Property);
      v43 += v44;
      if (!--v42)
      {
        v47 = 1;
        v41 = v102;
        v33 = (char *)v101;
        goto LABEL_8;
      }
    }
    v48 = v98;
    sub_238001DE4((uint64_t)v17, v98, type metadata accessor for Image4Manifest.Property);
    v47 = 0;
    v41 = v102;
    v33 = (char *)v101;
  }
  else
  {
    swift_bridgeObjectRetain();
    v47 = 1;
LABEL_8:
    v48 = v98;
  }
  v49 = v108;
  v50 = v120;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v108 + 56))(v48, v47, 1, v120);
  v51 = v50;
  swift_bridgeObjectRelease();
  v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v48, 1, v50);
  v53 = v105;
  if (v52 == 1)
  {
    sub_238005240(v48, &qword_2568C8508);
    sub_2380BDB20();
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    swift_allocError();
    sub_2380BDB08();
    swift_willThrow();
    goto LABEL_36;
  }
  v54 = v51;
  v55 = v103;
  sub_238001DE4(v48, v103, type metadata accessor for Image4Manifest.Property);
  v56 = v55 + *(int *)(v54 + 20);
  v57 = v97;
  sub_238013570(v56, v97, _s8PropertyV5ValueOMa);
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    sub_237FFD540(v57, _s8PropertyV5ValueOMa);
    sub_2380BDB20();
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    swift_allocError();
    sub_2380BDB08();
    swift_willThrow();
    sub_237FFD540(v55, type metadata accessor for Image4Manifest.Property);
LABEL_36:
    sub_237FFD540((uint64_t)v96, type metadata accessor for Image4Manifest.Manifest);
    v91 = v33;
    return (_QWORD *)((uint64_t (*)(char *, char *))v94)(v91, v41);
  }
  result = *(_QWORD **)v57;
  v98 = *(_QWORD *)(*(_QWORD *)v57 + 16);
  if (v98)
  {
    v58 = 0;
    v59 = v108;
    v93 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    v97 = (uint64_t)result + v93;
    v113 = &v116;
    v111 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v95 = result;
    while (1)
    {
      if (v58 >= result[2])
      {
        __break(1u);
        goto LABEL_43;
      }
      v60 = *(_QWORD *)(v59 + 72);
      v107 = v58;
      v112 = v60;
      v61 = sub_238013570(v97 + v60 * v58, v53, type metadata accessor for Image4Manifest.Property);
      *(_QWORD *)&v115 = MEMORY[0x23B82A9D8](v61);
      *((_QWORD *)&v115 + 1) = v62;
      *(_QWORD *)&v116 = v63;
      *((_QWORD *)&v116 + 1) = v64;
      sub_2380BDD3C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5A28);
      sub_23800DD90();
      v109 = sub_2380BDD24();
      v66 = v65;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v66)
        goto LABEL_44;
      v67 = v99;
      sub_238013570(v53 + *(int *)(v120 + 20), v99, _s8PropertyV5ValueOMa);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_237FFD540(v67, _s8PropertyV5ValueOMa);
        *(_QWORD *)&v115 = 0;
        *((_QWORD *)&v115 + 1) = 0xE000000000000000;
        sub_2380BE048();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v115 = 0xD00000000000001ALL;
        *((_QWORD *)&v115 + 1) = 0x80000002380C9510;
        sub_2380BDD90();
        swift_bridgeObjectRelease();
        sub_2380BDB20();
        sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
        swift_allocError();
        sub_2380BDB08();
        swift_bridgeObjectRelease();
        swift_willThrow();
        sub_237FFD540(v105, type metadata accessor for Image4Manifest.Property);
        sub_237FFD540(v103, type metadata accessor for Image4Manifest.Property);
        sub_237FFD540((uint64_t)v96, type metadata accessor for Image4Manifest.Manifest);
        v91 = v33;
        return (_QWORD *)((uint64_t (*)(char *, char *))v94)(v91, v41);
      }
      v106 = v66;
      v68 = *(_QWORD *)v67;
      v69 = *(_QWORD *)(*(_QWORD *)v67 + 16);
      if (v69)
        break;
      swift_bridgeObjectRelease();
      v71 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_28:
      v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8510);
      *(_QWORD *)&v118 = v71;
      *(_QWORD *)&v115 = v109;
      *((_QWORD *)&v115 + 1) = v106;
      sub_23800ED10(&v118, v113);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v53 = v105;
      v59 = v108;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        v85 = v111;
      else
        v85 = sub_2380273E4(0, v111[2] + 1, 1, v111);
      v87 = v85[2];
      v86 = v85[3];
      if (v87 >= v86 >> 1)
        v85 = sub_2380273E4((_QWORD *)(v86 > 1), v87 + 1, 1, v85);
      v58 = v107 + 1;
      v85[2] = v87 + 1;
      v111 = v85;
      v88 = &v85[6 * v87];
      v89 = v115;
      v90 = v117;
      v88[3] = v116;
      v88[4] = v90;
      v88[2] = v89;
      sub_237FFD540(v53, type metadata accessor for Image4Manifest.Property);
      v55 = v103;
      result = v95;
      if (v58 == v98)
      {
        swift_bridgeObjectRelease();
        goto LABEL_41;
      }
    }
    v100 = *(_QWORD *)v67;
    v70 = v68 + v93;
    v71 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v72 = sub_238013570(v70, (uint64_t)v12, type metadata accessor for Image4Manifest.Property);
      *(_QWORD *)&v115 = MEMORY[0x23B82A9D8](v72);
      *((_QWORD *)&v115 + 1) = v73;
      *(_QWORD *)&v116 = v74;
      *((_QWORD *)&v116 + 1) = v75;
      sub_2380BDD3C();
      v76 = sub_2380BDD24();
      v78 = v77;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v78)
        break;
      sub_2380876D4();
      *(_QWORD *)&v115 = v76;
      *((_QWORD *)&v115 + 1) = v78;
      sub_23800ED10(&v118, v113);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v71 = sub_2380273F8(0, v71[2] + 1, 1, v71);
      v80 = v71[2];
      v79 = v71[3];
      if (v80 >= v79 >> 1)
        v71 = sub_2380273F8((_QWORD *)(v79 > 1), v80 + 1, 1, v71);
      v71[2] = v80 + 1;
      v81 = &v71[6 * v80];
      v82 = v115;
      v83 = v117;
      v81[3] = v116;
      v81[4] = v83;
      v81[2] = v82;
      sub_237FFD540((uint64_t)v12, type metadata accessor for Image4Manifest.Property);
      v70 += v112;
      if (!--v69)
      {
        swift_bridgeObjectRelease();
        v41 = v102;
        v33 = (char *)v101;
        goto LABEL_28;
      }
    }
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v111 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_41:
    sub_237FFD540(v55, type metadata accessor for Image4Manifest.Property);
    sub_237FFD540((uint64_t)v96, type metadata accessor for Image4Manifest.Manifest);
    v94(v33, (uint64_t)v41);
    return v111;
  }
  return result;
}

uint64_t Image4Manifest.Manifest.init(derEncoded:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_2380BDA30();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s16CloudAttestation7ReleaseV17defaultIdentifier9SwiftASN10gE0VvgZ_0();
  type metadata accessor for Image4Manifest.Manifest(0);
  sub_2380BDC34();
  v6 = sub_2380BDAFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t _s8PropertyV5ValueOMa(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C86B0);
}

uint64_t type metadata accessor for Image4Manifest.Property(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C8608);
}

uint64_t type metadata accessor for Image4Manifest.Manifest(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C8570);
}

void sub_2380876D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  char *v8;
  _BYTE v9[32];
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;

  v1 = sub_2380BDD48();
  MEMORY[0x24BDAC7A8](v1);
  v11 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for Image4Manifest.Property(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_2380BDA60();
  MEMORY[0x24BDAC7A8](v4);
  v5 = _s8PropertyV5ValueOMa(0);
  MEMORY[0x24BDAC7A8](v5);
  sub_238013570(v0, (uint64_t)&v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v7);
  v8 = (char *)&loc_238087808 + dword_238087B4C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_238087818()
{
  char *v0;
  uint64_t v1;
  char v2;

  v2 = *v0;
  *(_QWORD *)(v1 + 24) = MEMORY[0x24BEE1328];
  *(_BYTE *)v1 = v2;
}

uint64_t sub_238087B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v31 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B50);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v32 = (char *)&v26 - v6;
  v33 = sub_2380BDA30();
  v7 = *(_QWORD *)(v33 - 8);
  v8 = MEMORY[0x24BDAC7A8](v33);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_2380BDB50();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380BDB80();
  v34 = a1;
  v16 = v35;
  result = sub_2380BDB8C();
  if (!v16)
  {
    v29 = v7;
    v18 = v12;
    v19 = v33;
    v35 = v15;
    sub_2380BDB80();
    sub_2380BDB8C();
    v28 = v36;
    type metadata accessor for Image4Manifest.Property(0);
    sub_2380BD9C4();
    sub_238001820(&qword_2568C86F0, type metadata accessor for Image4Manifest.Property, (uint64_t)&protocol conformance descriptor for Image4Manifest.Property);
    v27 = sub_2380BDC04();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v19);
    v20 = sub_2380BDACC();
    v21 = (uint64_t)v32;
    sub_2380BDB5C();
    v22 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
    v22(v21, 0, 1, v20);
    v23 = (uint64_t)v30;
    sub_238005240(v21, &qword_2568C5B50);
    sub_2380BDB5C();
    v24 = v31;
    v25 = v35;
    v22(v23, 0, 1, v20);
    sub_238005240(v23, &qword_2568C5B50);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v24, v25, v18);
    result = type metadata accessor for Image4Manifest.Manifest(0);
    *(_QWORD *)(v24 + *(int *)(result + 20)) = v28;
    *(_QWORD *)(v24 + *(int *)(result + 24)) = v27;
  }
  return result;
}

uint64_t sub_238087F14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_2380BDA30();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s16CloudAttestation7ReleaseV17defaultIdentifier9SwiftASN10gE0VvgZ_0();
  sub_2380BDC34();
  v6 = sub_2380BDAFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_238087FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  char v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  _QWORD v64[2];
  uint64_t v65;
  uint64_t *v66;
  char *v67;
  _QWORD *v68;
  char *v69;
  char *v70;
  _BYTE *v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v75 = a2;
  v3 = sub_2380BDAFC();
  v77 = *(_QWORD *)(v3 - 8);
  v78 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v73 = (char *)v64 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v74 = (char *)v64 - v8;
  v9 = _s8PropertyV5ValueOMa(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v66 = (_QWORD *)((char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x24BDAC7A8](v10);
  v69 = (char *)v64 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v68 = (_QWORD *)((char *)v64 - v15);
  MEMORY[0x24BDAC7A8](v14);
  v71 = (char *)v64 - v16;
  v17 = sub_2380BDA30();
  v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BEB2F40];
  v19 = *(_QWORD *)(v17 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v67 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v72 = (char *)v64 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v64 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v64 - v28;
  v30 = a1;
  sub_2380BDAD8();
  sub_2380BD9D0();
  sub_238001820(&qword_2568C86E8, v18, MEMORY[0x24BEB2F48]);
  LOBYTE(a1) = sub_2380BDCE8();
  v31 = *(void (**)(char *, uint64_t))(v19 + 8);
  v31(v27, v17);
  if ((a1 & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v30, v78);
    v31(v29, v17);
    return swift_storeEnumTagMultiPayload();
  }
  v64[1] = v9;
  v65 = v30;
  sub_2380BD9DC();
  v33 = sub_2380BDCE8();
  v31(v27, v17);
  if ((v33 & 1) != 0)
  {
    v31(v29, v17);
    v35 = v77;
    v34 = v78;
    v36 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v74, v65, v78);
    sub_2380BDAD8();
    v37 = v76;
    v38 = sub_2380BDF04();
    if (v37)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v36, v34);
    }
    else
    {
      v52 = v38;
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v34);
      v53 = v52 & 1;
      v54 = (uint64_t)v71;
      *v71 = v53;
      swift_storeEnumTagMultiPayload();
      return sub_238001DE4(v54, v75, _s8PropertyV5ValueOMa);
    }
  }
  else
  {
    sub_2380BD9E8();
    v39 = sub_2380BDCE8();
    v31(v27, v17);
    if ((v39 & 1) == 0)
    {
      sub_2380BD9B8();
      v45 = sub_2380BDCE8();
      v31(v27, v17);
      v46 = v75;
      if ((v45 & 1) != 0)
      {
        v31(v29, v17);
        sub_2380BDA60();
        v48 = v77;
        v47 = v78;
        v49 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v70, v65, v78);
        v50 = v69;
        v51 = v76;
        sub_2380BDBA4();
        if (v51)
          return (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8))(v49, v47);
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v47);
        swift_storeEnumTagMultiPayload();
        v61 = (uint64_t)v50;
      }
      else
      {
        sub_2380BD9C4();
        v55 = sub_2380BDCE8();
        v31(v27, v17);
        v31(v29, v17);
        if ((v55 & 1) == 0)
        {
          sub_2380BDB20();
          sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
          swift_allocError();
          sub_2380BDB08();
          swift_willThrow();
          return (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v65, v78);
        }
        type metadata accessor for Image4Manifest.Property(0);
        v56 = v67;
        sub_2380BD9C4();
        sub_238001820(&qword_2568C86F0, type metadata accessor for Image4Manifest.Property, (uint64_t)&protocol conformance descriptor for Image4Manifest.Property);
        v57 = v65;
        v58 = v76;
        v59 = sub_2380BDC10();
        if (v58)
        {
          (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v57, v78);
          return ((uint64_t (*)(char *, uint64_t))v31)(v56, v17);
        }
        v62 = v59;
        (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v57, v78);
        v31(v56, v17);
        v63 = v66;
        *v66 = v62;
        swift_storeEnumTagMultiPayload();
        v61 = (uint64_t)v63;
      }
      return sub_238001DE4(v61, v46, _s8PropertyV5ValueOMa);
    }
    v31(v29, v17);
    v41 = v77;
    v40 = v78;
    v42 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v73, v65, v78);
    sub_2380BDAD8();
    sub_23808AC24();
    v43 = v76;
    sub_2380BDAC0();
    v44 = v75;
    if (v43)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v42, v40);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v40);
      v60 = (uint64_t)v68;
      *v68 = v79;
      swift_storeEnumTagMultiPayload();
      return sub_238001DE4(v60, v44, _s8PropertyV5ValueOMa);
    }
  }
}

uint64_t sub_2380886F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_238087FF0(a1, a2);
}

uint64_t Image4Manifest.Property.init(derEncoded:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  uint64_t v25;

  v24[0] = a2;
  v3 = sub_2380BDA00();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v24 - v8;
  v10 = sub_2380BDA30();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v24 - v15;
  v25 = a1;
  sub_2380BDAD8();
  sub_2380BDA18();
  v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v17(v16, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BEB2F18], v3);
  LOBYTE(a1) = sub_2380BD9F4();
  v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  v18(v7, v3);
  v18(v9, v3);
  if ((a1 & 1) != 0)
  {
    v19 = v25;
    sub_2380BDAD8();
    type metadata accessor for Image4Manifest.Property(0);
    sub_2380BDC34();
    v20 = sub_2380BDAFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
    return ((uint64_t (*)(char *, uint64_t))v17)(v14, v10);
  }
  else
  {
    v24[2] = 0;
    v24[3] = 0xE000000000000000;
    sub_2380BE048();
    sub_2380BDD90();
    v22 = v25;
    sub_2380BDAD8();
    sub_2380BDA18();
    v17(v16, v10);
    sub_2380BE0C0();
    v18(v9, v3);
    sub_2380BDB20();
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    swift_allocError();
    sub_2380BDB08();
    swift_bridgeObjectRelease();
    swift_willThrow();
    v23 = sub_2380BDAFC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);
  }
}

uint64_t sub_2380889FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v0 = sub_2380BDA30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5C28);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2380BDAFC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380BDA78();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_238005240((uint64_t)v6, &qword_2568C5C28);
    sub_2380BDB20();
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    swift_allocError();
    sub_2380BDB08();
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_2380BDAD8();
    type metadata accessor for Image4Manifest.Property(0);
    sub_2380BDC34();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_238088C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;

  v14 = a1;
  v2 = _s8PropertyV5ValueOMa(0);
  MEMORY[0x24BDAC7A8](v2);
  v15 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2380BDA30();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_2380BDB50();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380BDB80();
  result = sub_2380BDB8C();
  if (!v1)
  {
    v10 = v14;
    sub_238001820(&qword_2568C8700, _s8PropertyV5ValueOMa, (uint64_t)&unk_2380C46A8);
    v11 = (uint64_t)v15;
    sub_2380BDB5C();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v10, v8, v5);
    v12 = type metadata accessor for Image4Manifest.Property(0);
    return sub_238001DE4(v11, v10 + *(int *)(v12 + 20), _s8PropertyV5ValueOMa);
  }
  return result;
}

uint64_t sub_238088DE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return Image4Manifest.Property.init(derEncoded:)(a1, a2);
}

void *sub_238088DF4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_2380BDACC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5C38);
  v24 = v0;
  v5 = *v0;
  v6 = sub_2380BE0F0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v19 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v19, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v18;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v19, v4, v1);
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_238089014()
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;
  _OWORD v25[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5BF0);
  v2 = *v0;
  v3 = sub_2380BE0F0();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 32 * v15;
    v19 = *(_QWORD *)(v17 + 16);
    v18 = *(_QWORD *)(v17 + 24);
    v24 = *(_OWORD *)v17;
    sub_238016570(*(_QWORD *)(v2 + 56) + v16, (uint64_t)v25);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_OWORD *)v20 = v24;
    *(_QWORD *)(v20 + 16) = v19;
    *(_QWORD *)(v20 + 24) = v18;
    sub_23800ED10(v25, (_OWORD *)(*(_QWORD *)(v4 + 56) + v16));
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2380891F0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = type metadata accessor for SEP.SealedHash(0);
  v36 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_2380BD448();
  v3 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B98);
  v30 = v0;
  v5 = *v0;
  v6 = sub_2380BE0F0();
  v7 = *(_QWORD *)(v5 + 16);
  v38 = v6;
  if (!v7)
  {
    result = (void *)swift_release();
    v28 = v38;
    v27 = v30;
LABEL_25:
    *v27 = v28;
    return result;
  }
  v8 = v6;
  result = (void *)(v6 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    v8 = v38;
  }
  v11 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v37 = v5;
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v31 = v5 + 64;
  v32 = (unint64_t)(v12 + 63) >> 6;
  v16 = v33;
  v15 = v34;
  v17 = (uint64_t)v35;
  for (i = v38; ; result = (void *)sub_238001DE4(v17, *(_QWORD *)(i + 56) + v23, type metadata accessor for SEP.SealedHash))
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v11 << 6);
      v21 = v37;
      goto LABEL_9;
    }
    v24 = v11 + 1;
    v21 = v37;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32)
      goto LABEL_23;
    v25 = *(_QWORD *)(v31 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v32)
        goto LABEL_23;
      v25 = *(_QWORD *)(v31 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_22:
    v14 = (v25 - 1) & v25;
    v20 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_9:
    v22 = *(_QWORD *)(v3 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v16, *(_QWORD *)(v21 + 48) + v22, v15);
    v23 = *(_QWORD *)(v36 + 72) * v20;
    sub_238013570(*(_QWORD *)(v21 + 56) + v23, v17, type metadata accessor for SEP.SealedHash);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(i + 48) + v22, v16, v15);
  }
  v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    result = (void *)swift_release();
    v27 = v30;
    v28 = v38;
    goto LABEL_25;
  }
  v25 = *(_QWORD *)(v31 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v32)
      goto LABEL_23;
    v25 = *(_QWORD *)(v31 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2380894B8()
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
  _BYTE v26[32];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C62E0);
  v2 = *v0;
  v3 = sub_2380BE0F0();
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
    sub_238026DAC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23803081C((uint64_t)v26, *(_QWORD *)(v4 + 56) + v20);
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

void *sub_23808969C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_2380BD448();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5DA0);
  v24 = v0;
  v5 = *v0;
  v6 = sub_2380BE0F0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2380898CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = type metadata accessor for Proto_SealedHash(0);
  v29 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B88);
  v5 = *v0;
  v6 = sub_2380BE0F0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v26 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v27 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v28 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v23 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v28)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v23);
    ++v11;
    if (!v24)
    {
      v11 = v23 + 1;
      if (v23 + 1 >= v28)
        goto LABEL_26;
      v24 = *(_QWORD *)(v27 + 8 * v11);
      if (!v24)
        break;
    }
LABEL_25:
    v14 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v11 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v16);
    v19 = *v18;
    v20 = v18[1];
    v21 = *(_QWORD *)(v29 + 72) * v16;
    sub_238013570(*(_QWORD *)(v5 + 56) + v21, (uint64_t)v4, type metadata accessor for Proto_SealedHash);
    v22 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v17);
    *v22 = v19;
    v22[1] = v20;
    sub_238001DE4((uint64_t)v4, *(_QWORD *)(v7 + 56) + v21, type metadata accessor for Proto_SealedHash);
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v28)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_28;
  }
  v24 = *(_QWORD *)(v27 + 8 * v25);
  if (v24)
  {
    v11 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v11 >= v28)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v11);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_238089B10()
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
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5BD8);
  v2 = *v0;
  v3 = sub_2380BE0F0();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t *_s8ManifestVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2380BDB50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s8ManifestVwxx(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t _s8ManifestVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s8ManifestVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8ManifestVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t _s8ManifestVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8ManifestVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238089F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2380BDB50();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t _s8ManifestVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238089FE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2380BDB50();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_23808A058()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BDB50();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *_s8PropertyVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2380BDB50();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = _s8PropertyV5ValueOMa(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *v9 = *v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2)
    {
      v13 = sub_2380BDA60();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v9, v10, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s8PropertyVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  _s8PropertyV5ValueOMa(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3)
    return swift_bridgeObjectRelease();
  if ((_DWORD)result == 2)
  {
    v7 = sub_2380BDA60();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return result;
}

uint64_t _s8PropertyVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = _s8PropertyV5ValueOMa(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    *v8 = *v9;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2)
  {
    v12 = sub_2380BDA60();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  return a1;
}

uint64_t _s8PropertyVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (_QWORD *)(a1 + v7);
    v9 = (_QWORD *)(a2 + v7);
    sub_237FFD540(a1 + v7, _s8PropertyV5ValueOMa);
    v10 = _s8PropertyV5ValueOMa(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *v8 = *v9;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2)
    {
      v12 = sub_2380BDA60();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v8, v9, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s8PropertyVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = _s8PropertyV5ValueOMa(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v11 = sub_2380BDA60();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  return a1;
}

uint64_t _s8PropertyVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2380BDB50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_237FFD540(a1 + v7, _s8PropertyV5ValueOMa);
    v10 = _s8PropertyV5ValueOMa(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v11 = sub_2380BDA60();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s8PropertyVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23808A62C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_2380BDB50();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = _s8PropertyV5ValueOMa(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t _s8PropertyVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23808A6AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_2380BDB50();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = _s8PropertyV5ValueOMa(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23808A728()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2380BDB50();
  if (v1 <= 0x3F)
  {
    result = _s8PropertyV5ValueOMa(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23808A7AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2)
    {
      v8 = sub_2380BDA60();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
  }
  return a1;
}

uint64_t sub_23808A888(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 3)
    return swift_bridgeObjectRelease();
  if ((_DWORD)result == 2)
  {
    v3 = sub_2380BDA60();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

_QWORD *sub_23808A8EC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2)
  {
    v7 = sub_2380BDA60();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_23808A9A0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)a1, _s8PropertyV5ValueOMa);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2)
    {
      v7 = sub_2380BDA60();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *sub_23808AA6C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_2380BDA60();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_23808AAF8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)a1, _s8PropertyV5ValueOMa);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_2380BDA60();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23808AB9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BDA60();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_23808AC24()
{
  unint64_t result;

  result = qword_2568C86F8;
  if (!qword_2568C86F8)
  {
    result = MEMORY[0x23B82B770](MEMORY[0x24BEB3120], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2568C86F8);
  }
  return result;
}

uint64_t sub_23808AC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23808ACB0(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  uint64_t v3;
  char v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  _OWORD v24[2];
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v31 = a2;
  v5 = *((_BYTE *)v2 + 16);
  v29 = 0;
  v30 = 0xE000000000000000;
  v27 = *v2;
  LOBYTE(v28) = v5;
  result = (uint64_t)Image4Manifest.properties.getter();
  if (!v3)
  {
    v7 = result;
    v15 = *(_QWORD *)(result + 16);
    if (v15)
    {
      v8 = 0;
      v14 = result + 32;
      v13 = result;
      v17 = a1;
      while (v8 < *(_QWORD *)(v7 + 16))
      {
        sub_23808B234(v14 + 48 * v8, (uint64_t)&v27);
        v9 = v27;
        v25 = v27;
        sub_23800ED10(&v28, v26);
        v23 = v9;
        swift_bridgeObjectRetain_n();
        sub_2380BDD90();
        *(_QWORD *)&v23 = a1;
        *((_QWORD *)&v23 + 1) = v31;
        swift_bridgeObjectRetain();
        sub_2380BDD90();
        swift_bridgeObjectRelease();
        sub_2380BDD90();
        swift_bridgeObjectRelease();
        v23 = v9;
        sub_238016570((uint64_t)v26, (uint64_t)v24);
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8710);
        if (!swift_dynamicCast())
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_23808B27C();
          swift_allocError();
          *(_QWORD *)v12 = 0xD00000000000001ELL;
          *(_QWORD *)(v12 + 8) = 0x80000002380C95C0;
          *(_BYTE *)(v12 + 16) = 1;
          swift_willThrow();
          return sub_23808B2C0((uint64_t)&v25);
        }
        v10 = *(_QWORD *)(v21 + 16);
        if (v10)
        {
          v16 = v8;
          v11 = v21 + 32;
          do
          {
            sub_23808B234(v11, (uint64_t)&v23);
            v21 = v23;
            sub_23800ED10(v24, v22);
            sub_238016570((uint64_t)v22, (uint64_t)&v20);
            swift_bridgeObjectRetain();
            if (swift_dynamicCast())
            {
              swift_bridgeObjectRetain();
              sub_2380BDD90();
              sub_2380BDD90();
              sub_2380655C8(v18, v19);
              sub_2380BDD90();
              swift_bridgeObjectRelease();
              sub_2380BDD90();
              swift_bridgeObjectRetain();
              sub_2380BDD90();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_2380BDD90();
              swift_bridgeObjectRelease();
              sub_237FFBAB0(v18, v19);
            }
            else
            {
              swift_bridgeObjectRetain();
              sub_2380BDD90();
              sub_2380BDD90();
              swift_bridgeObjectRelease();
              sub_2380BDD90();
              sub_2380BE0C0();
              sub_2380BDD90();
              swift_bridgeObjectRetain();
              sub_2380BDD90();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_2380BDD90();
              swift_bridgeObjectRelease();
            }
            sub_23808B2C0((uint64_t)&v21);
            v11 += 48;
            --v10;
            a1 = v17;
          }
          while (v10);
          swift_bridgeObjectRelease();
          v7 = v13;
          v8 = v16;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        ++v8;
        result = sub_23808B2C0((uint64_t)&v25);
        if (v8 == v15)
        {
          swift_bridgeObjectRelease();
          return v29;
        }
      }
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t Image4Manifest.debugDescription.getter()
{
  return sub_23808ACB0(0, 0xE000000000000000);
}

uint64_t sub_23808B1C4()
{
  return sub_23808ACB0(0, 0xE000000000000000);
}

uint64_t sub_23808B234(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23808B27C()
{
  unint64_t result;

  result = qword_2568C8718;
  if (!qword_2568C8718)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for Image4Manifest.Error, &type metadata for Image4Manifest.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8718);
  }
  return result;
}

uint64_t sub_23808B2C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6178);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FusingPolicy.Constraint<>.init(BOOLeanLiteral:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  return result;
}

_BYTE *FusingPolicy.Constraints.init(productionStatus:securityMode:securityDomain:)@<X0>(_BYTE *result@<X0>, char *a2@<X1>, char *a3@<X2>, _BYTE *a4@<X8>)
{
  char v4;
  char v5;

  v4 = *a2;
  v5 = *a3;
  *a4 = *result;
  a4[1] = v4;
  a4[2] = v5;
  return result;
}

uint64_t FusingPolicy.init(matches:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 2);
  *(_WORD *)a2 = *(_WORD *)result;
  *(_BYTE *)(a2 + 2) = v2;
  *(_BYTE *)(a2 + 5) = 0;
  *(_WORD *)(a2 + 3) = 2;
  return result;
}

uint64_t sub_23808B344()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C9F78);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C9F78);
  return sub_2380BD7FC();
}

unsigned __int8 *FusingPolicy.init(_:is:)@<X0>(unsigned __int8 *result@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v3;
  unsigned __int8 v4;
  char v5;
  char v6;
  __int16 v7;

  v3 = *result;
  v4 = result[2];
  v5 = a2[1];
  v6 = a2[2];
  if (result[1])
    v7 = 256;
  else
    v7 = 0;
  *(_BYTE *)a3 = *a2;
  *(_BYTE *)(a3 + 1) = v5;
  *(_BYTE *)(a3 + 2) = v6;
  *(_BYTE *)(a3 + 5) = v4;
  *(_WORD *)(a3 + 3) = v7 | v3;
  return result;
}

unsigned __int8 *FusingPolicy.init(_:matches:)@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v3;
  unsigned __int8 v4;
  char v5;
  __int16 v6;

  v3 = *result;
  v4 = result[2];
  v5 = *(_BYTE *)(a2 + 2);
  if (result[1])
    v6 = 256;
  else
    v6 = 0;
  *(_WORD *)a3 = *(_WORD *)a2;
  *(_BYTE *)(a3 + 2) = v5;
  *(_BYTE *)(a3 + 5) = v4;
  *(_WORD *)(a3 + 3) = v6 | v3;
  return result;
}

_BYTE *FusingPolicy.init(is:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X8>)
{
  char v2;
  char v3;

  v2 = result[1];
  v3 = result[2];
  *(_BYTE *)a2 = *result;
  *(_BYTE *)(a2 + 1) = v2;
  *(_BYTE *)(a2 + 2) = v3;
  *(_BYTE *)(a2 + 5) = 0;
  *(_WORD *)(a2 + 3) = 2;
  return result;
}

uint64_t FusingPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v4;

  *(_QWORD *)(v3 + 16) = a2;
  *(_BYTE *)(v3 + 28) = *(_BYTE *)v2;
  *(_WORD *)(v3 + 29) = *(_WORD *)(v2 + 1);
  v4 = *(_WORD *)(v2 + 3);
  *(_BYTE *)(v3 + 26) = *(_BYTE *)(v2 + 5);
  *(_WORD *)(v3 + 24) = v4;
  return swift_task_switch();
}

uint64_t sub_23808B4E4()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = *(unsigned __int16 *)(v0 + 24);
  v2 = v1 | (*(unsigned __int8 *)(v0 + 26) << 16);
  if (v1 == 2)
  {
    v27 = **(_QWORD **)(v0 + 16);
    AttestationPolicyContext.validatedAttestation.getter((uint64_t)&v23);
    v3 = v24;
    if (v24 >> 60 == 15
      || (v5 = v25,
          v4 = v26,
          v6 = v23,
          v29 = 0,
          sub_238033F18(v23, v24, v25, v26),
          sub_23804E940(v6, v3, v5, v4),
          v28 == 2))
    {
      v7 = 2;
LABEL_19:
      sub_23808B8F0();
      swift_allocError();
      *(_WORD *)(v16 + 4) = WORD2(v7);
      *(_DWORD *)v16 = v7;
      swift_willThrow();
      v17 = *(uint64_t (**)(void))(v0 + 8);
      return v17();
    }
    v8 = v28 & 1;
    v9 = (v28 >> 8) & 1;
    v10 = v28 >> 16;
  }
  else
  {
    v8 = v1 & 1;
    LODWORD(v9) = (v2 >> 8) & 1;
    LODWORD(v10) = HIWORD(v2);
  }
  v11 = *(unsigned __int8 *)(v0 + 28);
  v12 = *(unsigned __int8 *)(v0 + 29);
  v13 = (_DWORD)v11 != 2 && v8 == ((v11 & 1) == 0);
  if (v13
    || (_DWORD)v12 != 2 && v9 == ((v12 & 1) == 0)
    || (v14 = *(unsigned __int8 *)(v0 + 30), v14 != 4) && v14 != v10)
  {
    v13 = (_DWORD)v9 == 0;
    v15 = 256;
    if (v13)
      v15 = 0;
    v7 = (v15 | v8) & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)v10 << 16) | (v11 << 24) | (v12 << 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 30) << 40);
    goto LABEL_19;
  }
  if (qword_2568C5060 != -1)
    swift_once();
  v19 = sub_2380BD808();
  __swift_project_value_buffer(v19, (uint64_t)qword_2568C9F78);
  v20 = sub_2380BD7F0();
  v21 = sub_2380BDF70();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_237FF6000, v20, v21, "AttestationBundle passed FusingPolicy: device has expected fuse bits", v22, 2u);
    MEMORY[0x23B82B830](v22, -1, -1);
  }

  v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

BOOL static FusingPolicy.Constraints.~= infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;
  int v5;

  v2 = *a1;
  v3 = a1[2];
  if (v2 != 2 && ((((v2 & 1) == 0) ^ *a2) & 1) == 0)
    return 0;
  v5 = a1[1];
  if (v5 != 2 && ((a2[1] ^ ((v5 & 1) == 0)) & 1) == 0)
    return 0;
  return v3 == 4 || a2[2] == v3;
}

uint64_t sub_23808B7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int16 v6;

  v5 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)v5 = v3;
  *(_QWORD *)(v5 + 8) = sub_238013814;
  *(_QWORD *)(v5 + 16) = a2;
  *(_BYTE *)(v5 + 28) = *(_BYTE *)v2;
  *(_WORD *)(v5 + 29) = *(_WORD *)(v2 + 1);
  v6 = *(_WORD *)(v2 + 3);
  *(_BYTE *)(v5 + 26) = *(_BYTE *)(v2 + 5);
  *(_WORD *)(v5 + 24) = v6;
  return swift_task_switch();
}

void FusingPolicy.Constraints.productionStatus.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void FusingPolicy.Constraints.securityMode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

void FusingPolicy.Constraints.securityDomain.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 2);
}

BOOL FusingPolicy.Constraints.matches(_:)(unsigned __int8 *a1)
{
  unsigned __int8 *v1;
  int v2;
  int v3;
  int v5;

  v2 = *v1;
  v3 = v1[2];
  if (v2 != 2 && ((*a1 ^ ((v2 & 1) == 0)) & 1) == 0)
    return 0;
  v5 = v1[1];
  if (v5 != 2 && ((a1[1] ^ ((v5 & 1) == 0)) & 1) == 0)
    return 0;
  return v3 == 4 || a1[2] == v3;
}

unint64_t sub_23808B8F0()
{
  unint64_t result;

  result = qword_2568C8728;
  if (!qword_2568C8728)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for FusingPolicy.Error, &type metadata for FusingPolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8728);
  }
  return result;
}

uint64_t static FusingPolicy.Constraint.~= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = type metadata accessor for FusingPolicy.Constraint(0, a3, a4, a4);
  return FusingPolicy.Constraint.matches(_:)(a2, v5) & 1;
}

uint64_t FusingPolicy.Constraint.matches(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v11, a2);
  v12 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
    v12 = sub_2380BDCE8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return v12 & 1;
}

uint64_t type metadata accessor for FusingPolicy.Constraint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FusingPolicy.Constraint);
}

uint64_t sub_23808BA90()
{
  return MEMORY[0x24BEE1358];
}

uint64_t __swift_memcpy6_1(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceModePolicy(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[6])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceModePolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 6) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 6) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FusingPolicy()
{
  return &type metadata for FusingPolicy;
}

uint64_t getEnumTagSinglePayload for FusingPolicy.Constraints(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  unsigned int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE)
  {
    if ((a2 + 33554178) >> 24)
    {
      v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
    }
    else
    {
      v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
    }
  }
  v4 = *(unsigned __int8 *)a1;
  if (v4 >= 2)
    v5 = ((v4 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v5 = -2;
  if (v5 < 0)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FusingPolicy.Constraints(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;

  if ((a3 + 33554178) >> 24)
    v3 = 1;
  else
    v3 = 2;
  if (a3 <= 0xFD)
    v3 = 0;
  if (a2 > 0xFD)
  {
    *(_WORD *)result = a2 - 254;
    *(_BYTE *)(result + 2) = (a2 - 254) >> 16;
    if (v3)
    {
      v4 = ((a2 - 254) >> 24) + 1;
      if (v3 == 2)
        *(_WORD *)(result + 3) = v4;
      else
        *(_BYTE *)(result + 3) = v4;
    }
  }
  else
  {
    if (!v3)
      goto LABEL_10;
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2)
        return result;
LABEL_16:
      *(_BYTE *)result = a2 + 2;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_16;
  }
  return result;
}

ValueMetadata *type metadata accessor for FusingPolicy.Constraints()
{
  return &type metadata for FusingPolicy.Constraints;
}

uint64_t sub_23808BC8C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_23808BCE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_23808BDBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_23808BE18(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_23808BEB0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *sub_23808BF90(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_23808C028(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t sub_23808C108(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_23808C248(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_23808C3F0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_23808C3F8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_23808C41C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t sub_23808C430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

uint64_t getEnumTagSinglePayload for FusingPolicy.Error(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[6])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  if (v5 + 1 >= 2)
    return v5;
  else
    return 0;
}

uint64_t sub_23808C498(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
  }
  else if (a2)
  {
    *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for FusingPolicy.Error()
{
  return &type metadata for FusingPolicy.Error;
}

uint64_t getEnumTagSinglePayload for DeviceModePolicy.ModeLoader(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 >= 0xFE)
  {
    v2 = (a2 + 16776962) >> 24 == 255 ? 2 : 1;
    v3 = (a2 + 16776962) >> 24 ? v2 : 0;
    if (v3)
    {
      if (v3 == 2)
      {
        v4 = *(unsigned __int16 *)((char *)a1 + 3);
        if (*(unsigned __int16 *)((char *)a1 + 3))
          return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v4 << 24)) - 16776962;
      }
      else
      {
        v4 = *((unsigned __int8 *)a1 + 3);
        if (*((_BYTE *)a1 + 3))
          return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v4 << 24)) - 16776962;
      }
    }
  }
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  if (v8 + 1 >= 2)
    return v8;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DeviceModePolicy.ModeLoader(uint64_t result, unsigned int a2, unsigned int a3)
{
  int v3;
  int v4;
  unsigned int v5;

  if ((a3 + 16776962) >> 24 == 255)
    v3 = 2;
  else
    v3 = 1;
  if ((a3 + 16776962) >> 24)
    v4 = v3;
  else
    v4 = 0;
  if (a3 < 0xFE)
    v4 = 0;
  if (a2 > 0xFD)
  {
    *(_WORD *)result = a2 - 254;
    *(_BYTE *)(result + 2) = (a2 - 254) >> 16;
    if (v4)
    {
      v5 = ((a2 - 254) >> 24) + 1;
      if (v4 == 2)
        *(_WORD *)(result + 3) = v5;
      else
        *(_BYTE *)(result + 3) = v5;
    }
  }
  else
  {
    if (!v4)
      goto LABEL_13;
    if (v4 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_13:
      if (!a2)
        return result;
LABEL_19:
      *(_BYTE *)result = a2 + 2;
      return result;
    }
    *(_BYTE *)(result + 3) = 0;
    if (a2)
      goto LABEL_19;
  }
  return result;
}

uint64_t sub_23808C5F8(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

uint64_t sub_23808C614(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)result = a2 - 255;
    *(_BYTE *)(result + 2) = (a2 - 255) >> 16;
  }
  else if (a2)
  {
    *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for FusingPolicy.FusingLoader()
{
  return &type metadata for FusingPolicy.FusingLoader;
}

uint64_t static PolicyBuilder.buildExpression<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t static PolicyBuilder.buildBlock<each A>(_:)@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata;
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
  char *v23;
  uint64_t v24;
  char *v25;
  int *v26;
  char **v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v37 = a3;
  v38 = a4;
  v6 = a1;
  v36 = a5;
  v7 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  v8 = 8 * a2;
  if (a2 == 1)
  {
    TupleTypeMetadata = *v7;
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v10 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      v11 = 0;
      if (a2 < 4)
        goto LABEL_9;
      if ((unint64_t)(v10 - (char *)v7) < 0x20)
        goto LABEL_9;
      v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v7 + 2);
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
        v19 = &v7[v17];
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
  }
  v21 = MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v23 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v26 = (int *)(v24 + 32);
    v27 = (char **)((char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v28 = a2;
    do
    {
      if (a2 == 1)
        v29 = 0;
      else
        v29 = *v26;
      v31 = *v7++;
      v30 = v31;
      v32 = &v23[v29];
      v33 = *v6++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v32, v33);
      *v27++ = v32;
      v26 += 4;
      --v28;
    }
    while (v28);
  }
  return PolicyBuilder.TuplePolicy.init(policies:)((uint64_t)v25, a2, v37, v38, v36);
}

void static PolicyBuilder.buildEither<A, B>(first:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1, a2);
  type metadata accessor for PolicyBuilder.ConditionalPolicy();
}

uint64_t sub_23808C898()
{
  return swift_storeEnumTagMultiPayload();
}

void static PolicyBuilder.buildEither<A, B>(second:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
  type metadata accessor for PolicyBuilder.ConditionalPolicy();
}

uint64_t sub_23808C914()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t static PolicyBuilder.buildOptional<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_2380BDF7C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v9 - v6, a1, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
}

uint64_t static PolicyBuilder.buildExpression(_:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t PolicyBuilder.TuplePolicy.init(policies:)@<X0>(uint64_t TupleTypeMetadata@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  __int128 *v14;
  _OWORD *v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  int *v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;

  v8 = (uint64_t *)TupleTypeMetadata;
  v39 = a5;
  v9 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    v10 = *v9;
  }
  else
  {
    MEMORY[0x24BDAC7A8](TupleTypeMetadata);
    v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      v13 = 0;
      if (a2 < 4)
        goto LABEL_9;
      if ((unint64_t)(v12 - (char *)v9) < 0x20)
        goto LABEL_9;
      v13 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      v14 = (__int128 *)(v9 + 2);
      v15 = v12 + 16;
      v16 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v17 = *v14;
        *(v15 - 1) = *(v14 - 1);
        *v15 = v17;
        v14 += 2;
        v15 += 2;
        v16 -= 4;
      }
      while (v16);
      if (v13 != a2)
      {
LABEL_9:
        v18 = a2 - v13;
        v19 = v13;
        v20 = &v12[8 * v13];
        v21 = &v9[v19];
        do
        {
          v22 = *v21++;
          *(_QWORD *)v20 = v22;
          v20 += 8;
          --v18;
        }
        while (v18);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    v10 = TupleTypeMetadata;
  }
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = type metadata accessor for PolicyBuilder.TuplePolicy(0, a2, a3, a4);
  v38 = &v36;
  v26 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v28 = (char *)&v36 - v27;
  if (a2)
  {
    v29 = (int *)(v10 + 32);
    v30 = a2;
    do
    {
      if (a2 == 1)
        v31 = 0;
      else
        v31 = *v29;
      v33 = *v9++;
      v32 = v33;
      v34 = *v8++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(&v25[v31], v34);
      v29 += 4;
      --v30;
    }
    while (v30);
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v28, v25, v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v39, v28, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v25, v10);
}

void type metadata accessor for PolicyBuilder.ConditionalPolicy()
{
  JUMPOUT(0x23B82B6ECLL);
}

uint64_t PolicyBuilder.OptionalPolicy.init(policy:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_2380BDF7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

CloudAttestation::PolicyBuilder::BooleanPolicy __swiftcall PolicyBuilder.BooleanPolicy.init(result:)(CloudAttestation::PolicyBuilder::BooleanPolicy result)
{
  CloudAttestation::PolicyBuilder::BooleanPolicy *v1;

  v1->result = result.result;
  return result;
}

uint64_t type metadata accessor for PolicyBuilder.TuplePolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PolicyBuilder.TuplePolicy);
}

uint64_t static PolicyBuilder.build<A>(_:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t static PolicyBuilder.closure<each A, B>(_:)(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t PolicyBuilder.TuplePolicy.policies.getter@<X0>(uint64_t TupleTypeMetadata@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  char *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t *v25;
  int *v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v3 = v2;
  v4 = TupleTypeMetadata;
  v6 = *(_QWORD *)(TupleTypeMetadata + 16);
  if (v6 == 1)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(TupleTypeMetadata + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](TupleTypeMetadata);
    v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v4 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
    v7 = TupleTypeMetadata;
  }
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 16))(v22, v3, v7);
  if (v6)
  {
    v25 = (uint64_t *)(*(_QWORD *)(v4 + 24) & 0xFFFFFFFFFFFFFFFELL);
    v26 = (int *)(v7 + 32);
    v27 = v6;
    do
    {
      if (v6 == 1)
        v28 = 0;
      else
        v28 = *v26;
      v30 = *v25++;
      v29 = v30;
      v31 = *a2++;
      result = (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(v29 - 8) + 32))(v31, &v22[v28]);
      v26 += 4;
      --v27;
    }
    while (v27);
  }
  return result;
}

uint64_t PolicyBuilder.TuplePolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t v6;
  uint64_t TupleTypeMetadata;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v6 = *(_QWORD *)(a3 + 16);
  v4[6] = v6;
  if (v6 == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
    v8 = 16;
  }
  else
  {
    v8 = (8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    v9 = swift_task_alloc();
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if (v9 - v11 < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = (_OWORD *)(v9 + 16);
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = (_QWORD *)(v9 + 8 * v10);
        v19 = (uint64_t *)(v11 + v17);
        do
        {
          v20 = *v19++;
          *v18++ = v20;
          --v16;
        }
        while (v16);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    swift_task_dealloc();
  }
  v4[7] = v8;
  v4[8] = TupleTypeMetadata;
  v4[9] = *(_QWORD *)(TupleTypeMetadata - 8);
  v4[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23808CF78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v2 = (uint64_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v2;
  if (v1)
  {
    v3 = 0;
    v4 = 32;
    do
    {
      v6 = *(_QWORD *)(v0 + 48);
      if (v6 == 1)
        v5 = 0;
      else
        v5 = *(_DWORD *)(*(_QWORD *)(v0 + 64) + v4);
      v2[v3++] = *(_QWORD *)(v0 + 80) + v5;
      v4 += 16;
    }
    while (v3 != v6);
    v7 = *(_QWORD *)(v0 + 32);
    PolicyBuilder.TuplePolicy.policies.getter(v7, v2);
    v8 = *(_QWORD *)(v7 + 24);
    *(_QWORD *)(v0 + 96) = v8;
    v8 &= 0xFFFFFFFFFFFFFEuLL;
    v9 = *(_QWORD *)(v7 + 32);
    *(_QWORD *)(v0 + 104) = v9;
    *(_QWORD *)(v0 + 112) = 0;
    v10 = *(_QWORD *)v8;
    *(_QWORD *)(v0 + 120) = *(_QWORD *)v8;
    v11 = *(_QWORD *)(v9 & 0xFFFFFFFFFFFFFELL);
    v12 = *(_QWORD *)(v10 - 8);
    *(_QWORD *)(v0 + 128) = v12;
    *(_QWORD *)(v0 + 136) = swift_task_alloc();
    (*(void (**)(void))(v12 + 16))();
    v15 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v11 + 8) + *(_QWORD *)(v11 + 8));
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v13;
    *v13 = v0;
    v13[1] = sub_23808D11C;
    return v15(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v10, v11);
  }
  else
  {
    PolicyBuilder.TuplePolicy.policies.getter(*(_QWORD *)(v0 + 32), v2);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23808D11C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[16] + 8))(v2[17], v2[15]);
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23808D1A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 112) + 1;
  if (v1 == *(_QWORD *)(v0 + 48))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 112) = v1;
    v3 = *(_QWORD *)(v0 + 104) & 0xFFFFFFFFFFFFFELL;
    v4 = *(_QWORD *)((*(_QWORD *)(v0 + 96) & 0xFFFFFFFFFFFFFELL) + 8 * v1);
    *(_QWORD *)(v0 + 120) = v4;
    v5 = *(_QWORD *)(v3 + 8 * v1);
    v6 = *(_QWORD *)(v4 - 8);
    *(_QWORD *)(v0 + 128) = v6;
    *(_QWORD *)(v0 + 136) = swift_task_alloc();
    (*(void (**)(void))(v6 + 16))();
    v8 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v5 + 8) + *(_QWORD *)(v5 + 8));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v7;
    *v7 = v0;
    v7[1] = sub_23808D11C;
    return v8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v4, v5);
  }
}

uint64_t sub_23808D2E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808D34C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2380165B0;
  return PolicyBuilder.TuplePolicy.evaluate(bundle:context:)(a1, a2, a3);
}

uint64_t PolicyBuilder.EmptyPolicy.evaluate(bundle:context:)()
{
  uint64_t v0;

  return sub_238065C04(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t PolicyBuilder.BooleanPolicy.result.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PolicyBuilder.BooleanPolicy.evaluate(bundle:context:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23808D3E0()
{
  uint64_t v0;

  if (**(_BYTE **)(v0 + 16) != 1)
  {
    sub_23808D454();
    swift_allocError();
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23808D454()
{
  unint64_t result;

  result = qword_2568C87D0;
  if (!qword_2568C87D0)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for PolicyBuilder.Error, &type metadata for PolicyBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_2568C87D0);
  }
  return result;
}

uint64_t sub_23808D498()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t PolicyBuilder.OptionalPolicy.policy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2380BDF7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t PolicyBuilder.OptionalPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = *(_QWORD *)(a3 + 16);
  v4[6] = v5;
  v6 = sub_2380BDF7C();
  v4[7] = v6;
  v4[8] = *(_QWORD *)(v6 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = *(_QWORD *)(v5 - 8);
  v4[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23808D578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)(_QWORD, _QWORD, _QWORD, uint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = sub_2380BDF7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v1, v4, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 32);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 32))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 48));
    v8 = *(_QWORD *)(v7 + 24);
    v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t))(**(int **)(v8 + 8) + *(_QWORD *)(v8 + 8));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v9;
    *v9 = v0;
    v9[1] = sub_23808D698;
    return v10(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 48), v8);
  }
}

uint64_t sub_23808D698()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23808D6FC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808D750()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808D7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2380165B0;
  return PolicyBuilder.OptionalPolicy.evaluate(bundle:context:)(a1, a2, a3);
}

uint64_t PolicyBuilder.ConditionalPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v6 = *(_QWORD *)(a3 + 24);
  v4[6] = v6;
  v4[7] = *(_QWORD *)(v6 - 8);
  v4[8] = swift_task_alloc();
  v7 = *(_QWORD *)(a3 + 16);
  v4[9] = v7;
  v4[10] = *(_QWORD *)(v7 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = *(_QWORD *)(a3 - 8);
  v4[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23808D8AC()
{
  _QWORD *v0;
  int EnumCaseMultiPayload;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD, _QWORD, uint64_t, uint64_t);

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[12] + 16))(v0[13], v0[5], v0[4]);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v6 = v0[4];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[7] + 32))(v0[8], v0[13], v0[6]);
    v3 = *(_QWORD *)(v6 + 40);
    v9 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
    v7 = (_QWORD *)swift_task_alloc();
    v0[16] = v7;
    *v7 = v0;
    v7[1] = sub_23808DAD8;
    v5 = v0[6];
    return v9(v0[2], v0[3], v5, v3);
  }
  if (!EnumCaseMultiPayload)
  {
    v2 = v0[4];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[10] + 32))(v0[11], v0[13], v0[9]);
    v3 = *(_QWORD *)(v2 + 32);
    v9 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
    v4 = (_QWORD *)swift_task_alloc();
    v0[14] = v4;
    *v4 = v0;
    v4[1] = sub_23808DA10;
    v5 = v0[9];
    return v9(v0[2], v0[3], v5, v3);
  }
  return sub_2380BE0D8();
}

uint64_t sub_23808DA10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23808DA74()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808DAD8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23808DB3C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808DBA4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808DC08()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23808DC70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_238013814;
  return PolicyBuilder.ConditionalPolicy.evaluate(bundle:context:)(a1, a2, a3);
}

uint64_t static PolicyBuilder.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t PolicyBuilder.Error.hash(into:)()
{
  return sub_2380BE240();
}

uint64_t PolicyBuilder.Error.hashValue.getter()
{
  sub_2380BE234();
  sub_2380BE240();
  return sub_2380BE264();
}

unint64_t sub_23808DD44()
{
  unint64_t result;

  result = qword_2568C8810[0];
  if (!qword_2568C8810[0])
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for PolicyBuilder.Error, &type metadata for PolicyBuilder.Error);
    atomic_store(result, qword_2568C8810);
  }
  return result;
}

ValueMetadata *type metadata accessor for PolicyBuilder()
{
  return &type metadata for PolicyBuilder;
}

uint64_t sub_23808DD98(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  __int128 *v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v19[2];

  if (*(_QWORD *)(a1 + 16) == 1)
  {
    result = swift_checkMetadataState();
    if (v3 > 0x3F)
      return result;
LABEL_13:
    v19[1] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata();
    return 0;
  }
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4)
  {
    v7 = 0;
    v8 = *(_QWORD *)(a1 + 24) & 0xFFFFFFFFFFFFFFFELL;
    if (v4 < 4)
      goto LABEL_10;
    if ((unint64_t)&v6[-v8] < 0x20)
      goto LABEL_10;
    v7 = v4 & 0xFFFFFFFFFFFFFFFCLL;
    v9 = (__int128 *)(v8 + 16);
    v10 = v6 + 16;
    v11 = v4 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v12 = *v9;
      *(v10 - 1) = *(v9 - 1);
      *v10 = v12;
      v9 += 2;
      v10 += 2;
      v11 -= 4;
    }
    while (v11);
    if (v4 != v7)
    {
LABEL_10:
      v13 = v4 - v7;
      v14 = 8 * v7;
      v15 = &v6[8 * v7];
      v16 = (uint64_t *)(v8 + v14);
      do
      {
        v17 = *v16++;
        *(_QWORD *)v15 = v17;
        v15 += 8;
        --v13;
      }
      while (v13);
    }
  }
  result = swift_getTupleTypeMetadata();
  if (v18 <= 0x3F)
    goto LABEL_13;
  return result;
}

uint64_t sub_23808DED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TupleTypeMetadata;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  uint64_t v22;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
  }
  return (**(uint64_t (***)(uint64_t, uint64_t))(TupleTypeMetadata - 8))(a1, a2);
}

uint64_t sub_23808DFEC(uint64_t a1, uint64_t a2)
{
  uint64_t TupleTypeMetadata;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  __int128 *v10;
  _OWORD *v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;

  if (*(_QWORD *)(a2 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a2 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4)
    {
      v8 = 0;
      v9 = *(_QWORD *)(v5 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v4 < 4)
        goto LABEL_9;
      if ((unint64_t)&v7[-v9] < 0x20)
        goto LABEL_9;
      v8 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      v10 = (__int128 *)(v9 + 16);
      v11 = v7 + 16;
      v12 = v4 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v4 != v8)
      {
LABEL_9:
        v14 = v4 - v8;
        v15 = 8 * v8;
        v16 = &v7[8 * v8];
        v17 = (uint64_t *)(v9 + v15);
        do
        {
          v18 = *v17++;
          *(_QWORD *)v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 8))(a1);
}

uint64_t sub_23808E0F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TupleTypeMetadata;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  uint64_t v22;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 16))(a1, a2);
  return a1;
}

uint64_t sub_23808E210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TupleTypeMetadata;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  uint64_t v22;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 24))(a1, a2);
  return a1;
}

uint64_t sub_23808E32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TupleTypeMetadata;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  uint64_t v22;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 32))(a1, a2);
  return a1;
}

uint64_t sub_23808E448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TupleTypeMetadata;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  uint64_t v22;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 40))(a1, a2);
  return a1;
}

uint64_t sub_23808E564()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23808E570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t TupleTypeMetadata;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
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
  uint64_t v22;

  if (*(_QWORD *)(a3 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a3 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v6)
    {
      v10 = 0;
      v11 = *(_QWORD *)(v7 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v6 < 4)
        goto LABEL_9;
      if ((unint64_t)&v9[-v11] < 0x20)
        goto LABEL_9;
      v10 = v6 & 0xFFFFFFFFFFFFFFFCLL;
      v12 = (__int128 *)(v11 + 16);
      v13 = v9 + 16;
      v14 = v6 & 0xFFFFFFFFFFFFFFFCLL;
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
      if (v6 != v10)
      {
LABEL_9:
        v16 = v6 - v10;
        v17 = 8 * v10;
        v18 = &v9[8 * v10];
        v19 = (uint64_t *)(v11 + v17);
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
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 48))(a1, a2);
}

uint64_t sub_23808E688()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23808E694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t TupleTypeMetadata;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  __int128 *v13;
  _OWORD *v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v23;

  if (*(_QWORD *)(a4 + 16) == 1)
  {
    TupleTypeMetadata = *(_QWORD *)(*(_QWORD *)(a4 + 24) & 0xFFFFFFFFFFFFFELL);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v7)
    {
      v11 = 0;
      v12 = *(_QWORD *)(v8 + 24) & 0xFFFFFFFFFFFFFFFELL;
      if (v7 < 4)
        goto LABEL_9;
      if ((unint64_t)&v10[-v12] < 0x20)
        goto LABEL_9;
      v11 = v7 & 0xFFFFFFFFFFFFFFFCLL;
      v13 = (__int128 *)(v12 + 16);
      v14 = v10 + 16;
      v15 = v7 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v16 = *v13;
        *(v14 - 1) = *(v13 - 1);
        *v14 = v16;
        v13 += 2;
        v14 += 2;
        v15 -= 4;
      }
      while (v15);
      if (v7 != v11)
      {
LABEL_9:
        v17 = v7 - v11;
        v18 = 8 * v11;
        v19 = &v10[8 * v11];
        v20 = (uint64_t *)(v12 + v18);
        do
        {
          v21 = *v20++;
          *(_QWORD *)v19 = v21;
          v19 += 8;
          --v17;
        }
        while (v17);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata - 8) + 56))(a1, a2, a2);
}

ValueMetadata *type metadata accessor for PolicyBuilder.EmptyPolicy()
{
  return &type metadata for PolicyBuilder.EmptyPolicy;
}

uint64_t storeEnumTagSinglePayload for PolicyBuilder.BooleanPolicy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23808E808 + 4 * byte_2380C4815[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23808E83C + 4 * asc_2380C4810[v4]))();
}

uint64_t sub_23808E83C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23808E844(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23808E84CLL);
  return result;
}

uint64_t sub_23808E858(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23808E860);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23808E864(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23808E86C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PolicyBuilder.BooleanPolicy()
{
  return &type metadata for PolicyBuilder.BooleanPolicy;
}

uint64_t sub_23808E888()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BDF7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23808E8F4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_23808EA34(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_23808EBDC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_23808EBE4()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t type metadata accessor for PolicyBuilder.OptionalPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PolicyBuilder.OptionalPolicy);
}

uint64_t sub_23808EC14()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23808EC1C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_23808ECA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  v7 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80));
  if (v7 <= 7
    && (unint64_t)(v6 + 1) <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) == 0)
  {
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 >= 2)
    {
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X15 }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t *))(v5 + 16))(a1);
      *((_BYTE *)v3 + v6) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v6) = 0;
    }
  }
  else
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v3;
}

uint64_t sub_23808EDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v2 - 8);
  if (*(_QWORD *)(v5 + 64) > v4)
    v4 = *(_QWORD *)(v5 + 64);
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (v6 < 2)
  {
    if (v6 == 1)
      v3 = *(_QWORD *)(v2 - 8);
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    if (v4 <= 3)
      v7 = v4;
    else
      v7 = 4;
    return ((uint64_t (*)(void))((char *)&loc_23808EE1C + 4 * byte_2380C482D[v7]))();
  }
}

uint64_t sub_23808EE70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v6 + 64) <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X16 }
  }
  v10 = v8 == 1;
  if (v8 == 1)
    v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t))(v5 + 16))(a1);
  *(_BYTE *)(a1 + v7) = v10;
  return a1;
}

uint64_t sub_23808EF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
      v12 = *(_QWORD *)(v6 - 8);
    else
      v12 = *(_QWORD *)(v5 - 8);
    if (v10 == 1)
      v13 = *(_QWORD *)(a3 + 24);
    else
      v13 = *(_QWORD *)(a3 + 16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v13);
    v14 = *(unsigned __int8 *)(a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = v14 == 1;
    if (v14 == 1)
      v17 = v8;
    else
      v17 = v7;
    if (v14 == 1)
      v18 = v6;
    else
      v18 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a1, a2, v18);
    *(_BYTE *)(a1 + v9) = v16;
  }
  return a1;
}

uint64_t sub_23808F0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v4 - 8);
  if (*(_QWORD *)(v6 + 64) <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X16 }
  }
  v10 = v8 == 1;
  if (v8 == 1)
    v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t))(v5 + 32))(a1);
  *(_BYTE *)(a1 + v7) = v10;
  return a1;
}

uint64_t sub_23808F194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(a3 + 24);
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
      v9 = *(_QWORD *)(v7 + 64);
    else
      v9 = *(_QWORD *)(v8 + 64);
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (v10 >= 2)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
      v12 = *(_QWORD *)(v6 - 8);
    else
      v12 = *(_QWORD *)(v5 - 8);
    if (v10 == 1)
      v13 = *(_QWORD *)(a3 + 24);
    else
      v13 = *(_QWORD *)(a3 + 16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v13);
    v14 = *(unsigned __int8 *)(a2 + v9);
    if (v14 >= 2)
    {
      if (v9 <= 3)
        v15 = v9;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = v14 == 1;
    if (v14 == 1)
      v17 = v8;
    else
      v17 = v7;
    if (v14 == 1)
      v18 = v6;
    else
      v18 = v5;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(a1, a2, v18);
    *(_BYTE *)(a1 + v9) = v16;
  }
  return a1;
}

uint64_t sub_23808F310(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (v3 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64))
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_23808F3D8 + 4 * byte_2380C4850[(v4 - 1)]))();
}

void sub_23808F424(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_23808F5D0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64);
  if (v2 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64))
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_23808F61C + 4 * byte_2380C485E[v3]))();
}

void sub_23808F664(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  if (a2 > 1)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16)
                                                                                              - 8)
                                                                                  + 64))
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
    else
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
    v6 = a2 - 2;
    if (v5 < 4)
    {
      v7 = v6 >> (8 * v5);
      v8 = v6 & ~(-1 << (8 * v5));
      a1[v5] = v7 + 2;
      bzero(a1, v5);
      if ((_DWORD)v5 == 3)
      {
        *(_WORD *)a1 = v8;
        a1[2] = BYTE2(v8);
      }
      else if ((_DWORD)v5 == 2)
      {
        *(_WORD *)a1 = v8;
      }
      else
      {
        *a1 = v8;
      }
    }
    else
    {
      a1[v5] = 2;
      bzero(a1, v5);
      *(_DWORD *)a1 = v6;
    }
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
    if (v4 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64))
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
    a1[v4] = a2;
  }
}

uint64_t storeEnumTagSinglePayload for PolicyBuilder.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23808F78C + 4 * byte_2380C4863[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23808F7AC + 4 * byte_2380C4868[v4]))();
}

_BYTE *sub_23808F78C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23808F7AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23808F7B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23808F7BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23808F7C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23808F7CC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PolicyBuilder.Error()
{
  return &type metadata for PolicyBuilder.Error;
}

uint64_t sub_23808F7E8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_23808F7F4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _BYTE *v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  unint64_t v63;
  __int128 v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedDataAccessor);
  *(_QWORD *)&v70 = 0;
  v6 = objc_msgSend(v5, sel_copyPathForPersonalizedData_error_, 2, &v70);

  v7 = (void *)v70;
  if (!v6)
  {
    v16 = (id)v70;
    v15 = sub_2380BD274();

    swift_willThrow();
    goto LABEL_5;
  }
  sub_2380BDD00();
  v8 = v7;

  v9 = sub_2380BD2C8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380BD28C();
  swift_bridgeObjectRelease();
  v13 = sub_2380BD2E0();
  v15 = v2;
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
LABEL_5:
    sub_238016780();
    swift_allocError();
    *(_QWORD *)v17 = v15;
    *(_QWORD *)(v17 + 8) = 0;
    *(_BYTE *)(v17 + 16) = 1;
    return swift_willThrow();
  }
  v19 = v13;
  v20 = v14;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (MEMORY[0x24BDE8390])
    v21 = MEMORY[0x24BDE8380] == 0;
  else
    v21 = 1;
  if (v21 || MEMORY[0x24BDE8398] == 0 || MEMORY[0x24BDE8388] == 0)
  {
    sub_238016780();
    swift_allocError();
    *(_QWORD *)v27 = 0;
    *(_QWORD *)(v27 + 8) = 0;
    *(_BYTE *)(v27 + 16) = 2;
    swift_willThrow();
    v28 = v19;
  }
  else
  {
    v66 = v19;
    sub_2380BD514();
    v24 = (void *)sub_2380BD508();
    v25 = sub_2380BD4FC();
    v26 = sub_238016FC8(v25);

    swift_bridgeObjectRelease();
    v63 = v20;
    if (qword_2568C4EA8 != -1)
      swift_once();
    v29 = sub_2380BD448();
    v30 = __swift_project_value_buffer(v29, (uint64_t)qword_2568C9B98);
    v31 = *(_QWORD *)(v29 - 8);
    MEMORY[0x24BDAC7A8](v30);
    v33 = (char *)&v60 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v31 + 16))(v33);
    if (*(_QWORD *)(v26 + 16) && (v34 = sub_23800DF54((uint64_t)v33), (v35 & 1) != 0))
    {
      v36 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v34);
      swift_bridgeObjectRetain();
      swift_release();
      v37 = v29;
      v38 = v36;
      (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v37);
      v39 = *(_QWORD *)(v36 + 16);
      if (v39)
      {
        if ((a1 & 1) != 0)
          v40 = 1;
        else
          v40 = 3;
        v62 = v40;
        swift_bridgeObjectRetain();
        v60 = v38;
        v41 = (_BYTE *)(v38 + 64);
        v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v20 = v63;
        v43 = v66;
        v61 = a2;
        do
        {
          v44 = *((_QWORD *)v41 - 1);
          if (v44 >> 60 != 15 && *v41 != 4)
          {
            v65 = v42;
            v47 = *((_QWORD *)v41 - 4);
            v46 = *((_QWORD *)v41 - 3);
            v48 = *((_QWORD *)v41 - 2);
            sub_238009148(v48, v44);
            sub_238009148(v48, v44);
            *(_QWORD *)&v64 = v46;
            sub_237FFBA20(v47, v46);
            sub_238009148(v48, v44);
            sub_2380068C4(v48, v44);
            v50 = v49;
            v52 = v51;
            v67 = v49;
            v68 = v51;
            v69 = v62;
            Image4Manifest.canonicalize(evaluateTrust:)();
            sub_238008CF0(v48, v44);
            sub_237FFBAB0(v50, v52);
            sub_237FFBAB0(v47, v64);
            sub_238008CF0(v48, v44);
            v64 = v70;
            v42 = v65;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v42 = sub_238026C5C(0, v42[2] + 1, 1, v42);
            a2 = v61;
            v20 = v63;
            v54 = v42[2];
            v53 = v42[3];
            if (v54 >= v53 >> 1)
              v42 = sub_238026C5C((_QWORD *)(v53 > 1), v54 + 1, 1, v42);
            v42[2] = v54 + 1;
            *(_OWORD *)&v42[2 * v54 + 4] = v64;
            v43 = v66;
          }
          v41 += 56;
          --v39;
        }
        while (v39);
        swift_bridgeObjectRelease();
      }
      else
      {
        v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v20 = v63;
        v43 = v66;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v29);
      v42 = 0;
      v20 = v63;
      v43 = v66;
    }
    sub_237FFBA20(v43, v20);
    sub_2380068C4(v43, v20);
    v56 = v55;
    v58 = v57;
    v67 = v55;
    v68 = v57;
    v69 = 0;
    Image4Manifest.canonicalize(evaluateTrust:)();
    sub_237FFBAB0(v56, v58);
    if (v42)
      v59 = (uint64_t)v42;
    else
      v59 = MEMORY[0x24BEE4AF8];
    sub_238029954(v70, *((uint64_t *)&v70 + 1), v59, a2);
    v28 = v43;
  }
  return sub_237FFBAB0(v28, v20);
}

uint64_t EnsembleHPKE.Leader.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[7];
  __int128 v28;
  __int128 v29;
  _UNKNOWN **v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _UNKNOWN **v40;
  _BYTE v41[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _UNKNOWN **v49;
  char v50;

  v24 = a1;
  v25 = type metadata accessor for EnsembleHPKE.Leader(0);
  MEMORY[0x24BDAC7A8](v25);
  v2 = (uint64_t *)((char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = type metadata accessor for EnsembleValidator();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v24 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  *(_OWORD *)&v41[8] = xmmword_2380C1230;
  *((_QWORD *)&v48 + 1) = &type metadata for SEP.PhysicalDevice;
  v49 = &protocol witness table for SEP.PhysicalDevice;
  *(_OWORD *)((char *)v27 + 8) = xmmword_2380C1230;
  *((_QWORD *)&v29 + 1) = &type metadata for SEP.PhysicalDevice;
  v30 = &protocol witness table for SEP.PhysicalDevice;
  swift_beginAccess();
  v12 = byte_2542C9B90;
  if (byte_2542C9B90 == 9)
  {
    static Environment.default.getter(&v50);
    v12 = v50;
  }
  else
  {
    v50 = byte_2542C9B90;
  }
  sub_2380470CC(0, v12, (uint64_t)&v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  v27[6] = v37;
  v28 = v38;
  v29 = v39;
  v30 = v40;
  v27[2] = v33;
  v27[3] = v34;
  v27[4] = v35;
  v27[5] = v36;
  v27[0] = v31;
  v27[1] = v32;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
  v46 = v37;
  v47 = v38;
  v48 = v39;
  v49 = v40;
  v42 = v33;
  v43 = v34;
  v44 = v35;
  v45 = v36;
  v13 = (uint64_t)&v9[*(int *)(v3 + 52)];
  *(_OWORD *)v41 = v31;
  *(_OWORD *)&v41[16] = v32;
  v14 = sub_2380BD418();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = v26;
  sub_23809227C((uint64_t)v6);
  sub_238005240(v13, &qword_2542C9C00);
  if (v15)
    return sub_238092C2C((uint64_t)v41);
  sub_238001DE4((uint64_t)v6, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
  sub_238001DE4((uint64_t)v9, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
  v16 = v25;
  *((_BYTE *)v2 + *(int *)(v25 + 28)) = 0;
  sub_23809318C();
  *v2 = v17;
  sub_238001DE4((uint64_t)v11, (uint64_t)v2 + *(int *)(v16 + 20), (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
  v18 = (char *)v2 + *(int *)(v16 + 24);
  v19 = v47;
  *((_OWORD *)v18 + 6) = v46;
  *((_OWORD *)v18 + 7) = v19;
  *((_OWORD *)v18 + 8) = v48;
  *((_QWORD *)v18 + 18) = v49;
  v20 = v43;
  *((_OWORD *)v18 + 2) = v42;
  *((_OWORD *)v18 + 3) = v20;
  v21 = v45;
  *((_OWORD *)v18 + 4) = v44;
  *((_OWORD *)v18 + 5) = v21;
  v22 = *(_OWORD *)&v41[16];
  *(_OWORD *)v18 = *(_OWORD *)v41;
  *((_OWORD *)v18 + 1) = v22;
  return sub_238001DE4((uint64_t)v2, v24, type metadata accessor for EnsembleHPKE.Leader);
}

uint64_t EnsembleHPKE.Leader.attest()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_2380BD418();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2380901AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (uint64_t *)v0[3];
  type metadata accessor for EnsembleHPKE.Leader(0);
  v2 = *v1;
  sub_2380BE294();
  sub_2380BD3F4();
  v3 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_238090250;
  return NodeAttestor.attest(key:expiration:nonce:)(v0[2], v2, v0[6], 0, 0xF000000000000000);
}

uint64_t sub_238090250()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 + 40) + 8))(*(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 32));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> EnsembleHPKE.Leader.rekey()()
{
  sub_23809146C(type metadata accessor for EnsembleHPKE.Leader);
}

void EnsembleHPKE.Leader.sender<A, B>(for:info:policy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v9[13] = a8;
  v9[14] = v8;
  v9[11] = a4;
  v9[12] = a6;
  v9[9] = a1;
  v9[10] = a2;
  v13 = sub_2380BD8B0();
  v9[15] = v13;
  v9[16] = *(_QWORD *)(v13 - 8);
  v9[17] = swift_task_alloc();
  v9[18] = swift_task_alloc();
  v9[19] = *(_QWORD *)(a6 - 8);
  v9[20] = swift_task_alloc();
  v14 = sub_2380BD8E0();
  v9[21] = v14;
  v9[22] = *(_QWORD *)(v14 - 8);
  v9[23] = swift_task_alloc();
  v9[24] = swift_task_alloc();
  v15 = sub_2380BD97C();
  v9[25] = v15;
  v9[26] = *(_QWORD *)(v15 - 8);
  v9[27] = swift_task_alloc();
  v9[28] = swift_task_alloc();
  v16 = sub_2380BD94C();
  v9[29] = v16;
  v9[30] = *(_QWORD *)(v16 - 8);
  v9[31] = swift_task_alloc();
  v9[32] = swift_task_alloc();
  v9[33] = swift_task_alloc();
  v9[34] = swift_task_alloc();
  type metadata accessor for Validated.AttestationBundle(0);
  v17 = swift_task_alloc();
  v9[35] = v17;
  v9[36] = swift_task_alloc();
  v18 = sub_2380BD418();
  v9[37] = v18;
  v9[38] = *(_QWORD *)(v18 - 8);
  v9[39] = swift_task_alloc();
  v19 = swift_task_alloc();
  v9[40] = v19;
  v9[41] = swift_task_alloc();
  v9[42] = type metadata accessor for EnsembleHPKE.Leader(0);
  v20 = (_QWORD *)swift_task_alloc();
  v9[43] = v20;
  v21 = type metadata accessor for EnsembleValidator();
  v22 = sub_238001820(&qword_2568C89C0, (uint64_t (*)(uint64_t))type metadata accessor for EnsembleValidator, (uint64_t)&protocol conformance descriptor for EnsembleValidator);
  *v20 = v9;
  v20[1] = sub_2380905A0;
  Validator.validate<A>(bundle:policy:)((uint64_t)(v9 + 2), v19, v17, a3, a5, v21, a7, v22);
}

uint64_t sub_2380905A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

CFDataRef sub_238090648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t (*v21)(void);
  CFDataRef result;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  SecKeyRef *v26;
  CFDataRef v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
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

  v2 = *(_QWORD *)(v0 + 304);
  v1 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 280);
  v7 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 320), v3);
  sub_238001DE4(v5, v4, type metadata accessor for Validated.AttestationBundle);
  sub_2380BD40C();
  sub_238001820(&qword_2568C5C68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v8 = sub_2380BDCDC();
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v1, v3);
  if ((v8 & 1) != 0)
  {
    v10 = *(_QWORD *)(v0 + 328);
    v12 = *(_QWORD *)(v0 + 288);
    v11 = *(_QWORD *)(v0 + 296);
    sub_238075130();
    swift_allocError();
    *v13 = 0;
LABEL_7:
    swift_willThrow();
    sub_23801BDE0(v7, v6);
    sub_237FFD540(v12, type metadata accessor for Validated.AttestationBundle);
    v18 = v10;
    v19 = v11;
    goto LABEL_8;
  }
  if ((v6 & 0x2000000000000000) != 0)
  {
    v10 = *(_QWORD *)(v0 + 328);
    v12 = *(_QWORD *)(v0 + 288);
    v11 = *(_QWORD *)(v0 + 296);
    sub_238075130();
    swift_allocError();
    *v20 = 1;
    goto LABEL_7;
  }
  v14 = *(_QWORD *)(v0 + 352);
  *(_QWORD *)(v0 + 32) = v7;
  *(_QWORD *)(v0 + 40) = v6;
  sub_237FFBA20(v7, v6);
  sub_2380BD940();
  if (v14)
  {
    v15 = *(_QWORD *)(v0 + 328);
    v17 = *(_QWORD *)(v0 + 288);
    v16 = *(_QWORD *)(v0 + 296);
    sub_23801BDE0(v7, v6);
    sub_237FFD540(v17, type metadata accessor for Validated.AttestationBundle);
    v18 = v15;
    v19 = v16;
LABEL_8:
    v9(v18, v19);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
    return (CFDataRef)v21();
  }
  v23 = *(_QWORD *)(v0 + 336);
  v24 = *(_QWORD *)(v0 + 112);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 32))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 232));
  if (*(_BYTE *)(v24 + *(int *)(v23 + 28)) != 1)
  {
    v29 = **(id **)(v0 + 112);
    sub_2380BD8A4();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 16))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 232));
    if (qword_2568C5068 != -1)
      swift_once();
    v36 = *(_QWORD *)(v0 + 176);
    v37 = *(_QWORD *)(v0 + 184);
    v39 = *(_QWORD *)(v0 + 160);
    v38 = *(_QWORD *)(v0 + 168);
    v73 = *(_QWORD *)(v0 + 144);
    v62 = *(_QWORD *)(v0 + 128);
    v63 = *(_QWORD *)(v0 + 120);
    v66 = *(_QWORD *)(v0 + 136);
    v40 = *(_QWORD *)(v0 + 96);
    v60 = *(_QWORD *)(v0 + 152);
    v41 = *(_QWORD *)(v0 + 88);
    v42 = __swift_project_value_buffer(v38, (uint64_t)qword_2568C8998);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v37, v42, v38);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v39, v41, v40);
    sub_2380BD3B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v66, v73, v63);
    sub_2380BD8EC();
    v74 = *(_QWORD *)(v0 + 296);
    v77 = *(_QWORD *)(v0 + 328);
    v67 = *(_QWORD *)(v0 + 272);
    v70 = *(_QWORD *)(v0 + 288);
    v44 = *(_QWORD *)(v0 + 232);
    v43 = *(_QWORD *)(v0 + 240);
    v45 = *(_QWORD *)(v0 + 144);
    v47 = *(_QWORD *)(v0 + 120);
    v46 = *(_QWORD *)(v0 + 128);
    v58 = *(_QWORD *)(v0 + 80);
    sub_23801BDE0(v7, v6);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v67, v44);
    goto LABEL_22;
  }
  v25 = (uint64_t *)(v0 + 64);
  v26 = *(SecKeyRef **)(v0 + 112);
  *(_QWORD *)(v0 + 64) = 0;
  result = SecKeyCopyExternalRepresentation(*v26, (CFErrorRef *)(v0 + 64));
  if (result)
  {
    v27 = result;
    *(_QWORD *)(v0 + 48) = sub_2380BD37C();
    *(_QWORD *)(v0 + 56) = v28;
    sub_2380BD964();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 16))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 232));
    if (qword_2568C5068 != -1)
      swift_once();
    v75 = *(_QWORD *)(v0 + 224);
    v48 = *(_QWORD *)(v0 + 192);
    v68 = *(_QWORD *)(v0 + 200);
    v71 = *(_QWORD *)(v0 + 216);
    v50 = *(_QWORD *)(v0 + 168);
    v49 = *(_QWORD *)(v0 + 176);
    v51 = *(_QWORD *)(v0 + 160);
    v52 = *(_QWORD *)(v0 + 96);
    v61 = *(_QWORD *)(v0 + 152);
    v59 = *(_QWORD *)(v0 + 88);
    v64 = *(_QWORD *)(v0 + 208);
    v53 = __swift_project_value_buffer(v50, (uint64_t)qword_2568C8998);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v48, v53, v50);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16))(v51, v59, v52);
    sub_2380BD3B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v71, v75, v68);
    sub_2380BD8EC();
    v74 = *(_QWORD *)(v0 + 296);
    v77 = *(_QWORD *)(v0 + 328);
    v69 = *(_QWORD *)(v0 + 272);
    v70 = *(_QWORD *)(v0 + 288);
    v54 = *(_QWORD *)(v0 + 240);
    v65 = *(_QWORD *)(v0 + 232);
    v55 = *(_QWORD *)(v0 + 224);
    v56 = *(_QWORD *)(v0 + 200);
    v57 = *(_QWORD *)(v0 + 208);
    v58 = *(_QWORD *)(v0 + 80);
    sub_23801BDE0(v7, v6);

    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v56);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v69, v65);
LABEL_22:
    v9(v77, v74);
    sub_238001DE4(v70, v58, type metadata accessor for Validated.AttestationBundle);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
    return (CFDataRef)v21();
  }
  v30 = *v25;
  if (*v25)
  {
    v31 = *(_QWORD *)(v0 + 288);
    v72 = *(_QWORD *)(v0 + 296);
    v76 = *(_QWORD *)(v0 + 328);
    v32 = *(_QWORD *)(v0 + 272);
    v33 = *(_QWORD *)(v0 + 232);
    v34 = *(_QWORD *)(v0 + 240);
    type metadata accessor for CFError(0);
    sub_238001820((unint64_t *)&qword_2568C6378, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
    swift_allocError();
    *v35 = v30;
    swift_willThrow();
    sub_23801BDE0(v7, v6);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
    sub_237FFD540(v31, type metadata accessor for Validated.AttestationBundle);
    v19 = v72;
    v18 = v76;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_238090F0C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t EnsembleHPKE.Follower.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[7];
  __int128 v28;
  __int128 v29;
  _UNKNOWN **v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _UNKNOWN **v40;
  _BYTE v41[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _UNKNOWN **v49;
  char v50;

  v24 = a1;
  v25 = type metadata accessor for EnsembleHPKE.Follower(0);
  MEMORY[0x24BDAC7A8](v25);
  v2 = (uint64_t *)((char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = type metadata accessor for EnsembleValidator();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v24 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  *(_OWORD *)&v41[8] = xmmword_2380C1230;
  *((_QWORD *)&v48 + 1) = &type metadata for SEP.PhysicalDevice;
  v49 = &protocol witness table for SEP.PhysicalDevice;
  *(_OWORD *)((char *)v27 + 8) = xmmword_2380C1230;
  *((_QWORD *)&v29 + 1) = &type metadata for SEP.PhysicalDevice;
  v30 = &protocol witness table for SEP.PhysicalDevice;
  swift_beginAccess();
  v12 = byte_2542C9B90;
  if (byte_2542C9B90 == 9)
  {
    static Environment.default.getter(&v50);
    v12 = v50;
  }
  else
  {
    v50 = byte_2542C9B90;
  }
  sub_2380470CC(0, v12, (uint64_t)&v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  v27[6] = v37;
  v28 = v38;
  v29 = v39;
  v30 = v40;
  v27[2] = v33;
  v27[3] = v34;
  v27[4] = v35;
  v27[5] = v36;
  v27[0] = v31;
  v27[1] = v32;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
  v46 = v37;
  v47 = v38;
  v48 = v39;
  v49 = v40;
  v42 = v33;
  v43 = v34;
  v44 = v35;
  v45 = v36;
  v13 = (uint64_t)&v9[*(int *)(v3 + 52)];
  *(_OWORD *)v41 = v31;
  *(_OWORD *)&v41[16] = v32;
  v14 = sub_2380BD418();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = v26;
  sub_23809227C((uint64_t)v6);
  sub_238005240(v13, &qword_2542C9C00);
  if (v15)
    return sub_238092C2C((uint64_t)v41);
  sub_238001DE4((uint64_t)v6, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
  sub_238001DE4((uint64_t)v9, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
  v16 = v25;
  *((_BYTE *)v2 + *(int *)(v25 + 28)) = 0;
  sub_23809318C();
  *v2 = v17;
  sub_238093738((uint64_t)v11, (uint64_t)v2 + *(int *)(v16 + 20));
  *((_QWORD *)&v32 + 1) = &type metadata for EnsembleAttestor;
  *(_QWORD *)&v33 = &protocol witness table for EnsembleAttestor;
  v18 = swift_allocObject();
  *(_QWORD *)&v31 = v18;
  v19 = v47;
  *(_OWORD *)(v18 + 112) = v46;
  *(_OWORD *)(v18 + 128) = v19;
  *(_OWORD *)(v18 + 144) = v48;
  *(_QWORD *)(v18 + 160) = v49;
  v20 = v43;
  *(_OWORD *)(v18 + 48) = v42;
  *(_OWORD *)(v18 + 64) = v20;
  v21 = v45;
  *(_OWORD *)(v18 + 80) = v44;
  *(_OWORD *)(v18 + 96) = v21;
  v22 = *(_OWORD *)&v41[16];
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v41;
  *(_OWORD *)(v18 + 32) = v22;
  sub_237FFD540((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
  sub_23800A4E4(&v31, (uint64_t)v2 + *(int *)(v16 + 24));
  return sub_238001DE4((uint64_t)v2, v24, type metadata accessor for EnsembleHPKE.Follower);
}

uint64_t EnsembleHPKE.Follower.attest()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2380913C0()
{
  uint64_t *v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (uint64_t *)v0[3];
  v2 = (uint64_t *)((char *)v1 + *(int *)(type metadata accessor for EnsembleHPKE.Follower(0) + 24));
  v4 = v2[3];
  v3 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  v5 = *v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[4] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_23806C03C;
  return Attestor.attest(key:)(v0[2], v5, v4, v3);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> EnsembleHPKE.Follower.rekey()()
{
  sub_23809146C(type metadata accessor for EnsembleHPKE.Follower);
}

void sub_23809146C(uint64_t (*a1)(_QWORD))
{
  id *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  if (*((_BYTE *)v1 + *(int *)(a1(0) + 28)) == 1)
  {
    sub_2380934D0();
    if (v2)
      return;
  }
  else
  {
    sub_23809318C();
    if (v2)
      return;
  }
  v4 = v3;

  *v1 = v4;
}

void EnsembleHPKE.Follower.recipient<A, B>(for:encapsulatedKey:info:policy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v9[15] = v24;
  v9[16] = v8;
  v9[13] = a6;
  v9[14] = a8;
  v9[11] = a4;
  v9[12] = a5;
  v9[9] = a1;
  v9[10] = a2;
  v12 = sub_2380BD8B0();
  v9[17] = v12;
  v9[18] = *(_QWORD *)(v12 - 8);
  v9[19] = swift_task_alloc();
  v9[20] = swift_task_alloc();
  v9[21] = *(_QWORD *)(a8 - 8);
  v9[22] = swift_task_alloc();
  v13 = sub_2380BD8E0();
  v9[23] = v13;
  v9[24] = *(_QWORD *)(v13 - 8);
  v9[25] = swift_task_alloc();
  v9[26] = swift_task_alloc();
  v14 = sub_2380BD97C();
  v9[27] = v14;
  v9[28] = *(_QWORD *)(v14 - 8);
  v9[29] = swift_task_alloc();
  v9[30] = swift_task_alloc();
  v15 = sub_2380BD94C();
  v9[31] = v15;
  v9[32] = *(_QWORD *)(v15 - 8);
  v9[33] = swift_task_alloc();
  v9[34] = swift_task_alloc();
  v9[35] = swift_task_alloc();
  v9[36] = swift_task_alloc();
  type metadata accessor for Validated.AttestationBundle(0);
  v16 = swift_task_alloc();
  v9[37] = v16;
  v9[38] = swift_task_alloc();
  v17 = sub_2380BD418();
  v9[39] = v17;
  v9[40] = *(_QWORD *)(v17 - 8);
  v9[41] = swift_task_alloc();
  v18 = swift_task_alloc();
  v9[42] = v18;
  v9[43] = swift_task_alloc();
  v9[44] = type metadata accessor for EnsembleHPKE.Follower(0);
  v19 = (_QWORD *)swift_task_alloc();
  v9[45] = v19;
  v20 = type metadata accessor for EnsembleValidator();
  v21 = sub_238001820(&qword_2568C89C0, (uint64_t (*)(uint64_t))type metadata accessor for EnsembleValidator, (uint64_t)&protocol conformance descriptor for EnsembleValidator);
  *v19 = v9;
  v19[1] = sub_238091784;
  Validator.validate<A>(bundle:policy:)((uint64_t)(v9 + 2), v18, v16, a3, a7, v20, v23, v21);
}

uint64_t sub_238091784()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

CFDataRef sub_23809182C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t (*v21)(void);
  CFDataRef result;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  SecKeyRef *v26;
  CFDataRef v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
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
  unint64_t v64;
  unint64_t v65;
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
  uint64_t v81;

  v2 = *(_QWORD *)(v0 + 320);
  v1 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 296);
  v7 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 336), v3);
  sub_238001DE4(v5, v4, type metadata accessor for Validated.AttestationBundle);
  sub_2380BD40C();
  sub_238001820(&qword_2568C5C68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v8 = sub_2380BDCDC();
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v1, v3);
  if ((v8 & 1) != 0)
  {
    v10 = *(_QWORD *)(v0 + 344);
    v12 = *(_QWORD *)(v0 + 304);
    v11 = *(_QWORD *)(v0 + 312);
    sub_238075130();
    swift_allocError();
    *v13 = 0;
LABEL_7:
    swift_willThrow();
    sub_23801BDE0(v7, v6);
    sub_237FFD540(v12, type metadata accessor for Validated.AttestationBundle);
    v18 = v10;
    v19 = v11;
    goto LABEL_8;
  }
  if ((v6 & 0x2000000000000000) != 0)
  {
    v10 = *(_QWORD *)(v0 + 344);
    v12 = *(_QWORD *)(v0 + 304);
    v11 = *(_QWORD *)(v0 + 312);
    sub_238075130();
    swift_allocError();
    *v20 = 1;
    goto LABEL_7;
  }
  v14 = *(_QWORD *)(v0 + 368);
  *(_QWORD *)(v0 + 32) = v7;
  *(_QWORD *)(v0 + 40) = v6;
  sub_237FFBA20(v7, v6);
  sub_2380BD940();
  if (v14)
  {
    v15 = *(_QWORD *)(v0 + 344);
    v17 = *(_QWORD *)(v0 + 304);
    v16 = *(_QWORD *)(v0 + 312);
    sub_23801BDE0(v7, v6);
    sub_237FFD540(v17, type metadata accessor for Validated.AttestationBundle);
    v18 = v15;
    v19 = v16;
LABEL_8:
    v9(v18, v19);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
    return (CFDataRef)v21();
  }
  v23 = *(_QWORD *)(v0 + 352);
  v24 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 32))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 248));
  if (*(_BYTE *)(v24 + *(int *)(v23 + 28)) != 1)
  {
    v29 = **(id **)(v0 + 128);
    sub_2380BD8A4();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 16))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
    if (qword_2568C5068 != -1)
      swift_once();
    v68 = *(_QWORD *)(v0 + 264);
    v71 = *(_QWORD *)(v0 + 248);
    v75 = *(_QWORD *)(v0 + 288);
    v36 = *(_QWORD *)(v0 + 192);
    v37 = *(_QWORD *)(v0 + 200);
    v39 = *(_QWORD *)(v0 + 176);
    v38 = *(_QWORD *)(v0 + 184);
    v40 = *(_QWORD *)(v0 + 112);
    v61 = *(_QWORD *)(v0 + 168);
    v41 = *(_QWORD *)(v0 + 104);
    v64 = *(_QWORD *)(v0 + 96);
    v66 = *(_QWORD *)(v0 + 256);
    v62 = *(_QWORD *)(v0 + 88);
    v42 = __swift_project_value_buffer(v38, (uint64_t)qword_2568C8998);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v37, v42, v38);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16))(v39, v41, v40);
    sub_2380BD3B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 16))(v68, v75, v71);
    sub_237FFBA20(v62, v64);
    sub_2380BD91C();
    v79 = *(_QWORD *)(v0 + 312);
    v81 = *(_QWORD *)(v0 + 344);
    v72 = *(_QWORD *)(v0 + 288);
    v76 = *(_QWORD *)(v0 + 304);
    v44 = *(_QWORD *)(v0 + 248);
    v43 = *(_QWORD *)(v0 + 256);
    v45 = *(_QWORD *)(v0 + 160);
    v47 = *(_QWORD *)(v0 + 136);
    v46 = *(_QWORD *)(v0 + 144);
    v58 = *(_QWORD *)(v0 + 80);
    sub_23801BDE0(v7, v6);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v72, v44);
    goto LABEL_22;
  }
  v25 = (uint64_t *)(v0 + 64);
  v26 = *(SecKeyRef **)(v0 + 128);
  *(_QWORD *)(v0 + 64) = 0;
  result = SecKeyCopyExternalRepresentation(*v26, (CFErrorRef *)(v0 + 64));
  if (result)
  {
    v27 = result;
    *(_QWORD *)(v0 + 48) = sub_2380BD37C();
    *(_QWORD *)(v0 + 56) = v28;
    sub_2380BD964();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 16))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 216));
    if (qword_2568C5068 != -1)
      swift_once();
    v69 = *(_QWORD *)(v0 + 272);
    v73 = *(_QWORD *)(v0 + 248);
    v77 = *(_QWORD *)(v0 + 288);
    v48 = *(_QWORD *)(v0 + 208);
    v49 = *(_QWORD *)(v0 + 184);
    v50 = *(_QWORD *)(v0 + 192);
    v51 = *(_QWORD *)(v0 + 176);
    v52 = *(_QWORD *)(v0 + 112);
    v59 = *(_QWORD *)(v0 + 104);
    v60 = *(_QWORD *)(v0 + 168);
    v65 = *(_QWORD *)(v0 + 96);
    v67 = *(_QWORD *)(v0 + 256);
    v63 = *(_QWORD *)(v0 + 88);
    v53 = __swift_project_value_buffer(v49, (uint64_t)qword_2568C8998);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v48, v53, v49);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16))(v51, v59, v52);
    sub_2380BD3B8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(v69, v77, v73);
    sub_237FFBA20(v63, v65);
    sub_2380BD91C();
    v79 = *(_QWORD *)(v0 + 312);
    v81 = *(_QWORD *)(v0 + 344);
    v74 = *(_QWORD *)(v0 + 288);
    v76 = *(_QWORD *)(v0 + 304);
    v54 = *(_QWORD *)(v0 + 256);
    v70 = *(_QWORD *)(v0 + 248);
    v55 = *(_QWORD *)(v0 + 240);
    v56 = *(_QWORD *)(v0 + 216);
    v57 = *(_QWORD *)(v0 + 224);
    v58 = *(_QWORD *)(v0 + 80);
    sub_23801BDE0(v7, v6);

    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v56);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v74, v70);
LABEL_22:
    v9(v81, v79);
    sub_238001DE4(v76, v58, type metadata accessor for Validated.AttestationBundle);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
    return (CFDataRef)v21();
  }
  v30 = *v25;
  if (*v25)
  {
    v31 = *(_QWORD *)(v0 + 304);
    v78 = *(_QWORD *)(v0 + 312);
    v80 = *(_QWORD *)(v0 + 344);
    v32 = *(_QWORD *)(v0 + 288);
    v33 = *(_QWORD *)(v0 + 248);
    v34 = *(_QWORD *)(v0 + 256);
    type metadata accessor for CFError(0);
    sub_238001820((unint64_t *)&qword_2568C6378, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
    swift_allocError();
    *v35 = v30;
    swift_willThrow();
    sub_23801BDE0(v7, v6);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
    sub_237FFD540(v31, type metadata accessor for Validated.AttestationBundle);
    v19 = v78;
    v18 = v80;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_238092148()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23809227C(uint64_t a1@<X8>)
{
  uint64_t v1;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  int v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  char v18;
  char v19;
  char v20;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  void *v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __CFString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  char *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __CFString *v75;
  _QWORD v76[2];
  char v77;
  char v78;
  char v79;
  int v80;
  __CFString *v81;

  v3 = (int *)type metadata accessor for EnsembleValidator();
  v4 = a1 + v3[13];
  v5 = sub_2380BD418();
  v6 = *(void (**)(void))(*(_QWORD *)(v5 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6)(v4, 1, 1, v5);
  *(_QWORD *)(a1 + v3[12]) = MEMORY[0x24BEE4AF8];
  sub_238005240(v4, &qword_2542C9C00);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v6)(v4, 1, 1, v5);
  v7 = sub_23807C028((uint64_t)v76);
  if (v1)
  {
    swift_bridgeObjectRelease();
    sub_238005240(v4, &qword_2542C9C00);
    return;
  }
  v8 = v76[1];
  v9 = v77;
  v10 = v78;
  v11 = v79;
  v12 = v80;
  v13 = a1 + v3[5];
  *(_DWORD *)v13 = v76[0];
  *(_QWORD *)(v13 + 8) = v8;
  *(_BYTE *)(v13 + 16) = v9;
  *(_BYTE *)(v13 + 17) = v10;
  *(_BYTE *)(v13 + 18) = v11;
  *(_DWORD *)(v13 + 20) = v12;
  *(_DWORD *)(a1 + v3[6]) = v7;
  v14 = type metadata accessor for Release();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23808F7F4(0, (uint64_t)v16);
  sub_238001DE4((uint64_t)v16, a1, (uint64_t (*)(_QWORD))type metadata accessor for Release);
  sub_23807C39C(v76);
  if (LOBYTE(v76[0]))
    v18 = 2;
  else
    v18 = 1;
  *(_BYTE *)(a1 + v3[7]) = v18;
  if (BYTE1(v76[0]))
    v19 = 2;
  else
    v19 = 1;
  *(_BYTE *)(a1 + v3[8]) = v19;
  if (BYTE2(v76[0]))
    v20 = 2;
  else
    v20 = 1;
  *(_BYTE *)(a1 + v3[9]) = v20;
  *(_BYTE *)(a1 + v3[10]) = v17 & 1;
  v21 = (const __CFString *)sub_2380BDCF4();
  v75 = (__CFString *)v21;
  v22 = (__CFString *)sub_2380BDCF4();
  v23 = (__CFString *)CFPreferencesCopyAppValue(v21, v22);

  if (!v23)
    goto LABEL_17;
  v81 = v23;
  swift_unknownObjectRetain();
  if (!swift_dynamicCast()
    || (v75 = v23, v74 = sub_2380BD304(), v25 = v24, swift_bridgeObjectRelease(), v25 >> 60 == 15))
  {
    swift_unknownObjectRelease();
LABEL_17:
    *(_BYTE *)(a1 + v3[14]) = 0;
    *(_BYTE *)(a1 + v3[15]) = 0;
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5D98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380BEAC0;
  *(_QWORD *)(inited + 32) = v74;
  v72 = inited + 32;
  v70 = inited;
  *(_QWORD *)(inited + 40) = v25;
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + v3[14]) = 1;
  v34 = type metadata accessor for X509Policy();
  v71 = &v58;
  v74 = v34;
  MEMORY[0x24BDAC7A8](v34);
  v66 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  v67 = (char *)v35;
  v75 = (__CFString *)((char *)&v58 - v66);
  if (qword_2568C5090 != -1)
    swift_once();
  v64 = qword_2568C9FE0;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
  v69 = &v58;
  v59 = *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64);
  MEMORY[0x24BDAC7A8](v36);
  v60 = (char *)((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = (char *)&v58 - v60;
  v6();
  v38 = v75;
  v39 = v74;
  v65 = (char *)v75 + *(int *)(v74 + 24);
  v40 = ((uint64_t (*)(void))v6)();
  v68 = &v58;
  v41 = (uint64_t *)((char *)v38 + *(int *)(v39 + 28));
  v63 = v41;
  *v41 = 0;
  v41[1] = 0;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v43 = v66;
  v61 = (uint64_t)&v58 - v66;
  v62 = &v58;
  MEMORY[0x24BDAC7A8](v42);
  v59 = (char *)&v58 - v60;
  v44 = sub_2380953F8(v73, (char *)&v58 - v60);
  v60 = (char *)&v58;
  MEMORY[0x24BDAC7A8](v44);
  v45 = (char *)&v58 - v43;
  v46 = v74;
  v67 = &v45[*(int *)(v74 + 24)];
  v6();
  v47 = (uint64_t *)&v45[*(int *)(v46 + 28)];
  *v47 = 0;
  v47[1] = 0;
  *v45 = 1;
  *((_QWORD *)v45 + 1) = v64;
  swift_bridgeObjectRetain();
  sub_23801776C(v59, (uint64_t)v67);
  sub_23801B358(*v47);
  *v47 = 0;
  v47[1] = 0;
  v48 = v61;
  sub_238001DE4((uint64_t)v45, v61, (uint64_t (*)(_QWORD))type metadata accessor for X509Policy);
  sub_238005240(v73, &qword_2542C9C00);
  sub_238005240((uint64_t)v65, &qword_2542C9C00);
  sub_23801B358(*v63);
  v49 = v48;
  v50 = (uint64_t)v75;
  sub_238001DE4(v49, (uint64_t)v75, (uint64_t (*)(_QWORD))type metadata accessor for X509Policy);
  sub_23809839C(v70);
  sub_237FFD540(v50, (uint64_t (*)(_QWORD))type metadata accessor for X509Policy);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(_BYTE *)(a1 + v3[15]) = 1;
LABEL_18:
  if (MEMORY[0x24BDE8348])
    v26 = MEMORY[0x24BDE8358] == 0;
  else
    v26 = 1;
  if (v26
    || MEMORY[0x24BDE8360] == 0
    || MEMORY[0x24BDE8338] == 0
    || MEMORY[0x24BDE8350] == 0
    || MEMORY[0x24BDE8340] == 0)
  {
LABEL_49:
    v51 = v3[11];
    v52 = 2;
    goto LABEL_50;
  }
  sub_2380BD4E4();
  v31 = (void *)sub_2380BD4CC();
  v32 = sub_2380BD4D8();
  if (v32 != 2)
  {
    if (v32 == 1)
    {

    }
    else
    {
      if (!v32)
      {

        *(_BYTE *)(a1 + v3[11]) = 0;
        return;
      }
      if (qword_2568C5030 != -1)
        swift_once();
      v53 = sub_2380BD808();
      __swift_project_value_buffer(v53, (uint64_t)qword_2568C9F40);
      v54 = v31;
      v55 = sub_2380BD7F0();
      v56 = sub_2380BDF64();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v57 = 134349056;
        v75 = (__CFString *)(v57 + 4);
        sub_2380BD4D8();
        v76[0] = sub_2380BD4F0();
        sub_2380BDF94();

        _os_log_impl(&dword_237FF6000, v55, v56, "Unknown config security policy %{public}ld, defaulting to customer", v57, 0xCu);
        MEMORY[0x23B82B830](v57, -1, -1);
      }
      else
      {

      }
    }
    goto LABEL_49;
  }

  v51 = v3[11];
  v52 = 1;
LABEL_50:
  *(_BYTE *)(a1 + v51) = v52;
}

uint64_t sub_238092A90()
{
  uint64_t v0;

  v0 = sub_2380BD8E0();
  __swift_allocate_value_buffer(v0, qword_2568C8998);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C8998);
  return sub_2380BD8D4();
}

uint64_t static EnsembleHPKE.ciphersuite.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2568C5068 != -1)
    swift_once();
  v2 = sub_2380BD8E0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2568C8998);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

__n128 EnsembleHPKE.Leader.init(attestor:validator:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  int *v7;
  uint64_t v8;
  __n128 result;
  char *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v7 = (int *)type metadata accessor for EnsembleHPKE.Leader(0);
  *((_BYTE *)a3 + v7[7]) = 0;
  sub_23809318C();
  if (v3)
  {
    sub_237FFD540(a2, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
    sub_238092C2C(a1);
  }
  else
  {
    *a3 = v8;
    sub_238001DE4(a2, (uint64_t)a3 + v7[5], (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
    v10 = (char *)a3 + v7[6];
    v11 = *(_OWORD *)(a1 + 112);
    *((_OWORD *)v10 + 6) = *(_OWORD *)(a1 + 96);
    *((_OWORD *)v10 + 7) = v11;
    *((_OWORD *)v10 + 8) = *(_OWORD *)(a1 + 128);
    *((_QWORD *)v10 + 18) = *(_QWORD *)(a1 + 144);
    v12 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v10 + 2) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v10 + 3) = v12;
    v13 = *(_OWORD *)(a1 + 80);
    *((_OWORD *)v10 + 4) = *(_OWORD *)(a1 + 64);
    *((_OWORD *)v10 + 5) = v13;
    result = *(__n128 *)a1;
    v14 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v10 = *(_OWORD *)a1;
    *((_OWORD *)v10 + 1) = v14;
  }
  return result;
}

uint64_t type metadata accessor for EnsembleHPKE.Leader(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C8A48);
}

uint64_t sub_238092C2C(uint64_t a1)
{
  destroy for NodeAttestor(a1);
  return a1;
}

uint64_t EnsembleHPKE.Leader.sender<A>(for:info:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v7[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C7C50);
  v7[10] = swift_task_alloc();
  return swift_task_switch();
}

void sub_238092CCC()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[10];
  type metadata accessor for EnsembleHPKE.Leader(0);
  _s16CloudAttestation17EnsembleValidatorV9policyFor4udid12fingerprintsQrSS_Say10Foundation4DataVGtF_0(0, 0, 0, v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[11] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_238092D60;
  EnsembleHPKE.Leader.sender<A, B>(for:info:policy:)(v0[2], v0[3], v0[4], v0[5], v0[10], v0[6], v0[9], v0[7]);
}

uint64_t sub_238092D60()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 80);
  v3 = *v1;
  *(_QWORD *)(v3 + 96) = v0;
  swift_task_dealloc();
  sub_238005240(v2, &qword_2568C7C50);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_238092DF0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t EnsembleHPKE.Follower.init(attestor:validator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  int *v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;

  v7 = (int *)type metadata accessor for EnsembleHPKE.Follower(0);
  *((_BYTE *)a3 + v7[7]) = 0;
  sub_23809318C();
  if (v3)
  {
    sub_237FFD540(a2, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
    return sub_238092C2C(a1);
  }
  else
  {
    *a3 = v8;
    sub_238093738(a2, (uint64_t)a3 + v7[5]);
    v16 = &type metadata for EnsembleAttestor;
    v17 = &protocol witness table for EnsembleAttestor;
    v10 = swift_allocObject();
    *(_QWORD *)&v15 = v10;
    v11 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v10 + 112) = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v10 + 128) = v11;
    *(_OWORD *)(v10 + 144) = *(_OWORD *)(a1 + 128);
    *(_QWORD *)(v10 + 160) = *(_QWORD *)(a1 + 144);
    v12 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v10 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v10 + 64) = v12;
    v13 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v10 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v10 + 96) = v13;
    v14 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v10 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v10 + 32) = v14;
    sub_237FFD540(a2, (uint64_t (*)(_QWORD))type metadata accessor for EnsembleValidator);
    return sub_23800A4E4(&v15, (uint64_t)a3 + v7[6]);
  }
}

uint64_t EnsembleHPKE.Follower.recipient<A>(for:encapsulatedKey:info:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;

  v9[9] = a8;
  v9[10] = v8;
  v9[7] = a6;
  v9[8] = a7;
  v9[5] = a4;
  v9[6] = a5;
  v9[3] = a2;
  v9[4] = a3;
  v9[2] = a1;
  v9[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C7C50);
  v9[12] = swift_task_alloc();
  return swift_task_switch();
}

void sub_238092FA8()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[12];
  type metadata accessor for EnsembleHPKE.Follower(0);
  _s16CloudAttestation17EnsembleValidatorV9policyFor4udid12fingerprintsQrSS_Say10Foundation4DataVGtF_0(0, 0, 0, v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[13] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_238093044;
  EnsembleHPKE.Follower.recipient<A, B>(for:encapsulatedKey:info:policy:)(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[12], v0[8]);
}

uint64_t sub_238093044()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 96);
  v3 = *v1;
  *(_QWORD *)(v3 + 112) = v0;
  swift_task_dealloc();
  sub_238005240(v2, &qword_2568C7C50);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2380930D4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL static EnsembleHPKE.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EnsembleHPKE.Error.hash(into:)()
{
  return sub_2380BE240();
}

uint64_t EnsembleHPKE.Error.hashValue.getter()
{
  sub_2380BE234();
  sub_2380BE240();
  return sub_2380BE264();
}

void sub_23809318C()
{
  uint64_t inited;
  void **v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void **v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  __SecAccessControl *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  const __CFDictionary *v32;
  SecKeyRef RandomKey;
  CFErrorRef v34;
  CFErrorRef *v35;
  void *v36;
  SecAccessControlRef v37;
  CFErrorRef error[51];

  error[49] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  if (!*MEMORY[0x24BDE8F88])
  {
    __break(1u);
LABEL_8:
    __break(1u);
  }
  v37 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F88], 0x40000000uLL, 0);
  if (!v37)
    goto LABEL_8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8B20);
  inited = swift_initStackObject();
  v1 = (void **)MEMORY[0x24BDE9050];
  *(_OWORD *)(inited + 16) = xmmword_2380BEB00;
  v2 = *v1;
  *(_QWORD *)(inited + 32) = *v1;
  v3 = (void *)*MEMORY[0x24BDE9060];
  type metadata accessor for CFString(0);
  *(_QWORD *)(inited + 40) = v3;
  v4 = (void *)*MEMORY[0x24BDE9048];
  *(_QWORD *)(inited + 64) = v5;
  *(_QWORD *)(inited + 72) = v4;
  v6 = v5;
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = sub_2380BDF34();
  type metadata accessor for CFNumber(0);
  *(_QWORD *)(inited + 80) = v10;
  v11 = (void *)*MEMORY[0x24BDE9158];
  *(_QWORD *)(inited + 104) = v12;
  *(_QWORD *)(inited + 112) = v11;
  v36 = (void *)*MEMORY[0x24BDE9170];
  v13 = (void **)MEMORY[0x24BDE9018];
  *(_QWORD *)(inited + 120) = *MEMORY[0x24BDE9170];
  v14 = *v13;
  *(_QWORD *)(inited + 144) = v6;
  *(_QWORD *)(inited + 152) = v14;
  v15 = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 160) = 0;
  v16 = (void *)*MEMORY[0x24BDE9468];
  *(_QWORD *)(inited + 184) = v15;
  *(_QWORD *)(inited + 192) = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8B28);
  v17 = swift_initStackObject();
  *(_OWORD *)(v17 + 16) = xmmword_2380BEAD0;
  v18 = (void *)*MEMORY[0x24BDE9398];
  *(_QWORD *)(v17 + 32) = *MEMORY[0x24BDE9398];
  *(_BYTE *)(v17 + 40) = 1;
  v19 = (void *)*MEMORY[0x24BDE93A8];
  *(_QWORD *)(v17 + 64) = v15;
  *(_QWORD *)(v17 + 72) = v19;
  *(_BYTE *)(v17 + 80) = 1;
  v20 = (void *)*MEMORY[0x24BDE8F48];
  *(_QWORD *)(v17 + 104) = v15;
  *(_QWORD *)(v17 + 112) = v20;
  type metadata accessor for SecAccessControl(0);
  *(_QWORD *)(v17 + 144) = v21;
  *(_QWORD *)(v17 + 120) = v37;
  v22 = v19;
  v23 = v11;
  v24 = v36;
  v25 = v14;
  v26 = v16;
  v27 = v20;
  v28 = v37;
  v29 = v18;
  sub_23800C1AC(v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8B30);
  sub_23809537C();
  v30 = sub_2380BDC40();
  swift_bridgeObjectRelease();
  type metadata accessor for CFDictionary(0);
  *(_QWORD *)(inited + 224) = v31;
  *(_QWORD *)(inited + 200) = v30;
  sub_23800C2D8(inited);
  error[0] = 0;
  sub_238001820(&qword_2568C5868, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_2380BF764);
  v32 = (const __CFDictionary *)sub_2380BDC40();
  swift_bridgeObjectRelease();
  RandomKey = SecKeyCreateRandomKey(v32, error);

  v34 = error[0];
  if (error[0])
  {
    type metadata accessor for CFError(0);
    sub_238001820((unint64_t *)&qword_2568C6378, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
    swift_allocError();
    *v35 = v34;
    swift_willThrow();

LABEL_6:
    return;
  }
  if (RandomKey)
    goto LABEL_6;
  __break(1u);
}

void sub_2380934D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t inited;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  const __CFData *v17;
  const __CFDictionary *v18;
  SecKeyRef v19;
  CFErrorRef v20;
  CFErrorRef *v21;
  CFErrorRef error[24];

  error[23] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v0 = sub_2380BD97C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)error - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380BD970();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6180);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2380BEAD0;
  *(_QWORD *)(inited + 32) = sub_2380BDD00();
  *(_QWORD *)(inited + 40) = v5;
  v6 = (void *)*MEMORY[0x24BDE9060];
  type metadata accessor for CFString(0);
  v8 = v7;
  *(_QWORD *)(inited + 72) = v7;
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 80) = sub_2380BDD00();
  *(_QWORD *)(inited + 88) = v9;
  v10 = (void *)*MEMORY[0x24BDE9030];
  *(_QWORD *)(inited + 120) = v8;
  *(_QWORD *)(inited + 96) = v10;
  *(_QWORD *)(inited + 128) = sub_2380BDD00();
  *(_QWORD *)(inited + 136) = v11;
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = 0;
  v12 = v6;
  v13 = v10;
  sub_23800C51C(inited);
  error[0] = 0;
  v14 = MEMORY[0x23B82A7EC]();
  v16 = v15;
  v17 = (const __CFData *)sub_2380BD358();
  sub_237FFBAB0(v14, v16);
  v18 = (const __CFDictionary *)sub_2380BDC40();
  swift_bridgeObjectRelease();
  v19 = SecKeyCreateWithData(v17, v18, error);

  if (v19)
    goto LABEL_4;
  v20 = error[0];
  if (error[0])
  {
    type metadata accessor for CFError(0);
    sub_238001820((unint64_t *)&qword_2568C6378, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
    swift_allocError();
    *v21 = v20;
    swift_willThrow();
LABEL_4:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return;
  }
  __break(1u);
}

uint64_t type metadata accessor for EnsembleHPKE.Follower(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C8AE0);
}

uint64_t sub_238093738(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EnsembleValidator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23809377C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  return swift_deallocObject();
}

unint64_t sub_2380937B4()
{
  unint64_t result;

  result = qword_2568C89E8;
  if (!qword_2568C89E8)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for EnsembleHPKE.Error, &type metadata for EnsembleHPKE.Error);
    atomic_store(result, (unint64_t *)&qword_2568C89E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnsembleHPKE()
{
  return &type metadata for EnsembleHPKE;
}

void **initializeBufferWithCopyOfBuffer for EnsembleHPKE.Leader(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  char *v11;
  uint64_t v12;
  int *v13;
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
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char *__dst;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_2380BDA60();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
    v12 = type metadata accessor for Release();
    *(_QWORD *)&v7[*(int *)(v12 + 20)] = *(_QWORD *)&v8[*(int *)(v12 + 20)];
    v13 = (int *)type metadata accessor for EnsembleValidator();
    v14 = v13[5];
    v15 = &v7[v14];
    v16 = &v8[v14];
    *(_OWORD *)v15 = *(_OWORD *)v16;
    *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
    *(_DWORD *)&v7[v13[6]] = *(_DWORD *)&v8[v13[6]];
    v7[v13[7]] = v8[v13[7]];
    v7[v13[8]] = v8[v13[8]];
    v7[v13[9]] = v8[v13[9]];
    v7[v13[10]] = v8[v13[10]];
    v7[v13[11]] = v8[v13[11]];
    *(_QWORD *)&v7[v13[12]] = *(_QWORD *)&v8[v13[12]];
    v17 = v13[13];
    __dst = &v7[v17];
    v18 = &v8[v17];
    v19 = sub_2380BD418();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v21(v18, 1, v19))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
      memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(__dst, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    v7[v13[14]] = v8[v13[14]];
    v7[v13[15]] = v8[v13[15]];
    v23 = a3[6];
    v24 = (char *)v5 + v23;
    v25 = (char *)a2 + v23;
    *v24 = *((_BYTE *)a2 + v23);
    *(_OWORD *)(v24 + 8) = *(_OWORD *)((char *)a2 + v23 + 8);
    v26 = *(_OWORD *)((char *)a2 + v23 + 48);
    *((_OWORD *)v24 + 3) = v26;
    (**(void (***)(uint64_t, uint64_t))(v26 - 8))((uint64_t)v5 + v23 + 24, (uint64_t)a2 + v23 + 24);
    v27 = *(_OWORD *)(v25 + 88);
    *(_OWORD *)(v24 + 88) = v27;
    (**(void (***)(uint64_t, uint64_t))(v27 - 8))((uint64_t)(v24 + 64), (uint64_t)(v25 + 64));
    v24[104] = v25[104];
    *(_WORD *)(v24 + 105) = *(_WORD *)(v25 + 105);
    v28 = *(_OWORD *)(v25 + 136);
    *(_OWORD *)(v24 + 136) = v28;
    (**(void (***)(uint64_t, uint64_t))(v28 - 8))((uint64_t)(v24 + 112), (uint64_t)(v25 + 112));
    *((_BYTE *)v5 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return v5;
}

uint64_t destroy for EnsembleHPKE.Leader(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_2380BDA60();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  type metadata accessor for Release();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for EnsembleValidator();
  swift_bridgeObjectRelease();
  v7 = &v4[*(int *)(v6 + 52)];
  v8 = sub_2380BD418();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  v10 = (char *)a1 + *(int *)(a2 + 24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v10 + 24));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v10 + 64));
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)(v10 + 112));
}

void **initializeWithCopy for EnsembleHPKE.Leader(void **a1, void **a2, int *a3)
{
  void *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  id v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v3 = *a2;
  *a1 = *a2;
  v4 = a3[5];
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2380BDA60();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  v9 = v3;
  v8(v5, v6, v7);
  v10 = type metadata accessor for Release();
  *(_QWORD *)&v5[*(int *)(v10 + 20)] = *(_QWORD *)&v6[*(int *)(v10 + 20)];
  v11 = (int *)type metadata accessor for EnsembleValidator();
  v12 = v11[5];
  v13 = &v5[v12];
  v14 = &v6[v12];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  *(_DWORD *)&v5[v11[6]] = *(_DWORD *)&v6[v11[6]];
  v5[v11[7]] = v6[v11[7]];
  v5[v11[8]] = v6[v11[8]];
  v5[v11[9]] = v6[v11[9]];
  v5[v11[10]] = v6[v11[10]];
  v5[v11[11]] = v6[v11[11]];
  *(_QWORD *)&v5[v11[12]] = *(_QWORD *)&v6[v11[12]];
  v15 = v11[13];
  v16 = &v5[v15];
  v17 = &v6[v15];
  v18 = sub_2380BD418();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v5[v11[14]] = v6[v11[14]];
  v5[v11[15]] = v6[v11[15]];
  v22 = a3[6];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  *v23 = *((_BYTE *)a2 + v22);
  *(_OWORD *)(v23 + 8) = *(_OWORD *)((char *)a2 + v22 + 8);
  v25 = *(_OWORD *)((char *)a2 + v22 + 48);
  *((_OWORD *)v23 + 3) = v25;
  (**(void (***)(uint64_t, uint64_t))(v25 - 8))((uint64_t)a1 + v22 + 24, (uint64_t)a2 + v22 + 24);
  v26 = *(_OWORD *)(v24 + 88);
  *(_OWORD *)(v23 + 88) = v26;
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))((uint64_t)(v23 + 64), (uint64_t)(v24 + 64));
  v23[104] = v24[104];
  *(_WORD *)(v23 + 105) = *(_WORD *)(v24 + 105);
  v27 = *(_OWORD *)(v24 + 136);
  *(_OWORD *)(v23 + 136) = v27;
  (**(void (***)(uint64_t, uint64_t))(v27 - 8))((uint64_t)(v23 + 112), (uint64_t)(v24 + 112));
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

void **assignWithCopy for EnsembleHPKE.Leader(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v31;
  void **v32;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v31 = a3;
  v32 = a2;
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2380BDA60();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = type metadata accessor for Release();
  *(_QWORD *)&v10[*(int *)(v13 + 20)] = *(_QWORD *)&v11[*(int *)(v13 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = (int *)type metadata accessor for EnsembleValidator();
  v15 = v14[5];
  v16 = &v10[v15];
  v17 = &v11[v15];
  *(_DWORD *)v16 = *(_DWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  v16[16] = v17[16];
  v16[17] = v17[17];
  v16[18] = v17[18];
  *((_DWORD *)v16 + 5) = *((_DWORD *)v17 + 5);
  *(_DWORD *)&v10[v14[6]] = *(_DWORD *)&v11[v14[6]];
  v10[v14[7]] = v11[v14[7]];
  v10[v14[8]] = v11[v14[8]];
  v10[v14[9]] = v11[v14[9]];
  v10[v14[10]] = v11[v14[10]];
  v10[v14[11]] = v11[v14[11]];
  *(_QWORD *)&v10[v14[12]] = *(_QWORD *)&v11[v14[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v14[13];
  v19 = &v10[v18];
  v20 = &v11[v18];
  v21 = sub_2380BD418();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  v10[v14[14]] = v11[v14[14]];
  v10[v14[15]] = v11[v14[15]];
  v27 = *(int *)(v31 + 24);
  v28 = (char *)a1 + v27;
  v29 = (uint64_t *)((char *)v32 + v27);
  *v28 = *((_BYTE *)v32 + v27);
  *((_QWORD *)v28 + 1) = *(void **)((char *)v32 + v27 + 8);
  *((_QWORD *)v28 + 2) = *(void **)((char *)v32 + v27 + 16);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + v27 + 24), (uint64_t *)((char *)v32 + v27 + 24));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v28 + 8, v29 + 8);
  v28[104] = *((_BYTE *)v29 + 104);
  v28[105] = *((_BYTE *)v29 + 105);
  v28[106] = *((_BYTE *)v29 + 106);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v28 + 14, v29 + 14);
  *((_BYTE *)a1 + *(int *)(v31 + 28)) = *((_BYTE *)v32 + *(int *)(v31 + 28));
  return a1;
}

_QWORD *initializeWithTake for EnsembleHPKE.Leader(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2380BDA60();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = type metadata accessor for Release();
  *(_QWORD *)&v7[*(int *)(v10 + 20)] = *(_QWORD *)&v8[*(int *)(v10 + 20)];
  v11 = (int *)type metadata accessor for EnsembleValidator();
  v12 = v11[5];
  v13 = &v7[v12];
  v14 = &v8[v12];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  *(_DWORD *)&v7[v11[6]] = *(_DWORD *)&v8[v11[6]];
  v7[v11[7]] = v8[v11[7]];
  v7[v11[8]] = v8[v11[8]];
  v7[v11[9]] = v8[v11[9]];
  v7[v11[10]] = v8[v11[10]];
  v7[v11[11]] = v8[v11[11]];
  *(_QWORD *)&v7[v11[12]] = *(_QWORD *)&v8[v11[12]];
  v15 = v11[13];
  v16 = &v7[v15];
  v17 = &v8[v15];
  v18 = sub_2380BD418();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v7[v11[14]] = v8[v11[14]];
  v7[v11[15]] = v8[v11[15]];
  v21 = a3[6];
  v22 = a3[7];
  v23 = (char *)a1 + v21;
  v24 = (char *)a2 + v21;
  v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  v26 = *((_OWORD *)v24 + 5);
  *((_OWORD *)v23 + 4) = *((_OWORD *)v24 + 4);
  *((_OWORD *)v23 + 5) = v26;
  v27 = *((_OWORD *)v24 + 3);
  *((_OWORD *)v23 + 2) = *((_OWORD *)v24 + 2);
  *((_OWORD *)v23 + 3) = v27;
  *((_QWORD *)v23 + 18) = *((_QWORD *)v24 + 18);
  v28 = *((_OWORD *)v24 + 8);
  v29 = *((_OWORD *)v24 + 6);
  *((_OWORD *)v23 + 7) = *((_OWORD *)v24 + 7);
  *((_OWORD *)v23 + 8) = v28;
  *((_OWORD *)v23 + 6) = v29;
  *((_BYTE *)a1 + v22) = *((_BYTE *)a2 + v22);
  return a1;
}

void **assignWithTake for EnsembleHPKE.Leader(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  uint64_t v31;
  void **v32;

  v6 = *a1;
  *a1 = *a2;

  v31 = a3;
  v32 = a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2380BDA60();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = type metadata accessor for Release();
  *(_QWORD *)&v8[*(int *)(v11 + 20)] = *(_QWORD *)&v9[*(int *)(v11 + 20)];
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for EnsembleValidator();
  v13 = v12[5];
  v14 = &v8[v13];
  v15 = &v9[v13];
  *(_DWORD *)v14 = *(_DWORD *)v15;
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  v14[16] = v15[16];
  v14[17] = v15[17];
  v14[18] = v15[18];
  *((_DWORD *)v14 + 5) = *((_DWORD *)v15 + 5);
  *(_DWORD *)&v8[v12[6]] = *(_DWORD *)&v9[v12[6]];
  v8[v12[7]] = v9[v12[7]];
  v8[v12[8]] = v9[v12[8]];
  v8[v12[9]] = v9[v12[9]];
  v8[v12[10]] = v9[v12[10]];
  v8[v12[11]] = v9[v12[11]];
  *(_QWORD *)&v8[v12[12]] = *(_QWORD *)&v9[v12[12]];
  swift_bridgeObjectRelease();
  v16 = v12[13];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = sub_2380BD418();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  v8[v12[14]] = v9[v12[14]];
  v8[v12[15]] = v9[v12[15]];
  v25 = *(int *)(v31 + 24);
  v26 = (char *)a1 + v25;
  v27 = (char *)v32 + v25;
  *v26 = *((_BYTE *)v32 + v25);
  *(_OWORD *)(v26 + 8) = *(_OWORD *)((char *)v32 + v25 + 8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + v25 + 24);
  *(_OWORD *)(v26 + 24) = *(_OWORD *)(v27 + 24);
  *(_OWORD *)(v26 + 40) = *(_OWORD *)(v27 + 40);
  *((_QWORD *)v26 + 7) = *((_QWORD *)v27 + 7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v26 + 64));
  v28 = *((_OWORD *)v27 + 5);
  *((_OWORD *)v26 + 4) = *((_OWORD *)v27 + 4);
  *((_OWORD *)v26 + 5) = v28;
  *((_QWORD *)v26 + 12) = *((_QWORD *)v27 + 12);
  v26[104] = v27[104];
  v26[105] = v27[105];
  v26[106] = v27[106];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v26 + 112));
  v29 = *((_OWORD *)v27 + 8);
  *((_OWORD *)v26 + 7) = *((_OWORD *)v27 + 7);
  *((_OWORD *)v26 + 8) = v29;
  *((_QWORD *)v26 + 18) = *((_QWORD *)v27 + 18);
  *((_BYTE *)a1 + *(int *)(v31 + 28)) = *((_BYTE *)v32 + *(int *)(v31 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for EnsembleHPKE.Leader()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for EnsembleHPKE.Leader()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238094564()
{
  return sub_238095218();
}

void **initializeBufferWithCopyOfBuffer for EnsembleHPKE.Follower(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  char *v11;
  uint64_t v12;
  int *v13;
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
  __int128 v24;
  char *__dst;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a3[5];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_2380BDA60();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
    v12 = type metadata accessor for Release();
    *(_QWORD *)&v7[*(int *)(v12 + 20)] = *(_QWORD *)&v8[*(int *)(v12 + 20)];
    v13 = (int *)type metadata accessor for EnsembleValidator();
    v14 = v13[5];
    v15 = &v7[v14];
    v16 = &v8[v14];
    *(_OWORD *)v15 = *(_OWORD *)v16;
    *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
    *(_DWORD *)&v7[v13[6]] = *(_DWORD *)&v8[v13[6]];
    v7[v13[7]] = v8[v13[7]];
    v7[v13[8]] = v8[v13[8]];
    v7[v13[9]] = v8[v13[9]];
    v7[v13[10]] = v8[v13[10]];
    v7[v13[11]] = v8[v13[11]];
    *(_QWORD *)&v7[v13[12]] = *(_QWORD *)&v8[v13[12]];
    v17 = v13[13];
    __dst = &v7[v17];
    v18 = &v8[v17];
    v19 = sub_2380BD418();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v21(v18, 1, v19))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
      memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(__dst, v18, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    v7[v13[14]] = v8[v13[14]];
    v7[v13[15]] = v8[v13[15]];
    v23 = a3[6];
    v24 = *(_OWORD *)((char *)a2 + v23 + 24);
    *(_OWORD *)((char *)v5 + v23 + 24) = v24;
    (**(void (***)(void))(v24 - 8))();
    *((_BYTE *)v5 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return v5;
}

uint64_t destroy for EnsembleHPKE.Follower(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_2380BDA60();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  type metadata accessor for Release();
  swift_bridgeObjectRelease();
  v6 = type metadata accessor for EnsembleValidator();
  swift_bridgeObjectRelease();
  v7 = &v4[*(int *)(v6 + 52)];
  v8 = sub_2380BD418();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + *(int *)(a2 + 24));
}

void **initializeWithCopy for EnsembleHPKE.Follower(void **a1, void **a2, int *a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  id v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  char *__dst;

  v4 = *a2;
  *a1 = *a2;
  v5 = a3[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2380BDA60();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v10 = v4;
  v9(v6, v7, v8);
  v11 = type metadata accessor for Release();
  *(_QWORD *)&v6[*(int *)(v11 + 20)] = *(_QWORD *)&v7[*(int *)(v11 + 20)];
  v12 = (int *)type metadata accessor for EnsembleValidator();
  v13 = v12[5];
  v14 = &v6[v13];
  v15 = &v7[v13];
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  *(_DWORD *)&v6[v12[6]] = *(_DWORD *)&v7[v12[6]];
  v6[v12[7]] = v7[v12[7]];
  v6[v12[8]] = v7[v12[8]];
  v6[v12[9]] = v7[v12[9]];
  v6[v12[10]] = v7[v12[10]];
  v6[v12[11]] = v7[v12[11]];
  *(_QWORD *)&v6[v12[12]] = *(_QWORD *)&v7[v12[12]];
  v16 = v12[13];
  __dst = &v6[v16];
  v17 = &v7[v16];
  v18 = sub_2380BD418();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(__dst, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(__dst, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  v6[v12[14]] = v7[v12[14]];
  v6[v12[15]] = v7[v12[15]];
  v22 = a3[6];
  v23 = *(_OWORD *)((char *)a2 + v22 + 24);
  *(_OWORD *)((char *)a1 + v22 + 24) = v23;
  (**(void (***)(void))(v23 - 8))();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

void **assignWithCopy for EnsembleHPKE.Follower(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v28;
  void **v29;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v28 = a3;
  v29 = a2;
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2380BDA60();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = type metadata accessor for Release();
  *(_QWORD *)&v10[*(int *)(v13 + 20)] = *(_QWORD *)&v11[*(int *)(v13 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = (int *)type metadata accessor for EnsembleValidator();
  v15 = v14[5];
  v16 = &v10[v15];
  v17 = &v11[v15];
  *(_DWORD *)v16 = *(_DWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  v16[16] = v17[16];
  v16[17] = v17[17];
  v16[18] = v17[18];
  *((_DWORD *)v16 + 5) = *((_DWORD *)v17 + 5);
  *(_DWORD *)&v10[v14[6]] = *(_DWORD *)&v11[v14[6]];
  v10[v14[7]] = v11[v14[7]];
  v10[v14[8]] = v11[v14[8]];
  v10[v14[9]] = v11[v14[9]];
  v10[v14[10]] = v11[v14[10]];
  v10[v14[11]] = v11[v14[11]];
  *(_QWORD *)&v10[v14[12]] = *(_QWORD *)&v11[v14[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v14[13];
  v19 = &v10[v18];
  v20 = &v11[v18];
  v21 = sub_2380BD418();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  v10[v14[14]] = v11[v14[14]];
  v10[v14[15]] = v11[v14[15]];
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + *(int *)(v28 + 24)), (uint64_t *)((char *)v29 + *(int *)(v28 + 24)));
  *((_BYTE *)a1 + *(int *)(v28 + 28)) = *((_BYTE *)v29 + *(int *)(v28 + 28));
  return a1;
}

_QWORD *initializeWithTake for EnsembleHPKE.Follower(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2380BDA60();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = type metadata accessor for Release();
  *(_QWORD *)&v7[*(int *)(v10 + 20)] = *(_QWORD *)&v8[*(int *)(v10 + 20)];
  v11 = (int *)type metadata accessor for EnsembleValidator();
  v12 = v11[5];
  v13 = &v7[v12];
  v14 = &v8[v12];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  *(_DWORD *)&v7[v11[6]] = *(_DWORD *)&v8[v11[6]];
  v7[v11[7]] = v8[v11[7]];
  v7[v11[8]] = v8[v11[8]];
  v7[v11[9]] = v8[v11[9]];
  v7[v11[10]] = v8[v11[10]];
  v7[v11[11]] = v8[v11[11]];
  *(_QWORD *)&v7[v11[12]] = *(_QWORD *)&v8[v11[12]];
  v15 = v11[13];
  v16 = &v7[v15];
  v17 = &v8[v15];
  v18 = sub_2380BD418();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v7[v11[14]] = v8[v11[14]];
  v7[v11[15]] = v8[v11[15]];
  v21 = a3[6];
  v22 = a3[7];
  v23 = (char *)a1 + v21;
  v24 = (char *)a2 + v21;
  v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  *((_QWORD *)v23 + 4) = *((_QWORD *)v24 + 4);
  *((_BYTE *)a1 + v22) = *((_BYTE *)a2 + v22);
  return a1;
}

void **assignWithTake for EnsembleHPKE.Follower(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;
  uint64_t v30;
  void **v31;

  v6 = *a1;
  *a1 = *a2;

  v30 = a3;
  v31 = a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2380BDA60();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = type metadata accessor for Release();
  *(_QWORD *)&v8[*(int *)(v11 + 20)] = *(_QWORD *)&v9[*(int *)(v11 + 20)];
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for EnsembleValidator();
  v13 = v12[5];
  v14 = &v8[v13];
  v15 = &v9[v13];
  *(_DWORD *)v14 = *(_DWORD *)v15;
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  v14[16] = v15[16];
  v14[17] = v15[17];
  v14[18] = v15[18];
  *((_DWORD *)v14 + 5) = *((_DWORD *)v15 + 5);
  *(_DWORD *)&v8[v12[6]] = *(_DWORD *)&v9[v12[6]];
  v8[v12[7]] = v9[v12[7]];
  v8[v12[8]] = v9[v12[8]];
  v8[v12[9]] = v9[v12[9]];
  v8[v12[10]] = v9[v12[10]];
  v8[v12[11]] = v9[v12[11]];
  *(_QWORD *)&v8[v12[12]] = *(_QWORD *)&v9[v12[12]];
  swift_bridgeObjectRelease();
  v16 = v12[13];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = sub_2380BD418();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v23)
  {
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
LABEL_7:
  v8[v12[14]] = v9[v12[14]];
  v8[v12[15]] = v9[v12[15]];
  v25 = *(int *)(v30 + 24);
  v26 = (char *)a1 + v25;
  v27 = (char *)v31 + v25;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + v25);
  v28 = *((_OWORD *)v27 + 1);
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *((_OWORD *)v26 + 1) = v28;
  *((_QWORD *)v26 + 4) = *((_QWORD *)v27 + 4);
  *((_BYTE *)a1 + *(int *)(v30 + 28)) = *((_BYTE *)v31 + *(int *)(v30 + 28));
  return a1;
}

uint64_t getEnumTagSinglePayload for EnsembleHPKE.Follower()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm_0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for EnsembleValidator();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for EnsembleHPKE.Follower()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *__swift_store_extra_inhabitant_indexTm_0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for EnsembleValidator();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23809520C()
{
  return sub_238095218();
}

uint64_t sub_238095218()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for EnsembleValidator();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EnsembleHPKE.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380952EC + 4 * byte_2380C4A35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_238095320 + 4 * asc_2380C4A30[v4]))();
}

uint64_t sub_238095320(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_238095328(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x238095330);
  return result;
}

uint64_t sub_23809533C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x238095344);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_238095348(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_238095350(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EnsembleHPKE.Error()
{
  return &type metadata for EnsembleHPKE.Error;
}

ValueMetadata *type metadata accessor for SendableSecKey()
{
  return &type metadata for SendableSecKey;
}

unint64_t sub_23809537C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2568C8B38;
  if (!qword_2568C8B38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568C8B30);
    v2 = sub_238001820(&qword_2568C5868, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_2380BF764);
    result = MEMORY[0x23B82B770](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568C8B38);
  }
  return result;
}

uint64_t sub_2380953F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for SEP()
{
  return &type metadata for SEP;
}

_BYTE *HardwareIdentifiersPolicy.init(matches:)@<X0>(_BYTE *result@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  char v4;
  char v5;

  v4 = result[1];
  v5 = result[2];
  *(_BYTE *)a4 = *result;
  *(_BYTE *)(a4 + 1) = v4;
  *(_BYTE *)(a4 + 2) = v5;
  *(_DWORD *)(a4 + 4) = a2;
  *(_DWORD *)(a4 + 8) = a3;
  *(_QWORD *)(a4 + 12) = 2;
  *(_DWORD *)(a4 + 20) = 0;
  return result;
}

uint64_t sub_23809547C()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C9F90);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C9F90);
  return sub_2380BD7FC();
}

unsigned __int8 *HardwareIdentifiersPolicy.init(_:matches:)@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, int a3@<W2>, _BYTE *a4@<X3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;

  v7 = *result;
  v8 = result[2];
  v9 = a4[1];
  v10 = a4[2];
  v11 = 256;
  if (!result[1])
    v11 = 0;
  *(_BYTE *)a7 = *a4;
  *(_BYTE *)(a7 + 1) = v9;
  *(_BYTE *)(a7 + 2) = v10;
  *(_DWORD *)(a7 + 4) = a5;
  *(_DWORD *)(a7 + 8) = a6;
  *(_QWORD *)(a7 + 12) = v11 | v7 | (v8 << 16) | (a2 << 32);
  *(_DWORD *)(a7 + 20) = a3;
  return result;
}

uint64_t HardwareIdentifiersPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 44) = *(_BYTE *)v2;
  *(_BYTE *)(v3 + 45) = *(_BYTE *)(v2 + 1);
  *(_BYTE *)(v3 + 46) = *(_BYTE *)(v2 + 2);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v2 + 4);
  v4 = *(_QWORD *)(v2 + 12);
  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = v4;
  *(_DWORD *)(v3 + 40) = *(_DWORD *)(v2 + 20);
  return swift_task_switch();
}

uint64_t sub_2380955D8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t (*v23)(void);
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  AttestationPolicyContext.validatedAttestation.getter((uint64_t)&v25);
  v2 = v25;
  v1 = v26;
  v4 = v27;
  v3 = v28;
  if (v26 >> 60 == 15)
  {
    v5 = 0;
    v6 = 0;
    LOBYTE(v7) = 1;
    LODWORD(v8) = 2;
  }
  else
  {
    v29 = 0;
    sub_237FFBA20(v25, v26);
    sub_237FFBA20(v4, v3);
    sub_238033F18(v2, v1, v4, v3);
    sub_23804E940(v2, v1, v4, v3);
    v6 = v25;
    LODWORD(v8) = v27;
    sub_237FFBA20(v2, v1);
    sub_237FFBA20(v4, v3);
    sub_2380349A0(v2, v1, v4, v3);
    v5 = v9;
    v7 = HIDWORD(v9) & 1;
    sub_23804E940(v2, v1, v4, v3);
  }
  if (*(_QWORD *)(v0 + 24) == 2)
  {
    if (v8 == 2)
      v10 = 1;
    else
      v10 = v7;
    if ((v10 & 1) != 0)
    {
      sub_2380959A8();
      swift_allocError();
      v11[1] = 0;
      v11[2] = 0;
      *v11 = 2;
LABEL_24:
      swift_willThrow();
      sub_23804E940(v2, v1, v4, v3);
      v23 = *(uint64_t (**)(void))(v0 + 8);
      return v23();
    }
  }
  else
  {
    v6 = HIDWORD(*(_QWORD *)(v0 + 24));
    v5 = *(_DWORD *)(v0 + 40);
    v8 = *(_QWORD *)(v0 + 24);
  }
  if (*(_BYTE *)(v0 + 45))
    v12 = 256;
  else
    v12 = 0;
  if (!sub_23809595C(v8 & 0xFF0101, v6, v5, v12 | (*(unsigned __int8 *)(v0 + 46) << 16) | *(unsigned __int8 *)(v0 + 44), *(_DWORD *)(v0 + 32), *(_DWORD *)(v0 + 36)))
  {
    v17 = *(_QWORD *)(v0 + 32);
    v18 = v8 & 0xFF0101 | (v6 << 32);
    v19 = 0x100000000;
    if (!*(_BYTE *)(v0 + 44))
      v19 = 0;
    v20 = 0x10000000000;
    if (!*(_BYTE *)(v0 + 45))
      v20 = 0;
    v21 = v20 | v19 | ((unint64_t)*(unsigned __int8 *)(v0 + 46) << 48) | v5;
    sub_2380959A8();
    swift_allocError();
    *v22 = v18;
    v22[1] = v21;
    v22[2] = v17;
    goto LABEL_24;
  }
  if (qword_2568C5070 != -1)
    swift_once();
  v13 = sub_2380BD808();
  __swift_project_value_buffer(v13, (uint64_t)qword_2568C9F90);
  v14 = sub_2380BD7F0();
  v15 = sub_2380BDF70();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_237FF6000, v14, v15, "AttestationBundle passed HardwareIdentifiersPolicy: device has expected hardware identifiers", v16, 2u);
    MEMORY[0x23B82B830](v16, -1, -1);

    sub_23804E940(v2, v1, v4, v3);
  }
  else
  {
    sub_23804E940(v2, v1, v4, v3);

  }
  v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

BOOL sub_23809595C(unsigned int a1, int a2, int a3, unsigned int a4, int a5, int a6)
{
  int v6;
  int v7;
  int v8;

  v6 = HIWORD(a1) & 3;
  if ((a1 & 0x100) != 0)
    v6 |= 4u;
  v7 = HIWORD(a4) & 3;
  if ((a4 & 0x100) != 0)
    v7 = HIWORD(a4) & 3 | 4;
  if ((a1 & 1) != 0)
    v8 = 8;
  else
    v8 = 0;
  return (v8 | v6) == (v7 & 0xFFFFFFF7 | (8 * (a4 & 1))) && a2 == a5 && a3 == a6;
}

unint64_t sub_2380959A8()
{
  unint64_t result;

  result = qword_2568C8B48;
  if (!qword_2568C8B48)
  {
    result = MEMORY[0x23B82B770](&unk_2380C4BD8, &type metadata for HardwareIdentifiersPolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8B48);
  }
  return result;
}

uint64_t sub_2380959EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_238013814;
  return HardwareIdentifiersPolicy.evaluate(bundle:context:)((uint64_t)v4, a2);
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HardwareIdentifiersPolicy(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[24])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HardwareIdentifiersPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HardwareIdentifiersPolicy()
{
  return &type metadata for HardwareIdentifiersPolicy;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HardwareIdentifiersPolicy.IdentifiersLoader(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[12])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  if (v5 + 1 >= 2)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HardwareIdentifiersPolicy.IdentifiersLoader(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 12) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 12) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_238095BA0(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
  }
  else if (a2)
  {
    *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HardwareIdentifiersPolicy.IdentifiersLoader()
{
  return &type metadata for HardwareIdentifiersPolicy.IdentifiersLoader;
}

uint64_t getEnumTagSinglePayload for HardwareIdentifiersPolicy.Error(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[24])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  if (v5 + 1 >= 2)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HardwareIdentifiersPolicy.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 12) = 0;
    *(_QWORD *)(result + 4) = 0;
    *(_DWORD *)(result + 20) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

_QWORD *sub_238095C78(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 - 255;
  }
  else if (a2)
  {
    *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HardwareIdentifiersPolicy.Error()
{
  return &type metadata for HardwareIdentifiersPolicy.Error;
}

double EnsembleAttestor.init()@<D0>(uint64_t a1@<X8>)
{
  char v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  char v8;
  _BYTE v9[32];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _UNKNOWN **v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _UNKNOWN **v27;

  *(_OWORD *)(a1 + 8) = xmmword_2380C1230;
  *(_QWORD *)(a1 + 136) = &type metadata for SEP.PhysicalDevice;
  *(_QWORD *)(a1 + 144) = &protocol witness table for SEP.PhysicalDevice;
  *(_OWORD *)&v9[8] = xmmword_2380C1230;
  *((_QWORD *)&v16 + 1) = &type metadata for SEP.PhysicalDevice;
  v17 = &protocol witness table for SEP.PhysicalDevice;
  swift_beginAccess();
  v2 = byte_2542C9B90;
  if (byte_2542C9B90 == 9)
  {
    static Environment.default.getter(&v8);
    v2 = v8;
  }
  sub_2380470CC(0, v2, (uint64_t)&v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  v14 = v24;
  v15 = v25;
  v16 = v26;
  v17 = v27;
  v10 = v20;
  v11 = v21;
  v12 = v22;
  v13 = v23;
  *(_OWORD *)v9 = v18;
  *(_OWORD *)&v9[16] = v19;
  __swift_destroy_boxed_opaque_existential_1(a1 + 112);
  v3 = v25;
  *(_OWORD *)(a1 + 96) = v24;
  *(_OWORD *)(a1 + 112) = v3;
  *(_OWORD *)(a1 + 128) = v26;
  *(_QWORD *)(a1 + 144) = v27;
  v4 = v21;
  *(_OWORD *)(a1 + 32) = v20;
  *(_OWORD *)(a1 + 48) = v4;
  v5 = v23;
  *(_OWORD *)(a1 + 64) = v22;
  *(_OWORD *)(a1 + 80) = v5;
  result = *(double *)&v18;
  v7 = v19;
  *(_OWORD *)a1 = v18;
  *(_OWORD *)(a1 + 16) = v7;
  return result;
}

__n128 EnsembleAttestor.init(attestor:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;

  v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 112) = v2;
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 128);
  *(_QWORD *)(a2 + 144) = *(_QWORD *)(a1 + 144);
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v3;
  v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v4;
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v6;
  return result;
}

double EnsembleAttestor.init<A>(assetProvider:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double result;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[9];
  uint64_t v19;

  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  HIBYTE(v17) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a2);
  v11 = NodeAttestor.init<A, B>(transparencyProver:assetProvider:)((uint64_t)&v17 + 7, (uint64_t)v10, (uint64_t)&type metadata for NopTransparencyLog, a2, (uint64_t)&protocol witness table for NopTransparencyLog, a3, (uint64_t)v18);
  (*(void (**)(uint64_t, uint64_t, double))(v8 + 8))(a1, a2, v11);
  v12 = v18[7];
  *(_OWORD *)(a4 + 96) = v18[6];
  *(_OWORD *)(a4 + 112) = v12;
  *(_OWORD *)(a4 + 128) = v18[8];
  *(_QWORD *)(a4 + 144) = v19;
  v13 = v18[3];
  *(_OWORD *)(a4 + 32) = v18[2];
  *(_OWORD *)(a4 + 48) = v13;
  v14 = v18[5];
  *(_OWORD *)(a4 + 64) = v18[4];
  *(_OWORD *)(a4 + 80) = v14;
  result = *(double *)v18;
  v16 = v18[1];
  *(_OWORD *)a4 = v18[0];
  *(_OWORD *)(a4 + 16) = v16;
  return result;
}

uint64_t EnsembleAttestor.attest(key:expiration:nonce:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_238013814;
  return NodeAttestor.attest(key:expiration:nonce:)(a1, a2, a3, a4, a5);
}

ValueMetadata *type metadata accessor for EnsembleAttestor()
{
  return &type metadata for EnsembleAttestor;
}

_BYTE *DeviceModePolicy.init(restrictedExecution:ephemeralData:developer:)@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4;
  unsigned int v5;

  v4 = *a3;
  v5 = 0x10002u >> (8 * *a2);
  *(_BYTE *)a4 = 0x10002u >> (8 * *result);
  *(_BYTE *)(a4 + 1) = v5;
  *(_BYTE *)(a4 + 2) = 0x10002u >> (8 * v4);
  *(_BYTE *)(a4 + 5) = 0;
  *(_WORD *)(a4 + 3) = 2;
  return result;
}

CloudAttestation::DeviceModePolicy::Constraint __swiftcall DeviceModePolicy.Constraint.init(_:)(CloudAttestation::DeviceModePolicy::Constraint result)
{
  char *v1;
  char v2;

  if ((result & 1) != 0)
    v2 = 2;
  else
    v2 = 1;
  *v1 = v2;
  return result;
}

uint64_t sub_238096018()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C9FA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C9FA8);
  return sub_2380BD7FC();
}

unsigned __int8 *DeviceModePolicy.init(_:restrictedExecution:ephemeralData:developer:)@<X0>(unsigned __int8 *result@<X0>, _BYTE *a2@<X1>, _BYTE *a3@<X2>, _BYTE *a4@<X3>, uint64_t a5@<X8>)
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  __int16 v8;
  __int16 v9;

  v5 = result[2];
  v6 = 0x10002u >> (8 * *a3);
  v7 = 0x10002u >> (8 * *a4);
  if (result[1])
    v8 = 256;
  else
    v8 = 0;
  v9 = v8 | *result;
  *(_BYTE *)a5 = 0x10002u >> (8 * *a2);
  *(_BYTE *)(a5 + 1) = v6;
  *(_BYTE *)(a5 + 2) = v7;
  *(_BYTE *)(a5 + 5) = v5 != 0;
  *(_WORD *)(a5 + 3) = v9;
  return result;
}

uint64_t DeviceModePolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v4;

  *(_QWORD *)(v3 + 16) = a2;
  *(_BYTE *)(v3 + 28) = *(_BYTE *)v2;
  *(_WORD *)(v3 + 29) = *(_WORD *)(v2 + 1);
  v4 = *(_WORD *)(v2 + 3);
  *(_BYTE *)(v3 + 26) = *(_BYTE *)(v2 + 5);
  *(_WORD *)(v3 + 24) = v4;
  return swift_task_switch();
}

uint64_t sub_238096144()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  int v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  int v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  int v42;
  _WORD *v43;
  uint64_t (*v44)(void);
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v1 = *(unsigned __int16 *)(v0 + 24) | (*(unsigned __int8 *)(v0 + 26) << 16);
  if (*(_WORD *)(v0 + 24) == 2)
  {
    v2 = **(_QWORD **)(v0 + 16);
    v54 = v2;
    AttestationPolicyContext.validatedAttestation.getter((uint64_t)&v50);
    v3 = v51;
    if (v51 >> 60 == 15)
    {
      v4 = 0;
    }
    else
    {
      v8 = v52;
      v7 = v53;
      v9 = v50;
      sub_2380346E0(v50, v51, v52, v53);
      v11 = v10;
      sub_23804E940(v9, v3, v8, v7);
      v4 = v11 & 1;
    }
    v54 = v2;
    AttestationPolicyContext.validatedAttestation.getter((uint64_t)&v50);
    v12 = v51;
    if (v51 >> 60 == 15)
    {
      v5 = 0;
    }
    else
    {
      v14 = v52;
      v13 = v53;
      v15 = v50;
      sub_23803472C(v50, v51, v52, v53);
      v17 = v16;
      sub_23804E940(v15, v12, v14, v13);
      v5 = v17 & 1;
    }
    v54 = v2;
    AttestationPolicyContext.validatedAttestation.getter((uint64_t)&v50);
    v18 = v51;
    if (v51 >> 60 == 15)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v20 = v52;
      v19 = v53;
      v6 = v50;
      sub_238034954(v50, v51, v52, v53);
      v22 = v21;
      v23 = v21;
      sub_23804E940(v6, v18, v20, v19);
      LOBYTE(v6) = (v23 == 2) | v22;
    }
  }
  else
  {
    v4 = *(_WORD *)(v0 + 24) & 1;
    v5 = (v1 >> 8) & 1;
    LODWORD(v6) = HIWORD(v1) & 1;
  }
  v24 = *(unsigned __int8 *)(v0 + 28);
  if (v24 == 2)
  {
    if (qword_2568C5078 != -1)
      swift_once();
    v25 = sub_2380BD808();
    __swift_project_value_buffer(v25, (uint64_t)qword_2568C9FA8);
    v26 = sub_2380BD7F0();
    v27 = sub_2380BDF70();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_237FF6000, v26, v27, "Skipping assertion of Restricted Execution Mode", v28, 2u);
      MEMORY[0x23B82B830](v28, -1, -1);
    }

  }
  else
  {
    v29 = v24 & 1;
    if (v4 != v29)
    {
      v30 = v4 | ((_WORD)v29 << 8);
      goto LABEL_36;
    }
  }
  v31 = *(unsigned __int8 *)(v0 + 29);
  if (v31 != 2)
  {
    v36 = v31 & 1;
    if (v5 == v36)
      goto LABEL_28;
    v30 = v5 | ((_WORD)v36 << 8) | 0x4000;
LABEL_36:
    sub_238096930();
    swift_allocError();
    *v43 = v30;
    swift_willThrow();
    v44 = *(uint64_t (**)(void))(v0 + 8);
    return v44();
  }
  if (qword_2568C5078 != -1)
    swift_once();
  v32 = sub_2380BD808();
  __swift_project_value_buffer(v32, (uint64_t)qword_2568C9FA8);
  v33 = sub_2380BD7F0();
  v34 = sub_2380BDF70();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_237FF6000, v33, v34, "Skipping assertion of Ephemeral Data Mode", v35, 2u);
    MEMORY[0x23B82B830](v35, -1, -1);
  }

LABEL_28:
  v37 = *(unsigned __int8 *)(v0 + 30);
  if (v37 == 2)
  {
    if (qword_2568C5078 != -1)
      swift_once();
    v38 = sub_2380BD808();
    __swift_project_value_buffer(v38, (uint64_t)qword_2568C9FA8);
    v39 = sub_2380BD7F0();
    v40 = sub_2380BDF70();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_237FF6000, v39, v40, "Skipping developer mode restriction", v41, 2u);
      MEMORY[0x23B82B830](v41, -1, -1);
    }

    goto LABEL_37;
  }
  v42 = v37 & 1;
  if ((v6 & 1) != v42)
  {
    v30 = v6 & 1 | ((_WORD)v42 << 8) | 0x8000;
    goto LABEL_36;
  }
LABEL_37:
  if (qword_2568C5078 != -1)
    swift_once();
  v45 = sub_2380BD808();
  __swift_project_value_buffer(v45, (uint64_t)qword_2568C9FA8);
  v46 = sub_2380BD7F0();
  v47 = sub_2380BDF70();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v48 = 0;
    _os_log_impl(&dword_237FF6000, v46, v47, "AttestationBundle passed DeviceModePolicy: device has satisfactory REM, EphDM, and DevMode states", v48, 2u);
    MEMORY[0x23B82B830](v48, -1, -1);
  }

  v44 = *(uint64_t (**)(void))(v0 + 8);
  return v44();
}

uint64_t sub_238096640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int16 v6;

  v5 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)v5 = v3;
  *(_QWORD *)(v5 + 8) = sub_238013814;
  *(_QWORD *)(v5 + 16) = a2;
  *(_BYTE *)(v5 + 28) = *(_BYTE *)v2;
  *(_WORD *)(v5 + 29) = *(_WORD *)(v2 + 1);
  v6 = *(_WORD *)(v2 + 3);
  *(_BYTE *)(v5 + 26) = *(_BYTE *)(v2 + 5);
  *(_WORD *)(v5 + 24) = v6;
  return swift_task_switch();
}

uint64_t DeviceModePolicy.Mode.restrictedExecution.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t DeviceModePolicy.Mode.ephemeralData.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t DeviceModePolicy.Mode.developer.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t DeviceModePolicy.Mode.hash(into:)()
{
  sub_2380BE24C();
  sub_2380BE24C();
  return sub_2380BE24C();
}

BOOL static DeviceModePolicy.Mode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a1[1] ^ a2[1] | a2[2] ^ a1[2]) & 1) == 0;
}

uint64_t DeviceModePolicy.Mode.hashValue.getter()
{
  sub_2380BE234();
  sub_2380BE24C();
  sub_2380BE24C();
  sub_2380BE24C();
  return sub_2380BE264();
}

uint64_t sub_2380967C8()
{
  sub_2380BE24C();
  sub_2380BE24C();
  return sub_2380BE24C();
}

uint64_t sub_238096810()
{
  sub_2380BE234();
  sub_2380BE24C();
  sub_2380BE24C();
  sub_2380BE24C();
  return sub_2380BE264();
}

BOOL sub_238096878(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a1[1] ^ a2[1] | a2[2] ^ a1[2]) & 1) == 0;
}

BOOL static DeviceModePolicy.Constraint.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DeviceModePolicy.Constraint.hash(into:)()
{
  return sub_2380BE240();
}

uint64_t DeviceModePolicy.Constraint.hashValue.getter()
{
  sub_2380BE234();
  sub_2380BE240();
  return sub_2380BE264();
}

unint64_t sub_238096930()
{
  unint64_t result;

  result = qword_2568C8B70;
  if (!qword_2568C8B70)
  {
    result = MEMORY[0x23B82B770](&unk_2380C4DA4, &type metadata for DeviceModePolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8B70);
  }
  return result;
}

unint64_t sub_238096978()
{
  unint64_t result;

  result = qword_2568C8B80;
  if (!qword_2568C8B80)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for DeviceModePolicy.Mode, &type metadata for DeviceModePolicy.Mode);
    atomic_store(result, (unint64_t *)&qword_2568C8B80);
  }
  return result;
}

unint64_t sub_2380969C0()
{
  unint64_t result;

  result = qword_2568C8B88;
  if (!qword_2568C8B88)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for DeviceModePolicy.Constraint, &type metadata for DeviceModePolicy.Constraint);
    atomic_store(result, (unint64_t *)&qword_2568C8B88);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceModePolicy()
{
  return &type metadata for DeviceModePolicy;
}

ValueMetadata *type metadata accessor for DeviceModePolicy.Mode()
{
  return &type metadata for DeviceModePolicy.Mode;
}

uint64_t storeEnumTagSinglePayload for DeviceModePolicy.Constraint(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_238096A70 + 4 * byte_2380C4C55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_238096AA4 + 4 * asc_2380C4C50[v4]))();
}

uint64_t sub_238096AA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_238096AAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x238096AB4);
  return result;
}

uint64_t sub_238096AC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x238096AC8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_238096ACC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_238096AD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceModePolicy.Constraint()
{
  return &type metadata for DeviceModePolicy.Constraint;
}

ValueMetadata *type metadata accessor for DeviceModePolicy.ModeLoader()
{
  return &type metadata for DeviceModePolicy.ModeLoader;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceModePolicy.Error(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x3FFE)
    goto LABEL_17;
  if (a2 + 49154 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 49154 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 49154;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 49154;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 49154;
  }
LABEL_17:
  v6 = (*a1 & 0x3E00 | (*a1 >> 14) & 0xFFFFFE03 | (4 * (*a1 >> 1))) ^ 0x3FFF;
  if (v6 >= 0x3FFD)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for DeviceModePolicy.Error(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  uint64_t v5;

  if (a3 + 49154 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 49154 < 0xFF0000)
    v4 = 1;
  else
    v4 = v3;
  if (a3 >= 0x3FFE)
    v5 = v4;
  else
    v5 = 0;
  if (a2 <= 0x3FFD)
    return ((uint64_t (*)(void))((char *)&loc_238096C10 + 4 * byte_2380C4C5F[v5]))();
  *a1 = a2 - 16382;
  return ((uint64_t (*)(void))((char *)sub_238096C48 + 4 * byte_2380C4C5A[v5]))();
}

uint64_t sub_238096C48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_238096C50(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x238096C58);
  return result;
}

uint64_t sub_238096C78(uint64_t result, int a2)
{
  unsigned int v2;

  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x238096C80);
  v2 = ((-a2 >> 2) & 0xFFF) - (a2 << 12);
  *(_WORD *)result = (4 * v2) & 0xFE00 | (2 * (v2 & 0x7F));
  return result;
}

uint64_t sub_238096C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_238096C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_238096C98(unsigned __int16 *a1)
{
  return *a1 >> 14;
}

_WORD *sub_238096CA4(_WORD *result)
{
  *result &= 0x3FFFu;
  return result;
}

_WORD *sub_238096CB4(_WORD *result, __int16 a2)
{
  *result = *result & 0x101 | (a2 << 14);
  return result;
}

ValueMetadata *type metadata accessor for DeviceModePolicy.Error()
{
  return &type metadata for DeviceModePolicy.Error;
}

uint64_t sub_238096CD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29[2];

  v22 = a3;
  v25 = sub_2380BDB20();
  v23 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v24 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2380BDA30();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_2380BDA60();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - v12;
  v27 = a1;
  v28 = a2;
  sub_23802FBC8(a1, a2);
  sub_2380BDB80();
  v14 = v26;
  sub_2380BDB98();
  if (v14)
  {
    v29[0] = (uint64_t)v14;
    v16 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
    v17 = v24;
    v18 = v25;
    if (swift_dynamicCast())
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v18);
      v29[0] = (uint64_t)v14;
      sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
      swift_allocError();
      v19 = v14;
      swift_dynamicCast();
    }
    else
    {
      swift_getErrorValue();
      sub_2380BE1EC();
      sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
      swift_allocError();
      sub_2380BDB08();
      swift_bridgeObjectRelease();
    }
    swift_willThrow();

    return sub_237FFBAB0(v27, v28);
  }
  else
  {
    v15 = v22;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    ProvisioningCertificate.DeviceIdentity.init(extensionValue:)((uint64_t)v11, v29);
    sub_237FFBAB0(v27, v28);
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    v21 = v29[1];
    *v15 = v29[0];
    v15[1] = v21;
  }
  return result;
}

uint64_t sub_238097030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  char *v17;
  id v18;
  uint64_t result;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;

  v35 = a3;
  v40 = sub_2380BDB20();
  v37 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v39 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2380BDD48();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_2380BDA30();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_2380BDA60();
  v36 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - v11;
  v41 = a1;
  v42 = a2;
  sub_23802FBC8(a1, a2);
  sub_2380BDB80();
  v13 = v43;
  sub_2380BDB98();
  v14 = v13;
  if (v13)
  {
    v15 = v40;
  }
  else
  {
    v20 = v35;
    v21 = v36;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v38, v12, v8);
    v22 = sub_2380BDA54();
    v26 = sub_23800A2BC(v22, v23, v24, v25);
    v28 = v27;
    swift_unknownObjectRelease();
    sub_2380BDD3C();
    v29 = sub_2380BDD18();
    v31 = v30;
    sub_237FFBAB0((uint64_t)v26, v28);
    if (v31)
    {
      v32 = *(void (**)(char *, uint64_t))(v21 + 8);
      v32(v38, v8);
      sub_237FFBAB0(v41, v42);
      result = ((uint64_t (*)(char *, uint64_t))v32)(v12, v8);
      *v20 = v29;
      v20[1] = v31;
      return result;
    }
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    v15 = v40;
    v14 = (void *)swift_allocError();
    sub_2380BDB14();
    swift_willThrow();
    v33 = *(void (**)(char *, uint64_t))(v21 + 8);
    v33(v38, v8);
    v33(v12, v8);
  }
  v44 = v14;
  v16 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
  v17 = v39;
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v37 + 8))(v17, v15);
    v44 = v14;
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    swift_allocError();
    v18 = v14;
    swift_dynamicCast();
    swift_willThrow();

    return sub_237FFBAB0(v41, v42);
  }
  else
  {
    swift_getErrorValue();
    sub_2380BE1EC();
    sub_238001820((unint64_t *)&qword_2568C5B68, (uint64_t (*)(uint64_t))MEMORY[0x24BEB3038], MEMORY[0x24BEB3048]);
    swift_allocError();
    sub_2380BDB08();
    swift_bridgeObjectRelease();
    swift_willThrow();

    return sub_237FFBAB0(v41, v42);
  }
}

uint64_t ProvisioningCertificate.init<A>(data:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const __CFData *v12;
  __SecCertificate *v13;
  uint64_t result;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  v9 = sub_2380BD3B8();
  v11 = v10;
  v12 = (const __CFData *)sub_2380BD358();
  sub_237FFBAB0(v9, v11);
  v13 = SecCertificateCreateWithData(0, v12);

  if (v13)
  {
    ProvisioningCertificate.init(from:)(v13, (__SecCertificate **)v17);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, a2);
    if (!v3)
    {
      v16 = v17[1];
      v15 = v17[2];
      *a3 = v17[0];
      a3[1] = v16;
      a3[2] = v15;
    }
  }
  else
  {
    type metadata accessor for ProvisioningCertificate.Error();
    sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, a2);
  }
  return result;
}

uint64_t ProvisioningCertificate.fingerprint<A>(using:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  __SecCertificate *v3;
  id v4;
  CFDataRef v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = v2;
  swift_bridgeObjectRetain();
  v5 = SecCertificateCopyData(v3);
  v6 = sub_2380BD37C();
  v8 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_23800915C();
  sub_2380BD82C();
  return sub_237FFBAB0(v6, v8);
}

id ProvisioningCertificate.publicKey.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

uint64_t ProvisioningCertificate.chassisID.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ProvisioningCertificate.deviceIdentity.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  *a1 = *(_QWORD *)(v1 + 32);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t ProvisioningCertificate.data.getter()
{
  SecCertificateRef *v0;
  CFDataRef v1;
  uint64_t v2;

  v1 = SecCertificateCopyData(*v0);
  v2 = sub_2380BD37C();

  return v2;
}

void ProvisioningCertificate.init(from:)(__SecCertificate *a1@<X0>, __SecCertificate **a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  SecKeyRef v15;
  SecKeyRef v16;
  uint64_t v17;
  __SecCertificate *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  __SecKey *v29;
  __SecCertificate *v30;
  __SecCertificate *v31;
  uint64_t v32;
  __SecCertificate *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  __SecCertificate *v37;
  __SecCertificate *v38;
  __SecKey *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __SecKey *v45;
  _QWORD *v46;
  id v47;
  _QWORD *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  __SecKey *v54;
  char v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = sub_2380BDB20();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v50 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v50 - v13;
  v15 = SecCertificateCopyKey(a1);
  if (!v15)
  {
    type metadata accessor for ProvisioningCertificate.Error();
    sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    return;
  }
  v16 = v15;
  v51 = v6;
  v52 = v14;
  v55 = 0;
  v17 = qword_2568C4E88;
  v18 = a1;
  v54 = v16;
  if (v17 != -1)
    swift_once();
  v53 = v5;
  v19 = sub_2380BDAB4();
  __swift_project_value_buffer(v19, (uint64_t)qword_2568C61C0);
  sub_2380BDA9C();
  v20 = (void *)sub_2380BDCF4();
  swift_bridgeObjectRelease();
  v21 = (void *)SecCertificateCopyExtensionValue();

  if (!v21
    || (v56 = xmmword_2380BF8E0,
        sub_2380BD370(),
        v21,
        v22 = *((_QWORD *)&v56 + 1),
        *((_QWORD *)&v56 + 1) >> 60 == 15))
  {
    v30 = 0;
    v31 = 0;
  }
  else
  {
    v23 = v56;
    sub_237FFBA20(v56, *((unint64_t *)&v56 + 1));
    sub_238097030(v23, v22, (uint64_t *)&v56);
    if (v2)
    {
      *(_QWORD *)&v56 = v2;
      v24 = v2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
      v25 = v53;
      if ((swift_dynamicCast() & 1) != 0)
      {

        v26 = v51;
        v27 = v52;
        (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v52, v12, v25);
        type metadata accessor for ProvisioningCertificate.Error();
        sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
        swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v28, v27, v25);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();

        sub_238008CF0(v23, v22);
        v29 = v54;

        (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
      }
      else
      {

        type metadata accessor for ProvisioningCertificate.Error();
        sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
        swift_allocError();
        *v46 = v2;
        swift_storeEnumTagMultiPayload();
        v47 = v2;
        swift_willThrow();
        v29 = v54;

        sub_238008CF0(v23, v22);
      }

      return;
    }
    sub_238008CF0(v23, v22);
    v31 = (__SecCertificate *)*((_QWORD *)&v56 + 1);
    v30 = (__SecCertificate *)v56;
  }
  v32 = qword_2568C4E60;
  v33 = v18;
  if (v32 != -1)
    swift_once();
  __swift_project_value_buffer(v19, (uint64_t)qword_2568C5B38);
  sub_2380BDA9C();
  v34 = (void *)sub_2380BDCF4();
  swift_bridgeObjectRelease();
  v35 = (void *)SecCertificateCopyExtensionValue();

  if (!v35
    || (v56 = xmmword_2380BF8E0,
        sub_2380BD370(),
        v35,
        v36 = *((_QWORD *)&v56 + 1),
        *((_QWORD *)&v56 + 1) >> 60 == 15))
  {
    v37 = 0;
    v38 = 0;
LABEL_16:
    v39 = v54;
    *a2 = v33;
    a2[1] = v39;
    a2[2] = v30;
    a2[3] = v31;
    a2[4] = v37;
    a2[5] = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();

    return;
  }
  v40 = v56;
  sub_237FFBA20(v56, *((unint64_t *)&v56 + 1));
  sub_238096CD8(v40, v36, &v56);
  if (!v2)
  {
    sub_238008CF0(v40, v36);
    v38 = (__SecCertificate *)*((_QWORD *)&v56 + 1);
    v37 = (__SecCertificate *)v56;
    goto LABEL_16;
  }
  *(_QWORD *)&v56 = v2;
  v41 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
  v42 = v53;
  if ((swift_dynamicCast() & 1) != 0)
  {

    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v52, v9, v42);
    type metadata accessor for ProvisioningCertificate.Error();
    sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
    swift_allocError();
    v43 = v51;
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 16))(v44, v52, v42);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    sub_238008CF0(v40, v36);
    v45 = v54;

    (*(void (**)(char *, uint64_t))(v43 + 8))(v52, v42);
  }
  else
  {

    type metadata accessor for ProvisioningCertificate.Error();
    sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
    swift_allocError();
    *v48 = v2;
    swift_storeEnumTagMultiPayload();
    v49 = v2;
    swift_willThrow();
    v45 = v54;

    sub_238008CF0(v40, v36);
  }

  swift_bridgeObjectRelease();
}

uint64_t destroy for ProvisioningCertificate(id *a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ProvisioningCertificate(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  v7 = v3;
  v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ProvisioningCertificate(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for ProvisioningCertificate(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProvisioningCertificate(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProvisioningCertificate(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ProvisioningCertificate()
{
  return &type metadata for ProvisioningCertificate;
}

uint64_t X509Policy.init(required:roots:clock:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t result;

  v8 = type metadata accessor for X509Policy();
  v9 = a4 + *(int *)(v8 + 24);
  v10 = sub_2380BD418();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (uint64_t *)(a4 + *(int *)(v8 + 28));
  *v11 = 0;
  v11[1] = 0;
  *(_BYTE *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  sub_23801776C(a3, v9);
  result = sub_23801B358(*v11);
  *v11 = 0;
  v11[1] = 0;
  return result;
}

uint64_t type metadata accessor for X509Policy()
{
  uint64_t result;

  result = qword_2568C8C00;
  if (!qword_2568C8C00)
    return swift_getSingletonMetadata();
  return result;
}

double AttestationPolicyContext.validatedCert.getter@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  double result;
  uint64_t v8;

  v3 = *v1;
  v4 = type metadata accessor for X509Policy();
  if (!*(_QWORD *)(v3 + 16)
    || (v5 = sub_23800DEDC(v4, (uint64_t)&protocol witness table for X509Policy, 0x65746164696C6176, 0xED00007472654364), (v6 & 1) == 0)|| (sub_238016570(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v8), __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568C5E28), (swift_dynamicCast() & 1) == 0))
  {
    result = 0.0;
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t X509Policy.init(roots:clock:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v23;
  uint64_t v24;

  v23 = a3;
  v24 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for X509Policy();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v23 - v13;
  v15 = a3 + *(int *)(v12 + 24);
  v16 = sub_2380BD418();
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v15, 1, 1, v16);
  v18 = (uint64_t *)(a3 + *(int *)(v8 + 28));
  *v18 = 0;
  v18[1] = 0;
  v19 = a2;
  sub_2380051FC(a2, (uint64_t)v7, &qword_2542C9C00);
  v20 = (uint64_t)&v11[*(int *)(v8 + 24)];
  v17(v20, 1, 1, v16);
  v21 = (uint64_t *)&v11[*(int *)(v8 + 28)];
  *v21 = 0;
  v21[1] = 0;
  *v11 = 1;
  *((_QWORD *)v11 + 1) = v24;
  sub_23801776C((uint64_t)v7, v20);
  sub_23801B358(*v21);
  *v21 = 0;
  v21[1] = 0;
  sub_238099554((uint64_t)v11, (uint64_t)v14);
  sub_238005240(v19, &qword_2542C9C00);
  sub_238005240(v15, &qword_2542C9C00);
  sub_23801B358(*v18);
  return sub_238099554((uint64_t)v14, v23);
}

void sub_23809839C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  SecPolicyRef BasicX509;
  uint64_t v12;
  __SecPolicy *v13;
  __SecTrust *v14;
  uint64_t v15;
  const __CFArray *v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD *v19;
  unsigned int Allowed;
  uint64_t v21;
  uint64_t *v22;
  CFErrorRef v23;
  uint64_t v24;
  const __CFDate *v25;
  unsigned int v26;
  uint64_t *v27;
  __CFError *v28;
  BOOL v29;
  CFErrorRef v30;
  uint64_t v31;
  CFErrorRef *v32;
  uint64_t *v33;
  __CFError *v34;
  uint64_t v35;
  __CFError *v36;
  CFErrorRef error[2];

  v2 = v1;
  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2380BD418();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BasicX509 = SecPolicyCreateBasicX509();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8C40);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2380C4E20;
  *(_QWORD *)(v12 + 32) = BasicX509;
  error[0] = (CFErrorRef)v12;
  sub_2380BDEB0();
  v13 = BasicX509;
  v14 = sub_238005E4C(a1);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    sub_238099654();
    swift_allocError();
    *v19 = 0x8000000000000001;
    swift_willThrow();

    return;
  }
  v36 = v13;
  v15 = v7;
  type metadata accessor for SecCertificate(0);
  v16 = (const __CFArray *)sub_2380BDE98();
  v17 = SecTrustSetAnchorCertificates(v14, v16);

  if (v17)
  {
    v18 = v17;
LABEL_8:
    v21 = v18 | 0x4000000000000000;
    sub_238099654();
    swift_allocError();
    *v22 = v21;
    swift_willThrow();

    v23 = v36;
LABEL_9:

    return;
  }
  Allowed = SecTrustSetAnchorCertificatesOnly(v14, 1u);
  if (Allowed || (Allowed = SecTrustSetNetworkFetchAllowed(v14, 0)) != 0)
  {
    v18 = Allowed;
    goto LABEL_8;
  }
  v24 = type metadata accessor for X509Policy();
  sub_2380051FC(v2 + *(int *)(v24 + 24), (uint64_t)v6, &qword_2542C9C00);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v15) == 1)
  {
    sub_238005240((uint64_t)v6, &qword_2542C9C00);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v15);
    v25 = (const __CFDate *)sub_2380BD3D0();
    v26 = SecTrustSetVerifyDate(v14, v25);

    if (v26)
    {
      sub_238099654();
      swift_allocError();
      *v27 = v26 | 0x4000000000000000;
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
      return;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
  }
  v28 = v36;
  error[0] = 0;
  v29 = SecTrustEvaluateWithError(v14, error);
  v30 = error[0];
  if (v29)
  {

  }
  else
  {
    if (error[0])
    {
      type metadata accessor for CFError(0);
      sub_238001820((unint64_t *)&qword_2568C6378, (uint64_t (*)(uint64_t))type metadata accessor for CFError, MEMORY[0x24BDCFD90]);
      v31 = swift_allocError();
      *v32 = v30;
      sub_238099654();
      swift_allocError();
      *v33 = v31;
      v34 = v30;
      swift_willThrow();

      v23 = error[0];
      goto LABEL_9;
    }
    __break(1u);
  }
}

uint64_t X509Policy.required.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t X509Policy.required.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*X509Policy.required.modify())()
{
  return nullsub_1;
}

uint64_t X509Policy.roots.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t X509Policy.roots.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*X509Policy.roots.modify())()
{
  return nullsub_1;
}

uint64_t X509Policy.clock.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for X509Policy();
  return sub_2380051FC(v1 + *(int *)(v3 + 24), a1, &qword_2542C9C00);
}

uint64_t X509Policy.clock.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for X509Policy() + 24);
  return sub_23801776C(a1, v3);
}

uint64_t (*X509Policy.clock.modify())()
{
  type metadata accessor for X509Policy();
  return nullsub_1;
}

uint64_t sub_238098860(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  if (*a1)
    v3 = a1[1];
  else
    v3 = 0;
  v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for X509Policy() + 28));
  v5 = *v4;
  sub_23801B64C(v2);
  result = sub_23801B358(v5);
  *v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t X509Policy.body.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for X509Policy() + 28));
  sub_23801B64C(v1);
  return v1;
}

uint64_t X509Policy.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t result;

  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for X509Policy() + 28));
  result = sub_23801B358(*v5);
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*X509Policy.body.modify())()
{
  type metadata accessor for X509Policy();
  return nullsub_1;
}

uint64_t sub_238098974()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C9FC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C9FC0);
  return sub_2380BD7FC();
}

uint64_t X509Policy.verifies(body:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v7;
  uint64_t v8;
  uint64_t result;

  sub_238099598(v3, a3);
  v7 = (uint64_t *)(a3 + *(int *)(type metadata accessor for X509Policy() + 28));
  v8 = *v7;
  swift_retain();
  result = sub_23801B358(v8);
  *v7 = a1;
  v7[1] = a2;
  return result;
}

uint64_t X509Policy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  v3[18] = type metadata accessor for X509Policy();
  v3[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_238098AB8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  const __CFData *v8;
  __SecCertificate *v9;
  void *v10;
  _QWORD *v11;
  _BYTE *v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  unsigned __int8 *v19;
  uint8_t *v20;
  int v21;
  __SecCertificate *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(NSObject **);
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t (*v45)(_QWORD, _QWORD, uint64_t, uint64_t);
  NSObject *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + 120) + 32);
  if (!v1[2])
  {
    sub_238099654();
    v10 = (void *)swift_allocError();
    *v11 = 0x8000000000000000;
    swift_willThrow();
LABEL_6:
    v12 = *(_BYTE **)(v0 + 136);
    if (*v12 == 1)
    {
      swift_willThrow();
      swift_task_dealloc();
      v13 = *(uint64_t (**)(void))(v0 + 8);
      return v13();
    }
    if (qword_2568C5080 != -1)
    {
      swift_once();
      v12 = *(_BYTE **)(v0 + 136);
    }
    v14 = *(_QWORD *)(v0 + 152);
    v15 = sub_2380BD808();
    __swift_project_value_buffer(v15, (uint64_t)qword_2568C9FC0);
    sub_238099598((uint64_t)v12, v14);
    v16 = sub_2380BD7F0();
    v17 = sub_2380BDF64();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(unsigned __int8 **)(v0 + 152);
    if (v18)
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v20 = 67240192;
      v21 = *v19;
      sub_2380995DC((uint64_t)v19);
      *(_DWORD *)(v0 + 240) = v21;
      sub_2380BDF94();
      _os_log_impl(&dword_237FF6000, v16, v17, "Failing open since \"required\"=%{BOOL,public}d", v20, 8u);
      MEMORY[0x23B82B830](v20, -1, -1);
    }
    else
    {
      sub_2380995DC(*(_QWORD *)(v0 + 152));
    }

LABEL_14:
    swift_task_dealloc();
    v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  v2 = v1[4];
  *(_QWORD *)(v0 + 160) = v2;
  v3 = v1[5];
  *(_QWORD *)(v0 + 168) = v3;
  sub_237FFBA20(v2, v3);
  sub_23809839C((uint64_t)v1);
  sub_237FFBA20(v2, v3);
  sub_237FFBA20(v2, v3);
  sub_2380068C4(v2, v3);
  v5 = v4;
  v7 = v6;
  v8 = (const __CFData *)sub_2380BD358();
  sub_237FFBAB0(v5, v7);
  v9 = SecCertificateCreateWithData(0, v8);

  if (!v9)
  {
    type metadata accessor for ProvisioningCertificate.Error();
    sub_238001820(&qword_2568C7C60, (uint64_t (*)(uint64_t))type metadata accessor for ProvisioningCertificate.Error, (uint64_t)&protocol conformance descriptor for ProvisioningCertificate.Error);
    v10 = (void *)swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    sub_237FFBAB0(v2, v3);
    sub_237FFBAB0(v2, v3);
    goto LABEL_6;
  }
  ProvisioningCertificate.init(from:)(v9, (__SecCertificate **)&v46);
  v42 = *(_QWORD *)(v0 + 144);
  sub_237FFBAB0(v2, v3);
  v23 = (__SecCertificate *)v46;
  v24 = v47;
  *(_QWORD *)(v0 + 176) = v46;
  *(_QWORD *)(v0 + 184) = v24;
  v25 = v48;
  v26 = v49;
  v28 = v50;
  v27 = v51;
  *(_QWORD *)(v0 + 192) = v49;
  *(_QWORD *)(v0 + 200) = v27;
  *(_QWORD *)(v0 + 80) = &type metadata for ProvisioningCertificate;
  v29 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v0 + 56) = v29;
  v29[2] = v23;
  v29[3] = v24;
  v41 = v28;
  v29[4] = v25;
  v29[5] = v26;
  v29[6] = v28;
  v29[7] = v27;
  sub_2380051FC(v0 + 56, v0 + 88, &qword_2568C6128);
  v43 = v27;
  swift_bridgeObjectRetain();
  v16 = v23;
  v44 = v24;
  swift_bridgeObjectRetain();
  sub_238022FD8(v0 + 88, v42, (uint64_t)&protocol witness table for X509Policy, 0x65746164696C6176, 0xED00007472654364);
  sub_238005240(v0 + 56, &qword_2568C6128);
  if (qword_2568C5080 != -1)
    swift_once();
  v30 = sub_2380BD808();
  __swift_project_value_buffer(v30, (uint64_t)qword_2568C9FC0);
  v31 = sub_2380BD7F0();
  v32 = sub_2380BDF70();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_237FF6000, v31, v32, "AttestationBundle passed X509Policy: provisioning identity certificate trusted", v33, 2u);
    MEMORY[0x23B82B830](v33, -1, -1);
  }
  v35 = *(_QWORD *)(v0 + 136);
  v34 = *(_QWORD *)(v0 + 144);

  v36 = v35 + *(int *)(v34 + 28);
  v37 = *(void (**)(NSObject **))v36;
  *(_QWORD *)(v0 + 208) = *(_QWORD *)v36;
  *(_QWORD *)(v0 + 216) = *(_QWORD *)(v36 + 8);
  if (!v37)
  {
    sub_237FFBAB0(v2, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    goto LABEL_14;
  }
  v46 = v16;
  v47 = v44;
  v48 = v25;
  v49 = v26;
  v50 = v41;
  v51 = v43;
  swift_retain();
  v37(&v46);
  v38 = *(_QWORD *)(v0 + 40);
  v39 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v38);
  v45 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v39 + 8) + *(_QWORD *)(v39 + 8));
  v40 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v40;
  *v40 = v0;
  v40[1] = sub_238099084;
  return v45(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), v38, v39);
}

uint64_t sub_238099084()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2380990E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 184);
  sub_237FFBAB0(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23801B358(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_238099178()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  unsigned __int8 *v12;
  uint8_t *v13;
  int v14;

  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 184);
  sub_237FFBAB0(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23801B358(v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v4 = *(void **)(v0 + 232);
  v5 = *(_BYTE **)(v0 + 136);
  if ((*v5 & 1) != 0)
  {
    swift_willThrow();
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (qword_2568C5080 != -1)
    {
      swift_once();
      v5 = *(_BYTE **)(v0 + 136);
    }
    v7 = *(_QWORD *)(v0 + 152);
    v8 = sub_2380BD808();
    __swift_project_value_buffer(v8, (uint64_t)qword_2568C9FC0);
    sub_238099598((uint64_t)v5, v7);
    v9 = sub_2380BD7F0();
    v10 = sub_2380BDF64();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(unsigned __int8 **)(v0 + 152);
    if (v11)
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v13 = 67240192;
      v14 = *v12;
      sub_2380995DC((uint64_t)v12);
      *(_DWORD *)(v0 + 240) = v14;
      sub_2380BDF94();
      _os_log_impl(&dword_237FF6000, v9, v10, "Failing open since \"required\"=%{BOOL,public}d", v13, 8u);
      MEMORY[0x23B82B830](v13, -1, -1);
    }
    else
    {
      sub_2380995DC(*(_QWORD *)(v0 + 152));
    }

    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t sub_238099358(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_238013814;
  return X509Policy.evaluate(bundle:context:)(a1, a2);
}

void sub_2380993B4()
{
  uint64_t v0;
  const __CFAllocator *v1;
  const __CFData *v2;
  SecCertificateRef v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8C40);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2380C4E20;
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (qword_2568C4EB0 != -1)
    swift_once();
  v2 = (const __CFData *)sub_2380BD358();
  v3 = SecCertificateCreateWithData(v1, v2);

  if (v3)
  {
    *(_QWORD *)(v0 + 32) = v3;
    sub_2380BDEB0();
    qword_2568C9FD8 = v0;
  }
  else
  {
    __break(1u);
  }
}

void sub_238099484()
{
  uint64_t v0;
  const __CFAllocator *v1;
  const __CFData *v2;
  SecCertificateRef v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8C40);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2380C4E20;
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (qword_2568C4EB8 != -1)
    swift_once();
  v2 = (const __CFData *)sub_2380BD358();
  v3 = SecCertificateCreateWithData(v1, v2);

  if (v3)
  {
    *(_QWORD *)(v0 + 32) = v3;
    sub_2380BDEB0();
    qword_2568C9FE0 = v0;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_238099554(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for X509Policy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_238099598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for X509Policy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2380995DC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for X509Policy();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_238099618()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_238099654()
{
  unint64_t result;

  result = qword_2568C8B98;
  if (!qword_2568C8B98)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for X509Policy.Error, &type metadata for X509Policy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8B98);
  }
  return result;
}

uint64_t sub_238099698@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for X509Policy() + 28));
  v4 = *v3;
  if (*v3)
    v5 = v3[1];
  else
    v5 = 0;
  *a2 = v4;
  a2[1] = v5;
  return sub_23801B64C(v4);
}

uint64_t *initializeBufferWithCopyOfBuffer for X509Policy(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2380BD418();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = *(int *)(a3 + 28);
    v16 = (uint64_t *)((char *)v4 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    if (*v17)
    {
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
    }
  }
  return v4;
}

uint64_t destroy for X509Policy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2380BD418();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  if (*(_QWORD *)(a1 + *(int *)(a2 + 28)))
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for X509Policy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2380BD418();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = *(int *)(a3 + 28);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  if (*v15)
  {
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v14 = *(_OWORD *)v15;
  }
  return a1;
}

uint64_t assignWithCopy for X509Policy(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_2380BD418();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 28);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v18 = *(_QWORD *)(a1 + v15);
  v19 = *v17;
  if (!v18)
  {
    if (v19)
    {
      v21 = v17[1];
      *v16 = v19;
      v16[1] = v21;
      swift_retain();
      return a1;
    }
LABEL_13:
    *(_OWORD *)v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_13;
  }
  v20 = v17[1];
  *v16 = v19;
  v16[1] = v20;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for X509Policy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2380BD418();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = *(int *)(a3 + 28);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  if (*v14)
  {
    v16 = v14[1];
    *v13 = v15;
    v13[1] = v16;
  }
  else
  {
    *(_OWORD *)v13 = *(_OWORD *)v14;
  }
  return a1;
}

uint64_t assignWithTake for X509Policy(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_2380BD418();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 28);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v18 = *(_QWORD *)(a1 + v15);
  v19 = *v17;
  if (!v18)
  {
    if (v19)
    {
      v21 = v17[1];
      *v16 = v19;
      v16[1] = v21;
      return a1;
    }
LABEL_13:
    *(_OWORD *)v16 = *(_OWORD *)v17;
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_13;
  }
  v20 = v17[1];
  *v16 = v19;
  v16[1] = v20;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for X509Policy()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_238099DD4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for X509Policy()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_238099E60(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_238099ED8()
{
  unint64_t v0;

  sub_23801C9D0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for X509Policy.Error(_QWORD *a1, id *a2)
{
  id v3;

  v3 = *a2;
  sub_238099F90(*a2);
  *a1 = v3;
  return a1;
}

id sub_238099F90(id result)
{
  if (!((unint64_t)result >> 62))
    return result;
  return result;
}

void destroy for X509Policy.Error(id *a1)
{
  sub_238099FA8(*a1);
}

void sub_238099FA8(id a1)
{
  if (!((unint64_t)a1 >> 62))

}

void **assignWithCopy for X509Policy.Error(void **a1, id *a2)
{
  id v3;
  void *v4;

  v3 = *a2;
  sub_238099F90(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_238099FA8(v4);
  return a1;
}

void **assignWithTake for X509Policy.Error(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;
  sub_238099FA8(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for X509Policy.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xE && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 14);
  v3 = (((*(_QWORD *)a1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)a1 >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xD)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for X509Policy.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xD)
  {
    *(_QWORD *)result = a2 - 14;
    if (a3 >= 0xE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0xE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_23809A0C0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return *a1 + 2;
}

_QWORD *sub_23809A0D8(_QWORD *result, uint64_t a2)
{
  if (a2 < 2)
    *result = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 62);
  else
    *result = (a2 - 2) | 0x8000000000000000;
  return result;
}

ValueMetadata *type metadata accessor for X509Policy.Error()
{
  return &type metadata for X509Policy.Error;
}

uint64_t sub_23809A114()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C9FE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C9FE8);
  return sub_2380BD7FC();
}

uint64_t sub_23809A194()
{
  uint64_t result;

  result = SecKeyCopySystemKey();
  qword_2568CA000 = result;
  return result;
}

uint64_t SEP.PhysicalDevice.dcik.getter()
{
  if (qword_2568C50A0 != -1)
    swift_once();
  return SecKeyCreateDuplicate();
}

void SEP.PhysicalDevice.attest(key:using:)(__SecKey *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t Attestation;
  void *v5;
  SecKeyRef v6;
  SecKeyRef v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  Attestation = SecKeyCreateAttestation();
  if (Attestation)
  {
    v5 = (void *)Attestation;
    v6 = SecKeyCopyPublicKey(a1);
    if (v6)
    {
      v7 = v6;
      v8 = v5;
      v9 = sub_2380BD37C();
      v11 = v10;

      SEP.Attestation.init(from:signer:)(v9, v11, v7);
    }
    else
    {
      if (qword_2568C5098 != -1)
        swift_once();
      v12 = sub_2380BD808();
      __swift_project_value_buffer(v12, (uint64_t)qword_2568C9FE8);
      v13 = sub_2380BD7F0();
      v14 = sub_2380BDF64();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_237FF6000, v13, v14, "Failed to copy public key from DCIK, parsing attestation without checking signature", v15, 2u);
        MEMORY[0x23B82B830](v15, -1, -1);
      }

      v16 = v5;
      v17 = sub_2380BD37C();
      v19 = v18;

      SEP.Attestation.init(from:)(v17, v19, a2);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23809A5B4()
{
  if (qword_2568C50A0 != -1)
    swift_once();
  return SecKeyCreateDuplicate();
}

void sub_23809A5F4(__SecKey *a1@<X1>, uint64_t a2@<X8>)
{
  SEP.PhysicalDevice.attest(key:using:)(a1, a2);
}

ValueMetadata *type metadata accessor for SEP.PhysicalDevice()
{
  return &type metadata for SEP.PhysicalDevice;
}

uint64_t Image4Manifest.init<A>(data:kind:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = *v8;
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v10 = sub_2380BD3B8();
  v12 = v11;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  *(_QWORD *)a3 = v10;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v9;
  return result;
}

void Image4Manifest.canonicalize(evaluateTrust:)()
{
  __asm { BR              X9 }
}

uint64_t sub_23809AA14()
{
  uint64_t v0;
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
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v21 = image4_environment_new();
  if (!v21)
  {
    sub_23808B27C();
    swift_allocError();
    *(_OWORD *)v0 = xmmword_2380BFF30;
    *(_BYTE *)(v0 + 16) = 2;
    return swift_willThrow();
  }
  v22 = v21;
  if (v19)
  {
    if (v19 == 1)
    {
      if (v18 >> 32 >= (int)v18)
      {
        sub_237FFBA20(v18, v20);
        v2 = sub_2380BD208();
        if (!v2)
        {
LABEL_9:
          v4 = sub_2380BD220();
          if (v4 >= (v18 >> 32) - (int)v18)
            v5 = (v18 >> 32) - (int)v18;
          else
            v5 = v4;
          v6 = v2 + v5;
          if (v2)
            v7 = v6;
          else
            v7 = 0;
          sub_23809ACA4(v2, v7, (uint64_t)&v22, v18, v20);
          sub_237FFBAB0(v18, v20);
          return image4_environment_destroy();
        }
        v3 = sub_2380BD22C();
        if (!__OFSUB__((int)v18, v3))
        {
          v2 += (int)v18 - v3;
          goto LABEL_9;
        }
LABEL_32:
        __break(1u);
      }
      __break(1u);
    }
    else
    {
      v8 = *(_QWORD *)(v18 + 16);
      v9 = *(_QWORD *)(v18 + 24);
      swift_retain();
      swift_retain();
      v10 = sub_2380BD208();
      if (v10)
      {
        v11 = sub_2380BD22C();
        if (__OFSUB__(v8, v11))
        {
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        v10 += v8 - v11;
      }
      v12 = __OFSUB__(v9, v8);
      v13 = v9 - v8;
      if (!v12)
      {
        v14 = sub_2380BD220();
        if (v14 >= v13)
          v15 = v13;
        else
          v15 = v14;
        v16 = v10 + v15;
        if (v10)
          v17 = v16;
        else
          v17 = 0;
        sub_23809ACA4(v10, v17, (uint64_t)&v22, v18, v20);
        swift_release();
        swift_release();
        return image4_environment_destroy();
      }
    }
    __break(1u);
    goto LABEL_31;
  }
  v23 = v18;
  v24 = v20;
  v25 = BYTE2(v20);
  v26 = BYTE3(v20);
  v27 = BYTE4(v20);
  v28 = BYTE5(v20);
  sub_23809ACA4((uint64_t)&v23, (uint64_t)&v23 + BYTE6(v20), (uint64_t)&v22, v18, v20);
  return image4_environment_destroy();
}

void sub_23809AA24()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  sub_237FFBA20(v0, v1);
  sub_2380068C4(v0, v1);
  v4 = v3;
  v6 = v5;
  Image4Manifest.canonicalize(evaluateTrust:)();
  sub_237FFBAB0(v4, v6);
  if (v2)
  {
    sub_237FFBA20(v0, v1);
    sub_2380068C4(v0, v1);
    v8 = v7;
    v10 = v9;
    Image4Manifest.canonicalize(evaluateTrust:)();

    sub_237FFBAB0(v8, v10);
  }
  JUMPOUT(0x23809A9D8);
}

uint64_t static Image4Manifest.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  unsigned __int8 v4;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  sub_238008ED0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return v4 & (v2 == v3);
}

uint64_t Image4Manifest.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_237FFBA20(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

void Image4Manifest.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t Image4Manifest.init(file:kind:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *a2;
  v7 = sub_2380BD2E0();
  if (v3)
  {
    v9 = sub_2380BD2C8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  else
  {
    v11 = v7;
    v12 = v8;
    v13 = sub_2380BD2C8();
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
    *(_QWORD *)a3 = v11;
    *(_QWORD *)(a3 + 8) = v12;
    *(_BYTE *)(a3 + 16) = v6;
  }
  return result;
}

BOOL static Image4Manifest.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Image4Manifest.Kind.hash(into:)()
{
  return sub_2380BE240();
}

uint64_t Image4Manifest.Kind.hashValue.getter()
{
  sub_2380BE234();
  sub_2380BE240();
  return sub_2380BE264();
}

void sub_23809ACA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
    __asm { BR              X12 }
  __break(1u);
  JUMPOUT(0x23809AEACLL);
}

_BYTE *sub_23809AEC0(int a1, _BYTE *__src, uint64_t a3, unsigned int a4, uint64_t a5)
{
  return sub_23809BC64(__src, a3, a4, a5);
}

void sub_23809AED4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);

  v4 = sub_2380BD988();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8];
  MEMORY[0x24BDAC7A8](v4);
  sub_237FFBA20(a1, a2);
  sub_238001820(&qword_2568C5DA8, v5, MEMORY[0x24BDC6AE8]);
  sub_2380BD838();
  __asm { BR              X9 }
}

uint64_t sub_23809AFA8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 112) = v1;
  *(_WORD *)(v5 - 104) = v0;
  *(_BYTE *)(v5 - 102) = BYTE2(v0);
  *(_BYTE *)(v5 - 101) = BYTE3(v0);
  *(_BYTE *)(v5 - 100) = BYTE4(v0);
  *(_BYTE *)(v5 - 99) = BYTE5(v0);
  sub_2380BD814();
  sub_237FFBAB0(v1, v0);
  sub_2380BD820();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  return sub_237FFBAB0(v1, v0);
}

uint64_t Image4Manifest.digest<A>(using:)()
{
  sub_23800915C();
  return sub_2380BD82C();
}

uint64_t sub_23809B1C0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  unsigned __int8 v4;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  sub_238008ED0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return v4 & (v2 == v3);
}

uint64_t Image4Manifest.Error.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) != 1)
      __asm { BR              X9 }
    sub_2380BE240();
    return sub_2380BDD78();
  }
  else
  {
    sub_2380BE240();
    return sub_2380BE258();
  }
}

uint64_t Image4Manifest.Error.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = *((unsigned __int8 *)v0 + 16);
  sub_2380BE234();
  if (v2)
  {
    if (v2 != 1)
      __asm { BR              X9 }
    sub_2380BE240();
    sub_2380BDD78();
  }
  else
  {
    sub_2380BE240();
    sub_2380BE258();
  }
  return sub_2380BE264();
}

uint64_t sub_23809B394()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) != 1)
      __asm { BR              X9 }
    sub_2380BE240();
    return sub_2380BDD78();
  }
  else
  {
    sub_2380BE240();
    return sub_2380BE258();
  }
}

uint64_t sub_23809B44C()
{
  uint64_t *v0;
  uint64_t v1;
  int v2;

  v1 = *v0;
  v2 = *((unsigned __int8 *)v0 + 16);
  sub_2380BE234();
  if (v2)
  {
    if (v2 != 1)
      __asm { BR              X9 }
    sub_2380BE240();
    sub_2380BDD78();
  }
  else
  {
    sub_2380BE240();
    sub_2380BE258();
  }
  return sub_2380BE264();
}

uint64_t Image4Manifest.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  _QWORD *v29;
  uint64_t v30;

  v1 = sub_2380BD844();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0];
  v3 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v24 - v7;
  sub_23809AED4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v1);
  sub_238001820(&qword_2568C6230, v2, MEMORY[0x24BDC6300]);
  result = sub_2380BDE08();
  v10 = v29;
  v11 = v30;
  v12 = v29[2];
  v26 = v3;
  v27 = v1;
  v25 = v8;
  if (v30 == v12)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_3:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
    v29 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E60);
    sub_23804390C();
    v14 = sub_2380BDCD0();
    swift_bridgeObjectRelease();
    return v14;
  }
  else
  {
    if (v30 < v12)
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v28 = xmmword_2380BEAC0;
      v15 = v30;
      while ((v11 & 0x8000000000000000) == 0)
      {
        if (v15 >= v10[2])
          goto LABEL_15;
        v16 = *((_BYTE *)v10 + v15 + 32);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5C40);
        v17 = swift_allocObject();
        *(_OWORD *)(v17 + 16) = v28;
        *(_QWORD *)(v17 + 56) = MEMORY[0x24BEE4260];
        *(_QWORD *)(v17 + 64) = MEMORY[0x24BEE42B0];
        *(_BYTE *)(v17 + 32) = v16;
        v18 = sub_2380BDD30();
        v20 = v19;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_2380267E8(0, v13[2] + 1, 1, v13);
          v13 = (_QWORD *)result;
        }
        v22 = v13[2];
        v21 = v13[3];
        if (v22 >= v21 >> 1)
        {
          result = (uint64_t)sub_2380267E8((_QWORD *)(v21 > 1), v22 + 1, 1, v13);
          v13 = (_QWORD *)result;
        }
        ++v15;
        v13[2] = v22 + 1;
        v23 = &v13[2 * v22];
        v23[4] = v18;
        v23[5] = v20;
        if (v12 == v15)
          goto LABEL_3;
      }
      __break(1u);
LABEL_15:
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t _s16CloudAttestation14Image4ManifestV5ErrorO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (!*(_BYTE *)(a2 + 16))
    {
      sub_23804A718(*(_QWORD *)a1, v3, 0);
      sub_23804A718(v5, v6, 0);
      v7 = v2 == v5;
      return v7 & 1;
    }
LABEL_15:
    sub_23809BB1C(v5, v6, v7);
    sub_23804A718(v2, v3, v4);
    sub_23804A718(v5, v6, v7);
    LOBYTE(v7) = 0;
    return v7 & 1;
  }
  if (v4 != 1)
    __asm { BR              X9 }
  if (v7 != 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_15;
  }
  if (v2 == v5 && v3 == v6)
    LOBYTE(v7) = 1;
  else
    LOBYTE(v7) = sub_2380BE1B0();
  sub_23809BB1C(v5, v6, 1);
  sub_23809BB1C(v2, v3, 1);
  sub_23804A718(v2, v3, 1);
  sub_23804A718(v5, v6, 1);
  return v7 & 1;
}

unint64_t sub_23809B9B0()
{
  unint64_t result;

  result = qword_2568C8C48;
  if (!qword_2568C8C48)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for Image4Manifest.Kind, &type metadata for Image4Manifest.Kind);
    atomic_store(result, (unint64_t *)&qword_2568C8C48);
  }
  return result;
}

unint64_t sub_23809B9F8()
{
  unint64_t result;

  result = qword_2568C8C50;
  if (!qword_2568C8C50)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for Image4Manifest.Error, &type metadata for Image4Manifest.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8C50);
  }
  return result;
}

ValueMetadata *type metadata accessor for Image4Manifest()
{
  return &type metadata for Image4Manifest;
}

uint64_t storeEnumTagSinglePayload for Image4Manifest.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23809BA98 + 4 * byte_2380C4F49[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23809BACC + 4 * byte_2380C4F44[v4]))();
}

uint64_t sub_23809BACC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23809BAD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23809BADCLL);
  return result;
}

uint64_t sub_23809BAE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23809BAF0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23809BAF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23809BAFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Image4Manifest.Kind()
{
  return &type metadata for Image4Manifest.Kind;
}

uint64_t sub_23809BB1C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (a3 == 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for Image4Manifest.Error(uint64_t a1)
{
  return sub_23804A718(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s16CloudAttestation14Image4ManifestV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23809BB1C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Image4Manifest.Error(uint64_t a1, uint64_t a2)
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
  sub_23809BB1C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23804A718(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Image4Manifest.Error(uint64_t a1, uint64_t a2)
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
  sub_23804A718(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for Image4Manifest.Error()
{
  return &type metadata for Image4Manifest.Error;
}

uint64_t sub_23809BC34(uint64_t result, uint64_t a2, __int16 a3)
{
  if (HIBYTE(a3) != 255)
    return sub_23809BC4C(result, a2, a3, HIBYTE(a3) & 1);
  return result;
}

uint64_t sub_23809BC4C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  if ((a4 & 1) != 0)
    return sub_23804A718(a1, a2, a3);
  else
    return sub_237FFBAB0(a1, a2);
}

uint64_t sub_23809BC58(uint64_t a1, uint64_t a2, char a3, char a4)
{
  if ((a4 & 1) != 0)
    return sub_23809BB1C(a1, a2, a3);
  else
    return sub_237FFBA20(a1, a2);
}

_BYTE *sub_23809BC64(_BYTE *__src, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  if (a4)
  {
    if (__src)
    {
      if (a2)
      {
        if (a2 <= 14)
        {
          v7 = sub_238036530(__src, &__src[a2]);
          v8 = v12 & 0xFFFFFFFFFFFFFFLL;
        }
        else
        {
          sub_2380BD238();
          swift_allocObject();
          v6 = sub_2380BD1FC();
          if ((unint64_t)a2 >= 0x7FFFFFFF)
          {
            sub_2380BD310();
            v7 = swift_allocObject();
            *(_QWORD *)(v7 + 16) = 0;
            *(_QWORD *)(v7 + 24) = a2;
            v8 = v6 | 0x8000000000000000;
          }
          else
          {
            v7 = a2 << 32;
            v8 = v6 | 0x4000000000000000;
          }
        }
      }
      else
      {
        v7 = 0;
        v8 = 0xC000000000000000;
      }
      v13 = *(_QWORD *)a4;
      v10 = *(_QWORD *)(a4 + 8);
      *(_QWORD *)a4 = v7;
      *(_QWORD *)(a4 + 8) = v8;
      v11 = *(_WORD *)(a4 + 16);
      *(_WORD *)(a4 + 16) = 0;
      v9 = v13;
    }
    else
    {
      v9 = *(_QWORD *)a4;
      v10 = *(_QWORD *)(a4 + 8);
      *(_QWORD *)a4 = a3;
      *(_QWORD *)(a4 + 8) = 0;
      v11 = *(_WORD *)(a4 + 16);
      *(_WORD *)(a4 + 16) = 256;
    }
    return (_BYTE *)sub_23809BC34(v9, v10, v11);
  }
  return __src;
}

uint64_t SEPAttestationPolicy.init(signer:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  a2[1] = 0;
  a2[2] = 0;
  *a2 = result;
  return result;
}

void SEPAttestationPolicy.init(insecure:)(char a1@<W0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  if ((a1 & 1) != 0)
  {
    if (qword_2568C50A8 != -1)
      swift_once();
    v3 = sub_2380BD808();
    __swift_project_value_buffer(v3, (uint64_t)qword_2568C8C58);
    v4 = sub_2380BD7F0();
    v5 = sub_2380BDF64();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_237FF6000, v4, v5, "Using Insecure SEPAttestationPolicy", v6, 2u);
      MEMORY[0x23B82B830](v6, -1, -1);
    }

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  a2[1] = 0;
  a2[2] = 0;
  *a2 = v7;
}

double AttestationPolicyContext.validatedAttestation.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  char v5;
  double result;
  uint64_t v7;

  v3 = *v1;
  if (!*(_QWORD *)(v3 + 16)
    || (v4 = sub_23800DEDC((uint64_t)&type metadata for SEPAttestationPolicy, (uint64_t)&protocol witness table for SEPAttestationPolicy, 0xD000000000000014, 0x80000002380C7EE0), (v5 & 1) == 0)|| (sub_238016570(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v7), __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568C5E28), (swift_dynamicCast() & 1) == 0))
  {
    result = 0.0;
    *(_OWORD *)a1 = xmmword_2380BF8E0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
  }
  return result;
}

uint64_t SEPAttestationPolicy.verifies(body:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  uint64_t result;

  v7 = *(void **)v3;
  v8 = *(_QWORD *)(v3 + 8);
  *a3 = *(_QWORD *)v3;
  sub_23801B63C(v7);
  sub_23801B64C(v8);
  swift_retain();
  result = sub_23801B358(v8);
  a3[1] = a1;
  a3[2] = a2;
  return result;
}

id SEPAttestationPolicy.signerLoader.getter@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return sub_23801B63C(v2);
}

uint64_t SEPAttestationPolicy.body.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_23801B64C(v1);
  return v1;
}

uint64_t SEPAttestationPolicy.body.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_23801B358(*(_QWORD *)(v2 + 8));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*SEPAttestationPolicy.body.modify())()
{
  return nullsub_1;
}

uint64_t sub_23809BFEC()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C8C58);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C8C58);
  return sub_2380BD7FC();
}

uint64_t static SEPAttestationPolicy.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2568C50A8 != -1)
    swift_once();
  v2 = sub_2380BD808();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2568C8C58);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void SEPAttestationPolicy.init()(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void static SEPAttestationPolicy.insecure.getter(_QWORD *a1@<X8>)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_2568C50A8 != -1)
    swift_once();
  v2 = sub_2380BD808();
  __swift_project_value_buffer(v2, (uint64_t)qword_2568C8C58);
  v3 = sub_2380BD7F0();
  v4 = sub_2380BDF64();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_237FF6000, v3, v4, "Using Insecure SEPAttestationPolicy", v5, 2u);
    MEMORY[0x23B82B830](v5, -1, -1);
  }

  a1[1] = 0;
  a1[2] = 0;
  *a1 = 1;
}

uint64_t SEPAttestationPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 320) = a1;
  *(_QWORD *)(v3 + 328) = a2;
  *(_OWORD *)(v3 + 336) = *(_OWORD *)v2;
  *(_QWORD *)(v3 + 352) = *(_QWORD *)(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_23809C1EC()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  _QWORD *v20;
  __int128 v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(__int128 *);
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  void (*v38)(__int128 *);
  uint64_t (*v39)(void);
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t (*v46)();
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(_QWORD, _QWORD, uint64_t, uint64_t);
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v1 = *(void **)(v0 + 336);
  if (v1)
  {
    if (v1 == (void *)1)
    {
      v2 = *(uint64_t **)(v0 + 320);
      v3 = *v2;
      *(_QWORD *)(v0 + 360) = *v2;
      v4 = v2[1];
      *(_QWORD *)(v0 + 368) = v4;
      v5 = *MEMORY[0x24BE078F8];
      sub_237FFBA20(v3, v4);
      *(_QWORD *)&v51 = sub_23800A21C(v5);
      *((_QWORD *)&v51 + 1) = v6;
      sub_23801B708((uint64_t)&v51);
      v50 = v51;
      sub_237FFBA20(v3, v4);
      sub_23801B9A0((uint64_t)&v50);
      LODWORD(v5) = v7;
      sub_237FFBAB0(v3, v4);
      if ((_DWORD)v5)
      {
        sub_23801BD6C();
        swift_allocError();
        *v8 = 0;
        swift_willThrow();
        sub_237FFBAB0(v3, v4);
        sub_237FFBAB0(v50, *((unint64_t *)&v50 + 1));
LABEL_25:
        v39 = *(uint64_t (**)(void))(v0 + 8);
        return v39();
      }
      v31 = v50;
      *(_OWORD *)(v0 + 376) = v50;
      *(_QWORD *)(v0 + 232) = &type metadata for SEP.Attestation;
      v32 = swift_allocObject();
      *(_QWORD *)(v0 + 208) = v32;
      *(_QWORD *)(v32 + 16) = v3;
      *(_QWORD *)(v32 + 24) = v4;
      *(_OWORD *)(v32 + 32) = v31;
      sub_238024D10(v0 + 208, v0 + 272);
      sub_237FFBA20(v3, v4);
      sub_237FFBA20(v31, *((unint64_t *)&v31 + 1));
      sub_238022FD8(v0 + 272, (uint64_t)&type metadata for SEPAttestationPolicy, (uint64_t)&protocol witness table for SEPAttestationPolicy, 0xD000000000000014, 0x80000002380C7EE0);
      sub_238037344(v0 + 208);
      if (qword_2568C50A8 != -1)
        swift_once();
      v33 = sub_2380BD808();
      __swift_project_value_buffer(v33, (uint64_t)qword_2568C8C58);
      v34 = sub_2380BD7F0();
      v35 = sub_2380BDF70();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_237FF6000, v34, v35, "AttestationBundle passed SEPAttestationPolicy: SEP Attestation has valid structure, but signature was not checked", v36, 2u);
        MEMORY[0x23B82B830](v36, -1, -1);
      }
      v37 = *(_QWORD *)(v0 + 344);

      if (v37)
      {
        v38 = *(void (**)(__int128 *))(v0 + 344);
        *(_QWORD *)&v51 = v3;
        *((_QWORD *)&v51 + 1) = v4;
        v52 = v31;
        swift_retain();
        v38(&v51);
        v43 = *(_QWORD *)(v0 + 128);
        v44 = *(_QWORD *)(v0 + 136);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 104), v43);
        v49 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v44 + 8) + *(_QWORD *)(v44 + 8));
        v45 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 392) = v45;
        v46 = sub_23809CB80;
        goto LABEL_30;
      }
      sub_237FFBAB0(v3, v4);
      v42 = *((_QWORD *)&v31 + 1);
      v41 = v31;
LABEL_29:
      sub_237FFBAB0(v41, v42);
      v39 = *(uint64_t (**)(void))(v0 + 8);
      return v39();
    }
    v15 = *(id *)(v0 + 336);
  }
  else
  {
    v9 = **(_QWORD **)(v0 + 328);
    v10 = type metadata accessor for X509Policy();
    if (!*(_QWORD *)(v9 + 16)
      || (v11 = sub_23800DEDC(v10, (uint64_t)&protocol witness table for X509Policy, 0x65746164696C6176, 0xED00007472654364), (v12 & 1) == 0)|| (sub_238016570(*(_QWORD *)(v9 + 56) + 32 * v11, v0 + 144), __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568C5E28), (swift_dynamicCast() & 1) == 0)|| (v13 = *(void **)(v0 + 16)) == 0)
    {
      sub_23809D1C8();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      goto LABEL_25;
    }
    v14 = *(void **)(v0 + 24);
    v15 = v14;
    sub_238075CD0(v13, v14);
    v1 = *(void **)(v0 + 336);
  }
  *(_QWORD *)(v0 + 408) = v15;
  v16 = *(uint64_t **)(v0 + 320);
  v17 = *v16;
  v18 = v16[1];
  sub_23801B63C(v1);
  sub_237FFBA20(v17, v18);
  v19 = v15;
  SEP.Attestation.init(from:signer:)(v17, v18, v19);
  v47 = v0 + 176;
  v48 = v0 + 240;
  v21 = v51;
  *(_OWORD *)(v0 + 416) = v51;
  v23 = *((_QWORD *)&v52 + 1);
  v22 = v52;
  *(_QWORD *)(v0 + 432) = v52;
  *(_QWORD *)(v0 + 440) = v23;
  if (qword_2568C50A8 != -1)
    swift_once();
  v24 = sub_2380BD808();
  __swift_project_value_buffer(v24, (uint64_t)qword_2568C8C58);
  v25 = sub_2380BD7F0();
  v26 = sub_2380BDF70();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_237FF6000, v25, v26, "AttestationBundle passed SEPAttestationPolicy: SEP attestation signed by trusted authority", v27, 2u);
    MEMORY[0x23B82B830](v27, -1, -1);
  }
  v28 = *(_QWORD *)(v0 + 344);

  *(_QWORD *)(v0 + 264) = &type metadata for SEP.Attestation;
  v29 = swift_allocObject();
  *(_QWORD *)(v0 + 240) = v29;
  *(_OWORD *)(v29 + 16) = v21;
  *(_QWORD *)(v29 + 32) = v22;
  *(_QWORD *)(v29 + 40) = v23;
  sub_238024D10(v48, v47);
  sub_237FFBA20(v21, *((unint64_t *)&v21 + 1));
  sub_237FFBA20(v22, v23);
  sub_238022FD8(v47, (uint64_t)&type metadata for SEPAttestationPolicy, (uint64_t)&protocol witness table for SEPAttestationPolicy, 0xD000000000000014, 0x80000002380C7EE0);
  sub_238037344(v48);
  if (!v28)
  {

    sub_237FFBAB0(v21, *((unint64_t *)&v21 + 1));
    v41 = v22;
    v42 = v23;
    goto LABEL_29;
  }
  v30 = *(void (**)(__int128 *))(v0 + 344);
  v51 = v21;
  *(_QWORD *)&v52 = v22;
  *((_QWORD *)&v52 + 1) = v23;
  swift_retain();
  v30(&v51);
  v43 = *(_QWORD *)(v0 + 88);
  v44 = *(_QWORD *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), v43);
  v49 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v44 + 8) + *(_QWORD *)(v44 + 8));
  v45 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v45;
  v46 = sub_23809CC54;
LABEL_30:
  *v45 = v0;
  v45[1] = v46;
  return v49(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 328), v43, v44);
}

uint64_t sub_23809CB80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23809CBE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 376);
  v1 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 344);
  sub_237FFBAB0(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 368));
  sub_237FFBAB0(v2, v1);
  sub_23801B358(v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23809CC54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 456) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23809CCB8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 432);
  v1 = *(_QWORD *)(v0 + 440);
  v4 = *(_QWORD *)(v0 + 416);
  v3 = *(_QWORD *)(v0 + 424);
  v5 = *(_QWORD *)(v0 + 344);

  sub_237FFBAB0(v4, v3);
  sub_237FFBAB0(v2, v1);
  sub_23801B358(v5);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23809CD40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 376);
  v1 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 344);
  sub_237FFBAB0(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 368));
  sub_237FFBAB0(v2, v1);
  sub_23801B358(v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23809CDB0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  id v24;

  v2 = *(_QWORD *)(v0 + 432);
  v1 = *(_QWORD *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 344);
  sub_237FFBAB0(*(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 424));
  sub_237FFBAB0(v2, v1);
  sub_23801B358(v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  v4 = *(void **)(v0 + 456);
  *(_QWORD *)(v0 + 312) = v4;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
  if (swift_dynamicCast() && *(_BYTE *)(v0 + 464) == 3)
  {

    if (qword_2568C50A8 != -1)
      swift_once();
    v6 = sub_2380BD808();
    __swift_project_value_buffer(v6, (uint64_t)qword_2568C8C58);
    v7 = sub_2380BD7F0();
    v8 = sub_2380BDF64();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_237FF6000, v7, v8, "SEP Attestation signature failed verification", v9, 2u);
      MEMORY[0x23B82B830](v9, -1, -1);
    }
    v10 = *(void **)(v0 + 408);

    sub_23809D1C8();
    swift_allocError();
    *v11 = 0;
    swift_willThrow();

    v12 = *(void **)(v0 + 312);
  }
  else
  {

    if (qword_2568C50A8 != -1)
      swift_once();
    v13 = sub_2380BD808();
    __swift_project_value_buffer(v13, (uint64_t)qword_2568C8C58);
    v14 = v4;
    v15 = v4;
    v16 = sub_2380BD7F0();
    v17 = sub_2380BDF64();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v18 = 138543362;
      v20 = v4;
      v21 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 304) = v21;
      sub_2380BDF94();
      *v19 = v21;

      _os_log_impl(&dword_237FF6000, v16, v17, "SEP Attestation verification failed with unknown reason: %{public}@", v18, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E08);
      swift_arrayDestroy();
      MEMORY[0x23B82B830](v19, -1, -1);
      MEMORY[0x23B82B830](v18, -1, -1);
    }
    else
    {

    }
    v22 = *(void **)(v0 + 408);

    sub_23809D1C8();
    swift_allocError();
    *v23 = v4;
    v24 = v4;
    swift_willThrow();

    v12 = v4;
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23809D120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;

  v6 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_238013814;
  *(_QWORD *)(v6 + 320) = a1;
  *(_QWORD *)(v6 + 328) = a2;
  *(_OWORD *)(v6 + 336) = *(_OWORD *)v2;
  *(_QWORD *)(v6 + 352) = *(_QWORD *)(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_23809D19C()
{
  uint64_t v0;

  sub_237FFBAB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  sub_237FFBAB0(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return swift_deallocObject();
}

unint64_t sub_23809D1C8()
{
  unint64_t result;

  result = qword_2568C8C78;
  if (!qword_2568C8C78)
  {
    result = MEMORY[0x23B82B770](&protocol conformance descriptor for SEPAttestationPolicy.Error, &type metadata for SEPAttestationPolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8C78);
  }
  return result;
}

uint64_t sub_23809D20C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    v3 = *(_QWORD *)(a1 + 16);
  else
    v3 = 0;
  *a2 = v2;
  a2[1] = v3;
  return sub_23801B64C(v2);
}

uint64_t sub_23809D224(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *a1;
  if (*a1)
    v4 = a1[1];
  else
    v4 = 0;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23801B64C(*a1);
  result = sub_23801B358(v5);
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v4;
  return result;
}

void destroy for SEPAttestationPolicy(uint64_t a1)
{
  if (*(_QWORD *)a1 >= 2uLL)

  if (*(_QWORD *)(a1 + 8))
    swift_release();
}

_QWORD *_s16CloudAttestation20SEPAttestationPolicyVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)a2;
  if (*(_QWORD *)a2 >= 2uLL)
    v5 = v4;
  *a1 = v4;
  v6 = *(_QWORD *)(a2 + 8);
  if (v6)
  {
    v7 = *(_QWORD *)(a2 + 16);
    a1[1] = v6;
    a1[2] = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  }
  return a1;
}

uint64_t assignWithCopy for SEPAttestationPolicy(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  if (*(_QWORD *)a1 < 2uLL)
  {
    if ((unint64_t)v5 >= 2)
    {
      *(_QWORD *)a1 = v5;
      v6 = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ((unint64_t)v5 < 2)
  {

    v5 = *(void **)a2;
LABEL_6:
    *(_QWORD *)a1 = v5;
    goto LABEL_8;
  }
  *(_QWORD *)a1 = v5;
  v7 = v5;

LABEL_8:
  v8 = *(_QWORD *)(a2 + 8);
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 8) = v8;
      *(_QWORD *)(a1 + 16) = v10;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_14;
  }
  v9 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 16) = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SEPAttestationPolicy(uint64_t a1, _QWORD *a2)
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(void **)a1;
  v5 = *a2;
  if (*(_QWORD *)a1 < 2uLL)
    goto LABEL_4;
  if (v5 < 2)
  {

LABEL_4:
    *(_QWORD *)a1 = v5;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = v5;

LABEL_6:
  v6 = a2[1];
  if (!*(_QWORD *)(a1 + 8))
  {
    if (v6)
    {
      v8 = a2[2];
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = v8;
      return a1;
    }
LABEL_12:
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_12;
  }
  v7 = a2[2];
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SEPAttestationPolicy(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SEPAttestationPolicy(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SEPAttestationPolicy()
{
  return &type metadata for SEPAttestationPolicy;
}

_QWORD *initializeBufferWithCopyOfBuffer for SEPAttestationPolicy.SignerLoader(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for SEPAttestationPolicy.SignerLoader(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for SEPAttestationPolicy.SignerLoader(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  v5 = v4;

  return a1;
}

void **assignWithTake for SEPAttestationPolicy.SignerLoader(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

ValueMetadata *type metadata accessor for SEPAttestationPolicy.SignerLoader()
{
  return &type metadata for SEPAttestationPolicy.SignerLoader;
}

uint64_t _s16CloudAttestation20SEPAttestationPolicyV12SignerLoaderOwet_0(uint64_t *a1, unsigned int a2)
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

uint64_t _s16CloudAttestation20SEPAttestationPolicyV12SignerLoaderOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for SEPAttestationPolicy.Error()
{
  return &type metadata for SEPAttestationPolicy.Error;
}

unint64_t sub_23809D774@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;
  char v5;

  result = sub_23809EC60(a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 9) = v5 & 1;
  return result;
}

uint64_t sub_23809D7A4()
{
  uint64_t *v0;
  uint64_t result;

  result = *v0;
  if (*((_BYTE *)v0 + 8) == 1)
    return qword_2380C5520[result];
  return result;
}

unint64_t sub_23809D7C4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;
  char v5;

  result = sub_23809EC60(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 9) = v5 & 1;
  return result;
}

void sub_23809D7F8(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  if (*((_BYTE *)v1 + 8) == 1)
    v2 = qword_2380C5520[v2];
  *a1 = v2;
}

uint64_t sub_23809D81C()
{
  sub_23809E404();
  return sub_2380BD634();
}

BOOL sub_23809D854(uint64_t a1, uint64_t a2)
{
  return sub_238078268(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

void sub_23809D870()
{
  qword_2568CA008 = (uint64_t)&unk_2509D95D0;
}

uint64_t sub_23809D884@<X0>(_QWORD *a1@<X8>)
{
  if (qword_2568C50B0 != -1)
    swift_once();
  *a1 = qword_2568CA008;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23809D8D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA010);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA010);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380C51C0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "ENVIRONMENT_UNSPECIFIED";
  *(_QWORD *)(v7 + 8) = 23;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "ENVIRONMENT_PRODUCTION";
  *(_QWORD *)(v11 + 8) = 22;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "ENVIRONMENT_CARRY";
  *((_QWORD *)v13 + 1) = 17;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "ENVIRONMENT_STAGING";
  *((_QWORD *)v15 + 1) = 19;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "ENVIRONMENT_QA";
  *((_QWORD *)v17 + 1) = 14;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "ENVIRONMENT_PERF";
  *((_QWORD *)v19 + 1) = 16;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "ENVIRONMENT_EPHEMERAL";
  *((_QWORD *)v21 + 1) = 21;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 7;
  *(_QWORD *)v23 = "ENVIRONMENT_DEV";
  *((_QWORD *)v23 + 1) = 15;
  v23[16] = 2;
  v10();
  v24 = v6 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 8 * v3) = 98;
  *(_QWORD *)v24 = "ENVIRONMENT_QA2PRIMARY";
  *(_QWORD *)(v24 + 8) = 22;
  *(_BYTE *)(v24 + 16) = 2;
  v10();
  v25 = (_QWORD *)(v6 + 9 * v3);
  v26 = (char *)v25 + *(int *)(v1 + 48);
  *v25 = 99;
  *(_QWORD *)v26 = "ENVIRONMENT_QA2INTERNAL";
  *((_QWORD *)v26 + 1) = 23;
  v26[16] = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_23809DBE4@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C50B8, (uint64_t)qword_2568CA010, a1);
}

uint64_t sub_23809DC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA028);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA028);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BFC90;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "data";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "metadata";
  *(_QWORD *)(v11 + 8) = 8;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "type";
  *((_QWORD *)v13 + 1) = 4;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "permitted_environments";
  *((_QWORD *)v15 + 1) = 22;
  v15[16] = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_23809DDC8()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_2380BD658();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          v4 = v3;
          sub_2380BD6A0();
          goto LABEL_5;
        case 3:
          sub_238001E80();
          v4 = v3;
          sub_2380BD688();
          goto LABEL_5;
        case 4:
          sub_23809E404();
          v4 = v3;
          sub_2380BD670();
LABEL_5:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_2380BD658();
    }
  }
  return result;
}

void sub_23809DEEC()
{
  __asm { BR              X10 }
}

uint64_t sub_23809DF38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((a2 & 0xFF000000000000) == 0 || (result = sub_2380BD784(), !v2))
    __asm { BR              X10 }
  return result;
}

uint64_t sub_23809E0B0@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_2380BEAE0;
  *(_OWORD *)(a1 + 16) = xmmword_2380BEAE0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = MEMORY[0x24BEE4AF8];
  return sub_2380BD5BC();
}

unint64_t sub_23809E0F0()
{
  return 0xD000000000000028;
}

uint64_t sub_23809E10C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23809E14C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 32);
  v5 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_23809E18C())()
{
  return nullsub_1;
}

uint64_t sub_23809E1A0()
{
  return sub_23809DDC8();
}

void sub_23809E1B4()
{
  sub_23809DEEC();
}

uint64_t sub_23809E1C8()
{
  sub_238001820(&qword_2568C8CB8, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C529C);
  return sub_2380BD628();
}

uint64_t sub_23809E218@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C50C0, (uint64_t)qword_2568CA028, a1);
}

uint64_t sub_23809E234()
{
  sub_238001820(&qword_2568C8C90, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C52D4);
  return sub_2380BD718();
}

uint64_t sub_23809E274()
{
  sub_238001820(&qword_2568C8C90, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C52D4);
  return sub_2380BD724();
}

uint64_t sub_23809E2C8()
{
  return sub_238001820(&qword_2568C8C88, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C51E4);
}

uint64_t type metadata accessor for PrivateCloudCompute_TransparencyLogEntry()
{
  uint64_t result;

  result = qword_2568C8D20;
  if (!qword_2568C8D20)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23809E330()
{
  return sub_238001820(&qword_2568C8C90, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C52D4);
}

uint64_t sub_23809E35C()
{
  return sub_238001820(&qword_2568C8C98, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C520C);
}

uint64_t sub_23809E388()
{
  return sub_238001820(&qword_2568C8CA0, (uint64_t (*)(uint64_t))type metadata accessor for PrivateCloudCompute_TransparencyLogEntry, (uint64_t)&unk_2380C524C);
}

unint64_t sub_23809E3B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568C8CA8;
  if (!qword_2568C8CA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568C8CB0);
    result = MEMORY[0x23B82B770](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2568C8CA8);
  }
  return result;
}

unint64_t sub_23809E404()
{
  unint64_t result;

  result = qword_2568C8CC0;
  if (!qword_2568C8CC0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C54D0, &type metadata for PrivateCloudCompute_Environment);
    atomic_store(result, (unint64_t *)&qword_2568C8CC0);
  }
  return result;
}

uint64_t sub_23809E448(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  v4 = sub_2380BD5C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v21 - v9;
  sub_238008ED0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  if ((v11 & 1) == 0)
    goto LABEL_10;
  sub_238008ED0(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if ((v12 & 1) == 0)
    goto LABEL_10;
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40) == 1)
    v13 = qword_2380C5570[v13];
  v14 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(a2 + 40))
    __asm { BR              X11 }
  if (v13 == v14 && (sub_238003928(*(_QWORD *)(a1 + 48), *(_QWORD *)(a2 + 48)) & 1) != 0)
  {
    v15 = type metadata accessor for PrivateCloudCompute_TransparencyLogEntry();
    v16 = a1 + *(int *)(v15 + 32);
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v10, v16, v4);
    v17(v8, a2 + *(int *)(v15 + 32), v4);
    sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v18 = sub_2380BDCE8();
    v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v8, v4);
    v19(v10, v4);
  }
  else
  {
LABEL_10:
    v18 = 0;
  }
  return v18 & 1;
}

ValueMetadata *type metadata accessor for PrivateCloudCompute_Environment()
{
  return &type metadata for PrivateCloudCompute_Environment;
}

unint64_t sub_23809E634(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_QWORD *)(a2 + 8);
    sub_237FFBA20(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    v9 = *(_QWORD *)(a2 + 16);
    v10 = *(_QWORD *)(a2 + 24);
    sub_237FFBA20(v9, v10);
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)(a1 + 24) = v10;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    v11 = *(int *)(a3 + 32);
    v12 = a1 + v11;
    v13 = a2 + v11;
    v14 = sub_2380BD5C8();
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_23809E710(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_237FFBAB0(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_23809E76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  sub_237FFBA20(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  sub_237FFBA20(v8, v9);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v10 = *(int *)(a3 + 32);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2380BD5C8();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  v14(v11, v12, v13);
  return a1;
}

uint64_t sub_23809E81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  sub_237FFBA20(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  sub_237FFBAB0(v8, v9);
  v10 = *(_QWORD *)(a2 + 16);
  v11 = *(_QWORD *)(a2 + 24);
  sub_237FFBA20(v10, v11);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v11;
  sub_237FFBAB0(v12, v13);
  v14 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v14;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = *(int *)(a3 + 32);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t sub_23809E8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v5 = *(int *)(a3 + 32);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_23809E954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_237FFBAB0(v6, v7);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_237FFBAB0(v8, v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 32);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_23809E9F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23809EA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2380BD5C8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_23809EA7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23809EA88(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 48) = (a2 - 1);
  }
  else
  {
    v7 = sub_2380BD5C8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23809EAFC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BD5C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23809EB8C()
{
  unint64_t result;

  result = qword_2568C8D68;
  if (!qword_2568C8D68)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5430, &type metadata for PrivateCloudCompute_Environment);
    atomic_store(result, (unint64_t *)&qword_2568C8D68);
  }
  return result;
}

unint64_t sub_23809EBD4()
{
  unint64_t result;

  result = qword_2568C8D70;
  if (!qword_2568C8D70)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5458, &type metadata for PrivateCloudCompute_Environment);
    atomic_store(result, (unint64_t *)&qword_2568C8D70);
  }
  return result;
}

unint64_t sub_23809EC1C()
{
  unint64_t result;

  result = qword_2568C8D78;
  if (!qword_2568C8D78)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5498, &type metadata for PrivateCloudCompute_Environment);
    atomic_store(result, (unint64_t *)&qword_2568C8D78);
  }
  return result;
}

unint64_t sub_23809EC60(unint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 9;
  v2 = 8;
  if (result != 98)
    v2 = result;
  if (result != 99)
    v1 = v2;
  if (result >= 8)
    return v1;
  return result;
}

CloudAttestation::EnsembleMembersPolicy __swiftcall EnsembleMembersPolicy.init(required:)(Swift::Bool required)
{
  uint64_t v1;
  CloudAttestation::EnsembleMembersPolicy result;

  *(_BYTE *)v1 = required;
  *(_QWORD *)(v1 + 8) = 0;
  *(_BYTE *)(v1 + 16) = 0;
  result.required = required;
  return result;
}

uint64_t sub_23809ECB4()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568CA040);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA040);
  return sub_2380BD7FC();
}

uint64_t EnsembleMembersPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 32) = *(_BYTE *)v2;
  v4 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = v4;
  *(_BYTE *)(v3 + 33) = *(_BYTE *)(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_23809ED60()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  const char *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v20;
  char v21;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_BYTE *)(v0 + 33);
    v2 = *(_QWORD *)(v0 + 24);
  }
  else
  {
    AttestationPolicyContext.validatedDarwinInit.getter((uint64_t)&v20);
    v2 = v20;
    if (!v20)
    {
      if (*(_BYTE *)(v0 + 32) == 1)
      {
        if (qword_2568C50C8 != -1)
          swift_once();
        v13 = sub_2380BD808();
        __swift_project_value_buffer(v13, (uint64_t)qword_2568CA040);
        v5 = sub_2380BD7F0();
        v14 = sub_2380BDF64();
        if (!os_log_type_enabled(v5, v14))
        {
          v8 = 0;
          goto LABEL_30;
        }
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_237FF6000, v5, v14, "Validated darwin-init not available", v7, 2u);
        v8 = 0;
        goto LABEL_20;
      }
      if (qword_2568C50C8 != -1)
        swift_once();
      v15 = sub_2380BD808();
      __swift_project_value_buffer(v15, (uint64_t)qword_2568CA040);
      v10 = sub_2380BD7F0();
      v11 = sub_2380BDF64();
      if (!os_log_type_enabled(v10, v11))
        goto LABEL_27;
      v12 = "Validated darwin-init not available, failing open";
      goto LABEL_26;
    }
    v1 = v21;
  }
  v20 = v2;
  v21 = v1;
  swift_bridgeObjectRetain();
  v3 = DarwinInit.ensembleCertificateFingerprints.getter();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v3)
  {
    if (*(_BYTE *)(v0 + 32) == 1)
    {
      if (qword_2568C50C8 != -1)
        swift_once();
      v4 = sub_2380BD808();
      __swift_project_value_buffer(v4, (uint64_t)qword_2568CA040);
      v5 = sub_2380BD7F0();
      v6 = sub_2380BDF64();
      if (!os_log_type_enabled(v5, v6))
      {
        v8 = 1;
        goto LABEL_30;
      }
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_237FF6000, v5, v6, "Ensemble member fingerprints not found in secure-config", v7, 2u);
      v8 = 1;
LABEL_20:
      MEMORY[0x23B82B830](v7, -1, -1);
LABEL_30:

      sub_23809F130();
      swift_allocError();
      *v18 = v8;
      swift_willThrow();
      v17 = *(uint64_t (**)(void))(v0 + 8);
      return v17();
    }
    if (qword_2568C50C8 != -1)
      swift_once();
    v9 = sub_2380BD808();
    __swift_project_value_buffer(v9, (uint64_t)qword_2568CA040);
    v10 = sub_2380BD7F0();
    v11 = sub_2380BDF64();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_27;
    v12 = "Ensemble member fingerprints not found in secure-config, failing open";
LABEL_26:
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_237FF6000, v10, v11, v12, v16, 2u);
    MEMORY[0x23B82B830](v16, -1, -1);
LABEL_27:

  }
  v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_23809F0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)v5 = v3;
  *(_QWORD *)(v5 + 8) = sub_238013814;
  *(_BYTE *)(v5 + 32) = *(_BYTE *)v2;
  v6 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = v6;
  *(_BYTE *)(v5 + 33) = *(_BYTE *)(v2 + 16);
  return swift_task_switch();
}

unint64_t sub_23809F130()
{
  unint64_t result;

  result = qword_2568C8D88;
  if (!qword_2568C8D88)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5644, &type metadata for EnsembleMembersPolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8D88);
  }
  return result;
}

uint64_t sub_23809F178(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EnsembleMembersPolicy(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for EnsembleMembersPolicy(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnsembleMembersPolicy(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EnsembleMembersPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for EnsembleMembersPolicy()
{
  return &type metadata for EnsembleMembersPolicy;
}

uint64_t storeEnumTagSinglePayload for EnsembleMembersPolicy.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23809F358 + 4 * byte_2380C55A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23809F38C + 4 * byte_2380C55A0[v4]))();
}

uint64_t sub_23809F38C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23809F394(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23809F39CLL);
  return result;
}

uint64_t sub_23809F3A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23809F3B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23809F3B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23809F3BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EnsembleMembersPolicy.Error()
{
  return &type metadata for EnsembleMembersPolicy.Error;
}

unint64_t sub_23809F3DC()
{
  unint64_t result;

  result = qword_2568C8D98;
  if (!qword_2568C8D98)
  {
    result = MEMORY[0x23B82B770](&unk_2380C561C, &type metadata for EnsembleMembersPolicy.Error);
    atomic_store(result, (unint64_t *)&qword_2568C8D98);
  }
  return result;
}

uint64_t SEP.SealData.init(for:data:)@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  unint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v6 = a2 >> 62;
  sub_237FFBA20(a1, a2);
  sub_237FFBA20(a1, a2);
  sub_238008ED0(a1, a2);
  v8 = v7;
  sub_237FFBAB0(a1, a2);
  if ((v8 & 1) != 0)
    __asm { BR              X10 }
  sub_237FFBA20(a1, a2);
  sub_238008ED0(a1, a2);
  v10 = v9;
  sub_237FFBAB0(a1, a2);
  sub_237FFBAB0(a1, a2);
  if ((v10 & 1) != 0)
    __asm { BR              X10 }
  if (qword_2568C50D0 != -1)
    swift_once();
  v11 = sub_2380BD808();
  __swift_project_value_buffer(v11, (uint64_t)qword_2568C8DA0);
  sub_237FFBA20(a1, a2);
  sub_237FFBA20(a1, a2);
  v12 = sub_2380BD7F0();
  v13 = sub_2380BDF64();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    *(_QWORD *)&v20 = v15;
    *(_DWORD *)v14 = 136446210;
    v16 = sub_2380BD364();
    v21 = sub_238013968(v16, v17, (uint64_t *)&v20);
    sub_2380BDF94();
    swift_bridgeObjectRelease();
    sub_237FFBAB0(a1, a2);
    sub_237FFBAB0(a1, a2);
    _os_log_impl(&dword_237FF6000, v12, v13, "unknown SealDataA format: %{public}s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B82B830](v15, -1, -1);
    MEMORY[0x23B82B830](v14, -1, -1);
  }
  else
  {
    sub_237FFBAB0(a1, a2);
    sub_237FFBAB0(a1, a2);
  }

  result = sub_238006B6C(a1, a2);
  *a3 = result;
  a3[1] = v19;
  a3[2] = 0;
  return result;
}

uint64_t SEP.SealData.digest.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  if ((v1 & 0x2000000000000000) != 0)
    v2 = v0[1];
  else
    v2 = *v0;
  sub_23809FD50(*v0, v0[1], v1, (uint64_t (*)(void))sub_237FFBA20);
  return v2;
}

uint64_t sub_23809F810()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568C8DA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568C8DA0);
  return sub_2380BD7FC();
}

double SEP.SealData.init(for:data:)@<D0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;

  SEP.SealData.init(for:data:)(a1, a2, (uint64_t *)&v6);
  v4 = v7;
  result = *(double *)&v6;
  *(_OWORD *)a3 = v6;
  *(_QWORD *)(a3 + 16) = v4;
  return result;
}

void sub_23809F8C0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

void sub_23809F904()
{
  uint64_t v0;

  if (qword_2568C50D8 != -1)
    swift_once();
  if (BYTE6(v0) == qword_2568CA058)
  {
    sub_2380BD3C4();
    sub_2380BD3C4();
    sub_2380BD3C4();
    sub_2380BD3C4();
    __asm { BR              X10 }
  }
  __break(1u);
  JUMPOUT(0x23809FA48);
}

uint64_t sub_23809FA74()
{
  uint64_t result;

  result = sub_2380BD850();
  if (__OFADD__(result, 4))
    __break(1u);
  else
    qword_2568CA058 = result + 4;
  return result;
}

uint64_t SEP.SealData.serializedBytes.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  if ((v3 & 0x2000000000000000) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5D88);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2380BFC90;
    *(_BYTE *)(v5 + 32) = BYTE3(v1);
    *(_BYTE *)(v5 + 33) = BYTE2(v1);
    *(_BYTE *)(v5 + 34) = BYTE1(v1);
    *(_BYTE *)(v5 + 35) = v1;
    sub_23809FD50(v1, v2, v3, (uint64_t (*)(void))sub_237FFBA20);
    v6 = sub_23800A2B8(v5);
    v8 = v7;
    swift_bridgeObjectRelease();
    sub_23809FD50(v1, v2, v3, (uint64_t (*)(void))sub_237FFBA20);
    sub_237FFBA20(v6, v8);
    sub_238081B14(v2, v3 & 0xDFFFFFFFFFFFFFFFLL);
    sub_23809FD50(v1, v2, v3, (uint64_t (*)(void))sub_237FFBAB0);
    sub_23809FD50(v1, v2, v3, (uint64_t (*)(void))sub_237FFBAB0);
    sub_237FFBAB0(v6, v8);
    return v6;
  }
  else
  {
    sub_237FFBA20(*v0, v0[1]);
    return sub_238006B6C(v1, v2);
  }
}

uint64_t _s16CloudAttestation3SEPO8SealDataO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  if ((v4 & 0x2000000000000000) != 0)
  {
    if ((v7 & 0x2000000000000000) != 0 && (_DWORD)v2 == (_DWORD)v5)
    {
      sub_23809FD50(*a2, a2[1], v7, (uint64_t (*)(void))sub_237FFBA20);
      sub_23809FD50(v2, v3, v4, (uint64_t (*)(void))sub_237FFBA20);
      v8 = v3;
      v9 = v4 & 0xDFFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
LABEL_8:
    sub_23809FD50(*a2, a2[1], v7, (uint64_t (*)(void))sub_237FFBA20);
    sub_23809FD50(v2, v3, v4, (uint64_t (*)(void))sub_237FFBA20);
    v11 = 0;
    goto LABEL_9;
  }
  if ((v7 & 0x2000000000000000) != 0)
    goto LABEL_8;
  sub_23809FD50(*a2, a2[1], v7, (uint64_t (*)(void))sub_237FFBA20);
  sub_23809FD50(v2, v3, v4, (uint64_t (*)(void))sub_237FFBA20);
  v8 = v2;
  v9 = v3;
LABEL_7:
  sub_238008ED0(v8, v9);
  v11 = v10;
LABEL_9:
  sub_23809FD50(v2, v3, v4, (uint64_t (*)(void))sub_237FFBAB0);
  sub_23809FD50(v5, v6, v7, (uint64_t (*)(void))sub_237FFBAB0);
  return v11 & 1;
}

uint64_t sub_23809FD50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if ((a3 & 0x2000000000000000) != 0)
    return ((uint64_t (*)(uint64_t, unint64_t))a4)(a2, a3 & 0xDFFFFFFFFFFFFFFFLL);
  else
    return a4();
}

uint64_t _s8SealDataOwxx(uint64_t *a1)
{
  return sub_23809FD50(*a1, a1[1], a1[2], (uint64_t (*)(void))sub_237FFBAB0);
}

uint64_t *_s8SealDataOwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_23809FD50(*a2, v4, v5, (uint64_t (*)(void))sub_237FFBA20);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return a1;
}

uint64_t *_s8SealDataOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  sub_23809FD50(*a2, v4, v5, (uint64_t (*)(void))sub_237FFBA20);
  v6 = *a1;
  v7 = a1[1];
  v8 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  sub_23809FD50(v6, v7, v8, (uint64_t (*)(void))sub_237FFBAB0);
  return a1;
}

uint64_t *_s8SealDataOwta(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *a1;
  v6 = a1[1];
  v5 = a1[2];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v3;
  sub_23809FD50(v4, v6, v5, (uint64_t (*)(void))sub_237FFBAB0);
  return a1;
}

uint64_t _s8SealDataOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 3 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 3);
  v3 = ((2 * ((*(_QWORD *)(a1 + 16) & 0x1000000000000000) != 0)) | ((*(_QWORD *)(a1 + 16) >> 60) >> 1) & 1) ^ 3;
  if (v3 >= 2)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s8SealDataOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 3;
    if (a3 >= 3)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 3)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)((2 * (a2 & 1)) | 1) << 60;
    }
  }
  return result;
}

uint64_t sub_23809FF34(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 16) >> 61) & 1;
}

uint64_t sub_23809FF40(uint64_t result)
{
  *(_QWORD *)(result + 16) &= ~0x2000000000000000uLL;
  return result;
}

uint64_t sub_23809FF50(uint64_t result, char a2)
{
  *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 1) << 61);
  return result;
}

ValueMetadata *type metadata accessor for SEP.SealData()
{
  return &type metadata for SEP.SealData;
}

char *_s5ErrorOwCP(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v9[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v10 = *a2;
      v11 = v10;
      *(_QWORD *)a1 = v10;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_2380BDB20();
      (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void _s5ErrorOwxx(id *a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {

  }
  else if (!EnumCaseMultiPayload)
  {
    v3 = sub_2380BDB20();
    (*(void (**)(id *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
}

_QWORD *_s5ErrorOwcp(_QWORD *a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  void *v8;
  id v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v8 = *a2;
    v9 = v8;
    *a1 = v8;
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_2380BDB20();
    (*(void (**)(_QWORD *, void **, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void **_s5ErrorOwca(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  void *v8;
  id v9;

  if (a1 != a2)
  {
    sub_2380A022C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v8 = *a2;
      v9 = v8;
      *a1 = v8;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_2380BDB20();
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2380A022C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ProvisioningCertificate.Error();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ProvisioningCertificate.Error()
{
  uint64_t result;

  result = qword_2568C8E28;
  if (!qword_2568C8E28)
    return swift_getSingletonMetadata();
  return result;
}

void *_s5ErrorOwtk(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_2380BDB20();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *_s5ErrorOwta(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2380A022C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_2380BDB20();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2380A03C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BDB20();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2380A0430(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[15];
  uint64_t v32;
  uint64_t v33;
  char v34;

  v3 = v1;
  v5 = sub_2380BD598();
  v31[8] = *(_QWORD *)(v5 - 8);
  v31[9] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v31[6] = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v31[5] = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v31[7] = (char *)v31 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9C00);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v31[10] = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v31[11] = (char *)v31 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v31[12] = (char *)v31 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v31[13] = (char *)v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  MEMORY[0x24BDAC7A8](v23);
  v31[14] = (char *)v31 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8FC8);
  v32 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)v31 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A5240();
  v28 = v3;
  sub_2380BE288();
  v29 = *(_QWORD *)(v3 + 32);
  if (*(_QWORD *)(v29 + 16))
    swift_bridgeObjectRetain();
  else
    v29 = 0;
  v33 = v29;
  v34 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F70);
  sub_2380A5088();
  sub_2380BE150();
  if (!v2)
  {
    v31[4] = v13;
    swift_bridgeObjectRelease();
    __asm { BR              X10 }
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v27, v25);
}

uint64_t sub_2380A0D24()
{
  sub_2380BD988();
  if (swift_dynamicCastMetatype())
    return 1;
  sub_2380BD9AC();
  return 2 * (swift_dynamicCastMetatype() != 0);
}

uint64_t sub_2380A0D80(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2380A0DBC + 4 * byte_2380C5744[a1]))(0xD00000000000001CLL, 0x80000002380C9810);
}

uint64_t sub_2380A0DBC()
{
  return 0x7365747441706573;
}

uint64_t sub_2380A0DE0()
{
  return 0x74656B6369547061;
}

uint64_t sub_2380A0DF8()
{
  return 0x614864656C616573;
}

unint64_t sub_2380A0E18()
{
  return 0xD000000000000012;
}

uint64_t sub_2380A0E34()
{
  return 0x726970784579656BLL;
}

uint64_t sub_2380A0E60()
{
  unsigned __int8 *v0;

  return sub_2380A0D80(*v0);
}

uint64_t sub_2380A0E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6230(a1, a2);
  *a3 = result;
  return result;
}

void sub_2380A0E8C(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2380A0E98()
{
  sub_2380A5240();
  return sub_2380BE2A0();
}

uint64_t sub_2380A0EC0()
{
  sub_2380A5240();
  return sub_2380BE2AC();
}

uint64_t sub_2380A0EE8(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8E60);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4C18();
  sub_2380BE288();
  v8 = *v2;
  if (*(_QWORD *)(v8 + 16))
    swift_bridgeObjectRetain();
  else
    v8 = 0;
  v10[1] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8E70);
  sub_2380A4C5C();
  sub_2380BE150();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2380A1018()
{
  return 0x73746F6C73;
}

uint64_t sub_2380A102C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x73746F6C73 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2380BE1B0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_2380A10B8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2380A10C4()
{
  sub_2380A4C18();
  return sub_2380BE2A0();
}

uint64_t sub_2380A10EC()
{
  sub_2380A4C18();
  return sub_2380BE2AC();
}

uint64_t sub_2380A1114(_QWORD *a1)
{
  return sub_2380A0EE8(a1);
}

uint64_t sub_2380A1128(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  BOOL v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8E88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4CE0();
  sub_2380BE288();
  v9 = *((_BYTE *)v3 + 8);
  v10 = *v3 == 0;
  v11 = *v3 != 0;
  v16 = *v3;
  v17 = v11 & v9;
  v18 = v10;
  v15 = 0;
  sub_2380A4D24();
  sub_2380BE150();
  if (!v2)
  {
    v12 = v3[2];
    if (*(_QWORD *)(v12 + 16))
      swift_bridgeObjectRetain();
    else
      v12 = 0;
    v16 = v12;
    v15 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8EA0);
    sub_2380A4D68();
    sub_2380BE150();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2380A12B4()
{
  _BYTE *v0;

  if (*v0)
    return 0x73656972746E65;
  else
    return 0x676C4168736168;
}

uint64_t sub_2380A12E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6508(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A130C()
{
  sub_2380A4CE0();
  return sub_2380BE2A0();
}

uint64_t sub_2380A1334()
{
  sub_2380A4CE0();
  return sub_2380BE2AC();
}

uint64_t sub_2380A135C(_QWORD *a1)
{
  return sub_2380A1128(a1);
}

void sub_2380A1370(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v2 = v1;
  v19 = type metadata accessor for Proto_SecureConfig(0);
  MEMORY[0x24BDAC7A8](v19);
  v25 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Proto_Cryptex.Salt(0);
  MEMORY[0x24BDAC7A8](v18);
  v24 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for Proto_Cryptex(0);
  MEMORY[0x24BDAC7A8](v23);
  v22 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v21 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v20 = (char *)&v17 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v26 = (char *)&v17 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v27 = (char *)&v17 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8EB8);
  v28 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4DE4();
  sub_2380BE288();
  __asm { BR              X10 }
}

uint64_t sub_2380A15A8()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  int EnumCaseMultiPayload;
  uint64_t v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  unint64_t *v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  uint64_t (*v29)(uint64_t);
  uint64_t v30;

  if ((v6 & 0xFF000000000000) != 0)
  {
    sub_237FFBA20(v1, v6);
    v9 = v1;
    v7 = v6;
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v8 - 96) = v9;
  *(_QWORD *)(v8 - 88) = v7;
  *(_BYTE *)(v8 - 68) = 0;
  sub_2380723B0();
  sub_2380BE150();
  if (v5)
  {
    sub_238008CF0(v9, v7);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 104) + 8))(v4, v3);
  }
  sub_238008CF0(v9, v7);
  v10 = *v2 == 0;
  *(_BYTE *)(v8 - 96) = 1;
  *(_BYTE *)(v8 - 68) = v10;
  sub_2380BE15C();
  v12 = (uint64_t)v2 + *(int *)(type metadata accessor for Proto_SealedHash.Entry(0) + 24);
  v13 = *(_QWORD *)(v8 - 112);
  sub_2380051FC(v12, v13, &qword_2568C56E8);
  v14 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48);
  if (v15(v13, 1, v14) != 1)
  {
    v16 = *(_QWORD *)(v8 - 120);
    sub_2380051FC(v13, v16, &qword_2568C56E8);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      if (EnumCaseMultiPayload == 1)
      {
        v18 = *(_QWORD *)(v8 - 168);
        sub_2380051FC(v12, v18, &qword_2568C56E8);
        if (v15(v18, 1, v14) == 1)
        {
          sub_238005240(v18, &qword_2568C56E8);
          v19 = *(_OWORD **)(v8 - 136);
        }
        else
        {
          v23 = swift_getEnumCaseMultiPayload();
          v19 = *(_OWORD **)(v8 - 136);
          if (v23 == 1)
          {
            sub_238001DE4(v18, *(_QWORD *)(v8 - 136), type metadata accessor for Proto_Cryptex.Salt);
LABEL_25:
            *(_BYTE *)(v8 - 96) = 3;
            v26 = (unint64_t *)&unk_2568C8ED0;
            v27 = type metadata accessor for Proto_Cryptex.Salt;
            v28 = &unk_2380C5970;
LABEL_31:
            sub_238001820(v26, v27, (uint64_t)v28);
            sub_2380BE18C();
            v30 = (uint64_t)v19;
            v29 = v27;
            goto LABEL_32;
          }
          sub_237FFD540(v18, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
        }
        sub_2380BD5BC();
        goto LABEL_25;
      }
      v20 = v12;
      v21 = *(_QWORD *)(v8 - 160);
      sub_2380051FC(v20, v21, &qword_2568C56E8);
      if (v15(v21, 1, v14) == 1)
      {
        sub_238005240(v21, &qword_2568C56E8);
        v22 = *(_QWORD *)(v8 - 128);
      }
      else
      {
        v25 = swift_getEnumCaseMultiPayload();
        v22 = *(_QWORD *)(v8 - 128);
        if (v25 == 2)
        {
          sub_238001DE4(v21, *(_QWORD *)(v8 - 128), type metadata accessor for Proto_SecureConfig);
LABEL_28:
          *(_BYTE *)(v8 - 96) = 4;
          sub_238001820(&qword_2568C8EC8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C5948);
          sub_2380BE18C();
          v29 = type metadata accessor for Proto_SecureConfig;
          v30 = v22;
LABEL_32:
          sub_237FFD540(v30, v29);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 104) + 8))(v4, v3);
          sub_237FFD540(v16, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
          return sub_238005240(v13, &qword_2568C56E8);
        }
        sub_237FFD540(v21, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
      }
      *(_OWORD *)v22 = xmmword_2380BEAE0;
      *(_QWORD *)(v22 + 16) = sub_23800C650(MEMORY[0x24BEE4AF8]);
      sub_2380BD5BC();
      goto LABEL_28;
    }
    sub_2380051FC(v12, v0, &qword_2568C56E8);
    if (v15(v0, 1, v14) == 1)
    {
      sub_238005240(v0, &qword_2568C56E8);
      v19 = *(_OWORD **)(v8 - 152);
    }
    else
    {
      v24 = swift_getEnumCaseMultiPayload();
      v19 = *(_OWORD **)(v8 - 152);
      if (!v24)
      {
        sub_238001DE4(v0, *(_QWORD *)(v8 - 152), type metadata accessor for Proto_Cryptex);
        goto LABEL_30;
      }
      sub_237FFD540(v0, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    }
    *v19 = xmmword_2380BEAE0;
    sub_2380BD5BC();
LABEL_30:
    *(_BYTE *)(v8 - 96) = 2;
    v26 = (unint64_t *)&unk_2568C8ED8;
    v27 = type metadata accessor for Proto_Cryptex;
    v28 = &unk_2380C5998;
    goto LABEL_31;
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 104) + 8))(v4, v3);
  return sub_238005240(v13, &qword_2568C56E8);
}

uint64_t sub_2380A1A38()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2380A1A64 + 4 * byte_2380C574E[*v0]))(0x747365676964, 0xE600000000000000);
}

uint64_t sub_2380A1A64()
{
  return 0x7367616C66;
}

uint64_t sub_2380A1A78()
{
  return 0x78657470797263;
}

uint64_t sub_2380A1A90()
{
  return 0x5378657470797263;
}

uint64_t sub_2380A1AB0()
{
  return 0x6F43657275636573;
}

uint64_t sub_2380A1AD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A65F8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2380A1AF4(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2380A1B00()
{
  sub_2380A4DE4();
  return sub_2380BE2A0();
}

uint64_t sub_2380A1B28()
{
  sub_2380A4DE4();
  return sub_2380BE2AC();
}

void sub_2380A1B50(_QWORD *a1)
{
  sub_2380A1370(a1);
}

void sub_2380A1B64(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8EE0);
  MEMORY[0x24BDAC7A8](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4E28();
  sub_2380BE288();
  __asm { BR              X10 }
}

uint64_t sub_2380A1C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((v4 & 0xFF000000000000) != 0)
  {
    sub_237FFBA20(v1, v4);
    v7 = v1;
    v3 = v4;
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(v6 - 80) = v7;
  *(_QWORD *)(v6 - 72) = v3;
  sub_2380723B0();
  sub_2380BE150();
  sub_238008CF0(v7, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v0);
}

uint64_t sub_2380A1CD4()
{
  return 0x614D346567616D69;
}

uint64_t sub_2380A1CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x614D346567616D69 && a2 == 0xEE0074736566696ELL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2380BE1B0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2380A1DB0()
{
  sub_2380A4E28();
  return sub_2380BE2A0();
}

uint64_t sub_2380A1DD8()
{
  sub_2380A4E28();
  return sub_2380BE2AC();
}

void sub_2380A1E00(_QWORD *a1)
{
  sub_2380A1B64(a1);
}

uint64_t sub_2380A1E14()
{
  return 0;
}

uint64_t sub_2380A1E20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2380A1E4C()
{
  sub_2380A4E6C();
  return sub_2380BE2A0();
}

uint64_t sub_2380A1E74()
{
  sub_2380A4E6C();
  return sub_2380BE2AC();
}

uint64_t sub_2380A1E9C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8EF0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4E6C();
  sub_2380BE288();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_2380A1F60(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F00);
  MEMORY[0x24BDAC7A8](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4EB0();
  sub_2380BE288();
  __asm { BR              X10 }
}

uint64_t sub_2380A2028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((v6 & 0xFF000000000000) != 0)
  {
    sub_237FFBA20(v1, v6);
    v9 = v1;
    v5 = v6;
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v8 - 96) = v9;
  *(_QWORD *)(v8 - 88) = v5;
  *(_BYTE *)(v8 - 65) = 0;
  sub_2380723B0();
  sub_2380BE150();
  sub_238008CF0(v9, v5);
  if (!v4)
  {
    v10 = *(_QWORD *)(v3 + 16);
    if (*(_QWORD *)(v10 + 16))
      swift_bridgeObjectRetain();
    else
      v10 = 0;
    *(_QWORD *)(v8 - 96) = v10;
    *(_BYTE *)(v8 - 65) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8298);
    sub_2380A4EF4();
    sub_2380BE150();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v0);
}

uint64_t sub_2380A214C()
{
  _BYTE *v0;

  if (*v0)
    return 0x617461646174656DLL;
  else
    return 0x7972746E65;
}

uint64_t sub_2380A2184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6834(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A21A8()
{
  sub_2380A4EB0();
  return sub_2380BE2A0();
}

uint64_t sub_2380A21D0()
{
  sub_2380A4EB0();
  return sub_2380BE2AC();
}

void sub_2380A21F8(_QWORD *a1)
{
  sub_2380A1F60(a1);
}

uint64_t sub_2380A220C(_QWORD *a1, uint64_t a2, char a3)
{
  _BYTE v5[24];
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380BE27C();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  if ((a3 & 1) != 0)
    sub_2380BE1BC();
  else
    sub_2380BE1C8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_2380A2360(_QWORD *a1)
{
  uint64_t v1;

  return sub_2380A220C(a1, *(_QWORD *)v1, *(_BYTE *)(v1 + 8));
}

uint64_t sub_2380A237C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v26 = (uint64_t)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F18);
  v28 = *(_QWORD *)(v11 - 8);
  v29 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4F78();
  sub_2380BE288();
  v14 = v1 + *(int *)(type metadata accessor for Proto_TransparencyProofs(0) + 20);
  sub_2380051FC(v14, (uint64_t)v8, qword_2568C5450);
  v15 = type metadata accessor for ATLogProofs(0);
  v27 = *(_QWORD *)(v15 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v17 = 1;
  v18 = v16(v8, 1, v15);
  sub_238005240((uint64_t)v8, qword_2568C5450);
  if (v18 != 1)
  {
    v19 = v26;
    sub_2380051FC(v14, v26, qword_2568C5450);
    if (v16((char *)v19, 1, v15) == 1)
    {
      sub_2380BD5BC();
      v20 = &v10[*(int *)(v15 + 20)];
      v21 = type metadata accessor for LogEntry(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
      v22 = &v10[*(int *)(v15 + 24)];
      v23 = type metadata accessor for LogConsistency(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
      sub_238005240(v19, qword_2568C5450);
    }
    else
    {
      sub_238001DE4(v19, (uint64_t)v10, type metadata accessor for ATLogProofs);
    }
    v17 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v10, v17, 1, v15);
  sub_238001820(&qword_2568C8F28, type metadata accessor for ATLogProofs, (uint64_t)&unk_2380C58D0);
  v24 = v29;
  sub_2380BE150();
  sub_238005240((uint64_t)v10, qword_2568C5450);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v24);
}

uint64_t sub_2380A265C()
{
  return 0x73666F6F7270;
}

uint64_t sub_2380A2670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x73666F6F7270 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_2380BE1B0();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2380A26FC()
{
  sub_2380A4F78();
  return sub_2380BE2A0();
}

uint64_t sub_2380A2724()
{
  sub_2380A4F78();
  return sub_2380BE2AC();
}

uint64_t sub_2380A274C(_QWORD *a1)
{
  return sub_2380A237C(a1);
}

uint64_t sub_2380A2760(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char v53;
  char v54;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v43 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v46 = (uint64_t)&v43 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v43 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v48 = (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v43 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v43 - v16;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F30);
  v50 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A4FBC();
  v51 = v19;
  sub_2380BE288();
  v44 = type metadata accessor for ATLogProofs(0);
  v45 = v2;
  v20 = v2 + *(int *)(v44 + 20);
  sub_2380051FC(v20, (uint64_t)v15, &qword_2568C5440);
  v21 = type metadata accessor for LogEntry(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = 1;
  v25 = v23(v15, 1, v21);
  sub_238005240((uint64_t)v15, &qword_2568C5440);
  if (v25 != 1)
  {
    v26 = v48;
    sub_2380051FC(v20, v48, &qword_2568C5440);
    if (v23((char *)v26, 1, v21) == 1)
    {
      *(_QWORD *)v17 = 0;
      v17[8] = 1;
      *((_QWORD *)v17 + 2) = MEMORY[0x24BEE4AF8];
      *(_OWORD *)(v17 + 24) = xmmword_2380BEAE0;
      *((_QWORD *)v17 + 5) = 0;
      *((_QWORD *)v17 + 6) = 0;
      v17[56] = 1;
      sub_2380BD5BC();
      v27 = &v17[*(int *)(v21 + 40)];
      v28 = type metadata accessor for SignedObject(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 1, 1, v28);
      sub_238005240(v26, &qword_2568C5440);
    }
    else
    {
      sub_238001DE4(v26, (uint64_t)v17, type metadata accessor for LogEntry);
    }
    v24 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v17, v24, 1, v21);
  v54 = 0;
  sub_238001820(&qword_2568C8F40, type metadata accessor for LogEntry, (uint64_t)&unk_2380C58A8);
  v29 = v52;
  v30 = v51;
  v31 = v49;
  sub_2380BE150();
  sub_238005240((uint64_t)v17, &qword_2568C5440);
  if (!v31)
  {
    v32 = v45 + *(int *)(v44 + 24);
    v33 = v46;
    sub_2380051FC(v32, v46, &qword_2568C5448);
    v34 = type metadata accessor for LogConsistency(0);
    v35 = *(_QWORD *)(v34 - 8);
    v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48);
    v37 = v36(v33, 1, v34);
    sub_238005240(v33, &qword_2568C5448);
    v38 = 1;
    v39 = (uint64_t)v47;
    if (v37 != 1)
    {
      v40 = v43;
      sub_2380051FC(v32, v43, &qword_2568C5448);
      if (v36(v40, 1, v34) == 1)
      {
        sub_2380BD5BC();
        v41 = *(int *)(v34 + 20);
        if (qword_2568C4E50 != -1)
          swift_once();
        *(_QWORD *)(v39 + v41) = qword_2568C4E58;
        swift_retain();
        sub_238005240(v40, &qword_2568C5448);
      }
      else
      {
        sub_238001DE4(v40, v39, type metadata accessor for LogConsistency);
      }
      v38 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v39, v38, 1, v34);
    v53 = 1;
    sub_238001820(&qword_2568C8F48, type metadata accessor for LogConsistency, (uint64_t)&unk_2380C57B8);
    v29 = v52;
    v30 = v51;
    sub_2380BE150();
    sub_238005240(v39, &qword_2568C5448);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v30, v29);
}

uint64_t sub_2380A2C48()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0x6F6973756C636E69;
}

uint64_t sub_2380A2C94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A691C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A2CB8()
{
  sub_2380A4FBC();
  return sub_2380BE2A0();
}

uint64_t sub_2380A2CE0()
{
  sub_2380A4FBC();
  return sub_2380BE2AC();
}

uint64_t sub_2380A2D08(_QWORD *a1)
{
  return sub_2380A2760(a1);
}

uint64_t sub_2380A2D1C(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
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
  uint64_t v14;
  char *v15;
  char v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;
  BOOL v29;
  _OWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  BOOL v48;
  char v49;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v40 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v40 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F50);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A5000();
  sub_2380BE288();
  v16 = *((_BYTE *)v2 + 8);
  v17 = *v2 == 0;
  v18 = *v2 != 0;
  v46 = *v2;
  v47 = v18 & v16;
  v48 = v17;
  v49 = 0;
  sub_2380A5044();
  v19 = v45;
  sub_2380BE150();
  if (v19)
  {
    v20 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
    v21 = v15;
  }
  else
  {
    v40 = v7;
    v41 = v15;
    v42 = 0;
    v43 = v13;
    v22 = (uint64_t)v2 + *(int *)(type metadata accessor for LogEntry(0) + 40);
    sub_2380051FC(v22, (uint64_t)v10, &qword_2568C5438);
    v23 = type metadata accessor for SignedObject(0);
    v24 = *(_QWORD *)(v23 - 8);
    v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
    v26 = v25(v10, 1, v23);
    v45 = v12;
    v27 = v26;
    sub_238005240((uint64_t)v10, &qword_2568C5438);
    v28 = 1;
    v29 = v27 == 1;
    v30 = v44;
    v12 = v45;
    v31 = v2;
    if (!v29)
    {
      v32 = (uint64_t)v40;
      sub_2380051FC(v22, (uint64_t)v40, &qword_2568C5438);
      if (v25((char *)v32, 1, v23) == 1)
      {
        *v30 = xmmword_2380BEAE0;
        sub_2380BD5BC();
        v33 = (char *)v30 + *(int *)(v23 + 24);
        v34 = type metadata accessor for Signature(0);
        v35 = v33;
        v12 = v45;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v35, 1, 1, v34);
        sub_238005240(v32, &qword_2568C5438);
      }
      else
      {
        sub_238001DE4(v32, (uint64_t)v30, type metadata accessor for SignedObject);
      }
      v28 = 0;
    }
    (*(void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v30, v28, 1, v23);
    LOBYTE(v46) = 1;
    sub_238001820(&qword_2568C8F68, type metadata accessor for SignedObject, (uint64_t)&unk_2380C5858);
    v36 = v41;
    v37 = v42;
    sub_2380BE150();
    if (!v37)
    {
      sub_238005240((uint64_t)v30, &qword_2568C5438);
      v39 = v31[2];
      if (*(_QWORD *)(v39 + 16))
        swift_bridgeObjectRetain();
      else
        v39 = 0;
      v46 = v39;
      v49 = 2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F70);
      sub_2380A5088();
      sub_2380BE150();
      swift_bridgeObjectRelease();
      __asm { BR              X10 }
    }
    sub_238005240((uint64_t)v30, &qword_2568C5438);
    v20 = *(uint64_t (**)(char *, uint64_t))(v43 + 8);
    v21 = v36;
  }
  return v20(v21, v12);
}

void sub_2380A311C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if ((v3 & 0xFF000000000000) != 0)
  {
    sub_237FFBA20(v0, v3);
    v6 = v0;
    v2 = v3;
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v5 - 96) = v6;
  *(_QWORD *)(v5 - 88) = v2;
  *(_BYTE *)(v5 - 65) = 3;
  sub_2380723B0();
  sub_2380BE150();
  sub_238008CF0(v6, v2);
  if (!v4)
  {
    *(_BYTE *)(v5 - 96) = 4;
    sub_2380BE168();
    v7 = *(_QWORD *)(v1 + 48);
    v8 = *(_BYTE *)(v1 + 56);
    *(_QWORD *)(v5 - 96) = v7;
    *(_BYTE *)(v5 - 88) = (v7 != 0) & v8;
    *(_BYTE *)(v5 - 87) = v7 == 0;
    *(_BYTE *)(v5 - 65) = 5;
    sub_2380A50EC();
    sub_2380BE150();
  }
  JUMPOUT(0x2380A3028);
}

uint64_t sub_2380A3224()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2380A3254 + 4 * byte_2380C575F[*v0]))(0x65707954676F6CLL, 0xE700000000000000);
}

uint64_t sub_2380A3254()
{
  return 6843507;
}

unint64_t sub_2380A3264()
{
  return 0xD000000000000019;
}

uint64_t sub_2380A3280()
{
  return 0x6574794265646F6ELL;
}

uint64_t sub_2380A329C()
{
  return 0x69736F5065646F6ELL;
}

uint64_t sub_2380A32BC()
{
  return 0x6570795465646F6ELL;
}

uint64_t sub_2380A32D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6A2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A32F8()
{
  sub_2380A5000();
  return sub_2380BE2A0();
}

uint64_t sub_2380A3320()
{
  sub_2380A5000();
  return sub_2380BE2AC();
}

uint64_t sub_2380A3348(_QWORD *a1)
{
  return sub_2380A2D1C(a1);
}

uint64_t sub_2380A335C(_QWORD *a1, uint64_t a2, char a3)
{
  _BYTE v6[24];
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380BE27C();
  if ((a3 & 1) != 0)
    __asm { BR              X9 }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  sub_2380BE1C8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_2380A353C(_QWORD *a1)
{
  uint64_t v1;

  return sub_2380A335C(a1, *(_QWORD *)v1, *(_BYTE *)(v1 + 8));
}

void sub_2380A3558(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v9[1] = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F88);
  v9[3] = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A5130();
  sub_2380BE288();
  __asm { BR              X10 }
}

uint64_t sub_2380A3698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  uint64_t v16;
  uint64_t v17;

  if ((v7 & 0xFF000000000000) != 0)
  {
    sub_237FFBA20(v1, v7);
    v9 = v1;
    v4 = v7;
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v8 - 96) = v9;
  *(_QWORD *)(v8 - 88) = v4;
  *(_BYTE *)(v8 - 65) = 0;
  sub_2380723B0();
  v10 = *(_QWORD *)(v8 - 112);
  sub_2380BE150();
  sub_238008CF0(v9, v4);
  if (!v10)
  {
    v11 = v6 + *(int *)(type metadata accessor for SignedObject(0) + 24);
    sub_2380051FC(v11, v5, &qword_2568C5430);
    v12 = type metadata accessor for Signature(0);
    v13 = *(_QWORD *)(v12 - 8);
    *(_QWORD *)(v8 - 112) = v13;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
    v15 = v14(v5, 1, v12);
    sub_238005240(v5, &qword_2568C5430);
    v16 = 1;
    if (v15 != 1)
    {
      v17 = *(_QWORD *)(v8 - 120);
      sub_2380051FC(v11, v17, &qword_2568C5430);
      if (v14(v17, 1, v12) == 1)
      {
        *(_OWORD *)v2 = xmmword_2380BEAE0;
        *(_OWORD *)(v2 + 16) = xmmword_2380BEAE0;
        *(_QWORD *)(v2 + 32) = 0;
        *(_BYTE *)(v2 + 40) = 1;
        sub_2380BD5BC();
        sub_238005240(v17, &qword_2568C5430);
      }
      else
      {
        sub_238001DE4(v17, v2, type metadata accessor for Signature);
      }
      v16 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 112) + 56))(v2, v16, 1, v12);
    *(_BYTE *)(v8 - 96) = 1;
    sub_238001820(&qword_2568C8F98, type metadata accessor for Signature, (uint64_t)&unk_2380C5830);
    sub_2380BE150();
    sub_238005240(v2, &qword_2568C5430);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 104) + 8))(v3, v0);
}

uint64_t sub_2380A38B4()
{
  _BYTE *v0;

  if (*v0)
    return 0x727574616E676973;
  else
    return 0x7463656A626FLL;
}

uint64_t sub_2380A38F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6CB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A3914()
{
  sub_2380A5130();
  return sub_2380BE2A0();
}

uint64_t sub_2380A393C()
{
  sub_2380A5130();
  return sub_2380BE2AC();
}

void sub_2380A3964(_QWORD *a1)
{
  sub_2380A3558(a1);
}

void sub_2380A3978(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8FA0);
  MEMORY[0x24BDAC7A8](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A5174();
  sub_2380BE288();
  __asm { BR              X10 }
}

uint64_t sub_2380A3A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((v5 & 0xFF000000000000) != 0)
  {
    sub_237FFBA20(v1, v5);
    v9 = v1;
    v6 = v5;
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v8 - 96) = v9;
  *(_QWORD *)(v8 - 88) = v6;
  *(_BYTE *)(v8 - 65) = 0;
  sub_2380723B0();
  sub_2380BE150();
  sub_238008CF0(v9, v6);
  if (!v4)
  {
    *(_QWORD *)(v8 - 104) = v7;
    __asm { BR              X10 }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v0);
}

uint64_t sub_2380A3C18()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000012;
  if (*v0 != 1)
    v1 = 0x687469726F676C61;
  if (*v0)
    return v1;
  else
    return 0x727574616E676973;
}

uint64_t sub_2380A3C7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6DAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A3CA0()
{
  sub_2380A5174();
  return sub_2380BE2A0();
}

uint64_t sub_2380A3CC8()
{
  sub_2380A5174();
  return sub_2380BE2AC();
}

void sub_2380A3CF0(_QWORD *a1)
{
  sub_2380A3978(a1);
}

uint64_t sub_2380A3D04()
{
  sub_238065228();
  return sub_2380BDE74();
}

uint64_t sub_2380A3D50(_QWORD *a1, uint64_t a2, char a3)
{
  _BYTE v6[24];
  uint64_t v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380BE27C();
  if ((a3 & 1) != 0)
    __asm { BR              X9 }
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  sub_2380BE1C8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_2380A3F84(_QWORD *a1)
{
  uint64_t v1;

  return sub_2380A3D50(a1, *(_QWORD *)v1, *(_BYTE *)(v1 + 8));
}

uint64_t sub_2380A3FA0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  void (*v38)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, uint64_t);
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char v102;
  uint64_t v103;
  char v104;
  char v105;
  char v106;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v86 = (uint64_t)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v87 = (uint64_t)&v86 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v88 = (char *)&v86 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v89 = (uint64_t)&v86 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v91 = (uint64_t)&v86 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v90 = (uint64_t *)((char *)&v86 - v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v92 = (uint64_t)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v93 = (uint64_t)&v86 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v97 = (char *)&v86 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v94 = (uint64_t)&v86 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v86 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v86 - v28;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8FB8);
  v98 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v31 = (char *)&v86 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2380A51FC();
  v101 = v31;
  sub_2380BE288();
  v32 = *(int *)(type metadata accessor for LogConsistency(0) + 20);
  v96 = v2;
  v95 = v32;
  v33 = *(_QWORD *)(v2 + v32);
  v34 = v33
      + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__startSlh;
  swift_beginAccess();
  sub_2380051FC(v34, (uint64_t)v27, &qword_2568C5438);
  v35 = type metadata accessor for SignedObject(0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  LODWORD(v34) = v37(v27, 1, v35);
  sub_238005240((uint64_t)v27, &qword_2568C5438);
  if ((_DWORD)v34 == 1)
  {
    v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56);
    v38(v29, 1, 1, v35);
    v39 = v100;
    v40 = v99;
  }
  else
  {
    v41 = v33
        + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__startSlh;
    swift_beginAccess();
    v42 = v94;
    sub_2380051FC(v41, v94, &qword_2568C5438);
    if (v37((char *)v42, 1, v35) == 1)
    {
      *(_OWORD *)v29 = xmmword_2380BEAE0;
      sub_2380BD5BC();
      v43 = &v29[*(int *)(v35 + 24)];
      v44 = type metadata accessor for Signature(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v43, 1, 1, v44);
      sub_238005240(v42, &qword_2568C5438);
    }
    else
    {
      sub_238001DE4(v42, (uint64_t)v29, type metadata accessor for SignedObject);
    }
    v39 = v100;
    v40 = v99;
    v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56);
    v38(v29, 0, 1, v35);
  }
  v105 = 0;
  v45 = sub_238001820(&qword_2568C8F68, type metadata accessor for SignedObject, (uint64_t)&unk_2380C5858);
  v46 = v101;
  sub_2380BE150();
  if (v40)
  {
    sub_238005240((uint64_t)v29, &qword_2568C5438);
    return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v46, v39);
  }
  else
  {
    v99 = v45;
    sub_238005240((uint64_t)v29, &qword_2568C5438);
    v47 = *(_QWORD *)(v96 + v95);
    v48 = v47
        + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__endSlh;
    swift_beginAccess();
    v49 = v38;
    v50 = v93;
    sub_2380051FC(v48, v93, &qword_2568C5438);
    LODWORD(v48) = v37((char *)v50, 1, v35);
    sub_238005240(v50, &qword_2568C5438);
    v51 = 1;
    if ((_DWORD)v48 != 1)
    {
      v52 = v47
          + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__endSlh;
      swift_beginAccess();
      v53 = v52;
      v54 = v92;
      sub_2380051FC(v53, v92, &qword_2568C5438);
      if (v37((char *)v54, 1, v35) == 1)
      {
        v55 = v97;
        *(_OWORD *)v97 = xmmword_2380BEAE0;
        sub_2380BD5BC();
        v56 = &v55[*(int *)(v35 + 24)];
        v57 = type metadata accessor for Signature(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v56, 1, 1, v57);
        sub_238005240(v54, &qword_2568C5438);
      }
      else
      {
        sub_238001DE4(v54, (uint64_t)v97, type metadata accessor for SignedObject);
      }
      v51 = 0;
    }
    v58 = v97;
    v49(v97, v51, 1, v35);
    v104 = 1;
    sub_2380BE150();
    v99 = v35;
    sub_238005240((uint64_t)v58, &qword_2568C5438);
    v60 = *(_QWORD *)(v96 + v95);
    v61 = (uint64_t *)(v60
                    + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__proofHashes);
    swift_beginAccess();
    v62 = *v61;
    if (*(_QWORD *)(*v61 + 16))
      swift_bridgeObjectRetain();
    else
      v62 = 0;
    v103 = v62;
    v102 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C8F70);
    sub_2380A5088();
    sub_2380BE150();
    swift_bridgeObjectRelease();
    v63 = v60
        + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__patInclusionProof;
    swift_beginAccess();
    v64 = v91;
    sub_2380051FC(v63, v91, &qword_2568C5440);
    v65 = type metadata accessor for LogEntry(0);
    v66 = *(_QWORD *)(v65 - 8);
    v67 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v66 + 48);
    LODWORD(v63) = v67(v64, 1, v65);
    sub_238005240(v64, &qword_2568C5440);
    if ((_DWORD)v63 == 1)
    {
      v68 = v90;
      v97 = *(char **)(v66 + 56);
      ((void (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v97)(v90, 1, 1, v65);
    }
    else
    {
      v69 = v66;
      v70 = v60
          + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__patInclusionProof;
      swift_beginAccess();
      v71 = v89;
      sub_2380051FC(v70, v89, &qword_2568C5440);
      if (v67(v71, 1, v65) == 1)
      {
        v68 = v90;
        *v90 = 0;
        *((_BYTE *)v68 + 8) = 1;
        v68[2] = MEMORY[0x24BEE4AF8];
        *(_OWORD *)(v68 + 3) = xmmword_2380BEAE0;
        v68[5] = 0;
        v68[6] = 0;
        *((_BYTE *)v68 + 56) = 1;
        sub_2380BD5BC();
        v49((char *)v68 + *(int *)(v65 + 40), 1, 1, v99);
        sub_238005240(v71, &qword_2568C5440);
      }
      else
      {
        v68 = v90;
        sub_238001DE4(v71, (uint64_t)v90, type metadata accessor for LogEntry);
      }
      v97 = *(char **)(v69 + 56);
      ((void (*)(_QWORD *, _QWORD, uint64_t, uint64_t))v97)(v68, 0, 1, v65);
    }
    v102 = 3;
    sub_238001820(&qword_2568C8F40, type metadata accessor for LogEntry, (uint64_t)&unk_2380C58A8);
    sub_2380BE150();
    sub_238005240((uint64_t)v68, &qword_2568C5440);
    v72 = *(_QWORD *)(v96 + v95);
    v73 = v72
        + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__tltInclusionProof;
    swift_beginAccess();
    v74 = v87;
    sub_2380051FC(v73, v87, &qword_2568C5440);
    v75 = 1;
    v76 = v67(v74, 1, v65);
    v77 = v65;
    v78 = v76;
    v79 = v74;
    v80 = v77;
    sub_238005240(v79, &qword_2568C5440);
    v81 = (uint64_t)v88;
    if (v78 != 1)
    {
      v82 = v72
          + OBJC_IVAR____TtCV16CloudAttestation14LogConsistencyP33_41967CC35744CDFB8E92E7B80EC2B17A13_StorageClass__tltInclusionProof;
      swift_beginAccess();
      v83 = v86;
      sub_2380051FC(v82, v86, &qword_2568C5440);
      if (v67(v83, 1, v80) == 1)
      {
        *(_QWORD *)v81 = 0;
        *(_BYTE *)(v81 + 8) = 1;
        *(_QWORD *)(v81 + 16) = MEMORY[0x24BEE4AF8];
        *(_OWORD *)(v81 + 24) = xmmword_2380BEAE0;
        *(_QWORD *)(v81 + 40) = 0;
        *(_QWORD *)(v81 + 48) = 0;
        *(_BYTE *)(v81 + 56) = 1;
        sub_2380BD5BC();
        v49((char *)(v81 + *(int *)(v80 + 40)), 1, 1, v99);
        sub_238005240(v83, &qword_2568C5440);
      }
      else
      {
        sub_238001DE4(v83, v81, type metadata accessor for LogEntry);
      }
      v75 = 0;
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v97)(v81, v75, 1, v80);
    v106 = 4;
    v84 = v100;
    v85 = v101;
    sub_2380BE150();
    sub_238005240(v81, &qword_2568C5440);
    return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v85, v84);
  }
}

uint64_t sub_2380A4AF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2380A4B2C + 4 * byte_2380C577F[a1]))(0x484C537472617473, 0xE800000000000000);
}

uint64_t sub_2380A4B2C()
{
  return 0x484C53646E65;
}

uint64_t sub_2380A4B40()
{
  return 0x736148666F6F7270;
}

unint64_t sub_2380A4B60()
{
  return 0xD000000000000011;
}

uint64_t sub_2380A4B88()
{
  unsigned __int8 *v0;

  return sub_2380A4AF8(*v0);
}

uint64_t sub_2380A4B90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2380A6F08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2380A4BB4()
{
  sub_2380A51FC();
  return sub_2380BE2A0();
}

uint64_t sub_2380A4BDC()
{
  sub_2380A51FC();
  return sub_2380BE2AC();
}

uint64_t sub_2380A4C04(_QWORD *a1)
{
  return sub_2380A3FA0(a1);
}

unint64_t sub_2380A4C18()
{
  unint64_t result;

  result = qword_2568C8E68;
  if (!qword_2568C8E68)
  {
    result = MEMORY[0x23B82B770](&unk_2380C671C, &_s10CodingKeysON_11);
    atomic_store(result, (unint64_t *)&qword_2568C8E68);
  }
  return result;
}

unint64_t sub_2380A4C5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2568C8E78;
  if (!qword_2568C8E78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568C8E70);
    v2 = sub_238001820(&qword_2568C8E80, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C59E8);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x23B82B770](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2568C8E78);
  }
  return result;
}

unint64_t sub_2380A4CE0()
{
  unint64_t result;

  result = qword_2568C8E90;
  if (!qword_2568C8E90)
  {
    result = MEMORY[0x23B82B770](&unk_2380C66CC, &_s10CodingKeysON_10);
    atomic_store(result, (unint64_t *)&qword_2568C8E90);
  }
  return result;
}

unint64_t sub_2380A4D24()
{
  unint64_t result;

  result = qword_2568C8E98;
  if (!qword_2568C8E98)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5920, &type metadata for Proto_HashAlg);
    atomic_store(result, (unint64_t *)&qword_2568C8E98);
  }
  return result;
}

unint64_t sub_2380A4D68()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2568C8EA8;
  if (!qword_2568C8EA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568C8EA0);
    v2 = sub_238001820(&qword_2568C8EB0, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C59C0);
    result = MEMORY[0x23B82B770](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568C8EA8);
  }
  return result;
}

unint64_t sub_2380A4DE4()
{
  unint64_t result;

  result = qword_2568C8EC0;
  if (!qword_2568C8EC0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C667C, &_s10CodingKeysON_9);
    atomic_store(result, (unint64_t *)&qword_2568C8EC0);
  }
  return result;
}

unint64_t sub_2380A4E28()
{
  unint64_t result;

  result = qword_2568C8EE8;
  if (!qword_2568C8EE8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C662C, &_s10CodingKeysON_8);
    atomic_store(result, (unint64_t *)&qword_2568C8EE8);
  }
  return result;
}

unint64_t sub_2380A4E6C()
{
  unint64_t result;

  result = qword_2568C8EF8;
  if (!qword_2568C8EF8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C65DC, &_s10CodingKeysON_7);
    atomic_store(result, (unint64_t *)&qword_2568C8EF8);
  }
  return result;
}

unint64_t sub_2380A4EB0()
{
  unint64_t result;

  result = qword_2568C8F08;
  if (!qword_2568C8F08)
  {
    result = MEMORY[0x23B82B770](&unk_2380C658C, &_s10CodingKeysON_6);
    atomic_store(result, (unint64_t *)&qword_2568C8F08);
  }
  return result;
}

unint64_t sub_2380A4EF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2568C8F10;
  if (!qword_2568C8F10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568C8298);
    v2[0] = MEMORY[0x24BEE0D08];
    v2[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x23B82B770](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2568C8F10);
  }
  return result;
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

unint64_t sub_2380A4F78()
{
  unint64_t result;

  result = qword_2568C8F20;
  if (!qword_2568C8F20)
  {
    result = MEMORY[0x23B82B770](&unk_2380C653C, &_s10CodingKeysON_5);
    atomic_store(result, (unint64_t *)&qword_2568C8F20);
  }
  return result;
}

unint64_t sub_2380A4FBC()
{
  unint64_t result;

  result = qword_2568C8F38;
  if (!qword_2568C8F38)
  {
    result = MEMORY[0x23B82B770](&unk_2380C64EC, &_s10CodingKeysON_4);
    atomic_store(result, (unint64_t *)&qword_2568C8F38);
  }
  return result;
}

unint64_t sub_2380A5000()
{
  unint64_t result;

  result = qword_2568C8F58;
  if (!qword_2568C8F58)
  {
    result = MEMORY[0x23B82B770](&unk_2380C649C, &_s10CodingKeysON_3);
    atomic_store(result, (unint64_t *)&qword_2568C8F58);
  }
  return result;
}

unint64_t sub_2380A5044()
{
  unint64_t result;

  result = qword_2568C8F60;
  if (!qword_2568C8F60)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5880, &type metadata for LogType);
    atomic_store(result, (unint64_t *)&qword_2568C8F60);
  }
  return result;
}

unint64_t sub_2380A5088()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2568C8F78;
  if (!qword_2568C8F78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568C8F70);
    v2 = sub_2380723B0();
    result = MEMORY[0x23B82B770](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2568C8F78);
  }
  return result;
}

unint64_t sub_2380A50EC()
{
  unint64_t result;

  result = qword_2568C8F80;
  if (!qword_2568C8F80)
  {
    result = MEMORY[0x23B82B770](&unk_2380C57E0, &type metadata for NodeType);
    atomic_store(result, (unint64_t *)&qword_2568C8F80);
  }
  return result;
}

unint64_t sub_2380A5130()
{
  unint64_t result;

  result = qword_2568C8F90;
  if (!qword_2568C8F90)
  {
    result = MEMORY[0x23B82B770](&unk_2380C644C, &_s10CodingKeysON_2);
    atomic_store(result, (unint64_t *)&qword_2568C8F90);
  }
  return result;
}

unint64_t sub_2380A5174()
{
  unint64_t result;

  result = qword_2568C8FA8;
  if (!qword_2568C8FA8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C63FC, &_s10CodingKeysON_1);
    atomic_store(result, (unint64_t *)&qword_2568C8FA8);
  }
  return result;
}

unint64_t sub_2380A51B8()
{
  unint64_t result;

  result = qword_2568C8FB0;
  if (!qword_2568C8FB0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5808, &type metadata for Signature.SignatureAlgorithm);
    atomic_store(result, (unint64_t *)&qword_2568C8FB0);
  }
  return result;
}

unint64_t sub_2380A51FC()
{
  unint64_t result;

  result = qword_2568C8FC0;
  if (!qword_2568C8FC0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C63AC, &_s10CodingKeysON_0);
    atomic_store(result, (unint64_t *)&qword_2568C8FC0);
  }
  return result;
}

unint64_t sub_2380A5240()
{
  unint64_t result;

  result = qword_2568C8FD0;
  if (!qword_2568C8FD0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C635C, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2568C8FD0);
  }
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

ValueMetadata *_s10CodingKeysOMa_0()
{
  return &_s10CodingKeysON_0;
}

uint64_t _s10CodingKeysOwst_1(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380A5300 + 4 * byte_2380C5789[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2380A5334 + 4 * byte_2380C5784[v4]))();
}

uint64_t sub_2380A5334(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A533C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2380A5344);
  return result;
}

uint64_t sub_2380A5350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2380A5358);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2380A535C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A5364(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa_1()
{
  return &_s10CodingKeysON_1;
}

ValueMetadata *_s10CodingKeysOMa_2()
{
  return &_s10CodingKeysON_2;
}

uint64_t _s10CodingKeysOwst_4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380A53E4 + 4 * byte_2380C5793[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2380A5418 + 4 * byte_2380C578E[v4]))();
}

uint64_t sub_2380A5418(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A5420(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2380A5428);
  return result;
}

uint64_t sub_2380A5434(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2380A543CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2380A5440(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A5448(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa_3()
{
  return &_s10CodingKeysON_3;
}

ValueMetadata *_s10CodingKeysOMa_4()
{
  return &_s10CodingKeysON_4;
}

ValueMetadata *_s10CodingKeysOMa_5()
{
  return &_s10CodingKeysON_5;
}

ValueMetadata *_s10CodingKeysOMa_6()
{
  return &_s10CodingKeysON_6;
}

ValueMetadata *_s10CodingKeysOMa_7()
{
  return &_s10CodingKeysON_7;
}

ValueMetadata *_s10CodingKeysOMa_8()
{
  return &_s10CodingKeysON_8;
}

uint64_t _s10CodingKeysOwet_0_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s10CodingKeysOwst_0_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380A5598 + 4 * byte_2380C579D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2380A55CC + 4 * byte_2380C5798[v4]))();
}

uint64_t sub_2380A55CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A55D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2380A55DCLL);
  return result;
}

uint64_t sub_2380A55E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2380A55F0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2380A55F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A55FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa_9()
{
  return &_s10CodingKeysON_9;
}

uint64_t _s10CodingKeysOwst_2_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2380A5664 + 4 * byte_2380C57A7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2380A5698 + 4 * byte_2380C57A2[v4]))();
}

uint64_t sub_2380A5698(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A56A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2380A56A8);
  return result;
}

uint64_t sub_2380A56B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2380A56BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2380A56C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2380A56C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa_10()
{
  return &_s10CodingKeysON_10;
}

uint64_t _s10CodingKeysOwst_3_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2380A5724 + 4 * byte_2380C57AC[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2380A5744 + 4 * byte_2380C57B1[v4]))();
}

_BYTE *sub_2380A5724(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2380A5744(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2380A574C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2380A5754(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2380A575C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2380A5764(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s10CodingKeysOMa_11()
{
  return &_s10CodingKeysON_11;
}

unint64_t sub_2380A5784()
{
  unint64_t result;

  result = qword_2568C8FF0;
  if (!qword_2568C8FF0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5AFC, &_s10CodingKeysON_11);
    atomic_store(result, (unint64_t *)&qword_2568C8FF0);
  }
  return result;
}

unint64_t sub_2380A57CC()
{
  unint64_t result;

  result = qword_2568C8FF8;
  if (!qword_2568C8FF8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5BB4, &_s10CodingKeysON_10);
    atomic_store(result, (unint64_t *)&qword_2568C8FF8);
  }
  return result;
}

unint64_t sub_2380A5814()
{
  unint64_t result;

  result = qword_2568C9000;
  if (!qword_2568C9000)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5C6C, &_s10CodingKeysON_9);
    atomic_store(result, (unint64_t *)&qword_2568C9000);
  }
  return result;
}

unint64_t sub_2380A585C()
{
  unint64_t result;

  result = qword_2568C9008;
  if (!qword_2568C9008)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5D24, &_s10CodingKeysON_8);
    atomic_store(result, (unint64_t *)&qword_2568C9008);
  }
  return result;
}

unint64_t sub_2380A58A4()
{
  unint64_t result;

  result = qword_2568C9010;
  if (!qword_2568C9010)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5E2C, &_s10CodingKeysON_6);
    atomic_store(result, (unint64_t *)&qword_2568C9010);
  }
  return result;
}

unint64_t sub_2380A58EC()
{
  unint64_t result;

  result = qword_2568C9018;
  if (!qword_2568C9018)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5EE4, &_s10CodingKeysON_5);
    atomic_store(result, (unint64_t *)&qword_2568C9018);
  }
  return result;
}

unint64_t sub_2380A5934()
{
  unint64_t result;

  result = qword_2568C9020;
  if (!qword_2568C9020)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5F9C, &_s10CodingKeysON_4);
    atomic_store(result, (unint64_t *)&qword_2568C9020);
  }
  return result;
}

unint64_t sub_2380A597C()
{
  unint64_t result;

  result = qword_2568C9028;
  if (!qword_2568C9028)
  {
    result = MEMORY[0x23B82B770](&unk_2380C6054, &_s10CodingKeysON_3);
    atomic_store(result, (unint64_t *)&qword_2568C9028);
  }
  return result;
}

unint64_t sub_2380A59C4()
{
  unint64_t result;

  result = qword_2568C9030;
  if (!qword_2568C9030)
  {
    result = MEMORY[0x23B82B770](&unk_2380C610C, &_s10CodingKeysON_2);
    atomic_store(result, (unint64_t *)&qword_2568C9030);
  }
  return result;
}

unint64_t sub_2380A5A0C()
{
  unint64_t result;

  result = qword_2568C9038;
  if (!qword_2568C9038)
  {
    result = MEMORY[0x23B82B770](&unk_2380C61C4, &_s10CodingKeysON_1);
    atomic_store(result, (unint64_t *)&qword_2568C9038);
  }
  return result;
}

unint64_t sub_2380A5A54()
{
  unint64_t result;

  result = qword_2568C9040;
  if (!qword_2568C9040)
  {
    result = MEMORY[0x23B82B770](&unk_2380C627C, &_s10CodingKeysON_0);
    atomic_store(result, (unint64_t *)&qword_2568C9040);
  }
  return result;
}

unint64_t sub_2380A5A9C()
{
  unint64_t result;

  result = qword_2568C9048;
  if (!qword_2568C9048)
  {
    result = MEMORY[0x23B82B770](&unk_2380C6334, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2568C9048);
  }
  return result;
}

unint64_t sub_2380A5AE4()
{
  unint64_t result;

  result = qword_2568C9050;
  if (!qword_2568C9050)
  {
    result = MEMORY[0x23B82B770](&unk_2380C62A4, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2568C9050);
  }
  return result;
}

unint64_t sub_2380A5B2C()
{
  unint64_t result;

  result = qword_2568C9058;
  if (!qword_2568C9058)
  {
    result = MEMORY[0x23B82B770](&unk_2380C62CC, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2568C9058);
  }
  return result;
}

unint64_t sub_2380A5B74()
{
  unint64_t result;

  result = qword_2568C9060;
  if (!qword_2568C9060)
  {
    result = MEMORY[0x23B82B770](&unk_2380C61EC, &_s10CodingKeysON_0);
    atomic_store(result, (unint64_t *)&qword_2568C9060);
  }
  return result;
}

unint64_t sub_2380A5BBC()
{
  unint64_t result;

  result = qword_2568C9068;
  if (!qword_2568C9068)
  {
    result = MEMORY[0x23B82B770](&unk_2380C6214, &_s10CodingKeysON_0);
    atomic_store(result, (unint64_t *)&qword_2568C9068);
  }
  return result;
}

unint64_t sub_2380A5C04()
{
  unint64_t result;

  result = qword_2568C9070;
  if (!qword_2568C9070)
  {
    result = MEMORY[0x23B82B770](&unk_2380C6134, &_s10CodingKeysON_1);
    atomic_store(result, (unint64_t *)&qword_2568C9070);
  }
  return result;
}

unint64_t sub_2380A5C4C()
{
  unint64_t result;

  result = qword_2568C9078;
  if (!qword_2568C9078)
  {
    result = MEMORY[0x23B82B770](&unk_2380C615C, &_s10CodingKeysON_1);
    atomic_store(result, (unint64_t *)&qword_2568C9078);
  }
  return result;
}

unint64_t sub_2380A5C94()
{
  unint64_t result;

  result = qword_2568C9080;
  if (!qword_2568C9080)
  {
    result = MEMORY[0x23B82B770](&unk_2380C607C, &_s10CodingKeysON_2);
    atomic_store(result, (unint64_t *)&qword_2568C9080);
  }
  return result;
}

unint64_t sub_2380A5CDC()
{
  unint64_t result;

  result = qword_2568C9088;
  if (!qword_2568C9088)
  {
    result = MEMORY[0x23B82B770](&unk_2380C60A4, &_s10CodingKeysON_2);
    atomic_store(result, (unint64_t *)&qword_2568C9088);
  }
  return result;
}

unint64_t sub_2380A5D24()
{
  unint64_t result;

  result = qword_2568C9090;
  if (!qword_2568C9090)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5FC4, &_s10CodingKeysON_3);
    atomic_store(result, (unint64_t *)&qword_2568C9090);
  }
  return result;
}

unint64_t sub_2380A5D6C()
{
  unint64_t result;

  result = qword_2568C9098;
  if (!qword_2568C9098)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5FEC, &_s10CodingKeysON_3);
    atomic_store(result, (unint64_t *)&qword_2568C9098);
  }
  return result;
}

unint64_t sub_2380A5DB4()
{
  unint64_t result;

  result = qword_2568C90A0;
  if (!qword_2568C90A0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5F0C, &_s10CodingKeysON_4);
    atomic_store(result, (unint64_t *)&qword_2568C90A0);
  }
  return result;
}

unint64_t sub_2380A5DFC()
{
  unint64_t result;

  result = qword_2568C90A8;
  if (!qword_2568C90A8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5F34, &_s10CodingKeysON_4);
    atomic_store(result, (unint64_t *)&qword_2568C90A8);
  }
  return result;
}

unint64_t sub_2380A5E44()
{
  unint64_t result;

  result = qword_2568C90B0;
  if (!qword_2568C90B0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5E54, &_s10CodingKeysON_5);
    atomic_store(result, (unint64_t *)&qword_2568C90B0);
  }
  return result;
}

unint64_t sub_2380A5E8C()
{
  unint64_t result;

  result = qword_2568C90B8;
  if (!qword_2568C90B8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5E7C, &_s10CodingKeysON_5);
    atomic_store(result, (unint64_t *)&qword_2568C90B8);
  }
  return result;
}

unint64_t sub_2380A5ED4()
{
  unint64_t result;

  result = qword_2568C90C0;
  if (!qword_2568C90C0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5D9C, &_s10CodingKeysON_6);
    atomic_store(result, (unint64_t *)&qword_2568C90C0);
  }
  return result;
}

unint64_t sub_2380A5F1C()
{
  unint64_t result;

  result = qword_2568C90C8;
  if (!qword_2568C90C8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5DC4, &_s10CodingKeysON_6);
    atomic_store(result, (unint64_t *)&qword_2568C90C8);
  }
  return result;
}

unint64_t sub_2380A5F64()
{
  unint64_t result;

  result = qword_2568C90D0;
  if (!qword_2568C90D0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5D4C, &_s10CodingKeysON_7);
    atomic_store(result, (unint64_t *)&qword_2568C90D0);
  }
  return result;
}

unint64_t sub_2380A5FAC()
{
  unint64_t result;

  result = qword_2568C90D8;
  if (!qword_2568C90D8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5D74, &_s10CodingKeysON_7);
    atomic_store(result, (unint64_t *)&qword_2568C90D8);
  }
  return result;
}

unint64_t sub_2380A5FF4()
{
  unint64_t result;

  result = qword_2568C90E0;
  if (!qword_2568C90E0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5C94, &_s10CodingKeysON_8);
    atomic_store(result, (unint64_t *)&qword_2568C90E0);
  }
  return result;
}

unint64_t sub_2380A603C()
{
  unint64_t result;

  result = qword_2568C90E8;
  if (!qword_2568C90E8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5CBC, &_s10CodingKeysON_8);
    atomic_store(result, (unint64_t *)&qword_2568C90E8);
  }
  return result;
}

unint64_t sub_2380A6084()
{
  unint64_t result;

  result = qword_2568C90F0;
  if (!qword_2568C90F0)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5BDC, &_s10CodingKeysON_9);
    atomic_store(result, (unint64_t *)&qword_2568C90F0);
  }
  return result;
}

unint64_t sub_2380A60CC()
{
  unint64_t result;

  result = qword_2568C90F8;
  if (!qword_2568C90F8)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5C04, &_s10CodingKeysON_9);
    atomic_store(result, (unint64_t *)&qword_2568C90F8);
  }
  return result;
}

unint64_t sub_2380A6114()
{
  unint64_t result;

  result = qword_2568C9100;
  if (!qword_2568C9100)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5B24, &_s10CodingKeysON_10);
    atomic_store(result, (unint64_t *)&qword_2568C9100);
  }
  return result;
}

unint64_t sub_2380A615C()
{
  unint64_t result;

  result = qword_2568C9108;
  if (!qword_2568C9108)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5B4C, &_s10CodingKeysON_10);
    atomic_store(result, (unint64_t *)&qword_2568C9108);
  }
  return result;
}

unint64_t sub_2380A61A4()
{
  unint64_t result;

  result = qword_2568C9110;
  if (!qword_2568C9110)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5A6C, &_s10CodingKeysON_11);
    atomic_store(result, (unint64_t *)&qword_2568C9110);
  }
  return result;
}

unint64_t sub_2380A61EC()
{
  unint64_t result;

  result = qword_2568C9118;
  if (!qword_2568C9118)
  {
    result = MEMORY[0x23B82B770](&unk_2380C5A94, &_s10CodingKeysON_11);
    atomic_store(result, (unint64_t *)&qword_2568C9118);
  }
  return result;
}

uint64_t sub_2380A6230(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD00000000000001CLL && a2 == 0x80000002380C9810 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7365747441706573 && a2 == 0xEE006E6F69746174 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74656B6369547061 && a2 == 0xE800000000000000 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x614864656C616573 && a2 == 0xEC00000073656873 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002380C9830 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x726970784579656BLL && a2 == 0xED00006E6F697461)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2380A6508(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x676C4168736168 && a2 == 0xE700000000000000;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656972746E65 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2380A65F8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x747365676964 && a2 == 0xE600000000000000;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7367616C66 && a2 == 0xE500000000000000 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x78657470797263 && a2 == 0xE700000000000000 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x5378657470797263 && a2 == 0xEB00000000746C61 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F43657275636573 && a2 == 0xEC0000006769666ELL)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_2380A6834(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7972746E65 && a2 == 0xE500000000000000;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2380A691C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6F6973756C636E69 && a2 == 0xEE00666F6F72506ELL;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002380C7A60)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2380A6A2C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65707954676F6CLL && a2 == 0xE700000000000000;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6843507 && a2 == 0xE300000000000000 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000002380C9070 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6574794265646F6ELL && a2 == 0xE900000000000073 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x69736F5065646F6ELL && a2 == 0xEC0000006E6F6974 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6570795465646F6ELL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2380A6CB8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7463656A626FLL && a2 == 0xE600000000000000;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x727574616E676973 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2380A6DAC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x727574616E676973 && a2 == 0xE900000000000065;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002380C8FE0 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x687469726F676C61 && a2 == 0xE90000000000006DLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2380A6F08(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x484C537472617473 && a2 == 0xE800000000000000;
  if (v2 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x484C53646E65 && a2 == 0xE600000000000000 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x736148666F6F7270 && a2 == 0xEB00000000736568 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002380C7AA0 || (sub_2380BE1B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002380C7AC0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t SecureConfigPolicy.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for SEP.SealedHash(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t sub_2380A7180()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_2380BD448();
  __swift_allocate_value_buffer(v0, qword_2568C9120);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2568C9120);
  if (qword_2568C4EA0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2568C9B80);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t static SecureConfigPolicy.slot.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2568C50E0 != -1)
    swift_once();
  v2 = sub_2380BD448();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2568C9120);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2380A7280()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568CA060);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA060);
  return sub_2380BD7FC();
}

uint64_t SecureConfigPolicy.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  sub_238001DE4(a1, a2, type metadata accessor for SEP.SealedHash);
  v3 = type metadata accessor for SEP.SealedHash(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 0, 1, v3);
}

uint64_t SecureConfigPolicy.evaluate(bundle:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  type metadata accessor for SEP.SealedHash.Value(0);
  v3[5] = swift_task_alloc();
  v3[6] = swift_task_alloc();
  v4 = type metadata accessor for SEP.SealedHash(0);
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v5 = sub_2380BD448();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  type metadata accessor for SecureConfigPolicy.SealedHashLoader(0);
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C66F0);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2380A74A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
  __n128 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  _OWORD *v11;
  unint64_t v12;
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
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  sub_238013570(*(_QWORD *)(v0 + 32), v1, type metadata accessor for SecureConfigPolicy.SealedHashLoader);
  v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v4(v1, 1, v2) == 1)
  {
    v5.n128_f64[0] = AttestationPolicyContext.validatedAttestation.getter((uint64_t)&v67);
    v6 = v68;
    if (v68 >> 60 == 15)
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, __n128))(*(_QWORD *)(v0 + 64) + 56))(*(_QWORD *)(v0 + 128), 1, 1, *(_QWORD *)(v0 + 56), v5);
    }
    else
    {
      v11 = (_OWORD *)(v0 + 144);
      v66 = v67;
      v13 = v69;
      v12 = v70;
      if (qword_2568C50E0 != -1)
        swift_once();
      v15 = *(_QWORD *)(v0 + 88);
      v14 = *(_QWORD *)(v0 + 96);
      v16 = *(_QWORD *)(v0 + 80);
      v17 = __swift_project_value_buffer(v16, (uint64_t)qword_2568C9120);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v17, v16);
      *v11 = 0u;
      *(_OWORD *)(v0 + 160) = 0u;
      *(_OWORD *)(v0 + 176) = 0u;
      *(_OWORD *)(v0 + 192) = 0u;
      *(_OWORD *)(v0 + 208) = 0u;
      *(_QWORD *)(v0 + 222) = 0;
      v18 = swift_task_alloc();
      *(_QWORD *)(v18 + 16) = v14;
      *(_QWORD *)(v18 + 24) = v11;
      sub_238034118((uint64_t)sub_238036830, v18, v66, v6, v13, v12);
      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
      sub_23804E940(v66, v6, v13, v12);
    }
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);
    sub_238001DE4(*(_QWORD *)(v0 + 104), v7, type metadata accessor for SEP.SealedHash);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, __n128))(v9 + 56))(v7, 0, 1, v8, v10);
  }
  v19 = *(_QWORD *)(v0 + 136);
  v20 = *(_QWORD *)(v0 + 120);
  sub_2380A7D58(*(_QWORD *)(v0 + 128), v19);
  v21 = sub_23807F2E0();
  swift_bridgeObjectRelease();
  sub_2380847B8(v19, v20);
  v22 = *(_QWORD *)(v0 + 120);
  if (!v21 && v4(*(_QWORD *)(v0 + 120), 1, *(_QWORD *)(v0 + 56)) == 1)
  {
    sub_2380A7DA0(v22);
    if (qword_2568C50E8 != -1)
      swift_once();
    v23 = sub_2380BD808();
    __swift_project_value_buffer(v23, (uint64_t)qword_2568CA060);
    v24 = sub_2380BD7F0();
    v25 = sub_2380BDF64();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_237FF6000, v24, v25, "Device has no secure-config loaded", v26, 2u);
      MEMORY[0x23B82B830](v26, -1, -1);
    }

    goto LABEL_36;
  }
  sub_2380A7DA0(v22);
  v27 = sub_23807F2E0();
  if (!v27)
  {
    type metadata accessor for SecureConfigPolicy.Error(0);
    sub_238001820(&qword_2568C9140, type metadata accessor for SecureConfigPolicy.Error, (uint64_t)&protocol conformance descriptor for SecureConfigPolicy.Error);
    swift_allocError();
    goto LABEL_19;
  }
  v28 = v27;
  v29 = *(_QWORD *)(v0 + 112);
  v30 = *(_QWORD *)(v0 + 56);
  sub_2380847B8(*(_QWORD *)(v0 + 136), v29);
  v31 = v4(v29, 1, v30);
  v32 = *(_QWORD *)(v0 + 112);
  if (v31 == 1)
  {
    swift_bridgeObjectRelease();
    sub_2380A7DA0(v32);
    type metadata accessor for SecureConfigPolicy.Error(0);
    sub_238001820(&qword_2568C9140, type metadata accessor for SecureConfigPolicy.Error, (uint64_t)&protocol conformance descriptor for SecureConfigPolicy.Error);
    swift_allocError();
LABEL_19:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    goto LABEL_36;
  }
  v33 = *(_BYTE **)(v0 + 72);
  sub_238001DE4(*(_QWORD *)(v0 + 112), (uint64_t)v33, type metadata accessor for SEP.SealedHash);
  if ((*v33 & 4) != 0)
  {
    if (qword_2568C50E8 != -1)
      swift_once();
    v34 = sub_2380BD808();
    __swift_project_value_buffer(v34, (uint64_t)qword_2568CA060);
    v35 = sub_2380BD7F0();
    v36 = sub_2380BDF64();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_237FF6000, v35, v36, "SecureConfig sealed hash is unexpectedly locked", v37, 2u);
      MEMORY[0x23B82B830](v37, -1, -1);
    }

  }
  v38 = sub_23807FEE4();
  if (v38)
  {
    v40 = v38;
  }
  else
  {
    v40 = sub_2380BD9AC();
    v39 = sub_238001820(&qword_2568C5898, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6B20], MEMORY[0x24BDC6B10]);
  }
  sub_238080220(v40, v39, v28, *(_QWORD *)(v0 + 40));
  v41 = *(_QWORD *)(v0 + 72);
  v42 = *(_QWORD *)(v0 + 48);
  v43 = *(_QWORD *)(v0 + 56);
  v44 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRelease();
  sub_238001DE4(v44, v42, type metadata accessor for SEP.SealedHash.Value);
  v45 = v41 + *(int *)(v43 + 20);
  v46 = sub_2380062E0();
  v48 = v47;
  v49 = sub_2380062E0();
  v51 = v50;
  sub_238008ED0(v46, v48);
  v53 = v52;
  sub_237FFBAB0(v49, v51);
  sub_237FFBAB0(v46, v48);
  if ((v53 & 1) != 0)
  {
    if (qword_2568C50E8 != -1)
      swift_once();
    v54 = sub_2380BD808();
    __swift_project_value_buffer(v54, (uint64_t)qword_2568CA060);
    v55 = sub_2380BD7F0();
    v56 = sub_2380BDF70();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_237FF6000, v55, v56, "AttestationBundle passed SecureConfigPolicy: reported secure configs match SEP attestation", v57, 2u);
      MEMORY[0x23B82B830](v57, -1, -1);
    }
    v58 = *(_QWORD *)(v0 + 72);
    v59 = *(_QWORD *)(v0 + 48);

    sub_237FFD540(v59, type metadata accessor for SEP.SealedHash.Value);
    sub_237FFD540(v58, type metadata accessor for SEP.SealedHash);
  }
  else
  {
    v60 = *(_QWORD *)(v0 + 72);
    v61 = *(_QWORD *)(v0 + 48);
    type metadata accessor for SecureConfigPolicy.Error(0);
    sub_238001820(&qword_2568C9140, type metadata accessor for SecureConfigPolicy.Error, (uint64_t)&protocol conformance descriptor for SecureConfigPolicy.Error);
    swift_allocError();
    v63 = v62;
    v64 = v62 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
    sub_238013570(v61, v63, type metadata accessor for SEP.SealedHash.Value);
    sub_238013570(v45, v64, type metadata accessor for SEP.SealedHash.Value);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    sub_237FFD540(v61, type metadata accessor for SEP.SealedHash.Value);
    sub_237FFD540(v60, type metadata accessor for SEP.SealedHash);
  }
LABEL_36:
  sub_2380A7DA0(*(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SecureConfigPolicy.SealedHashLoader(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C92F8);
}

uint64_t sub_2380A7D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C66F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2380A7DA0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C66F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SecureConfigPolicy.Error(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C9250);
}

uint64_t sub_2380A7DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_238013814;
  return SecureConfigPolicy.evaluate(bundle:context:)(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for SecureConfigPolicy(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  int EnumCaseMultiPayload;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)(type metadata accessor for SecureConfigPolicy.SealedHashLoader(0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = type metadata accessor for SEP.SealedHash(0);
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v9 = *(int *)(v6 + 20);
      v10 = (uint64_t *)((char *)a1 + v9);
      v11 = (uint64_t *)((char *)a2 + v9);
      type metadata accessor for SEP.SealedHash.Value(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        v14 = *v11;
        v13 = v11[1];
        sub_237FFBA20(v14, v13);
        *v10 = v14;
        v10[1] = v13;
      }
      else
      {
        v15 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v10, v11, v15);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  return a1;
}

_BYTE *initializeWithCopy for SecureConfigPolicy(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  int EnumCaseMultiPayload;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = type metadata accessor for SEP.SealedHash(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = type metadata accessor for SecureConfigPolicy.SealedHashLoader(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(v4 + 20);
    v8 = (uint64_t *)&a1[v7];
    v9 = (uint64_t *)&a2[v7];
    type metadata accessor for SEP.SealedHash.Value(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v12 = *v9;
      v11 = v9[1];
      sub_237FFBA20(v12, v11);
      *v8 = v12;
      v8[1] = v11;
    }
    else
    {
      v13 = sub_2380BD9AC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v8, v9, v13);
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

_BYTE *assignWithCopy for SecureConfigPolicy(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_BYTE *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  int EnumCaseMultiPayload;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = type metadata accessor for SEP.SealedHash(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      v9 = *(int *)(v4 + 20);
      v10 = (uint64_t *)&a1[v9];
      v11 = (uint64_t *)&a2[v9];
      type metadata accessor for SEP.SealedHash.Value(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        v14 = *v11;
        v13 = v11[1];
        sub_237FFBA20(v14, v13);
        *v10 = v14;
        v10[1] = v13;
      }
      else
      {
        v22 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v10, v11, v22);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      return a1;
    }
LABEL_8:
    v15 = type metadata accessor for SecureConfigPolicy.SealedHashLoader(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  if (v8)
  {
    sub_237FFD540((uint64_t)a1, type metadata accessor for SEP.SealedHash);
    goto LABEL_8;
  }
  *a1 = *a2;
  if (a1 != a2)
  {
    v16 = *(int *)(v4 + 20);
    v17 = (uint64_t *)&a1[v16];
    v18 = (uint64_t *)&a2[v16];
    sub_237FFD540((uint64_t)&a1[v16], type metadata accessor for SEP.SealedHash.Value);
    type metadata accessor for SEP.SealedHash.Value(0);
    v19 = swift_getEnumCaseMultiPayload();
    if (v19 == 2)
    {
      v25 = *v18;
      v24 = v18[1];
      sub_237FFBA20(v25, v24);
      *v17 = v25;
      v17[1] = v24;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      if (v19 == 1)
      {
        v21 = *v18;
        v20 = v18[1];
        sub_237FFBA20(v21, v20);
        *v17 = v21;
        v17[1] = v20;
      }
      else
      {
        v26 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v17, v18, v26);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_BYTE *initializeWithTake for SecureConfigPolicy(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for SEP.SealedHash(0);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = type metadata accessor for SecureConfigPolicy.SealedHashLoader(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(v4 + 20);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = type metadata accessor for SEP.SealedHash.Value(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      v11 = sub_2380BD9AC();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

_BYTE *assignWithTake for SecureConfigPolicy(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_BYTE *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v4 = type metadata accessor for SEP.SealedHash(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      if (a1 == a2)
        return a1;
      v15 = *(int *)(v4 + 20);
      v16 = &a1[v15];
      a2 += v15;
      sub_237FFD540((uint64_t)&a1[v15], type metadata accessor for SEP.SealedHash.Value);
      v17 = type metadata accessor for SEP.SealedHash.Value(0);
      if (!swift_getEnumCaseMultiPayload())
      {
        v20 = sub_2380BD9AC();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v16, a2, v20);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v13 = *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64);
      v14 = v16;
      goto LABEL_8;
    }
    sub_237FFD540((uint64_t)a1, type metadata accessor for SEP.SealedHash);
LABEL_7:
    v13 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for SecureConfigPolicy.SealedHashLoader(0) - 8) + 64);
    v14 = a1;
LABEL_8:
    memcpy(v14, a2, v13);
    return a1;
  }
  if (v8)
    goto LABEL_7;
  *a1 = *a2;
  v9 = *(int *)(v4 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for SEP.SealedHash.Value(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v18 = sub_2380BD9AC();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v10, v11, v18);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecureConfigPolicy()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380A85C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SecureConfigPolicy.SealedHashLoader(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SecureConfigPolicy()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380A8610(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SecureConfigPolicy.SealedHashLoader(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SecureConfigPolicy(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C91A8);
}

uint64_t sub_2380A8664()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SecureConfigPolicy.SealedHashLoader(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for SecureConfigPolicy.Error(char *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v12 = (char *)*a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v12[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        v13 = (char *)*a2;
        v14 = (char *)*a2;
        *(_QWORD *)a1 = v13;
        goto LABEL_20;
      case 1:
        type metadata accessor for SEP.SealedHash.Value(0);
        v15 = swift_getEnumCaseMultiPayload();
        if (v15 == 2 || v15 == 1)
        {
          v16 = *a2;
          v17 = (unint64_t)a2[1];
          sub_237FFBA20((uint64_t)*a2, v17);
          *(_QWORD *)a1 = v16;
          *((_QWORD *)a1 + 1) = v17;
        }
        else
        {
          v18 = sub_2380BD9AC();
          (*(void (**)(char *, id *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(a1, a2, v18);
        }
        swift_storeEnumTagMultiPayload();
        v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
        v20 = (uint64_t *)&a1[v19];
        v21 = (uint64_t *)((char *)a2 + v19);
        v22 = swift_getEnumCaseMultiPayload();
        if (v22 == 2 || v22 == 1)
        {
          v24 = *v21;
          v23 = v21[1];
          sub_237FFBA20(v24, v23);
          *v20 = v24;
          v20[1] = v23;
        }
        else
        {
          v25 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v20, v21, v25);
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_20;
      case 0:
        v8 = *a2;
        v9 = (unint64_t)a2[1];
        sub_237FFBA20((uint64_t)*a2, v9);
        *(_QWORD *)a1 = v8;
        *((_QWORD *)a1 + 1) = v9;
        v10 = (uint64_t)a2[2];
        v11 = (unint64_t)a2[3];
        sub_237FFBA20(v10, v11);
        *((_QWORD *)a1 + 2) = v10;
        *((_QWORD *)a1 + 3) = v11;
LABEL_20:
        swift_storeEnumTagMultiPayload();
        return a1;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

void destroy for SecureConfigPolicy.Error(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:

      return;
    case 1:
      type metadata accessor for SEP.SealedHash.Value(0);
      v5 = swift_getEnumCaseMultiPayload();
      if (v5 == 2 || v5 == 1)
      {
        sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      }
      else if (!v5)
      {
        v6 = sub_2380BD9AC();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
      }
      v7 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48));
      v8 = swift_getEnumCaseMultiPayload();
      if (v8 == 2 || v8 == 1)
      {
        v3 = *v7;
        v4 = v7[1];
        goto LABEL_17;
      }
      if (!v8)
      {
        v9 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
      }
      break;
    case 0:
      sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      v3 = *(_QWORD *)(a1 + 16);
      v4 = *(_QWORD *)(a1 + 24);
LABEL_17:
      sub_237FFBAB0(v3, v4);
      break;
  }
}

_QWORD *initializeWithCopy for SecureConfigPolicy.Error(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  int v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      v11 = *(id *)a2;
      v12 = *(id *)a2;
      *a1 = v11;
      goto LABEL_18;
    case 1:
      type metadata accessor for SEP.SealedHash.Value(0);
      v13 = swift_getEnumCaseMultiPayload();
      if (v13 == 2 || v13 == 1)
      {
        v14 = *(id *)a2;
        v15 = *(_QWORD *)(a2 + 8);
        sub_237FFBA20(*(_QWORD *)a2, v15);
        *a1 = v14;
        a1[1] = v15;
      }
      else
      {
        v16 = sub_2380BD9AC();
        (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
      }
      swift_storeEnumTagMultiPayload();
      v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
      v18 = (_QWORD *)((char *)a1 + v17);
      v19 = (uint64_t *)(a2 + v17);
      v20 = swift_getEnumCaseMultiPayload();
      if (v20 == 2 || v20 == 1)
      {
        v22 = *v19;
        v21 = v19[1];
        sub_237FFBA20(v22, v21);
        *v18 = v22;
        v18[1] = v21;
      }
      else
      {
        v23 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v18, v19, v23);
      }
      swift_storeEnumTagMultiPayload();
      goto LABEL_18;
    case 0:
      v7 = *(id *)a2;
      v8 = *(_QWORD *)(a2 + 8);
      sub_237FFBA20(*(_QWORD *)a2, v8);
      *a1 = v7;
      a1[1] = v8;
      v9 = *(_QWORD *)(a2 + 16);
      v10 = *(_QWORD *)(a2 + 24);
      sub_237FFBA20(v9, v10);
      a1[2] = v9;
      a1[3] = v10;
LABEL_18:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for SecureConfigPolicy.Error(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  int v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 != (_QWORD *)a2)
  {
    sub_237FFD540((uint64_t)a1, type metadata accessor for SecureConfigPolicy.Error);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        v11 = *(id *)a2;
        v12 = *(id *)a2;
        *a1 = v11;
        goto LABEL_19;
      case 1:
        type metadata accessor for SEP.SealedHash.Value(0);
        v13 = swift_getEnumCaseMultiPayload();
        if (v13 == 2 || v13 == 1)
        {
          v14 = *(id *)a2;
          v15 = *(_QWORD *)(a2 + 8);
          sub_237FFBA20(*(_QWORD *)a2, v15);
          *a1 = v14;
          a1[1] = v15;
        }
        else
        {
          v16 = sub_2380BD9AC();
          (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
        }
        swift_storeEnumTagMultiPayload();
        v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
        v18 = (_QWORD *)((char *)a1 + v17);
        v19 = (uint64_t *)(a2 + v17);
        v20 = swift_getEnumCaseMultiPayload();
        if (v20 == 2 || v20 == 1)
        {
          v22 = *v19;
          v21 = v19[1];
          sub_237FFBA20(v22, v21);
          *v18 = v22;
          v18[1] = v21;
        }
        else
        {
          v23 = sub_2380BD9AC();
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v18, v19, v23);
        }
        swift_storeEnumTagMultiPayload();
        goto LABEL_19;
      case 0:
        v7 = *(id *)a2;
        v8 = *(_QWORD *)(a2 + 8);
        sub_237FFBA20(*(_QWORD *)a2, v8);
        *a1 = v7;
        a1[1] = v8;
        v9 = *(_QWORD *)(a2 + 16);
        v10 = *(_QWORD *)(a2 + 24);
        sub_237FFBA20(v9, v10);
        a1[2] = v9;
        a1[3] = v10;
LABEL_19:
        swift_storeEnumTagMultiPayload();
        return a1;
    }
    memcpy(a1, (const void *)a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *initializeWithTake for SecureConfigPolicy.Error(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = type metadata accessor for SEP.SealedHash.Value(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v7 = sub_2380BD9AC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
    v9 = &a1[v8];
    v10 = &a2[v8];
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      v11 = sub_2380BD9AC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for SecureConfigPolicy.Error(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)a1, type metadata accessor for SecureConfigPolicy.Error);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = type metadata accessor for SEP.SealedHash.Value(0);
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      }
      else
      {
        v7 = sub_2380BD9AC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
        swift_storeEnumTagMultiPayload();
      }
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C82F8) + 48);
      v9 = &a1[v8];
      v10 = &a2[v8];
      if (swift_getEnumCaseMultiPayload())
      {
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      }
      else
      {
        v11 = sub_2380BD9AC();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
        swift_storeEnumTagMultiPayload();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2380A9130()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  const char *v3;
  char *v4;
  void *v5;

  v3 = " ";
  result = type metadata accessor for SEP.SealedHash.Value(319);
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v4 = &v2;
    v5 = &unk_2380C67F8;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2380A91B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  int EnumCaseMultiPayload;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

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
    v7 = type metadata accessor for SEP.SealedHash(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v10 = *(int *)(v7 + 20);
      v11 = (uint64_t *)((char *)a1 + v10);
      v12 = (uint64_t *)((char *)a2 + v10);
      type metadata accessor for SEP.SealedHash.Value(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        v15 = *v12;
        v14 = v12[1];
        sub_237FFBA20(v15, v14);
        *v11 = v15;
        v11[1] = v14;
      }
      else
      {
        v16 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v11, v12, v16);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t _s16CloudAttestation18SecureConfigPolicyVwxx_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for SEP.SealedHash(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = a1 + *(int *)(v2 + 20);
    type metadata accessor for SEP.SealedHash.Value(0);
    result = swift_getEnumCaseMultiPayload();
    if ((_DWORD)result == 2 || (_DWORD)result == 1)
    {
      return sub_237FFBAB0(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
    }
    else if (!(_DWORD)result)
    {
      v5 = sub_2380BD9AC();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    }
  }
  return result;
}

_BYTE *sub_2380A93A4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  int EnumCaseMultiPayload;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for SEP.SealedHash(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v8 = *(int *)(v6 + 20);
    v9 = (uint64_t *)&a1[v8];
    v10 = (uint64_t *)&a2[v8];
    type metadata accessor for SEP.SealedHash.Value(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v13 = *v10;
      v12 = v10[1];
      sub_237FFBA20(v13, v12);
      *v9 = v13;
      v9[1] = v12;
    }
    else
    {
      v14 = sub_2380BD9AC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v9, v10, v14);
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_BYTE *sub_2380A94C4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  int EnumCaseMultiPayload;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = type metadata accessor for SEP.SealedHash(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      v11 = *(int *)(v6 + 20);
      v12 = (uint64_t *)&a1[v11];
      v13 = (uint64_t *)&a2[v11];
      type metadata accessor for SEP.SealedHash.Value(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
      {
        v16 = *v13;
        v15 = v13[1];
        sub_237FFBA20(v16, v15);
        *v12 = v16;
        v12[1] = v15;
      }
      else
      {
        v23 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v12, v13, v23);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      return a1;
    }
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  if (v10)
  {
    sub_237FFD540((uint64_t)a1, type metadata accessor for SEP.SealedHash);
    goto LABEL_8;
  }
  *a1 = *a2;
  if (a1 != a2)
  {
    v17 = *(int *)(v6 + 20);
    v18 = (uint64_t *)&a1[v17];
    v19 = (uint64_t *)&a2[v17];
    sub_237FFD540((uint64_t)&a1[v17], type metadata accessor for SEP.SealedHash.Value);
    type metadata accessor for SEP.SealedHash.Value(0);
    v20 = swift_getEnumCaseMultiPayload();
    if (v20 == 2)
    {
      v26 = *v19;
      v25 = v19[1];
      sub_237FFBA20(v26, v25);
      *v18 = v26;
      v18[1] = v25;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      if (v20 == 1)
      {
        v22 = *v19;
        v21 = v19[1];
        sub_237FFBA20(v22, v21);
        *v18 = v22;
        v18[1] = v21;
      }
      else
      {
        v27 = sub_2380BD9AC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v18, v19, v27);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_BYTE *sub_2380A96E8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for SEP.SealedHash(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v8 = *(int *)(v6 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = type metadata accessor for SEP.SealedHash.Value(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      v12 = sub_2380BD9AC();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_BYTE *sub_2380A97F0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v6 = type metadata accessor for SEP.SealedHash(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      if (a1 == a2)
        return a1;
      v17 = *(int *)(v6 + 20);
      v18 = &a1[v17];
      a2 += v17;
      sub_237FFD540((uint64_t)&a1[v17], type metadata accessor for SEP.SealedHash.Value);
      v19 = type metadata accessor for SEP.SealedHash.Value(0);
      if (!swift_getEnumCaseMultiPayload())
      {
        v22 = sub_2380BD9AC();
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v18, a2, v22);
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      v15 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
      v16 = v18;
      goto LABEL_8;
    }
    sub_237FFD540((uint64_t)a1, type metadata accessor for SEP.SealedHash);
LABEL_7:
    v15 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
    v16 = a1;
LABEL_8:
    memcpy(v16, a2, v15);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  *a1 = *a2;
  v11 = *(int *)(v6 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = type metadata accessor for SEP.SealedHash.Value(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v20 = sub_2380BD9AC();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v12, v13, v20);
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_2380A99B8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380A99C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for SEP.SealedHash(0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_2380A9A10()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380A9A1C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for SEP.SealedHash(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_2380A9A6C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SEP.SealedHash(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_2380A9AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SEP.SealedHash(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_2380A9AE4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SEP.SealedHash(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2380A9B38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_2380BD5C8();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_2380A9BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_2380A9C18(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2380BD5C8();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *sub_2380A9C88(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2380BD5C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *sub_2380A9CFC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2380BD5C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_2380A9D58(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2380BD5C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_2380A9DC4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380A9DD0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2380BD5C8();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_2380A9E4C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2380A9E58(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_2380BD5C8();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for Proto_SealedHashLedger(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C9360);
}

uint64_t sub_2380A9EE0()
{
  return sub_2380B9D14();
}

uint64_t *sub_2380A9EF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  char *v63;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2380BD5C8();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for ATLogProofs(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v10, (uint64_t *)v11, v7);
      v16 = *(int *)(v12 + 20);
      v63 = v10;
      v17 = &v10[v16];
      v18 = &v11[v16];
      v19 = type metadata accessor for LogEntry(0);
      v20 = *(_QWORD *)(v19 - 8);
      v62 = (void (*)(char *, char *, uint64_t))v8;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
        memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
        v22 = v63;
      }
      else
      {
        v60 = v20;
        v61 = v13;
        *(_QWORD *)v17 = *(_QWORD *)v18;
        v17[8] = v18[8];
        v23 = *((_QWORD *)v18 + 3);
        *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
        v24 = *((_QWORD *)v18 + 4);
        swift_bridgeObjectRetain();
        sub_237FFBA20(v23, v24);
        *((_QWORD *)v17 + 3) = v23;
        *((_QWORD *)v17 + 4) = v24;
        v25 = *((_QWORD *)v18 + 6);
        *((_QWORD *)v17 + 5) = *((_QWORD *)v18 + 5);
        *((_QWORD *)v17 + 6) = v25;
        v17[56] = v18[56];
        v62(&v17[*(int *)(v19 + 36)], &v18[*(int *)(v19 + 36)], v7);
        v26 = *(int *)(v19 + 40);
        v27 = &v17[v26];
        v28 = &v18[v26];
        v29 = type metadata accessor for SignedObject(0);
        v30 = *(_QWORD *)(v29 - 8);
        v59 = v19;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
        {
          v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
          v32 = v60;
          v13 = v61;
          v22 = v63;
        }
        else
        {
          v56 = v30;
          v33 = v27;
          v58 = v29;
          v34 = *(_QWORD *)v28;
          v35 = *((_QWORD *)v28 + 1);
          sub_237FFBA20(*(_QWORD *)v28, v35);
          *(_QWORD *)v33 = v34;
          *((_QWORD *)v33 + 1) = v35;
          v36 = v58;
          v62(&v33[*(int *)(v58 + 20)], &v28[*(int *)(v58 + 20)], v7);
          v37 = *(int *)(v58 + 24);
          v57 = v33;
          v38 = &v33[v37];
          v39 = (uint64_t *)&v28[v37];
          v40 = type metadata accessor for Signature(0);
          v55 = *(_QWORD *)(v40 - 8);
          v22 = v63;
          if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v55 + 48))(v39, 1, v40))
          {
            v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
          }
          else
          {
            v54 = v40;
            v42 = *v39;
            v43 = v39[1];
            sub_237FFBA20(*v39, v43);
            *(_QWORD *)v38 = v42;
            *((_QWORD *)v38 + 1) = v43;
            v44 = v39[2];
            v45 = v39[3];
            sub_237FFBA20(v44, v45);
            *((_QWORD *)v38 + 2) = v44;
            *((_QWORD *)v38 + 3) = v45;
            v36 = v58;
            *((_QWORD *)v38 + 4) = v39[4];
            v38[40] = *((_BYTE *)v39 + 40);
            v62(&v38[*(int *)(v54 + 28)], (char *)v39 + *(int *)(v54 + 28), v7);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v55 + 56))(v38, 0, 1, v54);
          }
          v32 = v60;
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v57, 0, 1, v36);
          v13 = v61;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v17, 0, 1, v59);
      }
      v46 = *(int *)(v12 + 24);
      v47 = &v22[v46];
      v48 = &v11[v46];
      v49 = type metadata accessor for LogConsistency(0);
      v50 = *(_QWORD *)(v49 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49))
      {
        v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
        memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
      }
      else
      {
        v62(v47, v48, v7);
        *(_QWORD *)&v47[*(int *)(v49 + 20)] = *(_QWORD *)&v48[*(int *)(v49 + 20)];
        v52 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56);
        swift_retain();
        v52(v47, 0, 1, v49);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v22, 0, 1, v12);
    }
  }
  return a1;
}

uint64_t sub_2380AA318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_2380BD5C8();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for ATLogProofs(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    v5(v6, v4);
    v9 = v6 + *(int *)(v7 + 20);
    v10 = type metadata accessor for LogEntry(0);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10))
    {
      swift_bridgeObjectRelease();
      sub_237FFBAB0(*(_QWORD *)(v9 + 24), *(_QWORD *)(v9 + 32));
      v5(v9 + *(int *)(v10 + 36), v4);
      v11 = v9 + *(int *)(v10 + 40);
      v12 = type metadata accessor for SignedObject(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12))
      {
        sub_237FFBAB0(*(_QWORD *)v11, *(_QWORD *)(v11 + 8));
        v5(v11 + *(int *)(v12 + 20), v4);
        v13 = v11 + *(int *)(v12 + 24);
        v14 = type metadata accessor for Signature(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v13, 1, v14))
        {
          sub_237FFBAB0(*(_QWORD *)v13, *(_QWORD *)(v13 + 8));
          sub_237FFBAB0(*(_QWORD *)(v13 + 16), *(_QWORD *)(v13 + 24));
          v5(v13 + *(int *)(v14 + 28), v4);
        }
      }
    }
    v15 = v6 + *(int *)(v7 + 24);
    v16 = type metadata accessor for LogConsistency(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v15, 1, v16);
    if (!(_DWORD)result)
    {
      v5(v15, v4);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2380AA4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;

  v6 = sub_2380BD5C8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for ATLogProofs(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = *(int *)(v11 + 20);
    v61 = v9;
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = type metadata accessor for LogEntry(0);
    v18 = *(_QWORD *)(v17 - 8);
    v60 = (void (*)(char *, char *, uint64_t))v7;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      v20 = v61;
    }
    else
    {
      v57 = v18;
      v59 = v12;
      *(_QWORD *)v15 = *(_QWORD *)v16;
      v15[8] = v16[8];
      v21 = *((_QWORD *)v16 + 3);
      *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
      v22 = *((_QWORD *)v16 + 4);
      swift_bridgeObjectRetain();
      sub_237FFBA20(v21, v22);
      *((_QWORD *)v15 + 3) = v21;
      *((_QWORD *)v15 + 4) = v22;
      v23 = *((_QWORD *)v16 + 6);
      *((_QWORD *)v15 + 5) = *((_QWORD *)v16 + 5);
      *((_QWORD *)v15 + 6) = v23;
      v15[56] = v16[56];
      v60(&v15[*(int *)(v17 + 36)], &v16[*(int *)(v17 + 36)], v6);
      v24 = *(int *)(v17 + 40);
      v25 = &v15[v24];
      v26 = &v16[v24];
      v27 = type metadata accessor for SignedObject(0);
      v28 = *(_QWORD *)(v27 - 8);
      v58 = v17;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
      {
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
        memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
        v12 = v59;
        v30 = v57;
        v20 = v61;
      }
      else
      {
        v54 = v28;
        v31 = v25;
        v56 = v27;
        v32 = *(_QWORD *)v26;
        v33 = *((_QWORD *)v26 + 1);
        sub_237FFBA20(*(_QWORD *)v26, v33);
        *(_QWORD *)v31 = v32;
        *((_QWORD *)v31 + 1) = v33;
        v34 = v56;
        v60(&v31[*(int *)(v56 + 20)], &v26[*(int *)(v56 + 20)], v6);
        v35 = *(int *)(v56 + 24);
        v55 = v31;
        v36 = &v31[v35];
        v37 = (uint64_t *)&v26[v35];
        v38 = type metadata accessor for Signature(0);
        v53 = *(_QWORD *)(v38 - 8);
        v20 = v61;
        if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v53 + 48))(v37, 1, v38))
        {
          v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
          memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
        }
        else
        {
          v52 = v38;
          v40 = *v37;
          v41 = v37[1];
          sub_237FFBA20(*v37, v41);
          *(_QWORD *)v36 = v40;
          *((_QWORD *)v36 + 1) = v41;
          v42 = v37[2];
          v43 = v37[3];
          sub_237FFBA20(v42, v43);
          *((_QWORD *)v36 + 2) = v42;
          *((_QWORD *)v36 + 3) = v43;
          v34 = v56;
          *((_QWORD *)v36 + 4) = v37[4];
          v36[40] = *((_BYTE *)v37 + 40);
          v60(&v36[*(int *)(v52 + 28)], (char *)v37 + *(int *)(v52 + 28), v6);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v36, 0, 1, v52);
        }
        v30 = v57;
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v55, 0, 1, v34);
        v12 = v59;
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v15, 0, 1, v58);
    }
    v44 = *(int *)(v11 + 24);
    v45 = &v20[v44];
    v46 = &v10[v44];
    v47 = type metadata accessor for LogConsistency(0);
    v48 = *(_QWORD *)(v47 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47))
    {
      v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
      memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
    }
    else
    {
      v60(v45, v46, v6);
      *(_QWORD *)&v45[*(int *)(v47 + 20)] = *(_QWORD *)&v46[*(int *)(v47 + 20)];
      v50 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56);
      swift_retain();
      v50(v45, 0, 1, v47);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
  }
  return a1;
}

uint64_t sub_2380AA8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  size_t v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t *, uint64_t, uint64_t);
  int v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t, uint64_t);
  int v112;
  int v113;
  void (*v114)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  char *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t *, uint64_t, uint64_t);
  int v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void (*v158)(uint64_t, char *, uint64_t);
  uint64_t v159;
  void (*v160)(char *, char *, uint64_t);
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *__dst;
  _QWORD *__dsta;
  uint64_t *__dstb;
  _QWORD *__dstc;
  void (*v168)(uint64_t, char *, uint64_t);
  void (*v169)(uint64_t, uint64_t, uint64_t);
  uint64_t v170;
  uint64_t v171;

  v6 = sub_2380BD5C8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = (char *)(a2 + v9);
  v12 = type metadata accessor for ATLogProofs(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14((uint64_t)v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_237FFD540(v10, type metadata accessor for ATLogProofs);
      goto LABEL_7;
    }
    v169 = v8;
    v170 = a1;
    v8(v10, (uint64_t)v11, v6);
    v26 = *(int *)(v12 + 20);
    v27 = v10 + v26;
    v28 = &v11[v26];
    v29 = type metadata accessor for LogEntry(0);
    v161 = *(_QWORD *)(v29 - 8);
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v161 + 48);
    v31 = v30(v27, 1, v29);
    __dst = (void *)v29;
    v32 = v30((uint64_t)v28, 1, v29);
    if (v31)
    {
      a1 = v170;
      if (!v32)
      {
        v33 = *(_QWORD *)v28;
        *(_BYTE *)(v27 + 8) = v28[8];
        *(_QWORD *)v27 = v33;
        *(_QWORD *)(v27 + 16) = *((_QWORD *)v28 + 2);
        v34 = *((_QWORD *)v28 + 3);
        v35 = *((_QWORD *)v28 + 4);
        swift_bridgeObjectRetain();
        sub_237FFBA20(v34, v35);
        *(_QWORD *)(v27 + 24) = v34;
        *(_QWORD *)(v27 + 32) = v35;
        *(_QWORD *)(v27 + 40) = *((_QWORD *)v28 + 5);
        v36 = *((_QWORD *)v28 + 6);
        *(_BYTE *)(v27 + 56) = v28[56];
        *(_QWORD *)(v27 + 48) = v36;
        v158 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 16);
        v158(v27 + *(int *)(v29 + 36), &v28[*(int *)(v29 + 36)], v6);
        v37 = *(int *)(v29 + 40);
        v38 = (_QWORD *)(v27 + v37);
        v39 = &v28[v37];
        v40 = type metadata accessor for SignedObject(0);
        v41 = *(_QWORD *)(v40 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
        {
          v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
          v43 = (void (*)(uint64_t, char *, uint64_t))v169;
          a1 = v170;
          v44 = v161;
        }
        else
        {
          v149 = v41;
          v155 = v40;
          v77 = *(_QWORD *)v39;
          v76 = *((_QWORD *)v39 + 1);
          sub_237FFBA20(*(_QWORD *)v39, v76);
          *v38 = v77;
          v38[1] = v76;
          v78 = v155;
          v158((uint64_t)v38 + *(int *)(v155 + 20), &v39[*(int *)(v155 + 20)], v6);
          v79 = *(int *)(v155 + 24);
          v151 = v38;
          v80 = (_QWORD *)((char *)v38 + v79);
          v81 = (uint64_t *)&v39[v79];
          v82 = type metadata accessor for Signature(0);
          v143 = *(_QWORD *)(v82 - 8);
          v147 = v82;
          v44 = v161;
          if ((*(unsigned int (**)(uint64_t *, uint64_t))(v143 + 48))(v81, 1))
          {
            v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v80, v81, *(_QWORD *)(*(_QWORD *)(v83 - 8) + 64));
          }
          else
          {
            v103 = *v81;
            v141 = v81[1];
            sub_237FFBA20(*v81, v141);
            *v80 = v103;
            v80[1] = v141;
            v104 = v81[2];
            v142 = v81[3];
            sub_237FFBA20(v104, v142);
            v80[2] = v104;
            v80[3] = v142;
            v105 = v81[4];
            *((_BYTE *)v80 + 40) = *((_BYTE *)v81 + 40);
            v80[4] = v105;
            v78 = v155;
            v158((uint64_t)v80 + *(int *)(v147 + 28), (char *)v81 + *(int *)(v147 + 28), v6);
            (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v143 + 56))(v80, 0, 1, v147);
          }
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v149 + 56))(v151, 0, 1, v78);
          v43 = (void (*)(uint64_t, char *, uint64_t))v169;
          a1 = v170;
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v44 + 56))(v27, 0, 1, __dst);
        goto LABEL_42;
      }
    }
    else
    {
      a1 = v170;
      if (!v32)
      {
        v64 = *(_QWORD *)v28;
        *(_BYTE *)(v27 + 8) = v28[8];
        *(_QWORD *)v27 = v64;
        *(_QWORD *)(v27 + 16) = *((_QWORD *)v28 + 2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v65 = *((_QWORD *)v28 + 3);
        v66 = *((_QWORD *)v28 + 4);
        sub_237FFBA20(v65, v66);
        v67 = *(_QWORD *)(v27 + 24);
        v68 = *(_QWORD *)(v27 + 32);
        *(_QWORD *)(v27 + 24) = v65;
        *(_QWORD *)(v27 + 32) = v66;
        sub_237FFBAB0(v67, v68);
        *(_QWORD *)(v27 + 40) = *((_QWORD *)v28 + 5);
        v69 = *((_QWORD *)v28 + 6);
        *(_BYTE *)(v27 + 56) = v28[56];
        *(_QWORD *)(v27 + 48) = v69;
        v169(v27 + *(int *)(v29 + 36), (uint64_t)&v28[*(int *)(v29 + 36)], v6);
        v70 = *(int *)(v29 + 40);
        v71 = (uint64_t *)(v27 + v70);
        v28 += v70;
        v72 = type metadata accessor for SignedObject(0);
        v73 = *(_QWORD *)(v72 - 8);
        v74 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v73 + 48);
        __dstb = v71;
        LODWORD(v71) = v74(v71, 1, v72);
        v75 = v74((uint64_t *)v28, 1, v72);
        if ((_DWORD)v71)
        {
          a1 = v170;
          if (!v75)
          {
            v163 = v73;
            v95 = *(_QWORD *)v28;
            v96 = *((_QWORD *)v28 + 1);
            sub_237FFBA20(*(_QWORD *)v28, v96);
            *__dstb = v95;
            __dstb[1] = v96;
            v160 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
            v160((char *)__dstb + *(int *)(v72 + 20), &v28[*(int *)(v72 + 20)], v6);
            v97 = *(int *)(v72 + 24);
            v98 = (uint64_t *)((char *)__dstb + v97);
            v99 = &v28[v97];
            v100 = type metadata accessor for Signature(0);
            v101 = *(_QWORD *)(v100 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v99, 1, v100))
            {
              v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v98, v99, *(_QWORD *)(*(_QWORD *)(v102 - 8) + 64));
            }
            else
            {
              v152 = (void *)*((_QWORD *)v99 + 1);
              v156 = *(_QWORD *)v99;
              sub_237FFBA20(*(_QWORD *)v99, (unint64_t)v152);
              *v98 = v156;
              v98[1] = v152;
              v153 = (void *)*((_QWORD *)v99 + 3);
              v157 = *((_QWORD *)v99 + 2);
              sub_237FFBA20(v157, (unint64_t)v153);
              v98[2] = v157;
              v98[3] = v153;
              v130 = *((_QWORD *)v99 + 4);
              *((_BYTE *)v98 + 40) = v99[40];
              v98[4] = v130;
              v160((char *)v98 + *(int *)(v100 + 28), &v99[*(int *)(v100 + 28)], v6);
              (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v101 + 56))(v98, 0, 1, v100);
            }
            a1 = v170;
            (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v163 + 56))(__dstb, 0, 1, v72);
            goto LABEL_19;
          }
          v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438) - 8) + 64);
          v55 = __dstb;
        }
        else
        {
          a1 = v170;
          if (!v75)
          {
            v115 = *(_QWORD *)v28;
            v116 = *((_QWORD *)v28 + 1);
            sub_237FFBA20(*(_QWORD *)v28, v116);
            v117 = *__dstb;
            v118 = __dstb[1];
            *__dstb = v115;
            __dstb[1] = v116;
            sub_237FFBAB0(v117, v118);
            v169((uint64_t)__dstb + *(int *)(v72 + 20), (uint64_t)&v28[*(int *)(v72 + 20)], v6);
            v119 = *(int *)(v72 + 24);
            v120 = (uint64_t *)((char *)__dstb + v119);
            v121 = &v28[v119];
            v122 = type metadata accessor for Signature(0);
            __dstc = *(_QWORD **)(v122 - 8);
            v123 = (uint64_t (*)(uint64_t *, uint64_t, uint64_t))__dstc[6];
            LODWORD(v115) = v123(v120, 1, v122);
            v124 = v123((uint64_t *)v121, 1, v122);
            if ((_DWORD)v115)
            {
              if (!v124)
              {
                v126 = *(_QWORD *)v121;
                v125 = *((_QWORD *)v121 + 1);
                sub_237FFBA20(*(_QWORD *)v121, v125);
                *v120 = v126;
                v120[1] = v125;
                v128 = *((_QWORD *)v121 + 2);
                v127 = *((_QWORD *)v121 + 3);
                sub_237FFBA20(v128, v127);
                v120[2] = v128;
                v120[3] = v127;
                v129 = *((_QWORD *)v121 + 4);
                *((_BYTE *)v120 + 40) = v121[40];
                v120[4] = v129;
                (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v120 + *(int *)(v122 + 28), &v121[*(int *)(v122 + 28)], v6);
                ((void (*)(uint64_t *, _QWORD, uint64_t, uint64_t))__dstc[7])(v120, 0, 1, v122);
                a1 = v170;
                goto LABEL_19;
              }
            }
            else
            {
              if (!v124)
              {
                v133 = *(_QWORD *)v121;
                v132 = *((_QWORD *)v121 + 1);
                sub_237FFBA20(*(_QWORD *)v121, v132);
                v134 = *v120;
                v135 = v120[1];
                *v120 = v133;
                v120[1] = v132;
                sub_237FFBAB0(v134, v135);
                v137 = *((_QWORD *)v121 + 2);
                v136 = *((_QWORD *)v121 + 3);
                sub_237FFBA20(v137, v136);
                v138 = v120[2];
                v139 = v120[3];
                v120[2] = v137;
                v120[3] = v136;
                sub_237FFBAB0(v138, v139);
                v140 = *((_QWORD *)v121 + 4);
                *((_BYTE *)v120 + 40) = v121[40];
                v120[4] = v140;
                v43 = (void (*)(uint64_t, char *, uint64_t))v169;
                v169((uint64_t)v120 + *(int *)(v122 + 28), (uint64_t)&v121[*(int *)(v122 + 28)], v6);
                a1 = v170;
                goto LABEL_42;
              }
              sub_237FFD540((uint64_t)v120, type metadata accessor for Signature);
            }
            v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v120, v121, *(_QWORD *)(*(_QWORD *)(v131 - 8) + 64));
            a1 = v170;
            goto LABEL_19;
          }
          sub_237FFD540((uint64_t)__dstb, type metadata accessor for SignedObject);
          v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438) - 8) + 64);
          v55 = __dstb;
        }
LABEL_18:
        memcpy(v55, v28, v54);
LABEL_19:
        v43 = (void (*)(uint64_t, char *, uint64_t))v169;
LABEL_42:
        v106 = *(int *)(v12 + 24);
        v107 = v10 + v106;
        v108 = &v11[v106];
        v109 = type metadata accessor for LogConsistency(0);
        v110 = *(_QWORD *)(v109 - 8);
        v111 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v110 + 48);
        v112 = v111(v107, 1, v109);
        v113 = v111((uint64_t)v108, 1, v109);
        if (v112)
        {
          if (!v113)
          {
            (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v107, v108, v6);
            *(_QWORD *)(v107 + *(int *)(v109 + 20)) = *(_QWORD *)&v108[*(int *)(v109 + 20)];
            v114 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v110 + 56);
            swift_retain();
            v114(v107, 0, 1, v109);
            return a1;
          }
        }
        else
        {
          if (!v113)
          {
            v43(v107, v108, v6);
            *(_QWORD *)(v107 + *(int *)(v109 + 20)) = *(_QWORD *)&v108[*(int *)(v109 + 20)];
            swift_retain();
            swift_release();
            return a1;
          }
          sub_237FFD540(v107, type metadata accessor for LogConsistency);
        }
        v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448) - 8) + 64);
        v24 = (void *)v107;
        v25 = v108;
        goto LABEL_8;
      }
      sub_237FFD540(v27, type metadata accessor for LogEntry);
    }
    v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440) - 8) + 64);
    v55 = (void *)v27;
    goto LABEL_18;
  }
  if (v16)
  {
LABEL_7:
    v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2568C5450) - 8) + 64);
    v24 = (void *)v10;
    v25 = v11;
LABEL_8:
    memcpy(v24, v25, v23);
    return a1;
  }
  v168 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 16);
  v168(v10, v11, v6);
  v17 = *(int *)(v12 + 20);
  v18 = (_QWORD *)(v10 + v17);
  v19 = &v11[v17];
  v20 = type metadata accessor for LogEntry(0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v162 = v21;
    v171 = a1;
    v45 = *(_QWORD *)v19;
    *((_BYTE *)v18 + 8) = v19[8];
    *v18 = v45;
    v18[2] = *((_QWORD *)v19 + 2);
    v46 = *((_QWORD *)v19 + 3);
    v47 = *((_QWORD *)v19 + 4);
    swift_bridgeObjectRetain();
    sub_237FFBA20(v46, v47);
    v18[3] = v46;
    v18[4] = v47;
    v18[5] = *((_QWORD *)v19 + 5);
    v48 = *((_QWORD *)v19 + 6);
    *((_BYTE *)v18 + 56) = v19[56];
    v18[6] = v48;
    v168((uint64_t)v18 + *(int *)(v20 + 36), &v19[*(int *)(v20 + 36)], v6);
    v49 = *(int *)(v20 + 40);
    __dsta = (_QWORD *)((char *)v18 + v49);
    v50 = (uint64_t *)&v19[v49];
    v51 = type metadata accessor for SignedObject(0);
    v52 = *(_QWORD *)(v51 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51))
    {
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
      memcpy(__dsta, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    }
    else
    {
      v154 = v52;
      v159 = v51;
      v56 = *v50;
      v57 = v50[1];
      sub_237FFBA20(*v50, v57);
      *__dsta = v56;
      v58 = __dsta;
      __dsta[1] = v57;
      v59 = v159;
      v168((uint64_t)__dsta + *(int *)(v159 + 20), (char *)v50 + *(int *)(v159 + 20), v6);
      v60 = *(int *)(v159 + 24);
      v150 = (_QWORD *)((char *)__dsta + v60);
      v61 = (uint64_t *)((char *)v50 + v60);
      v62 = type metadata accessor for Signature(0);
      v146 = *(_QWORD *)(v62 - 8);
      v148 = v62;
      if ((*(unsigned int (**)(uint64_t *, uint64_t))(v146 + 48))(v61, 1))
      {
        v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
        memcpy(v150, v61, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
      }
      else
      {
        v84 = *v61;
        v144 = v61[1];
        sub_237FFBA20(*v61, v144);
        *v150 = v84;
        v150[1] = v144;
        v85 = v61[2];
        v145 = v61[3];
        sub_237FFBA20(v85, v145);
        v150[2] = v85;
        v150[3] = v145;
        v86 = v61[4];
        *((_BYTE *)v150 + 40) = *((_BYTE *)v61 + 40);
        v150[4] = v86;
        v58 = __dsta;
        v168((uint64_t)v150 + *(int *)(v148 + 28), (char *)v61 + *(int *)(v148 + 28), v6);
        v59 = v159;
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v146 + 56))(v150, 0, 1, v148);
      }
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v154 + 56))(v58, 0, 1, v59);
    }
    a1 = v171;
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v162 + 56))(v18, 0, 1, v20);
  }
  v87 = *(int *)(v12 + 24);
  v88 = (char *)(v10 + v87);
  v89 = &v11[v87];
  v90 = type metadata accessor for LogConsistency(0);
  v91 = *(_QWORD *)(v90 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v89, 1, v90))
  {
    v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
    memcpy(v88, v89, *(_QWORD *)(*(_QWORD *)(v92 - 8) + 64));
  }
  else
  {
    v168((uint64_t)v88, v89, v6);
    *(_QWORD *)&v88[*(int *)(v90 + 20)] = *(_QWORD *)&v89[*(int *)(v90 + 20)];
    v93 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v91 + 56);
    swift_retain();
    v93(v88, 0, 1, v90);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_2380AB4A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (**__src)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  char *__dst;
  uint64_t v48;

  v6 = sub_2380BD5C8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = type metadata accessor for ATLogProofs(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v48 = v12;
    v7((uint64_t)v9, (uint64_t)v10, v6);
    v14 = *(int *)(v11 + 20);
    v15 = &v9[v14];
    v16 = &v10[v14];
    v17 = type metadata accessor for LogEntry(0);
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v46 = v18;
      *(_QWORD *)v15 = *(_QWORD *)v16;
      v15[8] = v16[8];
      *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
      *(_OWORD *)(v15 + 24) = *(_OWORD *)(v16 + 24);
      v20 = *((_QWORD *)v16 + 6);
      *((_QWORD *)v15 + 5) = *((_QWORD *)v16 + 5);
      *((_QWORD *)v15 + 6) = v20;
      v15[56] = v16[56];
      v7((uint64_t)&v15[*(int *)(v17 + 36)], (uint64_t)&v16[*(int *)(v17 + 36)], v6);
      v44 = v17;
      v21 = *(int *)(v17 + 40);
      __dst = &v15[v21];
      v22 = &v16[v21];
      v23 = type metadata accessor for SignedObject(0);
      v24 = *(_QWORD *)(v23 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
        memcpy(__dst, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
        v26 = v46;
        v27 = v44;
      }
      else
      {
        v42 = v24;
        v28 = __dst;
        *(_OWORD *)__dst = *(_OWORD *)v22;
        v7((uint64_t)&__dst[*(int *)(v23 + 20)], (uint64_t)&v22[*(int *)(v23 + 20)], v6);
        v43 = v23;
        v29 = *(int *)(v23 + 24);
        v41 = &__dst[v29];
        v30 = &v22[v29];
        v31 = type metadata accessor for Signature(0);
        __src = *(void (***)(char *, _QWORD, uint64_t, uint64_t))(v31 - 8);
        if (((unsigned int (*)(char *, uint64_t, uint64_t))__src[6])(v30, 1, v31))
        {
          v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
          memcpy(v41, v30, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
        }
        else
        {
          v33 = *((_OWORD *)v30 + 1);
          *(_OWORD *)v41 = *(_OWORD *)v30;
          *((_OWORD *)v41 + 1) = v33;
          *((_QWORD *)v41 + 4) = *((_QWORD *)v30 + 4);
          v41[40] = v30[40];
          v7((uint64_t)&v41[*(int *)(v31 + 28)], (uint64_t)&v30[*(int *)(v31 + 28)], v6);
          v28 = __dst;
          __src[7](v41, 0, 1, v31);
        }
        v27 = v44;
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v28, 0, 1, v43);
        v26 = v46;
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v15, 0, 1, v27);
    }
    v34 = *(int *)(v11 + 24);
    v35 = &v9[v34];
    v36 = &v10[v34];
    v37 = type metadata accessor for LogConsistency(0);
    v38 = *(_QWORD *)(v37 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
      memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v35, (uint64_t)v36, v6);
      *(_QWORD *)&v35[*(int *)(v37 + 20)] = *(_QWORD *)&v36[*(int *)(v37 + 20)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t sub_2380AB848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  int v16;
  void (*v17)(uint64_t, char *, uint64_t);
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (**v23)(_QWORD *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  size_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  int v69;
  int v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t, uint64_t);
  int v101;
  int v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t (*v109)(char *, uint64_t, uint64_t);
  int v110;
  int v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  void (*v127)(char *, char *, uint64_t);
  uint64_t v128;
  void (*v129)(char *, char *, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD *v133;
  void *v134;
  char *v135;
  _QWORD *v136;
  void (*v137)(char *, char *, uint64_t);
  void (*v138)(uint64_t, char *, uint64_t);
  int *__dst;
  _OWORD *__dsta;
  _QWORD *__dstb;
  _OWORD *__dstc;
  char *v143;
  uint64_t v144;

  v6 = sub_2380BD5C8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = (char *)(a2 + v9);
  v12 = type metadata accessor for ATLogProofs(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14((uint64_t)v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_237FFD540(v10, type metadata accessor for ATLogProofs);
      goto LABEL_7;
    }
    v144 = a1;
    v30 = v7;
    v137 = (void (*)(char *, char *, uint64_t))v8;
    v8(v10, (uint64_t)v11, v6);
    v31 = *(int *)(v12 + 20);
    v32 = (char *)(v10 + v31);
    v33 = &v11[v31];
    v34 = type metadata accessor for LogEntry(0);
    v133 = *(_QWORD **)(v34 - 8);
    v35 = (uint64_t (*)(char *, uint64_t, uint64_t))v133[6];
    v36 = v32;
    LODWORD(v32) = v35(v32, 1, v34);
    __dst = (int *)v34;
    v37 = v35(v33, 1, v34);
    v38 = v30;
    if ((_DWORD)v32)
    {
      if (!v37)
      {
        *(_QWORD *)v36 = *(_QWORD *)v33;
        v36[8] = v33[8];
        *((_QWORD *)v36 + 2) = *((_QWORD *)v33 + 2);
        *(_OWORD *)(v36 + 24) = *(_OWORD *)(v33 + 24);
        v39 = *((_QWORD *)v33 + 6);
        *((_QWORD *)v36 + 5) = *((_QWORD *)v33 + 5);
        *((_QWORD *)v36 + 6) = v39;
        v36[56] = v33[56];
        v127 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
        v130 = v30;
        v127(&v36[__dst[9]], &v33[__dst[9]], v6);
        v40 = __dst[10];
        v41 = &v36[v40];
        v42 = &v33[v40];
        v43 = type metadata accessor for SignedObject(0);
        v44 = *(_QWORD *)(v43 - 8);
        a1 = v144;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
        {
          v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
          v38 = v130;
          v46 = v133;
          v47 = __dst;
        }
        else
        {
          v123 = v44;
          *(_OWORD *)v41 = *(_OWORD *)v42;
          v127(&v41[*(int *)(v43 + 20)], &v42[*(int *)(v43 + 20)], v6);
          v78 = *(int *)(v43 + 24);
          v126 = v41;
          v79 = &v41[v78];
          v80 = &v42[v78];
          v81 = type metadata accessor for Signature(0);
          v119 = *(_QWORD *)(v81 - 8);
          v121 = v81;
          if ((*(unsigned int (**)(char *, uint64_t))(v119 + 48))(v80, 1))
          {
            v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v79, v80, *(_QWORD *)(*(_QWORD *)(v82 - 8) + 64));
          }
          else
          {
            v94 = *((_OWORD *)v80 + 1);
            *(_OWORD *)v79 = *(_OWORD *)v80;
            *((_OWORD *)v79 + 1) = v94;
            *((_QWORD *)v79 + 4) = *((_QWORD *)v80 + 4);
            v79[40] = v80[40];
            v127(&v79[*(int *)(v121 + 28)], &v80[*(int *)(v121 + 28)], v6);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v119 + 56))(v79, 0, 1, v121);
          }
          v38 = v130;
          v47 = __dst;
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v123 + 56))(v126, 0, 1, v43);
          v46 = v133;
        }
        ((void (*)(char *, _QWORD, uint64_t, int *))v46[7])(v36, 0, 1, v47);
        goto LABEL_40;
      }
    }
    else
    {
      if (!v37)
      {
        v132 = v30;
        *(_QWORD *)v36 = *(_QWORD *)v33;
        v36[8] = v33[8];
        *((_QWORD *)v36 + 2) = *((_QWORD *)v33 + 2);
        swift_bridgeObjectRelease();
        v60 = *((_QWORD *)v36 + 3);
        v61 = *((_QWORD *)v36 + 4);
        *(_OWORD *)(v36 + 24) = *(_OWORD *)(v33 + 24);
        sub_237FFBAB0(v60, v61);
        v62 = *((_QWORD *)v33 + 6);
        *((_QWORD *)v36 + 5) = *((_QWORD *)v33 + 5);
        *((_QWORD *)v36 + 6) = v62;
        v36[56] = v33[56];
        v137(&v36[__dst[9]], &v33[__dst[9]], v6);
        v63 = __dst[10];
        v64 = &v36[v63];
        v65 = &v33[v63];
        v66 = type metadata accessor for SignedObject(0);
        __dstb = *(_QWORD **)(v66 - 8);
        v67 = (uint64_t (*)(char *, uint64_t, uint64_t))__dstb[6];
        v68 = v64;
        v69 = v67(v64, 1, v66);
        v70 = v67(v65, 1, v66);
        a1 = v144;
        if (v69)
        {
          if (!v70)
          {
            v71 = v68;
            *(_OWORD *)v68 = *(_OWORD *)v65;
            v72 = *(int *)(v66 + 20);
            v73 = &v68[v72];
            v38 = v132;
            v129 = *(void (**)(char *, char *, uint64_t))(v132 + 32);
            v129(v73, &v65[v72], v6);
            v74 = *(int *)(v66 + 24);
            v135 = &v71[v74];
            v75 = &v65[v74];
            v76 = type metadata accessor for Signature(0);
            v125 = *(_QWORD *)(v76 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v125 + 48))(v75, 1, v76))
            {
              v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v135, v75, *(_QWORD *)(*(_QWORD *)(v77 - 8) + 64));
            }
            else
            {
              v113 = *((_OWORD *)v75 + 1);
              *(_OWORD *)v135 = *(_OWORD *)v75;
              *((_OWORD *)v135 + 1) = v113;
              *((_QWORD *)v135 + 4) = *((_QWORD *)v75 + 4);
              v135[40] = v75[40];
              v129(&v135[*(int *)(v76 + 28)], &v75[*(int *)(v76 + 28)], v6);
              (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v125 + 56))(v135, 0, 1, v76);
            }
            ((void (*)(char *, _QWORD, uint64_t, uint64_t))__dstb[7])(v71, 0, 1, v66);
            goto LABEL_40;
          }
        }
        else
        {
          if (!v70)
          {
            v103 = *(_QWORD *)v68;
            v104 = *((_QWORD *)v68 + 1);
            *(_OWORD *)v68 = *(_OWORD *)v65;
            sub_237FFBAB0(v103, v104);
            v137(&v68[*(int *)(v66 + 20)], &v65[*(int *)(v66 + 20)], v6);
            v105 = *(int *)(v66 + 24);
            v106 = &v68[v105];
            v107 = &v65[v105];
            v108 = type metadata accessor for Signature(0);
            v136 = *(_QWORD **)(v108 - 8);
            v109 = (uint64_t (*)(char *, uint64_t, uint64_t))v136[6];
            v110 = v109(v106, 1, v108);
            __dstc = v107;
            v111 = v109(v107, 1, v108);
            if (v110)
            {
              v38 = v132;
              if (!v111)
              {
                v112 = __dstc[1];
                *(_OWORD *)v106 = *__dstc;
                *((_OWORD *)v106 + 1) = v112;
                *((_QWORD *)v106 + 4) = *((_QWORD *)__dstc + 4);
                v106[40] = *((_BYTE *)__dstc + 40);
                (*(void (**)(char *, char *, uint64_t))(v132 + 32))(&v106[*(int *)(v108 + 28)], (char *)__dstc + *(int *)(v108 + 28), v6);
                ((void (*)(char *, _QWORD, uint64_t, uint64_t))v136[7])(v106, 0, 1, v108);
                goto LABEL_40;
              }
            }
            else
            {
              v38 = v132;
              if (!v111)
              {
                v115 = *(_QWORD *)v106;
                v116 = *((_QWORD *)v106 + 1);
                *(_OWORD *)v106 = *__dstc;
                sub_237FFBAB0(v115, v116);
                v117 = *((_QWORD *)v106 + 2);
                v118 = *((_QWORD *)v106 + 3);
                *((_OWORD *)v106 + 1) = __dstc[1];
                sub_237FFBAB0(v117, v118);
                *((_QWORD *)v106 + 4) = *((_QWORD *)__dstc + 4);
                v106[40] = *((_BYTE *)__dstc + 40);
                v137(&v106[*(int *)(v108 + 28)], (char *)__dstc + *(int *)(v108 + 28), v6);
                goto LABEL_40;
              }
              sub_237FFD540((uint64_t)v106, type metadata accessor for Signature);
            }
            v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v106, __dstc, *(_QWORD *)(*(_QWORD *)(v114 - 8) + 64));
            goto LABEL_40;
          }
          sub_237FFD540((uint64_t)v68, type metadata accessor for SignedObject);
        }
        v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
        memcpy(v68, v65, *(_QWORD *)(*(_QWORD *)(v93 - 8) + 64));
        v38 = v132;
LABEL_40:
        v95 = *(int *)(v12 + 24);
        v96 = v10 + v95;
        v97 = &v11[v95];
        v98 = type metadata accessor for LogConsistency(0);
        v99 = *(_QWORD *)(v98 - 8);
        v100 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v99 + 48);
        v101 = v100(v96, 1, v98);
        v102 = v100((uint64_t)v97, 1, v98);
        if (v101)
        {
          if (!v102)
          {
            (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v96, v97, v6);
            *(_QWORD *)(v96 + *(int *)(v98 + 20)) = *(_QWORD *)&v97[*(int *)(v98 + 20)];
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v99 + 56))(v96, 0, 1, v98);
            return a1;
          }
        }
        else
        {
          if (!v102)
          {
            v137((char *)v96, v97, v6);
            *(_QWORD *)(v96 + *(int *)(v98 + 20)) = *(_QWORD *)&v97[*(int *)(v98 + 20)];
            swift_release();
            return a1;
          }
          sub_237FFD540(v96, type metadata accessor for LogConsistency);
        }
        v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448) - 8) + 64);
        v28 = (void *)v96;
        v29 = v97;
        goto LABEL_8;
      }
      sub_237FFD540((uint64_t)v36, type metadata accessor for LogEntry);
    }
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
    memcpy(v36, v33, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
    a1 = v144;
    goto LABEL_40;
  }
  if (v16)
  {
LABEL_7:
    v27 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2568C5450) - 8) + 64);
    v28 = (void *)v10;
    v29 = v11;
LABEL_8:
    memcpy(v28, v29, v27);
    return a1;
  }
  v17 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v17(v10, v11, v6);
  v18 = *(int *)(v12 + 20);
  v19 = (_QWORD *)(v10 + v18);
  v143 = v11;
  v20 = &v11[v18];
  v21 = type metadata accessor for LogEntry(0);
  v22 = v6;
  v23 = *(unsigned int (***)(_QWORD *, uint64_t, uint64_t))(v21 - 8);
  if (((unsigned int (**)(char *, uint64_t, uint64_t))v23)[6](v20, 1, v21))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    v25 = v22;
    v26 = v143;
  }
  else
  {
    v134 = v23;
    *v19 = *(_QWORD *)v20;
    *((_BYTE *)v19 + 8) = v20[8];
    v19[2] = *((_QWORD *)v20 + 2);
    *(_OWORD *)(v19 + 3) = *(_OWORD *)(v20 + 24);
    v48 = *((_QWORD *)v20 + 6);
    v19[5] = *((_QWORD *)v20 + 5);
    v19[6] = v48;
    *((_BYTE *)v19 + 56) = v20[56];
    v17((uint64_t)v19 + *(int *)(v21 + 36), &v20[*(int *)(v21 + 36)], v22);
    v49 = *(int *)(v21 + 40);
    v138 = v17;
    __dsta = (_OWORD *)((char *)v19 + v49);
    v50 = &v20[v49];
    v51 = type metadata accessor for SignedObject(0);
    v52 = *(_QWORD *)(v51 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51))
    {
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
      memcpy(__dsta, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
      v17 = v138;
      v25 = v22;
      v26 = v143;
    }
    else
    {
      v131 = v52;
      *__dsta = *(_OWORD *)v50;
      v124 = v22;
      v138((uint64_t)__dsta + *(int *)(v51 + 20), &v50[*(int *)(v51 + 20)], v22);
      v55 = *(int *)(v51 + 24);
      v56 = (_OWORD *)((char *)__dsta + v55);
      v57 = &v50[v55];
      v58 = type metadata accessor for Signature(0);
      v120 = *(_QWORD *)(v58 - 8);
      v122 = v58;
      v26 = v143;
      v128 = v51;
      if ((*(unsigned int (**)(char *, uint64_t))(v120 + 48))(v57, 1))
      {
        v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
        memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
        v17 = v138;
        v25 = v124;
      }
      else
      {
        v83 = *((_OWORD *)v57 + 1);
        *v56 = *(_OWORD *)v57;
        v56[1] = v83;
        *((_QWORD *)v56 + 4) = *((_QWORD *)v57 + 4);
        *((_BYTE *)v56 + 40) = v57[40];
        v25 = v124;
        v84 = *(int *)(v122 + 28);
        v85 = &v57[v84];
        v17 = v138;
        v138((uint64_t)v56 + v84, v85, v124);
        (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v120 + 56))(v56, 0, 1, v122);
      }
      (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v131 + 56))(__dsta, 0, 1, v128);
    }
    (*((void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))v134 + 7))(v19, 0, 1, v21);
  }
  v86 = *(int *)(v12 + 24);
  v87 = (char *)(v10 + v86);
  v88 = &v26[v86];
  v89 = type metadata accessor for LogConsistency(0);
  v90 = *(_QWORD *)(v89 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48))(v88, 1, v89))
  {
    v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
    memcpy(v87, v88, *(_QWORD *)(*(_QWORD *)(v91 - 8) + 64));
  }
  else
  {
    v17((uint64_t)v87, v88, v25);
    *(_QWORD *)&v87[*(int *)(v89 + 20)] = *(_QWORD *)&v88[*(int *)(v89 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v90 + 56))(v87, 0, 1, v89);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_2380AC2C4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380AC2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_2380BD5C8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_2380AC348()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380AC354(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_2380BD5C8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for Proto_TransparencyProofs(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C93F0);
}

void sub_2380AC3E8()
{
  unint64_t v0;
  unint64_t v1;

  sub_2380BD5C8();
  if (v0 <= 0x3F)
  {
    sub_237FFB4E8(319, qword_2568C54C0, (void (*)(uint64_t))type metadata accessor for ATLogProofs);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_2380AC47C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
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
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *__dst;
  uint64_t v88;
  void (*v89)(char *, char *, uint64_t);
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_237FFBA20(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    v9 = a2[2];
    v10 = a2[3];
    sub_237FFBA20(v9, v10);
    a1[2] = v9;
    a1[3] = v10;
    a1[4] = a2[4];
    v11 = a3[7];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2380BD5C8();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
    v16 = a3[8];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = type metadata accessor for Proto_SealedHashLedger(0);
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      *v17 = *v18;
      v23 = *(int *)(v19 + 20);
      v24 = (char *)v17 + v23;
      v25 = (char *)v18 + v23;
      swift_bridgeObjectRetain();
      v15(v24, v25, v14);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    v26 = a3[9];
    v27 = (char *)a1 + v26;
    v28 = (char *)a2 + v26;
    v29 = sub_2380BD598();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    v32 = a3[10];
    v33 = (char *)a1 + v32;
    v34 = (char *)a2 + v32;
    v35 = type metadata accessor for Proto_TransparencyProofs(0);
    v36 = *(_QWORD *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      v15(v33, v34, v14);
      v38 = *(int *)(v35 + 20);
      v39 = &v33[v38];
      v40 = &v34[v38];
      v41 = type metadata accessor for ATLogProofs(0);
      v42 = *(_QWORD *)(v41 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
      }
      else
      {
        v90 = v36;
        v15(v39, v40, v14);
        v91 = v40;
        v92 = v41;
        v44 = *(int *)(v41 + 20);
        v45 = &v39[v44];
        v89 = v15;
        v46 = &v40[v44];
        v47 = type metadata accessor for LogEntry(0);
        v48 = *(_QWORD *)(v47 - 8);
        v94 = v39;
        v93 = v42;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v46, 1, v47))
        {
          v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
          memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
          v50 = v91;
          v51 = v92;
          v36 = v90;
        }
        else
        {
          v88 = v48;
          *(_QWORD *)v45 = *(_QWORD *)v46;
          v45[8] = v46[8];
          v52 = *((_QWORD *)v46 + 3);
          *((_QWORD *)v45 + 2) = *((_QWORD *)v46 + 2);
          v53 = *((_QWORD *)v46 + 4);
          swift_bridgeObjectRetain();
          sub_237FFBA20(v52, v53);
          *((_QWORD *)v45 + 3) = v52;
          *((_QWORD *)v45 + 4) = v53;
          v54 = *((_QWORD *)v46 + 6);
          *((_QWORD *)v45 + 5) = *((_QWORD *)v46 + 5);
          *((_QWORD *)v45 + 6) = v54;
          v45[56] = v46[56];
          v89(&v45[*(int *)(v47 + 36)], &v46[*(int *)(v47 + 36)], v14);
          v55 = *(int *)(v47 + 40);
          __dst = &v45[v55];
          v56 = &v46[v55];
          v57 = type metadata accessor for SignedObject(0);
          v58 = *(_QWORD *)(v57 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v56, 1, v57))
          {
            v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
            memcpy(__dst, v56, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
            v39 = v94;
            v60 = v48;
            v36 = v90;
          }
          else
          {
            v86 = v58;
            v85 = v45;
            v61 = v57;
            v62 = *(_QWORD *)v56;
            v63 = *((_QWORD *)v56 + 1);
            sub_237FFBA20(*(_QWORD *)v56, v63);
            *(_QWORD *)__dst = v62;
            *((_QWORD *)__dst + 1) = v63;
            v64 = __dst;
            v89(&__dst[*(int *)(v61 + 20)], &v56[*(int *)(v61 + 20)], v14);
            v84 = v61;
            v65 = *(int *)(v61 + 24);
            v66 = &__dst[v65];
            v67 = (uint64_t *)&v56[v65];
            v68 = type metadata accessor for Signature(0);
            v83 = *(_QWORD *)(v68 - 8);
            v36 = v90;
            if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v83 + 48))(v67, 1, v68))
            {
              v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v66, v67, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
            }
            else
            {
              v70 = *v67;
              v81 = v67[1];
              sub_237FFBA20(*v67, v81);
              *(_QWORD *)v66 = v70;
              *((_QWORD *)v66 + 1) = v81;
              v71 = v67[2];
              v82 = v67[3];
              sub_237FFBA20(v71, v82);
              *((_QWORD *)v66 + 2) = v71;
              v64 = __dst;
              v72 = v67[4];
              *((_QWORD *)v66 + 3) = v82;
              *((_QWORD *)v66 + 4) = v72;
              v66[40] = *((_BYTE *)v67 + 40);
              v89(&v66[*(int *)(v68 + 28)], (char *)v67 + *(int *)(v68 + 28), v14);
              (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v66, 0, 1, v68);
            }
            v60 = v88;
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v86 + 56))(v64, 0, 1, v84);
            v39 = v94;
            v45 = v85;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v45, 0, 1, v47);
          v50 = v91;
          v51 = v92;
        }
        v73 = *(int *)(v51 + 24);
        v74 = &v39[v73];
        v75 = &v50[v73];
        v76 = type metadata accessor for LogConsistency(0);
        v77 = *(_QWORD *)(v76 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v75, 1, v76))
        {
          v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
          memcpy(v74, v75, *(_QWORD *)(*(_QWORD *)(v78 - 8) + 64));
        }
        else
        {
          v89(v74, v75, v14);
          *(_QWORD *)&v74[*(int *)(v76 + 20)] = *(_QWORD *)&v75[*(int *)(v76 + 20)];
          v79 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v77 + 56);
          swift_retain();
          v79(v74, 0, 1, v76);
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v93 + 56))(v94, 0, 1, v51);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
  }
  return a1;
}

uint64_t sub_2380ACAA8(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
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

  sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_237FFBAB0(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_2380BD5C8();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v7 = a1 + a2[8];
  v8 = type metadata accessor for Proto_SealedHashLedger(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    v6(v7 + *(int *)(v8 + 20), v5);
  }
  v9 = a1 + a2[9];
  v10 = sub_2380BD598();
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  v12 = a1 + a2[10];
  v13 = type metadata accessor for Proto_TransparencyProofs(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13);
  if (!(_DWORD)result)
  {
    v6(v12, v5);
    v15 = v12 + *(int *)(v13 + 20);
    v16 = type metadata accessor for ATLogProofs(0);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v15, 1, v16);
    if (!(_DWORD)result)
    {
      v6(v15, v5);
      v17 = v15 + *(int *)(v16 + 20);
      v18 = type metadata accessor for LogEntry(0);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v17, 1, v18))
      {
        swift_bridgeObjectRelease();
        sub_237FFBAB0(*(_QWORD *)(v17 + 24), *(_QWORD *)(v17 + 32));
        v6(v17 + *(int *)(v18 + 36), v5);
        v19 = v17 + *(int *)(v18 + 40);
        v20 = type metadata accessor for SignedObject(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v19, 1, v20))
        {
          sub_237FFBAB0(*(_QWORD *)v19, *(_QWORD *)(v19 + 8));
          v6(v19 + *(int *)(v20 + 20), v5);
          v21 = v19 + *(int *)(v20 + 24);
          v22 = type metadata accessor for Signature(0);
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48))(v21, 1, v22))
          {
            sub_237FFBAB0(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
            sub_237FFBAB0(*(_QWORD *)(v21 + 16), *(_QWORD *)(v21 + 24));
            v6(v21 + *(int *)(v22 + 28), v5);
          }
        }
      }
      v23 = v15 + *(int *)(v16 + 24);
      v24 = type metadata accessor for LogConsistency(0);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v23, 1, v24);
      if (!(_DWORD)result)
      {
        v6(v23, v5);
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t *sub_2380ACD68(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *__dst;
  uint64_t v86;
  void (*v87)(char *, char *, uint64_t);
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;

  v6 = *a2;
  v7 = a2[1];
  sub_237FFBA20(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  v8 = a2[2];
  v9 = a2[3];
  sub_237FFBA20(v8, v9);
  a1[2] = v8;
  a1[3] = v9;
  a1[4] = a2[4];
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2380BD5C8();
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  v14(v11, v12, v13);
  v15 = a3[8];
  v16 = (uint64_t *)((char *)a1 + v15);
  v17 = (uint64_t *)((char *)a2 + v15);
  v18 = type metadata accessor for Proto_SealedHashLedger(0);
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    *v16 = *v17;
    v21 = *(int *)(v18 + 20);
    v22 = (char *)v16 + v21;
    v23 = (char *)v17 + v21;
    swift_bridgeObjectRetain();
    v14(v22, v23, v13);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v24 = a3[9];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = sub_2380BD598();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[10];
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  v33 = type metadata accessor for Proto_TransparencyProofs(0);
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    v14(v31, v32, v13);
    v36 = *(int *)(v33 + 20);
    v37 = &v31[v36];
    v38 = &v32[v36];
    v39 = type metadata accessor for ATLogProofs(0);
    v40 = *(_QWORD *)(v39 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
    {
      v41 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
      memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    }
    else
    {
      v88 = v34;
      v14(v37, v38, v13);
      v89 = v38;
      v90 = v39;
      v42 = *(int *)(v39 + 20);
      v43 = &v37[v42];
      v87 = v14;
      v44 = &v38[v42];
      v45 = type metadata accessor for LogEntry(0);
      v46 = *(_QWORD *)(v45 - 8);
      v92 = v37;
      v91 = v40;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
      {
        v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
        memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
        v48 = v89;
        v49 = v90;
        v34 = v88;
      }
      else
      {
        v86 = v46;
        *(_QWORD *)v43 = *(_QWORD *)v44;
        v43[8] = v44[8];
        v50 = *((_QWORD *)v44 + 3);
        *((_QWORD *)v43 + 2) = *((_QWORD *)v44 + 2);
        v51 = *((_QWORD *)v44 + 4);
        swift_bridgeObjectRetain();
        sub_237FFBA20(v50, v51);
        *((_QWORD *)v43 + 3) = v50;
        *((_QWORD *)v43 + 4) = v51;
        v52 = *((_QWORD *)v44 + 6);
        *((_QWORD *)v43 + 5) = *((_QWORD *)v44 + 5);
        *((_QWORD *)v43 + 6) = v52;
        v43[56] = v44[56];
        v87(&v43[*(int *)(v45 + 36)], &v44[*(int *)(v45 + 36)], v13);
        v53 = *(int *)(v45 + 40);
        __dst = &v43[v53];
        v54 = &v44[v53];
        v55 = type metadata accessor for SignedObject(0);
        v56 = *(_QWORD *)(v55 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v54, 1, v55))
        {
          v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(__dst, v54, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
          v37 = v92;
          v58 = v46;
          v34 = v88;
        }
        else
        {
          v82 = v56;
          v84 = v43;
          v59 = v55;
          v60 = *(_QWORD *)v54;
          v61 = *((_QWORD *)v54 + 1);
          sub_237FFBA20(*(_QWORD *)v54, v61);
          *(_QWORD *)__dst = v60;
          *((_QWORD *)__dst + 1) = v61;
          v62 = __dst;
          v87(&__dst[*(int *)(v59 + 20)], &v54[*(int *)(v59 + 20)], v13);
          v83 = v59;
          v63 = *(int *)(v59 + 24);
          v64 = &__dst[v63];
          v65 = (uint64_t *)&v54[v63];
          v66 = type metadata accessor for Signature(0);
          v81 = *(_QWORD *)(v66 - 8);
          v34 = v88;
          if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v81 + 48))(v65, 1, v66))
          {
            v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v64, v65, *(_QWORD *)(*(_QWORD *)(v67 - 8) + 64));
          }
          else
          {
            v68 = *v65;
            v79 = v65[1];
            sub_237FFBA20(*v65, v79);
            *(_QWORD *)v64 = v68;
            *((_QWORD *)v64 + 1) = v79;
            v69 = v65[2];
            v80 = v65[3];
            sub_237FFBA20(v69, v80);
            *((_QWORD *)v64 + 2) = v69;
            v62 = __dst;
            v70 = v65[4];
            *((_QWORD *)v64 + 3) = v80;
            *((_QWORD *)v64 + 4) = v70;
            v64[40] = *((_BYTE *)v65 + 40);
            v87(&v64[*(int *)(v66 + 28)], (char *)v65 + *(int *)(v66 + 28), v13);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v81 + 56))(v64, 0, 1, v66);
          }
          v58 = v86;
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v82 + 56))(v62, 0, 1, v83);
          v37 = v92;
          v43 = v84;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v43, 0, 1, v45);
        v48 = v89;
        v49 = v90;
      }
      v71 = *(int *)(v49 + 24);
      v72 = &v37[v71];
      v73 = &v48[v71];
      v74 = type metadata accessor for LogConsistency(0);
      v75 = *(_QWORD *)(v74 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v73, 1, v74))
      {
        v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
        memcpy(v72, v73, *(_QWORD *)(*(_QWORD *)(v76 - 8) + 64));
      }
      else
      {
        v87(v72, v73, v13);
        *(_QWORD *)&v72[*(int *)(v74 + 20)] = *(_QWORD *)&v73[*(int *)(v74 + 20)];
        v77 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56);
        swift_retain();
        v77(v72, 0, 1, v74);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v91 + 56))(v92, 0, 1, v49);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

uint64_t *sub_2380AD364(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  int v46;
  int v47;
  void (*v48)(uint64_t, char *, uint64_t);
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  size_t v54;
  void *v55;
  char *v56;
  size_t v57;
  void *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);
  int v63;
  int v64;
  uint64_t v65;
  _QWORD *v66;
  char *v67;
  uint64_t v68;
  unsigned int (**v69)(_QWORD *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  unsigned int (**v75)(_QWORD *, uint64_t, uint64_t);
  uint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (**v87)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t, uint64_t);
  int v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  unsigned int (**v104)(_QWORD *, uint64_t, uint64_t);
  uint64_t v105;
  void (*v106)(uint64_t, char *, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  size_t v129;
  void *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  int *v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t, uint64_t);
  int v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  _QWORD *v170;
  void **v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  _QWORD *v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  char *v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  void (*v194)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  unint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t (*v205)(uint64_t, uint64_t, uint64_t);
  int v206;
  int v207;
  void (*v208)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  uint64_t v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t (*v218)(uint64_t, uint64_t, uint64_t);
  int v219;
  uint64_t v220;
  unint64_t v221;
  uint64_t v222;
  unint64_t v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  unint64_t v227;
  uint64_t v228;
  unint64_t v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  unint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  char *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  _QWORD *v246;
  void *v247;
  char *v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  unint64_t v252;
  unint64_t v253;
  char *__dst;
  void (*__dsta)(uint64_t, char *, uint64_t);
  int *__dstb;
  void *__dstc;
  void *__dstd;
  void (*v259)(char *, char *, uint64_t);
  uint64_t v260;
  char *v261;
  uint64_t v262;
  char *v263;
  _QWORD *v264;
  void *v265;
  void (*v266)(uint64_t, char *, uint64_t);
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void (*v270)(char *, char *, uint64_t);
  int *v271;
  _QWORD *v272;
  uint64_t v273;
  void (*v274)(uint64_t, char *, uint64_t);
  uint64_t v275;

  v6 = *a2;
  v7 = a2[1];
  sub_237FFBA20(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_237FFBAB0(v8, v9);
  v10 = a2[2];
  v11 = a2[3];
  sub_237FFBA20(v10, v11);
  v12 = a1[2];
  v13 = a1[3];
  a1[2] = v10;
  a1[3] = v11;
  sub_237FFBAB0(v12, v13);
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_2380BD5C8();
  v273 = *(_QWORD *)(v17 - 8);
  v270 = *(void (**)(char *, char *, uint64_t))(v273 + 24);
  v270(v15, v16, v17);
  v18 = a3[8];
  v19 = (uint64_t *)((char *)a1 + v18);
  v20 = (uint64_t *)((char *)a2 + v18);
  v21 = type metadata accessor for Proto_SealedHashLedger(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      *v19 = *v20;
      v26 = *(int *)(v21 + 20);
      v27 = (char *)v19 + v26;
      v28 = (char *)v20 + v26;
      v29 = *(void (**)(char *, char *, uint64_t))(v273 + 16);
      swift_bridgeObjectRetain();
      v29(v27, v28, v17);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v25)
  {
    sub_237FFD540((uint64_t)v19, type metadata accessor for Proto_SealedHashLedger);
LABEL_6:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  *v19 = *v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v270((char *)v19 + *(int *)(v21 + 20), (char *)v20 + *(int *)(v21 + 20), v17);
LABEL_7:
  v31 = a3[9];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  v34 = sub_2380BD598();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  v37 = v36(v32, 1, v34);
  v38 = v36(v33, 1, v34);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v38)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
LABEL_12:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 24))(v32, v33, v34);
LABEL_13:
  v40 = a3[10];
  v41 = (uint64_t)a1 + v40;
  v42 = (char *)a2 + v40;
  v43 = type metadata accessor for Proto_TransparencyProofs(0);
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
  v46 = v45(v41, 1, v43);
  v47 = v45((uint64_t)v42, 1, v43);
  if (v46)
  {
    if (!v47)
    {
      v48 = *(void (**)(uint64_t, char *, uint64_t))(v273 + 16);
      v48(v41, v42, v17);
      v49 = *(int *)(v43 + 20);
      v50 = (char *)(v41 + v49);
      v51 = &v42[v49];
      v52 = type metadata accessor for ATLogProofs(0);
      v53 = *(_QWORD *)(v52 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52))
      {
        v48((uint64_t)v50, v51, v17);
        v267 = v17;
        v271 = (int *)v52;
        v71 = *(int *)(v52 + 20);
        v259 = (void (*)(char *, char *, uint64_t))v48;
        v263 = v51;
        v72 = &v50[v71];
        v73 = &v51[v71];
        v74 = type metadata accessor for LogEntry(0);
        v75 = *(unsigned int (***)(_QWORD *, uint64_t, uint64_t))(v74 - 8);
        v275 = v53;
        if (((unsigned int (**)(char *, uint64_t, uint64_t))v75)[6](v73, 1, v74))
        {
          v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
          memcpy(v72, v73, *(_QWORD *)(*(_QWORD *)(v76 - 8) + 64));
          v77 = v263;
        }
        else
        {
          v245 = v75;
          v248 = v50;
          v78 = *(_QWORD *)v73;
          v72[8] = v73[8];
          *(_QWORD *)v72 = v78;
          *((_QWORD *)v72 + 2) = *((_QWORD *)v73 + 2);
          v80 = *((_QWORD *)v73 + 3);
          v79 = *((_QWORD *)v73 + 4);
          swift_bridgeObjectRetain();
          sub_237FFBA20(v80, v79);
          *((_QWORD *)v72 + 3) = v80;
          *((_QWORD *)v72 + 4) = v79;
          *((_QWORD *)v72 + 5) = *((_QWORD *)v73 + 5);
          v81 = *((_QWORD *)v73 + 6);
          v72[56] = v73[56];
          *((_QWORD *)v72 + 6) = v81;
          v259(&v72[*(int *)(v74 + 36)], &v73[*(int *)(v74 + 36)], v267);
          v82 = *(int *)(v74 + 40);
          __dst = &v72[v82];
          v83 = (uint64_t *)&v73[v82];
          v84 = type metadata accessor for SignedObject(0);
          v85 = *(_QWORD *)(v84 - 8);
          if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v85 + 48))(v83, 1, v84))
          {
            v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
            memcpy(__dst, v83, *(_QWORD *)(*(_QWORD *)(v86 - 8) + 64));
            v87 = (void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))v75;
            v50 = v248;
            v77 = v263;
          }
          else
          {
            v237 = v85;
            v239 = v74;
            v242 = v72;
            v119 = v84;
            v120 = *v83;
            v121 = v83[1];
            sub_237FFBA20(*v83, v121);
            *(_QWORD *)__dst = v120;
            *((_QWORD *)__dst + 1) = v121;
            v259(&__dst[*(int *)(v119 + 20)], (char *)v83 + *(int *)(v119 + 20), v267);
            v238 = v119;
            v122 = *(int *)(v119 + 24);
            v123 = &__dst[v122];
            v124 = (uint64_t *)((char *)v83 + v122);
            v125 = type metadata accessor for Signature(0);
            v126 = *(_QWORD *)(v125 - 8);
            v77 = v263;
            if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v126 + 48))(v124, 1, v125))
            {
              v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v123, v124, *(_QWORD *)(*(_QWORD *)(v127 - 8) + 64));
            }
            else
            {
              v236 = v126;
              v142 = *v124;
              v143 = v124[1];
              sub_237FFBA20(*v124, v143);
              *(_QWORD *)v123 = v142;
              *((_QWORD *)v123 + 1) = v143;
              v144 = v124[2];
              v145 = v124[3];
              sub_237FFBA20(v144, v145);
              *((_QWORD *)v123 + 2) = v144;
              *((_QWORD *)v123 + 3) = v145;
              v146 = v124[4];
              v123[40] = *((_BYTE *)v124 + 40);
              *((_QWORD *)v123 + 4) = v146;
              v259(&v123[*(int *)(v125 + 28)], (char *)v124 + *(int *)(v125 + 28), v267);
              (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v236 + 56))(v123, 0, 1, v125);
            }
            v87 = (void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))v245;
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v237 + 56))(__dst, 0, 1, v238);
            v50 = v248;
            v74 = v239;
            v72 = v242;
          }
          ((void (**)(char *, _QWORD, uint64_t, uint64_t))v87)[7](v72, 0, 1, v74);
        }
        v147 = v271[6];
        v148 = v50;
        v149 = &v50[v147];
        v150 = &v77[v147];
        v151 = type metadata accessor for LogConsistency(0);
        v152 = *(_QWORD *)(v151 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v152 + 48))(v150, 1, v151))
        {
          v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
          memcpy(v149, v150, *(_QWORD *)(*(_QWORD *)(v153 - 8) + 64));
        }
        else
        {
          v259(v149, v150, v267);
          *(_QWORD *)&v149[*(int *)(v151 + 20)] = *(_QWORD *)&v150[*(int *)(v151 + 20)];
          v154 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v152 + 56);
          swift_retain();
          v154(v149, 0, 1, v151);
        }
        (*(void (**)(char *, _QWORD, uint64_t, int *))(v275 + 56))(v148, 0, 1, v271);
        goto LABEL_58;
      }
      v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2568C5450) - 8) + 64);
      v55 = v50;
      v56 = v51;
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  if (!v47)
  {
    v270((char *)v41, v42, v17);
    v60 = *(int *)(v43 + 20);
    v41 += v60;
    v61 = &v42[v60];
    v43 = type metadata accessor for ATLogProofs(0);
    v44 = *(_QWORD *)(v43 - 8);
    v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
    v63 = v62(v41, 1, v43);
    v64 = v62((uint64_t)v61, 1, v43);
    if (v63)
    {
      if (!v64)
      {
        v274 = *(void (**)(uint64_t, char *, uint64_t))(v273 + 16);
        v274(v41, v61, v17);
        v65 = *(int *)(v43 + 20);
        v66 = (_QWORD *)(v41 + v65);
        v67 = &v61[v65];
        v68 = type metadata accessor for LogEntry(0);
        v69 = *(unsigned int (***)(_QWORD *, uint64_t, uint64_t))(v68 - 8);
        if (((unsigned int (**)(char *, uint64_t, uint64_t))v69)[6](v67, 1, v68))
        {
          v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
          memcpy(v66, v67, *(_QWORD *)(*(_QWORD *)(v70 - 8) + 64));
        }
        else
        {
          v261 = v61;
          v265 = v69;
          v108 = *(_QWORD *)v67;
          *((_BYTE *)v66 + 8) = v67[8];
          *v66 = v108;
          v66[2] = *((_QWORD *)v67 + 2);
          v109 = v17;
          v110 = *((_QWORD *)v67 + 3);
          v111 = *((_QWORD *)v67 + 4);
          swift_bridgeObjectRetain();
          sub_237FFBA20(v110, v111);
          v66[3] = v110;
          v66[4] = v111;
          v112 = v109;
          v66[5] = *((_QWORD *)v67 + 5);
          v113 = *((_QWORD *)v67 + 6);
          *((_BYTE *)v66 + 56) = v67[56];
          v66[6] = v113;
          v274((uint64_t)v66 + *(int *)(v68 + 36), &v67[*(int *)(v68 + 36)], v109);
          v114 = *(int *)(v68 + 40);
          v272 = (_QWORD *)((char *)v66 + v114);
          v115 = (uint64_t *)&v67[v114];
          v116 = type metadata accessor for SignedObject(0);
          v117 = *(_QWORD *)(v116 - 8);
          if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v117 + 48))(v115, 1, v116))
          {
            v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
            memcpy(v272, v115, *(_QWORD *)(*(_QWORD *)(v118 - 8) + 64));
            v17 = v112;
          }
          else
          {
            v249 = v117;
            __dstb = (int *)v116;
            v132 = v112;
            v133 = *v115;
            v134 = v115[1];
            sub_237FFBA20(*v115, v134);
            *v272 = v133;
            v135 = v132;
            v136 = v272;
            v272[1] = v134;
            v137 = __dstb;
            v274((uint64_t)v272 + __dstb[5], (char *)v115 + __dstb[5], v135);
            v138 = __dstb[6];
            v246 = (_QWORD *)((char *)v272 + v138);
            v139 = (uint64_t *)((char *)v115 + v138);
            v140 = type metadata accessor for Signature(0);
            v240 = *(_QWORD *)(v140 - 8);
            v243 = v140;
            if ((*(unsigned int (**)(uint64_t *, uint64_t))(v240 + 48))(v139, 1))
            {
              v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v246, v139, *(_QWORD *)(*(_QWORD *)(v141 - 8) + 64));
              v17 = v135;
            }
            else
            {
              v269 = v135;
              v182 = *v139;
              v183 = v139[1];
              sub_237FFBA20(*v139, v183);
              *v246 = v182;
              v246[1] = v183;
              v184 = v139[2];
              v185 = v139[3];
              sub_237FFBA20(v184, v185);
              v246[2] = v184;
              v246[3] = v185;
              v137 = __dstb;
              v186 = v139[4];
              *((_BYTE *)v246 + 40) = *((_BYTE *)v139 + 40);
              v246[4] = v186;
              v187 = *(int *)(v243 + 28);
              v188 = (char *)v139 + v187;
              v17 = v269;
              v274((uint64_t)v246 + v187, v188, v269);
              (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v240 + 56))(v246, 0, 1, v243);
              v136 = v272;
            }
            (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v249 + 56))(v136, 0, 1, v137);
          }
          v61 = v261;
          (*((void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))v265 + 7))(v66, 0, 1, v68);
        }
        v189 = *(int *)(v43 + 24);
        v190 = (char *)(v41 + v189);
        v191 = &v61[v189];
        v192 = type metadata accessor for LogConsistency(0);
        v193 = *(_QWORD *)(v192 - 8);
        if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v193 + 48))(v191, 1, v192))
        {
          v274((uint64_t)v190, v191, v17);
          *(_QWORD *)&v190[*(int *)(v192 + 20)] = *(_QWORD *)&v191[*(int *)(v192 + 20)];
          v194 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v193 + 56);
          swift_retain();
          v194(v190, 0, 1, v192);
          goto LABEL_58;
        }
        v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448) - 8) + 64);
        v55 = v190;
        v56 = v191;
LABEL_17:
        memcpy(v55, v56, v54);
LABEL_58:
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
        return a1;
      }
      goto LABEL_32;
    }
    if (v64)
    {
      sub_237FFD540(v41, type metadata accessor for ATLogProofs);
LABEL_32:
      v57 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2568C5450) - 8) + 64);
      v58 = (void *)v41;
      v59 = v61;
      goto LABEL_21;
    }
    v268 = v17;
    v270((char *)v41, v61, v17);
    v88 = *(int *)(v43 + 20);
    v89 = v41 + v88;
    v90 = &v61[v88];
    v91 = type metadata accessor for LogEntry(0);
    v92 = *(_QWORD *)(v91 - 8);
    v93 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v92 + 48);
    v94 = v93(v89, 1, v91);
    v95 = v93((uint64_t)v90, 1, v91);
    if (v94)
    {
      if (!v95)
      {
        v260 = v92;
        v96 = *(_QWORD *)v90;
        *(_BYTE *)(v89 + 8) = v90[8];
        *(_QWORD *)v89 = v96;
        *(_QWORD *)(v89 + 16) = *((_QWORD *)v90 + 2);
        v97 = *((_QWORD *)v90 + 3);
        v98 = *((_QWORD *)v90 + 4);
        swift_bridgeObjectRetain();
        sub_237FFBA20(v97, v98);
        *(_QWORD *)(v89 + 24) = v97;
        *(_QWORD *)(v89 + 32) = v98;
        *(_QWORD *)(v89 + 40) = *((_QWORD *)v90 + 5);
        v99 = *((_QWORD *)v90 + 6);
        *(_BYTE *)(v89 + 56) = v90[56];
        *(_QWORD *)(v89 + 48) = v99;
        v100 = v268;
        __dsta = *(void (**)(uint64_t, char *, uint64_t))(v273 + 16);
        __dsta(v89 + *(int *)(v91 + 36), &v90[*(int *)(v91 + 36)], v268);
        v101 = *(int *)(v91 + 40);
        v264 = (_QWORD *)(v89 + v101);
        v102 = &v90[v101];
        v103 = type metadata accessor for SignedObject(0);
        v104 = *(unsigned int (***)(_QWORD *, uint64_t, uint64_t))(v103 - 8);
        if (((unsigned int (**)(char *, uint64_t, uint64_t))v104)[6](v102, 1, v103))
        {
          v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(v264, v102, *(_QWORD *)(*(_QWORD *)(v105 - 8) + 64));
          v106 = (void (*)(uint64_t, char *, uint64_t))v270;
          v107 = v260;
        }
        else
        {
          v247 = v104;
          v174 = *(_QWORD *)v102;
          v175 = v103;
          v250 = *((_QWORD *)v102 + 1);
          sub_237FFBA20(*(_QWORD *)v102, v250);
          v176 = v264;
          *v264 = v174;
          v100 = v268;
          v264[1] = v250;
          __dsta((uint64_t)v264 + *(int *)(v175 + 20), &v102[*(int *)(v175 + 20)], v268);
          v251 = v175;
          v177 = *(int *)(v175 + 24);
          v178 = (_QWORD *)((char *)v264 + v177);
          v179 = (uint64_t *)&v102[v177];
          v180 = type metadata accessor for Signature(0);
          v241 = *(_QWORD *)(v180 - 8);
          v244 = v180;
          if ((*(unsigned int (**)(uint64_t *, uint64_t))(v241 + 48))(v179, 1))
          {
            v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v178, v179, *(_QWORD *)(*(_QWORD *)(v181 - 8) + 64));
          }
          else
          {
            v195 = *v179;
            v196 = v179[1];
            sub_237FFBA20(*v179, v196);
            *v178 = v195;
            v178[1] = v196;
            v197 = v179[2];
            v198 = v179[3];
            sub_237FFBA20(v197, v198);
            v178[2] = v197;
            v178[3] = v198;
            v199 = v179[4];
            *((_BYTE *)v178 + 40) = *((_BYTE *)v179 + 40);
            v178[4] = v199;
            v176 = v264;
            __dsta((uint64_t)v178 + *(int *)(v244 + 28), (char *)v179 + *(int *)(v244 + 28), v268);
            (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v241 + 56))(v178, 0, 1, v244);
            v100 = v268;
          }
          v107 = v260;
          (*((void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))v247 + 7))(v176, 0, 1, v251);
          v106 = (void (*)(uint64_t, char *, uint64_t))v270;
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v107 + 56))(v89, 0, 1, v91);
        goto LABEL_78;
      }
    }
    else
    {
      if (!v95)
      {
        v156 = *(_QWORD *)v90;
        *(_BYTE *)(v89 + 8) = v90[8];
        *(_QWORD *)v89 = v156;
        *(_QWORD *)(v89 + 16) = *((_QWORD *)v90 + 2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v157 = *((_QWORD *)v90 + 3);
        v158 = *((_QWORD *)v90 + 4);
        sub_237FFBA20(v157, v158);
        v159 = *(_QWORD *)(v89 + 24);
        v160 = *(_QWORD *)(v89 + 32);
        *(_QWORD *)(v89 + 24) = v157;
        *(_QWORD *)(v89 + 32) = v158;
        sub_237FFBAB0(v159, v160);
        *(_QWORD *)(v89 + 40) = *((_QWORD *)v90 + 5);
        v161 = *((_QWORD *)v90 + 6);
        *(_BYTE *)(v89 + 56) = v90[56];
        *(_QWORD *)(v89 + 48) = v161;
        v270((char *)(v89 + *(int *)(v91 + 36)), &v90[*(int *)(v91 + 36)], v268);
        v162 = *(int *)(v91 + 40);
        v89 += v162;
        v90 += v162;
        v163 = type metadata accessor for SignedObject(0);
        v164 = *(_QWORD *)(v163 - 8);
        v165 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v164 + 48);
        LODWORD(v157) = v165(v89, 1, v163);
        v166 = v165((uint64_t)v90, 1, v163);
        if ((_DWORD)v157)
        {
          if (!v166)
          {
            v167 = *(_QWORD *)v90;
            v168 = *((_QWORD *)v90 + 1);
            sub_237FFBA20(*(_QWORD *)v90, v168);
            *(_QWORD *)v89 = v167;
            *(_QWORD *)(v89 + 8) = v168;
            v266 = *(void (**)(uint64_t, char *, uint64_t))(v273 + 16);
            v266(v89 + *(int *)(v163 + 20), &v90[*(int *)(v163 + 20)], v268);
            v169 = *(int *)(v163 + 24);
            v170 = (_QWORD *)(v89 + v169);
            v171 = (void **)&v90[v169];
            v172 = type metadata accessor for Signature(0);
            v262 = *(_QWORD *)(v172 - 8);
            if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v262 + 48))(v171, 1, v172))
            {
              v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v170, v171, *(_QWORD *)(*(_QWORD *)(v173 - 8) + 64));
            }
            else
            {
              v252 = (unint64_t)v171[1];
              __dstc = *v171;
              sub_237FFBA20((uint64_t)*v171, v252);
              *v170 = __dstc;
              v170[1] = v252;
              v253 = (unint64_t)v171[3];
              __dstd = v171[2];
              sub_237FFBA20((uint64_t)__dstd, v253);
              v170[2] = __dstd;
              v170[3] = v253;
              v225 = v171[4];
              *((_BYTE *)v170 + 40) = *((_BYTE *)v171 + 40);
              v170[4] = v225;
              v266((uint64_t)v170 + *(int *)(v172 + 28), (char *)v171 + *(int *)(v172 + 28), v268);
              (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v262 + 56))(v170, 0, 1, v172);
            }
            v106 = (void (*)(uint64_t, char *, uint64_t))v270;
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v164 + 56))(v89, 0, 1, v163);
            v100 = v268;
            goto LABEL_78;
          }
        }
        else
        {
          if (!v166)
          {
            v209 = *(_QWORD *)v90;
            v210 = *((_QWORD *)v90 + 1);
            sub_237FFBA20(*(_QWORD *)v90, v210);
            v211 = *(_QWORD *)v89;
            v212 = *(_QWORD *)(v89 + 8);
            *(_QWORD *)v89 = v209;
            *(_QWORD *)(v89 + 8) = v210;
            sub_237FFBAB0(v211, v212);
            v270((char *)(v89 + *(int *)(v163 + 20)), &v90[*(int *)(v163 + 20)], v268);
            v213 = *(int *)(v163 + 24);
            v214 = v89 + v213;
            v215 = &v90[v213];
            v216 = type metadata accessor for Signature(0);
            v217 = *(_QWORD *)(v216 - 8);
            v218 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v217 + 48);
            LODWORD(v209) = v218(v214, 1, v216);
            v219 = v218((uint64_t)v215, 1, v216);
            if ((_DWORD)v209)
            {
              if (!v219)
              {
                v220 = *(_QWORD *)v215;
                v221 = *((_QWORD *)v215 + 1);
                sub_237FFBA20(*(_QWORD *)v215, v221);
                *(_QWORD *)v214 = v220;
                *(_QWORD *)(v214 + 8) = v221;
                v222 = *((_QWORD *)v215 + 2);
                v223 = *((_QWORD *)v215 + 3);
                sub_237FFBA20(v222, v223);
                *(_QWORD *)(v214 + 16) = v222;
                *(_QWORD *)(v214 + 24) = v223;
                v224 = *((_QWORD *)v215 + 4);
                *(_BYTE *)(v214 + 40) = v215[40];
                *(_QWORD *)(v214 + 32) = v224;
                v100 = v268;
                (*(void (**)(uint64_t, char *, uint64_t))(v273 + 16))(v214 + *(int *)(v216 + 28), &v215[*(int *)(v216 + 28)], v268);
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v217 + 56))(v214, 0, 1, v216);
                goto LABEL_48;
              }
            }
            else
            {
              if (!v219)
              {
                v226 = *(_QWORD *)v215;
                v227 = *((_QWORD *)v215 + 1);
                sub_237FFBA20(*(_QWORD *)v215, v227);
                v228 = *(_QWORD *)v214;
                v229 = *(_QWORD *)(v214 + 8);
                *(_QWORD *)v214 = v226;
                *(_QWORD *)(v214 + 8) = v227;
                sub_237FFBAB0(v228, v229);
                v230 = *((_QWORD *)v215 + 2);
                v231 = *((_QWORD *)v215 + 3);
                sub_237FFBA20(v230, v231);
                v232 = *(_QWORD *)(v214 + 16);
                v233 = *(_QWORD *)(v214 + 24);
                *(_QWORD *)(v214 + 16) = v230;
                *(_QWORD *)(v214 + 24) = v231;
                sub_237FFBAB0(v232, v233);
                v234 = *((_QWORD *)v215 + 4);
                *(_BYTE *)(v214 + 40) = v215[40];
                *(_QWORD *)(v214 + 32) = v234;
                v235 = *(int *)(v216 + 28);
                v100 = v268;
                v106 = (void (*)(uint64_t, char *, uint64_t))v270;
                v270((char *)(v214 + v235), &v215[v235], v268);
                goto LABEL_78;
              }
              sub_237FFD540(v214, type metadata accessor for Signature);
            }
            v129 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430) - 8) + 64);
            v130 = (void *)v214;
            v131 = v215;
LABEL_47:
            memcpy(v130, v131, v129);
            v100 = v268;
LABEL_48:
            v106 = (void (*)(uint64_t, char *, uint64_t))v270;
LABEL_78:
            v200 = *(int *)(v43 + 24);
            v201 = v41 + v200;
            v202 = &v61[v200];
            v203 = type metadata accessor for LogConsistency(0);
            v204 = *(_QWORD *)(v203 - 8);
            v205 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v204 + 48);
            v206 = v205(v201, 1, v203);
            v207 = v205((uint64_t)v202, 1, v203);
            if (v206)
            {
              if (!v207)
              {
                (*(void (**)(uint64_t, char *, uint64_t))(v273 + 16))(v201, v202, v100);
                *(_QWORD *)(v201 + *(int *)(v203 + 20)) = *(_QWORD *)&v202[*(int *)(v203 + 20)];
                v208 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v204 + 56);
                swift_retain();
                v208(v201, 0, 1, v203);
                return a1;
              }
            }
            else
            {
              if (!v207)
              {
                v106(v201, v202, v100);
                *(_QWORD *)(v201 + *(int *)(v203 + 20)) = *(_QWORD *)&v202[*(int *)(v203 + 20)];
                swift_retain();
                swift_release();
                return a1;
              }
              sub_237FFD540(v201, type metadata accessor for LogConsistency);
            }
            v57 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448) - 8) + 64);
            v58 = (void *)v201;
            v59 = v202;
            goto LABEL_21;
          }
          sub_237FFD540(v89, type metadata accessor for SignedObject);
        }
        v128 = &qword_2568C5438;
LABEL_46:
        v129 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(v128) - 8) + 64);
        v130 = (void *)v89;
        v131 = v90;
        goto LABEL_47;
      }
      sub_237FFD540(v89, type metadata accessor for LogEntry);
    }
    v128 = &qword_2568C5440;
    goto LABEL_46;
  }
  sub_237FFD540(v41, type metadata accessor for Proto_TransparencyProofs);
LABEL_20:
  v57 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010) - 8) + 64);
  v58 = (void *)v41;
  v59 = v42;
LABEL_21:
  memcpy(v58, v59, v57);
  return a1;
}

uint64_t sub_2380AE564(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *__dst;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2380BD5C8();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = a3[8];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  v15 = type metadata accessor for Proto_SealedHashLedger(0);
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    *v13 = *v14;
    v11((uint64_t)v13 + *(int *)(v15 + 20), (uint64_t)v14 + *(int *)(v15 + 20), v10);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v18 = a3[9];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  v21 = sub_2380BD598();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = a3[10];
  v25 = (char *)(a1 + v24);
  v26 = (char *)(a2 + v24);
  v27 = type metadata accessor for Proto_TransparencyProofs(0);
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    v11((uint64_t)v25, (uint64_t)v26, v10);
    v30 = *(int *)(v27 + 20);
    v31 = &v25[v30];
    v32 = &v26[v30];
    v33 = type metadata accessor for ATLogProofs(0);
    v34 = *(_QWORD *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      v76 = v34;
      v11((uint64_t)v31, (uint64_t)v32, v10);
      v77 = v33;
      v78 = v31;
      v36 = *(int *)(v33 + 20);
      v37 = v32;
      v38 = &v31[v36];
      v75 = v37;
      v39 = &v37[v36];
      v40 = type metadata accessor for LogEntry(0);
      v41 = *(_QWORD *)(v40 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v39, 1, v40))
      {
        v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
        memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
        v44 = v77;
        v43 = v78;
        v45 = v75;
      }
      else
      {
        v71 = v41;
        *(_QWORD *)v38 = *(_QWORD *)v39;
        v38[8] = v39[8];
        *((_QWORD *)v38 + 2) = *((_QWORD *)v39 + 2);
        *(_OWORD *)(v38 + 24) = *(_OWORD *)(v39 + 24);
        v46 = *((_QWORD *)v39 + 6);
        *((_QWORD *)v38 + 5) = *((_QWORD *)v39 + 5);
        *((_QWORD *)v38 + 6) = v46;
        v38[56] = v39[56];
        v11((uint64_t)&v38[*(int *)(v40 + 36)], (uint64_t)&v39[*(int *)(v40 + 36)], v10);
        v72 = v40;
        v47 = *(int *)(v40 + 40);
        __dst = &v38[v47];
        v48 = &v39[v47];
        v49 = type metadata accessor for SignedObject(0);
        v50 = *(_QWORD *)(v49 - 8);
        v73 = v38;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49))
        {
          v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(__dst, v48, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
          v53 = v71;
          v52 = v72;
          v45 = v75;
          v44 = v77;
        }
        else
        {
          v69 = v50;
          *(_OWORD *)__dst = *(_OWORD *)v48;
          v11((uint64_t)&__dst[*(int *)(v49 + 20)], (uint64_t)&v48[*(int *)(v49 + 20)], v10);
          v70 = v49;
          v54 = *(int *)(v49 + 24);
          v55 = &__dst[v54];
          v56 = &v48[v54];
          v57 = type metadata accessor for Signature(0);
          v67 = *(_QWORD *)(v57 - 8);
          v68 = v57;
          v45 = v75;
          v44 = v77;
          if ((*(unsigned int (**)(char *, uint64_t))(v67 + 48))(v56, 1))
          {
            v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
          }
          else
          {
            v59 = *((_OWORD *)v56 + 1);
            *(_OWORD *)v55 = *(_OWORD *)v56;
            *((_OWORD *)v55 + 1) = v59;
            *((_QWORD *)v55 + 4) = *((_QWORD *)v56 + 4);
            v55[40] = v56[40];
            v11((uint64_t)&v55[*(int *)(v68 + 28)], (uint64_t)&v56[*(int *)(v68 + 28)], v10);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(v55, 0, 1, v68);
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56))(__dst, 0, 1, v70);
          v53 = v71;
          v52 = v72;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v73, 0, 1, v52);
        v43 = v78;
      }
      v60 = *(int *)(v44 + 24);
      v61 = &v43[v60];
      v62 = &v45[v60];
      v63 = type metadata accessor for LogConsistency(0);
      v64 = *(_QWORD *)(v63 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v62, 1, v63))
      {
        v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
        memcpy(v61, v62, *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64));
      }
      else
      {
        v11((uint64_t)v61, (uint64_t)v62, v10);
        *(_QWORD *)&v61[*(int *)(v63 + 20)] = *(_QWORD *)&v62[*(int *)(v63 + 20)];
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v61, 0, 1, v63);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v76 + 56))(v78, 0, 1, v77);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

uint64_t *sub_2380AEABC(uint64_t *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t);
  int v39;
  int v40;
  void (*v41)(uint64_t, char *, uint64_t);
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  char *v48;
  char *v49;
  size_t v50;
  void *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t);
  int v56;
  int v57;
  void (*v58)(uint64_t, char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, char *, uint64_t);
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t, uint64_t);
  int v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t, char *, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _OWORD *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  size_t v111;
  void *v112;
  char *v113;
  uint64_t v114;
  _OWORD *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t, uint64_t);
  uint64_t v134;
  int v135;
  uint64_t v136;
  uint64_t v137;
  _OWORD *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  _OWORD *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  __int128 v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  __int128 v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t (*v162)(uint64_t, uint64_t, uint64_t);
  int v163;
  int v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t (*v171)(uint64_t, uint64_t, uint64_t);
  int v172;
  int v173;
  __int128 v174;
  __int128 v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  int *__src;
  void *__srca;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  _OWORD *v194;
  _OWORD *v195;
  char *__dst;
  void (*__dsta)(uint64_t, char *, uint64_t);
  void *__dstb;
  void (*__dstc)(uint64_t, char *, uint64_t);
  void (*v200)(char *, char *, uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void (*v209)(char *, uint64_t);
  char *v210;
  uint64_t v211;

  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_237FFBAB0(v6, v7);
  v8 = a1[2];
  v9 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_237FFBAB0(v8, v9);
  a1[4] = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2380BD5C8();
  v14 = *(_QWORD *)(v13 - 8);
  v208 = v13;
  v209 = *(void (**)(char *, uint64_t))(v14 + 40);
  v209(v11, v12);
  v15 = a3[8];
  v16 = (char *)a1 + v15;
  v17 = (char *)(a2 + v15);
  v18 = type metadata accessor for Proto_SealedHashLedger(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v21 = v20(v16, 1, v18);
  v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      *(_QWORD *)v16 = *(_QWORD *)v17;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v16[*(int *)(v18 + 20)], &v17[*(int *)(v18 + 20)], v208);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    sub_237FFD540((uint64_t)v16, type metadata accessor for Proto_SealedHashLedger);
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)v16 = *(_QWORD *)v17;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v209)(&v16[*(int *)(v18 + 20)], &v17[*(int *)(v18 + 20)], v208);
LABEL_7:
  v24 = a3[9];
  v25 = (char *)a1 + v24;
  v26 = (char *)(a2 + v24);
  v27 = sub_2380BD598();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
LABEL_12:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 40))(v25, v26, v27);
LABEL_13:
  v33 = a3[10];
  v34 = (uint64_t)a1 + v33;
  v35 = (char *)(a2 + v33);
  v36 = type metadata accessor for Proto_TransparencyProofs(0);
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
  v39 = v38(v34, 1, v36);
  v40 = v38((uint64_t)v35, 1, v36);
  if (v39)
  {
    if (!v40)
    {
      v41 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
      v41(v34, v35, v208);
      v42 = *(int *)(v36 + 20);
      v43 = (char *)(v34 + v42);
      v44 = &v35[v42];
      v45 = type metadata accessor for ATLogProofs(0);
      v46 = *(_QWORD *)(v45 - 8);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
      {
        v211 = v46;
        v41((uint64_t)v43, v44, v208);
        v68 = *(int *)(v45 + 20);
        v200 = (void (*)(char *, char *, uint64_t))v41;
        v205 = v43;
        v69 = &v43[v68];
        v70 = &v44[v68];
        v71 = type metadata accessor for LogEntry(0);
        v72 = *(_QWORD *)(v71 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71))
        {
          v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
          memcpy(v69, v70, *(_QWORD *)(*(_QWORD *)(v73 - 8) + 64));
          v74 = v205;
        }
        else
        {
          v193 = v72;
          *(_QWORD *)v69 = *(_QWORD *)v70;
          v69[8] = v70[8];
          *((_QWORD *)v69 + 2) = *((_QWORD *)v70 + 2);
          *(_OWORD *)(v69 + 24) = *(_OWORD *)(v70 + 24);
          v75 = *((_QWORD *)v70 + 6);
          *((_QWORD *)v69 + 5) = *((_QWORD *)v70 + 5);
          *((_QWORD *)v69 + 6) = v75;
          v69[56] = v70[56];
          v200(&v69[*(int *)(v71 + 36)], &v70[*(int *)(v71 + 36)], v208);
          v76 = *(int *)(v71 + 40);
          __dst = &v69[v76];
          v77 = &v70[v76];
          v78 = type metadata accessor for SignedObject(0);
          v185 = *(_QWORD *)(v78 - 8);
          v190 = v71;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v185 + 48))(v77, 1, v78))
          {
            v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
            memcpy(__dst, v77, *(_QWORD *)(*(_QWORD *)(v79 - 8) + 64));
            v81 = v71;
            v80 = v193;
            v74 = v205;
          }
          else
          {
            *(_OWORD *)__dst = *(_OWORD *)v77;
            v200(&__dst[*(int *)(v78 + 20)], &v77[*(int *)(v78 + 20)], v208);
            v182 = v78;
            v106 = *(int *)(v78 + 24);
            v107 = &__dst[v106];
            v108 = &v77[v106];
            v109 = type metadata accessor for Signature(0);
            v181 = *(_QWORD *)(v109 - 8);
            __src = (int *)v109;
            v74 = v205;
            if ((*(unsigned int (**)(char *, uint64_t))(v181 + 48))(v108, 1))
            {
              v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v107, v108, *(_QWORD *)(*(_QWORD *)(v110 - 8) + 64));
            }
            else
            {
              v119 = *((_OWORD *)v108 + 1);
              *(_OWORD *)v107 = *(_OWORD *)v108;
              *((_OWORD *)v107 + 1) = v119;
              *((_QWORD *)v107 + 4) = *((_QWORD *)v108 + 4);
              v107[40] = v108[40];
              v200(&v107[__src[7]], &v108[__src[7]], v208);
              (*(void (**)(char *, _QWORD, uint64_t, int *))(v181 + 56))(v107, 0, 1, __src);
            }
            v81 = v190;
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v185 + 56))(__dst, 0, 1, v182);
            v80 = v193;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v80 + 56))(v69, 0, 1, v81);
        }
        v120 = *(int *)(v45 + 24);
        v121 = &v74[v120];
        v122 = &v44[v120];
        v123 = type metadata accessor for LogConsistency(0);
        v124 = *(_QWORD *)(v123 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v124 + 48))(v122, 1, v123))
        {
          v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448);
          memcpy(v121, v122, *(_QWORD *)(*(_QWORD *)(v125 - 8) + 64));
        }
        else
        {
          v200(v121, v122, v208);
          *(_QWORD *)&v121[*(int *)(v123 + 20)] = *(_QWORD *)&v122[*(int *)(v123 + 20)];
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v124 + 56))(v121, 0, 1, v123);
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v211 + 56))(v74, 0, 1, v45);
        goto LABEL_58;
      }
      v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2568C5450) - 8) + 64);
      v48 = v43;
      v49 = v44;
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  if (!v40)
  {
    ((void (*)(uint64_t, char *, uint64_t))v209)(v34, v35, v208);
    v53 = *(int *)(v36 + 20);
    v34 += v53;
    v54 = &v35[v53];
    v36 = type metadata accessor for ATLogProofs(0);
    v37 = *(_QWORD *)(v36 - 8);
    v55 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
    v56 = v55(v34, 1, v36);
    v57 = v55((uint64_t)v54, 1, v36);
    if (v56)
    {
      if (!v57)
      {
        v58 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
        v59 = v208;
        v58(v34, v54, v208);
        v60 = *(int *)(v36 + 20);
        v61 = (_QWORD *)(v34 + v60);
        v210 = v54;
        v62 = &v54[v60];
        v63 = type metadata accessor for LogEntry(0);
        v64 = *(_QWORD *)(v63 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v62, 1, v63))
        {
          v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440);
          memcpy(v61, v62, *(_QWORD *)(*(_QWORD *)(v65 - 8) + 64));
          v66 = (void (*)(char *, char *, uint64_t))v58;
          v67 = v210;
        }
        else
        {
          __dstb = (void *)v34;
          v202 = v64;
          *v61 = *(_QWORD *)v62;
          *((_BYTE *)v61 + 8) = v62[8];
          v61[2] = *((_QWORD *)v62 + 2);
          *(_OWORD *)(v61 + 3) = *(_OWORD *)(v62 + 24);
          v98 = *((_QWORD *)v62 + 6);
          v61[5] = *((_QWORD *)v62 + 5);
          v61[6] = v98;
          *((_BYTE *)v61 + 56) = v62[56];
          v58((uint64_t)v61 + *(int *)(v63 + 36), &v62[*(int *)(v63 + 36)], v208);
          v99 = *(int *)(v63 + 40);
          v100 = (_OWORD *)((char *)v61 + v99);
          v101 = &v62[v99];
          v102 = type metadata accessor for SignedObject(0);
          v103 = *(_QWORD *)(v102 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v103 + 48))(v101, 1, v102))
          {
            v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
            memcpy(v100, v101, *(_QWORD *)(*(_QWORD *)(v104 - 8) + 64));
            v59 = v208;
            v67 = v210;
            v34 = (uint64_t)__dstb;
            v105 = v202;
          }
          else
          {
            v191 = v103;
            *v100 = *(_OWORD *)v101;
            v58((uint64_t)v100 + *(int *)(v102 + 20), &v101[*(int *)(v102 + 20)], v208);
            v114 = *(int *)(v102 + 24);
            v194 = v100;
            v115 = (_OWORD *)((char *)v100 + v114);
            v116 = &v101[v114];
            v117 = type metadata accessor for Signature(0);
            v183 = *(_QWORD *)(v117 - 8);
            v186 = v117;
            v67 = v210;
            __srca = (void *)v102;
            if ((*(unsigned int (**)(char *, uint64_t))(v183 + 48))(v116, 1))
            {
              v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v115, v116, *(_QWORD *)(*(_QWORD *)(v118 - 8) + 64));
              v59 = v208;
            }
            else
            {
              v148 = *((_OWORD *)v116 + 1);
              *v115 = *(_OWORD *)v116;
              v115[1] = v148;
              *((_QWORD *)v115 + 4) = *((_QWORD *)v116 + 4);
              *((_BYTE *)v115 + 40) = v116[40];
              v149 = *(int *)(v186 + 28);
              v150 = &v116[v149];
              v59 = v208;
              v58((uint64_t)v115 + v149, v150, v208);
              (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v183 + 56))(v115, 0, 1, v186);
            }
            v34 = (uint64_t)__dstb;
            (*(void (**)(_OWORD *, _QWORD, uint64_t, void *))(v191 + 56))(v194, 0, 1, __srca);
            v105 = v202;
          }
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v105 + 56))(v61, 0, 1, v63);
          v66 = (void (*)(char *, char *, uint64_t))v58;
        }
        v151 = *(int *)(v36 + 24);
        v152 = (char *)(v34 + v151);
        v153 = &v67[v151];
        v154 = type metadata accessor for LogConsistency(0);
        v155 = *(_QWORD *)(v154 - 8);
        if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v155 + 48))(v153, 1, v154))
        {
          v66(v152, v153, v59);
          *(_QWORD *)&v152[*(int *)(v154 + 20)] = *(_QWORD *)&v153[*(int *)(v154 + 20)];
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v155 + 56))(v152, 0, 1, v154);
          goto LABEL_58;
        }
        v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448) - 8) + 64);
        v48 = v152;
        v49 = v153;
LABEL_17:
        memcpy(v48, v49, v47);
LABEL_58:
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
        return a1;
      }
      goto LABEL_32;
    }
    if (v57)
    {
      sub_237FFD540(v34, type metadata accessor for ATLogProofs);
LABEL_32:
      v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2568C5450) - 8) + 64);
      v51 = (void *)v34;
      v52 = v54;
      goto LABEL_21;
    }
    ((void (*)(uint64_t, char *, uint64_t))v209)(v34, v54, v208);
    v82 = *(int *)(v36 + 20);
    v83 = v34 + v82;
    v84 = &v54[v82];
    v85 = type metadata accessor for LogEntry(0);
    v201 = *(_QWORD *)(v85 - 8);
    v86 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v201 + 48);
    v87 = v86(v83, 1, v85);
    v206 = v85;
    v88 = v86((uint64_t)v84, 1, v85);
    if (v87)
    {
      if (!v88)
      {
        *(_QWORD *)v83 = *(_QWORD *)v84;
        *(_BYTE *)(v83 + 8) = v84[8];
        *(_QWORD *)(v83 + 16) = *((_QWORD *)v84 + 2);
        *(_OWORD *)(v83 + 24) = *(_OWORD *)(v84 + 24);
        v89 = *((_QWORD *)v84 + 6);
        *(_QWORD *)(v83 + 40) = *((_QWORD *)v84 + 5);
        *(_QWORD *)(v83 + 48) = v89;
        *(_BYTE *)(v83 + 56) = v84[56];
        __dsta = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
        __dsta(v83 + *(int *)(v85 + 36), &v84[*(int *)(v85 + 36)], v208);
        v90 = *(int *)(v85 + 40);
        v91 = (_OWORD *)(v83 + v90);
        v92 = &v84[v90];
        v93 = type metadata accessor for SignedObject(0);
        v94 = *(_QWORD *)(v93 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48))(v92, 1, v93))
        {
          v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438);
          memcpy(v91, v92, *(_QWORD *)(*(_QWORD *)(v95 - 8) + 64));
          v96 = (void (*)(uint64_t, char *, uint64_t))v209;
          v97 = v201;
        }
        else
        {
          *v91 = *(_OWORD *)v92;
          __dsta((uint64_t)v91 + *(int *)(v93 + 20), &v92[*(int *)(v93 + 20)], v208);
          v192 = v93;
          v195 = v91;
          v143 = *(int *)(v93 + 24);
          v144 = (_OWORD *)((char *)v91 + v143);
          v145 = &v92[v143];
          v146 = type metadata accessor for Signature(0);
          v184 = *(_QWORD *)(v146 - 8);
          v187 = v146;
          v97 = v201;
          if ((*(unsigned int (**)(char *, uint64_t))(v184 + 48))(v145, 1))
          {
            v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
            memcpy(v144, v145, *(_QWORD *)(*(_QWORD *)(v147 - 8) + 64));
          }
          else
          {
            v156 = *((_OWORD *)v145 + 1);
            *v144 = *(_OWORD *)v145;
            v144[1] = v156;
            *((_QWORD *)v144 + 4) = *((_QWORD *)v145 + 4);
            *((_BYTE *)v144 + 40) = v145[40];
            __dsta((uint64_t)v144 + *(int *)(v187 + 28), &v145[*(int *)(v187 + 28)], v208);
            (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v184 + 56))(v144, 0, 1, v187);
          }
          (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v94 + 56))(v195, 0, 1, v192);
          v96 = (void (*)(uint64_t, char *, uint64_t))v209;
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v97 + 56))(v83, 0, 1, v206);
        goto LABEL_78;
      }
    }
    else
    {
      if (!v88)
      {
        *(_QWORD *)v83 = *(_QWORD *)v84;
        *(_BYTE *)(v83 + 8) = v84[8];
        *(_QWORD *)(v83 + 16) = *((_QWORD *)v84 + 2);
        swift_bridgeObjectRelease();
        v127 = *(_QWORD *)(v83 + 24);
        v128 = *(_QWORD *)(v83 + 32);
        *(_OWORD *)(v83 + 24) = *(_OWORD *)(v84 + 24);
        sub_237FFBAB0(v127, v128);
        v129 = *((_QWORD *)v84 + 6);
        *(_QWORD *)(v83 + 40) = *((_QWORD *)v84 + 5);
        *(_QWORD *)(v83 + 48) = v129;
        *(_BYTE *)(v83 + 56) = v84[56];
        ((void (*)(uint64_t, char *, uint64_t))v209)(v83 + *(int *)(v85 + 36), &v84[*(int *)(v85 + 36)], v208);
        v130 = *(int *)(v85 + 40);
        v131 = v83 + v130;
        v84 += v130;
        v132 = type metadata accessor for SignedObject(0);
        v207 = *(_QWORD *)(v132 - 8);
        v133 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v207 + 48);
        v134 = v131;
        LODWORD(v131) = v133(v131, 1, v132);
        v135 = v133((uint64_t)v84, 1, v132);
        if ((_DWORD)v131)
        {
          if (!v135)
          {
            v136 = v134;
            *(_OWORD *)v134 = *(_OWORD *)v84;
            __dstc = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
            __dstc(v134 + *(int *)(v132 + 20), &v84[*(int *)(v132 + 20)], v208);
            v137 = *(int *)(v132 + 24);
            v138 = (_OWORD *)(v134 + v137);
            v139 = &v84[v137];
            v140 = type metadata accessor for Signature(0);
            v141 = *(_QWORD *)(v140 - 8);
            v203 = v140;
            if ((*(unsigned int (**)(char *, uint64_t))(v141 + 48))(v139, 1))
            {
              v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430);
              memcpy(v138, v139, *(_QWORD *)(*(_QWORD *)(v142 - 8) + 64));
            }
            else
            {
              v175 = *((_OWORD *)v139 + 1);
              *v138 = *(_OWORD *)v139;
              v138[1] = v175;
              *((_QWORD *)v138 + 4) = *((_QWORD *)v139 + 4);
              *((_BYTE *)v138 + 40) = v139[40];
              __dstc((uint64_t)v138 + *(int *)(v203 + 28), &v139[*(int *)(v203 + 28)], v208);
              (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v141 + 56))(v138, 0, 1, v203);
            }
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v207 + 56))(v136, 0, 1, v132);
            goto LABEL_48;
          }
        }
        else
        {
          if (!v135)
          {
            v165 = *(_QWORD *)v134;
            v166 = *(_QWORD *)(v134 + 8);
            *(_OWORD *)v134 = *(_OWORD *)v84;
            sub_237FFBAB0(v165, v166);
            ((void (*)(uint64_t, char *, uint64_t))v209)(v134 + *(int *)(v132 + 20), &v84[*(int *)(v132 + 20)], v208);
            v167 = *(int *)(v132 + 24);
            v168 = v134 + v167;
            v169 = &v84[v167];
            v170 = type metadata accessor for Signature(0);
            v204 = *(_QWORD *)(v170 - 8);
            v171 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v204 + 48);
            v172 = v171(v168, 1, v170);
            v173 = v171((uint64_t)v169, 1, v170);
            if (v172)
            {
              if (!v173)
              {
                v174 = *((_OWORD *)v169 + 1);
                *(_OWORD *)v168 = *(_OWORD *)v169;
                *(_OWORD *)(v168 + 16) = v174;
                *(_QWORD *)(v168 + 32) = *((_QWORD *)v169 + 4);
                *(_BYTE *)(v168 + 40) = v169[40];
                (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v168 + *(int *)(v170 + 28), &v169[*(int *)(v170 + 28)], v208);
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v204 + 56))(v168, 0, 1, v170);
                goto LABEL_48;
              }
            }
            else
            {
              if (!v173)
              {
                v176 = *(_QWORD *)v168;
                v177 = *(_QWORD *)(v168 + 8);
                *(_OWORD *)v168 = *(_OWORD *)v169;
                sub_237FFBAB0(v176, v177);
                v178 = *(_QWORD *)(v168 + 16);
                v179 = *(_QWORD *)(v168 + 24);
                *(_OWORD *)(v168 + 16) = *((_OWORD *)v169 + 1);
                sub_237FFBAB0(v178, v179);
                *(_QWORD *)(v168 + 32) = *((_QWORD *)v169 + 4);
                *(_BYTE *)(v168 + 40) = v169[40];
                v180 = *(int *)(v170 + 28);
                v96 = (void (*)(uint64_t, char *, uint64_t))v209;
                ((void (*)(uint64_t, char *, uint64_t))v209)(v168 + v180, &v169[v180], v208);
                goto LABEL_78;
              }
              sub_237FFD540(v168, type metadata accessor for Signature);
            }
            v111 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5430) - 8) + 64);
            v112 = (void *)v168;
            v113 = v169;
LABEL_47:
            memcpy(v112, v113, v111);
LABEL_48:
            v96 = (void (*)(uint64_t, char *, uint64_t))v209;
LABEL_78:
            v157 = *(int *)(v36 + 24);
            v158 = v34 + v157;
            v159 = &v54[v157];
            v160 = type metadata accessor for LogConsistency(0);
            v161 = *(_QWORD *)(v160 - 8);
            v162 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v161 + 48);
            v163 = v162(v158, 1, v160);
            v164 = v162((uint64_t)v159, 1, v160);
            if (v163)
            {
              if (!v164)
              {
                (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v158, v159, v208);
                *(_QWORD *)(v158 + *(int *)(v160 + 20)) = *(_QWORD *)&v159[*(int *)(v160 + 20)];
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v161 + 56))(v158, 0, 1, v160);
                return a1;
              }
            }
            else
            {
              if (!v164)
              {
                v96(v158, v159, v208);
                *(_QWORD *)(v158 + *(int *)(v160 + 20)) = *(_QWORD *)&v159[*(int *)(v160 + 20)];
                swift_release();
                return a1;
              }
              sub_237FFD540(v158, type metadata accessor for LogConsistency);
            }
            v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5448) - 8) + 64);
            v51 = (void *)v158;
            v52 = v159;
            goto LABEL_21;
          }
          sub_237FFD540(v134, type metadata accessor for SignedObject);
        }
        v111 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5438) - 8) + 64);
        v112 = (void *)v134;
LABEL_46:
        v113 = v84;
        goto LABEL_47;
      }
      sub_237FFD540(v83, type metadata accessor for LogEntry);
    }
    v111 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C5440) - 8) + 64);
    v112 = (void *)v83;
    goto LABEL_46;
  }
  sub_237FFD540(v34, type metadata accessor for Proto_TransparencyProofs);
LABEL_20:
  v50 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010) - 8) + 64);
  v51 = (void *)v34;
  v52 = v35;
LABEL_21:
  memcpy(v51, v52, v50);
  return a1;
}

uint64_t sub_2380AFAA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380AFAB0(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2380BD5C8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[7];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[8];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
        {
          v10 = v13;
          v11 = a3[9];
        }
        else
        {
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a3[10];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_2380AFBA4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380AFBB0(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 32) = (a2 - 1);
  }
  else
  {
    v8 = sub_2380BD5C8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[7];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[8];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == a3)
        {
          v10 = v13;
          v11 = a4[9];
        }
        else
        {
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a4[10];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for Proto_AttestationBundle(uint64_t a1)
{
  return sub_238001B1C(a1, (uint64_t *)&unk_2568C9480);
}

void sub_2380AFCB4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_2380BD5C8();
  if (v0 <= 0x3F)
  {
    sub_237FFB4E8(319, &qword_2568C9490, (void (*)(uint64_t))type metadata accessor for Proto_SealedHashLedger);
    if (v1 <= 0x3F)
    {
      sub_237FFB4E8(319, &qword_2568C9498, (void (*)(uint64_t))MEMORY[0x24BE5B990]);
      if (v2 <= 0x3F)
      {
        sub_237FFB4E8(319, qword_2568C94A0, (void (*)(uint64_t))type metadata accessor for Proto_TransparencyProofs);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

unint64_t sub_2380AFDC0@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

_QWORD *sub_2380AFDD8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;
  char v3;

  v2 = *result >= 3uLL;
  *(_QWORD *)a2 = *result;
  v3 = !v2;
  *(_BYTE *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_2380AFDF4()
{
  sub_2380B8534();
  return sub_2380BD634();
}

void sub_2380AFE2C()
{
  qword_2568CA078 = (uint64_t)&unk_2509D9690;
}

uint64_t sub_2380AFE40@<X0>(_QWORD *a1@<X8>)
{
  return sub_238051B00(&qword_2568C50F0, &qword_2568CA078, a1);
}

uint64_t sub_2380AFE60@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = 2;
  v3 = result == 0;
  if (result == 2)
    v4 = 1;
  else
    v4 = result;
  if (result == 2)
    v3 = 1;
  if (result != 4)
    v2 = v4;
  *(_QWORD *)a2 = v2;
  if (result == 4)
    v3 = 1;
  *(_BYTE *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_2380AFEA0()
{
  uint64_t v0;

  return *(_QWORD *)v0 << *(_BYTE *)(v0 + 8);
}

uint64_t *sub_2380AFEB0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  char v7;

  v2 = *result;
  v3 = *result == 0;
  if (*result == 2)
    v4 = 1;
  else
    v4 = *result;
  if (v2 == 2)
    v3 = 1;
  v5 = v2 == 4;
  if (v2 == 4)
    v6 = 2;
  else
    v6 = v4;
  *(_QWORD *)a2 = v6;
  v7 = v5 || v3;
  *(_BYTE *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

void sub_2380AFEF4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)v1 << *(_BYTE *)(v1 + 8);
}

uint64_t sub_2380AFF08()
{
  sub_2380BA960();
  return sub_2380BD634();
}

BOOL sub_2380AFF40(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 << *(_BYTE *)(a1 + 8) == *(_QWORD *)a2 << *(_BYTE *)(a2 + 8);
}

void sub_2380AFF64()
{
  qword_2568CA080 = (uint64_t)&unk_2509D96E0;
}

uint64_t sub_2380AFF78@<X0>(_QWORD *a1@<X8>)
{
  return sub_238051B00(&qword_2568C50F8, &qword_2568CA080, a1);
}

uint64_t sub_2380AFF94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA088);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA088);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BEAD0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "HASH_ALG_UNKNOWN";
  *(_QWORD *)(v7 + 8) = 16;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "HASH_ALG_SHA256";
  *((_QWORD *)v11 + 1) = 15;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 2;
  *(_QWORD *)v12 = "HASH_ALG_SHA384";
  *(_QWORD *)(v12 + 8) = 15;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_2380B0120@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5100, (uint64_t)qword_2568CA088, a1);
}

uint64_t sub_2380B013C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA0A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA0A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BEAA0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "sep_attestation";
  *(_QWORD *)(v7 + 8) = 15;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "ap_ticket";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "sealed_hashes";
  *((_QWORD *)v13 + 1) = 13;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "provisioning_certificate_chain";
  *((_QWORD *)v15 + 1) = 30;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 6;
  *(_QWORD *)v17 = "key_expiration";
  *((_QWORD *)v17 + 1) = 14;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 8;
  *(_QWORD *)v19 = "transparency_proofs";
  *((_QWORD *)v19 + 1) = 19;
  v19[16] = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_2380B0374()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_2380BD658();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
          sub_2380BD6A0();
          break;
        case 3:
          sub_2380B0490();
          break;
        case 4:
          sub_2380BD694();
          break;
        case 6:
          sub_2380B0524();
          break;
        case 8:
          sub_2380B05B8();
          break;
        default:
          break;
      }
      result = sub_2380BD658();
    }
  }
  return result;
}

uint64_t sub_2380B0490()
{
  type metadata accessor for Proto_AttestationBundle(0);
  type metadata accessor for Proto_SealedHashLedger(0);
  sub_238001820(&qword_2568C9580, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7200);
  return sub_2380BD6D0();
}

uint64_t sub_2380B0524()
{
  type metadata accessor for Proto_AttestationBundle(0);
  sub_2380BD598();
  sub_238001820(&qword_2568C95E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  return sub_2380BD6D0();
}

uint64_t sub_2380B05B8()
{
  type metadata accessor for Proto_AttestationBundle(0);
  type metadata accessor for Proto_TransparencyProofs(0);
  sub_238001820(&qword_2568C66A8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C7400);
  return sub_2380BD6D0();
}

void sub_2380B064C()
{
  __asm { BR              X10 }
}

uint64_t sub_2380B0694(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  if ((a2 & 0xFF000000000000) == 0 || (result = sub_2380BD784(), !v3))
    __asm { BR              X10 }
  return result;
}

uint64_t sub_2380B081C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Proto_SealedHashLedger(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Proto_AttestationBundle(0);
  sub_2380051FC(a1 + *(int *)(v12 + 32), (uint64_t)v7, &qword_2568C6418);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_238005240((uint64_t)v7, &qword_2568C6418);
  sub_238001DE4((uint64_t)v7, (uint64_t)v11, type metadata accessor for Proto_SealedHashLedger);
  sub_238001820(&qword_2568C9580, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7200);
  sub_2380BD7B4();
  return sub_237FFD540((uint64_t)v11, type metadata accessor for Proto_SealedHashLedger);
}

uint64_t sub_2380B0990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2380BD598();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Proto_AttestationBundle(0);
  sub_2380051FC(a1 + *(int *)(v12 + 36), (uint64_t)v7, &qword_2568C5E00);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_238005240((uint64_t)v7, &qword_2568C5E00);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  sub_238001820(&qword_2568C95E0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  sub_2380BD7B4();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_2380B0B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Proto_TransparencyProofs(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Proto_AttestationBundle(0);
  sub_2380051FC(a1 + *(int *)(v12 + 40), (uint64_t)v7, &qword_2568C6010);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_238005240((uint64_t)v7, &qword_2568C6010);
  sub_238001DE4((uint64_t)v7, (uint64_t)v11, type metadata accessor for Proto_TransparencyProofs);
  sub_238001820(&qword_2568C66A8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C7400);
  sub_2380BD7B4();
  return sub_237FFD540((uint64_t)v11, type metadata accessor for Proto_TransparencyProofs);
}

uint64_t sub_2380B0C7C@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a2 = xmmword_2380BEAE0;
  *(_OWORD *)(a2 + 16) = xmmword_2380BEAE0;
  *(_QWORD *)(a2 + 32) = MEMORY[0x24BEE4AF8];
  sub_2380BD5BC();
  v4 = a2 + a1[8];
  v5 = type metadata accessor for Proto_SealedHashLedger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = a2 + a1[9];
  v7 = sub_2380BD598();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = a2 + a1[10];
  v9 = type metadata accessor for Proto_TransparencyProofs(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
}

unint64_t sub_2380B0D48()
{
  return 0xD000000000000017;
}

uint64_t sub_2380B0D64()
{
  return sub_2380B0374();
}

void sub_2380B0D78()
{
  sub_2380B064C();
}

uint64_t sub_2380B0D8C()
{
  sub_238001820(&qword_2568C95D8, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C7330);
  return sub_2380BD628();
}

uint64_t sub_2380B0DDC@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5108, (uint64_t)qword_2568CA0A0, a1);
}

uint64_t sub_2380B0DF8()
{
  sub_238001820(&qword_2568C63F8, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C7478);
  return sub_2380BD718();
}

uint64_t sub_2380B0E38()
{
  sub_238001820(&qword_2568C63F8, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C7478);
  return sub_2380BD724();
}

uint64_t sub_2380B0E88(uint64_t a1)
{
  return sub_2380B3C74(a1, qword_2568CA0B8, (uint64_t)"slots", 5, MEMORY[0x24BE5C318]);
}

uint64_t sub_2380B0EA8()
{
  sub_2380BD5A4();
  type metadata accessor for Proto_SealedHash(0);
  sub_238001820(&qword_2568C66D0, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7098);
  sub_238001820(&qword_2568C9568, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C6FD0);
  return sub_2380BD640();
}

uint64_t sub_2380B0F78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16)
    || (sub_2380BD5A4(),
        type metadata accessor for Proto_SealedHash(0),
        sub_238001820(&qword_2568C66D0, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7098),
        sub_238001820(&qword_2568C9568, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C6FD0),
        result = sub_2380BD73C(),
        !v1))
  {
    type metadata accessor for Proto_SealedHashLedger(0);
    return sub_2380BD5B0();
  }
  return result;
}

uint64_t sub_2380B109C@<X0>(unint64_t *a1@<X8>)
{
  *a1 = sub_23800C00C(MEMORY[0x24BEE4AF8]);
  return sub_2380BD5BC();
}

unint64_t sub_2380B10D8()
{
  return 0xD000000000000016;
}

uint64_t sub_2380B10F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2380B3D7C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2380B0EA8);
}

uint64_t sub_2380B1110()
{
  return sub_2380B0F78();
}

uint64_t sub_2380B1124()
{
  sub_238001820(&qword_2568C95F0, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C71C8);
  return sub_2380BD628();
}

uint64_t sub_2380B1174@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5110, (uint64_t)qword_2568CA0B8, a1);
}

uint64_t sub_2380B1190()
{
  sub_238001820(&qword_2568C9580, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7200);
  return sub_2380BD718();
}

uint64_t sub_2380B11D0()
{
  sub_238001820(&qword_2568C9580, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7200);
  return sub_2380BD724();
}

uint64_t sub_2380B1224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA0D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA0D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BEAF0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "hash_alg";
  *(_QWORD *)(v7 + 8) = 8;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "entries";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_2380B137C()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_2380BD658();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        type metadata accessor for Proto_SealedHash.Entry(0);
        sub_238001820(&qword_2568C66D8, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6F30);
        sub_2380BD6C4();
      }
      else if (result == 1)
      {
        sub_2380B8534();
        sub_2380BD688();
      }
      result = sub_2380BD658();
    }
  }
  return result;
}

uint64_t sub_2380B1498()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*v0 || (sub_2380B8534(), result = sub_2380BD76C(), !v1))
  {
    if (!*(_QWORD *)(v0[2] + 16)
      || (type metadata accessor for Proto_SealedHash.Entry(0),
          sub_238001820(&qword_2568C66D8, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6F30),
          result = sub_2380BD7A8(),
          !v1))
    {
      type metadata accessor for Proto_SealedHash(0);
      return sub_2380BD5B0();
    }
  }
  return result;
}

uint64_t sub_2380B15B8@<X0>(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEE4AF8];
  return sub_2380BD5BC();
}

unint64_t sub_2380B15EC()
{
  return 0xD000000000000010;
}

uint64_t sub_2380B1608()
{
  return sub_2380B137C();
}

uint64_t sub_2380B161C()
{
  return sub_2380B1498();
}

uint64_t sub_2380B1630()
{
  sub_238001820(&qword_2568C9610, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7060);
  return sub_2380BD628();
}

uint64_t sub_2380B1680@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5118, (uint64_t)qword_2568CA0D0, a1);
}

uint64_t sub_2380B169C()
{
  sub_238001820(&qword_2568C66D0, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7098);
  return sub_2380BD718();
}

uint64_t sub_2380B16DC()
{
  sub_238001820(&qword_2568C66D0, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7098);
  return sub_2380BD724();
}

uint64_t sub_2380B1730()
{
  uint64_t result;

  result = sub_2380BDD90();
  qword_2568CA0E8 = 0xD000000000000010;
  unk_2568CA0F0 = 0x80000002380C9950;
  return result;
}

uint64_t sub_2380B1794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA0F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA0F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BEB00;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "flags";
  *(_QWORD *)(v7 + 8) = 5;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "digest";
  *(_QWORD *)(v11 + 8) = 6;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "cryptex";
  *((_QWORD *)v13 + 1) = 7;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "cryptex_salt";
  *((_QWORD *)v15 + 1) = 12;
  v15[16] = 2;
  v10();
  v16 = v6 + 4 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 4 * v3) = 5;
  *(_QWORD *)v16 = "secure_config";
  *(_QWORD *)(v16 + 8) = 13;
  *(_BYTE *)(v16 + 16) = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_2380B19A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v10;

  v5 = v3;
  result = sub_2380BD658();
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_2380BD6AC();
          break;
        case 2:
          sub_2380BD6A0();
          break;
        case 3:
          sub_2380B1AAC(v5, a1, a2, a3);
          break;
        case 4:
          sub_2380B1EC8(v5, a1, a2, a3);
          break;
        case 5:
          sub_2380B22E8(v5, a1, a2, a3);
          break;
        default:
          break;
      }
      result = sub_2380BD658();
    }
  }
  return result;
}

uint64_t sub_2380B1AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
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

  v39 = a2;
  v40 = a3;
  v41 = a4;
  v42 = a1;
  v4 = type metadata accessor for Proto_Cryptex(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v35 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9628);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v36 = (uint64_t)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v32 - v23;
  v37 = v5;
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v25((char *)&v32 - v23, 1, 1, v4);
  v33 = v42 + *(int *)(type metadata accessor for Proto_SealedHash.Entry(0) + 24);
  sub_2380051FC(v33, (uint64_t)v12, &qword_2568C56E8);
  v34 = v14;
  LODWORD(v42) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if ((_DWORD)v42 == 1)
  {
    sub_238005240((uint64_t)v12, &qword_2568C56E8);
    v26 = v13;
  }
  else
  {
    sub_238001DE4((uint64_t)v12, (uint64_t)v19, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    sub_238001DE4((uint64_t)v19, (uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    v26 = v13;
    if (swift_getEnumCaseMultiPayload())
    {
      sub_237FFD540((uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    }
    else
    {
      sub_238005240((uint64_t)v24, &qword_2568C9628);
      sub_238001DE4((uint64_t)v17, (uint64_t)v9, type metadata accessor for Proto_Cryptex);
      sub_238001DE4((uint64_t)v9, (uint64_t)v24, type metadata accessor for Proto_Cryptex);
      v25(v24, 0, 1, v4);
    }
  }
  v27 = v38;
  sub_238001820(&qword_2568C66E0, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6DA0);
  sub_2380BD6D0();
  if (v27)
    return sub_238005240((uint64_t)v24, &qword_2568C9628);
  v29 = v36;
  sub_2380051FC((uint64_t)v24, v36, &qword_2568C9628);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v29, 1, v4) == 1)
  {
    sub_238005240((uint64_t)v24, &qword_2568C9628);
    return sub_238005240(v29, &qword_2568C9628);
  }
  else
  {
    v30 = v35;
    sub_238001DE4(v29, v35, type metadata accessor for Proto_Cryptex);
    if ((_DWORD)v42 != 1)
      sub_2380BD664();
    sub_238005240((uint64_t)v24, &qword_2568C9628);
    v31 = v33;
    sub_238005240(v33, &qword_2568C56E8);
    sub_238001DE4(v30, v31, type metadata accessor for Proto_Cryptex);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v26);
  }
}

uint64_t sub_2380B1EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
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

  v39 = a2;
  v40 = a3;
  v41 = a4;
  v42 = a1;
  v4 = type metadata accessor for Proto_Cryptex.Salt(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v35 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9630);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v36 = (uint64_t)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v32 - v23;
  v37 = v5;
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v25((char *)&v32 - v23, 1, 1, v4);
  v33 = v42 + *(int *)(type metadata accessor for Proto_SealedHash.Entry(0) + 24);
  sub_2380051FC(v33, (uint64_t)v12, &qword_2568C56E8);
  v34 = v14;
  LODWORD(v42) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if ((_DWORD)v42 == 1)
  {
    sub_238005240((uint64_t)v12, &qword_2568C56E8);
    v26 = v13;
  }
  else
  {
    sub_238001DE4((uint64_t)v12, (uint64_t)v19, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    sub_238001DE4((uint64_t)v19, (uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    v26 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_238005240((uint64_t)v24, &qword_2568C9630);
      sub_238001DE4((uint64_t)v17, (uint64_t)v9, type metadata accessor for Proto_Cryptex.Salt);
      sub_238001DE4((uint64_t)v9, (uint64_t)v24, type metadata accessor for Proto_Cryptex.Salt);
      v25(v24, 0, 1, v4);
    }
    else
    {
      sub_237FFD540((uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    }
  }
  v27 = v38;
  sub_238001820(&qword_2568C9518, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6C38);
  sub_2380BD6D0();
  if (v27)
    return sub_238005240((uint64_t)v24, &qword_2568C9630);
  v29 = v36;
  sub_2380051FC((uint64_t)v24, v36, &qword_2568C9630);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v29, 1, v4) == 1)
  {
    sub_238005240((uint64_t)v24, &qword_2568C9630);
    return sub_238005240(v29, &qword_2568C9630);
  }
  else
  {
    v30 = v35;
    sub_238001DE4(v29, v35, type metadata accessor for Proto_Cryptex.Salt);
    if ((_DWORD)v42 != 1)
      sub_2380BD664();
    sub_238005240((uint64_t)v24, &qword_2568C9630);
    v31 = v33;
    sub_238005240(v33, &qword_2568C56E8);
    sub_238001DE4(v30, v31, type metadata accessor for Proto_Cryptex.Salt);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v26);
  }
}

uint64_t sub_2380B22E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
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

  v39 = a2;
  v40 = a3;
  v41 = a4;
  v42 = a1;
  v4 = type metadata accessor for Proto_SecureConfig(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v35 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9638);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v36 = (uint64_t)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v32 - v23;
  v37 = v5;
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v25((char *)&v32 - v23, 1, 1, v4);
  v33 = v42 + *(int *)(type metadata accessor for Proto_SealedHash.Entry(0) + 24);
  sub_2380051FC(v33, (uint64_t)v12, &qword_2568C56E8);
  v34 = v14;
  LODWORD(v42) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if ((_DWORD)v42 == 1)
  {
    sub_238005240((uint64_t)v12, &qword_2568C56E8);
    v26 = v13;
  }
  else
  {
    sub_238001DE4((uint64_t)v12, (uint64_t)v19, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    sub_238001DE4((uint64_t)v19, (uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    v26 = v13;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_238005240((uint64_t)v24, &qword_2568C9638);
      sub_238001DE4((uint64_t)v17, (uint64_t)v9, type metadata accessor for Proto_SecureConfig);
      sub_238001DE4((uint64_t)v9, (uint64_t)v24, type metadata accessor for Proto_SecureConfig);
      v25(v24, 0, 1, v4);
    }
    else
    {
      sub_237FFD540((uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    }
  }
  v27 = v38;
  sub_238001820(&qword_2568C66E8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6AD0);
  sub_2380BD6D0();
  if (v27)
    return sub_238005240((uint64_t)v24, &qword_2568C9638);
  v29 = v36;
  sub_2380051FC((uint64_t)v24, v36, &qword_2568C9638);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v29, 1, v4) == 1)
  {
    sub_238005240((uint64_t)v24, &qword_2568C9638);
    return sub_238005240(v29, &qword_2568C9638);
  }
  else
  {
    v30 = v35;
    sub_238001DE4(v29, v35, type metadata accessor for Proto_SecureConfig);
    if ((_DWORD)v42 != 1)
      sub_2380BD664();
    sub_238005240((uint64_t)v24, &qword_2568C9638);
    v31 = v33;
    sub_238005240(v33, &qword_2568C56E8);
    sub_238001DE4(v30, v31, type metadata accessor for Proto_SecureConfig);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v26);
  }
}

uint64_t sub_2380B2708()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v2);
  if (!*v0 || (result = sub_2380BD790(), !v1))
    __asm { BR              X10 }
  return result;
}

uint64_t sub_2380B2918(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Proto_Cryptex(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Proto_SealedHash.Entry(0);
  sub_2380051FC(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_2568C56E8);
  v9 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v4, 1, v9) == 1)
  {
    sub_238005240((uint64_t)v4, &qword_2568C56E8);
    __break(1u);
  }
  else if (!swift_getEnumCaseMultiPayload())
  {
    sub_238001DE4((uint64_t)v4, (uint64_t)v7, type metadata accessor for Proto_Cryptex);
    sub_238001820(&qword_2568C66E0, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6DA0);
    sub_2380BD7B4();
    return sub_237FFD540((uint64_t)v7, type metadata accessor for Proto_Cryptex);
  }
  result = sub_237FFD540((uint64_t)v4, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  __break(1u);
  return result;
}

uint64_t sub_2380B2AC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Proto_Cryptex.Salt(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Proto_SealedHash.Entry(0);
  sub_2380051FC(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_2568C56E8);
  v9 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v4, 1, v9) == 1)
  {
    sub_238005240((uint64_t)v4, &qword_2568C56E8);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_238001DE4((uint64_t)v4, (uint64_t)v7, type metadata accessor for Proto_Cryptex.Salt);
    sub_238001820(&qword_2568C9518, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6C38);
    sub_2380BD7B4();
    return sub_237FFD540((uint64_t)v7, type metadata accessor for Proto_Cryptex.Salt);
  }
  result = sub_237FFD540((uint64_t)v4, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  __break(1u);
  return result;
}

uint64_t sub_2380B2C6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Proto_SecureConfig(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Proto_SealedHash.Entry(0);
  sub_2380051FC(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_2568C56E8);
  v9 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v4, 1, v9) == 1)
  {
    sub_238005240((uint64_t)v4, &qword_2568C56E8);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 2)
  {
    sub_238001DE4((uint64_t)v4, (uint64_t)v7, type metadata accessor for Proto_SecureConfig);
    sub_238001820(&qword_2568C66E8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6AD0);
    sub_2380BD7B4();
    return sub_237FFD540((uint64_t)v7, type metadata accessor for Proto_SecureConfig);
  }
  result = sub_237FFD540((uint64_t)v4, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  __break(1u);
  return result;
}

uint64_t sub_2380B2E18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)a2 = 0;
  *(_OWORD *)(a2 + 8) = xmmword_2380BEAE0;
  v2 = a2 + *(int *)(a1 + 24);
  v3 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  return sub_2380BD5BC();
}

uint64_t sub_2380B2E88(uint64_t a1, uint64_t a2)
{
  return sub_2380B34D4(a1, a2, &qword_2568C5120, &qword_2568CA0E8);
}

uint64_t sub_2380B2EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2380B19A4(a1, a2, a3);
}

uint64_t sub_2380B2EBC()
{
  return sub_2380B2708();
}

uint64_t sub_2380B2ED0()
{
  sub_238001820(&qword_2568C9620, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6EF8);
  return sub_2380BD628();
}

uint64_t sub_2380B2F20@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5128, (uint64_t)qword_2568CA0F8, a1);
}

uint64_t sub_2380B2F3C()
{
  sub_238001820(&qword_2568C66D8, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6F30);
  return sub_2380BD718();
}

uint64_t sub_2380B2F7C()
{
  sub_238001820(&qword_2568C66D8, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6F30);
  return sub_2380BD724();
}

uint64_t sub_2380B2FD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  uint64_t v12;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA110);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA110);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BEAD0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "FLAG_NONE";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "FLAG_RATCHET";
  *((_QWORD *)v11 + 1) = 12;
  v11[16] = 2;
  v10();
  v12 = (uint64_t)v6 + 2 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + 2 * v3) = 4;
  *(_QWORD *)v12 = "FLAG_RATCHET_LOCK";
  *(_QWORD *)(v12 + 8) = 17;
  *(_BYTE *)(v12 + 16) = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_2380B3160@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5130, (uint64_t)qword_2568CA110, a1);
}

uint64_t sub_2380B317C(uint64_t a1)
{
  return sub_2380B3C74(a1, qword_2568CA128, (uint64_t)"image4_manifest", 15, MEMORY[0x24BE5C328]);
}

void sub_2380B319C()
{
  __asm { BR              X10 }
}

uint64_t sub_2380B31E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((a2 & 0xFF000000000000) == 0 || (result = sub_2380BD784(), !v2))
  {
    type metadata accessor for Proto_Cryptex(0);
    return sub_2380BD5B0();
  }
  return result;
}

uint64_t sub_2380B3270()
{
  return 0x72432E6F746F7270;
}

void sub_2380B3294()
{
  sub_2380B319C();
}

uint64_t sub_2380B32A8()
{
  sub_238001820(&qword_2568C9640, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6D68);
  return sub_2380BD628();
}

uint64_t sub_2380B32F8@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5138, (uint64_t)qword_2568CA128, a1);
}

uint64_t sub_2380B3314()
{
  sub_238001820(&qword_2568C66E0, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6DA0);
  return sub_2380BD718();
}

uint64_t sub_2380B3354()
{
  sub_238001820(&qword_2568C66E0, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6DA0);
  return sub_2380BD724();
}

uint64_t sub_2380B33A8()
{
  uint64_t result;
  _QWORD v1[2];

  strcpy((char *)v1, "proto.Cryptex");
  HIWORD(v1[1]) = -4864;
  result = sub_2380BDD90();
  qword_2568CA140 = v1[0];
  *(_QWORD *)algn_2568CA148 = v1[1];
  return result;
}

uint64_t sub_2380B3414()
{
  uint64_t v0;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA150);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA150);
  return sub_2380BD7D8();
}

uint64_t sub_2380B345C()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  do
    result = sub_2380BD658();
  while (!v0 && (v2 & 1) == 0);
  return result;
}

uint64_t sub_2380B349C()
{
  return sub_2380BD5B0();
}

uint64_t sub_2380B34B4(uint64_t a1, uint64_t a2)
{
  return sub_2380B34D4(a1, a2, &qword_2568C5140, &qword_2568CA140);
}

uint64_t sub_2380B34D4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_2380B3528()
{
  return sub_2380B345C();
}

uint64_t sub_2380B353C()
{
  return sub_2380B349C();
}

uint64_t sub_2380B3550()
{
  sub_238001820(&qword_2568C9648, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6C00);
  return sub_2380BD628();
}

uint64_t sub_2380B35A0@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5148, (uint64_t)qword_2568CA150, a1);
}

uint64_t sub_2380B35BC()
{
  sub_238001820(&qword_2568C9518, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6C38);
  return sub_2380BD718();
}

uint64_t sub_2380B35FC()
{
  sub_238001820(&qword_2568C9518, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6C38);
  return sub_2380BD724();
}

uint64_t sub_2380B364C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v4 = sub_2380BD5C8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v15 - v10, a1, v4);
  v12(v9, a2, v4);
  sub_238001820(&qword_2568C56B0, v5, MEMORY[0x24BE5BF20]);
  LOBYTE(a2) = sub_2380BDCE8();
  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v4);
  v13(v11, v4);
  return a2 & 1;
}

uint64_t sub_2380B3758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v0, qword_2568CA168);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2380BEAF0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "entry";
  *(_QWORD *)(v7 + 8) = 5;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_2380BD7C0();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "metadata";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  return sub_2380BD7CC();
}

uint64_t sub_2380B38A8()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_2380BD658();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_2380BD5A4();
        sub_2380BD64C();
      }
      else if (result == 1)
      {
        sub_2380BD6A0();
      }
      result = sub_2380BD658();
    }
  }
  return result;
}

void sub_2380B399C()
{
  __asm { BR              X10 }
}

uint64_t sub_2380B39E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if ((a2 & 0xFF000000000000) == 0 || (result = sub_2380BD784(), !v2))
  {
    if (!*(_QWORD *)(*(_QWORD *)(v3 + 16) + 16) || (sub_2380BD5A4(), result = sub_2380BD748(), !v2))
    {
      type metadata accessor for Proto_SecureConfig(0);
      return sub_2380BD5B0();
    }
  }
  return result;
}

uint64_t sub_2380B3AC8@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_2380BEAE0;
  *(_QWORD *)(a1 + 16) = sub_23800C650(MEMORY[0x24BEE4AF8]);
  return sub_2380BD5BC();
}

unint64_t sub_2380B3B10()
{
  return 0xD000000000000012;
}

uint64_t sub_2380B3B2C()
{
  return sub_2380B38A8();
}

void sub_2380B3B40()
{
  sub_2380B399C();
}

uint64_t sub_2380B3B54()
{
  sub_238001820(&qword_2568C9650, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6A98);
  return sub_2380BD628();
}

uint64_t sub_2380B3BA4@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5150, (uint64_t)qword_2568CA168, a1);
}

uint64_t sub_2380B3BC0()
{
  sub_238001820(&qword_2568C66E8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6AD0);
  return sub_2380BD718();
}

uint64_t sub_2380B3C00()
{
  sub_238001820(&qword_2568C66E8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6AD0);
  return sub_2380BD724();
}

uint64_t sub_2380B3C54(uint64_t a1)
{
  return sub_2380B3C74(a1, qword_2568CA180, (uint64_t)"proofs", 6, MEMORY[0x24BE5C318]);
}

uint64_t sub_2380B3C74(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_2380BD7E4();
  __swift_allocate_value_buffer(v9, a2);
  __swift_project_value_buffer(v9, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5690);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5698);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v11 + 32) & ~v11;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2380BEAC0;
  v14 = v13 + v12 + *(int *)(v10 + 48);
  *(_QWORD *)(v13 + v12) = 1;
  *(_QWORD *)v14 = a3;
  *(_QWORD *)(v14 + 8) = a4;
  *(_BYTE *)(v14 + 16) = 2;
  v15 = *a5;
  v16 = sub_2380BD7C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  return sub_2380BD7CC();
}

uint64_t sub_2380B3D7C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t result;
  char v12;

  v7 = v4;
  while (1)
  {
    result = sub_2380BD658();
    if (v5 || (v12 & 1) != 0)
      break;
    if (result == 1)
      a4(a1, v7, a2, a3);
  }
  return result;
}

uint64_t sub_2380B3DF8()
{
  type metadata accessor for Proto_TransparencyProofs(0);
  type metadata accessor for ATLogProofs(0);
  sub_238001820((unint64_t *)&qword_2568C55B8, type metadata accessor for ATLogProofs, (uint64_t)&unk_2380BF3A8);
  return sub_2380BD6D0();
}

uint64_t sub_2380B3E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_2380B3EE0(v3, a1, a2, a3);
  if (!v4)
    return sub_2380BD5B0();
  return result;
}

uint64_t sub_2380B3EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ATLogProofs(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Proto_TransparencyProofs(0);
  sub_2380051FC(a1 + *(int *)(v12 + 20), (uint64_t)v7, qword_2568C5450);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_238005240((uint64_t)v7, qword_2568C5450);
  sub_238001DE4((uint64_t)v7, (uint64_t)v11, type metadata accessor for ATLogProofs);
  sub_238001820((unint64_t *)&qword_2568C55B8, type metadata accessor for ATLogProofs, (uint64_t)&unk_2380BF3A8);
  sub_2380BD7B4();
  return sub_237FFD540((uint64_t)v11, type metadata accessor for ATLogProofs);
}

uint64_t sub_2380B4054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  sub_2380BD5BC();
  v4 = a2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for ATLogProofs(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_2380B40A0()
{
  return 0xD000000000000018;
}

uint64_t sub_2380B40BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2380B3D7C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2380B3DF8);
}

uint64_t sub_2380B40D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2380B3E8C(a1, a2, a3);
}

uint64_t sub_2380B40EC()
{
  sub_238001820(&qword_2568C95E8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C69A8);
  return sub_2380BD628();
}

uint64_t sub_2380B413C@<X0>(uint64_t a1@<X8>)
{
  return sub_237FF9298(&qword_2568C5158, (uint64_t)qword_2568CA180, a1);
}

uint64_t sub_2380B4158()
{
  sub_238001820(&qword_2568C66A8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C7400);
  return sub_2380BD718();
}

uint64_t sub_2380B4198()
{
  sub_238001820(&qword_2568C66A8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C7400);
  return sub_2380BD724();
}

uint64_t sub_2380B41EC()
{
  return sub_238001820(&qword_2568C94E8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C68F0);
}

uint64_t sub_2380B4218()
{
  return sub_238001820(&qword_2568C66A8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C7400);
}

uint64_t sub_2380B4244()
{
  return sub_238001820(&qword_2568C94F0, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C6918);
}

uint64_t sub_2380B4270()
{
  return sub_238001820(&qword_2568C94F8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C69E0);
}

uint64_t type metadata accessor for Proto_SecureConfig(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C9938);
}

uint64_t sub_2380B42B0()
{
  return sub_238001820(&qword_2568C66E8, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6AD0);
}

uint64_t sub_2380B42DC()
{
  return sub_238001820(&qword_2568C9500, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6A08);
}

uint64_t sub_2380B4308()
{
  return sub_238001820(&qword_2568C9508, type metadata accessor for Proto_SecureConfig, (uint64_t)&unk_2380C6A48);
}

uint64_t sub_2380B4334()
{
  return sub_238001820(&qword_2568C9510, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6B48);
}

uint64_t type metadata accessor for Proto_Cryptex.Salt(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C98A8);
}

uint64_t sub_2380B4374()
{
  return sub_238001820(&qword_2568C9518, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6C38);
}

uint64_t sub_2380B43A0()
{
  return sub_238001820(&qword_2568C9520, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6B70);
}

uint64_t sub_2380B43CC()
{
  return sub_238001820(&qword_2568C9528, type metadata accessor for Proto_Cryptex.Salt, (uint64_t)&unk_2380C6BB0);
}

uint64_t sub_2380B43F8()
{
  return sub_238001820(&qword_2568C9530, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6CB0);
}

uint64_t type metadata accessor for Proto_Cryptex(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C9818);
}

uint64_t sub_2380B4438()
{
  return sub_238001820(&qword_2568C66E0, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6DA0);
}

uint64_t sub_2380B4464()
{
  return sub_238001820(&qword_2568C9538, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6CD8);
}

uint64_t sub_2380B4490()
{
  return sub_238001820(&qword_2568C9540, type metadata accessor for Proto_Cryptex, (uint64_t)&unk_2380C6D18);
}

uint64_t sub_2380B44BC()
{
  return sub_238001820(&qword_2568C9548, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6E40);
}

uint64_t type metadata accessor for Proto_SealedHash.Entry(uint64_t a1)
{
  return sub_238001B1C(a1, (uint64_t *)&unk_2568C9778);
}

uint64_t sub_2380B44FC()
{
  return sub_238001820(&qword_2568C66D8, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6F30);
}

uint64_t sub_2380B4528()
{
  return sub_238001820(&qword_2568C9550, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6E68);
}

uint64_t sub_2380B4554()
{
  return sub_238001820(&qword_2568C9558, type metadata accessor for Proto_SealedHash.Entry, (uint64_t)&unk_2380C6EA8);
}

uint64_t sub_2380B4580()
{
  return sub_238001820(&qword_2568C9560, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C6FA8);
}

uint64_t type metadata accessor for Proto_SealedHash(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C99D0);
}

uint64_t sub_2380B45C0()
{
  return sub_238001820(&qword_2568C66D0, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7098);
}

uint64_t sub_2380B45EC()
{
  return sub_238001820(&qword_2568C9568, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C6FD0);
}

uint64_t sub_2380B4618()
{
  return sub_238001820(&qword_2568C9570, type metadata accessor for Proto_SealedHash, (uint64_t)&unk_2380C7010);
}

uint64_t sub_2380B4644()
{
  return sub_238001820(&qword_2568C9578, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7110);
}

uint64_t sub_2380B4670()
{
  return sub_238001820(&qword_2568C9580, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7200);
}

uint64_t sub_2380B469C()
{
  return sub_238001820(&qword_2568C9588, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7138);
}

uint64_t sub_2380B46C8()
{
  return sub_238001820(&qword_2568C9590, type metadata accessor for Proto_SealedHashLedger, (uint64_t)&unk_2380C7178);
}

uint64_t sub_2380B46F4()
{
  return sub_238001820(&qword_2568C9598, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C7278);
}

uint64_t sub_2380B4720()
{
  return sub_238001820(&qword_2568C63F8, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C7478);
}

uint64_t sub_2380B474C()
{
  return sub_238001820(&qword_2568C95A0, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C72A0);
}

uint64_t sub_2380B4778()
{
  return sub_23805E804(&qword_2568C95A8, &qword_2568C95B0);
}

uint64_t sub_2380B479C()
{
  return sub_23805E804(&qword_2568C95B8, &qword_2568C95C0);
}

uint64_t sub_2380B47C0()
{
  return sub_238001820(&qword_2568C95C8, type metadata accessor for Proto_TransparencyProofs, (uint64_t)&unk_2380C6958);
}

uint64_t sub_2380B47EC()
{
  return sub_238001820(&qword_2568C95D0, type metadata accessor for Proto_AttestationBundle, (uint64_t)&unk_2380C72E0);
}

uint64_t sub_2380B4818(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  char v26;
  int64_t v27;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_23;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v11 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
          break;
      }
    }
LABEL_22:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_23:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_23800DCFC(v16, v17);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v24 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_2380BE1B0();
      result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 3;
  if (v13 >= v27)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_2380B4A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t *v44;
  char v45;
  uint64_t result;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v54;
  int64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _DWORD *v76;
  int64_t v77;
  _BYTE v78[24];
  int64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  _BYTE *v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t v102;
  _BYTE *v103;
  _BYTE *v104;
  uint64_t *v105;
  _BYTE *v106;
  _BYTE *v107;
  _BYTE *v108;
  _BYTE *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t *v114;
  uint64_t v115;
  _DWORD *v116;
  uint64_t v117;
  _BYTE *v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v3 = type metadata accessor for Proto_SecureConfig(0);
  MEMORY[0x24BDAC7A8](v3);
  v104 = &v78[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for Proto_Cryptex.Salt(0);
  MEMORY[0x24BDAC7A8](v5);
  v90 = &v78[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v89 = type metadata accessor for Proto_Cryptex(0);
  MEMORY[0x24BDAC7A8](v89);
  v101 = &v78[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C95F8);
  MEMORY[0x24BDAC7A8](v102);
  v9 = &v78[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v111 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = &v78[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x24BDAC7A8](v11);
  v91 = &v78[-v15];
  v16 = MEMORY[0x24BDAC7A8](v14);
  v97 = &v78[-v17];
  MEMORY[0x24BDAC7A8](v16);
  v109 = &v78[-v18];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  MEMORY[0x24BDAC7A8](v19);
  v21 = &v78[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56F0);
  MEMORY[0x24BDAC7A8](v110);
  v23 = &v78[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v115 = type metadata accessor for Proto_SealedHash.Entry(0);
  v94 = *(_QWORD *)(v115 - 8);
  v24 = MEMORY[0x24BDAC7A8](v115);
  v118 = &v78[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v24);
  v27 = &v78[-v26];
  v99 = type metadata accessor for Proto_SealedHash(0);
  v112 = *(_QWORD *)(v99 - 8);
  v28 = MEMORY[0x24BDAC7A8](v99);
  v114 = (uint64_t *)&v78[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v28);
  v31 = &v78[-v30];
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9600);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v35 = &v78[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v33);
  v105 = (uint64_t *)&v78[-v37];
  if (v36 == a2)
    return 1;
  if (*(_QWORD *)(v36 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v108 = v9;
  v85 = a2;
  v80 = v3;
  v38 = v13;
  v39 = 0;
  v82 = 0;
  v40 = *(_QWORD *)(v36 + 64);
  v81 = v36 + 64;
  v41 = 1 << *(_BYTE *)(v36 + 32);
  v42 = -1;
  if (v41 < 64)
    v42 = ~(-1 << v41);
  v43 = v42 & v40;
  v83 = (unint64_t)(v41 + 63) >> 6;
  v79 = v83 - 1;
  v84 = v36;
  v103 = v31;
  v92 = v38;
  v100 = v10;
  v113 = v35;
  while (1)
  {
    if (v43)
    {
      v88 = (v43 - 1) & v43;
      v47 = __clz(__rbit64(v43)) | (v39 << 6);
LABEL_9:
      v48 = *(_QWORD *)(v36 + 56);
      v49 = (_QWORD *)(*(_QWORD *)(v36 + 48) + 16 * v47);
      v50 = v49[1];
      *v35 = *v49;
      v35[1] = v50;
      v51 = v48 + *(_QWORD *)(v112 + 72) * v47;
      v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9608);
      sub_238013570(v51, (uint64_t)v113 + *(int *)(v52 + 48), type metadata accessor for Proto_SealedHash);
      v53 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56);
      v54 = v52;
      v35 = v113;
      v53(v113, 0, 1, v54);
      swift_bridgeObjectRetain();
      goto LABEL_19;
    }
    v55 = v39 + 1;
    if (__OFADD__(v39, 1))
    {
      __break(1u);
      JUMPOUT(0x2380B66A4);
    }
    if (v55 < v83)
    {
      v56 = *(_QWORD *)(v81 + 8 * v55);
      if (v56)
        goto LABEL_13;
      v39 += 2;
      if (v55 + 1 >= v83)
      {
        v39 = v55;
      }
      else
      {
        v56 = *(_QWORD *)(v81 + 8 * v39);
        if (v56)
          goto LABEL_16;
        v77 = v55 + 2;
        if (v55 + 2 < v83)
        {
          v56 = *(_QWORD *)(v81 + 8 * v77);
          if (v56)
            goto LABEL_39;
          v39 = v55 + 3;
          if (v55 + 3 >= v83)
          {
            v39 = v55 + 2;
          }
          else
          {
            v56 = *(_QWORD *)(v81 + 8 * v39);
            if (v56)
            {
LABEL_16:
              v55 = v39;
              goto LABEL_13;
            }
            v77 = v55 + 4;
            if (v55 + 4 < v83)
            {
              v56 = *(_QWORD *)(v81 + 8 * v77);
              if (!v56)
              {
                while (1)
                {
                  v55 = v77 + 1;
                  if (__OFADD__(v77, 1))
                  {
                    __break(1u);
                    JUMPOUT(0x2380B6738);
                  }
                  if (v55 >= v83)
                    break;
                  v56 = *(_QWORD *)(v81 + 8 * v55);
                  ++v77;
                  if (v56)
                    goto LABEL_13;
                }
                v39 = v79;
                goto LABEL_18;
              }
LABEL_39:
              v55 = v77;
LABEL_13:
              v88 = (v56 - 1) & v56;
              v47 = __clz(__rbit64(v56)) + (v55 << 6);
              v39 = v55;
              goto LABEL_9;
            }
          }
        }
      }
    }
LABEL_18:
    v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9608);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v35, 1, 1, v57);
    v88 = 0;
LABEL_19:
    v58 = v105;
    sub_2380B84EC((uint64_t)v35, (uint64_t)v105);
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9608);
    v60 = (*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 48))(v58, 1, v59) == 1;
    result = v60;
    if (v60)
      return result;
    v86 = v60;
    v87 = v39;
    v61 = (uint64_t)v58 + *(int *)(v59 + 48);
    v62 = *v58;
    v63 = v58[1];
    sub_238001DE4(v61, (uint64_t)v31, type metadata accessor for Proto_SealedHash);
    v64 = v85;
    v65 = sub_23800DCFC(v62, v63);
    v67 = v66;
    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0)
      goto LABEL_53;
    v68 = *(_QWORD *)(v64 + 56) + *(_QWORD *)(v112 + 72) * v65;
    v69 = v114;
    sub_238013570(v68, (uint64_t)v114, type metadata accessor for Proto_SealedHash);
    v70 = *v69;
    v71 = *(_QWORD *)v31;
    if (v31[8] == 1)
    {
      if (v71)
      {
        if (v71 == 1)
        {
          if (v70 != 1)
            goto LABEL_52;
        }
        else if (v70 != 2)
        {
          goto LABEL_52;
        }
      }
      else if (v70)
      {
        goto LABEL_52;
      }
    }
    else if (v70 != v71)
    {
      goto LABEL_52;
    }
    v72 = v114[2];
    v73 = *((_QWORD *)v103 + 2);
    v74 = *(_QWORD *)(v72 + 16);
    if (v74 != *(_QWORD *)(v73 + 16))
      goto LABEL_52;
    if (v74 && v72 != v73)
      break;
    v44 = v114;
    v31 = v103;
    sub_2380BD5C8();
    sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v45 = sub_2380BDCE8();
    sub_237FFD540((uint64_t)v44, type metadata accessor for Proto_SealedHash);
    sub_237FFD540((uint64_t)v31, type metadata accessor for Proto_SealedHash);
    v35 = v113;
    v39 = v87;
    v43 = v88;
    v36 = v84;
    result = v86;
    if ((v45 & 1) == 0)
      return result;
  }
  v75 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
  v93 = *(_QWORD *)(v94 + 72);
  v106 = v21;
  v107 = v23;
  v116 = v27;
  v96 = v72;
  v98 = v73;
  v95 = v74;
  sub_238013570(v72 + v75, (uint64_t)v27, type metadata accessor for Proto_SealedHash.Entry);
  if (!*(_QWORD *)(v73 + 16))
  {
    __break(1u);
    JUMPOUT(0x2380B6690);
  }
  v117 = 0;
  v76 = v118;
  sub_238013570(v73 + v75, (uint64_t)v118, type metadata accessor for Proto_SealedHash.Entry);
  if (*v27 == *v76)
  {
    ++v117;
    __asm { BR              X10 }
  }
  sub_237FFD540((uint64_t)v118, type metadata accessor for Proto_SealedHash.Entry);
  sub_237FFD540((uint64_t)v116, type metadata accessor for Proto_SealedHash.Entry);
LABEL_52:
  sub_237FFD540((uint64_t)v114, type metadata accessor for Proto_SealedHash);
  v31 = v103;
LABEL_53:
  sub_237FFD540((uint64_t)v31, type metadata accessor for Proto_SealedHash);
  return 0;
}

uint64_t sub_2380B6808(uint64_t a1, uint64_t a2)
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  char *v34;
  char v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = sub_2380BD5C8();
  v43 = *(_QWORD *)(v4 - 8);
  v44 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v42 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v38 - v7;
  v8 = type metadata accessor for ATLogProofs(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v38 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56C0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2568C5450);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v45 = (uint64_t)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v38 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v38 - v20;
  v22 = type metadata accessor for Proto_TransparencyProofs(0);
  v23 = *(int *)(v22 + 20);
  v39 = a1;
  sub_2380051FC(a1 + v23, (uint64_t)v21, qword_2568C5450);
  v24 = *(int *)(v22 + 20);
  v40 = a2;
  sub_2380051FC(a2 + v24, (uint64_t)v19, qword_2568C5450);
  v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_2380051FC((uint64_t)v21, (uint64_t)v13, qword_2568C5450);
  sub_2380051FC((uint64_t)v19, v25, qword_2568C5450);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v26((uint64_t)v13, 1, v8) != 1)
  {
    v27 = v45;
    sub_2380051FC((uint64_t)v13, v45, qword_2568C5450);
    if (v26(v25, 1, v8) != 1)
    {
      v28 = v38;
      sub_238001DE4(v25, v38, type metadata accessor for ATLogProofs);
      v29 = j___s16CloudAttestation21TransparencyLogProofsV2eeoiySbAC_ACtFZ_0(v27, v28);
      sub_237FFD540(v28, type metadata accessor for ATLogProofs);
      sub_238005240((uint64_t)v19, qword_2568C5450);
      sub_238005240((uint64_t)v21, qword_2568C5450);
      sub_237FFD540(v27, type metadata accessor for ATLogProofs);
      sub_238005240((uint64_t)v13, qword_2568C5450);
      if ((v29 & 1) != 0)
        goto LABEL_8;
LABEL_9:
      v35 = 0;
      return v35 & 1;
    }
    sub_238005240((uint64_t)v19, qword_2568C5450);
    sub_238005240((uint64_t)v21, qword_2568C5450);
    sub_237FFD540(v27, type metadata accessor for ATLogProofs);
LABEL_6:
    sub_238005240((uint64_t)v13, &qword_2568C56C0);
    goto LABEL_9;
  }
  sub_238005240((uint64_t)v19, qword_2568C5450);
  sub_238005240((uint64_t)v21, qword_2568C5450);
  if (v26(v25, 1, v8) != 1)
    goto LABEL_6;
  sub_238005240((uint64_t)v13, qword_2568C5450);
LABEL_8:
  v31 = v43;
  v30 = v44;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
  v33 = v41;
  v32(v41, v39, v44);
  v34 = v42;
  v32(v42, v40, v30);
  sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v35 = sub_2380BDCE8();
  v36 = *(void (**)(char *, uint64_t))(v31 + 8);
  v36(v34, v30);
  v36(v33, v30);
  return v35 & 1;
}

uint64_t sub_2380B6BD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, char *, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v4 = sub_2380BD5C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - v9;
  if ((sub_2380B4A1C(*a1, *a2) & 1) != 0)
  {
    v11 = type metadata accessor for Proto_SealedHashLedger(0);
    v12 = (char *)a1 + *(int *)(v11 + 20);
    v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v13(v10, v12, v4);
    v13(v8, (char *)a2 + *(int *)(v11 + 20), v4);
    sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_2380BDCE8();
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_2380B6D04(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v4 = sub_2380BD5C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - v9;
  sub_238008ED0(*a1, a1[1]);
  if ((v11 & 1) != 0 && (sub_2380B4818(a1[2], *(_QWORD *)(a2 + 16)) & 1) != 0)
  {
    v12 = type metadata accessor for Proto_SecureConfig(0);
    v13 = (char *)a1 + *(int *)(v12 + 24);
    v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v14(v10, v13, v4);
    v14(v8, (char *)(a2 + *(int *)(v12 + 24)), v4);
    sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v15 = sub_2380BDCE8();
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    v16(v10, v4);
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_2380B6E48(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_2380BD5C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1;
  v12 = *a2;
  if (*((_BYTE *)a2 + 8) != 1)
  {
    if (v11 == v12)
      goto LABEL_11;
    goto LABEL_13;
  }
  if (!v12)
  {
    if (!v11)
      goto LABEL_11;
LABEL_13:
    v16 = 0;
    return v16 & 1;
  }
  if (v12 != 1)
  {
    if (v11 == 2)
      goto LABEL_11;
    goto LABEL_13;
  }
  if (v11 != 1)
    goto LABEL_13;
LABEL_11:
  if ((sub_238003254(a1[2], a2[2]) & 1) == 0)
    goto LABEL_13;
  v13 = type metadata accessor for Proto_SealedHash(0);
  v14 = (char *)a1 + *(int *)(v13 + 24);
  v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v15(v10, v14, v4);
  v15(v8, (char *)a2 + *(int *)(v13 + 24), v4);
  sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v16 = sub_2380BDCE8();
  v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v8, v4);
  v17(v10, v4);
  return v16 & 1;
}

uint64_t sub_2380B6FC4(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  char v32;
  uint64_t v34;
  char v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  _DWORD *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = sub_2380BD5C8();
  v4 = *(_QWORD *)(v53 - 8);
  v5 = MEMORY[0x24BDAC7A8](v53);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v42 - v8;
  v10 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56F0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  if (*(_DWORD *)a1 != *a2)
    goto LABEL_9;
  v48 = v14;
  v49 = v11;
  v51 = v22;
  v52 = (uint64_t)&v42 - v20;
  v46 = v4;
  v47 = v21;
  v43 = v13;
  v44 = v9;
  v50 = v16;
  v45 = v7;
  sub_238008ED0(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  if ((v23 & 1) == 0)
    goto LABEL_9;
  v24 = type metadata accessor for Proto_SealedHash.Entry(0);
  v25 = v52;
  sub_2380051FC(a1 + *(int *)(v24 + 24), v52, &qword_2568C56E8);
  v26 = *(int *)(v24 + 24);
  v42 = a2;
  v27 = v51;
  sub_2380051FC((uint64_t)a2 + v26, v51, &qword_2568C56E8);
  v28 = (uint64_t)v50;
  v29 = (uint64_t)&v50[*(int *)(v48 + 48)];
  sub_2380051FC(v25, (uint64_t)v50, &qword_2568C56E8);
  sub_2380051FC(v27, v29, &qword_2568C56E8);
  v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
  if (v30(v28, 1, v10) == 1)
  {
    sub_238005240(v27, &qword_2568C56E8);
    sub_238005240(v25, &qword_2568C56E8);
    if (v30(v29, 1, v10) == 1)
    {
      sub_238005240(v28, &qword_2568C56E8);
LABEL_12:
      v36 = v46;
      v37 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
      v38 = v44;
      v39 = v53;
      v37(v44, a1 + *(int *)(v24 + 28), v53);
      v40 = v45;
      v37(v45, (uint64_t)v42 + *(int *)(v24 + 28), v39);
      sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v32 = sub_2380BDCE8();
      v41 = *(void (**)(char *, uint64_t))(v36 + 8);
      v41(v40, v39);
      v41(v38, v39);
      return v32 & 1;
    }
    goto LABEL_8;
  }
  v31 = v47;
  sub_2380051FC(v28, v47, &qword_2568C56E8);
  if (v30(v29, 1, v10) == 1)
  {
    sub_238005240(v51, &qword_2568C56E8);
    sub_238005240(v52, &qword_2568C56E8);
    sub_237FFD540(v31, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
LABEL_8:
    sub_238005240(v28, &qword_2568C56F0);
    goto LABEL_9;
  }
  v34 = (uint64_t)v43;
  sub_238001DE4(v29, (uint64_t)v43, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  v35 = sub_2380B73DC(v31, v34);
  sub_237FFD540(v34, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  sub_238005240(v51, &qword_2568C56E8);
  sub_238005240(v52, &qword_2568C56E8);
  sub_237FFD540(v31, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  sub_238005240(v28, &qword_2568C56E8);
  if ((v35 & 1) != 0)
    goto LABEL_12;
LABEL_9:
  v32 = 0;
  return v32 & 1;
}

uint64_t sub_2380B73DC(uint64_t a1, uint64_t a2)
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
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int EnumCaseMultiPayload;
  uint64_t v24;
  char v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t (*v30)(uint64_t);
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  char v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = a2;
  v36 = type metadata accessor for Proto_SecureConfig(0);
  MEMORY[0x24BDAC7A8](v36);
  v37 = (uint64_t)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Proto_Cryptex.Salt(0);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (uint64_t)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Proto_Cryptex(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v36 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v36 - v16);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C95F8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_238013570(a1, (uint64_t)v21, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  sub_238013570(v39, v22, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_238013570((uint64_t)v21, (uint64_t)v17, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    if (swift_getEnumCaseMultiPayload())
    {
      v26 = type metadata accessor for Proto_Cryptex;
      v27 = (uint64_t)v17;
LABEL_14:
      sub_237FFD540(v27, v26);
      sub_238005240((uint64_t)v21, &qword_2568C95F8);
LABEL_22:
      v25 = 0;
      return v25 & 1;
    }
    sub_238001DE4(v22, (uint64_t)v8, type metadata accessor for Proto_Cryptex);
    sub_238008ED0(*v17, v17[1]);
    if ((v34 & 1) != 0)
    {
      sub_2380BD5C8();
      sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      if ((sub_2380BDCE8() & 1) != 0)
      {
        v30 = type metadata accessor for Proto_Cryptex;
        sub_237FFD540((uint64_t)v8, type metadata accessor for Proto_Cryptex);
        v31 = (uint64_t)v17;
        goto LABEL_19;
      }
    }
    v32 = type metadata accessor for Proto_Cryptex;
    sub_237FFD540((uint64_t)v8, type metadata accessor for Proto_Cryptex);
    v33 = (uint64_t)v17;
LABEL_21:
    sub_237FFD540(v33, v32);
    sub_237FFD540((uint64_t)v21, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    goto LABEL_22;
  }
  if (EnumCaseMultiPayload != 1)
  {
    sub_238013570((uint64_t)v21, (uint64_t)v12, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    if (swift_getEnumCaseMultiPayload() != 2)
    {
      v26 = type metadata accessor for Proto_SecureConfig;
      v27 = (uint64_t)v12;
      goto LABEL_14;
    }
    v28 = v37;
    sub_238001DE4(v22, v37, type metadata accessor for Proto_SecureConfig);
    sub_238008ED0(*v12, v12[1]);
    if ((v29 & 1) != 0 && (sub_2380B4818(v12[2], *(_QWORD *)(v28 + 16)) & 1) != 0)
    {
      sub_2380BD5C8();
      sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      if ((sub_2380BDCE8() & 1) != 0)
      {
        v30 = type metadata accessor for Proto_SecureConfig;
        sub_237FFD540(v28, type metadata accessor for Proto_SecureConfig);
        v31 = (uint64_t)v12;
LABEL_19:
        sub_237FFD540(v31, v30);
        sub_237FFD540((uint64_t)v21, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
        v25 = 1;
        return v25 & 1;
      }
    }
    v32 = type metadata accessor for Proto_SecureConfig;
    sub_237FFD540(v28, type metadata accessor for Proto_SecureConfig);
    v33 = (uint64_t)v12;
    goto LABEL_21;
  }
  sub_238013570((uint64_t)v21, (uint64_t)v15, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v26 = type metadata accessor for Proto_Cryptex.Salt;
    v27 = (uint64_t)v15;
    goto LABEL_14;
  }
  v24 = v38;
  sub_238001DE4(v22, v38, type metadata accessor for Proto_Cryptex.Salt);
  sub_2380BD5C8();
  sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v25 = sub_2380BDCE8();
  sub_237FFD540(v24, type metadata accessor for Proto_Cryptex.Salt);
  sub_237FFD540((uint64_t)v15, type metadata accessor for Proto_Cryptex.Salt);
  sub_237FFD540((uint64_t)v21, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  return v25 & 1;
}

uint64_t sub_2380B7898(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v4 = sub_2380BD5C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - v9;
  sub_238008ED0(*a1, a1[1]);
  if ((v11 & 1) != 0)
  {
    v12 = type metadata accessor for Proto_Cryptex(0);
    v13 = (char *)a1 + *(int *)(v12 + 20);
    v14 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v14(v10, v13, v4);
    v14(v8, (char *)(a2 + *(int *)(v12 + 20)), v4);
    sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v15 = sub_2380BDCE8();
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    v16(v10, v4);
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t _s16CloudAttestation0B6BundleV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t *v57;
  int v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v63;
  uint64_t *v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char v86;
  void (*v87)(char *, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unsigned int (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, char *, uint64_t);
  char *v99;
  uint64_t v100;
  char *v101;
  void (*v102)(char *, uint64_t);
  uint64_t *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;

  v131 = a2;
  v122 = sub_2380BD5C8();
  v113 = *(_QWORD *)(v122 - 8);
  v3 = MEMORY[0x24BDAC7A8](v122);
  v112 = (char *)&v103 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v111 = (char *)&v103 - v5;
  v6 = type metadata accessor for Proto_TransparencyProofs(0);
  v117 = *(_QWORD *)(v6 - 8);
  v118 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v121 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9658);
  MEMORY[0x24BDAC7A8](v116);
  v123 = (char *)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6010);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v114 = (uint64_t)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v120 = (uint64_t)&v103 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v126 = (uint64_t)&v103 - v14;
  v124 = sub_2380BD598();
  v128 = *(_QWORD *)(v124 - 8);
  MEMORY[0x24BDAC7A8](v124);
  v115 = (char *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9660);
  MEMORY[0x24BDAC7A8](v130);
  v125 = (uint64_t)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E00);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v119 = (uint64_t)&v103 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v127 = (uint64_t)&v103 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v129 = (uint64_t)&v103 - v22;
  v23 = type metadata accessor for Proto_SealedHashLedger(0);
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (uint64_t *)((char *)&v103 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9668);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C6418);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (uint64_t *)((char *)&v103 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v103 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v103 - v37;
  v39 = *a1;
  v40 = a1[1];
  v41 = a1;
  v42 = v131;
  sub_238008ED0(v39, v40);
  if ((v43 & 1) == 0)
    goto LABEL_10;
  v106 = v24;
  v110 = v36;
  v109 = v38;
  v108 = v23;
  v104 = v26;
  v105 = v33;
  v107 = v29;
  v44 = v130;
  sub_238008ED0(v41[2], v41[3]);
  if ((v45 & 1) == 0)
    goto LABEL_10;
  v46 = (int *)type metadata accessor for Proto_AttestationBundle(0);
  v47 = v46[8];
  v103 = v41;
  v48 = (uint64_t)v41 + v47;
  v49 = (uint64_t)v109;
  sub_2380051FC(v48, (uint64_t)v109, &qword_2568C6418);
  v50 = (uint64_t)v110;
  sub_2380051FC(v42 + v46[8], (uint64_t)v110, &qword_2568C6418);
  v51 = (uint64_t)v107;
  v52 = (uint64_t)&v107[*(int *)(v27 + 48)];
  sub_2380051FC(v49, (uint64_t)v107, &qword_2568C6418);
  sub_2380051FC(v50, v52, &qword_2568C6418);
  v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v106 + 48);
  v54 = v108;
  if (v53(v51, 1, v108) == 1)
  {
    sub_238005240(v50, &qword_2568C6418);
    sub_238005240(v49, &qword_2568C6418);
    v55 = v53(v52, 1, v54);
    v56 = v129;
    if (v55 == 1)
    {
      sub_238005240(v51, &qword_2568C6418);
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  v57 = v105;
  sub_2380051FC(v51, (uint64_t)v105, &qword_2568C6418);
  v58 = v53(v52, 1, v54);
  v56 = v129;
  if (v58 == 1)
  {
    sub_238005240((uint64_t)v110, &qword_2568C6418);
    sub_238005240((uint64_t)v109, &qword_2568C6418);
    sub_237FFD540((uint64_t)v57, type metadata accessor for Proto_SealedHashLedger);
LABEL_8:
    v59 = &qword_2568C9668;
    v60 = v51;
LABEL_9:
    sub_238005240(v60, v59);
    goto LABEL_10;
  }
  v63 = v52;
  v64 = v104;
  sub_238001DE4(v63, (uint64_t)v104, type metadata accessor for Proto_SealedHashLedger);
  v65 = sub_2380B4A1C(*v57, *v64);
  v66 = (uint64_t)v110;
  if ((v65 & 1) == 0)
  {
    sub_237FFD540((uint64_t)v64, type metadata accessor for Proto_SealedHashLedger);
    sub_238005240(v66, &qword_2568C6418);
    sub_238005240((uint64_t)v109, &qword_2568C6418);
    sub_237FFD540((uint64_t)v57, type metadata accessor for Proto_SealedHashLedger);
    v60 = v51;
    v59 = &qword_2568C6418;
    goto LABEL_9;
  }
  v67 = (uint64_t)v57;
  sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v68 = sub_2380BDCE8();
  sub_237FFD540((uint64_t)v64, type metadata accessor for Proto_SealedHashLedger);
  sub_238005240(v66, &qword_2568C6418);
  sub_238005240((uint64_t)v109, &qword_2568C6418);
  sub_237FFD540(v67, type metadata accessor for Proto_SealedHashLedger);
  sub_238005240(v51, &qword_2568C6418);
  if ((v68 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v69 = v103;
  if ((sub_238002940(v103[4], *(_QWORD *)(v42 + 32)) & 1) == 0)
    goto LABEL_10;
  sub_2380051FC((uint64_t)v69 + v46[9], v56, &qword_2568C5E00);
  v70 = v42 + v46[9];
  v71 = v127;
  sub_2380051FC(v70, v127, &qword_2568C5E00);
  v72 = v125;
  v73 = v125 + *(int *)(v44 + 48);
  sub_2380051FC(v56, v125, &qword_2568C5E00);
  sub_2380051FC(v71, v73, &qword_2568C5E00);
  v74 = v56;
  v75 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v128 + 48);
  v76 = v124;
  if (v75(v72, 1, v124) == 1)
  {
    sub_238005240(v71, &qword_2568C5E00);
    sub_238005240(v74, &qword_2568C5E00);
    v77 = v75(v73, 1, v76);
    v78 = (uint64_t)v123;
    v79 = (uint64_t)v121;
    v80 = v126;
    if (v77 == 1)
    {
      sub_238005240(v72, &qword_2568C5E00);
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  v81 = v119;
  sub_2380051FC(v72, v119, &qword_2568C5E00);
  v82 = v75(v73, 1, v76);
  v78 = (uint64_t)v123;
  v83 = v76;
  v80 = v126;
  if (v82 == 1)
  {
    sub_238005240(v127, &qword_2568C5E00);
    sub_238005240(v129, &qword_2568C5E00);
    (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v81, v83);
LABEL_21:
    v59 = &qword_2568C9660;
    v60 = v72;
    goto LABEL_9;
  }
  v84 = v128;
  v85 = v115;
  (*(void (**)(char *, uint64_t, uint64_t))(v128 + 32))(v115, v73, v83);
  sub_238001820(qword_2568C9670, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
  v86 = sub_2380BDCE8();
  v87 = *(void (**)(char *, uint64_t))(v84 + 8);
  v87(v85, v83);
  sub_238005240(v127, &qword_2568C5E00);
  sub_238005240(v129, &qword_2568C5E00);
  v87((char *)v81, v83);
  v79 = (uint64_t)v121;
  sub_238005240(v72, &qword_2568C5E00);
  if ((v86 & 1) == 0)
    goto LABEL_10;
LABEL_23:
  sub_2380051FC((uint64_t)v69 + v46[10], v80, &qword_2568C6010);
  v130 = (uint64_t)v46;
  v88 = v131;
  v89 = v131 + v46[10];
  v90 = v120;
  sub_2380051FC(v89, v120, &qword_2568C6010);
  v91 = v78 + *(int *)(v116 + 48);
  sub_2380051FC(v80, v78, &qword_2568C6010);
  sub_2380051FC(v90, v91, &qword_2568C6010);
  v92 = v118;
  v93 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v117 + 48);
  if (v93(v78, 1, v118) == 1)
  {
    sub_238005240(v90, &qword_2568C6010);
    sub_238005240(v80, &qword_2568C6010);
    if (v93(v91, 1, v92) == 1)
    {
      sub_238005240(v78, &qword_2568C6010);
      v88 = v131;
LABEL_30:
      v96 = v130;
      v97 = v113;
      v98 = *(void (**)(char *, char *, uint64_t))(v113 + 16);
      v99 = v111;
      v100 = v122;
      v98(v111, (char *)v69 + *(int *)(v130 + 28), v122);
      v101 = v112;
      v98(v112, (char *)(v88 + *(int *)(v96 + 28)), v100);
      sub_238001820(&qword_2568C56B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v61 = sub_2380BDCE8();
      v102 = *(void (**)(char *, uint64_t))(v97 + 8);
      v102(v101, v100);
      v102(v99, v100);
      return v61 & 1;
    }
    goto LABEL_28;
  }
  v94 = v114;
  sub_2380051FC(v78, v114, &qword_2568C6010);
  if (v93(v91, 1, v92) == 1)
  {
    sub_238005240(v120, &qword_2568C6010);
    sub_238005240(v126, &qword_2568C6010);
    sub_237FFD540(v94, type metadata accessor for Proto_TransparencyProofs);
LABEL_28:
    v59 = &qword_2568C9658;
    v60 = v78;
    goto LABEL_9;
  }
  sub_238001DE4(v91, v79, type metadata accessor for Proto_TransparencyProofs);
  v95 = sub_2380B6808(v94, v79);
  sub_237FFD540(v79, type metadata accessor for Proto_TransparencyProofs);
  sub_238005240(v120, &qword_2568C6010);
  sub_238005240(v126, &qword_2568C6010);
  sub_237FFD540(v94, type metadata accessor for Proto_TransparencyProofs);
  sub_238005240(v78, &qword_2568C6010);
  if ((v95 & 1) != 0)
    goto LABEL_30;
LABEL_10:
  v61 = 0;
  return v61 & 1;
}

uint64_t type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(uint64_t a1)
{
  return sub_238001B1C(a1, qword_2568C96E8);
}

uint64_t sub_2380B84EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C9600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2380B8534()
{
  unint64_t result;

  result = qword_2568C9618;
  if (!qword_2568C9618)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7730, &type metadata for Proto_HashAlg);
    atomic_store(result, (unint64_t *)&qword_2568C9618);
  }
  return result;
}

uint64_t *sub_2380B8578(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v9 = *a2;
      v10 = a2[1];
      sub_237FFBA20(*a2, v10);
      *a1 = v9;
      a1[1] = v10;
      a1[2] = a2[2];
      v11 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_2380BD5C8();
      v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = sub_2380BD5C8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      v16 = *a2;
      v17 = a2[1];
      sub_237FFBA20(*a2, v17);
      *a1 = v16;
      a1[1] = v17;
      v18 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
      v19 = (char *)a1 + v18;
      v20 = (char *)a2 + v18;
      v21 = sub_2380BD5C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2380B86F4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    swift_bridgeObjectRelease();
    v3 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
LABEL_6:
    a1 += v3;
    goto LABEL_7;
  }
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result)
      return result;
    sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    v3 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
    goto LABEL_6;
  }
LABEL_7:
  v4 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

uint64_t *sub_2380B8784(uint64_t *a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v6 = *a2;
    v7 = a2[1];
    sub_237FFBA20(*a2, v7);
    *a1 = v6;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2380BD5C8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = sub_2380BD5C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    v13 = *a2;
    v14 = a2[1];
    sub_237FFBA20(*a2, v14);
    *a1 = v13;
    a1[1] = v14;
    v15 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_2380BD5C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *sub_2380B88D4(uint64_t *a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)a1, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v6 = *a2;
      v7 = a2[1];
      sub_237FFBA20(*a2, v7);
      *a1 = v6;
      a1[1] = v7;
      a1[2] = a2[2];
      v8 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_2380BD5C8();
      v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
      swift_bridgeObjectRetain();
      v12(v9, v10, v11);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v5 = sub_2380BD5C8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      v13 = *a2;
      v14 = a2[1];
      sub_237FFBA20(*a2, v14);
      *a1 = v13;
      a1[1] = v14;
      v15 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
      v16 = (char *)a1 + v15;
      v17 = (char *)a2 + v15;
      v18 = sub_2380BD5C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2380B8A3C(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    v6 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
LABEL_6:
    v7 = a1 + v6;
    v8 = a2 + v6;
    v9 = sub_2380BD5C8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    goto LABEL_7;
  }
  if (EnumCaseMultiPayload != 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v6 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
    goto LABEL_6;
  }
  v5 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
LABEL_7:
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2380B8B1C(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_237FFD540(a1, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      v6 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        v5 = sub_2380BD5C8();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      *(_OWORD *)a1 = *(_OWORD *)a2;
      v6 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
    }
    v7 = a1 + v6;
    v8 = a2 + v6;
    v9 = sub_2380BD5C8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    goto LABEL_8;
  }
  return a1;
}

uint64_t sub_2380B8C14()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for Proto_Cryptex(319);
  if (v1 <= 0x3F)
  {
    result = sub_2380BD5C8();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for Proto_SecureConfig(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Proto_HashAlg()
{
  return &type metadata for Proto_HashAlg;
}

uint64_t *sub_2380B8CC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v34;
  char *v35;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v7 = a2[1];
    v8 = a2[2];
    sub_237FFBA20(v7, v8);
    v4[1] = v7;
    v4[2] = v8;
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)v4 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        v18 = *v11;
        v19 = v11[1];
        sub_237FFBA20(*v11, v19);
        *v10 = v18;
        v10[1] = v19;
        v10[2] = v11[2];
        v20 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
        v34 = (char *)v11 + v20;
        v35 = (char *)v10 + v20;
        v21 = sub_2380BD5C8();
        v22 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
        swift_bridgeObjectRetain();
        v22(v35, v34, v21);
      }
      else if (EnumCaseMultiPayload == 1)
      {
        v17 = sub_2380BD5C8();
        (*(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v10, v11, v17);
      }
      else
      {
        v23 = *v11;
        v24 = v11[1];
        sub_237FFBA20(*v11, v24);
        *v10 = v23;
        v10[1] = v24;
        v25 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
        v26 = (char *)v10 + v25;
        v27 = (char *)v11 + v25;
        v28 = sub_2380BD5C8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v29 = *(int *)(a3 + 28);
    v30 = (char *)v4 + v29;
    v31 = (char *)a2 + v29;
    v32 = sub_2380BD5C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
  }
  return v4;
}

uint64_t sub_2380B8EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_237FFBAB0(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        sub_237FFBAB0(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
        swift_bridgeObjectRelease();
        v7 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
        goto LABEL_7;
      case 1:
LABEL_8:
        v8 = sub_2380BD5C8();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v4, v8);
        break;
      case 0:
        sub_237FFBAB0(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
        v7 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
LABEL_7:
        v4 += v7;
        goto LABEL_8;
    }
  }
  v9 = a1 + *(int *)(a2 + 28);
  v10 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t sub_2380B8FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v32;
  char *v33;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_237FFBA20(v6, v7);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v11 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v16 = *v10;
      v17 = v10[1];
      sub_237FFBA20(*v10, v17);
      *v9 = v16;
      v9[1] = v17;
      v9[2] = v10[2];
      v18 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
      v32 = (char *)v10 + v18;
      v33 = (char *)v9 + v18;
      v19 = sub_2380BD5C8();
      v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
      swift_bridgeObjectRetain();
      v20(v33, v32, v19);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v15 = sub_2380BD5C8();
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v9, v10, v15);
    }
    else
    {
      v21 = *v10;
      v22 = v10[1];
      sub_237FFBA20(*v10, v22);
      *v9 = v21;
      v9[1] = v22;
      v23 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
      v24 = (char *)v9 + v23;
      v25 = (char *)v10 + v23;
      v26 = sub_2380BD5C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v27 = *(int *)(a3 + 28);
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
  return a1;
}

uint64_t sub_2380B91DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t *, uint64_t, uint64_t);
  int v16;
  int v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_237FFBA20(v6, v7);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  sub_237FFBAB0(v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        v23 = *v12;
        v24 = v12[1];
        sub_237FFBA20(*v12, v24);
        *v11 = v23;
        v11[1] = v24;
        v11[2] = v12[2];
        v25 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
        v52 = (char *)v12 + v25;
        v53 = (char *)v11 + v25;
        v26 = sub_2380BD5C8();
        v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
        swift_bridgeObjectRetain();
        v27(v53, v52, v26);
      }
      else if (EnumCaseMultiPayload == 1)
      {
        v19 = sub_2380BD5C8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v11, v12, v19);
      }
      else
      {
        v28 = *v12;
        v29 = v12[1];
        sub_237FFBA20(*v12, v29);
        *v11 = v28;
        v11[1] = v29;
        v30 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
        v31 = (char *)v11 + v30;
        v32 = (char *)v12 + v30;
        v33 = sub_2380BD5C8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_17;
    }
LABEL_8:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  if (v17)
  {
    sub_237FFD540((uint64_t)v11, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)v11, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    v21 = swift_getEnumCaseMultiPayload();
    if (v21 == 2)
    {
      v39 = *v12;
      v40 = v12[1];
      sub_237FFBA20(*v12, v40);
      *v11 = v39;
      v11[1] = v40;
      v11[2] = v12[2];
      v41 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
      v42 = (char *)v11 + v41;
      v43 = (char *)v12 + v41;
      v44 = sub_2380BD5C8();
      v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16);
      swift_bridgeObjectRetain();
      v45(v42, v43, v44);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      if (v21 == 1)
      {
        v22 = sub_2380BD5C8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v11, v12, v22);
      }
      else
      {
        v46 = *v12;
        v47 = v12[1];
        sub_237FFBA20(*v12, v47);
        *v11 = v46;
        v11[1] = v47;
        v48 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
        v49 = (char *)v11 + v48;
        v50 = (char *)v12 + v48;
        v51 = sub_2380BD5C8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v51 - 8) + 16))(v49, v50, v51);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_17:
  v34 = *(int *)(a3 + 28);
  v35 = a1 + v34;
  v36 = a2 + v34;
  v37 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 24))(v35, v36, v37);
  return a1;
}

uint64_t sub_2380B9540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(int *)(a3 + 24);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  v9 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_OWORD *)v7 = *(_OWORD *)v8;
      v7[2] = v8[2];
      v14 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        v13 = sub_2380BD5C8();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v7, v8, v13);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
        goto LABEL_10;
      }
      *(_OWORD *)v7 = *(_OWORD *)v8;
      v14 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
    }
    v15 = (char *)v7 + v14;
    v16 = (char *)v8 + v14;
    v17 = sub_2380BD5C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
    goto LABEL_9;
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
  memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
LABEL_10:
  v18 = *(int *)(a3 + 28);
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
  return a1;
}

uint64_t sub_2380B96DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *, uint64_t, uint64_t);
  int v14;
  int v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_237FFBAB0(v6, v7);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = type metadata accessor for Proto_SealedHash.Entry.OneOf_Info(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        *(_OWORD *)v9 = *(_OWORD *)v10;
        v9[2] = v10[2];
        v21 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
      }
      else
      {
        if (EnumCaseMultiPayload == 1)
        {
          v17 = sub_2380BD5C8();
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v9, v10, v17);
LABEL_17:
          swift_storeEnumTagMultiPayload();
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
          goto LABEL_18;
        }
        *(_OWORD *)v9 = *(_OWORD *)v10;
        v21 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
      }
      v22 = (char *)v9 + v21;
      v23 = (char *)v10 + v21;
      v24 = sub_2380BD5C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (v15)
  {
    sub_237FFD540((uint64_t)v9, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
LABEL_8:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_18;
  }
  if (a1 != a2)
  {
    sub_237FFD540((uint64_t)v9, type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
    v19 = swift_getEnumCaseMultiPayload();
    if (v19 == 2)
    {
      *(_OWORD *)v9 = *(_OWORD *)v10;
      v9[2] = v10[2];
      v30 = *(int *)(type metadata accessor for Proto_SecureConfig(0) + 24);
      v31 = (char *)v9 + v30;
      v32 = (char *)v10 + v30;
      v33 = sub_2380BD5C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      if (v19 == 1)
      {
        v20 = sub_2380BD5C8();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v9, v10, v20);
      }
      else
      {
        *(_OWORD *)v9 = *(_OWORD *)v10;
        v34 = *(int *)(type metadata accessor for Proto_Cryptex(0) + 20);
        v35 = (char *)v9 + v34;
        v36 = (char *)v10 + v34;
        v37 = sub_2380BD5C8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 32))(v35, v36, v37);
      }
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_18:
  v25 = *(int *)(a3 + 28);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 40))(v26, v27, v28);
  return a1;
}

uint64_t sub_2380B99C0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380B99CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 12)
  {
    v4 = *(_QWORD *)(a1 + 16) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0)
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    else
      return 0;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = sub_2380BD5C8();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_2380B9A7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380B9A88(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 12)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568C56E8);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = sub_2380BD5C8();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_2380B9B30()
{
  unint64_t v0;
  unint64_t v1;

  sub_237FFB4E8(319, qword_2568C9788, (void (*)(uint64_t))type metadata accessor for Proto_SealedHash.Entry.OneOf_Info);
  if (v0 <= 0x3F)
  {
    sub_2380BD5C8();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for Proto_SealedHash.Entry.Flags()
{
  return &type metadata for Proto_SealedHash.Entry.Flags;
}

uint64_t sub_2380B9BEC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380B9BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 12)
  {
    v4 = *(_QWORD *)(a1 + 8) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0)
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    else
      return 0;
  }
  else
  {
    v8 = sub_2380BD5C8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_2380B9C80()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2380B9C8C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 12)
  {
    *(_QWORD *)result = 0;
    *((_QWORD *)result + 1) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }
  else
  {
    v7 = sub_2380BD5C8();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_2380B9D08()
{
  return sub_2380B9D14();
}

uint64_t sub_2380B9D14()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BD5C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2380B9D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2380B9DBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2380B9DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2380B9E34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2380B9E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2380B9EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2380B9F00()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380B9F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2380B9F48()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380B9F54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_2380B9F94()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BD5C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2380B9FFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    sub_237FFBA20(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    a1[2] = a2[2];
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_2380BD5C8();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_2380BA0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_237FFBAB0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t *sub_2380BA108(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);

  v6 = *a2;
  v7 = a2[1];
  sub_237FFBA20(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  a1[2] = a2[2];
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2380BD5C8();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  return a1;
}

uint64_t *sub_2380BA194(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = *a2;
  v7 = a2[1];
  sub_237FFBA20(*a2, v7);
  v8 = *a1;
  v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_237FFBAB0(v8, v9);
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2380BD5C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_2380BA22C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t *sub_2380BA290(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_237FFBAB0(v6, v7);
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = sub_2380BD5C8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_2380BA310()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380BA320()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2380BA330()
{
  return sub_2380BA738();
}

_QWORD *sub_2380BA33C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    *(_QWORD *)(a1 + 16) = a2[2];
    v5 = *(int *)(a3 + 24);
    v6 = a1 + v5;
    v7 = (uint64_t)a2 + v5;
    v8 = sub_2380BD5C8();
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    swift_bridgeObjectRetain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_2380BA3E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2380BD5C8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_2380BA430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_2380BD5C8();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t sub_2380BA4B0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = (uint64_t)a2 + v7;
  v10 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_2380BA534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_2380BA5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2380BD5C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_2380BA61C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_index_11Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2380BD5C8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_2380BA6A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_index_12Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = sub_2380BD5C8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2380BA72C()
{
  return sub_2380BA738();
}

uint64_t sub_2380BA738()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2380BD5C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2380BA7B4()
{
  unint64_t result;

  result = qword_2568C9A10;
  if (!qword_2568C9A10)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7580, &type metadata for Proto_SealedHash.Entry.Flags);
    atomic_store(result, (unint64_t *)&qword_2568C9A10);
  }
  return result;
}

unint64_t sub_2380BA7FC()
{
  unint64_t result;

  result = qword_2568C9A18;
  if (!qword_2568C9A18)
  {
    result = MEMORY[0x23B82B770](&unk_2380C75A8, &type metadata for Proto_SealedHash.Entry.Flags);
    atomic_store(result, (unint64_t *)&qword_2568C9A18);
  }
  return result;
}

unint64_t sub_2380BA844()
{
  unint64_t result;

  result = qword_2568C9A20;
  if (!qword_2568C9A20)
  {
    result = MEMORY[0x23B82B770](&unk_2380C75E8, &type metadata for Proto_SealedHash.Entry.Flags);
    atomic_store(result, (unint64_t *)&qword_2568C9A20);
  }
  return result;
}

unint64_t sub_2380BA88C()
{
  unint64_t result;

  result = qword_2568C9A28;
  if (!qword_2568C9A28)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7668, &type metadata for Proto_HashAlg);
    atomic_store(result, (unint64_t *)&qword_2568C9A28);
  }
  return result;
}

unint64_t sub_2380BA8D4()
{
  unint64_t result;

  result = qword_2568C9A30;
  if (!qword_2568C9A30)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7690, &type metadata for Proto_HashAlg);
    atomic_store(result, (unint64_t *)&qword_2568C9A30);
  }
  return result;
}

unint64_t sub_2380BA91C()
{
  unint64_t result;

  result = qword_2568C9A38;
  if (!qword_2568C9A38)
  {
    result = MEMORY[0x23B82B770](&unk_2380C76D0, &type metadata for Proto_HashAlg);
    atomic_store(result, (unint64_t *)&qword_2568C9A38);
  }
  return result;
}

unint64_t sub_2380BA960()
{
  unint64_t result;

  result = qword_2568C9A40;
  if (!qword_2568C9A40)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7620, &type metadata for Proto_SealedHash.Entry.Flags);
    atomic_store(result, (unint64_t *)&qword_2568C9A40);
  }
  return result;
}

id SWTransparencyVerifier.init()@<X0>(_QWORD *a1@<X8>)
{
  id result;

  if (MEMORY[0x24BEBA830])
    result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBA830]), sel_initWithApplication_, 0);
  else
    result = 0;
  *a1 = result;
  return result;
}

uint64_t SWTransparencyVerifier.verifyInclusion(of:proofs:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = sub_2380BD418();
  v3[3] = v6;
  v3[4] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v3[5] = v7;
  v3[2] = *v2;
  v8 = (_QWORD *)swift_task_alloc();
  v3[6] = v8;
  *v8 = v3;
  v8[1] = sub_2380BAA90;
  return SWTransparencyVerifier.verifyExpiringInclusion(of:proofs:)(v7, a1, a2);
}

uint64_t sub_2380BAA90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[4] + 8))(v2[5], v2[3]);
  return swift_task_switch();
}

uint64_t sub_2380BAB04()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380BAB38()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380BAB6C()
{
  uint64_t v0;

  v0 = sub_2380BD808();
  __swift_allocate_value_buffer(v0, qword_2568CA198);
  __swift_project_value_buffer(v0, (uint64_t)qword_2568CA198);
  return sub_2380BD7FC();
}

uint64_t SWTransparencyVerifier.verifyExpiringInclusion(of:proofs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[31] = a2;
  v4[32] = a3;
  v4[30] = a1;
  v5 = sub_2380BD418();
  v4[33] = v5;
  v4[34] = *(_QWORD *)(v5 - 8);
  v4[35] = swift_task_alloc();
  v6 = sub_2380BD844();
  v4[36] = v6;
  v4[37] = *(_QWORD *)(v6 - 8);
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  v4[41] = type metadata accessor for Release();
  v4[42] = swift_task_alloc();
  v4[43] = swift_task_alloc();
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  v7 = sub_2380BDBF8();
  v4[46] = v7;
  v4[47] = *(_QWORD *)(v7 - 8);
  v8 = swift_task_alloc();
  v9 = *v3;
  v4[48] = v8;
  v4[49] = v9;
  return swift_task_switch();
}

uint64_t sub_2380BAD0C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v1 = *(void **)(v0 + 392);
  if (v1)
  {
    type metadata accessor for ATLogProofs(0);
    sub_238001820((unint64_t *)&qword_2568C55B8, type metadata accessor for ATLogProofs, (uint64_t)&unk_2380BF3A8);
    v2 = v1;
    v3 = sub_2380BD70C();
    v5 = v4;
    v6 = sub_2380BD358();
    *(_QWORD *)(v0 + 400) = v6;
    sub_237FFBAB0(v3, v5);
    sub_2380BDBEC();
    sub_238001820(&qword_2568C61E0, (uint64_t (*)(uint64_t))type metadata accessor for Release, (uint64_t)&protocol conformance descriptor for Release);
    sub_2380BDBE0();
    v8 = *(_QWORD *)(v0 + 376);
    v7 = *(_QWORD *)(v0 + 384);
    v9 = *(_QWORD *)(v0 + 368);
    v10 = sub_2380BDBC8();
    v11 = sub_23800A2B8(v10);
    v13 = v12;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v14 = sub_2380BD358();
    *(_QWORD *)(v0 + 408) = v14;
    sub_237FFBAB0(v11, v13);
    *(_QWORD *)(v0 + 56) = v0 + 216;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_2380BB4E4;
    v15 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v16 = (_QWORD *)(v0 + 80);
    v16[1] = 0x40000000;
    v16[2] = sub_2380BCBE4;
    v16[3] = &block_descriptor;
    v16[4] = v15;
    objc_msgSend(v2, sel_verifyExpiringProofs_for_completion_, v6, v14, v16);
    return swift_continuation_await();
  }
  else
  {
    sub_2380BCDE0();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2380BB4E4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 416) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2380BB544()
{
  uint64_t v0;
  os_log_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  os_log_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  objc_class *v53;
  char v54;
  void *v55;
  id v56;
  uint64_t (*v57)(void);
  objc_class *v58;
  os_log_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  _QWORD *v70;
  NSObject *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  NSObject *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  _QWORD *v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  _QWORD *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  os_log_type_t v108;
  uint64_t v109;
  uint8_t *v110;
  os_log_type_t v111;
  NSObject *log;
  os_log_t loga;
  os_log_t v114;
  NSObject *v115;
  NSObject *v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;

  v1 = (os_log_t)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(void **)(v0 + 400);

  v4 = objc_msgSend((id)v2, sel_result);
  if (v4)
  {
    v5 = (os_log_t)(v0 + 184);
    if (v4 == (id)1)
    {
      if (qword_2568C5160 != -1)
        goto LABEL_74;
      while (1)
      {
        v6 = *(_QWORD *)(v0 + 360);
        v7 = *(_QWORD *)(v0 + 248);
        v8 = sub_2380BD808();
        __swift_project_value_buffer(v8, (uint64_t)qword_2568CA198);
        sub_2380BCE60(v7, v6);
        v9 = sub_2380BD7F0();
        v10 = sub_2380BDF64();
        v11 = os_log_type_enabled(v9, v10);
        v12 = *(_QWORD *)(v0 + 360);
        if (!v11)
          break;
        v108 = v10;
        log = v9;
        v114 = v5;
        v116 = v1;
        v117 = (_QWORD *)v2;
        v13 = *(_QWORD *)(v0 + 352);
        v2 = *(_QWORD *)(v0 + 312);
        v14 = *(_QWORD *)(v0 + 320);
        v16 = *(_QWORD *)(v0 + 288);
        v15 = *(_QWORD *)(v0 + 296);
        v17 = (uint8_t *)swift_slowAlloc();
        v106 = swift_slowAlloc();
        v123 = v106;
        v110 = v17;
        *(_DWORD *)v17 = 136446210;
        sub_2380BCE60(v12, v13);
        sub_2380BE048();
        swift_bridgeObjectRelease();
        v124 = 0xD000000000000010;
        v125 = 0x80000002380C83D0;
        sub_238028F5C(v14);
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 16))(v2, v14, v16);
        sub_238001820(&qword_2568C6230, (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0], MEMORY[0x24BDC6300]);
        sub_2380BDE08();
        v18 = *(_QWORD *)(v0 + 120);
        v5 = *(os_log_t *)(v0 + 128);
        v1 = *(os_log_t *)(v18 + 16);
        if (v5 == v1)
        {
          v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_7:
          v1 = v116;
          v20 = *(_QWORD *)(v0 + 352);
          v121 = *(_QWORD *)(v0 + 360);
          v21 = *(_QWORD *)(v0 + 320);
          v23 = *(_QWORD *)(v0 + 288);
          v22 = *(_QWORD *)(v0 + 296);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
          *(_QWORD *)(v0 + 224) = v19;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E60);
          sub_23804390C();
          sub_2380BDCD0();
          swift_bridgeObjectRelease();
          sub_2380BDD90();
          swift_bridgeObjectRelease();
          sub_2380BDD90();
          sub_2380BCEA4(v20);
          *(_QWORD *)(v0 + 232) = sub_238013968(v124, v125, &v123);
          sub_2380BDF94();
          swift_bridgeObjectRelease();
          sub_2380BCEA4(v121);
          _os_log_impl(&dword_237FF6000, log, v108, "Invalid transparency proof for: %{public}s", v110, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B82B830](v106, -1, -1);
          MEMORY[0x23B82B830](v110, -1, -1);

          v2 = (unint64_t)v117;
          v5 = v114;
          goto LABEL_19;
        }
        if ((uint64_t)v5 >= (uint64_t)v1)
        {
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
          goto LABEL_77;
        }
        if (((unint64_t)v5 & 0x8000000000000000) != 0)
          goto LABEL_75;
        v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v120 = 1;
        while ((unint64_t)v5 < *(_QWORD *)(v18 + 16))
        {
          v85 = *((_BYTE *)&v5[4].isa + v18);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5C40);
          v86 = swift_allocObject();
          *(_OWORD *)(v86 + 16) = xmmword_2380BEAC0;
          *(_QWORD *)(v86 + 56) = MEMORY[0x24BEE4260];
          *(_QWORD *)(v86 + 64) = MEMORY[0x24BEE42B0];
          *(_BYTE *)(v86 + 32) = v85;
          v87 = sub_2380BDD30();
          v89 = v88;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v19 = sub_2380267E8(0, v19[2] + 1, 1, v19);
          v2 = v19[2];
          v90 = v19[3];
          if (v2 >= v90 >> 1)
            v19 = sub_2380267E8((_QWORD *)(v90 > 1), v2 + 1, 1, v19);
          v5 = (os_log_t)((char *)v5 + 1);
          v19[2] = v2 + 1;
          v91 = &v19[2 * v2];
          v91[4] = v87;
          v91[5] = v89;
          if (v1 == v5)
            goto LABEL_7;
        }
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        swift_once();
      }
      sub_2380BCEA4(*(_QWORD *)(v0 + 360));

LABEL_19:
      sub_23801F828();
      v53 = (objc_class *)swift_allocError();
      *(_QWORD *)v52 = 4;
      v54 = 0x80;
      goto LABEL_24;
    }
    if (qword_2568C5160 != -1)
      swift_once();
    v47 = sub_2380BD808();
    __swift_project_value_buffer(v47, (uint64_t)qword_2568CA198);
    v48 = (id)v2;
    v49 = sub_2380BD7F0();
    v50 = sub_2380BDF64();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v51 = 134349056;
      *(_QWORD *)(v0 + 176) = objc_msgSend(v48, sel_result);
      v5 = (os_log_t)(v0 + 184);
      sub_2380BDF94();

      _os_log_impl(&dword_237FF6000, v49, v50, "Unknown transparency proof validation result: %{public}lu", v51, 0xCu);
      MEMORY[0x23B82B830](v51, -1, -1);
    }
    else
    {

    }
    sub_23801F828();
    v53 = (objc_class *)swift_allocError();
    *(_QWORD *)v52 = 0;
    v54 = 33;
LABEL_24:
    *(_BYTE *)(v52 + 8) = v54;
    swift_willThrow();

    v5->isa = v53;
    v58 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
    sub_2380BCE24();
    if (!swift_dynamicCast())
      goto LABEL_43;
    v59 = v1;
    v120 = (uint64_t)&v1[-7];
    v1 = v1[-6].isa;
    v60 = -[NSObject domain](v1, sel_domain);
    v61 = sub_2380BDD00();
    v63 = v62;

    if (v61 == 0xD00000000000001CLL && v63 == 0x80000002380C9A20)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v64 = sub_2380BE1B0();
      swift_bridgeObjectRelease();
      if ((v64 & 1) == 0)
        goto LABEL_34;
    }
    if (-[NSObject code](v1, sel_code) == (id)5)
    {

      if (qword_2568C5160 != -1)
        swift_once();
      v65 = sub_2380BD808();
      __swift_project_value_buffer(v65, (uint64_t)qword_2568CA198);
      v66 = v1;
      v67 = sub_2380BD7F0();
      v68 = sub_2380BDF64();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc();
        v70 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v69 = 138412290;
        v59[-8].isa = (Class)v66;
        v71 = v66;
        sub_2380BDF94();
        *v70 = v66;

        _os_log_impl(&dword_237FF6000, v67, v68, "Inclusion proof has expired: %@", v69, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E08);
        swift_arrayDestroy();
        MEMORY[0x23B82B830](v70, -1, -1);
        MEMORY[0x23B82B830](v69, -1, -1);
      }
      else
      {

        v67 = v66;
      }
      v99 = *(void **)(v0 + 392);

      sub_23801F828();
      swift_allocError();
      *(_QWORD *)v100 = 6;
      *(_BYTE *)(v100 + 8) = 0x80;
      swift_willThrow();

      goto LABEL_69;
    }
LABEL_34:

    v72 = -[NSObject domain](v1, sel_domain);
    v73 = sub_2380BDD00();
    v75 = v74;

    if (v73 == 0xD00000000000001DLL && v75 == 0x80000002380C9A40)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v76 = sub_2380BE1B0();
      swift_bridgeObjectRelease();
      if ((v76 & 1) == 0)
      {
LABEL_42:

LABEL_43:
        v83 = *(void **)(v0 + 392);

        sub_23801F828();
        swift_allocError();
        *(_QWORD *)v84 = v53;
        *(_BYTE *)(v84 + 8) = 64;
        swift_willThrow();

LABEL_70:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v57 = *(uint64_t (**)(void))(v0 + 8);
        return v57();
      }
    }
    if (-[NSObject code](v1, sel_code) == (id)7)
    {

      if (qword_2568C5160 == -1)
      {
LABEL_40:
        v77 = sub_2380BD808();
        __swift_project_value_buffer(v77, (uint64_t)qword_2568CA198);
        v78 = v1;
        v79 = sub_2380BD7F0();
        v80 = sub_2380BDF64();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = (uint8_t *)swift_slowAlloc();
          v119 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v81 = 138412290;
          *(_QWORD *)v120 = v78;
          v82 = v78;
          sub_2380BDF94();
          *v119 = v78;

          _os_log_impl(&dword_237FF6000, v79, v80, "Inclusion proof verification failed: %@", v81, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E08);
          swift_arrayDestroy();
          MEMORY[0x23B82B830](v119, -1, -1);
          MEMORY[0x23B82B830](v81, -1, -1);
        }
        else
        {

          v79 = v78;
        }
        v101 = *(void **)(v0 + 392);

        sub_23801F828();
        swift_allocError();
        *(_QWORD *)v102 = 4;
        *(_BYTE *)(v102 + 8) = 0x80;
        swift_willThrow();

LABEL_69:
        goto LABEL_70;
      }
LABEL_78:
      swift_once();
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  if (qword_2568C5160 != -1)
    swift_once();
  v24 = *(_QWORD *)(v0 + 344);
  v25 = *(_QWORD *)(v0 + 248);
  v26 = sub_2380BD808();
  __swift_project_value_buffer(v26, (uint64_t)qword_2568CA198);
  sub_2380BCE60(v25, v24);
  v118 = (id)v2;
  v27 = sub_2380BD7F0();
  v28 = sub_2380BDF4C();
  v29 = os_log_type_enabled(v27, v28);
  v30 = *(_QWORD *)(v0 + 344);
  if (v29)
  {
    v111 = v28;
    v115 = v27;
    v1 = (os_log_t)(v0 + 136);
    v31 = *(_QWORD *)(v0 + 336);
    v33 = *(_QWORD *)(v0 + 304);
    v32 = *(_QWORD *)(v0 + 312);
    v35 = *(_QWORD *)(v0 + 288);
    v34 = *(_QWORD *)(v0 + 296);
    v36 = swift_slowAlloc();
    v109 = swift_slowAlloc();
    v123 = v109;
    loga = v36;
    LODWORD(v36->isa) = 136446466;
    sub_2380BCE60(v30, v31);
    sub_2380BE048();
    swift_bridgeObjectRelease();
    v124 = 0xD000000000000010;
    v125 = 0x80000002380C83D0;
    sub_238028F5C(v33);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v33, v35);
    sub_238001820(&qword_2568C6230, (uint64_t (*)(uint64_t))MEMORY[0x24BDC62F0], MEMORY[0x24BDC6300]);
    sub_2380BDE08();
    v37 = *(_QWORD *)(v0 + 136);
    v38 = *(_QWORD *)(v0 + 144);
    v5 = *(os_log_t *)(v37 + 16);
    if ((os_log_t)v38 == v5)
    {
      v2 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      if (v38 >= (uint64_t)v5)
        goto LABEL_76;
      if (v38 < 0)
      {
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
      v2 = MEMORY[0x24BEE4AF8];
      v120 = 1;
      do
      {
        if ((unint64_t)v38 >= *(_QWORD *)(v37 + 16))
          goto LABEL_73;
        v92 = *(_BYTE *)(v37 + 32 + v38);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5C40);
        v93 = swift_allocObject();
        *(_OWORD *)(v93 + 16) = xmmword_2380BEAC0;
        *(_QWORD *)(v93 + 56) = MEMORY[0x24BEE4260];
        *(_QWORD *)(v93 + 64) = MEMORY[0x24BEE42B0];
        *(_BYTE *)(v93 + 32) = v92;
        v1 = (os_log_t)sub_2380BDD30();
        v95 = v94;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v2 = (unint64_t)sub_2380267E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (_QWORD *)v2);
        v97 = *(_QWORD *)(v2 + 16);
        v96 = *(_QWORD *)(v2 + 24);
        if (v97 >= v96 >> 1)
          v2 = (unint64_t)sub_2380267E8((_QWORD *)(v96 > 1), v97 + 1, 1, (_QWORD *)v2);
        ++v38;
        *(_QWORD *)(v2 + 16) = v97 + 1;
        v98 = (_QWORD *)(v2 + 16 * v97);
        v98[4] = v1;
        v98[5] = v95;
      }
      while (v5 != (os_log_t)v38);
    }
    v104 = *(_QWORD *)(v0 + 336);
    v39 = *(_QWORD *)(v0 + 296);
    v40 = *(_QWORD *)(v0 + 304);
    v42 = *(_QWORD *)(v0 + 280);
    v41 = *(_QWORD *)(v0 + 288);
    v122 = *(_QWORD *)(v0 + 272);
    v105 = *(_QWORD *)(v0 + 344);
    v107 = *(_QWORD *)(v0 + 264);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v41);
    *(_QWORD *)(v0 + 192) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E60);
    sub_23804390C();
    sub_2380BDCD0();
    swift_bridgeObjectRelease();
    sub_2380BDD90();
    swift_bridgeObjectRelease();
    sub_2380BDD90();
    sub_2380BCEA4(v104);
    *(_QWORD *)(v0 + 200) = sub_238013968(v124, v125, &v123);
    sub_2380BDF94();
    swift_bridgeObjectRelease();
    sub_2380BCEA4(v105);
    WORD2(loga[1].isa) = 2082;
    v43 = objc_msgSend(v118, sel_expiry);
    sub_2380BD400();

    sub_238001820(&qword_2568C5C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v44 = sub_2380BE1A4();
    v46 = v45;
    (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v42, v107);
    *(_QWORD *)(v0 + 208) = sub_238013968(v44, v46, &v123);
    sub_2380BDF94();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237FF6000, v115, v111, "Valid transparency proof for: %{public}s (expires %{public}s", (uint8_t *)loga, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B82B830](v109, -1, -1);
    MEMORY[0x23B82B830](loga, -1, -1);

  }
  else
  {
    sub_2380BCEA4(*(_QWORD *)(v0 + 344));

  }
  v55 = *(void **)(v0 + 392);
  v56 = objc_msgSend(v118, sel_expiry, v104);
  sub_2380BD400();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v57 = *(uint64_t (**)(void))(v0 + 8);
  return v57();
}

uint64_t sub_2380BC628()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v34;

  v1 = *(void **)(v0 + 408);
  v2 = *(void **)(v0 + 400);
  swift_willThrow();

  v3 = *(void **)(v0 + 416);
  *(_QWORD *)(v0 + 184) = v3;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
  sub_2380BCE24();
  if (!swift_dynamicCast())
    goto LABEL_21;
  v5 = *(id *)(v0 + 168);
  v6 = objc_msgSend(v5, sel_domain);
  v7 = sub_2380BDD00();
  v9 = v8;

  if (v7 == 0xD00000000000001CLL && v9 == 0x80000002380C9A20)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_2380BE1B0();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      goto LABEL_11;
  }
  if (objc_msgSend(v5, sel_code) == (id)5)
  {

    if (qword_2568C5160 != -1)
      swift_once();
    v11 = sub_2380BD808();
    __swift_project_value_buffer(v11, (uint64_t)qword_2568CA198);
    v12 = v5;
    v13 = sub_2380BD7F0();
    v14 = sub_2380BDF64();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)(v0 + 152) = v12;
      v17 = v12;
      sub_2380BDF94();
      *v16 = v12;

      _os_log_impl(&dword_237FF6000, v13, v14, "Inclusion proof has expired: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E08);
      swift_arrayDestroy();
      MEMORY[0x23B82B830](v16, -1, -1);
      MEMORY[0x23B82B830](v15, -1, -1);
    }
    else
    {

      v13 = v12;
    }
    v30 = *(void **)(v0 + 392);

    sub_23801F828();
    swift_allocError();
    v32 = 6;
LABEL_26:
    *(_QWORD *)v31 = v32;
    *(_BYTE *)(v31 + 8) = 0x80;
    swift_willThrow();

    goto LABEL_27;
  }
LABEL_11:

  v18 = objc_msgSend(v5, sel_domain);
  v19 = sub_2380BDD00();
  v21 = v20;

  if (v19 == 0xD00000000000001DLL && v21 == 0x80000002380C9A40)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v22 = sub_2380BE1B0();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
  {
LABEL_15:
    if (objc_msgSend(v5, sel_code) == (id)7)
    {

      if (qword_2568C5160 != -1)
        swift_once();
      v23 = sub_2380BD808();
      __swift_project_value_buffer(v23, (uint64_t)qword_2568CA198);
      v12 = v5;
      v24 = sub_2380BD7F0();
      v25 = sub_2380BDF64();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v34 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v26 = 138412290;
        *(_QWORD *)(v0 + 160) = v12;
        v27 = v12;
        sub_2380BDF94();
        *v34 = v12;

        _os_log_impl(&dword_237FF6000, v24, v25, "Inclusion proof verification failed: %@", v26, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5E08);
        swift_arrayDestroy();
        MEMORY[0x23B82B830](v34, -1, -1);
        MEMORY[0x23B82B830](v26, -1, -1);
      }
      else
      {

        v24 = v12;
      }
      v30 = *(void **)(v0 + 392);

      sub_23801F828();
      swift_allocError();
      v32 = 4;
      goto LABEL_26;
    }
  }

LABEL_21:
  v28 = *(void **)(v0 + 392);

  sub_23801F828();
  swift_allocError();
  *(_QWORD *)v29 = v3;
  *(_BYTE *)(v29 + 8) = 64;
  swift_willThrow();

LABEL_27:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2380BCBE4(uint64_t a1, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v7;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568C5B60);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    v7 = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2380BCC68(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = sub_2380BD418();
  v3[3] = v6;
  v3[4] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v3[5] = v7;
  v3[2] = *v2;
  v8 = (_QWORD *)swift_task_alloc();
  v3[6] = v8;
  *v8 = v3;
  v8[1] = sub_2380BCD04;
  return SWTransparencyVerifier.verifyExpiringInclusion(of:proofs:)(v7, a1, a2);
}

uint64_t sub_2380BCD04()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[4] + 8))(v2[5], v2[3]);
  return swift_task_switch();
}

uint64_t sub_2380BCD78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_238013814;
  return SWTransparencyVerifier.verifyExpiringInclusion(of:proofs:)(a1, a2, a3);
}

unint64_t sub_2380BCDE0()
{
  unint64_t result;

  result = qword_2568C9A58;
  if (!qword_2568C9A58)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7868, &_s5ErrorON_0);
    atomic_store(result, (unint64_t *)&qword_2568C9A58);
  }
  return result;
}

unint64_t sub_2380BCE24()
{
  unint64_t result;

  result = qword_2568C9A60;
  if (!qword_2568C9A60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568C9A60);
  }
  return result;
}

uint64_t sub_2380BCE60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2380BCEA4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void **initializeBufferWithCopyOfBuffer for SWTransparencyVerifier(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void **assignWithCopy for SWTransparencyVerifier(void **a1, void **a2)
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

void **assignWithTake for SWTransparencyVerifier(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for SWTransparencyVerifier(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SWTransparencyVerifier(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for SWTransparencyVerifier()
{
  return &type metadata for SWTransparencyVerifier;
}

uint64_t _s5ErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2380BD078 + 4 * asc_2380C77A8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2380BD098 + 4 * byte_2380C77AD[v4]))();
}

_BYTE *sub_2380BD078(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2380BD098(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2380BD0A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2380BD0A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2380BD0B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2380BD0B8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s5ErrorOMa_0()
{
  return &_s5ErrorON_0;
}

unint64_t sub_2380BD0D8()
{
  return 0xD00000000000002ELL;
}

unint64_t sub_2380BD0F8()
{
  unint64_t result;

  result = qword_2568C9A78;
  if (!qword_2568C9A78)
  {
    result = MEMORY[0x23B82B770](&unk_2380C7840, &_s5ErrorON_0);
    atomic_store(result, (unint64_t *)&qword_2568C9A78);
  }
  return result;
}

uint64_t sub_2380BD13C()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_2380BD148()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_2380BD154()
{
  return MEMORY[0x24BDCB0A8]();
}

uint64_t sub_2380BD160()
{
  return MEMORY[0x24BDCB0B0]();
}

uint64_t sub_2380BD16C()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_2380BD178()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2380BD184()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2380BD190()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2380BD19C()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t sub_2380BD1A8()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_2380BD1B4()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_2380BD1C0()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_2380BD1CC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2380BD1D8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2380BD1E4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2380BD1F0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2380BD1FC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2380BD208()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2380BD214()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2380BD220()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2380BD22C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2380BD238()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2380BD244()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2380BD250()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2380BD25C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2380BD268()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_2380BD274()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2380BD280()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2380BD28C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2380BD298()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2380BD2A4()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2380BD2B0()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_2380BD2BC()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_2380BD2C8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2380BD2D4()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2380BD2E0()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_2380BD2EC()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_2380BD2F8()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_2380BD304()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_2380BD310()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2380BD31C()
{
  return MEMORY[0x24BDCDC20]();
}

uint64_t sub_2380BD328()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_2380BD334()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_2380BD340()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_2380BD34C()
{
  return MEMORY[0x24BDCDC80]();
}

uint64_t sub_2380BD358()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2380BD364()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_2380BD370()
{
  return MEMORY[0x24BDCDCD8]();
}

uint64_t sub_2380BD37C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2380BD388()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_2380BD394()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_2380BD3A0()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_2380BD3AC()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t sub_2380BD3B8()
{
  return MEMORY[0x24BDCDE68]();
}

uint64_t sub_2380BD3C4()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_2380BD3D0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2380BD3DC()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_2380BD3E8()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_2380BD3F4()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_2380BD400()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2380BD40C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2380BD418()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2380BD424()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2380BD430()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2380BD43C()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_2380BD448()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2380BD454()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2380BD460()
{
  return MEMORY[0x24BE07828]();
}

uint64_t sub_2380BD46C()
{
  return MEMORY[0x24BE07830]();
}

uint64_t sub_2380BD478()
{
  return MEMORY[0x24BE07840]();
}

uint64_t sub_2380BD484()
{
  return MEMORY[0x24BE07848]();
}

uint64_t sub_2380BD490()
{
  return MEMORY[0x24BE07850]();
}

uint64_t sub_2380BD49C()
{
  return MEMORY[0x24BE07858]();
}

uint64_t sub_2380BD4A8()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_2380BD4B4()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_2380BD4C0()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_2380BD4CC()
{
  return MEMORY[0x24BDE8328]();
}

uint64_t sub_2380BD4D8()
{
  return MEMORY[0x24BDE8330]();
}

uint64_t sub_2380BD4E4()
{
  return MEMORY[0x24BDE8338]();
}

uint64_t sub_2380BD4F0()
{
  return MEMORY[0x24BDE8368]();
}

uint64_t sub_2380BD4FC()
{
  return MEMORY[0x24BDE8370]();
}

uint64_t sub_2380BD508()
{
  return MEMORY[0x24BDE8378]();
}

uint64_t sub_2380BD514()
{
  return MEMORY[0x24BDE8380]();
}

uint64_t sub_2380BD520()
{
  return MEMORY[0x24BDE83A0]();
}

uint64_t sub_2380BD52C()
{
  return MEMORY[0x24BDE83A8]();
}

uint64_t sub_2380BD538()
{
  return MEMORY[0x24BDE83B0]();
}

uint64_t sub_2380BD544()
{
  return MEMORY[0x24BDE83C0]();
}

uint64_t sub_2380BD550()
{
  return MEMORY[0x24BECE048]();
}

uint64_t sub_2380BD55C()
{
  return MEMORY[0x24BECE050]();
}

uint64_t sub_2380BD568()
{
  return MEMORY[0x24BECE058]();
}

uint64_t sub_2380BD574()
{
  return MEMORY[0x24BE5B970]();
}

uint64_t sub_2380BD580()
{
  return MEMORY[0x24BE5B978]();
}

uint64_t sub_2380BD58C()
{
  return MEMORY[0x24BE5B988]();
}

uint64_t sub_2380BD598()
{
  return MEMORY[0x24BE5B990]();
}

uint64_t sub_2380BD5A4()
{
  return MEMORY[0x24BE5BEC0]();
}

uint64_t sub_2380BD5B0()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_2380BD5BC()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_2380BD5C8()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_2380BD5D4()
{
  return MEMORY[0x24BE5BF90]();
}

uint64_t sub_2380BD5E0()
{
  return MEMORY[0x24BE5BF98]();
}

uint64_t sub_2380BD5EC()
{
  return MEMORY[0x24BE5BFA8]();
}

uint64_t sub_2380BD5F8()
{
  return MEMORY[0x24BE5BFB0]();
}

uint64_t sub_2380BD604()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_2380BD610()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_2380BD61C()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_2380BD628()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_2380BD634()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_2380BD640()
{
  return MEMORY[0x24BE5C028]();
}

uint64_t sub_2380BD64C()
{
  return MEMORY[0x24BE5C030]();
}

uint64_t sub_2380BD658()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_2380BD664()
{
  return MEMORY[0x24BE5C048]();
}

uint64_t sub_2380BD670()
{
  return MEMORY[0x24BE5C058]();
}

uint64_t sub_2380BD67C()
{
  return MEMORY[0x24BE5C068]();
}

uint64_t sub_2380BD688()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_2380BD694()
{
  return MEMORY[0x24BE5C080]();
}

uint64_t sub_2380BD6A0()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t sub_2380BD6AC()
{
  return MEMORY[0x24BE5C0C8]();
}

uint64_t sub_2380BD6B8()
{
  return MEMORY[0x24BE5C140]();
}

uint64_t sub_2380BD6C4()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_2380BD6D0()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_2380BD6DC()
{
  return MEMORY[0x24BE5C188]();
}

uint64_t sub_2380BD6E8()
{
  return MEMORY[0x24BE5C190]();
}

uint64_t sub_2380BD6F4()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_2380BD700()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_2380BD70C()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_2380BD718()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_2380BD724()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_2380BD730()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_2380BD73C()
{
  return MEMORY[0x24BE5C210]();
}

uint64_t sub_2380BD748()
{
  return MEMORY[0x24BE5C218]();
}

uint64_t sub_2380BD754()
{
  return MEMORY[0x24BE5C230]();
}

uint64_t sub_2380BD760()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_2380BD76C()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_2380BD778()
{
  return MEMORY[0x24BE5C280]();
}

uint64_t sub_2380BD784()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_2380BD790()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_2380BD79C()
{
  return MEMORY[0x24BE5C2F8]();
}

uint64_t sub_2380BD7A8()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_2380BD7B4()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_2380BD7C0()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_2380BD7CC()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_2380BD7D8()
{
  return MEMORY[0x24BE5C348]();
}

uint64_t sub_2380BD7E4()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_2380BD7F0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2380BD7FC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2380BD808()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2380BD814()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_2380BD820()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_2380BD82C()
{
  return MEMORY[0x24BDC62B8]();
}

uint64_t sub_2380BD838()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_2380BD844()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_2380BD850()
{
  return MEMORY[0x24BDC6318]();
}

uint64_t sub_2380BD85C()
{
  return MEMORY[0x24BDC6320]();
}

uint64_t sub_2380BD868()
{
  return MEMORY[0x24BDC63A0]();
}

uint64_t sub_2380BD874()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_2380BD880()
{
  return MEMORY[0x24BDC63C0]();
}

uint64_t sub_2380BD88C()
{
  return MEMORY[0x24BDC63D0]();
}

uint64_t sub_2380BD898()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_2380BD8A4()
{
  return MEMORY[0x24BE2A3F8]();
}

uint64_t sub_2380BD8B0()
{
  return MEMORY[0x24BDC6480]();
}

uint64_t sub_2380BD8BC()
{
  return MEMORY[0x24BDC6500]();
}

uint64_t sub_2380BD8C8()
{
  return MEMORY[0x24BDC6510]();
}

uint64_t sub_2380BD8D4()
{
  return MEMORY[0x24BDC6718]();
}

uint64_t sub_2380BD8E0()
{
  return MEMORY[0x24BDC6740]();
}

uint64_t sub_2380BD8EC()
{
  return MEMORY[0x24BDC67A0]();
}

uint64_t sub_2380BD8F8()
{
  return MEMORY[0x24BDC67B8]();
}

uint64_t sub_2380BD904()
{
  return MEMORY[0x24BDC67D0]();
}

uint64_t sub_2380BD910()
{
  return MEMORY[0x24BDC67E0]();
}

uint64_t sub_2380BD91C()
{
  return MEMORY[0x24BDC6808]();
}

uint64_t sub_2380BD928()
{
  return MEMORY[0x24BDC6830]();
}

uint64_t sub_2380BD934()
{
  return MEMORY[0x24BDC6840]();
}

uint64_t sub_2380BD940()
{
  return MEMORY[0x24BDC6898]();
}

uint64_t sub_2380BD94C()
{
  return MEMORY[0x24BDC68D0]();
}

uint64_t sub_2380BD958()
{
  return MEMORY[0x24BDC6920]();
}

uint64_t sub_2380BD964()
{
  return MEMORY[0x24BDC6930]();
}

uint64_t sub_2380BD970()
{
  return MEMORY[0x24BDC6960]();
}

uint64_t sub_2380BD97C()
{
  return MEMORY[0x24BDC6968]();
}

uint64_t sub_2380BD988()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_2380BD994()
{
  return MEMORY[0x24BDC6B08]();
}

uint64_t sub_2380BD9A0()
{
  return MEMORY[0x24BDC6B18]();
}

uint64_t sub_2380BD9AC()
{
  return MEMORY[0x24BDC6B20]();
}

uint64_t sub_2380BD9B8()
{
  return MEMORY[0x24BEB2EE8]();
}

uint64_t sub_2380BD9C4()
{
  return MEMORY[0x24BEB2EF0]();
}

uint64_t sub_2380BD9D0()
{
  return MEMORY[0x24BEB2EF8]();
}

uint64_t sub_2380BD9DC()
{
  return MEMORY[0x24BEB2F00]();
}

uint64_t sub_2380BD9E8()
{
  return MEMORY[0x24BEB2F08]();
}

uint64_t sub_2380BD9F4()
{
  return MEMORY[0x24BEB2F10]();
}

uint64_t sub_2380BDA00()
{
  return MEMORY[0x24BEB2F20]();
}

uint64_t _s16CloudAttestation7ReleaseV17defaultIdentifier9SwiftASN10gE0VvgZ_0()
{
  return MEMORY[0x24BEB2F28]();
}

uint64_t sub_2380BDA18()
{
  return MEMORY[0x24BEB2F30]();
}

uint64_t sub_2380BDA24()
{
  return MEMORY[0x24BEB2F38]();
}

uint64_t sub_2380BDA30()
{
  return MEMORY[0x24BEB2F40]();
}

uint64_t sub_2380BDA3C()
{
  return MEMORY[0x24BEB2F50]();
}

uint64_t sub_2380BDA48()
{
  return MEMORY[0x24BEB2F58]();
}

uint64_t sub_2380BDA54()
{
  return MEMORY[0x24BEB2F60]();
}

uint64_t sub_2380BDA60()
{
  return MEMORY[0x24BEB2F80]();
}

uint64_t sub_2380BDA6C()
{
  return MEMORY[0x24BEB2FA0]();
}

uint64_t sub_2380BDA78()
{
  return MEMORY[0x24BEB2FA8]();
}

uint64_t sub_2380BDA84()
{
  return MEMORY[0x24BEB2FB0]();
}

uint64_t sub_2380BDA90()
{
  return MEMORY[0x24BEB2FB8]();
}

uint64_t sub_2380BDA9C()
{
  return MEMORY[0x24BEB2FC0]();
}

uint64_t sub_2380BDAA8()
{
  return MEMORY[0x24BEB2FC8]();
}

uint64_t sub_2380BDAB4()
{
  return MEMORY[0x24BEB2FD0]();
}

uint64_t sub_2380BDAC0()
{
  return MEMORY[0x24BEB2FD8]();
}

uint64_t sub_2380BDACC()
{
  return MEMORY[0x24BEB2FE8]();
}

uint64_t sub_2380BDAD8()
{
  return MEMORY[0x24BEB2FF8]();
}

uint64_t sub_2380BDAE4()
{
  return MEMORY[0x24BEB3008]();
}

uint64_t sub_2380BDAF0()
{
  return MEMORY[0x24BEB3010]();
}

uint64_t sub_2380BDAFC()
{
  return MEMORY[0x24BEB3018]();
}

uint64_t sub_2380BDB08()
{
  return MEMORY[0x24BEB3028]();
}

uint64_t sub_2380BDB14()
{
  return MEMORY[0x24BEB3030]();
}

uint64_t sub_2380BDB20()
{
  return MEMORY[0x24BEB3038]();
}

uint64_t sub_2380BDB2C()
{
  return MEMORY[0x24BEB3050]();
}

uint64_t sub_2380BDB38()
{
  return MEMORY[0x24BEB3058]();
}

uint64_t sub_2380BDB44()
{
  return MEMORY[0x24BEB3060]();
}

uint64_t sub_2380BDB50()
{
  return MEMORY[0x24BEB3070]();
}

uint64_t sub_2380BDB5C()
{
  return MEMORY[0x24BEB3080]();
}

uint64_t sub_2380BDB68()
{
  return MEMORY[0x24BEB3088]();
}

uint64_t sub_2380BDB74()
{
  return MEMORY[0x24BEB3090]();
}

uint64_t sub_2380BDB80()
{
  return MEMORY[0x24BEB3098]();
}

uint64_t sub_2380BDB8C()
{
  return MEMORY[0x24BEB30A0]();
}

uint64_t sub_2380BDB98()
{
  return MEMORY[0x24BEB30A8]();
}

uint64_t sub_2380BDBA4()
{
  return MEMORY[0x24BEB30B0]();
}

uint64_t sub_2380BDBB0()
{
  return MEMORY[0x24BEB30B8]();
}

uint64_t sub_2380BDBBC()
{
  return MEMORY[0x24BEB30C0]();
}

uint64_t sub_2380BDBC8()
{
  return MEMORY[0x24BEB30C8]();
}

uint64_t sub_2380BDBD4()
{
  return MEMORY[0x24BEB30D0]();
}

uint64_t sub_2380BDBE0()
{
  return MEMORY[0x24BEB30D8]();
}

uint64_t sub_2380BDBEC()
{
  return MEMORY[0x24BEB30E0]();
}

uint64_t sub_2380BDBF8()
{
  return MEMORY[0x24BEB30E8]();
}

uint64_t sub_2380BDC04()
{
  return MEMORY[0x24BEB30F0]();
}

uint64_t sub_2380BDC10()
{
  return MEMORY[0x24BEB30F8]();
}

uint64_t sub_2380BDC1C()
{
  return MEMORY[0x24BEB3100]();
}

uint64_t sub_2380BDC28()
{
  return MEMORY[0x24BEB3108]();
}

uint64_t sub_2380BDC34()
{
  return MEMORY[0x24BEB3110]();
}

uint64_t sub_2380BDC40()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2380BDC4C()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_2380BDC58()
{
  return MEMORY[0x24BEE0298]();
}

uint64_t sub_2380BDC64()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2380BDC70()
{
  return MEMORY[0x24BEE02B8]();
}

uint64_t sub_2380BDC7C()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_2380BDC88()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2380BDC94()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2380BDCA0()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2380BDCAC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2380BDCB8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2380BDCC4()
{
  return MEMORY[0x24BEE0678]();
}

uint64_t sub_2380BDCD0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2380BDCDC()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2380BDCE8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2380BDCF4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2380BDD00()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2380BDD0C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2380BDD18()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2380BDD24()
{
  return MEMORY[0x24BDCFA50]();
}

uint64_t sub_2380BDD30()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2380BDD3C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2380BDD48()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2380BDD54()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2380BDD60()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_2380BDD6C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2380BDD78()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2380BDD84()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2380BDD90()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2380BDD9C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2380BDDA8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2380BDDB4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2380BDDC0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2380BDDCC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2380BDDD8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2380BDDE4()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2380BDDF0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2380BDDFC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2380BDE08()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2380BDE14()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_2380BDE20()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2380BDE2C()
{
  return MEMORY[0x24BEE0E80]();
}

uint64_t sub_2380BDE38()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_2380BDE44()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_2380BDE50()
{
  return MEMORY[0x24BEE0F78]();
}

uint64_t sub_2380BDE5C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2380BDE68()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2380BDE74()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2380BDE80()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2380BDE8C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2380BDE98()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2380BDEA4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2380BDEB0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2380BDEBC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2380BDEC8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2380BDED4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2380BDEE0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2380BDEEC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2380BDEF8()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_2380BDF04()
{
  return MEMORY[0x24BEB3118]();
}

uint64_t sub_2380BDF10()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2380BDF1C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2380BDF28()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_2380BDF34()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2380BDF40()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_2380BDF4C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2380BDF58()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2380BDF64()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2380BDF70()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2380BDF7C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2380BDF88()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2380BDF94()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2380BDFA0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2380BDFAC()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2380BDFB8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2380BDFC4()
{
  return MEMORY[0x24BDD0680]();
}

uint64_t sub_2380BDFD0()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_2380BDFDC()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_2380BDFE8()
{
  return MEMORY[0x24BEE2220]();
}

uint64_t sub_2380BDFF4()
{
  return MEMORY[0x24BEE2260]();
}

uint64_t sub_2380BE000()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2380BE00C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2380BE018()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2380BE024()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2380BE030()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2380BE03C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2380BE048()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2380BE054()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2380BE060()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2380BE06C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2380BE078()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2380BE084()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2380BE090()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2380BE09C()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2380BE0A8()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2380BE0B4()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_2380BE0C0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2380BE0CC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2380BE0D8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2380BE0E4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2380BE0F0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2380BE0FC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2380BE108()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2380BE114()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2380BE120()
{
  return MEMORY[0x24BEE30E0]();
}

uint64_t sub_2380BE12C()
{
  return MEMORY[0x24BEE30E8]();
}

uint64_t sub_2380BE138()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2380BE144()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2380BE150()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2380BE15C()
{
  return MEMORY[0x24BEE3468]();
}

uint64_t sub_2380BE168()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_2380BE174()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2380BE180()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2380BE18C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2380BE198()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2380BE1A4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2380BE1B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2380BE1BC()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_2380BE1C8()
{
  return MEMORY[0x24BEE3B10]();
}

uint64_t sub_2380BE1D4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2380BE1E0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2380BE1EC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2380BE1F8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2380BE204()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2380BE210()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2380BE21C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2380BE228()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2380BE234()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2380BE240()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2380BE24C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2380BE258()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2380BE264()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2380BE270()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2380BE27C()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_2380BE288()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2380BE294()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_2380BE2A0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2380BE2AC()
{
  return MEMORY[0x24BEE4A10]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryCopyFromPath(mach_port_t mainPort, CFStringRef path)
{
  return MEMORY[0x24BDD8898](*(_QWORD *)&mainPort, path);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecCertificateCopyExtensionValue()
{
  return MEMORY[0x24BDE8868]();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

uint64_t SecKeyCopySystemKey()
{
  return MEMORY[0x24BDE8AD8]();
}

uint64_t SecKeyCreateAttestation()
{
  return MEMORY[0x24BDE8AE0]();
}

uint64_t SecKeyCreateDuplicate()
{
  return MEMORY[0x24BDE8AF8]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B40](keyData, attributes, error);
}

uint64_t SecKeySetParameter()
{
  return MEMORY[0x24BDE8BA0]();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x24BDE8E30](trust, anchorCertificatesOnly);
}

OSStatus SecTrustSetNetworkFetchAllowed(SecTrustRef trust, Boolean allowFetch)
{
  return MEMORY[0x24BDE8E40](trust, allowFetch);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x24BDE8E60](trust, verifyDate);
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

uint64_t aks_attest_context_get()
{
  return MEMORY[0x24BE078D8]();
}

uint64_t aks_attest_context_get_sealed_hash()
{
  return MEMORY[0x24BE078E0]();
}

uint64_t aks_attest_context_get_uint64()
{
  return MEMORY[0x24BE078E8]();
}

uint64_t aks_attest_context_init()
{
  return MEMORY[0x24BE078F0]();
}

uint64_t aks_attest_context_verify()
{
  return MEMORY[0x24BE07900]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t image4_environment_destroy()
{
  return MEMORY[0x24BEDC3D0]();
}

uint64_t image4_environment_new()
{
  return MEMORY[0x24BEDC3D8]();
}

uint64_t image4_trust_destroy()
{
  return MEMORY[0x24BEDC3E0]();
}

uint64_t image4_trust_evaluate()
{
  return MEMORY[0x24BEDC3E8]();
}

uint64_t image4_trust_new()
{
  return MEMORY[0x24BEDC3F0]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x24BDAF4E8]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

