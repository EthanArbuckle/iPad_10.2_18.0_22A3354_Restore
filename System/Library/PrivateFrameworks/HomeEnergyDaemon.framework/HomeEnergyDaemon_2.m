uint64_t block_destroy_helper_19()
{
  return swift_release();
}

id sub_23E6F6718()
{
  return sub_23E63CD88(6);
}

void sub_23E6F673C()
{
  uint64_t v0;

  sub_23E6EEE88(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(void **)(v0 + 56), *(void **)(v0 + 64), *(_QWORD *)(v0 + 72), *(void ***)(v0 + 80));
}

uint64_t sub_23E6F6770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CE48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E6F67B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_23E7177F8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  sub_23E5DB7D8(*(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8));
  sub_23E5DB7D8(*(_QWORD *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  return swift_deallocObject();
}

void sub_23E6F6870()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_23E7177F8() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23E6F0070(*(void **)(v0 + 16), *(void **)(v0 + 24), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD **)(v0 + v3 + 8), *(NSObject **)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE **)(v0 + ((((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23E6F68D4()
{
  return swift_deallocObject();
}

uint64_t sub_23E6F68E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CE48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E6F692C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23E71919C();
  __break(1u);
  return result;
}

char *sub_23E6F6A1C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23E71919C();
  __break(1u);
  return result;
}

uint64_t sub_23E6F6B04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D8BDD8) - 8);
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
  result = sub_23E71919C();
  __break(1u);
  return result;
}

uint64_t sub_23E6F6C20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 96 * a1 + 32;
    v6 = a3 + 96 * v4;
    if (v5 >= v6 || v5 + 96 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23E71919C();
  __break(1u);
  return result;
}

uint64_t sub_23E6F6D14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254336900);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23E71919C();
  __break(1u);
  return result;
}

uint64_t sub_23E6F6E1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_23E71919C();
  __break(1u);
  return result;
}

char *sub_23E6F6F34(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23E71919C();
  __break(1u);
  return result;
}

char *sub_23E6F701C(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v28;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = *((_QWORD *)a2 + 3);
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = v8;
    v9 = *((_QWORD *)a2 + 5);
    v10 = a3[8];
    v28 = &a1[v10];
    v11 = &a2[v10];
    *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
    *((_QWORD *)a1 + 5) = v9;
    v12 = sub_23E7177F8();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v28, v11, v12);
    v13(&v4[a3[9]], &a2[a3[9]], v12);
    v14 = a3[10];
    v15 = a3[11];
    v16 = &v4[v14];
    v17 = &a2[v14];
    v18 = *((_QWORD *)v17 + 1);
    *(_QWORD *)v16 = *(_QWORD *)v17;
    *((_QWORD *)v16 + 1) = v18;
    v19 = &v4[v15];
    v20 = &a2[v15];
    v21 = *((_QWORD *)v20 + 1);
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *((_QWORD *)v19 + 1) = v21;
    v22 = a3[12];
    v23 = &v4[v22];
    v24 = &a2[v22];
    v25 = *((_QWORD *)v24 + 1);
    *(_QWORD *)v23 = *(_QWORD *)v24;
    *((_QWORD *)v23 + 1) = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23E6F7164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_23E7177F8();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + *(int *)(a2 + 36), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_23E6F7218(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v26;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  v8 = *((_QWORD *)a2 + 5);
  v9 = a3[8];
  v26 = &a1[v9];
  v10 = &a2[v9];
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = v8;
  v11 = sub_23E7177F8();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v26, v10, v11);
  v12(&a1[a3[9]], &a2[a3[9]], v11);
  v13 = a3[10];
  v14 = a3[11];
  v15 = &a1[v13];
  v16 = &a2[v13];
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = v17;
  v18 = &a1[v14];
  v19 = &a2[v14];
  v20 = *((_QWORD *)v19 + 1);
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = v20;
  v21 = a3[12];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = *((_QWORD *)v23 + 1);
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_23E6F7334(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[8];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23E7177F8();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v11 = a3[10];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[11];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[12];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_23E6F74AC(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  v7 = a3[8];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_23E7177F8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[9]], &a2[a3[9]], v10);
  v12 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  return a1;
}

char *sub_23E6F7560(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRelease();
  v8 = a3[8];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_23E7177F8();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v12(&a1[a3[9]], &a2[a3[9]], v11);
  v13 = a3[10];
  v14 = &a1[v13];
  v15 = (uint64_t *)&a2[v13];
  v17 = *v15;
  v16 = v15[1];
  *(_QWORD *)v14 = v17;
  *((_QWORD *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  v18 = a3[11];
  v19 = &a1[v18];
  v20 = (uint64_t *)&a2[v18];
  v22 = *v20;
  v21 = v20[1];
  *(_QWORD *)v19 = v22;
  *((_QWORD *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  v23 = a3[12];
  v24 = &a1[v23];
  v25 = (uint64_t *)&a2[v23];
  v27 = *v25;
  v26 = v25[1];
  *(_QWORD *)v24 = v27;
  *((_QWORD *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23E6F7678()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E6F7684(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23E7177F8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_23E6F7700()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E6F770C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23E7177F8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23E6F7780()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23E7177F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23E6F7818(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *, void *);
  id v10;
  id v11;
  id v12;

  v8 = a2;
  v9 = *(void (**)(uint64_t, void *, void *, void *))(a1 + 32);
  if (a2)
  {
    sub_23E5DC5A0(0, &qword_254339088);
    sub_23E6FC2D4();
    v8 = sub_23E718D40();
  }
  swift_retain();
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v9(v8, a3, a4, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_23E6F78E8()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(v0, sel_setQualityOfService_, 25);
  v1 = objc_msgSend(v0, sel_configuration);
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v2 = v1;
  objc_msgSend(v1, sel_setQualityOfService_, 25);

  v3 = objc_msgSend(v0, sel_configuration);
  if (!v3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v4 = v3;
  objc_msgSend(v3, sel_setAutomaticallyRetryNetworkFailures_, 0);

  v5 = objc_msgSend(v0, sel_configuration);
  if (!v5)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v6 = v5;
  objc_msgSend(v5, sel_setTimeoutIntervalForResource_, 60.0);

  v7 = objc_msgSend(v0, sel_configuration);
  if (!v7)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v8 = v7;
  objc_msgSend(v7, sel_setTimeoutIntervalForRequest_, 60.0);

  v9 = objc_msgSend(v0, sel_configuration);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_setDiscretionaryNetworkBehavior_, 0);

    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_23E6F7A30()
{
  uint64_t result;

  type metadata accessor for CloudKitContainerHelper();
  swift_allocObject();
  result = sub_23E6F7A6C(0);
  qword_254339478 = result;
  return result;
}

uint64_t sub_23E6F7A6C(id a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  uint64_t v33;

  v3 = sub_23E7188F0();
  v29 = *(_QWORD *)(v3 - 8);
  v30 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v31 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718EFC();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_23E7189B0();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_23E718E18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E5DC5A0(0, &qword_2543390B0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5758], v8);
  sub_23E718998();
  v33 = MEMORY[0x24BEE4AF8];
  sub_23E5C33C8(&qword_2543390A8, v6, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254339010);
  v12 = v1;
  sub_23E61362C((unint64_t *)&qword_254339018, &qword_254339010);
  sub_23E719010();
  *(_QWORD *)(v1 + 24) = sub_23E718F08();
  if ((sub_23E717E58() & 1) != 0)
  {
    v13 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
    v14 = (void *)sub_23E718AC4();
    v15 = objc_msgSend(v13, sel_initWithSuiteName_, v14);

    if (v15)
    {
      if (qword_254337B10 != -1)
        swift_once();
      v16 = v30;
      v17 = __swift_project_value_buffer(v30, (uint64_t)qword_254339400);
      swift_beginAccess();
      v18 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v31, v17, v16);
      v19 = sub_23E7188D8();
      v20 = sub_23E718DDC();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = swift_slowAlloc();
        *(_DWORD *)v21 = 67109376;
        v32 = 1;
        sub_23E718FC8();
        *(_WORD *)(v21 + 8) = 1024;
        v32 = 0;
        sub_23E718FC8();
        _os_log_impl(&dword_23E5C0000, v19, v20, "[CloudKitHelper] Production: %{BOOL}d. Offline: %{BOOL}d", (uint8_t *)v21, 0xEu);
        MEMORY[0x242652480](v21, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v18 + 8))(v31, v16);
    }
  }
  if (!a1)
  {
    v22 = objc_allocWithZone(MEMORY[0x24BDB9038]);
    v23 = (void *)sub_23E718AC4();
    v24 = objc_msgSend(v22, sel_initWithContainerIdentifier_environment_, v23, 1);

    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB9048]), sel_init);
    objc_msgSend(v25, sel_setUseZoneWidePCS_, 1);
    v26 = (void *)sub_23E718AC4();
    objc_msgSend(v25, sel_setEncryptionServiceName_, v26);

    objc_msgSend(v25, sel_setBypassPCSEncryption_, 0);
    a1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB9030]), sel_initWithContainerID_options_, v24, v25);

  }
  *(_QWORD *)(v12 + 16) = a1;
  return v12;
}

void sub_23E6F7F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337DB8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_23E6FBBA4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E6F823C;
  aBlock[3] = &block_descriptor_24;
  v10 = _Block_copy(aBlock);
  v11 = v7;
  swift_release();
  objc_msgSend(v11, sel_accountInfoWithCompletionHandler_, v10);
  _Block_release(v10);

}

uint64_t sub_23E6F804C(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void *v18;

  v4 = sub_23E7188F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v18 = a2;
    v8 = a2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337DB8);
    return sub_23E718C98();
  }
  if (!a1)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
    v12 = sub_23E7188D8();
    v13 = sub_23E718DD0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23E5C0000, v12, v13, "accountInfo didn't have a result or an error!", v14, 2u);
      MEMORY[0x242652480](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_23E5DBD98();
    v15 = swift_allocError();
    *v16 = 13;
    v17 = v15;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337DB8);
    return sub_23E718C98();
  }
  v18 = a1;
  v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337DB8);
  return sub_23E718CA4();
}

void sub_23E6F823C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_23E6F82B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[10] = v0;
  v2 = sub_23E7188F0();
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E6F8320()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[10];
  v2 = objc_allocWithZone(MEMORY[0x24BDB91F0]);
  v3 = (void *)sub_23E718AC4();
  v4 = objc_msgSend(v2, sel_initWithZoneName_, v3);
  v0[15] = v4;

  v0[16] = objc_msgSend(*(id *)(v1 + 16), sel_privateCloudDatabase);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23E71A500;
  *(_QWORD *)(v5 + 32) = objc_msgSend(v4, sel_zoneID);
  sub_23E718C50();
  v0[17] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v0[18] = v6;
  *v6 = v0;
  v6[1] = sub_23E6F844C;
  return sub_23E718D7C();
}

uint64_t sub_23E6F844C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v3 = (_QWORD *)*v2;
  v3[19] = a1;
  v3[20] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    v4 = (void *)v3[16];
    swift_bridgeObjectRelease();

  }
  return swift_task_switch();
}

uint64_t sub_23E6F84C4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  __int16 v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 152);
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v2 = objc_msgSend(*(id *)(v0 + 120), sel_zoneID);
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16) || (v4 = sub_23E70165C((uint64_t)v2), (v5 & 1) == 0))
  {
    swift_bridgeObjectRelease();

LABEL_19:
    v40 = *(_QWORD *)(v0 + 120);
    v41 = *(_QWORD *)(v0 + 80);
    v42 = swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v42;
    *(_QWORD *)(v42 + 16) = v40;
    *(_QWORD *)(v42 + 24) = v41;
    v43 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v43;
    *v43 = v0;
    v43[1] = sub_23E6F89A4;
    return sub_23E7191F0();
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 152) + 56) + 16 * v4;
  v7 = *(id *)v6;
  v8 = *(_BYTE *)(v6 + 8);
  sub_23E6FBC14(*(id *)v6);
  swift_bridgeObjectRelease();

  if ((v8 & 1) != 0)
  {
    *(_QWORD *)(v0 + 72) = v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
    swift_willThrowTypedImpl();
    if (qword_254337B10 != -1)
      swift_once();
    v10 = *(_QWORD *)(v0 + 96);
    v9 = *(_QWORD *)(v0 + 104);
    v11 = *(_QWORD *)(v0 + 88);
    v12 = __swift_project_value_buffer(v11, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    v13 = v7;
    v14 = v7;
    v15 = sub_23E7188D8();
    v16 = sub_23E718DD0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v44 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138412290;
      v18 = v7;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 64) = v19;
      sub_23E718FC8();
      *v44 = v19;

      _os_log_impl(&dword_23E5C0000, v15, v16, "Error fetching existing zones. %@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543368F0);
      swift_arrayDestroy();
      MEMORY[0x242652480](v44, -1, -1);
      MEMORY[0x242652480](v17, -1, -1);
    }
    else
    {

    }
    v33 = *(_QWORD *)(v0 + 96);
    v32 = *(_QWORD *)(v0 + 104);
    v34 = *(_QWORD *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
    v35 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v36 = objc_msgSend(v35, sel_processName);

    v37 = sub_23E718AE8();
    v39 = v38;

    v45 = 259;
    v46 = 10;
    v47 = v37;
    v48 = v39;
    v49 = 0;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v45);

    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (qword_254337B10 != -1)
    swift_once();
  v20 = *(_QWORD *)(v0 + 112);
  v21 = *(_QWORD *)(v0 + 88);
  v22 = *(_QWORD *)(v0 + 96);
  v23 = __swift_project_value_buffer(v21, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v23, v21);
  v24 = sub_23E7188D8();
  v25 = sub_23E718DD0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_23E5C0000, v24, v25, "Bootstrap zone already exists", v26, 2u);
    MEMORY[0x242652480](v26, -1, -1);
  }
  v27 = *(_QWORD *)(v0 + 112);
  v28 = *(void **)(v0 + 120);
  v29 = *(_QWORD *)(v0 + 88);
  v30 = *(_QWORD *)(v0 + 96);
  sub_23E62BF58(v7);

  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v27, v29);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E6F89A4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E6F8A00()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E6F8A40()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  __int16 v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 160);
  if (qword_254337B10 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_23E7188D8();
  v9 = sub_23E718DD0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 64) = v13;
    sub_23E718FC8();
    *v11 = v13;

    _os_log_impl(&dword_23E5C0000, v8, v9, "Error fetching existing zones. %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543368F0);
    swift_arrayDestroy();
    MEMORY[0x242652480](v11, -1, -1);
    MEMORY[0x242652480](v10, -1, -1);
  }
  else
  {

  }
  v15 = *(_QWORD *)(v0 + 96);
  v14 = *(_QWORD *)(v0 + 104);
  v16 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  v17 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v18 = objc_msgSend(v17, sel_processName);

  v19 = sub_23E718AE8();
  v21 = v20;

  v27 = 259;
  v28 = 10;
  v29 = v19;
  v30 = v21;
  v31 = 0;
  static AutoBugCaptureManager.sendIssue(_:)((char *)&v27);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(v0 + 120);
  v23 = *(_QWORD *)(v0 + 80);
  v24 = swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v24;
  *(_QWORD *)(v24 + 16) = v22;
  *(_QWORD *)(v24 + 24) = v23;
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v25;
  *v25 = v0;
  v25[1] = sub_23E6F89A4;
  return sub_23E7191F0();
}

void sub_23E6F8D48(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254339040);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  sub_23E5DC5A0(0, &qword_2543390C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23E71A500;
  *(_QWORD *)(v9 + 32) = a2;
  aBlock[0] = v9;
  sub_23E718C50();
  v10 = a2;
  v11 = (void *)sub_23E718F14();
  sub_23E6F78E8();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_23E6FBC2C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E6F92F8;
  aBlock[3] = &block_descriptor_9;
  v14 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v11, sel_setModifyRecordZonesCompletionBlock_, v14);
  _Block_release(v14);
  v15 = objc_msgSend(*(id *)(a3 + 16), sel_privateCloudDatabase);
  objc_msgSend(v15, sel_addOperation_, v11);

}

uint64_t sub_23E6F8F28(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36[4];

  v6 = sub_23E7188F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v34 - v11;
  if (a3)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v13, v6);
    v14 = a3;
    v15 = a3;
    v16 = sub_23E7188D8();
    v17 = sub_23E718DD0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v34[1] = a4;
      v35 = (uint64_t)a3;
      v20 = v19;
      v36[0] = v19;
      *(_DWORD *)v18 = 136315138;
      v34[0] = v18 + 4;
      v21 = a3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFC8);
      v22 = sub_23E718B30();
      v35 = sub_23E60EA08(v22, v23, v36);
      sub_23E718FC8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23E5C0000, v16, v17, "[CloudKitHelper] Error creating bootstrap zone - %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v20, -1, -1);
      MEMORY[0x242652480](v18, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v28 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v29 = objc_msgSend(v28, sel_processName);

    v30 = sub_23E718AE8();
    v32 = v31;

    LOWORD(v36[0]) = 259;
    BYTE2(v36[0]) = 9;
    v36[1] = v30;
    v36[2] = v32;
    v36[3] = 0;
    static AutoBugCaptureManager.sendIssue(_:)((char *)v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v24, v6);
    v25 = sub_23E7188D8();
    v26 = sub_23E718DDC();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_23E5C0000, v25, v26, "[CloudKitHelper] Bootstrap record zone is created.", v27, 2u);
      MEMORY[0x242652480](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254339040);
  return sub_23E718CA4();
}

uint64_t sub_23E6F92F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *);
  id v8;

  v6 = a2;
  v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_23E5DC5A0(0, &qword_254339050);
    v6 = sub_23E718C38();
  }
  if (a3)
  {
    sub_23E5DC5A0(0, (unint64_t *)&qword_254337DD0);
    a3 = sub_23E718C38();
  }
  swift_retain();
  v8 = a4;
  v7(v6, a3, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E6F93C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[9] = v0;
  v2 = sub_23E7188F0();
  v1[10] = v2;
  v1[11] = *(_QWORD *)(v2 - 8);
  v1[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E6F9420()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  sub_23E5DC5A0(0, (unint64_t *)&unk_254339058);
  *v1 = v0;
  v1[1] = sub_23E6F94C4;
  return sub_23E719220();
}

uint64_t sub_23E6F94C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E6F9528()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 40);
  v2 = objc_msgSend(v1, sel_supportsDeviceToDeviceEncryption);

  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t sub_23E6F9578()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  if (qword_254337B10 != -1)
    swift_once();
  v1 = *(void **)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_23E7188D8();
  v9 = sub_23E718DD0();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 112);
  v13 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 96);
  v14 = *(_QWORD *)(v0 + 80);
  if (v10)
  {
    v21 = *(_QWORD *)(v0 + 80);
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v22 = v16;
    *(_DWORD *)v15 = 136446466;
    *(_QWORD *)(v0 + 48) = sub_23E60EA08(0xD000000000000014, 0x800000023E723860, &v22);
    sub_23E718FC8();
    *(_WORD *)(v15 + 12) = 2082;
    *(_QWORD *)(v0 + 56) = v11;
    v17 = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
    v18 = sub_23E718B30();
    *(_QWORD *)(v0 + 64) = sub_23E60EA08(v18, v19, &v22);
    sub_23E718FC8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23E5C0000, v8, v9, "%{public}s error: %{public}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242652480](v16, -1, -1);
    MEMORY[0x242652480](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v21);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23E6F980C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  v4 = sub_23E7188F0();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E6F9880()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v2 = *(_QWORD *)(v0 + 88) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 104);
    v4 = objc_allocWithZone(MEMORY[0x24BDB91F0]);
    swift_bridgeObjectRetain();
    v5 = (void *)sub_23E718AC4();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v4, sel_initWithZoneName_, v5);
    *(_QWORD *)(v0 + 144) = v6;

    *(_QWORD *)(v0 + 152) = objc_msgSend(*(id *)(v3 + 16), sel_privateCloudDatabase);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C80);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_23E71A500;
    *(_QWORD *)(v7 + 32) = objc_msgSend(v6, sel_zoneID);
    sub_23E718C50();
    *(_QWORD *)(v0 + 160) = v7;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v8;
    *v8 = v0;
    v8[1] = sub_23E6F9B14;
    return sub_23E718D7C();
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v10 = *(_QWORD *)(v0 + 136);
    v11 = *(_QWORD *)(v0 + 112);
    v12 = *(_QWORD *)(v0 + 120);
    v13 = __swift_project_value_buffer(v11, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v13, v11);
    v14 = sub_23E7188D8();
    v15 = sub_23E718DD0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_23E5C0000, v14, v15, "Received empty zone name", v16, 2u);
      MEMORY[0x242652480](v16, -1, -1);
    }
    v17 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
    sub_23E5DBD98();
    swift_allocError();
    *v20 = 13;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23E6F9B14(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v3 = (_QWORD *)*v2;
  v3[22] = a1;
  v3[23] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    v4 = (void *)v3[19];
    swift_bridgeObjectRelease();

  }
  return swift_task_switch();
}

uint64_t sub_23E6F9B8C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  char v11;
  _BYTE *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 176);
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v2 = objc_msgSend(*(id *)(v0 + 144), sel_zoneID);
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16) || (v4 = sub_23E70165C((uint64_t)v2), (v5 & 1) == 0))
  {
    swift_bridgeObjectRelease();

LABEL_9:
    v14 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 104);
    v16 = swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v16;
    *(_QWORD *)(v16 + 16) = v14;
    *(_QWORD *)(v16 + 24) = v15;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v17;
    sub_23E5DC5A0(0, &qword_254339050);
    *v17 = v0;
    v17[1] = sub_23E6F9EFC;
    return sub_23E719220();
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v0 + 176) + 56) + 16 * v4;
  v7 = *(id *)v6;
  v8 = *(_BYTE *)(v6 + 8);
  sub_23E6FBC14(*(id *)v6);
  swift_bridgeObjectRelease();

  if ((v8 & 1) != 0)
  {
    *(_QWORD *)(v0 + 80) = v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
    swift_willThrowTypedImpl();
    *(_QWORD *)(v0 + 64) = v7;
    v9 = v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = *(void **)(v0 + 144);
      v11 = *(_BYTE *)(v0 + 216);
      sub_23E5DBD98();
      swift_allocError();
      *v12 = v11;
      swift_willThrow();

      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }

    goto LABEL_9;
  }
  if (qword_254337B10 != -1)
    swift_once();
  v19 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 128);
  v20 = *(_QWORD *)(v0 + 112);
  v21 = __swift_project_value_buffer(v20, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
  v22 = sub_23E7188D8();
  v23 = sub_23E718DD0();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_23E5C0000, v22, v23, "Zone already exists. Possible the site exists too. Halt.", v24, 2u);
    MEMORY[0x242652480](v24, -1, -1);
  }
  v26 = *(_QWORD *)(v0 + 120);
  v25 = *(_QWORD *)(v0 + 128);
  v27 = *(_QWORD *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v7);
}

uint64_t sub_23E6F9EFC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E6F9F68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23E6F9FB4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  char v4;
  _BYTE *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 64) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
  if (swift_dynamicCast())
  {
    v3 = *(void **)(v0 + 144);
    v4 = *(_BYTE *)(v0 + 216);
    sub_23E5DBD98();
    swift_allocError();
    *v5 = v4;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {

    v7 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 104);
    v9 = swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v9;
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v10;
    sub_23E5DC5A0(0, &qword_254339050);
    *v10 = v0;
    v10[1] = sub_23E6F9EFC;
    return sub_23E719220();
  }
}

uint64_t sub_23E6FA148()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23E6FA198(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254337DB0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E5DC5A0(0, &qword_2543390C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23E71A500;
  *(_QWORD *)(v10 + 32) = a2;
  aBlock[0] = v10;
  sub_23E718C50();
  v11 = a2;
  v12 = (void *)sub_23E718F14();
  sub_23E6F78E8();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(_QWORD *)(v15 + v14) = v11;
  aBlock[4] = sub_23E6FC498;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E6F92F8;
  aBlock[3] = &block_descriptor_47;
  v16 = _Block_copy(aBlock);
  v17 = v11;
  swift_release();
  objc_msgSend(v12, sel_setModifyRecordZonesCompletionBlock_, v16);
  _Block_release(v16);
  v18 = objc_msgSend(*(id *)(a3 + 16), sel_privateCloudDatabase);
  objc_msgSend(v18, sel_addOperation_, v12);

}

uint64_t sub_23E6FA394(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40[7];

  v8 = sub_23E7188F0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v38 - v13;
  if (a3)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v8, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v15, v8);
    v16 = a3;
    v17 = a3;
    v18 = sub_23E7188D8();
    v19 = sub_23E718DD0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v38[1] = a4;
      v39 = (uint64_t)a3;
      v22 = v21;
      v40[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v38[0] = v20 + 4;
      v23 = a3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFC8);
      v24 = sub_23E718B30();
      v39 = sub_23E60EA08(v24, v25, v40);
      sub_23E718FC8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23E5C0000, v18, v19, "[CloudKitHelper] Error creating zone - %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v22, -1, -1);
      MEMORY[0x242652480](v20, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v32 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v33 = objc_msgSend(v32, sel_processName);

    v34 = sub_23E718AE8();
    v36 = v35;

    LOWORD(v40[0]) = 259;
    BYTE2(v40[0]) = 13;
    v40[1] = v34;
    v40[2] = v36;
    v40[3] = 0;
    static AutoBugCaptureManager.sendIssue(_:)((char *)v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40[0] = (uint64_t)a3;
    v37 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254337DB0);
    return sub_23E718C98();
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v8, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v26, v8);
    v27 = sub_23E7188D8();
    v28 = sub_23E718DDC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_23E5C0000, v27, v28, "[CloudKitHelper] Record zone is created.", v29, 2u);
      MEMORY[0x242652480](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    v40[4] = (uint64_t)a5;
    v30 = a5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254337DB0);
    return sub_23E718CA4();
  }
}

uint64_t sub_23E6FA79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = sub_23E7188F0();
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E6FA800()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v3 = v2 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 56);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v5;
    v5[2] = v2;
    v5[3] = v1;
    v5[4] = v4;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v6;
    *v6 = v0;
    v6[1] = sub_23E6FAA0C;
    return sub_23E719220();
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 64);
    v11 = __swift_project_value_buffer(v10, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    v12 = sub_23E7188D8();
    v13 = sub_23E718DD0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23E5C0000, v12, v13, "Received empty zone name", v14, 2u);
      MEMORY[0x242652480](v14, -1, -1);
    }
    v16 = *(_QWORD *)(v0 + 72);
    v15 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    sub_23E5DBD98();
    swift_allocError();
    *v18 = 13;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23E6FAA0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E6FAA78()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E6FAAAC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23E6FAAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = objc_allocWithZone(MEMORY[0x24BDB91F0]);
  swift_bridgeObjectRetain();
  v10 = (void *)sub_23E718AC4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithZoneName_, v10);

  sub_23E5DC5A0(0, &qword_2543390C0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23E71A500;
  *(_QWORD *)(v12 + 32) = objc_msgSend(v11, sel_zoneID);
  aBlock[0] = v12;
  sub_23E718C50();
  v13 = (void *)sub_23E718F14();
  sub_23E6F78E8();
  objc_msgSend(v13, sel_setMarkZonesAsUserPurged_, 1, aBlock[0]);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v14, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_23E6FC3A0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E6F92F8;
  aBlock[3] = &block_descriptor_38_1;
  v16 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v13, sel_setModifyRecordZonesCompletionBlock_, v16);
  _Block_release(v16);
  v17 = objc_msgSend(*(id *)(a4 + 16), sel_privateCloudDatabase);
  objc_msgSend(v17, sel_addOperation_, v13);

}

uint64_t sub_23E6FAD44(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37[4];

  v6 = sub_23E7188F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v35 - v11;
  if (a3)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v13, v6);
    v14 = a3;
    v15 = a3;
    v16 = sub_23E7188D8();
    v17 = sub_23E718DD0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v35[1] = a4;
      v36 = (uint64_t)a3;
      v20 = v19;
      v37[0] = v19;
      *(_DWORD *)v18 = 136315138;
      v35[0] = v18 + 4;
      v21 = a3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFC8);
      v22 = sub_23E718B30();
      v36 = sub_23E60EA08(v22, v23, v37);
      sub_23E718FC8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23E5C0000, v16, v17, "[CloudKitHelper] Error deleting zone - %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v20, -1, -1);
      MEMORY[0x242652480](v18, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v29 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v30 = objc_msgSend(v29, sel_processName);

    v31 = sub_23E718AE8();
    v33 = v32;

    LOWORD(v37[0]) = 259;
    BYTE2(v37[0]) = 12;
    v37[1] = v31;
    v37[2] = v33;
    v37[3] = 0;
    static AutoBugCaptureManager.sendIssue(_:)((char *)v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v37[0] = (uint64_t)a3;
    v34 = a3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
    return sub_23E718C98();
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v24, v6);
    v25 = sub_23E7188D8();
    v26 = sub_23E718DDC();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_23E5C0000, v25, v26, "[CloudKitHelper] Record zone is deleted.", v27, 2u);
      MEMORY[0x242652480](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
    return sub_23E718CA4();
  }
}

uint64_t sub_23E6FB13C(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  unint64_t v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[6];

  v32 = a5;
  v31 = sub_23E718980();
  v35 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v30 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23E7189B0();
  v33 = *(_QWORD *)(v10 - 8);
  v34 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v29 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254337DA8 != -1)
    swift_once();
  v16 = *(void **)(qword_254339478 + 24);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v12);
  v17 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = (char *)swift_allocObject();
  *((_QWORD *)v18 + 2) = a2;
  *((_QWORD *)v18 + 3) = a3;
  v19 = v32;
  *((_QWORD *)v18 + 4) = a4;
  *((_QWORD *)v18 + 5) = v19;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v18[v17], v15, v12);
  aBlock[4] = sub_23E6FBCD0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E5C52D0;
  aBlock[3] = &block_descriptor_15;
  v20 = _Block_copy(aBlock);
  v21 = v16;
  v22 = a2;
  swift_bridgeObjectRetain();
  v23 = a4;
  v24 = v19;
  v25 = v29;
  sub_23E718998();
  v36 = MEMORY[0x24BEE4AF8];
  sub_23E5C33C8((unint64_t *)&qword_254337BC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337BD0);
  sub_23E61362C((unint64_t *)&qword_254337BE0, (uint64_t *)&unk_254337BD0);
  v27 = v30;
  v26 = v31;
  sub_23E719010();
  MEMORY[0x242651A0C](0, v25, v27, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v27, v26);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v34);
  return swift_release();
}

uint64_t sub_23E6FB404(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t result;
  _QWORD aBlock[6];

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v10);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (char *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a2;
  *((_QWORD *)v14 + 3) = a1;
  *((_QWORD *)v14 + 4) = a3;
  *((_QWORD *)v14 + 5) = a4;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v14[v13], (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_23E6FBD6C;
  *(_QWORD *)(v15 + 24) = v14;
  aBlock[4] = sub_23E5DBE4C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E6ED3F0;
  aBlock[3] = &block_descriptor_24_0;
  v16 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v17 = a1;
  v18 = a3;
  v19 = a4;
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_performBlockAndWait_, v16);
  _Block_release(v16);
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a4 & 1) != 0)
    __break(1u);
  return result;
}

void sub_23E6FB5D4(unint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD aBlock[7];

  v19 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v13 = (void *)MEMORY[0x242651F34](v12);
  v14 = a2;
  sub_23E6FBEC4(a1, v14);

  sub_23E5DC5A0(0, &qword_254339070);
  v15 = (void *)sub_23E718C20();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v17 + v16, (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_23E6FC26C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23E6F7818;
  aBlock[3] = &block_descriptor_30_0;
  v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a3, sel_shareManagedObjects_toShare_completion_, v15, v19, v18);
  _Block_release(v18);

  objc_autoreleasePoolPop(v13);
}

uint64_t sub_23E6FB784(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];

  v7 = sub_23E7188F0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v37 - v12;
  if (a4)
  {
    v14 = a4;
    if (qword_254337B10 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v7, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v7);
    v16 = a4;
    v17 = a4;
    v18 = sub_23E7188D8();
    v19 = sub_23E718DD0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v39 = a5;
      v21 = (uint8_t *)v20;
      v22 = swift_slowAlloc();
      v38 = v8;
      v23 = (_QWORD *)v22;
      *(_DWORD *)v21 = 138412290;
      v24 = a4;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v40[0] = v25;
      sub_23E718FC8();
      *v23 = v25;

      _os_log_impl(&dword_23E5C0000, v18, v19, "[CloudKitHelper] Failed to add records to share. error %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543368F0);
      swift_arrayDestroy();
      v26 = v23;
      v8 = v38;
      MEMORY[0x242652480](v26, -1, -1);
      MEMORY[0x242652480](v21, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v32 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
    v33 = objc_msgSend(v32, sel_processName);

    v34 = sub_23E718AE8();
    v36 = v35;

    LOWORD(v40[0]) = 259;
    BYTE2(v40[0]) = 11;
    v40[1] = v34;
    v40[2] = v36;
    v40[3] = 0;
    static AutoBugCaptureManager.sendIssue(_:)((char *)v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40[0] = a4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
    return sub_23E718C98();
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v7, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v27, v7);
    v28 = sub_23E7188D8();
    v29 = sub_23E718DD0();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_23E5C0000, v28, v29, "[CloudKitHelper] Successfully added records to share", v30, 2u);
      MEMORY[0x242652480](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
    return sub_23E718CA4();
  }
}

uint64_t type metadata accessor for CloudKitContainerHelper()
{
  return objc_opt_self();
}

void sub_23E6FBB90(uint64_t a1)
{
  uint64_t v1;

  sub_23E6F7F08(a1, v1);
}

uint64_t sub_23E6FBB98()
{
  return objectdestroyTm_2((uint64_t *)&unk_254337DB8);
}

uint64_t sub_23E6FBBA4(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337DB8);
  return sub_23E6F804C(a1, a2);
}

uint64_t block_copy_helper_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_20()
{
  return swift_release();
}

void sub_23E6FBC0C(uint64_t a1)
{
  uint64_t v1;

  sub_23E6F8D48(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

id sub_23E6FBC14(id a1)
{
  return a1;
}

uint64_t sub_23E6FBC20()
{
  return objectdestroyTm_2(&qword_254339040);
}

uint64_t sub_23E6FBC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23E6FC3B4(a1, a2, a3, &qword_254339040, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23E6F8F28);
}

uint64_t sub_23E6FBC40()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23E6FBCD0()
{
  return sub_23E6FBD78((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, char *))sub_23E6FB404);
}

uint64_t sub_23E6FBCDC()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23E6FBD6C()
{
  return sub_23E6FBD78((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, char *))sub_23E6FB5D4);
}

uint64_t sub_23E6FBD78(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, char *))
{
  char *v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030) - 8)
                          + 80);
  return a1(*((_QWORD *)v1 + 2), *((_QWORD *)v1 + 3), *((_QWORD *)v1 + 4), *((_QWORD *)v1 + 5), &v1[(v2 + 48) & ~v2]);
}

uint64_t sub_23E6FBDC0()
{
  return swift_deallocObject();
}

void (*sub_23E6FBDD0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_23E6FBE50(v6, a2, a3);
  return sub_23E6FBE24;
}

void sub_23E6FBE24(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_23E6FBE50(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x242651CD0](a2, a3);
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
    return sub_23E6FBEBC;
  }
  __break(1u);
  return result;
}

void sub_23E6FBEBC(id *a1)
{

}

uint64_t sub_23E6FBEC4(unint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  __int128 v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a2;
  v33 = *MEMORY[0x24BDAC8D0];
  v3 = sub_23E7188F0();
  v27 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_21;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_23E719160())
  {
    v29 = a1 & 0xC000000000000001;
    v7 = 4;
    *(_QWORD *)&v6 = 138412290;
    v24 = v6;
    v28 = v5;
    v25 = a1;
    while (1)
    {
      v9 = v29 ? (id)MEMORY[0x242651CD0](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      v10 = v9;
      v11 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v31 = 0;
      if (objc_msgSend(v30, sel_existingObjectWithID_error_, v9, &v31))
      {
        v12 = v31;

        MEMORY[0x2426517F0]();
        if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_23E718C5C();
        sub_23E718C74();
        sub_23E718C50();
      }
      else
      {
        v13 = v31;
        v14 = (void *)sub_23E7175AC();

        swift_willThrow();
        if (qword_254337B10 != -1)
          swift_once();
        v15 = __swift_project_value_buffer(v3, (uint64_t)qword_254339400);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v26, v15, v3);
        v16 = v10;
        v8 = sub_23E7188D8();
        v17 = sub_23E718DD0();
        if (os_log_type_enabled(v8, v17))
        {
          v18 = swift_slowAlloc();
          v19 = v3;
          v20 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v18 = v24;
          *(_QWORD *)(v18 + 4) = v16;
          *v20 = v16;

          _os_log_impl(&dword_23E5C0000, v8, v17, "[CloudKitHelper] Failed to get object for objectID %@ to add to share", (uint8_t *)v18, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2543368F0);
          swift_arrayDestroy();
          v21 = v20;
          v3 = v19;
          MEMORY[0x242652480](v21, -1, -1);
          v22 = v18;
          a1 = v25;
          MEMORY[0x242652480](v22, -1, -1);

        }
        else
        {

          v8 = v16;
        }

        (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v3);
      }
      ++v7;
      if (v11 == v28)
      {
        swift_bridgeObjectRelease();
        return v32;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23E6FC260()
{
  return objectdestroyTm_2((uint64_t *)&unk_254339030);
}

uint64_t sub_23E6FC26C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339030) - 8)
                          + 80);
  return sub_23E6FB784(a1, a2, a3, a4, v4 + ((v9 + 16) & ~v9));
}

unint64_t sub_23E6FC2D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254339090;
  if (!qword_254339090)
  {
    v1 = sub_23E5DC5A0(255, &qword_254339088);
    result = MEMORY[0x2426523B4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254339090);
  }
  return result;
}

void sub_23E6FC32C(uint64_t a1)
{
  uint64_t *v1;

  sub_23E6FAAE8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23E6FC338()
{
  return objectdestroyTm_2((uint64_t *)&unk_254339030);
}

uint64_t objectdestroyTm_2(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_23E6FC3A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23E6FC3B4(a1, a2, a3, (uint64_t *)&unk_254339030, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23E6FAD44);
}

uint64_t sub_23E6FC3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a4) - 8) + 80);
  return a5(a1, a2, a3, v5 + ((v9 + 16) & ~v9));
}

void sub_23E6FC418(uint64_t a1)
{
  uint64_t v1;

  sub_23E6FA198(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23E6FC420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254337DB0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_23E6FC498(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;

  v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254337DB0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return sub_23E6FA394(a1, a2, a3, v3 + v8, *(void **)(v3 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_23E6FC534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t result;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v33 = a1;
  v36 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v2);
  v34 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_23E717A44();
  v35 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v38 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718B24();
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23E717744();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE448];
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23E7177F8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = 0;
  v42 = 0xE000000000000000;
  sub_23E7190D0();
  sub_23E718B9C();
  v17 = sub_23E717798();
  MEMORY[0x24264FFC0](v17);
  sub_23E5C33C8(&qword_256D8CFD0, v9, MEMORY[0x24BDCE430]);
  sub_23E7177E0();
  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v12, v8);
  v32 = v14;
  v19 = *(void (**)(char *, uint64_t))(v14 + 8);
  v19(v16, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v20 = sub_23E717798();
  MEMORY[0x24264FFC0](v20);
  sub_23E7177E0();
  v18(v12, v8);
  v19(v16, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E718B18();
  v21 = sub_23E718AF4();
  v23 = v22;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v7, v40);
  if (v23 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E5C33C8((unint64_t *)&qword_254336E40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], MEMORY[0x24BE4F2D0]);
    v25 = v37;
    v26 = v38;
    sub_23E7173F0();
    swift_release();
    v27 = v32;
    v28 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v34, v33, v13);
    v29 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56);
    v29(v28, 0, 1, v13);
    sub_23E717A14();
    sub_23E7177D4();
    v29(v28, 0, 1, v13);
    sub_23E717A38();
    sub_23E5F304C(v21, v23);
    v31 = v35;
    v30 = v36;
    (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v36, v26, v25);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56))(v30, 0, 1, v25);
  }
  return result;
}

uint64_t sub_23E6FC98C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
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
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  void (*v44)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;

  v48 = a1;
  v51 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v2);
  v49 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_23E717A44();
  v50 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v53 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718B24();
  v58 = *(_QWORD *)(v5 - 8);
  v59 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v57 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E717744();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE448];
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23E7177F8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v47 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v55 = (char *)&v47 - v20;
  sub_23E7177D4();
  v61 = 0;
  v62 = 0xE000000000000000;
  sub_23E7190D0();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v16);
  sub_23E717750();
  v47 = v13;
  v21 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
  v22 = v21(v16, v12);
  MEMORY[0x24264FFC0](v22);
  v60 = sub_23E5C33C8(&qword_256D8CFD0, v8, MEMORY[0x24BDCE430]);
  v23 = v7;
  sub_23E7177E0();
  v24 = *(void (**)(char *, uint64_t))(v9 + 8);
  v24(v11, v7);
  v21(v19, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v56 = 0x800000023E7239E0;
  sub_23E718B9C();
  v25 = v55;
  sub_23E6FF208((uint64_t)v16);
  sub_23E717750();
  v26 = v21(v16, v12);
  MEMORY[0x24264FFC0](v26);
  v54 = v23;
  sub_23E7177E0();
  v27 = v23;
  v28 = v24;
  v24(v11, v27);
  v21(v19, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v16);
  sub_23E717750();
  v29 = v21(v16, v12);
  MEMORY[0x24264FFC0](v29);
  v30 = v54;
  sub_23E7177E0();
  v31 = v30;
  v28(v11, v30);
  v21(v19, v12);
  sub_23E718B9C();
  v32 = v25;
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v16);
  sub_23E717750();
  v33 = v21(v16, v12);
  MEMORY[0x24264FFC0](v33);
  sub_23E7177E0();
  v28(v11, v31);
  v34 = v12;
  v21(v19, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v35 = v57;
  sub_23E718B18();
  v36 = sub_23E718AF4();
  v38 = v37;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v35, v59);
  if (v38 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E5C33C8((unint64_t *)&qword_254336E40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], MEMORY[0x24BE4F2D0]);
    v40 = v52;
    v41 = v53;
    sub_23E7173F0();
    swift_release();
    v42 = v47;
    v43 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v49, v48, v34);
    v44 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56);
    v44(v43, 0, 1, v34);
    sub_23E717A14();
    sub_23E7177D4();
    v44(v43, 0, 1, v34);
    sub_23E717A38();
    sub_23E5F304C(v36, v38);
    v21(v32, v34);
    v46 = v50;
    v45 = v51;
    (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(v51, v41, v40);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v46 + 56))(v45, 0, 1, v40);
  }
  return result;
}

uint64_t sub_23E6FCFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  uint64_t (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t result;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  void (*v64)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;

  v68 = a1;
  v71 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v2);
  v69 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = sub_23E717A44();
  v70 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v73 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718B24();
  v78 = *(_QWORD *)(v5 - 8);
  v79 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v77 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E717744();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE448];
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_23E7177F8();
  v12 = *(_QWORD *)(v74 - 8);
  v13 = MEMORY[0x24BDAC7A8](v74);
  v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v67 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v67 - v19;
  sub_23E7177D4();
  v87 = 0;
  v88 = 0xE000000000000000;
  sub_23E7190D0();
  v21 = sub_23E718B9C();
  MEMORY[0x24264FFC0](v21);
  v84 = sub_23E5C33C8(&qword_256D8CFD0, v8, MEMORY[0x24BDCE430]);
  v22 = v20;
  sub_23E7177E0();
  v23 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23(v11, v7);
  v83 = v23;
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v85 = 0x800000023E7239E0;
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v67 = v12;
  v24 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
  v25 = v74;
  v26 = v24(v15, v74);
  MEMORY[0x24264FFC0](v26);
  v86 = v7;
  sub_23E7177E0();
  v23(v11, v7);
  v24(v18, v25);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v80 = 0x800000023E723A00;
  v81 = 0xD00000000000003CLL;
  sub_23E718B9C();
  v82 = v22;
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v27 = v24(v15, v25);
  MEMORY[0x24264FFC0](v27);
  v28 = v86;
  sub_23E7177E0();
  v29 = v28;
  v30 = v83;
  v83(v11, v29);
  v24(v18, v25);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v31 = v24(v15, v25);
  MEMORY[0x24264FFC0](v31);
  v32 = v86;
  sub_23E7177E0();
  v30(v11, v32);
  v33 = v25;
  v24(v18, v25);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v75 = 0x800000023E723A40;
  v76 = 0xD00000000000003DLL;
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v34 = v24(v15, v25);
  MEMORY[0x24264FFC0](v34);
  v35 = v86;
  sub_23E7177E0();
  v30(v11, v35);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v36 = v24(v15, v33);
  MEMORY[0x24264FFC0](v36);
  v37 = v86;
  sub_23E7177E0();
  v38 = v37;
  v39 = v83;
  v83(v11, v38);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v40 = v24(v15, v33);
  MEMORY[0x24264FFC0](v40);
  v41 = v86;
  sub_23E7177E0();
  v39(v11, v41);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v42 = v24(v15, v33);
  MEMORY[0x24264FFC0](v42);
  sub_23E7177E0();
  v43 = v41;
  v44 = v83;
  v83(v11, v43);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v45 = v24(v15, v33);
  MEMORY[0x24264FFC0](v45);
  v46 = v86;
  sub_23E7177E0();
  v47 = v46;
  v48 = v44;
  v44(v11, v47);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v49 = v24(v15, v33);
  MEMORY[0x24264FFC0](v49);
  v50 = v86;
  sub_23E7177E0();
  v48(v11, v50);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v51 = v24(v15, v33);
  MEMORY[0x24264FFC0](v51);
  v52 = v86;
  sub_23E7177E0();
  v48(v11, v52);
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF6F0((uint64_t)v15);
  sub_23E717750();
  v53 = v24(v15, v33);
  MEMORY[0x24264FFC0](v53);
  sub_23E7177E0();
  v48(v11, v52);
  v54 = (void (*)(char *, uint64_t))v24;
  v24(v18, v33);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v55 = v77;
  sub_23E718B18();
  v56 = sub_23E718AF4();
  v58 = v57;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v55, v79);
  if (v58 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E5C33C8((unint64_t *)&qword_254336E40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], MEMORY[0x24BE4F2D0]);
    v60 = v73;
    v61 = v72;
    sub_23E7173F0();
    swift_release();
    v62 = v67;
    v63 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v69, v68, v33);
    v64 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v62 + 56);
    v64(v63, 0, 1, v33);
    sub_23E717A14();
    sub_23E7177D4();
    v64(v63, 0, 1, v33);
    sub_23E717A38();
    sub_23E5F304C(v56, v58);
    v54(v82, v33);
    v65 = v70;
    v66 = v71;
    (*(void (**)(uint64_t, char *, uint64_t))(v70 + 32))(v71, v60, v61);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v65 + 56))(v66, 0, 1, v61);
  }
  return result;
}

uint64_t sub_23E6FDB0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t result;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  void (*v42)(char *, _QWORD, uint64_t, uint64_t);
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
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  unint64_t v62;

  v46 = a1;
  v49 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v2);
  v47 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_23E717A44();
  v48 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v51 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718B24();
  v54 = *(_QWORD *)(v5 - 8);
  v55 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v53 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E717744();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE448];
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23E7177F8();
  v56 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v45 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v45 - v19;
  sub_23E7177D4();
  v61 = 0;
  v62 = 0xE000000000000000;
  sub_23E7190D0();
  v21 = sub_23E718B9C();
  MEMORY[0x24264FFC0](v21);
  v58 = sub_23E5C33C8(&qword_256D8CFD0, v8, MEMORY[0x24BDCE430]);
  sub_23E7177E0();
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v11, v7);
  v60 = v22;
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v59 = 0x800000023E7239E0;
  sub_23E718B9C();
  v23 = v20;
  sub_23E6FF208((uint64_t)v15);
  sub_23E717750();
  v24 = *(uint64_t (**)(char *, uint64_t))(v56 + 8);
  v25 = v24(v15, v12);
  MEMORY[0x24264FFC0](v25);
  sub_23E7177E0();
  v22(v11, v7);
  v24(v18, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v57 = v23;
  sub_23E6FF208((uint64_t)v15);
  sub_23E717750();
  v26 = v24(v15, v12);
  MEMORY[0x24264FFC0](v26);
  sub_23E7177E0();
  v27 = v60;
  v60(v11, v7);
  v24(v18, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v15);
  sub_23E717750();
  v28 = v24(v15, v12);
  MEMORY[0x24264FFC0](v28);
  v52 = v7;
  sub_23E7177E0();
  v27(v11, v7);
  v24(v18, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v15);
  sub_23E717750();
  v29 = v24(v15, v12);
  MEMORY[0x24264FFC0](v29);
  v30 = v52;
  sub_23E7177E0();
  v60(v11, v30);
  v24(v18, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v15);
  sub_23E717750();
  v31 = v24(v15, v12);
  MEMORY[0x24264FFC0](v31);
  v32 = (void (*)(char *, uint64_t))v24;
  sub_23E7177E0();
  v60(v11, v30);
  v24(v18, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v33 = v53;
  sub_23E718B18();
  v34 = sub_23E718AF4();
  v36 = v35;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v33, v55);
  if (v36 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E5C33C8((unint64_t *)&qword_254336E40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], MEMORY[0x24BE4F2D0]);
    v38 = v50;
    v39 = v51;
    sub_23E7173F0();
    swift_release();
    v40 = v56;
    v41 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v47, v46, v12);
    v42 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56);
    v42(v41, 0, 1, v12);
    sub_23E717A14();
    sub_23E7177D4();
    v42(v41, 0, 1, v12);
    sub_23E717A38();
    sub_23E5F304C(v34, v36);
    v32(v57, v12);
    v44 = v48;
    v43 = v49;
    (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v49, v39, v38);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56))(v43, 0, 1, v38);
  }
  return result;
}

uint64_t sub_23E6FE27C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v36 = a1;
  v39 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v2);
  v37 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_23E717A44();
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v41 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718B24();
  v43 = *(_QWORD *)(v5 - 8);
  v44 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E717744();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE448];
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23E7177F8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = 0;
  v46 = 0xE000000000000000;
  sub_23E7190D0();
  sub_23E718B9C();
  v16 = sub_23E717798();
  MEMORY[0x24264FFC0](v16);
  sub_23E5C33C8(&qword_256D8CFD0, v8, MEMORY[0x24BDCE430]);
  sub_23E7177E0();
  v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v11, v7);
  v35 = v13;
  v18 = *(void (**)(char *, uint64_t))(v13 + 8);
  v18(v15, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v19 = sub_23E717798();
  MEMORY[0x24264FFC0](v19);
  sub_23E7177E0();
  v17(v11, v7);
  v18(v15, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v20 = sub_23E717798();
  MEMORY[0x24264FFC0](v20);
  sub_23E7177E0();
  v17(v11, v7);
  v18(v15, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v21 = sub_23E717798();
  MEMORY[0x24264FFC0](v21);
  sub_23E7177E0();
  v17(v11, v7);
  v18(v15, v12);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v22 = v42;
  sub_23E718B18();
  v23 = sub_23E718AF4();
  v25 = v24;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v22, v44);
  if (v25 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E5C33C8((unint64_t *)&qword_254336E40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], MEMORY[0x24BE4F2D0]);
    v27 = v40;
    v28 = v41;
    sub_23E7173F0();
    swift_release();
    v29 = v35;
    v30 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v37, v36, v12);
    v31 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56);
    v31(v30, 0, 1, v12);
    sub_23E717A14();
    sub_23E7177D4();
    v31(v30, 0, 1, v12);
    sub_23E717A38();
    sub_23E5F304C(v23, v25);
    v33 = v38;
    v32 = v39;
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v39, v28, v27);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 56))(v32, 0, 1, v27);
  }
  return result;
}

uint64_t sub_23E6FE7DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
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
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t result;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t);
  char *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;

  v57 = a1;
  v60 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v2);
  v58 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_23E717A44();
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v62 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E718B24();
  v69 = *(_QWORD *)(v5 - 8);
  v70 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v68 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E717744();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE448];
  v9 = *(_QWORD *)(v7 - 8);
  v10 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23E7177F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v65 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v55 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v55 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v55 - v23;
  sub_23E7177D4();
  v75 = 0;
  v76 = 0xE000000000000000;
  sub_23E7190D0();
  v25 = sub_23E718B9C();
  MEMORY[0x24264FFC0](v25);
  v74 = sub_23E5C33C8(&qword_256D8CFD0, v8, MEMORY[0x24BDCE430]);
  v72 = v24;
  sub_23E7177E0();
  v26 = *(void (**)(char *, uint64_t))(v9 + 8);
  v26(v12, v10);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v73 = 0x800000023E7239E0;
  sub_23E718B9C();
  sub_23E717750();
  sub_23E6FF6F0((uint64_t)v22);
  v56 = v14;
  v27 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
  v28 = v27(v19, v13);
  MEMORY[0x24264FFC0](v28);
  v63 = v10;
  sub_23E7177E0();
  v26(v12, v10);
  v71 = v26;
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v66 = 0x800000023E723A00;
  v67 = 0xD00000000000003CLL;
  sub_23E718B9C();
  sub_23E717750();
  sub_23E6FF6F0((uint64_t)v22);
  v29 = v27(v19, v13);
  MEMORY[0x24264FFC0](v29);
  v30 = v63;
  sub_23E7177E0();
  v31 = v30;
  v26(v12, v30);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v32 = (uint64_t)v65;
  sub_23E717750();
  sub_23E6FF6F0((uint64_t)v19);
  v27((char *)v32, v13);
  sub_23E6FF208(v32);
  v27(v19, v13);
  sub_23E717750();
  v33 = v27((char *)v32, v13);
  MEMORY[0x24264FFC0](v33);
  sub_23E7177E0();
  v34 = v71;
  v71(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  v64 = 0x800000023E723A40;
  v65 = (char *)0xD00000000000003DLL;
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v19);
  sub_23E717750();
  v35 = v27(v19, v13);
  MEMORY[0x24264FFC0](v35);
  sub_23E7177E0();
  v34(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v19);
  sub_23E717750();
  v36 = v27(v19, v13);
  MEMORY[0x24264FFC0](v36);
  sub_23E7177E0();
  v34(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v19);
  sub_23E717750();
  v37 = v27(v19, v13);
  MEMORY[0x24264FFC0](v37);
  sub_23E7177E0();
  v38 = v71;
  v71(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v19);
  sub_23E717750();
  v39 = v27(v19, v13);
  MEMORY[0x24264FFC0](v39);
  sub_23E7177E0();
  v38(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v19);
  sub_23E717750();
  v40 = v27(v19, v13);
  MEMORY[0x24264FFC0](v40);
  sub_23E7177E0();
  v41 = v71;
  v71(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  sub_23E6FF208((uint64_t)v19);
  sub_23E717750();
  v42 = v27(v19, v13);
  MEMORY[0x24264FFC0](v42);
  sub_23E7177E0();
  v41(v12, v31);
  v27(v22, v13);
  sub_23E718B9C();
  swift_bridgeObjectRelease();
  sub_23E718B9C();
  v43 = v68;
  sub_23E718B18();
  v44 = sub_23E718AF4();
  v46 = v45;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v43, v70);
  if (v46 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E5C33C8((unint64_t *)&qword_254336E40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F2B0], MEMORY[0x24BE4F2D0]);
    v48 = v61;
    v49 = v62;
    sub_23E7173F0();
    swift_release();
    v50 = v56;
    v51 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v58, v57, v13);
    v52 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56);
    v52(v51, 0, 1, v13);
    sub_23E717A14();
    sub_23E7177D4();
    v52(v51, 0, 1, v13);
    sub_23E717A38();
    sub_23E5F304C(v44, v46);
    v27(v72, v13);
    v53 = v59;
    v54 = v60;
    (*(void (**)(uint64_t, char *, uint64_t))(v59 + 32))(v60, v49, v48);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v53 + 56))(v54, 0, 1, v48);
  }
  return result;
}

uint64_t sub_23E6FF208@<X0>(uint64_t a1@<X8>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;

  v43 = a1;
  v1 = sub_23E7178D0();
  v56 = *(_QWORD *)(v1 - 8);
  v57 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v55 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_23E7178DC();
  v54 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v53 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_23E7178B8();
  v59 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v51 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E717930();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8C150);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFD8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23E717510();
  v49 = *(_QWORD *)(v15 - 8);
  v50 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v58 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23E717948();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v47 = (char *)&v43 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v23);
  v46 = (char *)&v43 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E717900();
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v45 = v17;
  v25(v14, 1, 1, v17);
  v26 = sub_23E71799C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v11, 1, 1, v26);
  sub_23E717900();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCF258], v5);
  sub_23E71793C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v44 = *(void (**)(char *, uint64_t))(v18 + 8);
  v44(v21, v17);
  sub_23E717504();
  v28 = v51;
  v27 = v52;
  (*(void (**)(char *, _QWORD, uint64_t))(v59 + 104))(v51, *MEMORY[0x24BDCF018], v52);
  v29 = v53;
  v30 = v54;
  v31 = v48;
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v53, *MEMORY[0x24BDCF0B0], v48);
  v32 = v55;
  v33 = v56;
  v34 = v57;
  (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v55, *MEMORY[0x24BDCF068], v57);
  v35 = v46;
  v36 = v28;
  v37 = v29;
  v38 = v32;
  v39 = v47;
  sub_23E71790C();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v38, v34);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v37, v31);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v36, v27);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v58, v50);
  v44(v39, v45);
  v40 = sub_23E7177F8();
  v41 = *(_QWORD *)(v40 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48))(v35, 1, v40);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 32))(v43, v35, v40);
  __break(1u);
  return result;
}

uint64_t sub_23E6FF6F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  char *v21;
  uint64_t v22;
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
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v34 = a1;
  v1 = sub_23E7178D0();
  v44 = *(_QWORD *)(v1 - 8);
  v45 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_23E7178DC();
  v39 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_23E7178B8();
  v35 = *(_QWORD *)(v46 - 8);
  v5 = v35;
  MEMORY[0x24BDAC7A8](v46);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8C150);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFD8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23E717510();
  v40 = *(_QWORD *)(v14 - 8);
  v41 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23E717948();
  v18 = *(_QWORD *)(v17 - 8);
  v37 = v17;
  v38 = v18;
  v19 = v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  MEMORY[0x24BDAC7A8](v22);
  v36 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E717900();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v13, 1, 1, v17);
  v24 = sub_23E71799C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 1, 1, v24);
  sub_23E717504();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCF018], v46);
  v25 = v39;
  v26 = v42;
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v4, *MEMORY[0x24BDCF0B0], v42);
  v28 = v43;
  v27 = v44;
  v29 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDCF068], v45);
  v30 = v36;
  sub_23E71790C();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v26);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v46);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v16, v41);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v37);
  v31 = sub_23E7177F8();
  v32 = *(_QWORD *)(v31 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v34, v30, v31);
  __break(1u);
  return result;
}

id IntervalBlocks.unitAsInt.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_unit);
}

id IntervalBlocks.commodityAsInt.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_commodity);
}

id IntervalBlocks.flowDirectionAsInt.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_flowDirection);
}

id static IntervalBlocks.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_23E718AC4();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

id IntervalBlocks.unitAsInt.setter(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setUnit_, a1);
}

id IntervalBlocks.commodityAsInt.setter(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setCommodity_, a1);
}

id IntervalBlocks.flowDirectionAsInt.setter(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setFlowDirection_, a1);
}

void sub_23E6FFBDC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_readings);
  v4 = sub_23E71769C();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

id (*IntervalBlocks.unitAsInt.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_unit);
  return sub_23E6FFC70;
}

id sub_23E6FFC70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setUnit_, *(_QWORD *)a1);
}

id (*IntervalBlocks.flowDirectionAsInt.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_flowDirection);
  return sub_23E6FFCC4;
}

id sub_23E6FFCC4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setFlowDirection_, *(_QWORD *)a1);
}

id (*IntervalBlocks.commodityAsInt.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_commodity);
  return sub_23E6FFD18;
}

id sub_23E6FFD18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setCommodity_, *(_QWORD *)a1);
}

void sub_23E6FFD2C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_recordID, a2);
}

void sub_23E6FFD48(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setRecordID_);
}

char *keypath_get_selector_meterID()
{
  return sel_meterID;
}

void sub_23E6FFD68(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_meterID, a2);
}

void sub_23E6FFD84(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setMeterID_);
}

void sub_23E6FFD98(id *a1, uint64_t a2, uint64_t a3)
{
  sub_23E5C5BF0(a1, a2, a3, (SEL *)&selRef_start);
}

void sub_23E6FFDB4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_8Tm(a1, a2, a3, a4, (SEL *)&selRef_setStart_);
}

void sub_23E6FFDC0(id *a1, uint64_t a2, uint64_t a3)
{
  sub_23E5C5BF0(a1, a2, a3, (SEL *)&selRef_end);
}

void sub_23E6FFDDC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_8Tm(a1, a2, a3, a4, (SEL *)&selRef_setEnd_);
}

void sub_23E6FFDE8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_23E5C5BF0(a1, a2, a3, (SEL *)&selRef_sourceTime);
}

void sub_23E6FFE04(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_8Tm(a1, a2, a3, a4, (SEL *)&selRef_setSourceTime_);
}

void sub_23E6FFE10(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_zoneName, a2);
}

void sub_23E6FFE2C(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setZoneName_);
}

void sub_23E6FFE40(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_utilityID, a2);
}

void sub_23E6FFE5C(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setUtilityID_);
}

void sub_23E6FFE70(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_subscriptionID, a2);
}

void sub_23E6FFE8C(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setSubscriptionID_);
}

void sub_23E6FFEA0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_usagePointID, a2);
}

void sub_23E6FFEBC(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setUsagePointID_);
}

void sub_23E6FFED0(id *a1, uint64_t a2, uint64_t a3)
{
  sub_23E5C5BF0(a1, a2, a3, (SEL *)&selRef_creationDate);
}

void sub_23E6FFEEC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_8Tm(a1, a2, a3, a4, (SEL *)&selRef_setCreationDate_);
}

char *keypath_get_selector_readings()
{
  return sel_readings;
}

void sub_23E6FFF08(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCDCA0], (SEL *)&selRef_setReadings_);
}

char *keypath_get_selector_preprocessed()
{
  return sel_preprocessed;
}

id sub_23E6FFF28@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preprocessed);
  *a2 = (_BYTE)result;
  return result;
}

id sub_23E6FFF58(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreprocessed_, *a1);
}

id sub_23E6FFF6C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_unit);
  *a2 = result;
  return result;
}

id sub_23E6FFF9C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUnit_, *a1);
}

id sub_23E6FFFB0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_flowDirection);
  *a2 = result;
  return result;
}

id sub_23E6FFFE0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFlowDirection_, *a1);
}

id sub_23E6FFFF4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_commodity);
  *a2 = result;
  return result;
}

id sub_23E700024(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCommodity_, *a1);
}

id EnergyWindowNotifications.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id EnergyWindowNotifications.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for EnergyWindowNotifications();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for EnergyWindowNotifications()
{
  return objc_opt_self();
}

id EnergyWindowNotifications.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EnergyWindowNotifications();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23E700190(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint8_t *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  uint64_t v32;
  uint8_t *v33;
  _BYTE *v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  uint8_t *v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t inited;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  uint8_t *v74;
  _BYTE *v75;
  id v76;
  uint8_t *v77;
  uint8_t *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  __int128 aBlock;
  __int128 v87;
  uint64_t (*v88)();
  uint64_t v89;
  _QWORD v90[6];

  v90[5] = *MEMORY[0x24BDAC8D0];
  v81 = sub_23E7188F0();
  v82 = *(_QWORD *)(v81 - 8);
  v8 = MEMORY[0x24BDAC7A8](v81);
  v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v74 - v11;
  v13 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_23E718AC4();
  swift_bridgeObjectRelease();
  v15 = (uint8_t *)objc_msgSend(v13, sel_initWithEntityName_, v14);

  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB5E8]), sel_initWithFetchRequest_, v15);
  objc_msgSend(v16, sel_setResultType_, 1);
  v79 = a3;
  v17 = *(void **)(a3 + 48);
  *(_QWORD *)&aBlock = 0;
  v18 = objc_msgSend(v17, sel_executeRequest_error_, v16, &aBlock);
  v19 = (void *)aBlock;
  if (v18)
  {
    v20 = v18;
    objc_opt_self();
    v21 = (uint8_t *)swift_dynamicCastObjCClass();
    v22 = v19;
    if (v21)
    {
      v78 = v21;
      if (-[uint8_t result](v21, sel_result))
      {
        sub_23E719004();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v90, 0, 32);
      }
      sub_23E5C4F94((uint64_t)v90, (uint64_t)&aBlock);
      if (*((_QWORD *)&v87 + 1))
      {
        v76 = v16;
        v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BFF0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v77 = v15;
          v75 = a4;
          v52 = v90[0];
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339120);
          inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_23E71A510;
          *(_QWORD *)&aBlock = sub_23E718AE8();
          *((_QWORD *)&aBlock + 1) = v54;
          sub_23E719094();
          *(_QWORD *)(inited + 96) = v51;
          *(_QWORD *)(inited + 72) = v52;
          sub_23E69FB94(inited);
          v55 = (void *)objc_opt_self();
          v56 = (void *)sub_23E718A28();
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C80);
          v57 = swift_allocObject();
          *(_OWORD *)(v57 + 16) = xmmword_23E71A500;
          v58 = *(void **)(v79 + 48);
          *(_QWORD *)(v57 + 32) = v58;
          *(_QWORD *)&aBlock = v57;
          sub_23E718C50();
          sub_23E5DC5A0(0, &qword_256D8BFF8);
          v59 = v58;
          v60 = (void *)sub_23E718C20();
          swift_bridgeObjectRelease();
          objc_msgSend(v55, sel_mergeChangesFromRemoteContextSave_intoContexts_, v56, v60);

          if (qword_254337B10 != -1)
            swift_once();
          v61 = v81;
          v62 = __swift_project_value_buffer(v81, (uint64_t)qword_254339400);
          swift_beginAccess();
          v63 = v82;
          (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v12, v62, v61);
          swift_bridgeObjectRetain_n();
          v64 = sub_23E7188D8();
          v65 = sub_23E718DDC();
          if (os_log_type_enabled(v64, v65))
          {
            v66 = (uint8_t *)swift_slowAlloc();
            v67 = swift_slowAlloc();
            *(_QWORD *)&aBlock = v67;
            *(_DWORD *)v66 = 136446210;
            v74 = v66 + 4;
            swift_bridgeObjectRetain();
            v85 = (id)sub_23E60EA08(a1, a2, (uint64_t *)&aBlock);
            sub_23E718FC8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23E5C0000, v64, v65, "Sucessfully deleted all data for %{public}s", v66, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x242652480](v67, -1, -1);
            MEMORY[0x242652480](v66, -1, -1);

            (*(void (**)(char *, uint64_t))(v82 + 8))(v12, v61);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v63 + 8))(v12, v61);
          }
          v68 = v77;
          v69 = v79;
          v70 = *(void **)(v79 + 48);
          v71 = swift_allocObject();
          *(_QWORD *)(v71 + 16) = sub_23E5FA82C;
          *(_QWORD *)(v71 + 24) = v69;
          v88 = sub_23E5DBE4C;
          v89 = v71;
          *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
          *((_QWORD *)&aBlock + 1) = 1107296256;
          *(_QWORD *)&v87 = sub_23E6ED3F0;
          *((_QWORD *)&v87 + 1) = &block_descriptor_25;
          v72 = _Block_copy(&aBlock);
          v73 = v70;
          swift_retain();
          swift_retain();
          swift_release();
          objc_msgSend(v73, sel_performBlockAndWait_, v72);

          _Block_release(v72);
          LOBYTE(v72) = swift_isEscapingClosureAtFileLocation();

          swift_release();
          swift_release();
          if ((v72 & 1) != 0)
            __break(1u);
          *v75 = 1;
        }
        else
        {

          *a4 = 0;
        }
        return;
      }

      v15 = v78;
    }
    else
    {

      v87 = 0u;
      aBlock = 0u;
    }

    sub_23E705A80((uint64_t)&aBlock);
    *a4 = 0;
    return;
  }
  v23 = (id)aBlock;
  v24 = (void *)sub_23E7175AC();

  swift_willThrow();
  v85 = v24;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
  sub_23E5DC5A0(0, &qword_2543390D8);
  swift_dynamicCast();
  v25 = v84;
  if (qword_254337B10 != -1)
    swift_once();
  v26 = v81;
  v27 = __swift_project_value_buffer(v81, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v10, v27, v26);
  v28 = v25;
  v29 = sub_23E7188D8();
  v30 = sub_23E718DD0();
  v31 = v30;
  if (os_log_type_enabled(v29, v30))
  {
    v80 = v31;
    v32 = swift_slowAlloc();
    v77 = v15;
    v33 = (uint8_t *)v32;
    v79 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v79;
    v78 = v33;
    *(_DWORD *)v33 = 136446210;
    v76 = v33 + 4;
    v34 = a4;
    v35 = objc_msgSend(v28, sel_localizedDescription);
    v36 = v16;
    v37 = sub_23E718AE8();
    v39 = v38;

    v40 = v37;
    v16 = v36;
    v83 = sub_23E60EA08(v40, v39, (uint64_t *)&aBlock);
    sub_23E718FC8();

    v41 = v28;
    swift_bridgeObjectRelease();
    v42 = v78;
    _os_log_impl(&dword_23E5C0000, v29, (os_log_type_t)v80, "Failed to batch delete data %{public}s", v78, 0xCu);
    v43 = v79;
    swift_arrayDestroy();
    MEMORY[0x242652480](v43, -1, -1);
    v15 = v77;
    MEMORY[0x242652480](v42, -1, -1);

    (*(void (**)(char *, uint64_t))(v82 + 8))(v10, v81);
  }
  else
  {

    v44 = a4;
    v41 = v28;

    v45 = v26;
    v34 = v44;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v10, v45);
  }
  v46 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v47 = objc_msgSend(v46, sel_processName);

  v48 = sub_23E718AE8();
  v50 = v49;

  LOWORD(aBlock) = 513;
  BYTE2(aBlock) = 6;
  *((_QWORD *)&aBlock + 1) = v48;
  v87 = v50;
  static AutoBugCaptureManager.sendIssue(_:)((char *)&aBlock);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *v34 = 0;
}

uint64_t sub_23E700C64()
{
  uint64_t result;

  type metadata accessor for HomeEnergyDataManager();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4B00];
  qword_2543393B8 = result;
  return result;
}

uint64_t sub_23E700C98(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  char v14;
  char v15;
  uint64_t result;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  id v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[3];

  v9 = sub_23E7188F0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t *)(v4 + 16);
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v4 + 16) + 16)
    || (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23E7015C8(a3, a4),
        v15 = v14,
        swift_bridgeObjectRelease(),
        result = swift_bridgeObjectRelease(),
        (v15 & 1) == 0))
  {
    if (qword_254337B10 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v9, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v17, v9);
    swift_bridgeObjectRetain_n();
    v18 = sub_23E7188D8();
    v19 = v10;
    v20 = sub_23E718DDC();
    if (os_log_type_enabled(v18, v20))
    {
      v34 = a3;
      v21 = swift_slowAlloc();
      v33 = a2;
      v22 = (uint8_t *)v21;
      v23 = swift_slowAlloc();
      v32 = a1;
      v24 = v23;
      v36[0] = v23;
      v31 = v19;
      *(_DWORD *)v22 = 136446210;
      swift_bridgeObjectRetain();
      v35 = sub_23E60EA08(v34, a4, v36);
      a3 = v34;
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v18, v20, "Creating model %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      v25 = v24;
      a1 = v32;
      MEMORY[0x242652480](v25, -1, -1);
      v26 = v22;
      a2 = v33;
      MEMORY[0x242652480](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v9);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v9);
    }
    type metadata accessor for CoreDataStack();
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 56) = 0;
    *(_QWORD *)(v27 + 64) = 0;
    *(_QWORD *)(v27 + 16) = a1;
    *(_QWORD *)(v27 + 24) = a2;
    *(_QWORD *)(v27 + 32) = a3;
    *(_QWORD *)(v27 + 40) = a4;
    v28 = objc_allocWithZone(MEMORY[0x24BDBB6A0]);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    *(_QWORD *)(v27 + 48) = objc_msgSend(v28, sel_initWithConcurrencyType_, 1);

    swift_retain();
    v29 = *(id *)(v27 + 48);
    swift_release();
    objc_msgSend(v29, sel_setShouldRefreshAfterSave_, 1);

    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v35 = *v13;
    *v13 = 0x8000000000000000;
    sub_23E703940(v27, a3, a4, isUniquelyReferenced_nonNull_native);
    *v13 = v35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_23E701040(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  char v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v39 = a1;
  v40 = a2;
  v7 = sub_23E7188F0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v35 - v12;
  v14 = (uint64_t *)(v4 + 16);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v4 + 16) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23E7015C8(a3, a4),
        v16 = v15,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v16 & 1) != 0))
  {
    if (qword_254337B10 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v7, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v17, v7);
    swift_bridgeObjectRetain_n();
    v18 = sub_23E7188D8();
    v19 = sub_23E718DDC();
    if (os_log_type_enabled(v18, v19))
    {
      v38 = v7;
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v37 = v8;
      v22 = v21;
      v42 = v21;
      *(_DWORD *)v20 = 136446210;
      swift_bridgeObjectRetain();
      v41 = sub_23E60EA08(a3, a4, &v42);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v18, v19, "Model %{public}s already exists", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v22, -1, -1);
      MEMORY[0x242652480](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v38);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v7, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v23, v7);
    swift_bridgeObjectRetain_n();
    v24 = sub_23E7188D8();
    v25 = sub_23E718DDC();
    if (os_log_type_enabled(v24, v25))
    {
      v36 = v14;
      v26 = swift_slowAlloc();
      v37 = v8;
      v27 = (uint8_t *)v26;
      v28 = swift_slowAlloc();
      v38 = v7;
      v29 = v28;
      v42 = v28;
      *(_DWORD *)v27 = 136446210;
      swift_bridgeObjectRetain();
      v41 = sub_23E60EA08(a3, a4, &v42);
      v14 = v36;
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v24, v25, "Creating model %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v29, -1, -1);
      MEMORY[0x242652480](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v38);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
    sub_23E700C98(v39, v40, a3, a4);
  }
  v30 = *v14;
  if (!*(_QWORD *)(*v14 + 16))
    return 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31 = sub_23E7015C8(a3, a4);
  if ((v32 & 1) != 0)
  {
    v33 = *(_QWORD *)(*(_QWORD *)(v30 + 56) + 8 * v31);
    swift_retain();
  }
  else
  {
    v33 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v33;
}

uint64_t type metadata accessor for HomeEnergyDataManager()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for HomeEnergyDataManager.Model()
{
  return &type metadata for HomeEnergyDataManager.Model;
}

unint64_t sub_23E701548(uint64_t a1)
{
  uint64_t v2;

  sub_23E718AE8();
  sub_23E7192BC();
  sub_23E718B6C();
  v2 = sub_23E7192D4();
  swift_bridgeObjectRelease();
  return sub_23E7040F8(a1, v2);
}

unint64_t sub_23E7015C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23E7192BC();
  sub_23E718B6C();
  v4 = sub_23E7192D4();
  return sub_23E70426C(a1, a2, v4);
}

unint64_t sub_23E70162C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E71907C();
  return sub_23E70434C(a1, v2);
}

unint64_t sub_23E70165C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E718F74();
  return sub_23E704410(a1, v2);
}

unint64_t sub_23E70168C(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_23E7177F8();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  sub_23E5C33C8(&qword_256D8AD80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  v3 = sub_23E718A64();
  return sub_23E7045C4(a1, v3, v2, &qword_256D8BCD0, MEMORY[0x24BDCE958]);
}

unint64_t sub_23E701724(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E7192B0();
  return sub_23E704528(a1, v2);
}

unint64_t sub_23E701754(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_23E717630();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0];
  sub_23E5C33C8(&qword_256D8B9B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  v3 = sub_23E718A64();
  return sub_23E7045C4(a1, v3, v2, &qword_256D8CFF8, MEMORY[0x24BDCDB00]);
}

uint64_t sub_23E7017EC(uint64_t a1, char a2)
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
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  __int128 v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543390F8);
  v6 = a2;
  v7 = sub_23E719184();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v36)
          goto LABEL_33;
        v24 = v37[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v36)
            goto LABEL_33;
          v24 = v37[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v36)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v5 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v37[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v36)
                  goto LABEL_33;
                v24 = v37[v14];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v14 = v25;
          }
        }
LABEL_30:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v38 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
        v34 = *((id *)&v38 + 1);
      }
      sub_23E7192BC();
      sub_23E718B6C();
      result = sub_23E7192D4();
      v15 = -1 << *(_BYTE *)(v8 + 32);
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
            goto LABEL_39;
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
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v38;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_23E701B00(uint64_t a1, char a2)
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
  _QWORD *v18;
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
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254336928);
  v36 = a2;
  v6 = sub_23E719184();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_23E7192BC();
    sub_23E718B6C();
    result = sub_23E7192D4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23E701E14(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254337C60);
  v6 = sub_23E719184();
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
        sub_23E5F4874(v24, v35);
      }
      else
      {
        sub_23E5F4838((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_23E7192BC();
      sub_23E718B6C();
      result = sub_23E7192D4();
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
      result = (uint64_t)sub_23E5F4874(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23E702110(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t i;
  int v47;

  v3 = v2;
  v5 = sub_23E7177F8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8D000);
  v47 = a2;
  v10 = sub_23E719184();
  v11 = v10;
  if (*(_QWORD *)(v9 + 16))
  {
    v42 = v2;
    v12 = 1 << *(_BYTE *)(v9 + 32);
    v13 = *(_QWORD *)(v9 + 64);
    v44 = (_QWORD *)(v9 + 64);
    if (v12 < 64)
      v14 = ~(-1 << v12);
    else
      v14 = -1;
    v15 = v14 & v13;
    v43 = (unint64_t)(v12 + 63) >> 6;
    v16 = v10 + 64;
    result = swift_retain();
    v18 = 0;
    v45 = v6;
    for (i = v9; ; v9 = i)
    {
      if (v15)
      {
        v22 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v23 = v22 | (v18 << 6);
      }
      else
      {
        v24 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v24 >= v43)
          goto LABEL_34;
        v25 = v44[v24];
        ++v18;
        if (!v25)
        {
          v18 = v24 + 1;
          if (v24 + 1 >= v43)
            goto LABEL_34;
          v25 = v44[v18];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v43)
            {
LABEL_34:
              swift_release();
              v3 = v42;
              if ((v47 & 1) != 0)
              {
                v41 = 1 << *(_BYTE *)(v9 + 32);
                if (v41 >= 64)
                  bzero(v44, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v44 = -1 << v41;
                *(_QWORD *)(v9 + 16) = 0;
              }
              break;
            }
            v25 = v44[v26];
            if (!v25)
            {
              while (1)
              {
                v18 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_41;
                if (v18 >= v43)
                  goto LABEL_34;
                v25 = v44[v18];
                ++v26;
                if (v25)
                  goto LABEL_21;
              }
            }
            v18 = v26;
          }
        }
LABEL_21:
        v15 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v18 << 6);
      }
      v27 = v6;
      v28 = *(_QWORD *)(v6 + 72);
      v29 = *(_QWORD *)(v9 + 48) + v28 * v23;
      if ((v47 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v27 + 32))(v8, v29, v5);
        v30 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v23);
        v31 = *v30;
        v32 = v30[1];
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v8, v29, v5);
        v33 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 16 * v23);
        v31 = *v33;
        v32 = v33[1];
        sub_23E5DB72C(*v33, v32);
      }
      sub_23E5C33C8(&qword_256D8AD80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
      result = sub_23E718A64();
      v34 = -1 << *(_BYTE *)(v11 + 32);
      v35 = result & ~v34;
      v36 = v35 >> 6;
      if (((-1 << v35) & ~*(_QWORD *)(v16 + 8 * (v35 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v16 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v37 = 0;
        v38 = (unint64_t)(63 - v34) >> 6;
        do
        {
          if (++v36 == v38 && (v37 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v39 = v36 == v38;
          if (v36 == v38)
            v36 = 0;
          v37 |= v39;
          v40 = *(_QWORD *)(v16 + 8 * v36);
        }
        while (v40 == -1);
        v19 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = *(_QWORD *)(v11 + 48) + v28 * v19;
      v6 = v45;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v45 + 32))(v20, v8, v5);
      v21 = (uint64_t *)(*(_QWORD *)(v11 + 56) + 16 * v19);
      *v21 = v31;
      v21[1] = v32;
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_23E7024A8(uint64_t a1, int a2)
{
  uint64_t *v2;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;

  v4 = sub_23E7177F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v2;
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D8AD98);
  v9 = sub_23E719184();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release();
    v35 = v39;
LABEL_42:
    *v35 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  v38 = a2;
  v18 = 16;
  if ((a2 & 1) != 0)
    v18 = 32;
  v42 = v18;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v22 >= v40)
    {
      swift_release();
      v35 = v39;
      v23 = v41;
      if ((v38 & 1) != 0)
      {
LABEL_37:
        v36 = 1 << *(_BYTE *)(v8 + 32);
        if (v36 >= 64)
          bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v23 = -1 << v36;
        *(_QWORD *)(v8 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
        break;
    }
LABEL_23:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_24:
    v26 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + v42))(v7, *(_QWORD *)(v8 + 48) + v26 * v21, v4);
    v27 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v21);
    sub_23E5C33C8(&qword_256D8AD80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    result = sub_23E718A64();
    v28 = -1 << *(_BYTE *)(v10 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v15 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v15 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v26 * v19, v7, v4);
    *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v19) = v27;
    ++*(_QWORD *)(v10 + 16);
  }
  v25 = v22 + 2;
  if (v25 >= v40)
  {
LABEL_34:
    swift_release();
    v35 = v39;
    if ((v38 & 1) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v24 = v41[v25];
  if (v24)
  {
    v17 = v25;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v17 >= v40)
      goto LABEL_34;
    v24 = v41[v17];
    ++v25;
    if (v24)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_23E702838(uint64_t a1, char a2)
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
  _QWORD *v18;
  _QWORD *v19;
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
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFF0);
  v42 = a2;
  v6 = sub_23E719184();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v40 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v38 = v2;
  v39 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_33;
      v24 = v40[v13];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_33:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v39)
              goto LABEL_33;
            v24 = v40[v13];
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 24 * v21);
    v35 = *v33;
    v34 = v33[1];
    v36 = v33[2];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23E7192BC();
    sub_23E718B6C();
    result = sub_23E7192D4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * v17);
    *v19 = v35;
    v19[1] = v34;
    v19[2] = v36;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23E702B74(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8D008);
  result = sub_23E719184();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_23E7192B0();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23E702E18(uint64_t a1, char a2)
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
  _QWORD *v18;
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
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254339100);
  v38 = a2;
  v6 = sub_23E719184();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_23E7192BC();
    sub_23E718B6C();
    result = sub_23E7192D4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23E703124(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFE0);
  result = sub_23E719184();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_23E7192B0();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23E7033CC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
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
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = sub_23E717F3C();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23E7177F8();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFE8);
  v11 = sub_23E719184();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_23E5C33C8(&qword_256D8AD80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    result = sub_23E718A64();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_23E7037C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_23E7015C8(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_23E7046F4();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7] + 16 * v14;

      result = swift_release();
      *(_QWORD *)v21 = a1;
      *(_QWORD *)(v21 + 8) = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23E7017EC(v17, a5 & 1);
  v23 = sub_23E7015C8(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23E719244();
  __break(1u);
  return result;
}

uint64_t sub_23E703940(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23E7015C8(a2, a3);
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
    sub_23E7048C0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
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
  sub_23E701B00(v15, a4 & 1);
  v21 = sub_23E7015C8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23E719244();
  __break(1u);
  return result;
}

_OWORD *sub_23E703A9C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_23E7015C8(a2, a3);
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
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_23E5F4874(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23E704A74();
      goto LABEL_7;
    }
    sub_23E701E14(v15, a4 & 1);
    v21 = sub_23E7015C8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23E703FD8(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_23E719244();
  __break(1u);
  return result;
}

void sub_23E703BCC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23E7015C8(a2, a3);
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
    sub_23E705464();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_23E702E18(v15, a4 & 1);
  v20 = sub_23E7015C8(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_23E719244();
  __break(1u);
}

uint64_t sub_23E703D28(uint64_t a1, char a2, double a3)
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
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_23E701724(a1);
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
  if (v15 >= result && (a2 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a2 & 1) == 0)
  {
    result = (uint64_t)sub_23E705614();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(double *)(v16[7] + 8 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v18 = 8 * v10;
    *(_QWORD *)(v16[6] + v18) = a1;
    *(double *)(v16[7] + v18) = a3;
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
  sub_23E703124(result, a2 & 1);
  result = sub_23E701724(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23E719244();
  __break(1u);
  return result;
}

uint64_t sub_23E703E50(uint64_t a1, uint64_t a2, char a3)
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
  v8 = sub_23E7177F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23E70168C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
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
        v22 = sub_23E717F3C();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_23E7057A0();
      goto LABEL_7;
    }
    sub_23E7033CC(v17, a3 & 1);
    v24 = sub_23E70168C(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_23E704040(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_23E719244();
  __break(1u);
  return result;
}

_OWORD *sub_23E703FD8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_23E5F4874(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23E704040(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
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
  v9 = sub_23E7177F8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = sub_23E717F3C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

unint64_t sub_23E7040F8(uint64_t a1, uint64_t a2)
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
    v6 = sub_23E718AE8();
    v8 = v7;
    if (v6 == sub_23E718AE8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_23E719208();
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
          v13 = sub_23E718AE8();
          v15 = v14;
          if (v13 == sub_23E718AE8() && v15 == v16)
            break;
          v18 = sub_23E719208();
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

unint64_t sub_23E70426C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23E719208() & 1) == 0)
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
      while (!v14 && (sub_23E719208() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23E70434C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23E6CA084(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242651C64](v9, a1);
      sub_23E6135B0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23E704410(uint64_t a1, uint64_t a2)
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
    sub_23E5DC5A0(0, (unint64_t *)&qword_254337DD0);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_23E718F80();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_23E718F80();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_23E704528(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_23E7045C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_23E5C33C8(v21, v20, v22);
      v17 = sub_23E718AAC();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

id sub_23E7046F4()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543390F8);
  v2 = *v0;
  v3 = sub_23E719178();
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
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    swift_retain();
    result = *((id *)&v24 + 1);
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

void *sub_23E7048C0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254336928);
  v2 = *v0;
  v3 = sub_23E719178();
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
    result = (void *)swift_retain();
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

void *sub_23E704A74()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254337C60);
  v2 = *v0;
  v3 = sub_23E719178();
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
    sub_23E5F4838(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23E5F4874(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_23E704C58()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v37 = sub_23E7177F8();
  v1 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v36 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8D000);
  v33 = v0;
  v3 = *v0;
  v4 = sub_23E719178();
  v5 = *(_QWORD *)(v3 + 16);
  v39 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v31 = v39;
    v30 = v33;
LABEL_28:
    *v30 = v31;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    v6 = v39;
  }
  v34 = v3 + 64;
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v38 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v15 = v36;
  v14 = v37;
  v16 = v39;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v10 << 6);
      v19 = v38;
      goto LABEL_12;
    }
    v27 = v10 + 1;
    v19 = v38;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v27 >= v35)
      goto LABEL_26;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    ++v10;
    if (!v28)
    {
      v10 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_26;
      v28 = *(_QWORD *)(v34 + 8 * v10);
      if (!v28)
        break;
    }
LABEL_25:
    v13 = (v28 - 1) & v28;
    v18 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(_QWORD *)(v19 + 48) + v20, v14);
    v21 = *(_QWORD *)(v19 + 56);
    v22 = 16 * v18;
    v23 = (uint64_t *)(v21 + 16 * v18);
    v24 = *v23;
    v25 = v23[1];
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v16 + 48) + v20, v15, v14);
    v26 = (uint64_t *)(*(_QWORD *)(v16 + 56) + v22);
    *v26 = v24;
    v26[1] = v25;
    result = (void *)sub_23E5DB72C(v24, v25);
  }
  v29 = v27 + 2;
  if (v29 >= v35)
  {
LABEL_26:
    result = (void *)swift_release();
    v30 = v33;
    v31 = v39;
    goto LABEL_28;
  }
  v28 = *(_QWORD *)(v34 + 8 * v29);
  if (v28)
  {
    v10 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v10 >= v35)
      goto LABEL_26;
    v28 = *(_QWORD *)(v34 + 8 * v10);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23E704ECC()
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
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v1 = v0;
  v2 = sub_23E7177F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256D8AD98);
  v6 = *v0;
  v7 = sub_23E719178();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v26 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v22 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v22);
    ++v12;
    if (!v23)
    {
      v12 = v22 + 1;
      if (v22 + 1 >= v16)
        goto LABEL_26;
      v23 = *(_QWORD *)(v26 + 8 * v12);
      if (!v23)
        break;
    }
LABEL_25:
    v15 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + v20);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v21;
  }
  v24 = v22 + 2;
  if (v24 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v26 + 8 * v24);
  if (v23)
  {
    v12 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v23 = *(_QWORD *)(v26 + 8 * v12);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23E705100()
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
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFF0);
  v2 = *v0;
  v3 = sub_23E719178();
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
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v20);
    v23 = *v21;
    v22 = v21[1];
    v24 = v21[2];
    v25 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v25 = v19;
    v25[1] = v18;
    v26 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v20);
    *v26 = v23;
    v26[1] = v22;
    v26[2] = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23E7052D8()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8D008);
  v2 = *v0;
  v3 = sub_23E719178();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_23E705464()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254339100);
  v2 = *v0;
  v3 = sub_23E719178();
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

void *sub_23E705614()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFE0);
  v2 = *v0;
  v3 = sub_23E719178();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_23E7057A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = sub_23E717F3C();
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_23E7177F8();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8CFE8);
  v33 = v0;
  v3 = *v0;
  v4 = sub_23E719178();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23E705A80(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254337C90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E705AC0()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_21(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_21()
{
  return swift_release();
}

void defaultLogger(_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23E705B1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_254336920 != -1)
    swift_once();
  v1 = sub_23E7188F0();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_254339420);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v0, v2, v1);
}

uint64_t ekSignposter()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256D8A360 != -1)
    swift_once();
  v2 = sub_23E718890();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256D93108);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id defaultLog()()
{
  if (qword_254337BB8 != -1)
    swift_once();
  return (id)qword_254339418;
}

uint64_t sub_23E705D0C()
{
  uint64_t result;

  sub_23E70656C();
  result = sub_23E718FA4();
  qword_254339418 = result;
  return result;
}

uint64_t sub_23E705D64(uint64_t a1)
{
  return sub_23E706178(a1, qword_254339420);
}

uint64_t sub_23E705D80(uint64_t a1)
{
  return sub_23E706178(a1, qword_256D930F0);
}

uint64_t sub_23E705DAC(uint64_t a1)
{
  return sub_23E706178(a1, qword_254339400);
}

uint64_t sub_23E705DC8(uint64_t a1)
{
  return sub_23E706178(a1, qword_254339458);
}

uint64_t sub_23E705DEC()
{
  uint64_t v0;

  v0 = sub_23E718890();
  __swift_allocate_value_buffer(v0, qword_256D93108);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D93108);
  return sub_23E718884();
}

uint64_t Logging.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23E705E90 + 4 * byte_23E71D974[*v0]))(0x6E6F6D656144, 0xE600000000000000);
}

uint64_t sub_23E705E90()
{
  return 0x646572616853;
}

uint64_t sub_23E705EA0()
{
  return 0x7246746E65696C43;
}

uint64_t sub_23E705EC4()
{
  return 0x636974796C616E41;
}

HomeEnergyDaemon::Logging_optional __swiftcall Logging.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (HomeEnergyDaemon::Logging_optional)rawValue;
}

uint64_t Logging.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

HomeEnergyDaemon::Logging_optional sub_23E705EFC(Swift::Int *a1)
{
  return Logging.init(rawValue:)(*a1);
}

uint64_t sub_23E705F04()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23E705F30 + 4 * byte_23E71D978[*v0]))(0x6E6F6D656144, 0xE600000000000000);
}

uint64_t sub_23E705F30()
{
  return 0x646572616853;
}

uint64_t sub_23E705F40()
{
  return 0x7246746E65696C43;
}

uint64_t sub_23E705F64()
{
  return 0x636974796C616E41;
}

void setDefaultLog(_:)(void *a1)
{
  id v2;
  id v3;

  if (qword_254337BB8 != -1)
    swift_once();
  v3 = (id)qword_254339418;
  qword_254339418 = (uint64_t)a1;
  v2 = a1;

}

uint64_t setDefaultDaemonLogger(_:)(uint64_t a1)
{
  return sub_23E70601C(a1, &qword_254337B10, (uint64_t)qword_254339400);
}

uint64_t setDefaultFrameworkLogger(_:)(uint64_t a1)
{
  return sub_23E70601C(a1, &qword_256D8A358, (uint64_t)qword_256D930F0);
}

uint64_t sub_23E70601C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (*a2 != -1)
    swift_once();
  v5 = sub_23E7188F0();
  v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(v6, a1, v5);
  return swift_endAccess();
}

uint64_t setDefaultAnalyticsLogger(_:)(uint64_t a1)
{
  return sub_23E70601C(a1, &qword_254338F58, (uint64_t)qword_254339458);
}

uint64_t setDefaultLogger(_:)(uint64_t a1)
{
  return sub_23E70601C(a1, &qword_254336920, (uint64_t)qword_254339420);
}

Swift::Void __swiftcall setProcessName(_:)(Swift::String a1)
{
  xmmword_256D8D010 = (__int128)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
}

Swift::String_optional __swiftcall processName()()
{
  unsigned __int128 v0;
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v0 = xmmword_256D8D010;
  swift_bridgeObjectRetain();
  v2 = (void *)(v0 >> 64);
  v1 = v0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t sub_23E706154(uint64_t a1)
{
  return sub_23E706178(a1, qword_256D93120);
}

uint64_t sub_23E706178(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23E7188F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23E7188E4();
}

Swift::Void __swiftcall logMilestone(tag:description:)(Swift::String tag, Swift::String description)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  object = description._object;
  countAndFlagsBits = description._countAndFlagsBits;
  v4 = tag._object;
  v5 = tag._countAndFlagsBits;
  v6 = sub_23E7188F0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D8A368 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_256D93120);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_23E7188D8();
  v12 = sub_23E718DC4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v16 = countAndFlagsBits;
    v14 = v13;
    v15 = swift_slowAlloc();
    v19 = v15;
    *(_DWORD *)v14 = 136315394;
    v17 = v7;
    swift_bridgeObjectRetain();
    v18 = sub_23E60EA08(v5, (unint64_t)v4, &v19);
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    v18 = sub_23E60EA08(v16, (unint64_t)object, &v19);
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v11, v12, "(%s) %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242652480](v15, -1, -1);
    MEMORY[0x242652480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

unint64_t sub_23E70645C()
{
  unint64_t result;

  result = qword_256D8D020;
  if (!qword_256D8D020)
  {
    result = MEMORY[0x2426523B4](&protocol conformance descriptor for Logging, &type metadata for Logging);
    atomic_store(result, &qword_256D8D020);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Logging(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E7064EC + 4 * byte_23E71D981[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23E706520 + 4 * byte_23E71D97C[v4]))();
}

uint64_t sub_23E706520(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E706528(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E706530);
  return result;
}

uint64_t sub_23E70653C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E706544);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23E706548(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E706550(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

unint64_t sub_23E70656C()
{
  unint64_t result;

  result = qword_254337C40;
  if (!qword_254337C40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254337C40);
  }
  return result;
}

id TOUPeaks.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TOUPeaks.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TOUPeaks();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for TOUPeaks()
{
  return objc_opt_self();
}

id TOUPeaks.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TOUPeaks();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23E706700()
{
  uint64_t result;

  type metadata accessor for BackgroundLaunchTask();
  result = swift_initStaticObject();
  qword_254339470 = result;
  return result;
}

uint64_t sub_23E706728(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E7188F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(*(id *)(a1 + 16), sel_identifier);
  v10 = sub_23E718AE8();
  v12 = v11;

  if (qword_254337B10 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v5, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
  swift_bridgeObjectRetain_n();
  v14 = sub_23E7188D8();
  v15 = sub_23E718DDC();
  if (os_log_type_enabled(v14, v15))
  {
    v23 = v6;
    v16 = swift_slowAlloc();
    v25 = a1;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v27 = v18;
    v24 = v4;
    *(_DWORD *)v17 = 136446210;
    swift_bridgeObjectRetain();
    v26 = sub_23E60EA08(v10, v12, &v27);
    v4 = v24;
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v14, v15, "[BackgroundTask] Successfully launched the task associated with identifier %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v18, -1, -1);
    v19 = v17;
    a1 = v25;
    MEMORY[0x242652480](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v5);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v20 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v10;
  v21[5] = v12;
  v21[6] = a1;
  swift_retain();
  return sub_23E6ED904((uint64_t)v4, (uint64_t)&unk_256D8D030, (uint64_t)v21);
}

uint64_t sub_23E706A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  v7 = sub_23E7188F0();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = swift_task_alloc();
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E706A94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  _QWORD *v13;

  if (qword_254337B10 != -1)
    swift_once();
  v1 = v0[13];
  v2 = v0[9];
  v3 = v0[10];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_254339400);
  v0[14] = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[15] = v5;
  v5(v1, v4, v2);
  v6 = sub_23E7188D8();
  v7 = sub_23E718DD0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23E5C0000, v6, v7, "[BackgroundTask] Execute AMI Refresh", v8, 2u);
    MEMORY[0x242652480](v8, -1, -1);
  }
  v9 = v0[13];
  v10 = v0[9];
  v11 = v0[10];

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[16] = v12;
  v12(v9, v10);
  if (qword_254337DA8 != -1)
    swift_once();
  v13 = (_QWORD *)swift_task_alloc();
  v0[17] = v13;
  *v13 = v0;
  v13[1] = sub_23E706C18;
  return sub_23E6F93C0();
}

uint64_t sub_23E706C18(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 152) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E706C74()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  if (*(_BYTE *)(v0 + 152) == 1)
  {
    if (qword_254337DA0 != -1)
      swift_once();
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v1;
    *v1 = v0;
    v1[1] = sub_23E706DE8;
    return sub_23E6AA340(1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 120))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 72));
    v3 = sub_23E7188D8();
    v4 = sub_23E718DD0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23E5C0000, v3, v4, "[BackgroundTask] Manatee not enabled. Skip AMI refresh", v5, 2u);
      MEMORY[0x242652480](v5, -1, -1);
    }
    v6 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v7 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);

    v6(v7, v8);
    objc_msgSend(*(id *)(*(_QWORD *)(v0 + 64) + 16), sel_setTaskCompleted);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23E706DE8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E706E3C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 120))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 72));
  swift_bridgeObjectRetain_n();
  v1 = sub_23E7188D8();
  v2 = sub_23E718DB8();
  if (os_log_type_enabled(v1, v2))
  {
    v12 = *(_QWORD *)(v0 + 96);
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v11 = *(_QWORD *)(v0 + 72);
    v3 = *(_QWORD *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 48);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v14 = v6;
    *(_DWORD *)v5 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_23E60EA08(v4, v3, &v14);
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v1, v2, "[BackgroundTask] Marking task associated with identifier %{public}s complete", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v6, -1, -1);
    MEMORY[0x242652480](v5, -1, -1);

    v13(v12, v11);
  }
  else
  {
    v7 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v8 = *(_QWORD *)(v0 + 96);
    v9 = *(_QWORD *)(v0 + 72);
    swift_bridgeObjectRelease_n();

    v7(v8, v9);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 64) + 16), sel_setTaskCompleted);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for BackgroundLaunchTask()
{
  return objc_opt_self();
}

uint64_t sub_23E707054()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E707088(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23E5C5844;
  return sub_23E706A14(a1, v4, v5, v6, v7, v8);
}

id UsageSummaryRecords.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id UsageSummaryRecords.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for UsageSummaryRecords();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for UsageSummaryRecords()
{
  return objc_opt_self();
}

id UsageSummaryRecords.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UsageSummaryRecords();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23E707260(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23E7072B0(void *a1, uint64_t (*a2)(uint64_t), void (*a3)(char *, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  id v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  void (*v59)(char *, uint64_t, uint64_t);
  void (*v60)(char *, uint64_t);
  uint64_t (*v61)(uint64_t);
  uint64_t v62;
  id v63;
  char *v64;
  uint64_t v65;
  uint64_t aBlock[6];

  v60 = a3;
  v61 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v4);
  v64 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E7188F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v55 - v11;
  type metadata accessor for BackgroundSystemTaskRun();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  v14 = qword_254337B10;
  v63 = a1;
  if (v14 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
  swift_beginAccess();
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v59(v12, v15, v6);
  swift_retain_n();
  v16 = sub_23E7188D8();
  v17 = sub_23E718DB8();
  v58 = (uint8_t *)v7;
  v18 = v17;
  v19 = os_log_type_enabled(v16, v17);
  v62 = v6;
  if (v19)
  {
    v20 = swift_slowAlloc();
    v57 = v15;
    v21 = (uint8_t *)v20;
    v56 = swift_slowAlloc();
    aBlock[0] = v56;
    *(_DWORD *)v21 = 136446210;
    v55[1] = v21 + 4;
    v22 = objc_msgSend(*(id *)(v13 + 16), sel_identifier);
    v23 = v13;
    v24 = v10;
    v25 = sub_23E718AE8();
    v27 = v26;

    v6 = v62;
    v28 = v25;
    v10 = v24;
    v13 = v23;
    v65 = sub_23E60EA08(v28, v27, aBlock);
    sub_23E718FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23E5C0000, v16, v18, "[BackgroundTask] Configuring launch handler associated with identifier %{public}s", v21, 0xCu);
    v29 = v56;
    swift_arrayDestroy();
    MEMORY[0x242652480](v29, -1, -1);
    v30 = v21;
    v15 = v57;
    MEMORY[0x242652480](v30, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v31 = (void (*)(char *, uint64_t))*((_QWORD *)v58 + 1);
  v31(v12, v6);
  v32 = v61(v13);
  v59(v10, v15, v6);
  swift_retain_n();
  swift_retain();
  v33 = sub_23E7188D8();
  v34 = sub_23E718DB8();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v61 = (uint64_t (*)(uint64_t))v32;
    v37 = v36;
    aBlock[0] = v36;
    *(_DWORD *)v35 = 136446210;
    v58 = v35 + 4;
    v38 = *(void **)(v13 + 16);
    v60 = v31;
    v39 = objc_msgSend(v38, sel_identifier);
    v59 = (void (*)(char *, uint64_t, uint64_t))v10;
    v40 = v39;
    v41 = sub_23E718AE8();
    v43 = v42;

    v65 = sub_23E60EA08(v41, v43, aBlock);
    sub_23E718FC8();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23E5C0000, v33, v34, "[BackgroundTask] Beginning execution of task associated with identifier %{public}s", v35, 0xCu);
    swift_arrayDestroy();
    v44 = v37;
    v32 = (uint64_t)v61;
    MEMORY[0x242652480](v44, -1, -1);
    MEMORY[0x242652480](v35, -1, -1);

    v60((char *)v59, v62);
  }
  else
  {

    swift_release_n();
    v31(v10, v6);
  }
  v45 = objc_msgSend(*(id *)(v13 + 16), sel_identifier);
  v46 = sub_23E718AE8();
  v48 = v47;

  v49 = (_QWORD *)swift_allocObject();
  v49[2] = v46;
  v49[3] = v48;
  v49[4] = v32;
  aBlock[4] = (uint64_t)sub_23E708514;
  aBlock[5] = (uint64_t)v49;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23E5C52D0;
  aBlock[3] = (uint64_t)&block_descriptor_6_1;
  v50 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v63, sel_setExpirationHandler_, v50);
  _Block_release(v50);
  v51 = sub_23E718CF8();
  v52 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v64, 1, 1, v51);
  v53 = (_QWORD *)swift_allocObject();
  v53[2] = 0;
  v53[3] = 0;
  v53[4] = v32;
  v53[5] = v46;
  v53[6] = v48;
  sub_23E6CBB54(v52, (uint64_t)&unk_256D8D0D8, (uint64_t)v53);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_23E707878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254337C00);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23E718CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  v10[6] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23E6CBB54((uint64_t)v8, (uint64_t)&unk_256D8D0E8, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_23E707958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[7] = a5;
  v6[8] = a6;
  v6[6] = a4;
  v7 = sub_23E7188F0();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E7079BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_254337B10 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23E7188D8();
  v6 = sub_23E718DB8();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 56);
  if (v7)
  {
    v12 = *(_QWORD *)(v0 + 48);
    v17 = *(_QWORD *)(v0 + 72);
    v13 = (uint8_t *)swift_slowAlloc();
    v16 = v8;
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_23E60EA08(v12, v11, &v18);
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v5, v6, "[BackgroundTask] System scheduler is expiring the task run associated with identifier %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v14, -1, -1);
    MEMORY[0x242652480](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v17);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
  sub_23E718D10();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E707C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v6[8] = a5;
  v6[9] = a6;
  v7 = sub_23E7188F0();
  v6[10] = v7;
  v6[11] = *(_QWORD *)(v7 - 8);
  v6[12] = swift_task_alloc();
  v8 = (_QWORD *)swift_task_alloc();
  v6[13] = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254339140);
  *v8 = v6;
  v8[1] = sub_23E707CC4;
  return sub_23E718D1C();
}

uint64_t sub_23E707CC4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  sub_23E62C23C(*(id *)(v1 + 40), *(_BYTE *)(v1 + 48));
  return swift_task_switch();
}

uint64_t sub_23E707D20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (qword_254337B10 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23E7188D8();
  v6 = sub_23E718DB8();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 96);
  v11 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 80);
  if (v7)
  {
    v12 = *(_QWORD *)(v0 + 64);
    v17 = *(_QWORD *)(v0 + 80);
    v13 = (uint8_t *)swift_slowAlloc();
    v16 = v8;
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = sub_23E60EA08(v12, v11, &v18);
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v5, v6, "[BackgroundTask] Finished execution of task associated with identifier %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v14, -1, -1);
    MEMORY[0x242652480](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v17);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for BackgroundSystemTaskScheduler()
{
  return objc_opt_self();
}

uint64_t sub_23E707F58(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t);
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t aBlock[6];

  v10 = sub_23E7188F0();
  v11 = *(uint64_t (**)(char *, uint64_t))(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v49 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v43 - v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a4;
  *(_QWORD *)(v16 + 24) = a5;
  v17 = qword_254337B10;
  swift_retain();
  if (v17 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v10, (uint64_t)qword_254339400);
  swift_beginAccess();
  v47 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v11 + 2);
  v47(v15, v18, v10);
  swift_bridgeObjectRetain_n();
  v19 = v11;
  v20 = sub_23E7188D8();
  v21 = sub_23E718DB8();
  v22 = os_log_type_enabled(v20, v21);
  v50 = v10;
  if (v22)
  {
    v45 = a3;
    v23 = swift_slowAlloc();
    v48 = v19;
    v24 = (uint8_t *)v23;
    v25 = swift_slowAlloc();
    aBlock[0] = v25;
    v44 = v18;
    *(_DWORD *)v24 = 136446210;
    swift_bridgeObjectRetain();
    v51 = sub_23E60EA08(a1, a2, aBlock);
    v18 = v44;
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v20, v21, "[BackgroundTask] Attempting to register launch handler associated with identifier %{public}s", v24, 0xCu);
    swift_arrayDestroy();
    v26 = v25;
    v10 = v50;
    MEMORY[0x242652480](v26, -1, -1);
    MEMORY[0x242652480](v24, -1, -1);

    v27 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v48 + 1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v27 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v19 + 1);
  }
  v48 = v27;
  v27(v15, v10);
  v46 = a1;
  v28 = objc_msgSend((id)objc_opt_self(), sel_sharedScheduler);
  v29 = (void *)sub_23E718AC4();
  sub_23E5C5648();
  v30 = (void *)sub_23E718E54();
  aBlock[4] = (uint64_t)sub_23E7084C8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_23E707260;
  aBlock[3] = (uint64_t)&block_descriptor_26;
  v31 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v32 = objc_msgSend(v28, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v29, v30, v31);
  _Block_release(v31);

  v33 = v49;
  v47(v49, v18, v10);
  swift_bridgeObjectRetain_n();
  v34 = sub_23E7188D8();
  v35 = sub_23E718DB8();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc();
    v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)v36 = 136315394;
    if (v32)
      v38 = 0xD000000000000017;
    else
      v38 = 0xD000000000000012;
    if (v32)
      v39 = 0x800000023E723C00;
    else
      v39 = 0x800000023E723BE0;
    v51 = sub_23E60EA08(v38, v39, aBlock);
    sub_23E718FC8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2082;
    swift_bridgeObjectRetain();
    v51 = sub_23E60EA08(v46, a2, aBlock);
    sub_23E718FC8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23E5C0000, v34, v35, "[BackgroundTask] %s launch handler associated with identifier %{public}s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242652480](v37, -1, -1);
    MEMORY[0x242652480](v36, -1, -1);
    swift_release();

    v40 = v33;
    v41 = v50;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release();
    v40 = v33;
    v41 = v10;
  }
  return v48(v40, v41);
}

uint64_t sub_23E7084A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E7084C8(void *a1)
{
  uint64_t v1;

  return sub_23E7072B0(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(void (**)(char *, uint64_t))(v1 + 24));
}

uint64_t block_copy_helper_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_22()
{
  return swift_release();
}

uint64_t sub_23E7084E8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E708514()
{
  uint64_t *v0;

  return sub_23E707878(v0[2], v0[3], v0[4]);
}

uint64_t sub_23E708520()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23E708554(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23E5C5844;
  return sub_23E707C10(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_23E7085D4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E708608(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23E5F48EC;
  return sub_23E707958(a1, v4, v5, v6, v7, v8);
}

id sub_23E708690()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  qword_256D93138 = (uint64_t)result;
  return result;
}

uint64_t sub_23E7086C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v18[6];
  uint64_t v19[4];

  v0 = sub_23E7188F0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v18 - v3;
  v5 = sub_23E718B24();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E718B18();
  v9 = sub_23E718AF4();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v11 >> 60 == 15)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v0, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v12, v0);
    v13 = sub_23E7188D8();
    v14 = sub_23E718DC4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v19[0] = v16;
      *(_DWORD *)v15 = 136315138;
      v18[5] = sub_23E60EA08(0x79546769666E6F63, 0xEA00000000006570, v19);
      sub_23E718FC8();
      _os_log_impl(&dword_23E5C0000, v13, v14, "%s Unable to convert to data", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v16, -1, -1);
      MEMORY[0x242652480](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
  else
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    sub_23E718398();
    sub_23E708C14();
    sub_23E7173F0();
    sub_23E5F304C(v9, v11);
    swift_release();
    return v19[1];
  }
}

unint64_t sub_23E708C14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D8D110;
  if (!qword_256D8D110)
  {
    v1 = sub_23E718398();
    result = MEMORY[0x2426523B4](MEMORY[0x24BE4F590], v1);
    atomic_store(result, (unint64_t *)&qword_256D8D110);
  }
  return result;
}

id sub_23E708C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_23E7188F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D8A378 != -1)
    swift_once();
  v4 = (void *)qword_256D93138;
  v5 = (void *)sub_23E718AC4();
  v6 = objc_msgSend(v4, sel_BOOLForKey_, v5);

  if (qword_254337B10 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v0, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v7, v0);
  v8 = sub_23E7188D8();
  v9 = sub_23E718DB8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v15 = v11;
    *(_DWORD *)v10 = 136315394;
    v14 = sub_23E60EA08(0xD000000000000013, 0x800000023E725370, &v15);
    sub_23E718FC8();
    *(_WORD *)(v10 + 12) = 1024;
    LODWORD(v14) = (_DWORD)v6;
    sub_23E718FC8();
    _os_log_impl(&dword_23E5C0000, v8, v9, "%s Reading %{BOOL}d from standard defaults", (uint8_t *)v10, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x242652480](v11, -1, -1);
    MEMORY[0x242652480](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t sub_23E708EC8(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t result;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;

  if (!a2)
    return 0;
  sub_23E7185FC();
  v2 = sub_23E7185D8();
  result = 0;
  if ((v2 & 1) != 0)
  {
    v11 = MEMORY[0x24BEE4AF8];
    v4 = (objc_class *)sub_23E718590();
    v5 = objc_allocWithZone(v4);
    v6 = (void *)sub_23E718584();
    v7 = objc_allocWithZone(v4);
    v8 = (void *)sub_23E718584();
    v9 = v6;
    MEMORY[0x2426517F0]();
    if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23E718C5C();
    sub_23E718C74();
    sub_23E718C50();
    v10 = v8;
    MEMORY[0x2426517F0]();
    if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_23E718C5C();
    sub_23E718C74();
    sub_23E718C50();

    return v11;
  }
  return result;
}

uint64_t sub_23E7090A4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t result;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  int64_t v23;

  if (!CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a3))
    return MEMORY[0x24BEE4AF8];
  v7 = sub_23E708EC8(a1, a2);
  if (!v7)
    return MEMORY[0x24BEE4AF8];
  v8 = v7;
  v9 = v7 & 0xFFFFFFFFFFFFFF8;
  if (!(v7 >> 62))
  {
    v10 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_5;
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  v4 = sub_23E719160();
  swift_bridgeObjectRelease();
  if (!v4)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v10 = sub_23E719160();
  result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) == 0)
  {
    if (v10)
    {
LABEL_5:
      v11 = sub_23E687A4C(v10);
      if ((v8 & 0xC000000000000001) == 0)
      {
        if ((v11 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else
        {
          v12 = *(_QWORD *)(v9 + 16);
          if (v11 < v12)
          {
            v15 = *(id *)(v8 + 8 * v11 + 32);
            goto LABEL_9;
          }
        }
        __break(1u);
        goto LABEL_21;
      }
      v15 = (id)MEMORY[0x242651CD0](v11, v8);
LABEL_9:
      v16 = v15;
      swift_bridgeObjectRelease();
      v10 = v16;
      v4 = sub_23E718578();
      v9 = v17;
      v8 = (unint64_t)sub_23E6F3ABC(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v12 = *(_QWORD *)(v8 + 16);
      v14 = *(_QWORD *)(v8 + 24);
      v13 = v12 + 1;
      if (v12 < v14 >> 1)
      {
LABEL_10:
        *(_QWORD *)(v8 + 16) = v13;
        v18 = (_QWORD *)(v8 + 16 * v12);
        v18[4] = v4;
        v18[5] = v9;

        return v8;
      }
LABEL_21:
      v23 = v13;
      v20 = (_QWORD *)v8;
      v21 = v12;
      v22 = sub_23E6F3ABC((_QWORD *)(v14 > 1), v13, 1, v20);
      v12 = v21;
      v13 = v23;
      v8 = (unint64_t)v22;
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_23E709240(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];

  v2 = sub_23E7188F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254337B10 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_23E7188D8();
  v8 = sub_23E718DB8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v12[1] = a1 & 1;
    sub_23E718FC8();
    _os_log_impl(&dword_23E5C0000, v7, v8, "Writing %{BOOL}d to standard defaults", v9, 8u);
    MEMORY[0x242652480](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (qword_256D8A378 != -1)
    swift_once();
  v10 = (void *)qword_256D93138;
  v11 = (void *)sub_23E718AC4();
  objc_msgSend(v10, sel_setBool_forKey_, a1 & 1, v11);

}

void __swiftcall HomeEnergyNotificationContext.init(title:body:tapURL:homeID:seriesNotifications:)(HomeEnergyDaemon::HomeEnergyNotificationContext *__return_ptr retstr, Swift::String title, Swift::String body, Swift::String_optional tapURL, Swift::String_optional homeID, Swift::Bool seriesNotifications)
{
  retstr->title = title;
  retstr->body = body;
  retstr->tapURL = tapURL;
  retstr->homeID = homeID;
  retstr->seriesNotifications = seriesNotifications;
}

unint64_t sub_23E709444()
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
  uint64_t inited;
  uint64_t v10;
  unint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  v8 = v0[6];
  v7 = v0[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8B8D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23E71A680;
  *(_QWORD *)(inited + 32) = 0x656C746974;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 56) = v1;
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = 2036625250;
  *(_QWORD *)(inited + 120) = v10;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_23E69FA60(inited);
  if (v5)
  {
    v17 = v10;
    *(_QWORD *)&v16 = v6;
    *((_QWORD *)&v16 + 1) = v5;
    sub_23E5F4874(&v16, v15);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C(v15, 0x4C5255706174, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    v17 = v10;
    *(_QWORD *)&v16 = v8;
    *((_QWORD *)&v16 + 1) = v7;
    sub_23E5F4874(&v16, v15);
    swift_bridgeObjectRetain();
    v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C(v15, 0x4449656D6F68, 0xE600000000000000, v13);
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t HomeEnergyNotificationStatus.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000025;
  switch(a1)
  {
    case 0:
    case 1:
      return result;
    case 2:
      result = 0xD00000000000003ALL;
      break;
    case 3:
      result = 0xD000000000000037;
      break;
    default:
      result = sub_23E71922C();
      __break(1u);
      break;
  }
  return result;
}

unint64_t HomeEnergyNotificationStatus.init(rawValue:)(unint64_t a1)
{
  return sub_23E7096B8(a1);
}

unint64_t sub_23E709680@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23E7096B8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_23E7096B0()
{
  uint64_t *v0;

  return HomeEnergyNotificationStatus.description.getter(*v0);
}

unint64_t sub_23E7096B8(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t sub_23E7096CC()
{
  unint64_t result;

  result = qword_256D8D118;
  if (!qword_256D8D118)
  {
    result = MEMORY[0x2426523B4](&protocol conformance descriptor for HomeEnergyNotificationStatus, &type metadata for HomeEnergyNotificationStatus);
    atomic_store(result, (unint64_t *)&qword_256D8D118);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyNotificationStatus()
{
  return &type metadata for HomeEnergyNotificationStatus;
}

uint64_t destroy for HomeEnergyNotificationContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeEnergyNotificationContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeEnergyNotificationContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyNotificationContext()
{
  return &type metadata for HomeEnergyNotificationContext;
}

uint64_t sub_23E7099B4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 152) = v1;
  *(_BYTE *)(v2 + 176) = a1;
  return swift_task_switch();
}

uint64_t sub_23E7099D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  char v6;
  uint64_t (__cdecl *v7)();

  v1 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 144) = MEMORY[0x24BEE4B00];
  if ((sub_23E717E58() & 1) != 0)
  {
    v7 = (uint64_t (__cdecl *)())((char *)&dword_256D8D138 + dword_256D8D138);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v2;
    *v2 = v0;
    v2[1] = sub_23E709B48;
    return v7();
  }
  else
  {
    *(_QWORD *)(v0 + 40) = MEMORY[0x24BEE1328];
    *(_BYTE *)(v0 + 16) = 0;
    sub_23E5F4874((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C((_OWORD *)(v0 + 48), 0x737574617473, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 80) = 0xD000000000000019;
    *(_QWORD *)(v0 + 104) = v5;
    *(_QWORD *)(v0 + 88) = 0x800000023E725690;
    sub_23E5F4874((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 112));
    v6 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v0 + 144) = 0x8000000000000000;
    sub_23E703A9C((_OWORD *)(v0 + 112), 0x654D737574617473, 0xED00006567617373, v6);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
}

uint64_t sub_23E709B48(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E709BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_BYTE *)(v0 + 176);
  v4 = (void *)MEMORY[0x242651F34]();
  sub_23E70A3A4(v2, (id *)(v0 + 144), v1, v3);
  objc_autoreleasePoolPop(v4);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 144));
}

void sub_23E709C44(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v27[2];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v4 = a2;
  v30 = MEMORY[0x24BEE4B00];
  if (a1)
  {
    v6 = a1 + 56;
    v7 = 1 << *(_BYTE *)(a1 + 32);
    v8 = -1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    v9 = v8 & *(_QWORD *)(a1 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    swift_bridgeObjectRetain();
    v11 = 0;
    if (!v9)
      goto LABEL_6;
LABEL_5:
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
      v19 = *v17;
      v18 = v17[1];
      v20 = swift_bridgeObjectRetain();
      v4 = (_QWORD *)MEMORY[0x242651F34](v20);
      sub_23E709ECC(v19, v18, (uint64_t)&v30);
      if (v3)
        break;
      v3 = 0;
      objc_autoreleasePoolPop(v4);
      swift_bridgeObjectRelease();
      if (v9)
        goto LABEL_5;
LABEL_6:
      if (__OFADD__(v11++, 1))
      {
        __break(1u);
LABEL_27:
        __break(1u);
        break;
      }
      if (v11 >= v10)
        goto LABEL_24;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v16 = v11 + 1;
        if (v11 + 1 >= v10)
          goto LABEL_24;
        v15 = *(_QWORD *)(v6 + 8 * v16);
        if (!v15)
        {
          v16 = v11 + 2;
          if (v11 + 2 >= v10)
            goto LABEL_24;
          v15 = *(_QWORD *)(v6 + 8 * v16);
          if (!v15)
          {
            v16 = v11 + 3;
            if (v11 + 3 >= v10)
            {
LABEL_24:
              v4 = a2;
              swift_release();
              goto LABEL_25;
            }
            v15 = *(_QWORD *)(v6 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_27;
                if (v11 >= v10)
                  goto LABEL_24;
                v15 = *(_QWORD *)(v6 + 8 * v11);
                ++v16;
                if (v15)
                  goto LABEL_16;
              }
            }
          }
        }
        v11 = v16;
      }
LABEL_16:
      v9 = (v15 - 1) & v15;
    }
    objc_autoreleasePoolPop(v4);
    __break(1u);
  }
  else
  {
LABEL_25:
    v21 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v22 = objc_msgSend(v21, sel_dictionaryRepresentation);

    v23 = sub_23E718A40();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_254336ED8);
    *(_QWORD *)&v28 = v23;
    sub_23E5F4874(&v28, v27);
    v24 = v30;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C(v27, 0xD000000000000010, 0x800000023E725700, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    *v4 = v24;
  }
}

void sub_23E709ECC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[4];
  uint64_t v42[3];
  uint64_t v43;

  v39 = a3;
  v6 = sub_23E7188F0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  v13 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  swift_bridgeObjectRetain();
  v40 = a1;
  v14 = (void *)sub_23E718AC4();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithSuiteName_, v14);

  if (v15)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v16, v6);
    swift_bridgeObjectRetain_n();
    v17 = sub_23E7188D8();
    v18 = sub_23E718DB8();
    if (os_log_type_enabled(v17, v18))
    {
      v36 = v3;
      v19 = swift_slowAlloc();
      v38 = v6;
      v20 = (uint8_t *)v19;
      v21 = swift_slowAlloc();
      v37 = v7;
      v22 = v21;
      v41[0] = v21;
      *(_DWORD *)v20 = 136315138;
      swift_bridgeObjectRetain();
      v35 = v15;
      v23 = v40;
      v43 = sub_23E60EA08(v40, a2, v41);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v17, v18, "Reading %s defaults", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v22, -1, -1);
      v24 = v20;
      v25 = v23;
      v15 = v35;
      MEMORY[0x242652480](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      v25 = v40;
    }
    swift_bridgeObjectRetain();
    v32 = objc_msgSend(v15, sel_dictionaryRepresentation);
    v33 = sub_23E718A40();

    v41[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254336ED8);
    v41[0] = v33;
    sub_23E6CBDFC((uint64_t)v41, v25, a2);

  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v6, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v26, v6);
    swift_bridgeObjectRetain_n();
    v27 = sub_23E7188D8();
    v28 = sub_23E718DD0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v37 = v7;
      v30 = (uint8_t *)v29;
      v31 = swift_slowAlloc();
      v42[0] = v31;
      v38 = v6;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain();
      v43 = sub_23E60EA08(v40, a2, v42);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v27, v28, "Error reading %s defaults", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v31, -1, -1);
      MEMORY[0x242652480](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v38);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
}

void sub_23E70A3A4(uint64_t a1, id *a2, uint64_t a3, char a4)
{
  uint64_t v4;
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t inited;
  void *v42;
  id v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  unint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86[3];
  uint64_t v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v7 = sub_23E7188F0();
  v82 = *(_QWORD *)(v7 - 8);
  v83 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v79 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v76 = (char *)&v74 - v10;
  v81 = sub_23E717630();
  v78 = *(_QWORD *)(v81 - 8);
  v11 = MEMORY[0x24BDAC7A8](v81);
  v77 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v74 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v74 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v80 = (char *)&v74 - v19;
  v20 = (void *)sub_23E6E60F4((uint64_t)&unk_250EFE198);
  v21 = MEMORY[0x24BEE0D00];
  v22 = swift_arrayDestroy();
  v23 = (void *)MEMORY[0x242651F34](v22);
  sub_23E709C44((uint64_t)v20, v86);
  if (v4)
  {
    objc_autoreleasePoolPop(v23);
    __break(1u);
    *a2 = v86[0];
    swift_bridgeObjectRelease();
    __break(1u);
    objc_autoreleasePoolPop(a2);
    __break(1u);
    objc_autoreleasePoolPop(v20);
    __break(1u);
  }
  else
  {
    objc_autoreleasePoolPop(v23);
    swift_bridgeObjectRelease();
    v24 = v86[0];
    v25 = *a2;
    swift_bridgeObjectRetain();
    v26 = swift_bridgeObjectRetain();
    *a2 = (id)sub_23E70AC8C(v26, (uint64_t)v25);
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v86[0] = *a2;
    *a2 = (id)0x8000000000000000;
    sub_23E70D7A0((uint64_t)v24, (uint64_t)sub_23E70DBA0, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v86);
    *a2 = v86[0];
    swift_bridgeObjectRelease();
    v87 = MEMORY[0x24BEE1328];
    LOBYTE(v86[0]) = 1;
    sub_23E6CBDFC((uint64_t)v86, 0x737574617473, 0xE600000000000000);
    v87 = v21;
    v86[0] = (id)0xD000000000000029;
    v86[1] = (id)0x800000023E7256B0;
    sub_23E6CBDFC((uint64_t)v86, 0x654D737574617473, 0xED00006567617373);
    if ((a4 & 1) != 0)
    {
      v28 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      v29 = (void *)sub_23E718A28();
      swift_bridgeObjectRelease();
      v86[0] = 0;
      v30 = objc_msgSend(v28, sel_dataWithPropertyList_format_options_error_, v29, 200, 0, v86);

      v31 = v86[0];
      if (v30)
      {
        v32 = sub_23E71769C();
        v74 = v33;

        v34 = (void *)MEMORY[0x242651F34]();
        v35 = (void *)MEMORY[0x242651F34]();
        sub_23E70BDC4((uint64_t)v18);
        v75 = v32;
        objc_autoreleasePoolPop(v35);
        v36 = sub_23E7175E8();
        v37 = (void *)MEMORY[0x242651F34](v36);
        sub_23E70B6F4();
        objc_autoreleasePoolPop(v37);
        v38 = sub_23E71760C();
        v40 = v39;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254336F68);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_23E71A510;
        v42 = (void *)*MEMORY[0x24BDD0CC8];
        *(_QWORD *)(inited + 64) = MEMORY[0x24BEE1768];
        *(_QWORD *)(inited + 32) = v42;
        *(_QWORD *)(inited + 40) = 448;
        v43 = v42;
        v44 = (_QWORD *)sub_23E69F824(inited);
        v45 = (void *)MEMORY[0x242651F34]();
        sub_23E70AD28(v38, v40, v44);
        objc_autoreleasePoolPop(v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v46 = v78;
        v47 = *(void (**)(char *, uint64_t))(v78 + 8);
        v48 = v18;
        v49 = v81;
        v47(v48, v81);
        v50 = v80;
        (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v80, v15, v49);
        objc_autoreleasePoolPop(v34);
        v51 = v77;
        sub_23E7175E8();
        (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v50, v51, v49);
        v52 = v74;
        sub_23E7176A8();
        v62 = v82;
        v63 = v83;
        if (qword_254337B10 != -1)
          swift_once();
        v64 = __swift_project_value_buffer(v63, (uint64_t)qword_254339400);
        swift_beginAccess();
        v65 = v76;
        (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v76, v64, v63);
        v66 = sub_23E7188D8();
        v67 = sub_23E718DB8();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (uint8_t *)swift_slowAlloc();
          v69 = swift_slowAlloc();
          v85 = v69;
          *(_DWORD *)v68 = 136315138;
          v79 = (char *)(v68 + 4);
          v70 = v80;
          swift_beginAccess();
          sub_23E5C33C8(&qword_254336E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v71 = sub_23E7191E4();
          v84 = sub_23E60EA08(v71, v72, &v85);
          sub_23E718FC8();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_23E5C0000, v66, v67, "Wrote diagnostics to file %s", v68, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242652480](v69, -1, -1);
          MEMORY[0x242652480](v68, -1, -1);
          sub_23E5DB7D8(v75, v74);

          (*(void (**)(char *, uint64_t))(v82 + 8))(v76, v83);
          v73 = v70;
        }
        else
        {
          sub_23E5DB7D8(v75, v52);

          (*(void (**)(char *, uint64_t))(v62 + 8))(v65, v63);
          v73 = v80;
        }
        v47(v73, v81);
      }
      else
      {
        v53 = v31;
        v54 = (void *)sub_23E7175AC();

        swift_willThrow();
        v56 = v82;
        v55 = v83;
        v57 = v79;
        if (qword_254337B10 != -1)
          swift_once();
        v58 = __swift_project_value_buffer(v55, (uint64_t)qword_254339400);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v57, v58, v55);
        v59 = sub_23E7188D8();
        v60 = sub_23E718DD0();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v61 = 0;
          _os_log_impl(&dword_23E5C0000, v59, v60, "Failed to save diagnostics to file", v61, 2u);
          MEMORY[0x242652480](v61, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v55);
      }
    }
  }
}

uint64_t sub_23E70AC8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_23E70D7A0(a1, (uint64_t)sub_23E70DBA0, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t type metadata accessor for HomeEnergyDaemonUtilities()
{
  return objc_opt_self();
}

uint64_t sub_23E70AD28(uint64_t a1, unint64_t a2, _QWORD *a3)
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  unint64_t v35;
  uint8_t *v36;
  void *v37;
  uint8_t *v38;
  void (*v39)(char *, uint64_t);
  id v40;
  void *v41;
  void *v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  id v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  id v61;
  void *v62;
  unint64_t v63;
  id v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  _QWORD *v71;
  void (*v72)(char *, char *, uint64_t);
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  uint64_t v84;
  id v85;
  id v86[4];

  v83 = a3;
  v86[3] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_23E717630();
  v81 = *(_QWORD *)(v5 - 8);
  v82 = (_QWORD *)v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v77 = (char *)&v72 - v9;
  v10 = sub_23E7188F0();
  v79 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v74 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v75 = (char *)&v72 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v78 = (char *)&v72 - v15;
  v16 = (void *)objc_opt_self();
  v17 = objc_msgSend(v16, sel_defaultManager);
  v18 = (void *)sub_23E718AC4();
  v19 = objc_msgSend(v17, sel_fileExistsAtPath_, v18);

  if ((v19 & 1) != 0)
  {
    v20 = v10;
    v21 = objc_msgSend(v16, sel_defaultManager);
    type metadata accessor for FileAttributeKey(0);
    sub_23E5C33C8(&qword_254336F08, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23E71A234);
    v22 = (void *)sub_23E718A28();
    v23 = (void *)sub_23E718AC4();
    v86[0] = 0;
    v24 = (void *)a2;
    v25 = objc_msgSend(v21, sel_setAttributes_ofItemAtPath_error_, v22, v23, v86);

    if (!(_DWORD)v25)
    {
      v76 = a1;
      v25 = v24;
      v51 = v86[0];
      v46 = (void *)sub_23E7175AC();

      swift_willThrow();
      if (qword_254337B10 == -1)
        goto LABEL_14;
      goto LABEL_23;
    }
    v26 = v86[0];
  }
  else
  {
    v27 = v16;
    v76 = a1;
    if (qword_254337B10 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v10, (uint64_t)qword_254339400);
    swift_beginAccess();
    v29 = v78;
    v30 = v79;
    v31 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
    v74 = (char *)v28;
    v72 = v31;
    v31(v78, (char *)v28, v10);
    swift_bridgeObjectRetain_n();
    v32 = sub_23E7188D8();
    v33 = sub_23E718DC4();
    v34 = os_log_type_enabled(v32, v33);
    v20 = MEMORY[0x24BEE4AD8];
    v73 = v10;
    if (v34)
    {
      v35 = a2;
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (void *)swift_slowAlloc();
      v85 = v37;
      *(_DWORD *)v36 = 136315138;
      swift_bridgeObjectRetain();
      v84 = sub_23E60EA08(v76, v35, (uint64_t *)&v85);
      v20 = MEMORY[0x24BEE4AD8];
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v32, v33, "createDirectory %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v37, -1, -1);
      v38 = v36;
      a2 = v35;
      MEMORY[0x242652480](v38, -1, -1);

      v39 = *(void (**)(char *, uint64_t))(v79 + 8);
      v39(v78, v73);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v39 = *(void (**)(char *, uint64_t))(v30 + 8);
      v39(v29, v10);
    }
    v40 = objc_msgSend(v27, sel_defaultManager);
    v41 = (void *)sub_23E718AC4();
    type metadata accessor for FileAttributeKey(0);
    sub_23E5C33C8(&qword_254336F08, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_23E71A234);
    v42 = (void *)sub_23E718A28();
    v85 = 0;
    v43 = a2;
    v25 = objc_msgSend(v40, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v41, 1, v42, &v85);

    if (!(_DWORD)v25)
    {
      v61 = v85;
      v62 = (void *)sub_23E7175AC();

      swift_willThrow();
      v72(v75, v74, v73);
      v63 = v43;
      swift_bridgeObjectRetain_n();
      v64 = v62;
      v65 = sub_23E7188D8();
      v66 = sub_23E718DD0();
      if (os_log_type_enabled(v65, v66))
      {
        v67 = swift_slowAlloc();
        v83 = (_QWORD *)swift_slowAlloc();
        v68 = (void *)swift_slowAlloc();
        v85 = v68;
        *(_DWORD *)v67 = 136380931;
        swift_bridgeObjectRetain();
        v84 = sub_23E60EA08(v76, v63, (uint64_t *)&v85);
        sub_23E718FC8();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v67 + 12) = 2114;
        v69 = v62;
        v70 = _swift_stdlib_bridgeErrorToNSError();
        v84 = v70;
        sub_23E718FC8();
        v71 = v83;
        *v83 = v70;

        _os_log_impl(&dword_23E5C0000, v65, v66, "    Failed to create directory\n    %{private}s. Error = %{public}@", (uint8_t *)v67, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2543368F0);
        swift_arrayDestroy();
        MEMORY[0x242652480](v71, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x242652480](v68, -1, -1);
        MEMORY[0x242652480](v67, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();

      }
      v39(v75, v73);
      exit(1);
    }
    v44 = v85;
    v8 = v77;
  }
  v45 = sub_23E7175C4();
  v46 = (void *)MEMORY[0x242651F34](v45);
  v47 = v80;
  sub_23E70B6F4();
  if (v47)
  {
    objc_autoreleasePoolPop(v46);
    __break(1u);
LABEL_23:
    swift_once();
LABEL_14:
    v52 = __swift_project_value_buffer(v20, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v74, v52, v20);
    swift_bridgeObjectRetain_n();
    v53 = v46;
    v54 = sub_23E7188D8();
    v55 = sub_23E718DD0();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc();
      v82 = (_QWORD *)swift_slowAlloc();
      v83 = (_QWORD *)swift_slowAlloc();
      v85 = v83;
      *(_DWORD *)v56 = 136380931;
      swift_bridgeObjectRetain();
      v84 = sub_23E60EA08(v76, (unint64_t)v25, (uint64_t *)&v85);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v56 + 12) = 2114;
      v57 = v46;
      v58 = _swift_stdlib_bridgeErrorToNSError();
      v84 = v58;
      sub_23E718FC8();
      v59 = v82;
      *v82 = v58;

      _os_log_impl(&dword_23E5C0000, v54, v55, "Failed to set attributes to directory\n%{private}s. Error = %{public}@", (uint8_t *)v56, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543368F0);
      swift_arrayDestroy();
      MEMORY[0x242652480](v59, -1, -1);
      v60 = v83;
      swift_arrayDestroy();
      MEMORY[0x242652480](v60, -1, -1);
      MEMORY[0x242652480](v56, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
    (*(void (**)(char *, uint64_t))(v79 + 8))(v74, v20);
    exit(1);
  }
  v49 = v81;
  v48 = v82;
  objc_autoreleasePoolPop(v46);
  return (*(uint64_t (**)(char *, _QWORD *))(v49 + 8))(v8, v48);
}

uint64_t sub_23E70B6F4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_23E7188F0();
  v24 = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v23 - v5;
  v7 = sub_23E717540();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E717534();
  sub_23E717528();
  sub_23E7175D0();
  if (v0)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (qword_254337B10 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v1, (uint64_t)qword_254339400);
    swift_beginAccess();
    v12 = v24;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v4, v11, v1);
    v13 = sub_23E7188D8();
    v14 = sub_23E718DD0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23E5C0000, v13, v14, "Failed to set skip backup for URL", v15, 2u);
      MEMORY[0x242652480](v15, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v4, v1);
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v1, (uint64_t)qword_254339400);
    swift_beginAccess();
    v18 = v24;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v6, v17, v1);
    v19 = sub_23E7188D8();
    v20 = sub_23E718DC4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_23E5C0000, v19, v20, "Set skip backup for URL", v21, 2u);
      v22 = v21;
      v18 = v24;
      MEMORY[0x242652480](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

void sub_23E70B9F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t inited;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  void *v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = sub_23E717630();
  v3 = *(_QWORD *)(v2 - 8);
  v39 = v2;
  v40 = v3;
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v35 - v7;
  v9 = (_QWORD *)sub_23E7188F0();
  v10 = *(v9 - 1);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254337B10 != -1)
    swift_once();
  v13 = __swift_project_value_buffer((uint64_t)v9, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, _QWORD *))(v10 + 16))(v12, v13, v9);
  v14 = sub_23E7188D8();
  v15 = sub_23E718DC4();
  if (os_log_type_enabled(v14, v15))
  {
    v38 = v6;
    v16 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v42 = v36;
    *(_DWORD *)v16 = 136315138;
    v17 = (void *)MEMORY[0x242651F34]();
    sub_23E70BDC4((uint64_t)v8);
    v37 = v0;
    if (v0)
      goto LABEL_9;
    v35[1] = v16 + 4;
    objc_autoreleasePoolPop(v17);
    v18 = sub_23E71760C();
    v20 = v19;
    v21 = v8;
    v22 = v39;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v39);
    v41 = sub_23E60EA08(v18, v20, &v42);
    sub_23E718FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23E5C0000, v14, v15, "initializeProtectedStorePaths %s", v16, 0xCu);
    v23 = v36;
    swift_arrayDestroy();
    MEMORY[0x242652480](v23, -1, -1);
    MEMORY[0x242652480](v16, -1, -1);

    v24 = (*(uint64_t (**)(char *, _QWORD *))(v10 + 8))(v12, v9);
    v1 = v37;
    v6 = v38;
  }
  else
  {

    v24 = (*(uint64_t (**)(char *, _QWORD *))(v10 + 8))(v12, v9);
    v22 = v39;
  }
  v17 = (void *)MEMORY[0x242651F34](v24);
  sub_23E70BDC4((uint64_t)v6);
  if (!v1)
  {
    objc_autoreleasePoolPop(v17);
    v25 = sub_23E71760C();
    v27 = v26;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254336F68);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23E71A510;
    v29 = (void *)*MEMORY[0x24BDD0CC8];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BDD0CC8];
    v30 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    v31 = v29;
    v32 = objc_msgSend(v30, sel_initWithShort_, 448);
    *(_QWORD *)(inited + 64) = sub_23E70FB08();
    *(_QWORD *)(inited + 40) = v32;
    v33 = (_QWORD *)sub_23E69F824(inited);
    v34 = (void *)MEMORY[0x242651F34]();
    sub_23E70AD28(v25, v27, v33);
    objc_autoreleasePoolPop(v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_9:
  objc_autoreleasePoolPop(v17);
  __break(1u);
  objc_autoreleasePoolPop(v9);
  __break(1u);
}

uint64_t sub_23E70BDC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50[8];

  v46 = a1;
  v1 = sub_23E7175B8();
  v43 = *(_QWORD *)(v1 - 8);
  v44 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336908);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23E717630();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v42 - v12;
  v47 = sub_23E7188F0();
  v49 = *(_QWORD *)(v47 - 8);
  v14 = MEMORY[0x24BDAC7A8](v47);
  v48 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v42 - v16;
  v18 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v19 = sub_23E718C38();

  if (!*(_QWORD *)(v19 + 16))
  {
    swift_bridgeObjectRelease();
    if (qword_254337B10 == -1)
      goto LABEL_10;
    goto LABEL_14;
  }
  v17 = *(char **)(v19 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v3, *MEMORY[0x24BDCD7A0], v44);
  sub_23E717624();
  sub_23E7175F4();
  v44 = v8;
  v20 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  v21 = v20(v11, v7);
  v22 = (void *)MEMORY[0x242651F34](v21);
  v23 = v45;
  sub_23E70B6F4();
  if (v23)
  {
    objc_autoreleasePoolPop(v22);
    __break(1u);
LABEL_14:
    swift_once();
LABEL_10:
    v37 = v47;
    v38 = __swift_project_value_buffer(v47, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v17, v38, v37);
    v39 = sub_23E7188D8();
    v40 = sub_23E718DD0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_23E5C0000, v39, v40, "Can't get the library directory", v41, 2u);
      MEMORY[0x242652480](v41, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v17, v47);
    exit(1);
  }
  v24 = v7;
  v43 = 0;
  v45 = v20;
  objc_autoreleasePoolPop(v22);
  v25 = v47;
  v26 = v48;
  v27 = v49;
  if (qword_254337B10 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v25, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v26, v28, v25);
  v29 = sub_23E7188D8();
  v30 = sub_23E718DC4();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v50[0] = v32;
    *(_DWORD *)v31 = 136315138;
    v42[1] = v31 + 4;
    swift_beginAccess();
    sub_23E5C33C8(&qword_254336E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v33 = sub_23E7191E4();
    v50[7] = sub_23E60EA08(v33, v34, v50);
    sub_23E718FC8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23E5C0000, v29, v30, "defaultStorageDirectory is %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v32, -1, -1);
    MEMORY[0x242652480](v31, -1, -1);

    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v25);
  }
  v35 = v44;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v46, v13, v24);
  return v45(v13, v24);
}

void sub_23E70C330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29[4];

  v29[3] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = sub_23E7188F0();
  v27 = *(_QWORD *)(v1 - 8);
  v28 = v1;
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - v5;
  v7 = sub_23E717630();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v12 = (void *)MEMORY[0x242651F34]();
  sub_23E70BDC4((uint64_t)v10);
  if (v0)
  {
    objc_autoreleasePoolPop(v12);
    __break(1u);
  }
  else
  {
    objc_autoreleasePoolPop(v12);
    v13 = (void *)sub_23E7175DC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v29[0] = 0;
    v14 = objc_msgSend(v11, sel_removeItemAtURL_error_, v13, v29);

    v15 = v29[0];
    if ((v14 & 1) != 0)
    {
      v17 = v27;
      v16 = v28;
      if (qword_254337B10 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v16, (uint64_t)qword_254339400);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v6, v18, v16);
      v19 = sub_23E7188D8();
      v20 = sub_23E718DD0();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_23E5C0000, v19, v20, "Deleted all local data", v21, 2u);
        MEMORY[0x242652480](v21, -1, -1);
      }
      v4 = v6;
    }
    else
    {
      v22 = v15;
      v23 = (void *)sub_23E7175AC();

      swift_willThrow();
      v17 = v27;
      v16 = v28;
      if (qword_254337B10 != -1)
        swift_once();
      v24 = __swift_project_value_buffer(v16, (uint64_t)qword_254339400);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v4, v24, v16);
      v19 = sub_23E7188D8();
      v25 = sub_23E718DD0();
      if (os_log_type_enabled(v19, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_23E5C0000, v19, v25, "Failed to purge data", v26, 2u);
        MEMORY[0x242652480](v26, -1, -1);
      }

    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v16);
  }
}

void sub_23E70C6B4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSArray *v18;
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
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char **v34;
  __int128 v35;
  unint64_t *v36;
  unint64_t v37;
  _QWORD *v38;
  id v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  char *v73;
  _OWORD *v74;
  uint64_t v75;
  void (*v76)(char *);
  unsigned int v77;
  void (*v78)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  char *v86;
  char *v87;
  _QWORD *v88;
  uint64_t v89;
  id v90;
  __int128 v91;
  _OWORD v92[2];
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  _OWORD v97[2];
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v88 = (_QWORD *)sub_23E7175B8();
  v0 = *(v88 - 1);
  MEMORY[0x24BDAC7A8](v88);
  v2 = (char *)&v72 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336908);
  MEMORY[0x24BDAC7A8](v3);
  *(_QWORD *)&v84 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_23E717630();
  v83 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v6 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_23E7188F0();
  v7 = *(char **)(v89 - 8);
  v8 = MEMORY[0x24BDAC7A8](v89);
  v80 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v87 = (char *)&v72 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v86 = (char *)&v72 - v12;
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_standardUserDefaults);
  v15 = (void *)sub_23E718AC4();
  v16 = objc_msgSend(v14, sel_objectForKey_, v15);

  v79 = v13;
  if (v16)
  {
    sub_23E719004();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v97, 0, sizeof(v97));
  }
  sub_23E5F47F4((uint64_t)v97, (uint64_t)&v98, &qword_254337C90);
  v17 = v89;
  if (v100)
  {
    if (swift_dynamicCast() && (v90 & 1) != 0)
      return;
  }
  else
  {
    sub_23E5C4F58((uint64_t)&v98, &qword_254337C90);
  }
  v18 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v19 = sub_23E718C38();

  if (*(_QWORD *)(v19 + 16))
  {
    v86 = v7;
    v75 = *(_QWORD *)(v19 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v91 = xmmword_23E71B0D0;
    v74 = v92;
    v20 = v83;
    v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v83 + 56);
    v81 = 1;
    v21 = v84;
    v22 = v85;
    v78(v84, 1, 1, v85);
    v77 = *MEMORY[0x24BDCD7A0];
    v76 = *(void (**)(char *))(v0 + 104);
    v76(v2);
    swift_bridgeObjectRetain();
    sub_23E717624();
    v23 = sub_23E71760C();
    v25 = v24;
    v83 = *(_QWORD *)(v20 + 8);
    ((void (*)(char *, uint64_t))v83)(v6, v22);
    v98 = 0xD000000000000021;
    v99 = 0x800000023E725550;
    *(_QWORD *)&v97[0] = v23;
    *((_QWORD *)&v97[0] + 1) = v25;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v97[0] = sub_23E718BF0();
    *((_QWORD *)&v97[0] + 1) = v26;
    sub_23E718B90();
    swift_bridgeObjectRelease();
    v27 = (char *)v92 + 8;
    v92[0] = v97[0];
    v78(v21, 1, 1, v22);
    ((void (*)(char *, _QWORD, _QWORD *))v76)(v2, v77, v88);
    sub_23E717624();
    v28 = sub_23E71760C();
    v30 = v29;
    ((void (*)(char *, uint64_t))v83)(v6, v22);
    v98 = 0xD00000000000002BLL;
    v99 = 0x800000023E725580;
    *(_QWORD *)&v97[0] = v28;
    *((_QWORD *)&v97[0] + 1) = v30;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v97[0] = sub_23E718BF0();
    *((_QWORD *)&v97[0] + 1) = v31;
    sub_23E718B90();
    swift_bridgeObjectRelease();
    v92[1] = v97[0];
    v93 = 0xD00000000000003CLL;
    v94 = 0x800000023E7255B0;
    v95 = 0xD000000000000046;
    v96 = 0x800000023E7255F0;
    v32 = (void *)objc_opt_self();
    v33 = 0;
    v34 = &selRef_save_;
    *(_QWORD *)&v35 = 136315138;
    v84 = v35;
    v83 = MEMORY[0x24BEE4AD8] + 8;
    v73 = (char *)v92 + 8;
    v85 = (uint64_t)v32;
LABEL_11:
    v36 = (unint64_t *)&v27[16 * v33++];
    do
    {
      if (v33 - 1 >= (unint64_t)v91)
      {
        __break(1u);
LABEL_39:
        swift_arrayDestroy();
        return;
      }
      v38 = (_QWORD *)*(v36 - 1);
      v37 = *v36;
      swift_bridgeObjectRetain();
      v39 = objc_msgSend(v32, v34[149]);
      v40 = (void *)sub_23E718AC4();
      v41 = objc_msgSend(v39, sel_fileExistsAtPath_, v40);

      if ((v41 & 1) != 0)
      {
        v42 = objc_msgSend(v32, v34[149]);
        v43 = (void *)sub_23E718AC4();
        v90 = 0;
        v44 = objc_msgSend(v42, sel_removeItemAtPath_error_, v43, &v90);

        if (!v44)
        {
          v55 = v90;
          v56 = (_QWORD *)sub_23E7175AC();

          swift_willThrow();
          if (qword_254337B10 != -1)
            swift_once();
          v57 = v89;
          v58 = __swift_project_value_buffer(v89, (uint64_t)qword_254339400);
          swift_beginAccess();
          v59 = v86;
          v60 = v80;
          (*((void (**)(char *, uint64_t, uint64_t))v86 + 2))(v80, v58, v57);
          swift_bridgeObjectRetain();
          v61 = sub_23E7188D8();
          v62 = sub_23E718DD0();
          if (os_log_type_enabled(v61, v62))
          {
            v63 = swift_slowAlloc();
            v64 = (void *)swift_slowAlloc();
            v88 = v56;
            v65 = v64;
            v90 = v64;
            *(_DWORD *)v63 = v84;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v63 + 4) = sub_23E60EA08((uint64_t)v38, v37, (uint64_t *)&v90);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_23E5C0000, v61, v62, "Failed to delete path %s for migration", (uint8_t *)v63, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x242652480](v65, -1, -1);
            MEMORY[0x242652480](v63, -1, -1);

            (*((void (**)(char *, uint64_t))v59 + 1))(v60, v89);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*((void (**)(char *, uint64_t))v59 + 1))(v60, v57);
          }
          v82 = 0;
          v81 = 0;
          v27 = v73;
          v32 = (void *)v85;
          v34 = &selRef_save_;
          if (v33 == 4)
            goto LABEL_39;
          goto LABEL_11;
        }
        v88 = v38;
        v45 = qword_254337B10;
        v46 = v90;
        if (v45 != -1)
          swift_once();
        v47 = v89;
        v48 = __swift_project_value_buffer(v89, (uint64_t)qword_254339400);
        swift_beginAccess();
        v49 = v86;
        v50 = v87;
        (*((void (**)(char *, uint64_t, uint64_t))v86 + 2))(v87, v48, v47);
        swift_bridgeObjectRetain();
        v51 = sub_23E7188D8();
        v52 = sub_23E718DD0();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = swift_slowAlloc();
          v54 = (void *)swift_slowAlloc();
          v90 = v54;
          *(_DWORD *)v53 = v84;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v53 + 4) = sub_23E60EA08((uint64_t)v88, v37, (uint64_t *)&v90);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23E5C0000, v51, v52, "Deleted the path %s for migration", (uint8_t *)v53, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x242652480](v54, -1, -1);
          MEMORY[0x242652480](v53, -1, -1);

          (*((void (**)(char *, uint64_t))v49 + 1))(v50, v89);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*((void (**)(char *, uint64_t))v49 + 1))(v50, v47);
        }
        v32 = (void *)v85;
        v34 = &selRef_save_;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      ++v33;
      v36 += 2;
    }
    while (v33 != 5);
    swift_arrayDestroy();
    if ((v81 & 1) != 0)
    {
      v66 = objc_msgSend(v79, sel_standardUserDefaults);
      v67 = (void *)sub_23E718AC4();
      objc_msgSend(v66, sel_setBool_forKey_, 1, v67);

    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_254337B10 != -1)
      swift_once();
    v68 = __swift_project_value_buffer(v17, (uint64_t)qword_254339400);
    swift_beginAccess();
    (*((void (**)(char *, uint64_t, uint64_t))v7 + 2))(v86, v68, v17);
    v69 = sub_23E7188D8();
    v70 = sub_23E718DD0();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_23E5C0000, v69, v70, "Can't get the library directory", v71, 2u);
      MEMORY[0x242652480](v71, -1, -1);
    }

    (*((void (**)(char *, uint64_t))v7 + 1))(v86, v89);
  }
}

uint64_t sub_23E70D2F4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t);
  id v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v36 = a6;
  v37 = a5;
  v8 = sub_23E7188F0();
  v39 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v35 - v12;
  v14 = objc_allocWithZone(MEMORY[0x24BE16A10]);
  v15 = (void *)sub_23E718AC4();
  v16 = (void *)sub_23E718AC4();
  v17 = objc_msgSend(v14, sel_initWithExtensionBundleIdentifier_kind_, v15, v16);

  v38 = a1;
  v18 = (void *)sub_23E718AC4();
  v19 = objc_msgSend(v17, sel_reloadTimelineWithReason_, v18);

  if (v19)
  {

    if (qword_254337B10 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v8, (uint64_t)qword_254339400);
    swift_beginAccess();
    v21 = v39;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v13, v20, v8);
    swift_bridgeObjectRetain_n();
    v22 = sub_23E7188D8();
    v23 = sub_23E718DD0();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v41 = v25;
      v35 = v17;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain();
      v40 = sub_23E60EA08(v38, a2, &v41);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v22, v23, v37, v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v25, -1, -1);
      MEMORY[0x242652480](v24, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v13, v8);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v13, v8);
    }
  }
  else
  {
    if (qword_254337B10 != -1)
      swift_once();
    v27 = v8;
    v28 = __swift_project_value_buffer(v8, (uint64_t)qword_254339400);
    swift_beginAccess();
    v29 = v39;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v11, v28, v27);
    swift_bridgeObjectRetain_n();
    v30 = sub_23E7188D8();
    v31 = sub_23E718DB8();
    if (os_log_type_enabled(v30, v31))
    {
      v35 = v17;
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v41 = v33;
      *(_DWORD *)v32 = 136315138;
      swift_bridgeObjectRetain();
      v40 = sub_23E60EA08(v38, a2, &v41);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v30, v31, v36, v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v33, -1, -1);
      MEMORY[0x242652480](v32, -1, -1);

      v34 = *(uint64_t (**)(char *, uint64_t))(v39 + 8);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v34 = *(uint64_t (**)(char *, uint64_t))(v29 + 8);
    }
    return v34(v11, v27);
  }
}

uint64_t sub_23E70D7A0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _OWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t i;
  _OWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  _OWORD v46[2];
  _OWORD v47[2];
  __int128 v48;
  _OWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v50 = a1;
  v51 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v52 = v8;
  v53 = 0;
  v54 = v11 & v9;
  v55 = a2;
  v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23E70DE74(&v48);
  v12 = *((_QWORD *)&v48 + 1);
  if (!*((_QWORD *)&v48 + 1))
    goto LABEL_27;
  v13 = v48;
  sub_23E5F4874(v49, v47);
  v14 = *(_QWORD **)a5;
  v16 = sub_23E7015C8(v13, v12);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v20 = v15;
  if (v14[3] >= v19)
  {
    if ((a4 & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      sub_23E704A74();
      if ((v20 & 1) != 0)
        goto LABEL_12;
    }
LABEL_14:
    v24 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    v25 = (uint64_t *)(v24[6] + 16 * v16);
    *v25 = v13;
    v25[1] = v12;
    sub_23E5F4874(v47, (_OWORD *)(v24[7] + 32 * v16));
    v26 = v24[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_23E70DE74(&v48);
    for (i = *((_QWORD *)&v48 + 1); *((_QWORD *)&v48 + 1); i = *((_QWORD *)&v48 + 1))
    {
      v31 = v48;
      sub_23E5F4874(v49, v47);
      v32 = *(_QWORD **)a5;
      v34 = sub_23E7015C8(v31, i);
      v35 = v32[2];
      v36 = (v33 & 1) == 0;
      v37 = v35 + v36;
      if (__OFADD__(v35, v36))
        goto LABEL_28;
      v38 = v33;
      if (v32[3] < v37)
      {
        sub_23E701E14(v37, 1);
        v39 = sub_23E7015C8(v31, i);
        if ((v38 & 1) != (v40 & 1))
          goto LABEL_30;
        v34 = v39;
      }
      if ((v38 & 1) != 0)
      {
        sub_23E5F4838((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
        swift_bridgeObjectRelease();
        v30 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
        sub_23E5F4874(v46, v30);
      }
      else
      {
        v41 = *(_QWORD **)a5;
        *(_QWORD *)(*(_QWORD *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        v42 = (uint64_t *)(v41[6] + 16 * v34);
        *v42 = v31;
        v42[1] = i;
        sub_23E5F4874(v47, (_OWORD *)(v41[7] + 32 * v34));
        v43 = v41[2];
        v27 = __OFADD__(v43, 1);
        v44 = v43 + 1;
        if (v27)
          goto LABEL_29;
        v41[2] = v44;
      }
      sub_23E70DE74(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_23E629C04();
    return swift_release();
  }
  sub_23E701E14(v19, a4 & 1);
  v21 = sub_23E7015C8(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    v16 = v21;
    if ((v20 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    sub_23E5F4838((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
    swift_bridgeObjectRelease();
    v23 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
    sub_23E5F4874(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  result = sub_23E719244();
  __break(1u);
  return result;
}

uint64_t sub_23E70DAF4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_23E5DB72C(a1, a2);
  sub_23E70DCD8(a1, a2);
  sub_23E5DB7D8(a1, a2);
  v4 = sub_23E718B60();
  swift_release();
  return v4;
}

uint64_t sub_23E70DB68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23E718B60();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23E70DBA0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_23E5F4838((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

_QWORD *sub_23E70DBE0(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = a3(&v6, a1, v4);
  if (!v3)
    return (_QWORD *)v6;
  return result;
}

uint64_t sub_23E70DC2C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_23E717474();
  v9 = result;
  if (result)
  {
    result = sub_23E717498();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = sub_23E71748C();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = v9 + v13;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  result = (uint64_t)sub_23E70DBE0(v9, v15, a4);
  if (v4)
    return v16;
  return result;
}

void sub_23E70DCD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_23E7176B4();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

_QWORD *sub_23E70DD54()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254337C78);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_23E5DB72C(v2, v0);
    v7 = sub_23E717660();
    sub_23E5DB7D8(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x23E70DE28);
    }
  }
  return v4;
}

uint64_t sub_23E70DE40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_23E718B60();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23E70DE74@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_23E5F4838(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v15 != v18)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_23E5F47F4((uint64_t)&v23, (uint64_t)v22, &qword_254336EE8);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_23E5C4F58((uint64_t)v21, &qword_254336EE0);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_23E70E058()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = type metadata accessor for CDEnergyWindowsCache();
  v0[152] = v1;
  v0[153] = *(_QWORD *)(v1 - 8);
  v0[154] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254336EC8);
  v0[155] = swift_task_alloc();
  v0[156] = swift_task_alloc();
  v0[157] = *(_QWORD *)(type metadata accessor for CDEnergyWindowsTracker() - 8);
  v0[158] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E70E138()
{
  uint64_t v0;

  if (qword_254337180 != -1)
    swift_once();
  *(_QWORD *)(v0 + 1272) = qword_2543393B0;
  return swift_task_switch();
}

uint64_t sub_23E70E1C8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 1280) = sub_23E5FA04C();
  return swift_task_switch();
}

uint64_t sub_23E70E234()
{
  uint64_t v0;
  _OWORD *v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  _OWORD *v35;
  _OWORD *v36;
  _OWORD *v37;
  _OWORD *v38;
  _OWORD *v39;
  _OWORD *v40;
  _OWORD *v41;
  _OWORD *v42;
  _OWORD *v43;
  _OWORD *v44;
  _OWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;

  v1 = (_OWORD *)(v0 + 608);
  v2 = (_OWORD *)(v0 + 640);
  v3 = *(_QWORD *)(v0 + 1280);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v45 = (_OWORD *)(v0 + 128);
    v44 = (_OWORD *)(v0 + 192);
    v43 = (_OWORD *)(v0 + 256);
    v42 = (_OWORD *)(v0 + 320);
    v35 = (_OWORD *)(v0 + 448);
    v36 = (_OWORD *)(v0 + 384);
    v41 = (_OWORD *)(v0 + 512);
    v40 = (_OWORD *)(v0 + 576);
    v39 = (_OWORD *)(v0 + 960);
    v37 = (_OWORD *)(v0 + 1152);
    v38 = (_OWORD *)(v0 + 992);
    v5 = (_BYTE *)(v3 + 120);
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v7 = MEMORY[0x24BEE0D00];
    while (1)
    {
      v52 = v6;
      v53 = v4;
      v8 = *((_QWORD *)v5 - 11);
      v9 = *((_QWORD *)v5 - 10);
      v10 = v7;
      v11 = *(v5 - 72);
      v50 = *(v5 - 71);
      v12 = *((_QWORD *)v5 - 7);
      v13 = *((_QWORD *)v5 - 5);
      v48 = *((_QWORD *)v5 - 8);
      v49 = *((_QWORD *)v5 - 6);
      v14 = *((_QWORD *)v5 - 3);
      v15 = *((_QWORD *)v5 - 1);
      v46 = *((_QWORD *)v5 - 4);
      v47 = *((_QWORD *)v5 - 2);
      v51 = *v5;
      *(_QWORD *)(v0 + 1048) = v10;
      *(_QWORD *)(v0 + 1024) = v8;
      *(_QWORD *)(v0 + 1032) = v9;
      sub_23E5F4874((_OWORD *)(v0 + 1024), v39);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = MEMORY[0x24BEE4B00];
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v39, 0x444964697267, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      v18 = MEMORY[0x24BEE1328];
      *(_QWORD *)(v0 + 120) = MEMORY[0x24BEE1328];
      *(_BYTE *)(v0 + 96) = v11;
      sub_23E5F4874((_OWORD *)(v0 + 96), v45);
      v19 = swift_isUniquelyReferenced_nonNull_native();
      v7 = v10;
      sub_23E703A9C(v45, 0xD000000000000012, 0x800000023E720A40, v19);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 184) = v18;
      *(_BYTE *)(v0 + 160) = v50;
      sub_23E5F4874((_OWORD *)(v0 + 160), v44);
      v20 = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v44, 0x6863746170736964, 0xEA00000000006465, v20);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 248) = v10;
      *(_QWORD *)(v0 + 224) = v48;
      *(_QWORD *)(v0 + 232) = v12;
      sub_23E5F4874((_OWORD *)(v0 + 224), v43);
      swift_bridgeObjectRetain();
      v21 = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v43, 0x656C746974, 0xE500000000000000, v21);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 312) = v10;
      *(_QWORD *)(v0 + 288) = v49;
      *(_QWORD *)(v0 + 296) = v13;
      sub_23E5F4874((_OWORD *)(v0 + 288), v42);
      swift_bridgeObjectRetain();
      v22 = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v42, 2036625250, 0xE400000000000000, v22);
      v54 = v16;
      swift_bridgeObjectRelease();
      if (v14)
      {
        *(_QWORD *)(v0 + 376) = v10;
        *(_QWORD *)(v0 + 352) = v46;
        *(_QWORD *)(v0 + 360) = v14;
        sub_23E5F4874((_OWORD *)(v0 + 352), v38);
        swift_bridgeObjectRetain();
        v23 = swift_isUniquelyReferenced_nonNull_native();
        sub_23E703A9C(v38, 0x4C5255706174, 0xE600000000000000, v23);
        v54 = v16;
        swift_bridgeObjectRelease();
        v24 = v15;
        v6 = v52;
        if (!v15)
          goto LABEL_7;
      }
      else
      {
        sub_23E6DF92C(0x4C5255706174, 0xE600000000000000, v36);
        sub_23E5C4F58((uint64_t)v36, &qword_254337C90);
        v24 = v15;
        v6 = v52;
        if (!v15)
        {
LABEL_7:
          sub_23E6DF92C(0x4449656D6F68, 0xE600000000000000, v35);
          sub_23E5C4F58((uint64_t)v35, &qword_254337C90);
          v26 = v54;
          goto LABEL_8;
        }
      }
      *(_QWORD *)(v0 + 440) = v7;
      *(_QWORD *)(v0 + 416) = v47;
      *(_QWORD *)(v0 + 424) = v24;
      sub_23E5F4874((_OWORD *)(v0 + 416), v37);
      swift_bridgeObjectRetain();
      v25 = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v37, 0x4449656D6F68, 0xE600000000000000, v25);
      v26 = v54;
      swift_bridgeObjectRelease();
LABEL_8:
      *(_QWORD *)(v0 + 504) = MEMORY[0x24BEE1328];
      *(_BYTE *)(v0 + 480) = v51;
      sub_23E5F4874((_OWORD *)(v0 + 480), v41);
      v27 = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v41, 0xD000000000000013, 0x800000023E725720, v27);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 568) = __swift_instantiateConcreteTypeFromMangledName(&qword_254336ED8);
      *(_QWORD *)(v0 + 544) = v26;
      sub_23E5F4874((_OWORD *)(v0 + 544), v40);
      v28 = swift_isUniquelyReferenced_nonNull_native();
      sub_23E703A9C(v40, 0x747865746E6F63, 0xE700000000000000, v28);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_23E6F3BDC(0, v6[2] + 1, 1, v6);
      v30 = v6[2];
      v29 = v6[3];
      if (v30 >= v29 >> 1)
        v6 = sub_23E6F3BDC((_QWORD *)(v29 > 1), v30 + 1, 1, v6);
      v6[2] = v30 + 1;
      v6[v30 + 4] = v16;
      v5 += 96;
      v4 = v53 - 1;
      if (v53 == 1)
      {
        v1 = (_OWORD *)(v0 + 608);
        v2 = (_OWORD *)(v0 + 640);
        goto LABEL_15;
      }
    }
  }
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_15:
  swift_bridgeObjectRelease();
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_254336EF8);
  *(_QWORD *)(v0 + 1288) = v31;
  *(_QWORD *)(v0 + 632) = v31;
  *(_QWORD *)(v0 + 608) = v6;
  sub_23E5F4874(v1, v2);
  v32 = MEMORY[0x24BEE4B00];
  v33 = swift_isUniquelyReferenced_nonNull_native();
  sub_23E703A9C(v2, 0xD000000000000015, 0x800000023E725740, v33);
  *(_QWORD *)(v0 + 1296) = v32;
  swift_bridgeObjectRelease();
  if (qword_254337088 != -1)
    swift_once();
  *(_QWORD *)(v0 + 1304) = qword_2543393A8;
  return swift_task_switch();
}

uint64_t sub_23E70E8F8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 1312) = sub_23E66EED0();
  return swift_task_switch();
}

uint64_t sub_23E70E964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v11;
  uint64_t v13;
  char v14;

  v1 = *(_QWORD *)(v0 + 1312);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 1320) = v2;
  if (v2)
  {
    v3 = *(uint64_t **)(v0 + 1264);
    v4 = *(_QWORD *)(v0 + 1256);
    v5 = *(_DWORD *)(v4 + 80);
    *(_DWORD *)(v0 + 1392) = v5;
    v6 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 1328) = *(_QWORD *)(v4 + 72);
    *(_QWORD *)(v0 + 1352) = v6;
    *(_OWORD *)(v0 + 1336) = 0u;
    sub_23E60AB0C(v1 + ((v5 + 32) & ~(unint64_t)v5), (uint64_t)v3);
    v7 = *v3;
    v8 = v3[1];
    *(_QWORD *)(v0 + 696) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 672) = v7;
    *(_QWORD *)(v0 + 680) = v8;
    sub_23E5F4874((_OWORD *)(v0 + 672), (_OWORD *)(v0 + 704));
    swift_bridgeObjectRetain();
    v9 = MEMORY[0x24BEE4B00];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C((_OWORD *)(v0 + 704), 0x444964697267, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v0 + 1360) = v9;
    swift_bridgeObjectRelease();
    if (qword_254336FA0 != -1)
      swift_once();
    v11 = *(_QWORD **)(v0 + 1264);
    *(_QWORD *)(v0 + 1368) = qword_2543393A0;
    *(_QWORD *)(v0 + 1376) = *v11;
    *(_QWORD *)(v0 + 1384) = v11[1];
    return swift_task_switch();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = *(_QWORD *)(v0 + 1296);
    *(_QWORD *)(v0 + 824) = *(_QWORD *)(v0 + 1288);
    *(_QWORD *)(v0 + 800) = MEMORY[0x24BEE4AF8];
    sub_23E5F4874((_OWORD *)(v0 + 800), (_OWORD *)(v0 + 832));
    v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C((_OWORD *)(v0 + 832), 0x676E696B63617274, 0xEC00000061746144, v14);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
  }
}

uint64_t sub_23E70EBCC()
{
  uint64_t v0;

  sub_23E6969D8(*(_QWORD *)(v0 + 1376), *(_QWORD *)(v0 + 1384), *(_QWORD *)(v0 + 1248));
  return swift_task_switch();
}

uint64_t sub_23E70EC40()
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
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;

  v1 = *(_QWORD *)(v0 + 1240);
  v2 = *(_QWORD *)(v0 + 1224);
  v3 = *(_QWORD *)(v0 + 1216);
  sub_23E697220(*(_QWORD *)(v0 + 1248), v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) != 1)
  {
    v6 = *(_QWORD *)(v0 + 1232);
    sub_23E70FB44(*(_QWORD *)(v0 + 1240), v6);
    v7 = *(_QWORD *)(v6 + 16);
    v8 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)(v0 + 888) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 864) = v7;
    *(_QWORD *)(v0 + 872) = v8;
    sub_23E5F4874((_OWORD *)(v0 + 864), (_OWORD *)(v0 + 896));
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C((_OWORD *)(v0 + 896), 0x444964697267, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    __asm { BR              X10 }
  }
  sub_23E5C4F58(*(_QWORD *)(v0 + 1240), &qword_254336EC8);
  v4 = *(_QWORD *)(v0 + 1336);
  v5 = MEMORY[0x24BEE4AF8];
  v10 = *(_QWORD *)(v0 + 1360);
  *(_QWORD *)(v0 + 760) = *(_QWORD *)(v0 + 1288);
  *(_QWORD *)(v0 + 736) = v5;
  sub_23E5F4874((_OWORD *)(v0 + 736), (_OWORD *)(v0 + 768));
  v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_23E703A9C((_OWORD *)(v0 + 768), 0xD000000000000014, 0x800000023E725760, v11);
  v12 = v10;
  swift_bridgeObjectRelease();
  v13 = swift_isUniquelyReferenced_nonNull_native();
  v14 = *(_QWORD **)(v0 + 1352);
  if ((v13 & 1) == 0)
    v14 = sub_23E6F3BDC(0, v14[2] + 1, 1, *(_QWORD **)(v0 + 1352));
  v16 = v14[2];
  v15 = v14[3];
  if (v16 >= v15 >> 1)
    v14 = sub_23E6F3BDC((_QWORD *)(v15 > 1), v16 + 1, 1, v14);
  v17 = *(_QWORD *)(v0 + 1320);
  v18 = *(_QWORD *)(v0 + 1264);
  v19 = *(_QWORD *)(v0 + 1248);
  v20 = *(_QWORD *)(v0 + 1344) + 1;
  v14[2] = v16 + 1;
  v14[v16 + 4] = v12;
  sub_23E5C4F58(v19, &qword_254336EC8);
  sub_23E609FCC(v18, (uint64_t (*)(_QWORD))type metadata accessor for CDEnergyWindowsTracker);
  if (v20 == v17)
  {
    swift_bridgeObjectRelease();
    v21 = *(_QWORD *)(v0 + 1296);
    *(_QWORD *)(v0 + 824) = *(_QWORD *)(v0 + 1288);
    *(_QWORD *)(v0 + 800) = v14;
    sub_23E5F4874((_OWORD *)(v0 + 800), (_OWORD *)(v0 + 832));
    v22 = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C((_OWORD *)(v0 + 832), 0x676E696B63617274, 0xEC00000061746144, v22);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 1344) + 1;
    *(_QWORD *)(v0 + 1352) = v14;
    *(_QWORD *)(v0 + 1344) = v24;
    *(_QWORD *)(v0 + 1336) = v4;
    v25 = *(uint64_t **)(v0 + 1264);
    sub_23E60AB0C(*(_QWORD *)(v0 + 1312)+ ((*(unsigned __int8 *)(v0 + 1392) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1392))+ *(_QWORD *)(v0 + 1328) * v24, (uint64_t)v25);
    v26 = *v25;
    v27 = v25[1];
    *(_QWORD *)(v0 + 696) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 672) = v26;
    *(_QWORD *)(v0 + 680) = v27;
    sub_23E5F4874((_OWORD *)(v0 + 672), (_OWORD *)(v0 + 704));
    swift_bridgeObjectRetain();
    v28 = MEMORY[0x24BEE4B00];
    v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_23E703A9C((_OWORD *)(v0 + 704), 0x444964697267, 0xE600000000000000, v29);
    *(_QWORD *)(v0 + 1360) = v28;
    swift_bridgeObjectRelease();
    if (qword_254336FA0 != -1)
      swift_once();
    v30 = *(_QWORD **)(v0 + 1264);
    *(_QWORD *)(v0 + 1368) = qword_2543393A0;
    *(_QWORD *)(v0 + 1376) = *v30;
    *(_QWORD *)(v0 + 1384) = v30[1];
    return swift_task_switch();
  }
}

uint64_t sub_23E70F53C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = a2;
  v3 = sub_23E7188F0();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E70F59C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  if (qword_254337B10 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23E7188D8();
  v6 = sub_23E718DB8();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 64);
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_23E60EA08(0xD000000000000022, 0x800000023E725640, &v18);
    sub_23E718FC8();
    _os_log_impl(&dword_23E5C0000, v5, v6, "%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v12, -1, -1);
    MEMORY[0x242652480](v11, -1, -1);
  }

  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v15 = *(_QWORD *)(v0 + 48);
  v14 = *(_QWORD *)(v0 + 56);
  v16 = (void *)MEMORY[0x242651F34](v13);
  sub_23E70D2F4(v15, v14, 0xD000000000000014, 0x800000023E725670, "Failed to refresh Home's EnergyForecastWidget: %s", "Reload timeline for Home's EnergyForecastWidget: %s");
  objc_autoreleasePoolPop(v16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E70F7EC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = a2;
  v3 = sub_23E7188F0();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E70F84C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  if (qword_254337B10 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23E7188D8();
  v6 = sub_23E718DB8();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 64);
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v21 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_23E60EA08(0xD00000000000002DLL, 0x800000023E7254B0, &v21);
    sub_23E718FC8();
    _os_log_impl(&dword_23E5C0000, v5, v6, "%s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242652480](v12, -1, -1);
    MEMORY[0x242652480](v11, -1, -1);
  }

  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v14 = *(_QWORD *)(v0 + 48);
  v15 = *(_QWORD *)(v0 + 56);
  v16 = (void *)MEMORY[0x242651F34](v13);
  sub_23E70D2F4(v14, v15, 0xD000000000000015, 0x800000023E725530, "Failed to refresh Home's HistoricalUsageWidget: %s", "Reload timeline for Home's HistoricalUsageWidget: %s");
  objc_autoreleasePoolPop(v16);
  v18 = *(_QWORD *)(v0 + 48);
  v17 = *(_QWORD *)(v0 + 56);
  v19 = (void *)MEMORY[0x242651F34]();
  sub_23E70D2F4(v18, v17, 0xD000000000000015, 0x800000023E725510, "Failed to refresh Home's UtilityRateInfoWidget: %s", "Reload timeline for Home's UtilityRateInfoWidget: %s");
  objc_autoreleasePoolPop(v19);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23E70FB08()
{
  unint64_t result;

  result = qword_254336F28;
  if (!qword_254336F28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254336F28);
  }
  return result;
}

uint64_t sub_23E70FB44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CDEnergyWindowsCache();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static TOUPeaks.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_23E718AC4();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

char *keypath_get_selector_tariffProfileID()
{
  return sel_tariffProfileID;
}

void sub_23E70FBF8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_tariffProfileID, a2);
}

void sub_23E70FC14(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setTariffProfileID_);
}

void sub_23E70FC28(id *a1, uint64_t a2, uint64_t a3)
{
  sub_23E5C5BF0(a1, a2, a3, (SEL *)&selRef_start);
}

void sub_23E70FC44(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_8Tm(a1, a2, a3, a4, (SEL *)&selRef_setStart_);
}

void sub_23E70FC50(id *a1, uint64_t a2, uint64_t a3)
{
  sub_23E5C5BF0(a1, a2, a3, (SEL *)&selRef_end);
}

void sub_23E70FC6C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_8Tm(a1, a2, a3, a4, (SEL *)&selRef_setEnd_);
}

char *keypath_get_selector_peaks()
{
  return sel_peaks;
}

void sub_23E70FC84(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_peaks);
  v4 = sub_23E71769C();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

void sub_23E70FCDC(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCDCA0], (SEL *)&selRef_setPeaks_);
}

void sub_23E70FCF0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_utilityID, a2);
}

void sub_23E70FD0C(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setUtilityID_);
}

char *keypath_get_selector_descriptor()
{
  return sel_descriptor;
}

void sub_23E70FD2C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_23E5C29B8(a1, (SEL *)&selRef_descriptor, a2);
}

void sub_23E70FD48(_QWORD *a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BDCF9E0], (SEL *)&selRef_setDescriptor_);
}

uint64_t sub_23E70FD5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543368D8);
  v2[4] = swift_task_alloc();
  v2[5] = swift_task_alloc();
  v2[6] = swift_task_alloc();
  v3 = sub_23E717A44();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E70FE18()
{
  uint64_t v0;
  _QWORD *v1;

  if ((sub_23E717E58() & 1) != 0)
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v1;
    *v1 = v0;
    v1[1] = sub_23E70FEF0;
    return sub_23E710350(*(_QWORD *)(v0 + 48));
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 56))(*(_QWORD *)(v0 + 16), 1, 1, *(_QWORD *)(v0 + 56));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23E70FEF0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E70FF48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  *(_QWORD *)(v0 + 104) = v4;
  if (v4(v3, 1, v1) == 1)
  {
    sub_23E5C4F58(v3, (uint64_t *)&unk_2543368D8);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v5;
    *v5 = v0;
    v5[1] = sub_23E71007C;
    return sub_23E710D94(*(_QWORD *)(v0 + 40));
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 16);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
    v9(v7, v3, v1);
    v9(v8, v7, v1);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 56))(*(_QWORD *)(v0 + 16), 0, 1, *(_QWORD *)(v0 + 56));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23E71007C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E7100D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v2, 1, v1) == 1)
  {
    sub_23E5C4F58(v2, (uint64_t *)&unk_2543368D8);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v3;
    *v3 = v0;
    v3[1] = sub_23E710204;
    return sub_23E7116FC(*(_QWORD *)(v0 + 32));
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 16);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 64) + 32);
    v7(v5, v2, v1);
    v7(v6, v5, v1);
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 56))(*(_QWORD *)(v0 + 16), 0, 1, *(_QWORD *)(v0 + 56));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23E710204()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23E71025C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 104))(v2, 1, v1) == 1)
  {
    sub_23E5C4F58(v2, (uint64_t *)&unk_2543368D8);
    v3 = 1;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 16);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 64) + 32);
    v6(v4, v2, v1);
    v6(v5, v4, v1);
    v3 = 0;
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 56))(*(_QWORD *)(v0 + 16), v3, 1, *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E710350(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[56] = a1;
  v2 = sub_23E7177F8();
  v1[57] = v2;
  v1[58] = *(_QWORD *)(v2 - 8);
  v1[59] = swift_task_alloc();
  v1[60] = swift_task_alloc();
  v3 = sub_23E7188F0();
  v1[61] = v3;
  v1[62] = *(_QWORD *)(v3 - 8);
  v1[63] = swift_task_alloc();
  v1[64] = swift_task_alloc();
  v1[65] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E710404()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v66)(uint64_t, uint64_t, uint64_t);

  v1 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v2 = (void *)sub_23E718AC4();
  v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

  if (v3)
  {
    if (qword_254337B10 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 520);
    v5 = *(_QWORD *)(v0 + 488);
    v6 = *(_QWORD *)(v0 + 496);
    v7 = __swift_project_value_buffer(v5, (uint64_t)qword_254339400);
    swift_beginAccess();
    v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v66(v4, v7, v5);
    v8 = sub_23E7188D8();
    v9 = sub_23E718DB8();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_23E5C0000, v8, v9, "Reading com.apple.Home defaults", v10, 2u);
      MEMORY[0x242652480](v10, -1, -1);
    }
    v11 = *(_QWORD *)(v0 + 520);
    v12 = *(_QWORD *)(v0 + 488);
    v13 = *(_QWORD *)(v0 + 496);

    v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v14(v11, v12);
    v15 = (void *)sub_23E718AC4();
    v16 = objc_msgSend(v3, sel_objectForKey_, v15);

    if (v16)
    {
      sub_23E719004();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 112) = 0u;
      *(_OWORD *)(v0 + 128) = 0u;
    }
    sub_23E5C4F94(v0 + 112, v0 + 80);
    if (*(_QWORD *)(v0 + 104))
    {
      if (swift_dynamicCast() && (*(_BYTE *)(v0 + 533) & 1) != 0)
      {
        v17 = *(_QWORD *)(v0 + 472);
        v18 = *(_QWORD *)(v0 + 480);
        v19 = *(_QWORD *)(v0 + 456);
        v20 = *(_QWORD *)(v0 + 464);
        v21 = *(_QWORD *)(v0 + 448);
        sub_23E7177D4();
        sub_23E718308();
        sub_23E717750();
        v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
        v22(v17, v19);
        sub_23E6FC534(v18, v21);
LABEL_53:

        v22(v18, v19);
        goto LABEL_63;
      }
    }
    else
    {
      sub_23E5C4F58(v0 + 80, &qword_254337C90);
    }
    v23 = (void *)sub_23E718AC4();
    v24 = objc_msgSend(v3, sel_objectForKey_, v23);

    if (v24)
    {
      sub_23E719004();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 176) = 0u;
      *(_OWORD *)(v0 + 192) = 0u;
    }
    sub_23E5C4F94(v0 + 176, v0 + 144);
    if (*(_QWORD *)(v0 + 168))
    {
      if (swift_dynamicCast() && (*(_BYTE *)(v0 + 532) & 1) != 0)
      {
        v25 = *(_QWORD *)(v0 + 472);
        v18 = *(_QWORD *)(v0 + 480);
        v19 = *(_QWORD *)(v0 + 456);
        v26 = *(_QWORD *)(v0 + 464);
        v27 = *(_QWORD *)(v0 + 448);
        sub_23E7177D4();
        sub_23E718308();
        sub_23E717750();
        v22 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
        v22(v25, v19);
        sub_23E6FC98C(v18, v27);
        goto LABEL_53;
      }
    }
    else
    {
      sub_23E5C4F58(v0 + 144, &qword_254337C90);
    }
    v28 = (void *)sub_23E718AC4();
    v29 = objc_msgSend(v3, sel_objectForKey_, v28);

    if (v29)
    {
      sub_23E719004();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 240) = 0u;
      *(_OWORD *)(v0 + 256) = 0u;
    }
    sub_23E5C4F94(v0 + 240, v0 + 208);
    if (*(_QWORD *)(v0 + 232))
    {
      if (swift_dynamicCast() && (*(_BYTE *)(v0 + 531) & 1) != 0)
      {
        v30 = *(_QWORD *)(v0 + 472);
        v18 = *(_QWORD *)(v0 + 480);
        v19 = *(_QWORD *)(v0 + 456);
        v31 = *(_QWORD *)(v0 + 464);
        v32 = *(_QWORD *)(v0 + 448);
        sub_23E7177D4();
        sub_23E718308();
        sub_23E717750();
        v22 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
        v22(v30, v19);
        sub_23E6FCFDC(v18, v32);
        goto LABEL_53;
      }
    }
    else
    {
      sub_23E5C4F58(v0 + 208, &qword_254337C90);
    }
    v33 = (void *)sub_23E718AC4();
    v34 = objc_msgSend(v3, sel_objectForKey_, v33);

    if (v34)
    {
      sub_23E719004();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 304) = 0u;
      *(_OWORD *)(v0 + 320) = 0u;
    }
    sub_23E5C4F94(v0 + 304, v0 + 272);
    if (*(_QWORD *)(v0 + 296))
    {
      if (swift_dynamicCast() && (*(_BYTE *)(v0 + 530) & 1) != 0)
      {
        v35 = *(_QWORD *)(v0 + 472);
        v18 = *(_QWORD *)(v0 + 480);
        v19 = *(_QWORD *)(v0 + 456);
        v36 = *(_QWORD *)(v0 + 464);
        v37 = *(_QWORD *)(v0 + 448);
        sub_23E7177D4();
        sub_23E718308();
        sub_23E717750();
        v22 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
        v22(v35, v19);
        sub_23E6FDB0C(v18, v37);
        goto LABEL_53;
      }
    }
    else
    {
      sub_23E5C4F58(v0 + 272, &qword_254337C90);
    }
    v38 = (void *)sub_23E718AC4();
    v39 = objc_msgSend(v3, sel_objectForKey_, v38);

    if (v39)
    {
      sub_23E719004();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 368) = 0u;
      *(_OWORD *)(v0 + 384) = 0u;
    }
    sub_23E5C4F94(v0 + 368, v0 + 16);
    if (*(_QWORD *)(v0 + 40))
    {
      if (swift_dynamicCast() && (*(_BYTE *)(v0 + 529) & 1) != 0)
      {
        v40 = *(_QWORD *)(v0 + 472);
        v18 = *(_QWORD *)(v0 + 480);
        v19 = *(_QWORD *)(v0 + 456);
        v41 = *(_QWORD *)(v0 + 464);
        v42 = *(_QWORD *)(v0 + 448);
        sub_23E7177D4();
        sub_23E718308();
        sub_23E717750();
        v22 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
        v22(v40, v19);
        sub_23E6FE27C(v18, v42);
        goto LABEL_53;
      }
    }
    else
    {
      sub_23E5C4F58(v0 + 16, &qword_254337C90);
    }
    v43 = (void *)sub_23E718AC4();
    v44 = objc_msgSend(v3, sel_objectForKey_, v43);

    if (v44)
    {
      sub_23E719004();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 48) = 0u;
      *(_OWORD *)(v0 + 64) = 0u;
    }
    sub_23E5C4F94(v0 + 48, v0 + 336);
    if (*(_QWORD *)(v0 + 360))
    {
      if (swift_dynamicCast() && (*(_BYTE *)(v0 + 528) & 1) != 0)
      {
        v45 = *(_QWORD *)(v0 + 472);
        v18 = *(_QWORD *)(v0 + 480);
        v19 = *(_QWORD *)(v0 + 456);
        v46 = *(_QWORD *)(v0 + 464);
        v47 = *(_QWORD *)(v0 + 448);
        sub_23E7177D4();
        sub_23E718308();
        sub_23E717750();
        v22 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
        v22(v45, v19);
        sub_23E6FE7DC(v18, v47);
        goto LABEL_53;
      }
    }
    else
    {
      sub_23E5C4F58(v0 + 336, &qword_254337C90);
    }
    v66(*(_QWORD *)(v0 + 512), v7, *(_QWORD *)(v0 + 488));
    v48 = sub_23E7188D8();
    v49 = sub_23E718DB8();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_23E5C0000, v48, v49, "Did not find entry in com.apple.Home defaults", v50, 2u);
      MEMORY[0x242652480](v50, -1, -1);
    }
    v51 = *(_QWORD *)(v0 + 512);
    v52 = *(_QWORD *)(v0 + 488);

    v14(v51, v52);
  }
  if (qword_254337B10 != -1)
    swift_once();
  v54 = *(_QWORD *)(v0 + 496);
  v53 = *(_QWORD *)(v0 + 504);
  v55 = *(_QWORD *)(v0 + 488);
  v56 = __swift_project_value_buffer(v55, (uint64_t)qword_254339400);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16))(v53, v56, v55);
  v57 = sub_23E7188D8();
  v58 = sub_23E718DB8();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v59 = 0;
    _os_log_impl(&dword_23E5C0000, v57, v58, "Did not find com.apple.Home defaults", v59, 2u);
    MEMORY[0x242652480](v59, -1, -1);
  }
  v61 = *(_QWORD *)(v0 + 496);
  v60 = *(_QWORD *)(v0 + 504);
  v62 = *(_QWORD *)(v0 + 488);
  v63 = *(_QWORD *)(v0 + 448);

  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
  v64 = sub_23E717A44();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v63, 1, 1, v64);
LABEL_63:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23E710D94(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[19] = a1;
  v2[20] = v1;
  v3 = sub_23E718B24();
  v2[21] = v3;
  v2[22] = *(_QWORD *)(v3 - 8);
  v2[23] = swift_task_alloc();
  v4 = sub_23E7175B8();
  v2[24] = v4;
  v2[25] = *(_QWORD *)(v4 - 8);
  v2[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336908);
  v2[27] = swift_task_alloc();
  v5 = sub_23E717630();
  v2[28] = v5;
  v2[29] = *(_QWORD *)(v5 - 8);
  v2[30] = swift_task_alloc();
  v6 = sub_23E7188F0();
  v2[31] = v6;
  v2[32] = *(_QWORD *)(v6 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E710EAC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;

  v1 = *(void **)(*(_QWORD *)(v0 + 160) + 120);
  v2 = (void *)sub_23E718AC4();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_23E719004();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_23E5C4F94(v0 + 48, v0 + 16);
  if (!*(_QWORD *)(v0 + 40))
  {
    sub_23E5C4F58(v0 + 16, &qword_254337C90);
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    v37 = sub_23E717A44();
    v38 = *(_QWORD *)(v37 - 8);
    v39 = 1;
LABEL_19:
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v38 + 56))(*(_QWORD *)(v0 + 152), v39, 1, v37);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  if (qword_254337B10 != -1)
    swift_once();
  v46 = v4;
  v6 = *(_QWORD *)(v0 + 280);
  v7 = *(_QWORD *)(v0 + 248);
  v8 = *(_QWORD *)(v0 + 256);
  v9 = __swift_project_value_buffer(v7, (uint64_t)qword_254339400);
  swift_beginAccess();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v10(v6, v9, v7);
  v11 = sub_23E7188D8();
  v12 = sub_23E718DDC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_23E5C0000, v11, v12, "Skip fetch from server. Use mock data instead", v13, 2u);
    MEMORY[0x242652480](v13, -1, -1);
  }
  v14 = *(_QWORD *)(v0 + 280);
  v15 = *(_QWORD *)(v0 + 248);
  v16 = *(_QWORD *)(v0 + 256);

  v17 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v17(v14, v15);
  v18 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v19 = (void *)sub_23E718AC4();
  LODWORD(v14) = objc_msgSend(v18, sel_fileExistsAtPath_, v19);

  if (!(_DWORD)v14)
  {
    v10(*(_QWORD *)(v0 + 264), v9, *(_QWORD *)(v0 + 248));
    swift_bridgeObjectRetain();
    v23 = sub_23E7188D8();
    v24 = sub_23E718DD0();
    v25 = os_log_type_enabled(v23, (os_log_type_t)v24);
    v26 = *(_QWORD *)(v0 + 264);
    v27 = *(_QWORD *)(v0 + 248);
    if (v25)
    {
      v44 = *(_QWORD *)(v0 + 264);
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v47 = v29;
      *(_DWORD *)v28 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 120) = sub_23E60EA08(v46, v5, &v47);
      sub_23E718FC8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23E5C0000, v23, (os_log_type_t)v24, "Mock data file %s not found.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242652480](v29, -1, -1);
      MEMORY[0x242652480](v28, -1, -1);

      v17(v44, v27);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v17(v26, v27);
    }
    goto LABEL_18;
  }
  v45 = v18;
  v43 = (uint64_t *)(v0 + 144);
  v21 = *(_QWORD *)(v0 + 200);
  v20 = *(_QWORD *)(v0 + 208);
  v22 = *(_QWORD *)(v0 + 192);
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 232) + 56))(*(_QWORD *)(v0 + 216), 1, 1, *(_QWORD *)(v0 + 224));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v20, *MEMORY[0x24BDCD7A0], v22);
  swift_bridgeObjectRetain();
  sub_23E717624();
  sub_23E718AB8();
  v31 = *(_QWORD *)(v0 + 176);
  v30 = *(_QWORD *)(v0 + 184);
  v32 = *(_QWORD *)(v0 + 168);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 224));
  sub_23E718B18();
  v33 = sub_23E718AF4();
  v35 = v34;
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  if (v35 >> 60 != 15)
  {
    sub_23E717408();
    swift_allocObject();
    sub_23E7173FC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D8D160);
    sub_23E711948();
    sub_23E7173F0();
    v40 = v35;
    swift_bridgeObjectRelease();
    result = swift_release();
    v41 = *v43;
    if (*(_QWORD *)(*v43 + 16))
    {
      v42 = *(_QWORD *)(v0 + 152);
      v37 = sub_23E717A44();
      v38 = *(_QWORD *)(v37 - 8);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v38 + 16))(v42, v41 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80)), v37);
      sub_23E5F304C(v33, v40);

      swift_bridgeObjectRelease();
      v39 = 0;
      goto LABEL_19;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23E7116FC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[10] = a1;
  v2[11] = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254336F90);
  v2[12] = swift_task_alloc();
  v3 = sub_23E7177F8();
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23E711780()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(void **)(*(_QWORD *)(v0 + 88) + 120);
  v2 = (void *)sub_23E718AC4();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_23E719004();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_23E5C4F94(v0 + 48, v0 + 16);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 96);
  if (!*(_QWORD *)(v0 + 40))
  {
    sub_23E5C4F58(v0 + 16, &qword_254337C90);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v6, 1, 1, v4);
    goto LABEL_8;
  }
  v7 = swift_dynamicCast();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v6, v7 ^ 1u, 1, v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
  {
LABEL_8:
    v12 = *(_QWORD *)(v0 + 80);
    sub_23E5C4F58(*(_QWORD *)(v0 + 96), (uint64_t *)&unk_254336F90);
    v13 = sub_23E717A44();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
    goto LABEL_9;
  }
  v9 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 120);
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 32))(v8, *(_QWORD *)(v0 + 96), v10);
  sub_23E6FDB0C(v8, v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_23E711948()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_256D8D168;
  if (!qword_256D8D168)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D8D160);
    v2 = sub_23E7119AC();
    result = MEMORY[0x2426523B4](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256D8D168);
  }
  return result;
}

unint64_t sub_23E7119AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254336E40;
  if (!qword_254336E40)
  {
    v1 = sub_23E717A44();
    result = MEMORY[0x2426523B4](MEMORY[0x24BE4F2D0], v1);
    atomic_store(result, (unint64_t *)&qword_254336E40);
  }
  return result;
}

uint64_t sub_23E7119F4()
{
  sub_23E7141CC();
  return sub_23E718704();
}

uint64_t sub_23E711A2C()
{
  sub_23E714188();
  return sub_23E718704();
}

uint64_t sub_23E711A64()
{
  sub_23E714144();
  return sub_23E718704();
}

uint64_t sub_23E711A9C()
{
  sub_23E7152F8();
  return sub_23E718704();
}

void sub_23E711AD4()
{
  qword_256D93140 = (uint64_t)&unk_250EFEC08;
}

uint64_t sub_23E711AE8@<X0>(_QWORD *a1@<X8>)
{
  return sub_23E62C638(&qword_256D8A380, &qword_256D93140, a1);
}

void sub_23E711B04()
{
  qword_256D93148 = (uint64_t)&unk_250EFEC68;
}

uint64_t sub_23E711B18@<X0>(_QWORD *a1@<X8>)
{
  return sub_23E62C638(&qword_256D8A388, &qword_256D93148, a1);
}

void sub_23E711B34()
{
  qword_256D93150 = (uint64_t)&unk_250EFECA8;
}

uint64_t sub_23E711B48@<X0>(_QWORD *a1@<X8>)
{
  return sub_23E62C638(&qword_256D8A390, &qword_256D93150, a1);
}

void sub_23E711B64()
{
  qword_256D93158 = (uint64_t)&unk_250EFECE8;
}

uint64_t sub_23E711B78@<X0>(_QWORD *a1@<X8>)
{
  return sub_23E62C638(&qword_256D8A398, &qword_256D93158, a1);
}

uint64_t sub_23E711B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  _QWORD *v28;
  char *v29;
  uint64_t v31;

  v0 = sub_23E71883C();
  __swift_allocate_value_buffer(v0, qword_256D93160);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D93160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA68);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23E71DD10;
  v5 = v31 + v4;
  v6 = v31 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v31 + v4) = 1;
  *(_QWORD *)v6 = "utilityID";
  *(_QWORD *)(v6 + 8) = 9;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_23E718824();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 2;
  *(_QWORD *)v10 = "subscriptionID";
  *(_QWORD *)(v10 + 8) = 14;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 3;
  *(_QWORD *)v12 = "usagePointID";
  *((_QWORD *)v12 + 1) = 12;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 4;
  *(_QWORD *)v14 = "meterID";
  *((_QWORD *)v14 + 1) = 7;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 5;
  *(_QWORD *)v16 = "sourceTime";
  *((_QWORD *)v16 + 1) = 10;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 6;
  *(_QWORD *)v18 = "start";
  *((_QWORD *)v18 + 1) = 5;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 7;
  *(_QWORD *)v20 = "end";
  *((_QWORD *)v20 + 1) = 3;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 8;
  *(_QWORD *)v22 = "unit";
  *((_QWORD *)v22 + 1) = 4;
  v22[16] = 2;
  v9();
  v23 = v5 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + 8 * v3) = 9;
  *(_QWORD *)v23 = "commodity";
  *(_QWORD *)(v23 + 8) = 9;
  *(_BYTE *)(v23 + 16) = 2;
  v9();
  v24 = (_QWORD *)(v5 + 9 * v3);
  v25 = (char *)v24 + *(int *)(v1 + 48);
  *v24 = 10;
  *(_QWORD *)v25 = "flowDirection";
  *((_QWORD *)v25 + 1) = 13;
  v25[16] = 2;
  v9();
  v26 = (_QWORD *)(v5 + 10 * v3);
  v27 = (char *)v26 + *(int *)(v1 + 48);
  *v26 = 11;
  *(_QWORD *)v27 = "preprocessed";
  *((_QWORD *)v27 + 1) = 12;
  v27[16] = 2;
  v9();
  v28 = (_QWORD *)(v5 + 11 * v3);
  v29 = (char *)v28 + *(int *)(v1 + 48);
  *v28 = 12;
  *(_QWORD *)v29 = "readings";
  *((_QWORD *)v29 + 1) = 8;
  v29[16] = 2;
  v9();
  return sub_23E718830();
}

uint64_t sub_23E711EFC()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_23E718710();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          sub_23E718758();
          break;
        case 5:
          sub_23E712144();
          break;
        case 6:
          sub_23E7121D8();
          break;
        case 7:
          sub_23E71226C();
          break;
        case 8:
          sub_23E714144();
          goto LABEL_12;
        case 9:
          sub_23E714188();
          goto LABEL_12;
        case 10:
          sub_23E7141CC();
LABEL_12:
          sub_23E718734();
          break;
        case 11:
          sub_23E718728();
          break;
        case 12:
          type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
          sub_23E5C33C8(&qword_256D8CB60, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DE50);
          sub_23E718764();
          break;
        default:
          break;
      }
      result = sub_23E718710();
    }
  }
  return result;
}

uint64_t sub_23E712144()
{
  type metadata accessor for IntervalBlockClientPayload(0);
  sub_23E71868C();
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  return sub_23E718770();
}

uint64_t sub_23E7121D8()
{
  type metadata accessor for IntervalBlockClientPayload(0);
  sub_23E71868C();
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  return sub_23E718770();
}

uint64_t sub_23E71226C()
{
  type metadata accessor for IntervalBlockClientPayload(0);
  sub_23E71868C();
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  return sub_23E718770();
}

uint64_t sub_23E712300()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 8);
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *(_QWORD *)v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_23E718800(), !v1))
  {
    v5 = *(_QWORD *)(v0 + 24);
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = *(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_23E718800(), !v1))
    {
      v7 = *(_QWORD *)(v0 + 40);
      v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0)
        v8 = *(_QWORD *)(v0 + 32) & 0xFFFFFFFFFFFFLL;
      if (!v8 || (result = sub_23E718800(), !v1))
      {
        v9 = *(_QWORD *)(v0 + 56);
        v10 = HIBYTE(v9) & 0xF;
        if ((v9 & 0x2000000000000000) == 0)
          v10 = *(_QWORD *)(v0 + 48) & 0xFFFFFFFFFFFFLL;
        if (!v10 || (result = sub_23E718800(), !v1))
        {
          result = sub_23E712604(v0);
          if (!v1)
          {
            sub_23E712774(v0);
            sub_23E7128E4(v0);
            if (*(_QWORD *)(v0 + 64))
            {
              sub_23E714144();
              sub_23E7187DC();
            }
            if (*(_QWORD *)(v0 + 80))
            {
              sub_23E714188();
              sub_23E7187DC();
            }
            if (*(_QWORD *)(v0 + 96))
            {
              sub_23E7141CC();
              sub_23E7187DC();
            }
            if (*(_BYTE *)(v0 + 105) == 1)
              sub_23E7187D0();
            if (*(_QWORD *)(*(_QWORD *)(v0 + 112) + 16))
            {
              type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
              sub_23E5C33C8(&qword_256D8CB60, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DE50);
              sub_23E71880C();
            }
            type metadata accessor for IntervalBlockClientPayload(0);
            return sub_23E718698();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_23E712604(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E71868C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IntervalBlockClientPayload(0);
  sub_23E62ECF0(a1 + *(int *)(v9 + 56), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_23E5C4F58((uint64_t)v4, &qword_254338FD8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  sub_23E718818();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23E712774(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E71868C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IntervalBlockClientPayload(0);
  sub_23E62ECF0(a1 + *(int *)(v9 + 60), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_23E5C4F58((uint64_t)v4, &qword_254338FD8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  sub_23E718818();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23E7128E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E71868C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IntervalBlockClientPayload(0);
  sub_23E62ECF0(a1 + *(int *)(v9 + 64), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_23E5C4F58((uint64_t)v4, &qword_254338FD8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  sub_23E718818();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23E712A54@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0xE000000000000000;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0xE000000000000000;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0xE000000000000000;
  *(_QWORD *)(a2 + 64) = 0;
  *(_BYTE *)(a2 + 72) = 1;
  *(_QWORD *)(a2 + 80) = 0;
  *(_BYTE *)(a2 + 88) = 1;
  *(_WORD *)(a2 + 104) = 1;
  *(_QWORD *)(a2 + 112) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a2 + 96) = 0;
  sub_23E7186A4();
  v4 = a2 + a1[14];
  v5 = sub_23E71868C();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v7(v4, 1, 1, v5);
  v7(a2 + a1[15], 1, 1, v5);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7)(a2 + a1[16], 1, 1, v5);
}

unint64_t sub_23E712B38()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_23E712B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 52);
  v5 = sub_23E7186B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23E712B94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 52);
  v5 = sub_23E7186B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_23E712BD4())()
{
  return nullsub_1;
}

uint64_t sub_23E712BE8()
{
  return sub_23E711EFC();
}

uint64_t sub_23E712BFC()
{
  return sub_23E712300();
}

uint64_t sub_23E712C10()
{
  sub_23E5C33C8(&qword_256D8D1E8, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71DFF8);
  return sub_23E7186F8();
}

uint64_t sub_23E712C60@<X0>(uint64_t a1@<X8>)
{
  return sub_23E62D95C(&qword_256D8A3A0, (uint64_t)qword_256D93160, a1);
}

uint64_t sub_23E712C7C()
{
  sub_23E5C33C8(&qword_256D8D190, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71E030);
  return sub_23E7187AC();
}

uint64_t sub_23E712CBC()
{
  sub_23E5C33C8(&qword_256D8D190, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71E030);
  return sub_23E7187B8();
}

uint64_t sub_23E712D10()
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

  v0 = sub_23E71883C();
  __swift_allocate_value_buffer(v0, qword_256D93178);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D93178);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA68);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23E71B0D0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "FLOW_DIRECTION_UNSPECIFIED";
  *(_QWORD *)(v7 + 8) = 26;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23E718824();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "DELIVERED";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "REVERSE";
  *((_QWORD *)v13 + 1) = 7;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "NET";
  *((_QWORD *)v15 + 1) = 3;
  v15[16] = 2;
  v10();
  return sub_23E718830();
}

uint64_t sub_23E712EC8@<X0>(uint64_t a1@<X8>)
{
  return sub_23E62D95C(&qword_256D8A3A8, (uint64_t)qword_256D93178, a1);
}

uint64_t sub_23E712EE4()
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

  v0 = sub_23E71883C();
  __swift_allocate_value_buffer(v0, qword_256D93190);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D93190);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA68);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23E71A680;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "COMMODITY_UNSPECIFIED";
  *(_QWORD *)(v7 + 8) = 21;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23E718824();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "ELECTRIC";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  return sub_23E718830();
}

uint64_t sub_23E713034@<X0>(uint64_t a1@<X8>)
{
  return sub_23E62D95C(&qword_256D8A3B0, (uint64_t)qword_256D93190, a1);
}

uint64_t sub_23E713050()
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

  v0 = sub_23E71883C();
  __swift_allocate_value_buffer(v0, qword_256D931A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D931A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA68);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23E71A680;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "UNIT_UNSPECIFIED";
  *(_QWORD *)(v7 + 8) = 16;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23E718824();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "KWH";
  *((_QWORD *)v11 + 1) = 3;
  v11[16] = 2;
  v10();
  return sub_23E718830();
}

uint64_t sub_23E7131A0@<X0>(uint64_t a1@<X8>)
{
  return sub_23E62D95C(&qword_256D8A3B8, (uint64_t)qword_256D931A8, a1);
}

uint64_t sub_23E7131BC()
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

  v0 = sub_23E71883C();
  __swift_allocate_value_buffer(v0, qword_256D931C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D931C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA68);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23E71BC30;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "value";
  *(_QWORD *)(v7 + 8) = 5;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23E718824();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "qualities";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "start";
  *((_QWORD *)v13 + 1) = 5;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "end";
  *((_QWORD *)v15 + 1) = 3;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 5;
  *(_QWORD *)v17 = "tariffProfileID";
  *((_QWORD *)v17 + 1) = 15;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 6;
  *(_QWORD *)v19 = "rank";
  *((_QWORD *)v19 + 1) = 4;
  v19[16] = 2;
  v10();
  return sub_23E718830();
}

uint64_t sub_23E7133F0()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_23E718710();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          v4 = v3;
          sub_23E71874C();
          goto LABEL_5;
        case 2:
          sub_23E7152F8();
          v4 = v3;
          sub_23E71871C();
          goto LABEL_5;
        case 3:
          v4 = v3;
          sub_23E71354C();
          goto LABEL_5;
        case 4:
          v4 = v3;
          sub_23E7135E0();
          goto LABEL_5;
        case 5:
          v4 = v3;
          sub_23E718758();
          goto LABEL_5;
        case 6:
          v4 = v3;
          sub_23E718740();
LABEL_5:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_23E718710();
    }
  }
  return result;
}

uint64_t sub_23E71354C()
{
  type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
  sub_23E71868C();
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  return sub_23E718770();
}

uint64_t sub_23E7135E0()
{
  type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
  sub_23E71868C();
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  return sub_23E718770();
}

uint64_t sub_23E713674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  if (*(double *)v0 == 0.0 || (result = sub_23E7187F4(), !v1))
  {
    if (!*(_QWORD *)(*(_QWORD *)(v0 + 8) + 16) || (sub_23E7152F8(), result = sub_23E7187C4(), !v1))
    {
      result = sub_23E7137F4(v0);
      if (!v1)
      {
        sub_23E713964(v0);
        v3 = *(_QWORD *)(v0 + 24);
        v4 = HIBYTE(v3) & 0xF;
        if ((v3 & 0x2000000000000000) == 0)
          v4 = *(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
        if (v4)
          sub_23E718800();
        if (*(_DWORD *)(v0 + 32))
          sub_23E7187E8();
        type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
        return sub_23E718698();
      }
    }
  }
  return result;
}

uint64_t sub_23E7137F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E71868C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
  sub_23E62ECF0(a1 + *(int *)(v9 + 36), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_23E5C4F58((uint64_t)v4, &qword_254338FD8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  sub_23E718818();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23E713964(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23E71868C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
  sub_23E62ECF0(a1 + *(int *)(v9 + 40), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_23E5C4F58((uint64_t)v4, &qword_254338FD8);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_23E5C33C8(&qword_256D8BA60, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B980]);
  sub_23E718818();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23E713AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v4;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0xE000000000000000;
  *(_DWORD *)(a2 + 32) = -1;
  sub_23E7186A4();
  v5 = a2 + *(int *)(a1 + 36);
  v6 = sub_23E71868C();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v8(v5, 1, 1, v6);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a2 + *(int *)(a1 + 40), 1, 1, v6);
}

unint64_t sub_23E713B80()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_23E713B9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_23E7186B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_23E713BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 32);
  v5 = sub_23E7186B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_23E713C1C())()
{
  return nullsub_1;
}

uint64_t sub_23E713C30()
{
  return sub_23E7133F0();
}

uint64_t sub_23E713C44()
{
  return sub_23E713674();
}

uint64_t sub_23E713C58()
{
  sub_23E5C33C8(&qword_256D8D208, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DE18);
  return sub_23E7186F8();
}

uint64_t sub_23E713CA8@<X0>(uint64_t a1@<X8>)
{
  return sub_23E62D95C(&qword_256D8A3C0, (uint64_t)qword_256D931C0, a1);
}

uint64_t sub_23E713CC4()
{
  sub_23E5C33C8(&qword_256D8CB60, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DE50);
  return sub_23E7187AC();
}

uint64_t sub_23E713D04()
{
  sub_23E5C33C8(&qword_256D8CB60, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DE50);
  return sub_23E7187B8();
}

uint64_t sub_23E713D54()
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

  v0 = sub_23E71883C();
  __swift_allocate_value_buffer(v0, qword_256D931D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256D931D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA68);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_23E71B0D0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "QUALITY_UNSPECIFIED";
  *(_QWORD *)(v7 + 8) = 19;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_23E718824();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "ESTIMATED";
  *(_QWORD *)(v11 + 8) = 9;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "VALIDATED";
  *((_QWORD *)v13 + 1) = 9;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "RAW";
  *((_QWORD *)v15 + 1) = 3;
  v15[16] = 2;
  v10();
  return sub_23E718830();
}

uint64_t sub_23E713F10@<X0>(uint64_t a1@<X8>)
{
  return sub_23E62D95C(&qword_256D8A3C8, (uint64_t)qword_256D931D8, a1);
}

uint64_t sub_23E713F2C()
{
  return sub_23E5C33C8(&qword_256D8D170, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DD60);
}

uint64_t type metadata accessor for IntervalBlockClientPayload.IntervalReading(uint64_t a1)
{
  return sub_23E62EA9C(a1, qword_256D8D330);
}

uint64_t sub_23E713F6C()
{
  return sub_23E5C33C8(&qword_256D8CB60, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DE50);
}

uint64_t sub_23E713F98()
{
  return sub_23E5C33C8(&qword_256D8D178, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DD88);
}

uint64_t sub_23E713FC4()
{
  return sub_23E5C33C8(&qword_256D8D180, type metadata accessor for IntervalBlockClientPayload.IntervalReading, (uint64_t)&unk_23E71DDC8);
}

uint64_t sub_23E713FF0()
{
  return sub_23E5C33C8(&qword_256D8D188, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71DF40);
}

uint64_t type metadata accessor for IntervalBlockClientPayload(uint64_t a1)
{
  return sub_23E62EA9C(a1, qword_256D8D270);
}

uint64_t sub_23E714030()
{
  return sub_23E5C33C8(&qword_256D8D190, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71E030);
}

uint64_t sub_23E71405C()
{
  return sub_23E5C33C8(&qword_256D8D198, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71DF68);
}

uint64_t sub_23E714088()
{
  return sub_23E5C33C8(&qword_256D8D1A0, type metadata accessor for IntervalBlockClientPayload, (uint64_t)&unk_23E71DFA8);
}

uint64_t sub_23E7140B4()
{
  return sub_23E62EBE4(&qword_256D8D1A8, &qword_256D8D1B0);
}

uint64_t sub_23E7140D8()
{
  return sub_23E62EBE4(&qword_256D8D1B8, &qword_256D8D1C0);
}

uint64_t sub_23E7140FC()
{
  return sub_23E62EBE4(&qword_256D8D1C8, &qword_256D8D1D0);
}

uint64_t sub_23E714120()
{
  return sub_23E62EBE4(&qword_256D8D1D8, &qword_256D8D1E0);
}

unint64_t sub_23E714144()
{
  unint64_t result;

  result = qword_256D8D1F0;
  if (!qword_256D8D1F0)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E5A0, &type metadata for IntervalBlockClientPayload.Unit);
    atomic_store(result, (unint64_t *)&qword_256D8D1F0);
  }
  return result;
}

unint64_t sub_23E714188()
{
  unint64_t result;

  result = qword_256D8D1F8;
  if (!qword_256D8D1F8)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E558, &type metadata for IntervalBlockClientPayload.Commodity);
    atomic_store(result, (unint64_t *)&qword_256D8D1F8);
  }
  return result;
}

unint64_t sub_23E7141CC()
{
  unint64_t result;

  result = qword_256D8D200;
  if (!qword_256D8D200)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E510, &type metadata for IntervalBlockClientPayload.FlowDirection);
    atomic_store(result, (unint64_t *)&qword_256D8D200);
  }
  return result;
}

uint64_t sub_23E714210(uint64_t a1, uint64_t a2)
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
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  _BYTE *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  void (*v45)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v46;
  void (*v47)(_BYTE *, uint64_t);
  _BYTE *v48;
  int *v49;
  _BYTE *v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  void (*v59)(_BYTE *, uint64_t);
  int *v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  void (*v69)(_BYTE *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v80;
  uint64_t v81;
  _BYTE *v82;
  void (*v83)(_BYTE *, uint64_t);
  _BYTE v84[4];
  int v85;
  _BYTE *v86;
  unsigned int (*v87)(uint64_t, uint64_t, uint64_t);
  int *v88;
  _BYTE *v89;
  _BYTE *v90;
  _BYTE *v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  _BYTE *v95;
  _BYTE *v96;
  _BYTE *v97;
  _BYTE *v98;
  _BYTE *v99;
  _BYTE *v100;
  uint64_t v101;
  uint64_t v102;

  v4 = sub_23E7186B0();
  v92 = *(_QWORD *)(v4 - 8);
  v93 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v91 = &v84[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v90 = &v84[-v7];
  v8 = sub_23E71868C();
  v102 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v100 = &v84[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA78);
  v10 = MEMORY[0x24BDAC7A8](v101);
  v96 = &v84[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x24BDAC7A8](v10);
  v99 = &v84[-v13];
  MEMORY[0x24BDAC7A8](v12);
  v15 = &v84[-v14];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = &v84[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = MEMORY[0x24BDAC7A8](v17);
  v94 = &v84[-v21];
  v22 = MEMORY[0x24BDAC7A8](v20);
  v95 = &v84[-v23];
  v24 = MEMORY[0x24BDAC7A8](v22);
  v97 = &v84[-v25];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = &v84[-v27];
  v29 = MEMORY[0x24BDAC7A8](v26);
  v98 = &v84[-v30];
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = &v84[-v32];
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = &v84[-v35];
  MEMORY[0x24BDAC7A8](v34);
  v38 = &v84[-v37];
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v39 = 0, (sub_23E719208() & 1) != 0))
  {
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
      || (v39 = 0, (sub_23E719208() & 1) != 0))
    {
      if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32) && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40)
        || (v39 = 0, (sub_23E719208() & 1) != 0))
      {
        if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48) && *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56)
          || (v39 = 0, (sub_23E719208() & 1) != 0))
        {
          v89 = v28;
          v40 = type metadata accessor for IntervalBlockClientPayload(0);
          sub_23E62ECF0(a1 + *(int *)(v40 + 56), (uint64_t)v38);
          v88 = (int *)v40;
          sub_23E62ECF0(a2 + *(int *)(v40 + 56), (uint64_t)v36);
          v41 = (uint64_t)&v15[*(int *)(v101 + 48)];
          sub_23E62ECF0((uint64_t)v38, (uint64_t)v15);
          sub_23E62ECF0((uint64_t)v36, v41);
          v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v102 + 48);
          if (v42((uint64_t)v15, 1, v8) == 1)
          {
            sub_23E5C4F58((uint64_t)v36, &qword_254338FD8);
            sub_23E5C4F58((uint64_t)v38, &qword_254338FD8);
            if (v42(v41, 1, v8) == 1)
            {
              sub_23E5C4F58((uint64_t)v15, &qword_254338FD8);
              goto LABEL_20;
            }
          }
          else
          {
            sub_23E62ECF0((uint64_t)v15, (uint64_t)v33);
            v87 = v42;
            if (v42(v41, 1, v8) != 1)
            {
              v44 = v102;
              v45 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v102 + 32);
              v86 = v19;
              v46 = v100;
              v45(v100, v41, v8);
              sub_23E5C33C8(&qword_256D8BA88, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
              v85 = sub_23E718AAC();
              v47 = *(void (**)(_BYTE *, uint64_t))(v44 + 8);
              v48 = v46;
              v19 = v86;
              v47(v48, v8);
              sub_23E5C4F58((uint64_t)v36, &qword_254338FD8);
              sub_23E5C4F58((uint64_t)v38, &qword_254338FD8);
              v47(v33, v8);
              sub_23E5C4F58((uint64_t)v15, &qword_254338FD8);
              v42 = v87;
              if ((v85 & 1) == 0)
                goto LABEL_34;
LABEL_20:
              v49 = v88;
              v50 = v98;
              sub_23E62ECF0(a1 + v88[15], (uint64_t)v98);
              v51 = (uint64_t)v89;
              sub_23E62ECF0(a2 + v49[15], (uint64_t)v89);
              v52 = v99;
              v53 = (uint64_t)&v99[*(int *)(v101 + 48)];
              sub_23E62ECF0((uint64_t)v50, (uint64_t)v99);
              sub_23E62ECF0(v51, v53);
              if (v42((uint64_t)v52, 1, v8) == 1)
              {
                sub_23E5C4F58(v51, &qword_254338FD8);
                sub_23E5C4F58((uint64_t)v50, &qword_254338FD8);
                if (v42(v53, 1, v8) == 1)
                {
                  sub_23E5C4F58((uint64_t)v52, &qword_254338FD8);
LABEL_27:
                  v60 = v88;
                  v61 = v95;
                  sub_23E62ECF0(a1 + v88[16], (uint64_t)v95);
                  v62 = v94;
                  sub_23E62ECF0(a2 + v60[16], (uint64_t)v94);
                  v63 = v96;
                  v64 = (uint64_t)&v96[*(int *)(v101 + 48)];
                  sub_23E62ECF0((uint64_t)v61, (uint64_t)v96);
                  sub_23E62ECF0((uint64_t)v62, v64);
                  if (v42((uint64_t)v63, 1, v8) == 1)
                  {
                    sub_23E5C4F58((uint64_t)v62, &qword_254338FD8);
                    sub_23E5C4F58((uint64_t)v61, &qword_254338FD8);
                    if (v42(v64, 1, v8) == 1)
                    {
                      sub_23E5C4F58((uint64_t)v63, &qword_254338FD8);
LABEL_37:
                      v70 = *(_QWORD *)(a1 + 64);
                      v71 = *(_QWORD *)(a2 + 64);
                      if (*(_BYTE *)(a1 + 72))
                        v70 = v70 != 0;
                      if (*(_BYTE *)(a2 + 72) == 1)
                      {
                        if (v71)
                        {
                          if (v70 != 1)
                            goto LABEL_34;
                        }
                        else if (v70)
                        {
                          goto LABEL_34;
                        }
                      }
                      else if (v70 != v71)
                      {
                        goto LABEL_34;
                      }
                      v72 = *(_QWORD *)(a1 + 80);
                      v73 = *(_QWORD *)(a2 + 80);
                      if (*(_BYTE *)(a1 + 88))
                        v72 = v72 != 0;
                      if (*(_BYTE *)(a2 + 88) == 1)
                      {
                        if (v73)
                        {
                          if (v72 == 1)
                            goto LABEL_55;
                        }
                        else if (!v72)
                        {
                          goto LABEL_55;
                        }
                      }
                      else if (v72 == v73)
                      {
LABEL_55:
                        v74 = *(_QWORD *)(a2 + 96);
                        if (*(_BYTE *)(a2 + 104) == 1)
                          __asm { BR              X11 }
                        if (*(_QWORD *)(a1 + 96) == v74
                          && *(unsigned __int8 *)(a1 + 105) == *(unsigned __int8 *)(a2 + 105)
                          && (sub_23E62ED38(*(_QWORD *)(a1 + 112), *(_QWORD *)(a2 + 112)) & 1) != 0)
                        {
                          v75 = v88;
                          v76 = a1 + v88[13];
                          v78 = v92;
                          v77 = v93;
                          v79 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v92 + 16);
                          v80 = v90;
                          v79(v90, v76, v93);
                          v81 = a2 + v75[13];
                          v82 = v91;
                          v79(v91, v81, v77);
                          sub_23E5C33C8(&qword_256D8BA80, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
                          v39 = sub_23E718AAC();
                          v83 = *(void (**)(_BYTE *, uint64_t))(v78 + 8);
                          v83(v82, v77);
                          v83(v80, v77);
                          return v39 & 1;
                        }
                      }
LABEL_34:
                      v39 = 0;
                      return v39 & 1;
                    }
                  }
                  else
                  {
                    sub_23E62ECF0((uint64_t)v63, (uint64_t)v19);
                    if (v42(v64, 1, v8) != 1)
                    {
                      v66 = v102;
                      v67 = v100;
                      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v102 + 32))(v100, v64, v8);
                      sub_23E5C33C8(&qword_256D8BA88, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
                      LODWORD(v101) = sub_23E718AAC();
                      v68 = (uint64_t)v62;
                      v69 = *(void (**)(_BYTE *, uint64_t))(v66 + 8);
                      v69(v67, v8);
                      sub_23E5C4F58(v68, &qword_254338FD8);
                      sub_23E5C4F58((uint64_t)v61, &qword_254338FD8);
                      v69(v19, v8);
                      sub_23E5C4F58((uint64_t)v63, &qword_254338FD8);
                      if ((v101 & 1) == 0)
                        goto LABEL_34;
                      goto LABEL_37;
                    }
                    sub_23E5C4F58((uint64_t)v62, &qword_254338FD8);
                    sub_23E5C4F58((uint64_t)v61, &qword_254338FD8);
                    (*(void (**)(_BYTE *, uint64_t))(v102 + 8))(v19, v8);
                  }
                  v43 = (uint64_t)v63;
LABEL_33:
                  sub_23E5C4F58(v43, &qword_256D8BA78);
                  goto LABEL_34;
                }
              }
              else
              {
                v54 = v97;
                sub_23E62ECF0((uint64_t)v52, (uint64_t)v97);
                v87 = v42;
                if (v42(v53, 1, v8) != 1)
                {
                  v55 = v102;
                  v56 = (uint64_t)v50;
                  v57 = v100;
                  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v102 + 32))(v100, v53, v8);
                  sub_23E5C33C8(&qword_256D8BA88, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
                  LODWORD(v86) = sub_23E718AAC();
                  v58 = (uint64_t)v52;
                  v59 = *(void (**)(_BYTE *, uint64_t))(v55 + 8);
                  v59(v57, v8);
                  sub_23E5C4F58((uint64_t)v89, &qword_254338FD8);
                  sub_23E5C4F58(v56, &qword_254338FD8);
                  v59(v54, v8);
                  sub_23E5C4F58(v58, &qword_254338FD8);
                  v42 = v87;
                  if ((v86 & 1) == 0)
                    goto LABEL_34;
                  goto LABEL_27;
                }
                sub_23E5C4F58((uint64_t)v89, &qword_254338FD8);
                sub_23E5C4F58((uint64_t)v50, &qword_254338FD8);
                (*(void (**)(_BYTE *, uint64_t))(v102 + 8))(v54, v8);
              }
              v43 = (uint64_t)v52;
              goto LABEL_33;
            }
            sub_23E5C4F58((uint64_t)v36, &qword_254338FD8);
            sub_23E5C4F58((uint64_t)v38, &qword_254338FD8);
            (*(void (**)(_BYTE *, uint64_t))(v102 + 8))(v33, v8);
          }
          v43 = (uint64_t)v15;
          goto LABEL_33;
        }
      }
    }
  }
  return v39 & 1;
}

uint64_t sub_23E714C60(uint64_t a1, uint64_t a2)
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
  _BYTE *v15;
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
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  void (*v39)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v40;
  void (*v41)(_BYTE *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(uint64_t, uint64_t, uint64_t);
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  _BYTE *v51;
  char v52;
  void (*v53)(_BYTE *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  void (*v58)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  void (*v63)(_BYTE *, uint64_t);
  _BYTE v64[12];
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE *v73;
  _BYTE *v74;
  uint64_t v75;
  _BYTE *v76;
  _BYTE *v77;

  v4 = sub_23E7186B0();
  v75 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v74 = &v64[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v73 = &v64[-v7];
  v8 = sub_23E71868C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v76 = &v64[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D8BA78);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v77 = &v64[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v15 = &v64[-v14];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = &v64[-v21];
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = &v64[-v24];
  MEMORY[0x24BDAC7A8](v23);
  v29 = a2;
  v31 = &v64[-v30];
  if (*(double *)a1 != *(double *)v29)
    goto LABEL_17;
  v71 = v28;
  v72 = v27;
  v70 = v26;
  if ((sub_23E632550(*(_QWORD *)(a1 + 8), *(_QWORD *)(v29 + 8)) & 1) == 0)
    goto LABEL_17;
  v66 = v4;
  v32 = type metadata accessor for IntervalBlockClientPayload.IntervalReading(0);
  v33 = *(int *)(v32 + 36);
  v68 = a1;
  sub_23E62ECF0(a1 + v33, (uint64_t)v31);
  v67 = v32;
  v34 = *(int *)(v32 + 36);
  v69 = v29;
  sub_23E62ECF0(v29 + v34, (uint64_t)v25);
  v35 = (uint64_t)&v15[*(int *)(v11 + 48)];
  sub_23E62ECF0((uint64_t)v31, (uint64_t)v15);
  sub_23E62ECF0((uint64_t)v25, v35);
  v36 = v9;
  v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v37((uint64_t)v15, 1, v8) == 1)
  {
    sub_23E5C4F58((uint64_t)v25, &qword_254338FD8);
    sub_23E5C4F58((uint64_t)v31, &qword_254338FD8);
    if (v37(v35, 1, v8) == 1)
    {
      sub_23E5C4F58((uint64_t)v15, &qword_254338FD8);
      goto LABEL_10;
    }
LABEL_8:
    v38 = (uint64_t)v15;
LABEL_16:
    sub_23E5C4F58(v38, &qword_256D8BA78);
    goto LABEL_17;
  }
  sub_23E62ECF0((uint64_t)v15, (uint64_t)v22);
  if (v37(v35, 1, v8) == 1)
  {
    sub_23E5C4F58((uint64_t)v25, &qword_254338FD8);
    sub_23E5C4F58((uint64_t)v31, &qword_254338FD8);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v22, v8);
    goto LABEL_8;
  }
  v39 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 32);
  v40 = v76;
  v39(v76, v35, v8);
  sub_23E5C33C8(&qword_256D8BA88, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
  v65 = sub_23E718AAC();
  v41 = *(void (**)(_BYTE *, uint64_t))(v36 + 8);
  v41(v40, v8);
  sub_23E5C4F58((uint64_t)v25, &qword_254338FD8);
  sub_23E5C4F58((uint64_t)v31, &qword_254338FD8);
  v41(v22, v8);
  sub_23E5C4F58((uint64_t)v15, &qword_254338FD8);
  if ((v65 & 1) == 0)
  {
LABEL_17:
    v49 = 0;
    return v49 & 1;
  }
LABEL_10:
  v42 = v67;
  v43 = v72;
  sub_23E62ECF0(v68 + *(int *)(v67 + 40), v72);
  v44 = v71;
  sub_23E62ECF0(v69 + *(int *)(v42 + 40), v71);
  v45 = v37;
  v46 = v77;
  v47 = (uint64_t)&v77[*(int *)(v11 + 48)];
  sub_23E62ECF0(v43, (uint64_t)v77);
  sub_23E62ECF0(v44, v47);
  if (v45((uint64_t)v46, 1, v8) == 1)
  {
    sub_23E5C4F58(v44, &qword_254338FD8);
    sub_23E5C4F58(v43, &qword_254338FD8);
    if (v45(v47, 1, v8) == 1)
    {
      sub_23E5C4F58((uint64_t)v46, &qword_254338FD8);
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  v48 = v70;
  sub_23E62ECF0((uint64_t)v46, v70);
  if (v45(v47, 1, v8) == 1)
  {
    sub_23E5C4F58(v71, &qword_254338FD8);
    sub_23E5C4F58(v72, &qword_254338FD8);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v48, v8);
LABEL_15:
    v38 = (uint64_t)v46;
    goto LABEL_16;
  }
  v51 = v76;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v36 + 32))(v76, v47, v8);
  sub_23E5C33C8(&qword_256D8BA88, (uint64_t (*)(uint64_t))MEMORY[0x24BE5B990], MEMORY[0x24BE5B9A0]);
  v52 = sub_23E718AAC();
  v53 = *(void (**)(_BYTE *, uint64_t))(v36 + 8);
  v53(v51, v8);
  sub_23E5C4F58(v71, &qword_254338FD8);
  sub_23E5C4F58(v72, &qword_254338FD8);
  v53((_BYTE *)v48, v8);
  sub_23E5C4F58((uint64_t)v46, &qword_254338FD8);
  if ((v52 & 1) == 0)
    goto LABEL_17;
LABEL_20:
  v55 = v68;
  v54 = v69;
  if (*(_QWORD *)(v68 + 16) == *(_QWORD *)(v69 + 16) && *(_QWORD *)(v68 + 24) == *(_QWORD *)(v69 + 24)
    || (v56 = sub_23E719208(), v55 = v68, v54 = v69, v49 = 0, (v56 & 1) != 0))
  {
    if (*(_DWORD *)(v55 + 32) == *(_DWORD *)(v54 + 32))
    {
      v57 = v75;
      v58 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v75 + 16);
      v59 = v73;
      v60 = v66;
      v61 = v54;
      v58(v73, v55 + *(int *)(v42 + 32), v66);
      v62 = v74;
      v58(v74, v61 + *(int *)(v42 + 32), v60);
      sub_23E5C33C8(&qword_256D8BA80, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v49 = sub_23E718AAC();
      v63 = *(void (**)(_BYTE *, uint64_t))(v57 + 8);
      v63(v62, v60);
      v63(v59, v60);
      return v49 & 1;
    }
    goto LABEL_17;
  }
  return v49 & 1;
}

unint64_t sub_23E7152F8()
{
  unint64_t result;

  result = qword_256D8D210;
  if (!qword_256D8D210)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E4C8, &type metadata for IntervalBlockClientPayload.IntervalReading.Quality);
    atomic_store(result, (unint64_t *)&qword_256D8D210);
  }
  return result;
}

_QWORD *sub_23E71533C(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    v10 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v10;
    v11 = a2[8];
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    *(_QWORD *)(a1 + 64) = v11;
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_WORD *)(a1 + 104) = *((_WORD *)a2 + 52);
    v12 = a3[13];
    v32 = (uint64_t)a2 + v12;
    v33 = a1 + v12;
    *(_QWORD *)(a1 + 112) = a2[14];
    v13 = sub_23E7186B0();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v33, v32, v13);
    v15 = a3[14];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_23E71868C();
    v19 = *(_QWORD *)(v18 - 8);
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
    if (v20(v17, 1, v18))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    v23 = a3[15];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    if (v20((char *)a2 + v23, 1, v18))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v24, v25, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v24, 0, 1, v18);
    }
    v27 = a3[16];
    v28 = (char *)v4 + v27;
    v29 = (char *)a2 + v27;
    if (v20(v29, 1, v18))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v28, v29, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v28, 0, 1, v18);
    }
  }
  return v4;
}

uint64_t sub_23E7155CC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[13];
  v5 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[14];
  v7 = sub_23E71868C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v10 = a1 + a2[15];
  if (!v9(v10, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  v11 = a1 + a2[16];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v11, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  return result;
}

uint64_t sub_23E7156F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(const void *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v30;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  v10 = a3[13];
  v30 = a1 + v10;
  v11 = a2 + v10;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v12 = sub_23E7186B0();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v30, v11, v12);
  v14 = a3[14];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_23E71868C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = a3[15];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v22, v23, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  v25 = a3[16];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  if (v19(v27, 1, v17))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 16))(v26, v27, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v26, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_23E715958(uint64_t a1, uint64_t a2, int *a3)
{
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
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v7;
  v8 = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v8;
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a3[13];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[14];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_23E71868C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v14, v15, v16);
LABEL_7:
  v22 = a3[15];
  v23 = (void *)(a1 + v22);
  v24 = (void *)(a2 + v22);
  v25 = v18((void *)(a1 + v22), 1, v16);
  v26 = v18(v24, 1, v16);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v23, v24, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v23, 0, 1, v16);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v23, v16);
LABEL_12:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v23, v24, v16);
LABEL_13:
  v28 = a3[16];
  v29 = (void *)(a1 + v28);
  v30 = (void *)(a2 + v28);
  v31 = v18((void *)(a1 + v28), 1, v16);
  v32 = v18(v30, 1, v16);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v29, v30, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v29, v16);
    goto LABEL_18;
  }
  if (v32)
  {
LABEL_18:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v29, v30, v16);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v29, 0, 1, v16);
  return a1;
}

uint64_t sub_23E715CCC(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(const void *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 32);
  v8 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v9 = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v9;
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v10 = a3[13];
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  v13 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = a3[14];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_23E71868C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v21 = a3[15];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v22, v23, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  v25 = a3[16];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  if (v19(v27, 1, v17))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v26, v27, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v26, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_23E715EEC(uint64_t a1, uint64_t a2, int *a3)
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
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  uint64_t v34;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  v10 = a3[13];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[14];
  v15 = (void *)(a1 + v14);
  v16 = (void *)(a2 + v14);
  v17 = sub_23E71868C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_7:
  v23 = a3[15];
  v24 = (void *)(a1 + v23);
  v25 = (void *)(a2 + v23);
  v26 = v19((void *)(a1 + v23), 1, v17);
  v27 = v19(v25, 1, v17);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v24, v25, v17);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v24, v17);
LABEL_12:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v24, v25, v17);
LABEL_13:
  v29 = a3[16];
  v30 = (void *)(a1 + v29);
  v31 = (void *)(a2 + v29);
  v32 = v19((void *)(a1 + v29), 1, v17);
  v33 = v19(v31, 1, v17);
  if (!v32)
  {
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v30, v31, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v30, v17);
    goto LABEL_18;
  }
  if (v33)
  {
LABEL_18:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v30, v31, v17);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v30, 0, 1, v17);
  return a1;
}

uint64_t sub_23E716218()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E716224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23E7186B0();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 52);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 56);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_23E7162C8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E7162D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_23E7186B0();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 52);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 56);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_23E716374()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E7186B0();
  if (v0 <= 0x3F)
  {
    sub_23E631518();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for IntervalBlockClientPayload.FlowDirection()
{
  return &type metadata for IntervalBlockClientPayload.FlowDirection;
}

ValueMetadata *type metadata accessor for IntervalBlockClientPayload.Commodity()
{
  return &type metadata for IntervalBlockClientPayload.Commodity;
}

ValueMetadata *type metadata accessor for IntervalBlockClientPayload.Unit()
{
  return &type metadata for IntervalBlockClientPayload.Unit;
}

_QWORD *sub_23E716464(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = a3[8];
    v10 = a1 + v9;
    v11 = (uint64_t)a2 + v9;
    *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 + 8);
    v12 = sub_23E7186B0();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = a3[9];
    v15 = (char *)v4 + v14;
    v16 = (char *)a2 + v14;
    v17 = sub_23E71868C();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    if (v19(v16, 1, v17))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    v22 = a3[10];
    v23 = (char *)v4 + v22;
    v24 = (char *)a2 + v22;
    if (v19(v24, 1, v17))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v24, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v23, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t sub_23E716624(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[8];
  v5 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[9];
  v7 = sub_23E71868C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v10 = a1 + a2[10];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(v10, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  return result;
}

uint64_t sub_23E716704(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v8 = a3[8];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23E7186B0();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[9];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_23E71868C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  if (v18(v15, 1, v16))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v20 = a3[10];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  if (v18(v22, 1, v16))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v21, v22, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_23E716898(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v6 = a3[8];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[9];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = sub_23E71868C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  v19 = a3[10];
  v20 = (void *)(a1 + v19);
  v21 = (void *)(a2 + v19);
  v22 = v15((void *)(a1 + v19), 1, v13);
  v23 = v15(v21, 1, v13);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v20, v21, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v20, v13);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v20, v21, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
  return a1;
}

uint64_t sub_23E716AD0(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(const void *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v7 = a3[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[9];
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = sub_23E71868C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  if (v16(v13, 1, v14))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v18 = a3[10];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v16(v20, 1, v14))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v19, v20, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v19, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_23E716C40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  v7 = a3[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23E7186B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[9];
  v12 = (void *)(a1 + v11);
  v13 = (void *)(a2 + v11);
  v14 = sub_23E71868C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v12, v13, v14);
LABEL_7:
  v20 = a3[10];
  v21 = (void *)(a1 + v20);
  v22 = (void *)(a2 + v20);
  v23 = v16((void *)(a1 + v20), 1, v14);
  v24 = v16(v22, 1, v14);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 40))(v21, v22, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v21, v14);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 32))(v21, v22, v14);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v21, 0, 1, v14);
  return a1;
}

uint64_t sub_23E716E60()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E716E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23E7186B0();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 32);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 36);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_23E716F10()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E716F1C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_23E7186B0();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 32);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254338FD8);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 36);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_23E716FBC()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E7186B0();
  if (v0 <= 0x3F)
  {
    sub_23E631518();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for IntervalBlockClientPayload.IntervalReading.Quality()
{
  return &type metadata for IntervalBlockClientPayload.IntervalReading.Quality;
}

unint64_t sub_23E717088()
{
  unint64_t result;

  result = qword_256D8D380;
  if (!qword_256D8D380)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E248, &type metadata for IntervalBlockClientPayload.IntervalReading.Quality);
    atomic_store(result, (unint64_t *)&qword_256D8D380);
  }
  return result;
}

unint64_t sub_23E7170D0()
{
  unint64_t result;

  result = qword_256D8D388;
  if (!qword_256D8D388)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E2E8, &type metadata for IntervalBlockClientPayload.Unit);
    atomic_store(result, (unint64_t *)&qword_256D8D388);
  }
  return result;
}

unint64_t sub_23E717118()
{
  unint64_t result;

  result = qword_256D8D390;
  if (!qword_256D8D390)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E388, &type metadata for IntervalBlockClientPayload.Commodity);
    atomic_store(result, (unint64_t *)&qword_256D8D390);
  }
  return result;
}

unint64_t sub_23E717160()
{
  unint64_t result;

  result = qword_256D8D398;
  if (!qword_256D8D398)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E428, &type metadata for IntervalBlockClientPayload.FlowDirection);
    atomic_store(result, (unint64_t *)&qword_256D8D398);
  }
  return result;
}

unint64_t sub_23E7171A8()
{
  unint64_t result;

  result = qword_256D8D3A0;
  if (!qword_256D8D3A0)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E270, &type metadata for IntervalBlockClientPayload.IntervalReading.Quality);
    atomic_store(result, (unint64_t *)&qword_256D8D3A0);
  }
  return result;
}

unint64_t sub_23E7171F0()
{
  unint64_t result;

  result = qword_256D8D3A8;
  if (!qword_256D8D3A8)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E2B0, &type metadata for IntervalBlockClientPayload.IntervalReading.Quality);
    atomic_store(result, (unint64_t *)&qword_256D8D3A8);
  }
  return result;
}

unint64_t sub_23E717238()
{
  unint64_t result;

  result = qword_256D8D3B0;
  if (!qword_256D8D3B0)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E450, &type metadata for IntervalBlockClientPayload.FlowDirection);
    atomic_store(result, (unint64_t *)&qword_256D8D3B0);
  }
  return result;
}

unint64_t sub_23E717280()
{
  unint64_t result;

  result = qword_256D8D3B8;
  if (!qword_256D8D3B8)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E490, &type metadata for IntervalBlockClientPayload.FlowDirection);
    atomic_store(result, (unint64_t *)&qword_256D8D3B8);
  }
  return result;
}

unint64_t sub_23E7172C8()
{
  unint64_t result;

  result = qword_256D8D3C0;
  if (!qword_256D8D3C0)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E3B0, &type metadata for IntervalBlockClientPayload.Commodity);
    atomic_store(result, (unint64_t *)&qword_256D8D3C0);
  }
  return result;
}

unint64_t sub_23E717310()
{
  unint64_t result;

  result = qword_256D8D3C8;
  if (!qword_256D8D3C8)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E3F0, &type metadata for IntervalBlockClientPayload.Commodity);
    atomic_store(result, (unint64_t *)&qword_256D8D3C8);
  }
  return result;
}

unint64_t sub_23E717358()
{
  unint64_t result;

  result = qword_256D8D3D0;
  if (!qword_256D8D3D0)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E310, &type metadata for IntervalBlockClientPayload.Unit);
    atomic_store(result, (unint64_t *)&qword_256D8D3D0);
  }
  return result;
}

unint64_t sub_23E7173A0()
{
  unint64_t result;

  result = qword_256D8D3D8;
  if (!qword_256D8D3D8)
  {
    result = MEMORY[0x2426523B4](&unk_23E71E350, &type metadata for IntervalBlockClientPayload.Unit);
    atomic_store(result, (unint64_t *)&qword_256D8D3D8);
  }
  return result;
}

uint64_t sub_23E7173E4()
{
  return MEMORY[0x24BDCB128]();
}

uint64_t sub_23E7173F0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23E7173FC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23E717408()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23E717414()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_23E717420()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_23E71742C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_23E717438()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23E717444()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_23E717450()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23E71745C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23E717468()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_23E717474()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23E717480()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_23E71748C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23E717498()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23E7174A4()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23E7174B0()
{
  return MEMORY[0x24BDCBC48]();
}

uint64_t sub_23E7174BC()
{
  return MEMORY[0x24BDCBC60]();
}

uint64_t sub_23E7174C8()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_23E7174D4()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_23E7174E0()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_23E7174EC()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_23E7174F8()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_23E717504()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_23E717510()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_23E71751C()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_23E717528()
{
  return MEMORY[0x24BDCC7A0]();
}

uint64_t sub_23E717534()
{
  return MEMORY[0x24BDCC808]();
}

uint64_t sub_23E717540()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23E71754C()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_23E717558()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_23E717564()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_23E717570()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_23E71757C()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_23E717588()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_23E717594()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_23E7175A0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23E7175AC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23E7175B8()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_23E7175C4()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_23E7175D0()
{
  return MEMORY[0x24BDCD8A0]();
}

uint64_t sub_23E7175DC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23E7175E8()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_23E7175F4()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_23E717600()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23E71760C()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_23E717618()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23E717624()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_23E717630()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23E71763C()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_23E717648()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23E717654()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_23E717660()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_23E71766C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23E717678()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_23E717684()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_23E717690()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23E71769C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23E7176A8()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_23E7176B4()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_23E7176C0()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_23E7176CC()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_23E7176D8()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_23E7176E4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_23E7176F0()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_23E7176FC()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_23E717708()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_23E717714()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_23E717720()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_23E71772C()
{
  return MEMORY[0x24BDCE418]();
}

uint64_t sub_23E717738()
{
  return MEMORY[0x24BDCE420]();
}

uint64_t sub_23E717744()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_23E717750()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23E71775C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23E717768()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23E717774()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23E717780()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_23E71778C()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_23E717798()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_23E7177A4()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_23E7177B0()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_23E7177BC()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23E7177C8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23E7177D4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23E7177E0()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_23E7177EC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23E7177F8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23E717804()
{
  return MEMORY[0x24BE2EBC0]();
}

uint64_t sub_23E717810()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23E71781C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23E717828()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23E717834()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23E717840()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23E71784C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23E717858()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_23E717864()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_23E717870()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_23E71787C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_23E717888()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_23E717894()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_23E7178A0()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_23E7178AC()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_23E7178B8()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_23E7178C4()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_23E7178D0()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_23E7178DC()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_23E7178E8()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_23E7178F4()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23E717900()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_23E71790C()
{
  return MEMORY[0x24BDCF1C0]();
}

uint64_t sub_23E717918()
{
  return MEMORY[0x24BDCF1C8]();
}

uint64_t sub_23E717924()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_23E717930()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23E71793C()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_23E717948()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23E717954()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_23E717960()
{
  return MEMORY[0x24BDCF4A0]();
}

uint64_t sub_23E71796C()
{
  return MEMORY[0x24BDCF4B0]();
}

uint64_t sub_23E717978()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_23E717984()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_23E717990()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_23E71799C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23E7179A8()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_23E7179B4()
{
  return MEMORY[0x24BE4F1F0]();
}

uint64_t sub_23E7179C0()
{
  return MEMORY[0x24BE4F200]();
}

uint64_t sub_23E7179CC()
{
  return MEMORY[0x24BE4F210]();
}

uint64_t sub_23E7179D8()
{
  return MEMORY[0x24BE4F228]();
}

uint64_t sub_23E7179E4()
{
  return MEMORY[0x24BE4F230]();
}

uint64_t sub_23E7179F0()
{
  return MEMORY[0x24BE4F238]();
}

uint64_t sub_23E7179FC()
{
  return MEMORY[0x24BE4F240]();
}

uint64_t sub_23E717A08()
{
  return MEMORY[0x24BE4F288]();
}

uint64_t sub_23E717A14()
{
  return MEMORY[0x24BE4F290]();
}

uint64_t sub_23E717A20()
{
  return MEMORY[0x24BE4F298]();
}

uint64_t sub_23E717A2C()
{
  return MEMORY[0x24BE4F2A0]();
}

uint64_t sub_23E717A38()
{
  return MEMORY[0x24BE4F2A8]();
}

uint64_t sub_23E717A44()
{
  return MEMORY[0x24BE4F2B0]();
}

uint64_t sub_23E717A50()
{
  return MEMORY[0x24BE4F2E0]();
}

uint64_t sub_23E717A5C()
{
  return MEMORY[0x24BE4F2E8]();
}

uint64_t sub_23E717A68()
{
  return MEMORY[0x24BE4F300]();
}

uint64_t sub_23E717A74()
{
  return MEMORY[0x24BE2EBC8]();
}

uint64_t sub_23E717A80()
{
  return MEMORY[0x24BE2EBD0]();
}

uint64_t sub_23E717A8C()
{
  return MEMORY[0x24BE2EBD8]();
}

uint64_t sub_23E717A98()
{
  return MEMORY[0x24BE2EBE0]();
}

uint64_t sub_23E717AA4()
{
  return MEMORY[0x24BE2EBE8]();
}

uint64_t sub_23E717AB0()
{
  return MEMORY[0x24BE2EBF0]();
}

uint64_t sub_23E717ABC()
{
  return MEMORY[0x24BE2EBF8]();
}

uint64_t sub_23E717AC8()
{
  return MEMORY[0x24BE2EC00]();
}

uint64_t sub_23E717AD4()
{
  return MEMORY[0x24BE2EC08]();
}

uint64_t sub_23E717AE0()
{
  return MEMORY[0x24BE2EC10]();
}

uint64_t sub_23E717AEC()
{
  return MEMORY[0x24BE2EC18]();
}

uint64_t sub_23E717AF8()
{
  return MEMORY[0x24BE2EC20]();
}

uint64_t sub_23E717B04()
{
  return MEMORY[0x24BE2EC28]();
}

uint64_t sub_23E717B10()
{
  return MEMORY[0x24BE2EC30]();
}

uint64_t sub_23E717B1C()
{
  return MEMORY[0x24BE2EC38]();
}

uint64_t sub_23E717B28()
{
  return MEMORY[0x24BE2EC40]();
}

uint64_t sub_23E717B34()
{
  return MEMORY[0x24BE2EC48]();
}

uint64_t sub_23E717B40()
{
  return MEMORY[0x24BE2EC50]();
}

uint64_t sub_23E717B4C()
{
  return MEMORY[0x24BE2EC58]();
}

uint64_t sub_23E717B58()
{
  return MEMORY[0x24BE2EC60]();
}

uint64_t sub_23E717B64()
{
  return MEMORY[0x24BE2EC70]();
}

uint64_t sub_23E717B70()
{
  return MEMORY[0x24BE2EC78]();
}

uint64_t sub_23E717B7C()
{
  return MEMORY[0x24BE2EC80]();
}

uint64_t sub_23E717B88()
{
  return MEMORY[0x24BE2EC90]();
}

uint64_t sub_23E717B94()
{
  return MEMORY[0x24BE2EC98]();
}

uint64_t sub_23E717BA0()
{
  return MEMORY[0x24BE2ECA0]();
}

uint64_t sub_23E717BAC()
{
  return MEMORY[0x24BE2ECB0]();
}

uint64_t sub_23E717BB8()
{
  return MEMORY[0x24BE2ECB8]();
}

uint64_t sub_23E717BC4()
{
  return MEMORY[0x24BE2ECD0]();
}

uint64_t sub_23E717BD0()
{
  return MEMORY[0x24BE2ECD8]();
}

uint64_t sub_23E717BDC()
{
  return MEMORY[0x24BE2ECE0]();
}

uint64_t sub_23E717BE8()
{
  return MEMORY[0x24BE2ECE8]();
}

uint64_t sub_23E717BF4()
{
  return MEMORY[0x24BE2ECF0]();
}

uint64_t sub_23E717C00()
{
  return MEMORY[0x24BE2ECF8]();
}

uint64_t sub_23E717C0C()
{
  return MEMORY[0x24BE2ED00]();
}

uint64_t sub_23E717C18()
{
  return MEMORY[0x24BE2ED08]();
}

uint64_t sub_23E717C24()
{
  return MEMORY[0x24BE2ED10]();
}

uint64_t sub_23E717C30()
{
  return MEMORY[0x24BE2ED18]();
}

uint64_t sub_23E717C3C()
{
  return MEMORY[0x24BE2ED20]();
}

uint64_t sub_23E717C48()
{
  return MEMORY[0x24BE2ED28]();
}

uint64_t sub_23E717C54()
{
  return MEMORY[0x24BE2ED30]();
}

uint64_t sub_23E717C60()
{
  return MEMORY[0x24BE2ED38]();
}

uint64_t sub_23E717C6C()
{
  return MEMORY[0x24BE2ED40]();
}

uint64_t sub_23E717C78()
{
  return MEMORY[0x24BE2ED50]();
}

uint64_t sub_23E717C84()
{
  return MEMORY[0x24BE2ED58]();
}

uint64_t sub_23E717C90()
{
  return MEMORY[0x24BE2ED60]();
}

uint64_t sub_23E717C9C()
{
  return MEMORY[0x24BE2ED68]();
}

uint64_t sub_23E717CA8()
{
  return MEMORY[0x24BE2ED70]();
}

uint64_t sub_23E717CB4()
{
  return MEMORY[0x24BE2ED78]();
}

uint64_t sub_23E717CC0()
{
  return MEMORY[0x24BE2ED80]();
}

uint64_t sub_23E717CCC()
{
  return MEMORY[0x24BE2ED88]();
}

uint64_t sub_23E717CD8()
{
  return MEMORY[0x24BE2ED90]();
}

uint64_t sub_23E717CE4()
{
  return MEMORY[0x24BE2ED98]();
}

uint64_t sub_23E717CF0()
{
  return MEMORY[0x24BE2EDA0]();
}

uint64_t sub_23E717CFC()
{
  return MEMORY[0x24BE2EDA8]();
}

uint64_t sub_23E717D08()
{
  return MEMORY[0x24BE2EDB0]();
}

uint64_t sub_23E717D14()
{
  return MEMORY[0x24BE2EDB8]();
}

uint64_t sub_23E717D20()
{
  return MEMORY[0x24BE2EDC0]();
}

uint64_t sub_23E717D2C()
{
  return MEMORY[0x24BE2EDC8]();
}

uint64_t sub_23E717D38()
{
  return MEMORY[0x24BE2EDD0]();
}

uint64_t sub_23E717D44()
{
  return MEMORY[0x24BE2EDD8]();
}

uint64_t sub_23E717D50()
{
  return MEMORY[0x24BE2EDE0]();
}

uint64_t sub_23E717D5C()
{
  return MEMORY[0x24BE2EDE8]();
}

uint64_t sub_23E717D68()
{
  return MEMORY[0x24BE2EDF0]();
}

uint64_t sub_23E717D74()
{
  return MEMORY[0x24BE2EDF8]();
}

uint64_t sub_23E717D80()
{
  return MEMORY[0x24BE2EE00]();
}

uint64_t sub_23E717D8C()
{
  return MEMORY[0x24BE2EE08]();
}

uint64_t sub_23E717D98()
{
  return MEMORY[0x24BE2EE10]();
}

uint64_t sub_23E717DA4()
{
  return MEMORY[0x24BE2EE18]();
}

uint64_t sub_23E717DB0()
{
  return MEMORY[0x24BE2EE20]();
}

uint64_t sub_23E717DBC()
{
  return MEMORY[0x24BE2EE28]();
}

uint64_t sub_23E717DC8()
{
  return MEMORY[0x24BE2EE30]();
}

uint64_t sub_23E717DD4()
{
  return MEMORY[0x24BE2EE38]();
}

uint64_t sub_23E717DE0()
{
  return MEMORY[0x24BE2EE40]();
}

uint64_t sub_23E717DEC()
{
  return MEMORY[0x24BE2EE48]();
}

uint64_t sub_23E717DF8()
{
  return MEMORY[0x24BE2EE50]();
}

uint64_t sub_23E717E04()
{
  return MEMORY[0x24BE2EE58]();
}

uint64_t sub_23E717E10()
{
  return MEMORY[0x24BE2EE78]();
}

uint64_t sub_23E717E1C()
{
  return MEMORY[0x24BE2EE80]();
}

uint64_t sub_23E717E28()
{
  return MEMORY[0x24BE2EEA0]();
}

uint64_t sub_23E717E34()
{
  return MEMORY[0x24BE2EEA8]();
}

uint64_t sub_23E717E40()
{
  return MEMORY[0x24BE2EEB0]();
}

uint64_t sub_23E717E4C()
{
  return MEMORY[0x24BE2EEB8]();
}

uint64_t sub_23E717E58()
{
  return MEMORY[0x24BE2EEC0]();
}

uint64_t sub_23E717E64()
{
  return MEMORY[0x24BE2EEC8]();
}

uint64_t sub_23E717E70()
{
  return MEMORY[0x24BE2EED0]();
}

uint64_t sub_23E717E7C()
{
  return MEMORY[0x24BE2EED8]();
}

uint64_t sub_23E717E88()
{
  return MEMORY[0x24BE2EEF0]();
}

uint64_t sub_23E717E94()
{
  return MEMORY[0x24BE2EEF8]();
}

uint64_t sub_23E717EA0()
{
  return MEMORY[0x24BE2EF08]();
}

uint64_t sub_23E717EAC()
{
  return MEMORY[0x24BE2EF10]();
}

uint64_t sub_23E717EB8()
{
  return MEMORY[0x24BE2EF20]();
}

uint64_t sub_23E717EC4()
{
  return MEMORY[0x24BE2EF30]();
}

uint64_t sub_23E717ED0()
{
  return MEMORY[0x24BE2EF38]();
}

uint64_t sub_23E717EDC()
{
  return MEMORY[0x24BE2EF40]();
}

uint64_t sub_23E717EE8()
{
  return MEMORY[0x24BE2EF48]();
}

uint64_t sub_23E717EF4()
{
  return MEMORY[0x24BE2EF50]();
}

uint64_t sub_23E717F00()
{
  return MEMORY[0x24BE2EF60]();
}

uint64_t sub_23E717F0C()
{
  return MEMORY[0x24BE2EF68]();
}

uint64_t sub_23E717F18()
{
  return MEMORY[0x24BE2EF70]();
}

uint64_t sub_23E717F24()
{
  return MEMORY[0x24BE2EF78]();
}

uint64_t sub_23E717F30()
{
  return MEMORY[0x24BE2EF80]();
}

uint64_t sub_23E717F3C()
{
  return MEMORY[0x24BE2EF88]();
}

uint64_t sub_23E717F48()
{
  return MEMORY[0x24BE2EFA8]();
}

uint64_t sub_23E717F54()
{
  return MEMORY[0x24BE2EFB0]();
}

uint64_t sub_23E717F60()
{
  return MEMORY[0x24BE2EFB8]();
}

uint64_t sub_23E717F6C()
{
  return MEMORY[0x24BE2EFC0]();
}

uint64_t sub_23E717F78()
{
  return MEMORY[0x24BE2EFC8]();
}

uint64_t sub_23E717F84()
{
  return MEMORY[0x24BE2EFD0]();
}

uint64_t sub_23E717F90()
{
  return MEMORY[0x24BE2EFD8]();
}

uint64_t sub_23E717F9C()
{
  return MEMORY[0x24BE2EFE0]();
}

uint64_t sub_23E717FA8()
{
  return MEMORY[0x24BE2EFE8]();
}

uint64_t sub_23E717FB4()
{
  return MEMORY[0x24BE2EFF0]();
}

uint64_t sub_23E717FC0()
{
  return MEMORY[0x24BE2EFF8]();
}

uint64_t sub_23E717FCC()
{
  return MEMORY[0x24BE2F000]();
}

uint64_t sub_23E717FD8()
{
  return MEMORY[0x24BE2F008]();
}

uint64_t sub_23E717FE4()
{
  return MEMORY[0x24BE2F010]();
}

uint64_t sub_23E717FF0()
{
  return MEMORY[0x24BE2F018]();
}

uint64_t sub_23E717FFC()
{
  return MEMORY[0x24BE2F020]();
}

uint64_t sub_23E718008()
{
  return MEMORY[0x24BE2F028]();
}

uint64_t sub_23E718014()
{
  return MEMORY[0x24BE2F030]();
}

uint64_t sub_23E718020()
{
  return MEMORY[0x24BE2F038]();
}

uint64_t sub_23E71802C()
{
  return MEMORY[0x24BE2F040]();
}

uint64_t sub_23E718038()
{
  return MEMORY[0x24BE2F048]();
}

uint64_t sub_23E718044()
{
  return MEMORY[0x24BE2F050]();
}

uint64_t sub_23E718050()
{
  return MEMORY[0x24BE2F058]();
}

uint64_t sub_23E71805C()
{
  return MEMORY[0x24BE2F060]();
}

uint64_t sub_23E718068()
{
  return MEMORY[0x24BE2F068]();
}

uint64_t sub_23E718074()
{
  return MEMORY[0x24BE2F070]();
}

uint64_t sub_23E718080()
{
  return MEMORY[0x24BE2F078]();
}

uint64_t sub_23E71808C()
{
  return MEMORY[0x24BE2F080]();
}

uint64_t sub_23E718098()
{
  return MEMORY[0x24BE2F088]();
}

uint64_t sub_23E7180A4()
{
  return MEMORY[0x24BE2F090]();
}

uint64_t sub_23E7180B0()
{
  return MEMORY[0x24BE2F098]();
}

uint64_t sub_23E7180BC()
{
  return MEMORY[0x24BE2F0A8]();
}

uint64_t sub_23E7180C8()
{
  return MEMORY[0x24BE2F0B0]();
}

uint64_t sub_23E7180D4()
{
  return MEMORY[0x24BE2F0B8]();
}

uint64_t sub_23E7180E0()
{
  return MEMORY[0x24BE2F0C0]();
}

uint64_t sub_23E7180EC()
{
  return MEMORY[0x24BE2F0C8]();
}

uint64_t sub_23E7180F8()
{
  return MEMORY[0x24BE2F0D0]();
}

uint64_t sub_23E718104()
{
  return MEMORY[0x24BE2F0D8]();
}

uint64_t sub_23E718110()
{
  return MEMORY[0x24BE2F0E0]();
}

uint64_t sub_23E71811C()
{
  return MEMORY[0x24BE2F0E8]();
}

uint64_t sub_23E718128()
{
  return MEMORY[0x24BE2F0F0]();
}

uint64_t sub_23E718134()
{
  return MEMORY[0x24BE2F0F8]();
}

uint64_t sub_23E718140()
{
  return MEMORY[0x24BE2F100]();
}

uint64_t sub_23E71814C()
{
  return MEMORY[0x24BE2F108]();
}

uint64_t sub_23E718158()
{
  return MEMORY[0x24BE2F110]();
}

uint64_t sub_23E718164()
{
  return MEMORY[0x24BE2F118]();
}

uint64_t sub_23E718170()
{
  return MEMORY[0x24BE2F120]();
}

uint64_t sub_23E71817C()
{
  return MEMORY[0x24BE2F128]();
}

uint64_t sub_23E718188()
{
  return MEMORY[0x24BE2F130]();
}

uint64_t sub_23E718194()
{
  return MEMORY[0x24BE2F138]();
}

uint64_t sub_23E7181A0()
{
  return MEMORY[0x24BE2F140]();
}

uint64_t sub_23E7181AC()
{
  return MEMORY[0x24BE2F148]();
}

uint64_t sub_23E7181B8()
{
  return MEMORY[0x24BE2F150]();
}

uint64_t sub_23E7181C4()
{
  return MEMORY[0x24BE2F158]();
}

uint64_t sub_23E7181D0()
{
  return MEMORY[0x24BE2F160]();
}

uint64_t sub_23E7181DC()
{
  return MEMORY[0x24BE2F170]();
}

uint64_t sub_23E7181E8()
{
  return MEMORY[0x24BE2F178]();
}

uint64_t sub_23E7181F4()
{
  return MEMORY[0x24BE2F180]();
}

uint64_t sub_23E718200()
{
  return MEMORY[0x24BE2F188]();
}

uint64_t sub_23E71820C()
{
  return MEMORY[0x24BE2F190]();
}

uint64_t sub_23E718218()
{
  return MEMORY[0x24BE2F198]();
}

uint64_t sub_23E718224()
{
  return MEMORY[0x24BE2F1A0]();
}

uint64_t sub_23E718230()
{
  return MEMORY[0x24BE2F1A8]();
}

uint64_t sub_23E71823C()
{
  return MEMORY[0x24BE2F1B0]();
}

uint64_t sub_23E718248()
{
  return MEMORY[0x24BE2F1B8]();
}

uint64_t sub_23E718254()
{
  return MEMORY[0x24BE2F1C0]();
}

uint64_t sub_23E718260()
{
  return MEMORY[0x24BE2F1C8]();
}

uint64_t sub_23E71826C()
{
  return MEMORY[0x24BE2F1E8]();
}

uint64_t sub_23E718278()
{
  return MEMORY[0x24BE2F1F8]();
}

uint64_t sub_23E718284()
{
  return MEMORY[0x24BE2F208]();
}

uint64_t sub_23E718290()
{
  return MEMORY[0x24BE2F210]();
}

uint64_t sub_23E71829C()
{
  return MEMORY[0x24BE2F218]();
}

uint64_t sub_23E7182A8()
{
  return MEMORY[0x24BE2F228]();
}

uint64_t sub_23E7182B4()
{
  return MEMORY[0x24BE2F240]();
}

uint64_t sub_23E7182C0()
{
  return MEMORY[0x24BE2F248]();
}

uint64_t sub_23E7182CC()
{
  return MEMORY[0x24BE2F250]();
}

uint64_t sub_23E7182D8()
{
  return MEMORY[0x24BE2F280]();
}

uint64_t sub_23E7182E4()
{
  return MEMORY[0x24BE2F290]();
}

uint64_t sub_23E7182F0()
{
  return MEMORY[0x24BE2F2A8]();
}

uint64_t sub_23E7182FC()
{
  return MEMORY[0x24BE2F2C0]();
}

uint64_t sub_23E718308()
{
  return MEMORY[0x24BE2F2C8]();
}

uint64_t sub_23E718314()
{
  return MEMORY[0x24BE2F2D0]();
}

uint64_t sub_23E718320()
{
  return MEMORY[0x24BE2F2D8]();
}

uint64_t sub_23E71832C()
{
  return MEMORY[0x24BE2F2E8]();
}

uint64_t sub_23E718338()
{
  return MEMORY[0x24BE4F4A8]();
}

uint64_t sub_23E718344()
{
  return MEMORY[0x24BE4F4B0]();
}

uint64_t sub_23E718350()
{
  return MEMORY[0x24BE4F4B8]();
}

uint64_t sub_23E71835C()
{
  return MEMORY[0x24BE4F4C0]();
}

uint64_t sub_23E718368()
{
  return MEMORY[0x24BE4F508]();
}

uint64_t sub_23E718374()
{
  return MEMORY[0x24BE4F538]();
}

uint64_t sub_23E718380()
{
  return MEMORY[0x24BE4F540]();
}

uint64_t sub_23E71838C()
{
  return MEMORY[0x24BE4F558]();
}

uint64_t sub_23E718398()
{
  return MEMORY[0x24BE4F578]();
}

uint64_t sub_23E7183A4()
{
  return MEMORY[0x24BE4F598]();
}

uint64_t sub_23E7183B0()
{
  return MEMORY[0x24BE4F5A0]();
}

uint64_t sub_23E7183BC()
{
  return MEMORY[0x24BE4F5A8]();
}

uint64_t sub_23E7183C8()
{
  return MEMORY[0x24BE4F5B0]();
}

uint64_t sub_23E7183D4()
{
  return MEMORY[0x24BE4F5B8]();
}

uint64_t sub_23E7183E0()
{
  return MEMORY[0x24BE4F5C0]();
}

uint64_t sub_23E7183EC()
{
  return MEMORY[0x24BE4F5C8]();
}

uint64_t sub_23E7183F8()
{
  return MEMORY[0x24BE4F5D0]();
}

uint64_t sub_23E718404()
{
  return MEMORY[0x24BE4F5D8]();
}

uint64_t sub_23E718410()
{
  return MEMORY[0x24BE4F5E0]();
}

uint64_t sub_23E71841C()
{
  return MEMORY[0x24BE4F5E8]();
}

uint64_t sub_23E718428()
{
  return MEMORY[0x24BE4F5F0]();
}

uint64_t sub_23E718434()
{
  return MEMORY[0x24BE4F5F8]();
}

uint64_t sub_23E718440()
{
  return MEMORY[0x24BE4F600]();
}

uint64_t sub_23E71844C()
{
  return MEMORY[0x24BE4F608]();
}

uint64_t sub_23E718458()
{
  return MEMORY[0x24BE4F618]();
}

uint64_t sub_23E718464()
{
  return MEMORY[0x24BE4F628]();
}

uint64_t sub_23E718470()
{
  return MEMORY[0x24BE4F638]();
}

uint64_t sub_23E71847C()
{
  return MEMORY[0x24BE4F648]();
}

uint64_t sub_23E718488()
{
  return MEMORY[0x24BE4F658]();
}

uint64_t sub_23E718494()
{
  return MEMORY[0x24BE4F668]();
}

uint64_t sub_23E7184A0()
{
  return MEMORY[0x24BE4F670]();
}

uint64_t sub_23E7184AC()
{
  return MEMORY[0x24BE4F678]();
}

uint64_t sub_23E7184B8()
{
  return MEMORY[0x24BE4F680]();
}

uint64_t sub_23E7184C4()
{
  return MEMORY[0x24BE4F688]();
}

uint64_t sub_23E7184D0()
{
  return MEMORY[0x24BE4F690]();
}

uint64_t sub_23E7184DC()
{
  return MEMORY[0x24BE4F698]();
}

uint64_t sub_23E7184E8()
{
  return MEMORY[0x24BE4F6A0]();
}

uint64_t sub_23E7184F4()
{
  return MEMORY[0x24BE4F6A8]();
}

uint64_t sub_23E718500()
{
  return MEMORY[0x24BE4F6B0]();
}

uint64_t sub_23E71850C()
{
  return MEMORY[0x24BE4F6B8]();
}

uint64_t sub_23E718518()
{
  return MEMORY[0x24BE4F6C0]();
}

uint64_t sub_23E718524()
{
  return MEMORY[0x24BE4F6C8]();
}

uint64_t sub_23E718530()
{
  return MEMORY[0x24BE4F6D0]();
}

uint64_t sub_23E71853C()
{
  return MEMORY[0x24BE4F6D8]();
}

uint64_t sub_23E718548()
{
  return MEMORY[0x24BE4F6E0]();
}

uint64_t sub_23E718554()
{
  return MEMORY[0x24BE4F6E8]();
}

uint64_t sub_23E718560()
{
  return MEMORY[0x24BE4F6F0]();
}

uint64_t sub_23E71856C()
{
  return MEMORY[0x24BE4F6F8]();
}

uint64_t sub_23E718578()
{
  return MEMORY[0x24BE4F710]();
}

uint64_t sub_23E718584()
{
  return MEMORY[0x24BE4F718]();
}

uint64_t sub_23E718590()
{
  return MEMORY[0x24BE4F720]();
}

uint64_t sub_23E71859C()
{
  return MEMORY[0x24BE4F748]();
}

uint64_t sub_23E7185A8()
{
  return MEMORY[0x24BE4F750]();
}

uint64_t sub_23E7185B4()
{
  return MEMORY[0x24BE4F760]();
}

uint64_t sub_23E7185C0()
{
  return MEMORY[0x24BE4F770]();
}

uint64_t sub_23E7185CC()
{
  return MEMORY[0x24BE4F778]();
}

uint64_t sub_23E7185D8()
{
  return MEMORY[0x24BE4F788]();
}

uint64_t sub_23E7185E4()
{
  return MEMORY[0x24BE4F790]();
}

uint64_t sub_23E7185F0()
{
  return MEMORY[0x24BE4F7A0]();
}

uint64_t sub_23E7185FC()
{
  return MEMORY[0x24BE4F7B0]();
}

uint64_t sub_23E718608()
{
  return MEMORY[0x24BE4F7B8]();
}

uint64_t sub_23E718614()
{
  return MEMORY[0x24BE4F7E8]();
}

uint64_t sub_23E718620()
{
  return MEMORY[0x24BE4F808]();
}

uint64_t sub_23E71862C()
{
  return MEMORY[0x24BE4F810]();
}

uint64_t sub_23E718638()
{
  return MEMORY[0x24BE4F818]();
}

uint64_t sub_23E718644()
{
  return MEMORY[0x24BE4F828]();
}

uint64_t sub_23E718650()
{
  return MEMORY[0x24BE4F830]();
}

uint64_t sub_23E71865C()
{
  return MEMORY[0x24BE4F838]();
}

uint64_t sub_23E718668()
{
  return MEMORY[0x24BE4F840]();
}

uint64_t sub_23E718674()
{
  return MEMORY[0x24BE5B970]();
}

uint64_t sub_23E718680()
{
  return MEMORY[0x24BE5B978]();
}

uint64_t sub_23E71868C()
{
  return MEMORY[0x24BE5B990]();
}

uint64_t sub_23E718698()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_23E7186A4()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_23E7186B0()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_23E7186BC()
{
  return MEMORY[0x24BE5BFA8]();
}

uint64_t sub_23E7186C8()
{
  return MEMORY[0x24BE5BFB0]();
}

uint64_t sub_23E7186D4()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_23E7186E0()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_23E7186EC()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_23E7186F8()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_23E718704()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_23E718710()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_23E71871C()
{
  return MEMORY[0x24BE5C058]();
}

uint64_t sub_23E718728()
{
  return MEMORY[0x24BE5C068]();
}

uint64_t sub_23E718734()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_23E718740()
{
  return MEMORY[0x24BE5C0C8]();
}

uint64_t sub_23E71874C()
{
  return MEMORY[0x24BE5C108]();
}

uint64_t sub_23E718758()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_23E718764()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_23E718770()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_23E71877C()
{
  return MEMORY[0x24BE5C188]();
}

uint64_t sub_23E718788()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_23E718794()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_23E7187A0()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_23E7187AC()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_23E7187B8()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_23E7187C4()
{
  return MEMORY[0x24BE5C230]();
}

uint64_t sub_23E7187D0()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_23E7187DC()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_23E7187E8()
{
  return MEMORY[0x24BE5C2A8]();
}

uint64_t sub_23E7187F4()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_23E718800()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_23E71880C()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_23E718818()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_23E718824()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_23E718830()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_23E71883C()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_23E718848()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_23E718854()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_23E718860()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_23E71886C()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_23E718878()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_23E718884()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t sub_23E718890()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23E71889C()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_23E7188A8()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_23E7188B4()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_23E7188C0()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_23E7188CC()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_23E7188D8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23E7188E4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23E7188F0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23E7188FC()
{
  return MEMORY[0x24BEE64A8]();
}

uint64_t sub_23E718908()
{
  return MEMORY[0x24BEE76D0]();
}

uint64_t sub_23E718914()
{
  return MEMORY[0x24BDE0410]();
}

uint64_t sub_23E718920()
{
  return MEMORY[0x24BDE0428]();
}

uint64_t sub_23E71892C()
{
  return MEMORY[0x24BDE0430]();
}

uint64_t sub_23E718938()
{
  return MEMORY[0x24BDE0438]();
}

uint64_t sub_23E718944()
{
  return MEMORY[0x24BDE0440]();
}

uint64_t sub_23E718950()
{
  return MEMORY[0x24BDE0630]();
}

uint64_t sub_23E71895C()
{
  return MEMORY[0x24BDE0640]();
}

uint64_t sub_23E718968()
{
  return MEMORY[0x24BDE0650]();
}

uint64_t sub_23E718974()
{
  return MEMORY[0x24BDE0660]();
}

uint64_t sub_23E718980()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23E71898C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_23E718998()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23E7189A4()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_23E7189B0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23E7189BC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_23E7189C8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_23E7189D4()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_23E7189E0()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_23E7189EC()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_23E7189F8()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_23E718A04()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_23E718A10()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_23E718A1C()
{
  return MEMORY[0x24BDB8BD0]();
}

uint64_t sub_23E718A28()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23E718A34()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_23E718A40()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23E718A4C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23E718A58()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_23E718A64()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23E718A70()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23E718A7C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23E718A88()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23E718A94()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_23E718AA0()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23E718AAC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23E718AB8()
{
  return MEMORY[0x24BDCF878]();
}

uint64_t sub_23E718AC4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23E718AD0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_23E718ADC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_23E718AE8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23E718AF4()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_23E718B00()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_23E718B0C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23E718B18()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_23E718B24()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_23E718B30()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23E718B3C()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_23E718B48()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23E718B54()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_23E718B60()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_23E718B6C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23E718B78()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23E718B84()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_23E718B90()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_23E718B9C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23E718BA8()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23E718BB4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23E718BC0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_23E718BCC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_23E718BD8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_23E718BE4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_23E718BF0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23E718BFC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23E718C08()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23E718C14()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23E718C20()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23E718C2C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_23E718C38()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23E718C44()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23E718C50()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23E718C5C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23E718C68()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23E718C74()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23E718C80()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23E718C8C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23E718C98()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23E718CA4()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23E718CB0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23E718CBC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23E718CC8()
{
  return MEMORY[0x24BEE6938]();
}

uint64_t sub_23E718CD4()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_23E718CE0()
{
  return MEMORY[0x24BEE6970]();
}

uint64_t sub_23E718CEC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23E718CF8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23E718D04()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_23E718D10()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23E718D1C()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_23E718D28()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_23E718D34()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23E718D40()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23E718D4C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23E718D58()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23E718D64()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23E718D70()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_23E718D7C()
{
  return MEMORY[0x24BDB8BE8]();
}

uint64_t sub_23E718D88()
{
  return MEMORY[0x24BDB8CD0]();
}

uint64_t sub_23E718D94()
{
  return MEMORY[0x24BDB8D20]();
}

uint64_t sub_23E718DA0()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_23E718DAC()
{
  return MEMORY[0x24BE4F308]();
}

uint64_t sub_23E718DB8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23E718DC4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23E718DD0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23E718DDC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23E718DE8()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_23E718DF4()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_23E718E00()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23E718E0C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_23E718E18()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23E718E24()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_23E718E30()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23E718E3C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23E718E48()
{
  return MEMORY[0x24BEE57A8]();
}

uint64_t sub_23E718E54()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_23E718E60()
{
  return MEMORY[0x24BEE5830]();
}

uint64_t sub_23E718E6C()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_23E718E78()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_23E718E84()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_23E718E90()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_23E718E9C()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_23E718EA8()
{
  return MEMORY[0x24BDBB360]();
}

uint64_t sub_23E718EB4()
{
  return MEMORY[0x24BDBB388]();
}

uint64_t sub_23E718EC0()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_23E718ECC()
{
  return MEMORY[0x24BDB8D70]();
}

uint64_t sub_23E718ED8()
{
  return MEMORY[0x24BDB8D98]();
}

uint64_t sub_23E718EE4()
{
  return MEMORY[0x24BDB8DA0]();
}

uint64_t sub_23E718EF0()
{
  return MEMORY[0x24BDB8DA8]();
}

uint64_t sub_23E718EFC()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_23E718F08()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_23E718F14()
{
  return MEMORY[0x24BDB8DD8]();
}

uint64_t sub_23E718F20()
{
  return MEMORY[0x24BDB8DE0]();
}

uint64_t sub_23E718F2C()
{
  return MEMORY[0x24BDB8E28]();
}

uint64_t sub_23E718F38()
{
  return MEMORY[0x24BDB8E30]();
}

uint64_t sub_23E718F44()
{
  return MEMORY[0x24BDB8E48]();
}

uint64_t sub_23E718F50()
{
  return MEMORY[0x24BE2F2F0]();
}

uint64_t sub_23E718F5C()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_23E718F68()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23E718F74()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23E718F80()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23E718F8C()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_23E718F98()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_23E718FA4()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23E718FB0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23E718FBC()
{
  return MEMORY[0x24BEE1E58]();
}

uint64_t sub_23E718FC8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23E718FD4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23E718FE0()
{
  return MEMORY[0x24BEE1F50]();
}

uint64_t sub_23E718FEC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23E718FF8()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_23E719004()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23E719010()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23E71901C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23E719028()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23E719034()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23E719040()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23E71904C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_23E719058()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23E719064()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_23E719070()
{
  return MEMORY[0x24BDD0698]();
}

uint64_t sub_23E71907C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23E719088()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23E719094()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23E7190A0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23E7190AC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23E7190B8()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_23E7190C4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23E7190D0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23E7190DC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23E7190E8()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_23E7190F4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23E719100()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23E71910C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23E719118()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23E719124()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_23E719130()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_23E71913C()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_23E719148()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23E719154()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23E719160()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23E71916C()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_23E719178()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23E719184()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23E719190()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23E71919C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23E7191A8()
{
  return MEMORY[0x24BEE30E0]();
}

uint64_t sub_23E7191B4()
{
  return MEMORY[0x24BEE30E8]();
}

uint64_t sub_23E7191C0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_23E7191CC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23E7191D8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23E7191E4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23E7191F0()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23E7191FC()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23E719208()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23E719214()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_23E719220()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23E71922C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_23E719238()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23E719244()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23E719250()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_23E71925C()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_23E719268()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_23E719274()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23E719280()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23E71928C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23E719298()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_23E7192A4()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23E7192B0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23E7192BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23E7192C8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23E7192D4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23E7192E0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23E7192EC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23E7192F8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x24BDB0BC0]();
}

