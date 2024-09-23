uint64_t sub_237EAA0F0()
{
  uint64_t v0;

  return sub_237EA0048(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24));
}

uint64_t sub_237EAA0FC()
{
  return swift_deallocObject();
}

uint64_t sub_237EAA10C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EAA130(uint64_t a1)
{
  uint64_t v1;

  return sub_237EA3EA8(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t sub_237EAA13C()
{
  return swift_deallocObject();
}

unint64_t sub_237EAA14C()
{
  return sub_237EA3FF8();
}

uint64_t sub_237EAA154()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EAA178(uint64_t a1)
{
  uint64_t v1;

  return sub_237EA4108(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_237EAA180()
{
  return objectdestroy_49Tm();
}

uint64_t sub_237EAA188(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_237E487A8;
  return sub_237EA31EC(a1, v4, v5, v6, v7);
}

uint64_t sub_237EAA204()
{
  return objectdestroy_49Tm();
}

uint64_t sub_237EAA20C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_237E487A8;
  return sub_237EA300C(a1, v4, v5, v6, v7);
}

uint64_t sub_237EAA288()
{
  uint64_t *v0;

  return sub_237EA33C4(v0[2], v0[3], v0[4]);
}

uint64_t sub_237EAA294(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_237EA3530(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(char **)(v2 + 32));
}

uint64_t sub_237EAA2A0(uint64_t a1)
{
  return sub_237EBC518(a1);
}

uint64_t sub_237EAA2A8()
{
  return objectdestroy_49Tm();
}

uint64_t sub_237EAA2B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_237E487A8;
  return sub_237EA2BCC(a1, v4, v5, v6);
}

uint64_t sub_237EAA31C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EAA350(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_237E20844;
  return sub_237EA66B4(a1, v4, v5, v7, v6);
}

uint64_t sub_237EAA3C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689C140) - 8) + 80);
  v2 = (v1 + 40) & ~v1;
  swift_unknownObjectRelease();
  swift_release();
  v3 = sub_237EE1D70();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_237EAA470(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689C140) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_237E487A8;
  return sub_237EA6EFC(a1, v5, v6, v7, v8);
}

uint64_t sub_237EAA508(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_237E487A8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25689DB20 + dword_25689DB20))(a1, v4);
}

uint64_t sub_237EAA5DC(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x4B72656874616577;
  else
    v3 = 0x6C616E7265746E69;
  if (v2)
    v4 = 0xEA00000000004955;
  else
    v4 = 0xEA00000000007469;
  if ((a2 & 1) != 0)
    v5 = 0x4B72656874616577;
  else
    v5 = 0x6C616E7265746E69;
  if ((a2 & 1) != 0)
    v6 = 0xEA00000000007469;
  else
    v6 = 0xEA00000000004955;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_237EE31BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_237EAA688(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_237EAA6C8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_237EAA730 + 4 * byte_237EEC184[a2]))(0x756F726765726F66);
}

uint64_t sub_237EAA730(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x756F726765726F66 && v1 == 0xEE0064656553646ELL)
    v2 = 1;
  else
    v2 = sub_237EE31BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_237EAA7F4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_237EAA844(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_237EAA8AC + 4 * byte_237EEC18D[a2]))(0x676F6C616E61);
}

uint64_t sub_237EAA8AC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x676F6C616E61 && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = sub_237EE31BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_237EAA95C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 1684957547;
  else
    v2 = 1802465132;
  if ((a2 & 1) != 0)
    v3 = 1684957547;
  else
    v3 = 1802465132;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_237EE31BC();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_237EAA9C8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x6E65644965707974;
    else
      v3 = 0xD000000000000010;
    if (v2 == 1)
      v4 = 0xEE00726569666974;
    else
      v4 = 0x8000000237EEE130;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x6E65644965707974;
      else
        v6 = 0xD000000000000010;
      if (v5 == 1)
        v7 = 0xEE00726569666974;
      else
        v7 = 0x8000000237EEE130;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x73726F6C6F63;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x73726F6C6F63)
  {
LABEL_21:
    v8 = sub_237EE31BC();
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

void sub_237EAAAF0(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_237EAAB3C(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_237EAABA8 + 4 * byte_237EEC197[a2]))(v2 + 2);
}

uint64_t sub_237EAABA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 2 && v2 == 0x8000000237EEE010)
    v3 = 1;
  else
    v3 = sub_237EE31BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_237EAAC44(char a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (a1)
  {
    if (a1 == 1)
      v2 = 0x7265646E6572;
    else
      v2 = 0x657461647075;
    v3 = 0xE600000000000000;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 0x7265646E6572;
      else
        v5 = 0x657461647075;
      v6 = 0xE600000000000000;
      if (v2 != v5)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0xE400000000000000;
    v2 = 1953064037;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v6 = 0xE400000000000000;
  if (v2 != 1953064037)
  {
LABEL_15:
    v7 = sub_237EE31BC();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6)
    goto LABEL_15;
  v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_237EAAD3C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x746E6569626D61;
  else
    v3 = 7368801;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE700000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x746E6569626D61;
  else
    v5 = 7368801;
  if ((a2 & 1) != 0)
    v6 = 0xE700000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_237EE31BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_237EAADD8(char a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (a1)
  {
    if (a1 == 1)
      v2 = 1802465132;
    else
      v2 = 1684957547;
    v3 = 0xE400000000000000;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 1802465132;
      else
        v5 = 1684957547;
      v6 = 0xE400000000000000;
      if (v2 != v5)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0xE700000000000000;
    v2 = 0x747865746E6F63;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v6 = 0xE700000000000000;
  if (v2 != 0x747865746E6F63)
  {
LABEL_15:
    v7 = sub_237EE31BC();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6)
    goto LABEL_15;
  v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_237EAAED0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_237EAAF3C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_237EAAFB0 + 4 * byte_237EEC1A0[a2]))(0x726F6C6F63);
}

uint64_t sub_237EAAFB0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x726F6C6F63 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_237EE31BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

unint64_t sub_237EAB06C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C320);
  v2 = (_QWORD *)sub_237EE30CC();
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
    result = sub_237EAD4C8((uint64_t)v6);
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

unint64_t sub_237EAB168(uint64_t a1)
{
  return sub_237EAB704(a1, &qword_2568984A0, &qword_25689C318, (uint64_t (*)(uint64_t))sub_237EAD4C8);
}

unint64_t sub_237EAB184(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C348);
  v2 = (_QWORD *)sub_237EE30CC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_237EAD554(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_237EAB29C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C328);
  v2 = (_QWORD *)sub_237EE30CC();
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
    swift_bridgeObjectRetain();
    result = sub_237EAD4C8((uint64_t)v6);
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

unint64_t sub_237EAB3A4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C360);
  v2 = (_QWORD *)sub_237EE30CC();
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
    result = sub_237EAD71C((uint64_t)v6);
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

unint64_t sub_237EAB4AC(uint64_t a1)
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
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689B7E0);
  v2 = sub_237EE30CC();
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
    sub_237E22004(v6, (uint64_t)&v15, &qword_25689C358);
    v7 = v15;
    v8 = v16;
    result = sub_237EAD554(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_237EAEBCC((uint64_t)&v17, v3[7] + 32 * result);
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

unint64_t sub_237EAB5E0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C338);
  v2 = (_QWORD *)sub_237EE30CC();
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
    result = sub_237EAD4C8((uint64_t)v6);
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

unint64_t sub_237EAB6E8(uint64_t a1)
{
  return sub_237EAB704(a1, &qword_2568984B0, &qword_25689C380, (uint64_t (*)(uint64_t))sub_237EAD71C);
}

unint64_t sub_237EAB704(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
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
  v7 = sub_237EE30CC();
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
    sub_237E22004(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_237E24AC8(&v19, (_OWORD *)(v8[7] + 32 * result));
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

unint64_t sub_237EAB82C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t result;
  char v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C350);
  v2 = (_QWORD *)sub_237EE30CC();
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
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = v4[1];
    v8 = v4[2];
    v9 = v4[3];
    v10 = v4[4];
    v11 = (void *)v4[5];
    swift_bridgeObjectRetain();
    v12 = v11;
    result = sub_237EAD554(v5, v6);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v15 = (uint64_t *)(v2[6] + 16 * result);
    *v15 = v5;
    v15[1] = v6;
    v16 = (uint64_t *)(v2[7] + 40 * result);
    *v16 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v16[3] = v10;
    v16[4] = (uint64_t)v12;
    v17 = v2[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_11;
    v2[2] = v19;
    v4 += 7;
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

unint64_t sub_237EAB96C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C368);
  v2 = sub_237EE30CC();
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
    sub_237E22004(v6, (uint64_t)v15, &qword_25689C370);
    result = sub_237EAD8FC((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_237E24AC8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

uint64_t ClockPosterConfiguration.init(look:kind:)@<X0>(__int128 *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v4;
  uint64_t result;

  v4 = *a2;
  result = sub_237E2D180(a1, a3);
  *(_BYTE *)(a3 + 97) = v4;
  return result;
}

void ClockPosterConfiguration.init(defaultLookForKind:)(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  *(_BYTE *)(a2 + 97) = *a1;
  ClockFaceKind.suggestedLooks.getter();
  if (*(_QWORD *)(v3 + 16))
  {
    sub_237E28430(v3 + 32, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t ClockPosterConfiguration.look.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237E28430(v1, a1);
}

uint64_t ClockPosterConfiguration.look.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_237E4717C(a1, v1);
}

uint64_t (*ClockPosterConfiguration.look.modify())()
{
  return CGSizeMake;
}

void ClockPosterConfiguration.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 97);
}

_BYTE *ClockPosterConfiguration.kind.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 97) = *result;
  return result;
}

uint64_t (*ClockPosterConfiguration.kind.modify())()
{
  return CGSizeMake;
}

uint64_t ClockPosterConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  __int128 v11[6];
  _BYTE v12[112];
  char v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C2D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237EABD34();
  sub_237EE32D0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v13 = 0;
  sub_237E471FC();
  sub_237EE312C();
  sub_237E2D180(v11, (uint64_t)v12);
  v13 = 1;
  sub_237E4C09C();
  sub_237EE312C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12[97] = v11[0];
  sub_237E2CDB0((uint64_t)v12, a2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return sub_237E2CA6C((uint64_t)v12);
}

unint64_t sub_237EABD34()
{
  unint64_t result;

  result = qword_25689C2D8;
  if (!qword_25689C2D8)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC3B4, &type metadata for ClockPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C2D8);
  }
  return result;
}

uint64_t ClockPosterConfiguration.encode(to:)(_QWORD *a1)
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
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C2E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237EABD34();
  sub_237EE32DC();
  v10[15] = *(_BYTE *)(v3 + 97);
  v10[14] = 1;
  sub_237E4C1B8();
  sub_237EE3168();
  if (!v2)
  {
    v10[13] = 0;
    sub_237E47240();
    sub_237EE3168();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_237EABEB4(char *a1, char *a2)
{
  return sub_237EAA95C(*a1, *a2);
}

uint64_t sub_237EABEC0()
{
  sub_237EE3264();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  return sub_237EE3294();
}

uint64_t sub_237EABF24()
{
  sub_237EE2ACC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EABF5C()
{
  sub_237EE3264();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  return sub_237EE3294();
}

uint64_t sub_237EABFBC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_237EE30F0();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_237EAC018(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 1802465132;
  if (*v1)
    v2 = 1684957547;
  *a1 = v2;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_237EAC040()
{
  _BYTE *v0;

  if (*v0)
    return 1684957547;
  else
    return 1802465132;
}

uint64_t sub_237EAC064@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_237EE30F0();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_237EAC0C4()
{
  sub_237EABD34();
  return sub_237EE3324();
}

uint64_t sub_237EAC0EC()
{
  sub_237EABD34();
  return sub_237EE3330();
}

void static ClockPosterConfiguration.== infix(_:_:)(uint64_t a1)
{
  if ((_s11ClockPoster0A8FaceLookO2eeoiySbAC_ACtFZ_0() & 1) != 0)
    sub_237EAA7F4(*(_BYTE *)(a1 + 97));
}

uint64_t sub_237EAC154@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ClockPosterConfiguration.init(from:)(a1, a2);
}

uint64_t sub_237EAC168(_QWORD *a1)
{
  return ClockPosterConfiguration.encode(to:)(a1);
}

void sub_237EAC17C(uint64_t a1)
{
  if ((_s11ClockPoster0A8FaceLookO2eeoiySbAC_ACtFZ_0() & 1) != 0)
    sub_237EAA7F4(*(_BYTE *)(a1 + 97));
}

__n128 static ClockPosterConfiguration.configuration(from:kind:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __n128 result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[104];
  _OWORD v50[6];
  __int16 v51;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v43 - v12;
  v14 = sub_237EE1FB0();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v43 - v19;
  v21 = *a3;
  if (a2 >> 60 == 15)
  {
    HIBYTE(v51) = *a3;
    v49[0] = v21;
    ClockFaceKind.suggestedLooks.getter();
    if (*(_QWORD *)(v22 + 16))
    {
      sub_237E28430(v22 + 32, (uint64_t)v50);
      swift_bridgeObjectRelease();
      if (qword_2542C6458 == -1)
      {
LABEL_4:
        v23 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_configuration_private;
        swift_beginAccess();
        sub_237E22004(v23, (uint64_t)v10, &qword_2542C6548);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) == 1)
        {
          sub_237E6072C((uint64_t)v17);
          sub_237E2209C((uint64_t)v10, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v10, v14);
        }
        sub_237E2CDB0((uint64_t)v50, (uint64_t)v49);
        v33 = sub_237EE1F98();
        v34 = sub_237EE2D78();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = swift_slowAlloc();
          v46 = v15;
          v36 = (uint8_t *)v35;
          v37 = swift_slowAlloc();
          v48 = v37;
          *(_DWORD *)v36 = 136446210;
          v38 = sub_237E27380();
          v47 = sub_237E2A660(v38, v39, &v48);
          sub_237EE2EE0();
          swift_bridgeObjectRelease();
          sub_237E2CA6C((uint64_t)v49);
          _os_log_impl(&dword_237E17000, v33, v34, "Loading default configuration:\n %{public}s", v36, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B8272A8](v37, -1, -1);
          MEMORY[0x23B8272A8](v36, -1, -1);

          (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v14);
        }
        else
        {
          sub_237E2CA6C((uint64_t)v49);

          (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        }
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    swift_once();
    goto LABEL_4;
  }
  v49[0] = *a3;
  sub_237E2D070(a1, a2);
  sub_237EAC76C((uint64_t)v50);
  if (qword_2542C6458 != -1)
    swift_once();
  v24 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_configuration_private;
  swift_beginAccess();
  sub_237E22004(v24, (uint64_t)v13, &qword_2542C6548);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_237E6072C((uint64_t)v20);
    sub_237E2209C((uint64_t)v13, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
  }
  sub_237E2CDB0((uint64_t)v50, (uint64_t)v49);
  v25 = sub_237EE1F98();
  v26 = sub_237EE2D78();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v46 = v15;
    v28 = (uint8_t *)v27;
    v29 = swift_slowAlloc();
    v45 = v14;
    v30 = v29;
    v48 = v29;
    *(_DWORD *)v28 = 136446210;
    v44 = a1;
    v31 = sub_237E27380();
    v47 = sub_237E2A660(v31, v32, &v48);
    sub_237EE2EE0();
    swift_bridgeObjectRelease();
    sub_237E2CA6C((uint64_t)v49);
    _os_log_impl(&dword_237E17000, v25, v26, "Loading existing configuration:\n %{public}s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v30, -1, -1);
    MEMORY[0x23B8272A8](v28, -1, -1);
    sub_237EAE424(v44, a2);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v20, v45);
  }
  else
  {
    sub_237E2CA6C((uint64_t)v49);
    sub_237EAE424(a1, a2);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
  }
LABEL_19:
  v40 = v50[5];
  *(_OWORD *)(a4 + 64) = v50[4];
  *(_OWORD *)(a4 + 80) = v40;
  *(_WORD *)(a4 + 96) = v51;
  v41 = v50[1];
  *(_OWORD *)a4 = v50[0];
  *(_OWORD *)(a4 + 16) = v41;
  result = (__n128)v50[3];
  *(_OWORD *)(a4 + 32) = v50[2];
  *(__n128 *)(a4 + 48) = result;
  return result;
}

__n128 sub_237EAC76C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 v8;
  __int128 v9;
  __int128 v10;
  __int16 v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_237EE1FB0();
  MEMORY[0x24BDAC7A8](v3);
  sub_237EE1B84();
  swift_allocObject();
  sub_237EE1B78();
  sub_237EAEC50();
  sub_237EE1B6C();
  swift_release();
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 80) = v10;
  *(_WORD *)(a1 + 96) = v11;
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
  result = v8;
  *(_OWORD *)(a1 + 32) = v7;
  *(__n128 *)(a1 + 48) = v8;
  return result;
}

uint64_t static ClockPosterConfiguration.configuration(from:kind:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v4;
  unint64_t v6;
  char v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;

  v4 = *a2;
  if (!a1)
  {
    v13 = 0u;
    v14 = 0u;
LABEL_14:
    sub_237E2209C((uint64_t)&v13, &qword_256899E40);
    v9 = 0;
    v10 = 0xF000000000000000;
    goto LABEL_15;
  }
  *(_QWORD *)&v13 = 0xD000000000000012;
  *((_QWORD *)&v13 + 1) = 0x8000000237EF0050;
  sub_237EE2F58();
  if (*(_QWORD *)(a1 + 16) && (v6 = sub_237EAD8FC((uint64_t)v12), (v7 & 1) != 0))
  {
    sub_237E2CE14(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v13);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_237EAE438((uint64_t)v12);
  if (!*((_QWORD *)&v14 + 1))
    goto LABEL_14;
  v8 = swift_dynamicCast();
  if (v8)
    v9 = v12[0];
  else
    v9 = 0;
  if (v8)
    v10 = v12[1];
  else
    v10 = 0xF000000000000000;
LABEL_15:
  LOBYTE(v12[0]) = v4;
  static ClockPosterConfiguration.configuration(from:kind:)(v9, v10, (char *)v12, a3);
  return sub_237EAE424(v9, v10);
}

unint64_t ClockPosterConfiguration.dictionaryRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t inited;
  unint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_237EE1FB0();
  MEMORY[0x24BDAC7A8](v1);
  sub_237EE1BB4();
  swift_allocObject();
  sub_237EE1BA8();
  sub_237EE1B90();
  sub_237EAE46C();
  v2 = sub_237EE1B9C();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C2F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237EE55E0;
  sub_237E2D070(v2, v4);
  sub_237EE2F58();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 72) = v2;
  *(_QWORD *)(inited + 80) = v4;
  v6 = sub_237EAB96C(inited);
  sub_237E2D0B4(v2, v4);
  swift_release();
  return v6;
}

uint64_t ClockPosterConfiguration.data.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_237EE1FB0();
  MEMORY[0x24BDAC7A8](v1);
  sub_237EE1BB4();
  swift_allocObject();
  sub_237EE1BA8();
  sub_237EE1B90();
  sub_237EAE46C();
  v2 = sub_237EE1B9C();
  swift_release();
  return v2;
}

unint64_t sub_237EAD3B4(uint64_t a1)
{
  uint64_t v2;

  sub_237EE1D94();
  sub_237E20E98(&qword_25689ACD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_237EE2A0C();
  return sub_237EAD92C(a1, v2);
}

unint64_t sub_237EAD420(double *a1)
{
  uint64_t v2;

  sub_237EE3264();
  sub_237EE3288();
  type metadata accessor for TextClockDescriptor(0);
  sub_237EE1EC0();
  sub_237E20E98((unint64_t *)&unk_25689C110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
  sub_237EE2A18();
  v2 = sub_237EE3294();
  return sub_237EADA6C(a1, v2);
}

unint64_t sub_237EAD4C8(uint64_t a1)
{
  uint64_t v2;

  sub_237EE2A84();
  sub_237EE3264();
  sub_237EE2ACC();
  v2 = sub_237EE3294();
  swift_bridgeObjectRelease();
  return sub_237EADFAC(a1, v2);
}

unint64_t sub_237EAD554(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_237EE3264();
  sub_237EE2ACC();
  v4 = sub_237EE3294();
  return sub_237EADB84(a1, a2, v4);
}

unint64_t sub_237EAD5B8(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x23B8268B8](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_237EADC64(a1, v3);
}

unint64_t sub_237EAD5EC(uint64_t a1)
{
  uint64_t v2;

  sub_237EE3264();
  ClockFaceLook.hash(into:)();
  v2 = sub_237EE3294();
  return sub_237EADD00(a1, v2);
}

void sub_237EAD644(char a1)
{
  sub_237EE3264();
  __asm { BR              X10 }
}

uint64_t sub_237EAD69C()
{
  uint64_t v0;
  uint64_t v1;

  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  v1 = sub_237EE3294();
  return sub_237EADDC4(v0, v1);
}

unint64_t sub_237EAD71C(uint64_t a1)
{
  uint64_t v2;

  sub_237EE2A84();
  sub_237EE3264();
  sub_237EE2ACC();
  v2 = sub_237EE3294();
  swift_bridgeObjectRelease();
  return sub_237EADFAC(a1, v2);
}

unint64_t sub_237EAD79C(double a1, double a2)
{
  uint64_t v4;

  sub_237EE3264();
  CLLocationCoordinate2D.hash(into:)();
  v4 = sub_237EE3294();
  return sub_237EAE120(v4, a1, a2);
}

unint64_t sub_237EAD7FC(char a1)
{
  uint64_t v2;

  sub_237EE3264();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  v2 = sub_237EE3294();
  return sub_237EAE194(a1 & 1, v2);
}

unint64_t sub_237EAD898(char a1)
{
  uint64_t v2;

  sub_237EE3264();
  sub_237EE3288();
  v2 = sub_237EE3294();
  return sub_237EAE2D0(a1, v2);
}

unint64_t sub_237EAD8FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237EE2F40();
  return sub_237EAE360(a1, v2);
}

unint64_t sub_237EAD92C(uint64_t a1, uint64_t a2)
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
  v5 = sub_237EE1D94();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      sub_237E20E98(&qword_25689C340, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_237EE2A48();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_237EADA6C(double *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = type metadata accessor for TextClockDescriptor(0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (double *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = -1 << *(_BYTE *)(v2 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      sub_237EAEB4C(*(_QWORD *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if (*v8 == *a1
        && (MEMORY[0x23B825514]((char *)v8 + *(int *)(v5 + 20), (char *)a1 + *(int *)(v5 + 20), *v8) & 1) != 0)
      {
        break;
      }
      sub_237EAEB90((uint64_t)v8);
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        return v10;
    }
    sub_237EAEB90((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_237EADB84(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_237EE31BC() & 1) == 0)
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
      while (!v14 && (sub_237EE31BC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_237EADC64(int a1, uint64_t a2)
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
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_237EADD00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  _BYTE v8[104];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    do
    {
      sub_237E28430(*(_QWORD *)(v2 + 48) + 104 * v4, (uint64_t)v8);
      v6 = _s11ClockPoster0A8FaceLookO2eeoiySbAC_ACtFZ_0();
      sub_237E2846C((uint64_t)v8);
      if ((v6 & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_237EADDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_237EADFAC(uint64_t a1, uint64_t a2)
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
    v6 = sub_237EE2A84();
    v8 = v7;
    if (v6 == sub_237EE2A84() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_237EE31BC();
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
          v13 = sub_237EE2A84();
          v15 = v14;
          if (v13 == sub_237EE2A84() && v15 == v16)
            break;
          v18 = sub_237EE31BC();
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

unint64_t sub_237EAE120(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  double *v7;
  double v8;
  BOOL v9;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  result = a1 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    do
    {
      v7 = (double *)(*(_QWORD *)(v3 + 48) + 16 * result);
      v8 = v7[1];
      v9 = *v7 == a2;
      if (v8 == a3 && v9)
        break;
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_237EAE194(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x4B72656874616577;
    else
      v6 = 0x6C616E7265746E69;
    if ((a1 & 1) != 0)
      v7 = 0xEA00000000007469;
    else
      v7 = 0xEA00000000004955;
    while (1)
    {
      v8 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0x4B72656874616577 : 0x6C616E7265746E69;
      v9 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0xEA00000000007469 : 0xEA00000000004955;
      if (v8 == v6 && v9 == v7)
        break;
      v11 = sub_237EE31BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_237EAE2D0(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  int v7;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    do
    {
      v7 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + result);
      if (a1)
      {
        if (a1 == 1)
        {
          if (v7 == 1)
            return result;
        }
        else if (v7 == 2)
        {
          return result;
        }
      }
      else if (!*(_BYTE *)(*(_QWORD *)(v2 + 48) + result))
      {
        return result;
      }
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_237EAE360(uint64_t a1, uint64_t a2)
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
      sub_237EAEC14(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B8265B8](v9, a1);
      sub_237EAE438((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_237EAE424(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_237E2D0B4(a1, a2);
  return a1;
}

uint64_t sub_237EAE438(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_237EAE46C()
{
  unint64_t result;

  result = qword_25689C2E8;
  if (!qword_25689C2E8)
  {
    result = MEMORY[0x23B8271D0](&protocol conformance descriptor for ClockPosterConfiguration, &type metadata for ClockPosterConfiguration);
    atomic_store(result, (unint64_t *)&qword_25689C2E8);
  }
  return result;
}

unint64_t sub_237EAE4B0(uint64_t a1)
{
  unint64_t result;

  result = sub_237EAE4D4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237EAE4D4()
{
  unint64_t result;

  result = qword_25689C2F8;
  if (!qword_25689C2F8)
  {
    result = MEMORY[0x23B8271D0](&protocol conformance descriptor for ClockPosterConfiguration, &type metadata for ClockPosterConfiguration);
    atomic_store(result, (unint64_t *)&qword_25689C2F8);
  }
  return result;
}

uint64_t initializeWithCopy for ClockPosterConfiguration(uint64_t a1, uint64_t a2)
{
  int v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = *(unsigned __int8 *)(a2 + 96);
  if (v4 == 2)
  {
    v7 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
    v8 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 40, a2 + 40);
    v9 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 88) = v9;
    *(_BYTE *)(a1 + 96) = 2;
    swift_bridgeObjectRetain();
  }
  else if (v4 == 1)
  {
    v10 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v10;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_BYTE *)(a1 + 96) = 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else if (*(_BYTE *)(a2 + 96))
  {
    v11 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v11;
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    v12 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
    v13 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v13;
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    v6 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v6;
    *(_BYTE *)(a1 + 96) = 0;
    swift_bridgeObjectRetain();
  }
  *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  return a1;
}

uint64_t assignWithCopy for ClockPosterConfiguration(uint64_t a1, __int128 *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if ((__int128 *)a1 != a2)
  {
    sub_237E2846C(a1);
    v4 = *((unsigned __int8 *)a2 + 96);
    if (v4 == 2)
    {
      v6 = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v6;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v6 - 8))(a1, a2);
      v7 = *((_QWORD *)a2 + 8);
      *(_QWORD *)(a1 + 64) = v7;
      *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
      *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
      *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
      *(_BYTE *)(a1 + 96) = 2;
      swift_bridgeObjectRetain();
    }
    else if (v4 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      *(_BYTE *)(a1 + 96) = 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else if (*((_BYTE *)a2 + 96))
    {
      v8 = *a2;
      v9 = a2[2];
      *(_OWORD *)(a1 + 16) = a2[1];
      *(_OWORD *)(a1 + 32) = v9;
      *(_OWORD *)a1 = v8;
      v10 = a2[3];
      v11 = a2[4];
      v12 = a2[5];
      *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
      *(_OWORD *)(a1 + 64) = v11;
      *(_OWORD *)(a1 + 80) = v12;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      v5 = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v5;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v5 - 8))(a1, a2);
      *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
      *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
      *(_BYTE *)(a1 + 96) = 0;
      swift_bridgeObjectRetain();
    }
  }
  *(_BYTE *)(a1 + 97) = *((_BYTE *)a2 + 97);
  return a1;
}

__n128 __swift_memcpy98_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_WORD *)(a1 + 96) = *((_WORD *)a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ClockPosterConfiguration(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  if (a1 != a2)
  {
    sub_237E2846C(a1);
    v4 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v4;
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
  }
  *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClockPosterConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 98))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 96);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ClockPosterConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 96) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 98) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 98) = 0;
    if (a2)
      *(_BYTE *)(result + 96) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClockPosterConfiguration()
{
  return &type metadata for ClockPosterConfiguration;
}

uint64_t storeEnumTagSinglePayload for ClockPosterConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237EAE920 + 4 * byte_237EEC1B8[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237EAE954 + 4 * byte_237EEC1B3[v4]))();
}

uint64_t sub_237EAE954(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237EAE95C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237EAE964);
  return result;
}

uint64_t sub_237EAE970(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237EAE978);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237EAE97C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237EAE984(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClockPosterConfiguration.CodingKeys()
{
  return &type metadata for ClockPosterConfiguration.CodingKeys;
}

unint64_t sub_237EAE9A4()
{
  unint64_t result;

  result = qword_25689C300;
  if (!qword_25689C300)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC38C, &type metadata for ClockPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C300);
  }
  return result;
}

unint64_t sub_237EAE9EC()
{
  unint64_t result;

  result = qword_25689C308;
  if (!qword_25689C308)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC2C4, &type metadata for ClockPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C308);
  }
  return result;
}

unint64_t sub_237EAEA34()
{
  unint64_t result;

  result = qword_25689C310;
  if (!qword_25689C310)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC2EC, &type metadata for ClockPosterConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C310);
  }
  return result;
}

unint64_t sub_237EAEA78(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *i;
  unsigned int v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C330);
    v3 = (_QWORD *)sub_237EE30CC();
    for (i = (_QWORD *)(a1 + 40); ; i += 2)
    {
      v5 = *((_DWORD *)i - 2);
      v6 = *i;
      result = sub_237EAD5B8(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(_QWORD *)(v3[7] + 8 * result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_237EAEB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TextClockDescriptor(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EAEB90(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TextClockDescriptor(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237EAEBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256899E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EAEC14(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_237EAEC50()
{
  unint64_t result;

  result = qword_25689C378;
  if (!qword_25689C378)
  {
    result = MEMORY[0x23B8271D0](&protocol conformance descriptor for ClockPosterConfiguration, &type metadata for ClockPosterConfiguration);
    atomic_store(result, (unint64_t *)&qword_25689C378);
  }
  return result;
}

id sub_237EAEC94(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  uint64_t v10;
  id v11;
  char *v12;
  id v13;
  void *v14;
  objc_super v16;

  v9 = &v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView____lazy_storage___scaler];
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v9[40] = 1;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView] = 0;
  v10 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask] = 0;
  v11 = objc_allocWithZone((Class)type metadata accessor for AnalogClockDialView());
  v12 = v4;
  v13 = objc_msgSend(v11, sel_initWithFrame_, a1, a2, a3, a4);
  v14 = *(void **)&v4[v10];
  *(_QWORD *)&v4[v10] = v13;

  v16.receiver = v12;
  v16.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  return objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_237EAEE00()
{
  char *v0;
  void *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  id v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double MinX;
  id v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGFloat v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  double v88;
  _QWORD aBlock[5];
  void *v90;
  objc_super v91;
  UIEdgeInsets v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v2 = v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for AnalogClockFaceView();
  v91.receiver = v0;
  v91.super_class = v6;
  objc_msgSendSuper2(&v91, sel_layoutSubviews);
  v92 = UIView.cp_safeAreaInsets(centering:)(1);
  top = v92.top;
  left = v92.left;
  objc_msgSend(v0, sel_frame);
  UIEdgeInsetsInsetRect_0(v9, v10, v11, v12, top, left);
  UIRectIntegralWithViewScale();
  v16 = v15;
  v18 = v17;
  v19 = v13;
  v20 = v14;
  v21 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView])
  {
    v22 = objc_msgSend(objc_allocWithZone((Class)AnalogHandsView), sel_initWithFixedSize_, v13, v14);
    v23 = *(void **)&v0[v21];
    *(_QWORD *)&v0[v21] = v22;

  }
  sub_237EAF9EC();
  v24 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask])
  {
    v25 = sub_237EE2C64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v5, 1, 1, v25);
    v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_237EE2C4C();
    swift_retain();
    v27 = sub_237EE2C40();
    v28 = (_QWORD *)swift_allocObject();
    v29 = MEMORY[0x24BEE6930];
    v28[2] = v27;
    v28[3] = v29;
    v28[4] = v26;
    swift_release();
    *(_QWORD *)&v2[v24] = sub_237ECBB58((uint64_t)v5, (uint64_t)&unk_25689C3F8, (uint64_t)v28);
    swift_release();
  }
  sub_237EB025C();
  v30 = objc_opt_self();
  v31 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v31 + 2) = v2;
  v31[3] = v16;
  v31[4] = v18;
  v31[5] = v19;
  v31[6] = v20;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_237EB05FC;
  *(_QWORD *)(v32 + 24) = v31;
  aBlock[4] = sub_237E23C80;
  v90 = (void *)v32;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237ED10FC;
  aBlock[3] = &block_descriptor_29;
  v33 = _Block_copy(aBlock);
  v34 = v90;
  v35 = v2;
  swift_retain();
  swift_release();
  objc_msgSend((id)v30, sel_performWithoutAnimation_, v33);
  _Block_release(v33);
  LOBYTE(v30) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v30 & 1) != 0)
  {
    __break(1u);
LABEL_21:

    __break(1u);
    goto LABEL_22;
  }
  v85 = v21;
  v36 = objc_msgSend(v35, sel_effectiveUserInterfaceLayoutDirection);
  v37 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView;
  if (v36 == (id)1)
    v38 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView;
  else
    v38 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView;
  v34 = *(void **)&v35[v38];
  if (v36 == (id)1)
    v37 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView;
  v1 = *(void **)&v35[v37];
  v39 = &unk_25689C000;
  v87 = v19;
  v88 = v18;
  v86 = v20;
  if (v34)
  {
    v40 = *(_QWORD *)&v35[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView];
    if (!v40)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v41 = v16;
    v42 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame);
    v43 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame + 8);
    v44 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame + 16);
    v45 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame + 24);
    v46 = v1;
    v47 = v34;
    objc_msgSend(v35, sel_convertRect_fromView_, v40, v42, v43, v44, v45);
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    objc_msgSend(v47, sel_intrinsicContentSize);
    v57 = v56;
    v59 = v58;
    v93.origin.x = v49;
    v93.origin.y = v51;
    v93.size.width = v53;
    v93.size.height = v55;
    MinX = CGRectGetMinX(v93);
    v94.origin.x = v49;
    v94.origin.y = v51;
    v94.size.width = v53;
    v94.size.height = v55;
    objc_msgSend(v47, sel_setFrame_, MinX, CGRectGetMidY(v94) + v59 * -0.5, v57, v59);
    v16 = v41;
    v19 = v87;
    v18 = v88;
    v20 = v86;
    v39 = (_QWORD *)&unk_25689C000;
    if (!v1)
      goto LABEL_18;
  }
  else
  {
    v61 = v1;
    if (!v1)
      goto LABEL_18;
  }
  v62 = *(_QWORD *)&v35[v39[117]];
  if (v62)
  {
    v63 = v16;
    v64 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame);
    v65 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame + 8);
    v66 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame + 16);
    v67 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame + 24);
    v68 = v1;
    objc_msgSend(v35, (SEL)&selRef_setContentsGravity_, v62, v64, v65, v66, v67);
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;
    objc_msgSend(v68, (SEL)&selRef_coordinate);
    v78 = v77;
    v80 = v79;
    v95.origin.x = v70;
    v95.origin.y = v72;
    v95.size.width = v74;
    v95.size.height = v76;
    v81 = CGRectGetMaxX(v95) - v78;
    v96.origin.x = v70;
    v96.origin.y = v72;
    v96.size.width = v74;
    v96.size.height = v76;
    objc_msgSend(v68, (SEL)&selRef_setContentsGravity_, v81, CGRectGetMidY(v96) + v80 * -0.5, v78, v80);

    v16 = v63;
    v19 = v87;
    v18 = v88;
    v20 = v86;
LABEL_18:
    v97.origin.x = v16;
    v97.origin.y = v18;
    v97.size.width = v19;
    v97.size.height = v20;
    CGRectGetHeight(v97);
    v98.origin.x = v16;
    v98.origin.y = v18;
    v98.size.width = v19;
    v98.size.height = v20;
    CGRectGetHeight(v98);
    v82 = *(void **)&v2[v85];
    if (v82)
    {
      v83 = v82;
      UIRectCenteredRect();
      objc_msgSend(v83, sel_setFrame_);
      swift_release();

      return;
    }
    goto LABEL_21;
  }
LABEL_23:

  __break(1u);
}

uint64_t sub_237EAF3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[5] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256898AF0);
  v4[10] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689C240);
  v4[11] = v6;
  v4[12] = *(_QWORD *)(v6 - 8);
  v4[13] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898AF8);
  v4[14] = v7;
  v4[15] = *(_QWORD *)(v7 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = sub_237EE2C4C();
  v4[18] = sub_237EE2C40();
  v4[19] = sub_237EE2C28();
  v4[20] = v8;
  return swift_task_switch();
}

uint64_t sub_237EAF518()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_256897B48 != -1)
    swift_once();
  v2 = v0[12];
  v1 = v0[13];
  v3 = v0[11];
  v4 = qword_25689B990;
  v5 = *(_QWORD *)(qword_25689B990 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream);
  swift_retain();
  sub_237E8F7E4(v5, v4, v1);
  sub_237EE2C88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[21] = sub_237EE2C40();
  v6 = (_QWORD *)swift_task_alloc();
  v0[22] = v6;
  *v6 = v0;
  v6[1] = sub_237EAF644;
  return sub_237EE2C94();
}

uint64_t sub_237EAF644()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_237EAF698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 48))(v1, 1, *(_QWORD *)(v0 + 48)) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    swift_release();
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)(v0 + 40) + 16;
  sub_237E34B08(v1, *(_QWORD *)(v0 + 72));
  result = MEMORY[0x23B827344](v2);
  if (!result)
  {
    v16 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 128);
    v17 = *(_QWORD *)(v0 + 112);
    v18 = *(_QWORD *)(v0 + 72);
    swift_release();
    sub_237E2209C(v18, &qword_25689C140);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    goto LABEL_9;
  }
  v4 = (void *)result;
  v5 = *(void **)(result + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView);
  if (v5)
  {
    v6 = *(_QWORD *)(v0 + 64);
    sub_237E34B90(*(_QWORD *)(v0 + 72), v6);
    v7 = sub_237EE1D70();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    v10 = v5;
    v11 = 0;
    if (v9 != 1)
    {
      v12 = *(_QWORD *)(v0 + 64);
      v11 = (void *)sub_237EE1CF8();
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v7);
    }
    v13 = *(_QWORD *)(v0 + 72);
    objc_msgSend(v10, sel_setOverrideDate_, v11);

    sub_237E2209C(v13, &qword_25689C140);
    *(_QWORD *)(v0 + 168) = sub_237EE2C40();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v14;
    *v14 = v0;
    v14[1] = sub_237EAF644;
    return sub_237EE2C94();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_237EAF8B8(uint64_t a1)
{
  uint64_t v2;
  id result;

  v2 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView;
  result = *(id *)(a1 + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView);
  if (result)
  {
    objc_msgSend(result, sel_setFrame_);
    result = *(id *)(a1 + v2);
    if (result)
      return objc_msgSend(result, sel_layoutIfNeeded);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_237EAF9EC()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id result;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t, void *);
  void *v36;
  id (*v37)(uint64_t);
  uint64_t v38;

  v1 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView];
  if (!v2)
    goto LABEL_8;
  v3 = v2;
  result = objc_msgSend(v0, sel_tintColor);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v5 = result;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = 0x406FE00000000000;
  v7 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v37 = sub_237E2DF20;
  v38 = v6;
  v8 = MEMORY[0x24BDAC760];
  v33 = MEMORY[0x24BDAC760];
  v34 = 1107296256;
  v35 = sub_237E7D770;
  v36 = &block_descriptor_6_1;
  v9 = _Block_copy(&v33);
  v10 = v5;
  v11 = objc_msgSend(v7, sel_initWithDynamicProvider_, v9);
  _Block_release(v9);

  swift_release();
  objc_msgSend(v3, sel_applySecondHandColor_, v11);

  result = *(id *)&v0[v1];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  result = objc_msgSend(result, sel_hourHandView);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v12 = result;
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_whiteColor);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = 0x406FE00000000000;
  v16 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v37 = sub_237E2DF74;
  v38 = v15;
  v33 = v8;
  v34 = 1107296256;
  v35 = sub_237E7D770;
  v36 = &block_descriptor_13;
  v17 = _Block_copy(&v33);
  v18 = v14;
  v19 = objc_msgSend(v16, sel_initWithDynamicProvider_, v17);
  _Block_release(v17);

  swift_release();
  objc_msgSend(v12, sel_setColor_, v19);

  result = *(id *)&v0[v1];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = objc_msgSend(result, sel_minuteHandView);
  if (result)
  {
    v20 = result;
    v21 = objc_msgSend(v13, sel_whiteColor);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v21;
    *(_QWORD *)(v22 + 24) = 0x406FE00000000000;
    v23 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v37 = sub_237E2DF74;
    v38 = v22;
    v33 = MEMORY[0x24BDAC760];
    v34 = 1107296256;
    v35 = sub_237E7D770;
    v36 = &block_descriptor_20_0;
    v24 = _Block_copy(&v33);
    v25 = v21;
    v26 = objc_msgSend(v23, sel_initWithDynamicProvider_, v24);
    _Block_release(v24);

    swift_release();
    objc_msgSend(v20, sel_setColor_, v26);

LABEL_8:
    v27 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView];
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v0, sel_tintColor);
      objc_msgSend(v28, sel_setTintColor_, v29);

    }
    v30 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView];
    if (v30)
    {
      v31 = v30;
      v32 = sub_237EAFDEC();
      objc_msgSend(v31, sel_setTintColor_, v32);

    }
    result = *(id *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView];
    if (result)
      return objc_msgSend(result, sel_setNeedsLayout);
    __break(1u);
    goto LABEL_15;
  }
LABEL_19:
  __break(1u);
  return result;
}

id sub_237EAFDEC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_237EE1DD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237EE1DE8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C3E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor;
  v13 = *(void **)&v1[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor];
  v14 = v13;
  if (!v13)
    v14 = objc_msgSend(v1, sel_tintColor);
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView])
  {
    v20 = v14;
    v21 = v13;
    return v20;
  }
  v33 = v14;
  type metadata accessor for AnalogClockFaceDateComplicationView();
  v15 = swift_dynamicCastClass();
  v16 = v13;
  if (v15)
  {
    v17 = sub_237EC1A48((uint64_t)&unk_2509BE530);
    swift_arrayDestroy();
    sub_237EE1DB8();
    sub_237EE1DDC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_237EE1DC4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v18 = sub_237EE1DAC();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v12, 1, v18) == 1)
    {
      swift_bridgeObjectRelease();
      sub_237E2209C((uint64_t)v12, &qword_25689C3E8);
    }
    else
    {
      v23 = sub_237EE1DA0();
      v25 = v24;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v18);
      LOBYTE(v23) = sub_237EB0128(v23, v25, v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0 && *(_QWORD *)&v1[v32])
      {
        v26 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
        v27 = swift_allocObject();
        *(_QWORD *)(v27 + 16) = v26;
        v28 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
        aBlock[4] = sub_237E7DAD8;
        aBlock[5] = v27;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_237E7D770;
        aBlock[3] = &block_descriptor_10;
        v29 = _Block_copy(aBlock);
        v30 = v26;
        v31 = objc_msgSend(v28, sel_initWithDynamicProvider_, v29);
        _Block_release(v29);

        swift_release();
        return v31;
      }
    }
  }
  return v33;
}

uint64_t sub_237EB0128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_237EE3264();
    sub_237EE2ACC();
    v6 = sub_237EE3294();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_237EE31BC() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_237EE31BC() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_237EB025C()
{
  char *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  char v20;

  v1 = objc_msgSend(v0, sel_subviews);
  sub_237E387EC();
  v2 = sub_237EE2BD4();

  v3 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView;
  v4 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView];
  if (!v4)
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4;
  v6 = sub_237E60450((uint64_t)v5, v2);
  swift_bridgeObjectRelease();

  if ((v6 & 1) == 0)
  {
    if (!*(_QWORD *)&v0[v3])
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    objc_msgSend(v0, sel_addSubview_);
  }
  v7 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView];
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v0, sel_subviews);
    v10 = sub_237EE2BD4();

    LOBYTE(v9) = sub_237E60450((uint64_t)v8, v10);
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      objc_msgSend(v0, sel_addSubview_, v8);

  }
  v11 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView];
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v0, sel_subviews);
    v14 = sub_237EE2BD4();

    LOBYTE(v13) = sub_237E60450((uint64_t)v12, v14);
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
      objc_msgSend(v0, sel_addSubview_, v12);

  }
  v15 = objc_msgSend(v0, sel_subviews);
  v16 = sub_237EE2BD4();

  v17 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView;
  v18 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView];
  if (!v18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v19 = v18;
  v20 = sub_237E60450((uint64_t)v19, v16);
  swift_bridgeObjectRelease();

  if ((v20 & 1) != 0)
    return;
  if (*(_QWORD *)&v0[v17])
  {
    objc_msgSend(v0, sel_addSubview_);
    return;
  }
LABEL_20:
  __break(1u);
}

id sub_237EB0494()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnalogClockFaceView()
{
  return objc_opt_self();
}

uint64_t sub_237EB055C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_237EB0598()
{
  uint64_t v0;

  return swift_deallocObject();
}

double UIEdgeInsetsInsetRect_0(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_237EB05D8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_237EB05FC()
{
  uint64_t v0;

  return sub_237EAF8B8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_237EB060C()
{
  return swift_deallocObject();
}

uint64_t sub_237EB061C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237EB0640()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EB066C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_237E20844;
  return sub_237EAF3F0(a1, v4, v5, v6);
}

void sub_237EB06D8()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView____lazy_storage___scaler];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_QWORD *)v1 + 4) = 0;
  v1[40] = 1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask] = 0;

  sub_237EE309C();
  __break(1u);
}

Swift::Void __swiftcall UIView.cp_applyFullscreenConstraints(inContainer:)(UIView *inContainer)
{
  void *v1;
  void *v3;
  uint64_t v4;
  NSLayoutXAxisAnchor *v5;
  id v6;
  id v7;
  NSLayoutXAxisAnchor *v8;
  id v9;
  id v10;
  NSLayoutYAxisAnchor *v11;
  id v12;
  id v13;
  NSLayoutYAxisAnchor *v14;
  id v15;
  id v16;
  id v17;

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v3 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568982F8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_237EEC450;
  v5 = -[UIView leadingAnchor](inContainer, sel_leadingAnchor);
  v6 = objc_msgSend(v1, sel_leadingAnchor);
  v7 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v5, sel_constraintEqualToAnchor_, v6);

  *(_QWORD *)(v4 + 32) = v7;
  v8 = -[UIView trailingAnchor](inContainer, sel_trailingAnchor);
  v9 = objc_msgSend(v1, sel_trailingAnchor);
  v10 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v8, sel_constraintEqualToAnchor_, v9);

  *(_QWORD *)(v4 + 40) = v10;
  v11 = -[UIView topAnchor](inContainer, sel_topAnchor);
  v12 = objc_msgSend(v1, sel_topAnchor);
  v13 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v11, sel_constraintEqualToAnchor_, v12);

  *(_QWORD *)(v4 + 48) = v13;
  v14 = -[UIView bottomAnchor](inContainer, sel_bottomAnchor);
  v15 = objc_msgSend(v1, sel_bottomAnchor);
  v16 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v14, sel_constraintEqualToAnchor_, v15);

  *(_QWORD *)(v4 + 56) = v16;
  sub_237EE2BEC();
  sub_237EB0A08();
  v17 = (id)sub_237EE2BBC();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v17);

}

unint64_t sub_237EB0A08()
{
  unint64_t result;

  result = qword_25689C400;
  if (!qword_25689C400)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25689C400);
  }
  return result;
}

UIEdgeInsets __swiftcall UIView.cp_safeAreaInsets(centering:)(Swift::Bool centering)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v19;
  id v20;
  double v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  NSObject *v37;
  double v38;
  double v39;
  _QWORD v40[2];
  id v41;
  int v42;
  NSObject *v43;
  CGRect v44;
  UIEdgeInsets result;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237EE1FB0();
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)&v9 = MEMORY[0x24BDAC7A8](v7).n128_u64[0];
  v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_safeAreaInsets, v9);
  if (v15 == *MEMORY[0x24BEBE158]
    && v12 == *(double *)(MEMORY[0x24BEBE158] + 8)
    && v13 == *(double *)(MEMORY[0x24BEBE158] + 16)
    && v14 == *(double *)(MEMORY[0x24BEBE158] + 24))
  {
    objc_msgSend(v1, sel_safeAreaInsets);
    v19 = v26;
    v21 = v27;
    goto LABEL_33;
  }
  v19 = 24.0;
  if (!SBUIIsSystemApertureEnabled())
  {
    *(double *)&v28 = 64.0;
LABEL_32:
    v24 = *(double *)&v28;
    v25 = 24.0;
    v21 = *(double *)&v28;
    goto LABEL_33;
  }
  v20 = objc_msgSend((id)objc_opt_self(), sel_sharedInstanceForEmbeddedDisplay);
  objc_msgSend(v20, sel_interSensorRegionInWindowSpace);
  v21 = CGRectGetMaxY(v44) + 1.0;
  v22 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  v23 = sub_237EB0E3C();

  if (v23 == 4)
  {

    if (centering)
      v24 = v21;
    else
      v24 = 64.0;
    v25 = 24.0;
    goto LABEL_33;
  }
  if (v23 != 3)
  {
    if (qword_2542C6458 != -1)
      swift_once();
    v29 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_rendering_private;
    swift_beginAccess();
    sub_237E2CAA0(v29, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_237E6072C((uint64_t)v11);
      sub_237E4B270((uint64_t)v6);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
    }
    v30 = v2;
    v31 = sub_237EE1F98();
    v32 = sub_237EE2D90();
    v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      v34 = swift_slowAlloc();
      v42 = v33;
      v35 = v34;
      v36 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v35 = 138543618;
      v40[0] = v35 + 12;
      v40[1] = v35 + 4;
      v43 = v30;
      v41 = v20;
      v37 = v30;
      sub_237EE2EE0();
      *v36 = v30;

      *(_WORD *)(v35 + 12) = 2050;
      v43 = v23;
      v20 = v41;
      sub_237EE2EE0();
      _os_log_impl(&dword_237E17000, v31, (os_log_type_t)v42, "[%{public}@] Unsupported interface orientation %{public}ld.", (uint8_t *)v35, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v36, -1, -1);
      MEMORY[0x23B8272A8](v35, -1, -1);
    }
    else
    {

      v31 = v30;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    *(double *)&v28 = 49.0;
    goto LABEL_32;
  }

  v24 = v21;
  if (!centering)
    v21 = 64.0;
  v25 = 24.0;
LABEL_33:
  v38 = v19;
  v39 = v21;
  result.right = v39;
  result.bottom = v25;
  result.left = v24;
  result.top = v38;
  return result;
}

double UIView.cp_safeAreaInsets.getter()
{
  return 24.0;
}

uint64_t sub_237EB0E3C()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(objc_msgSend(v0, sel_coordinateSpace), sel_convertPoint_toCoordinateSpace_, objc_msgSend(v0, sel_fixedCoordinateSpace), 0.0, 0.0);
  v2 = v1;
  v4 = v3;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v5 = 4;
  if (v4 == 0.0)
    v5 = 1;
  v6 = 2;
  if (v4 == 0.0)
    v6 = 3;
  if (v2 == 0.0)
    return v5;
  else
    return v6;
}

double sub_237EB0EE8()
{
  void *v0;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinY;
  CGFloat MinX;
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MaxY;
  CGFloat v18;
  id v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double MaxX;
  CGFloat v29;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  objc_msgSend(v0, sel_frame);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;
  MinY = CGRectGetMinY(v32);
  CGFloatMax(24.0 - MinY);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinX = CGRectGetMinX(v33);
  v31 = CGFloatMax(64.0 - MinX);
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v34.origin.x = v10;
  v34.origin.y = v12;
  v34.size.width = v14;
  v34.size.height = v16;
  MaxY = CGRectGetMaxY(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v18 = CGRectGetMaxY(v35);
  v19 = objc_msgSend(v7, sel_mainScreen, CGFloatMax(v18 - MaxY + 24.0));
  objc_msgSend(v19, sel_bounds);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v36.origin.x = v21;
  v36.origin.y = v23;
  v36.size.width = v25;
  v36.size.height = v27;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v29 = CGRectGetMaxX(v37);
  CGFloatMax(v29 - MaxX + 64.0);
  objc_msgSend(v0, sel_frame);
  CGRectGetWidth(v38);
  objc_msgSend(v0, sel_frame);
  CGRectGetHeight(v39);
  return v31;
}

void *sub_237EB10D8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_237EE30D8();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

void sub_237EB116C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_237EE2EE0();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

id sub_237EB121C(double a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t inited;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v2 = (void *)*MEMORY[0x24BEBE210];
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_preferredFontDescriptorWithTextStyle_, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256898480);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237EE55E0;
  v7 = (void *)*MEMORY[0x24BEBB590];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB590];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C408);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_237EE55E0;
  v9 = (void *)*MEMORY[0x24BEBB620];
  *(_QWORD *)(v8 + 32) = *MEMORY[0x24BEBB620];
  *(_QWORD *)(v8 + 40) = *MEMORY[0x24BEBB600];
  v10 = v5;
  v11 = v7;
  v12 = v9;
  v13 = sub_237EAB5E0(v8);
  *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C410);
  *(_QWORD *)(inited + 40) = v13;
  sub_237EAB168(inited);
  type metadata accessor for AttributeName(0);
  sub_237E24090();
  v14 = (void *)sub_237EE29F4();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v10, sel_fontDescriptorByAddingAttributes_, v14);

  v16 = objc_allocWithZone(MEMORY[0x24BE16F30]);
  v17 = v15;
  v18 = objc_msgSend(v16, sel_init);
  v19 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v17, a1);

  objc_msgSend(v18, sel_setFont_, v19);
  objc_msgSend(v18, sel_setUppercase_, 1);

  return v18;
}

id sub_237EB1448()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ClockFaceController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25689DFE0 = (uint64_t)result;
  return result;
}

uint64_t sub_237EB149C()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (!v1)
    return 0;
  v2 = sub_237EE2A84();
  v4 = v3;

  if (v2 == 0xD000000000000024 && v4 == 0x8000000237EF01E0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_237EE31BC();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
}

ValueMetadata *type metadata accessor for PlayClockFace()
{
  return &type metadata for PlayClockFace;
}

uint64_t sub_237EB1590()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237EB15A0@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  char v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _BYTE *v23;
  id v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t *v28;
  _BYTE v30[4];
  int v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = HIBYTE(a2);
  v35 = a3;
  v5 = a2 & 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C478);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v30[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C480);
  MEMORY[0x24BDAC7A8](v33);
  v10 = &v30[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C488);
  MEMORY[0x24BDAC7A8](v34);
  v12 = &v30[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *v8 = 0x403E000000000000;
  v32 = (char *)v8 + *(int *)(v6 + 44);
  v13 = swift_retain();
  LOBYTE(v6) = v5;
  v31 = v5;
  sub_237EC3F88(v13, v5);
  swift_release();
  v14 = sub_237EB7CE0();
  swift_bridgeObjectRetain();
  swift_release();
  v15 = sub_237EB7834(v14);
  swift_bridgeObjectRelease();
  v36 = v15;
  swift_getKeyPath();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_BYTE *)(v16 + 24) = v6;
  *(_BYTE *)(v16 + 25) = v3 & 1;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = sub_237EB264C;
  *(_QWORD *)(v17 + 24) = v16;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C490);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C498);
  sub_237E22690(&qword_25689C4A0, &qword_25689C490, MEMORY[0x24BEE12D8]);
  sub_237E22690(&qword_25689C4A8, &qword_25689C498, MEMORY[0x24BDF44C8]);
  sub_237EE28B0();
  v18 = sub_237EE2928();
  v19 = swift_retain();
  sub_237EC3F88(v19, v31);
  swift_release();
  v20 = sub_237EB7CE0();
  swift_bridgeObjectRetain();
  swift_release();
  sub_237E22004((uint64_t)v8, (uint64_t)v10, &qword_25689C478);
  v21 = (uint64_t *)&v10[*(int *)(v33 + 36)];
  *v21 = v18;
  v21[1] = v20;
  sub_237E2209C((uint64_t)v8, &qword_25689C478);
  v22 = sub_237EE21C0();
  LOBYTE(v15) = sub_237EE252C();
  sub_237E22004((uint64_t)v10, (uint64_t)v12, &qword_25689C480);
  v23 = &v12[*(int *)(v34 + 36)];
  *(_QWORD *)v23 = v22;
  v23[8] = v15;
  sub_237E2209C((uint64_t)v10, &qword_25689C480);
  if (qword_256897AF0 != -1)
    swift_once();
  v24 = (id)qword_25689DF18;
  v25 = sub_237EE2574();
  KeyPath = swift_getKeyPath();
  v27 = v35;
  sub_237E22004((uint64_t)v12, v35, &qword_25689C488);
  v28 = (uint64_t *)(v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689C4B0) + 36));
  *v28 = KeyPath;
  v28[1] = v25;
  return sub_237E2209C((uint64_t)v12, &qword_25689C488);
}

uint64_t sub_237EB194C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W4>, uint64_t a5@<X8>)
{
  int v9;
  uint64_t v10;
  char v11;
  char v12;
  id v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  CGRect v24;

  v9 = (a1 == 2) & (a4 >> 8);
  type metadata accessor for PlayViewModel();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  swift_bridgeObjectRetain();
  v10 = sub_237EE20B8();
  v12 = v11;
  v13 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v13, sel_bounds);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  CGRectGetHeight(v24);
  sub_237EE210C();
  sub_237EE210C();
  v22 = sub_237EE2100();
  swift_release();
  swift_release();
  *(_QWORD *)a5 = a2;
  *(_QWORD *)(a5 + 8) = a3;
  *(_QWORD *)(a5 + 16) = a1;
  *(_BYTE *)(a5 + 24) = v9;
  *(_QWORD *)(a5 + 32) = v10;
  *(_BYTE *)(a5 + 40) = v12 & 1;
  *(_QWORD *)(a5 + 48) = v22;
  *(_QWORD *)(a5 + 56) = a2;
  *(_QWORD *)(a5 + 64) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB1ABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  if (*(_BYTE *)(v1 + 9))
    v2 = 256;
  else
    v2 = 0;
  return sub_237EB15A0(*(_QWORD *)v1, v2 | *(unsigned __int8 *)(v1 + 8), a1);
}

double sub_237EB1AE4(uint64_t a1, char a2)
{
  double result;

  result = *(double *)&a1;
  if ((a2 & 1) != 0)
    return 10.0;
  return result;
}

uint64_t sub_237EB1B04(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double *v9;

  return sub_237EB2DC8(a9, a1, a2, a3, a4, *v9);
}

uint64_t sub_237EB1B14()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;

  v1 = v0;
  sub_237EB2B58();
  sub_237EB2B9C();
  swift_bridgeObjectRetain();
  sub_237EE24B4();
  v2 = *(_BYTE *)(v0 + 40);
  v3 = swift_retain();
  sub_237EC3F88(v3, v2);
  swift_release();
  v4 = sub_237EB4C54();
  result = swift_release();
  v6 = *(_QWORD *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v6 < *(_QWORD *)(v4 + 16))
  {
    swift_retain();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    sub_237EE2928();
    sub_237EE291C();
    v7 = swift_release();
    MEMORY[0x24BDAC7A8](v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C520);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C528);
    sub_237EB2BF0();
    sub_237EB2D44();
    sub_237EE2694();
    swift_release();
    sub_237E7E5F0();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_237EB1D28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v6 = *(_BYTE *)(a2 + 40);
  v7 = swift_retain();
  sub_237EC3F88(v7, v6);
  swift_release();
  sub_237EB484C();
  v9 = v8;
  result = swift_release();
  v11 = *(_QWORD *)(a2 + 16);
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v11 < *(_QWORD *)(v9 + 16))
  {
    v12 = *(_QWORD *)(v9 + 8 * v11 + 32);
    swift_bridgeObjectRelease();
    sub_237EE2994();
    v14 = v13;
    v16 = v15;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C568);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a3, a1, v17);
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C528);
    v18 = (_QWORD *)(a3 + *(int *)(result + 36));
    *v18 = v12;
    v18[1] = v14;
    v18[2] = v16;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_237EB1E1C()
{
  return sub_237EB1B14();
}

uint64_t sub_237EB1E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  _QWORD v23[2];

  v6 = sub_237EE21D8();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237EE294C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  v23[0] = a1;
  v23[1] = a2;
  sub_237E33174();
  swift_bridgeObjectRetain();
  v14 = sub_237EE25F8();
  v16 = v15;
  v18 = v17;
  v20 = v19 & 1;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDF50D8], v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5E0);
  sub_237EB37FC((uint64_t)v8, a3 + *(int *)(v21 + 36));
  *(_QWORD *)a3 = v14;
  *(_QWORD *)(a3 + 8) = v16;
  *(_BYTE *)(a3 + 16) = v20;
  *(_QWORD *)(a3 + 24) = v18;
  *(_QWORD *)(a3 + 32) = KeyPath;
  *(_BYTE *)(a3 + 40) = 0;
  sub_237E21EAC(v14, v16, v20);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_237EB3840((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_237E21F3C(v14, v16, v20);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB2008@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_237EB1E54(*v1, v1[1], a1);
}

uint64_t sub_237EB2010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v44[12];
  int v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t KeyPath;
  uint64_t v58;
  uint64_t v59;

  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5C0);
  MEMORY[0x24BDAC7A8](v48);
  v7 = &v44[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_237EE28F8();
  v49 = *(_QWORD *)(v8 - 8);
  v50 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v44[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5C8);
  MEMORY[0x24BDAC7A8](v47);
  v12 = (uint64_t *)&v44[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5D0);
  MEMORY[0x24BDAC7A8](v51);
  v14 = &v44[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v56 = &v44[-v16];
  KeyPath = swift_getKeyPath();
  v58 = a1;
  v55 = a1;
  v59 = a2;
  v17 = sub_237E33174();
  swift_bridgeObjectRetain();
  v46 = v17;
  v18 = sub_237EE25F8();
  v52 = v19;
  v53 = v18;
  v21 = v20;
  v54 = v22;
  sub_237EE2724();
  v23 = sub_237EE273C();
  swift_release();
  if (qword_256897B50 != -1)
    swift_once();
  v45 = v21 & 1;
  v24 = (id)qword_25689DFE0;
  sub_237EE28EC();

  v25 = sub_237EE252C();
  v27 = v49;
  v26 = v50;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v49 + 16))(v7, v10, v50);
  v7[*(int *)(v48 + 36)] = v25;
  sub_237E22004((uint64_t)v7, (uint64_t)v12 + *(int *)(v47 + 36), &qword_25689C5C0);
  *v12 = v23;
  v12[1] = 0xBFF0000000000000;
  swift_retain();
  sub_237E2209C((uint64_t)v7, &qword_25689C5C0);
  (*(void (**)(_BYTE *, uint64_t))(v27 + 8))(v10, v26);
  swift_release();
  v28 = swift_getKeyPath();
  v58 = v55;
  v59 = a2;
  swift_bridgeObjectRetain();
  v29 = sub_237EE25F8();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v36 = sub_237EE2700();
  sub_237E22004((uint64_t)v12, (uint64_t)v14, &qword_25689C5C8);
  v37 = &v14[*(int *)(v51 + 36)];
  *(_QWORD *)v37 = v29;
  *((_QWORD *)v37 + 1) = v31;
  v37[16] = v33 & 1;
  *((_QWORD *)v37 + 3) = v35;
  *((_QWORD *)v37 + 4) = v28;
  v37[40] = 0;
  *((_QWORD *)v37 + 6) = v36;
  sub_237E2209C((uint64_t)v12, &qword_25689C5C8);
  v38 = v56;
  sub_237E21FC0((uint64_t)v14, (uint64_t)v56, &qword_25689C5D0);
  sub_237E22004((uint64_t)v38, (uint64_t)v14, &qword_25689C5D0);
  v40 = v52;
  v39 = v53;
  *(_QWORD *)a3 = v53;
  *(_QWORD *)(a3 + 8) = v40;
  LOBYTE(v36) = v45;
  *(_BYTE *)(a3 + 16) = v45;
  v41 = KeyPath;
  *(_QWORD *)(a3 + 24) = v54;
  *(_QWORD *)(a3 + 32) = v41;
  *(_BYTE *)(a3 + 40) = 0;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5D8);
  sub_237E22004((uint64_t)v14, a3 + *(int *)(v42 + 48), &qword_25689C5D0);
  sub_237E21EAC(v39, v40, v36);
  swift_bridgeObjectRetain();
  j__swift_retain();
  sub_237E2209C((uint64_t)v38, &qword_25689C5D0);
  sub_237E2209C((uint64_t)v14, &qword_25689C5D0);
  sub_237E21F3C(v39, v40, v36);
  swift_bridgeObjectRelease();
  return j__swift_release();
}

unint64_t sub_237EB240C()
{
  return 0xD000000000000016;
}

uint64_t sub_237EB2428@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *v1;
  v6 = v1[1];
  *v5 = sub_237EE2904();
  v5[1] = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C5B0);
  sub_237EB2010(v7, v6, (uint64_t)v5 + *(int *)(v9 + 44));
  sub_237E22004((uint64_t)v5, a1, &qword_25689C5A8);
  *(_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689C5B8) + 36)) = 0x3FF0000000000000;
  return sub_237E2209C((uint64_t)v5, &qword_25689C5A8);
}

uint64_t sub_237EB24F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  char v6;

  v2 = sub_237EE2904();
  v4 = v3;
  type metadata accessor for PlayViewModel();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  result = sub_237EE20B8();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = result;
  *(_BYTE *)(a1 + 24) = v6 & 1;
  *(_BYTE *)(a1 + 25) = 1;
  return result;
}

unint64_t sub_237EB2574(uint64_t a1)
{
  unint64_t result;

  result = sub_237EB2598();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237EB2598()
{
  unint64_t result;

  result = qword_25689C460;
  if (!qword_25689C460)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC48C, &type metadata for PlayClockFace);
    atomic_store(result, (unint64_t *)&qword_25689C460);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayClockFace.TimeView()
{
  return &type metadata for PlayClockFace.TimeView;
}

uint64_t sub_237EB25EC()
{
  return sub_237E22690(&qword_25689C468, &qword_25689C470, MEMORY[0x24BDF4750]);
}

uint64_t sub_237EB2618()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237EB2628()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EB264C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  int v5;

  if (*(_BYTE *)(v4 + 25))
    v5 = 256;
  else
    v5 = 0;
  return sub_237EB194C(a1, a2, a3, v5 | *(unsigned __int8 *)(v4 + 24), a4);
}

uint64_t sub_237EB2674()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EB2698(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*a1, a1[1], a1[2]);
}

uint64_t destroy for PlayClockFace.RotatableCharacter()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for PlayClockFace.RotatableCharacter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PlayClockFace.RotatableCharacter(uint64_t a1, uint64_t a2)
{
  char v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PlayClockFace.RotatableCharacter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlayClockFace.RotatableCharacter(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlayClockFace.RotatableCharacter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayClockFace.RotatableCharacter()
{
  return &type metadata for PlayClockFace.RotatableCharacter;
}

ValueMetadata *type metadata accessor for PlayClockFace.OverlapLayout()
{
  return &type metadata for PlayClockFace.OverlapLayout;
}

unint64_t sub_237EB28D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C4B8;
  if (!qword_25689C4B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C4B0);
    v2[0] = sub_237E4F3F4(&qword_25689C4C0, &qword_25689C488, (uint64_t (*)(void))sub_237EB297C, MEMORY[0x24BDF1050]);
    v2[1] = sub_237E22690(&qword_256898A98, &qword_256898A88, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C4B8);
  }
  return result;
}

unint64_t sub_237EB297C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C4C8;
  if (!qword_25689C4C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C480);
    v2[0] = sub_237EB2A00();
    v2[1] = sub_237E22690(&qword_25689C4F8, &qword_25689C500, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C4C8);
  }
  return result;
}

unint64_t sub_237EB2A00()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C4D0;
  if (!qword_25689C4D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C478);
    v2[0] = sub_237E22690(&qword_25689C4D8, &qword_25689C4E0, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_237EB2A84();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C4D0);
  }
  return result;
}

unint64_t sub_237EB2A84()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25689C4E8;
  if (!qword_25689C4E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C4F0);
    v2 = sub_237E22690(&qword_25689C4A8, &qword_25689C498, MEMORY[0x24BDF44C8]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25689C4E8);
  }
  return result;
}

unint64_t sub_237EB2B04()
{
  unint64_t result;

  result = qword_25689C508;
  if (!qword_25689C508)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC5D4, &type metadata for PlayClockFace.OverlapLayout);
    atomic_store(result, (unint64_t *)&qword_25689C508);
  }
  return result;
}

uint64_t sub_237EB2B48()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_237EB2B58()
{
  unint64_t result;

  result = qword_25689C510;
  if (!qword_25689C510)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC794, &type metadata for PlayClockFace.BlurredSeparator);
    atomic_store(result, (unint64_t *)&qword_25689C510);
  }
  return result;
}

unint64_t sub_237EB2B9C()
{
  unint64_t result;

  result = qword_25689C518;
  if (!qword_25689C518)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC744, &type metadata for PlayClockFace.Character);
    atomic_store(result, (unint64_t *)&qword_25689C518);
  }
  return result;
}

uint64_t sub_237EB2BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_237EB1D28(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_237EB2BF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C530;
  if (!qword_25689C530)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C520);
    v2[0] = sub_237EB2C74();
    v2[1] = sub_237E22690(&qword_256898098, &qword_2568980A0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C530);
  }
  return result;
}

unint64_t sub_237EB2C74()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25689C538;
  if (!qword_25689C538)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C540);
    v2 = sub_237EB2CD8();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25689C538);
  }
  return result;
}

unint64_t sub_237EB2CD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C548;
  if (!qword_25689C548)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C550);
    v2[0] = sub_237EB2B58();
    v2[1] = sub_237EB2B9C();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C548);
  }
  return result;
}

unint64_t sub_237EB2D44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C558;
  if (!qword_25689C558)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C528);
    v2[0] = sub_237E22690(&qword_25689C560, &qword_25689C568, MEMORY[0x24BDEFDC0]);
    v2[1] = MEMORY[0x24BDED5D8];
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C558);
  }
  return result;
}

uint64_t sub_237EB2DC8(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
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
  uint64_t (*v17)(uint64_t);
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
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  void (*v33)(_QWORD *, _QWORD);
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  double v51;
  double v52;
  uint64_t v53;
  double *v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(_QWORD *, _QWORD);
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unsigned int (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  _QWORD *v86;
  int v87;
  unint64_t v88;
  uint64_t v89;
  double v90;
  char v91;
  char v92;
  char *v93;
  char *v94;
  _QWORD *v95;
  void (*v96)(char *, uint64_t, uint64_t);
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  CGRect v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  _QWORD v113[4];
  uint64_t v114;

  v102.size.height = a5;
  v102.size.width = a4;
  v102.origin.y = a3;
  v102.origin.x = a2;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C570);
  v101 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v94 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C578);
  MEMORY[0x24BDAC7A8](v10);
  v109 = (uint64_t)&v93 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C580);
  MEMORY[0x24BDAC7A8](v12);
  v95 = (char **)((char *)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v14);
  v108 = (char **)((char *)&v93 - v15);
  v16 = sub_237EE216C();
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778];
  v97 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v98 = (char *)&v93 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C588);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v93 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C590);
  MEMORY[0x24BDAC7A8](v100);
  v106 = (uint64_t)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_237EE2160();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v93 = (char *)&v93 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v93 - v27;
  v29 = sub_237E20E98(qword_2568989A0, v17, MEMORY[0x24BDEC7A0]);
  v110 = v16;
  v30 = sub_237EE2D30();
  v111 = v23;
  v107 = v29;
  v105 = a1;
  if (v30)
  {
    v31 = v30;
    v114 = MEMORY[0x24BEE4AF8];
    sub_237E62784(0, v30 & ~(v30 >> 63), 0);
    result = sub_237EE2D24();
    if (v31 < 0)
      goto LABEL_34;
    v104 = (_QWORD *)v8;
    do
    {
      v33 = (void (*)(_QWORD *, _QWORD))sub_237EE2D60();
      (*(void (**)(char *))(v24 + 16))(v28);
      v33(v113, 0);
      sub_237EE21CC();
      LOBYTE(v113[0]) = v34 & 1;
      v112 = v35 & 1;
      sub_237EE2148();
      v37 = v36;
      v39 = v38;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v23);
      v40 = v114;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_237E62784(0, *(_QWORD *)(v40 + 16) + 1, 1);
        v40 = v114;
      }
      v42 = *(_QWORD *)(v40 + 16);
      v41 = *(_QWORD *)(v40 + 24);
      if (v42 >= v41 >> 1)
      {
        sub_237E62784(v41 > 1, v42 + 1, 1);
        v40 = v114;
      }
      *(_QWORD *)(v40 + 16) = v42 + 1;
      v43 = v40 + 16 * v42;
      *(_QWORD *)(v43 + 32) = v37;
      *(_QWORD *)(v43 + 40) = v39;
      sub_237EE2D54();
      --v31;
      v8 = (uint64_t)v104;
      v23 = v111;
    }
    while (v31);
    v103 = v40;
  }
  else
  {
    v103 = MEMORY[0x24BEE4AF8];
  }
  v44 = *(_QWORD *)(v103 + 16);
  v45 = a6;
  v46 = (uint64_t)v95;
  v47 = v105;
  if (!v44)
    goto LABEL_19;
  if (v44 == 1)
  {
    v48 = 0;
    v45 = a6;
  }
  else
  {
    v48 = v44 & 0x7FFFFFFFFFFFFFFELL;
    v49 = (double *)(v103 + 48);
    v50 = v44 & 0x7FFFFFFFFFFFFFFELL;
    v45 = a6;
    do
    {
      v51 = *(v49 - 2);
      v52 = *v49;
      v49 += 4;
      v45 = v45 + v51 - a6 + v52 - a6;
      v50 -= 2;
    }
    while (v50);
    if (v44 == v48)
      goto LABEL_19;
  }
  v53 = v44 - v48;
  v54 = (double *)(v103 + 16 * v48 + 32);
  do
  {
    v55 = *v54;
    v54 += 2;
    v45 = v45 + v55 - a6;
    --v53;
  }
  while (v53);
LABEL_19:
  v56 = (CGRectGetWidth(v102) - v45) * 0.5;
  v57 = v97;
  v58 = v110;
  v96 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
  v96(v21, v47, v110);
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v98, v21, v58);
  sub_237E20E98(&qword_25689C598, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC778], MEMORY[0x24BDEC798]);
  v59 = v106;
  sub_237EE2B8C();
  v60 = *(int *)(v100 + 36);
  *(_QWORD *)(v59 + v60) = 0;
  v61 = (_QWORD *)(v59 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689C5A0) + 36));
  v100 = v103 + 32;
  v105 = v24;
  v99 = v28;
  v104 = v61;
  while (1)
  {
    v62 = *v61;
    v63 = v106;
    sub_237EE2D48();
    if (v62 == v113[0])
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v109, 1, 1, v111);
LABEL_23:
      sub_237E2209C(v109, &qword_25689C578);
      v77 = v101;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v101 + 56))(v46, 1, 1, v8);
      goto LABEL_26;
    }
    v64 = v8;
    v65 = v110;
    v66 = (void (*)(_QWORD *, _QWORD))sub_237EE2D60();
    v67 = *(void (**)(uint64_t))(v24 + 16);
    v68 = v60;
    v69 = v46;
    v70 = v109;
    v71 = v24;
    v72 = v111;
    v67(v109);
    v66(v113, 0);
    v73 = v98;
    v96(v98, v63, v65);
    sub_237EE2D54();
    v74 = v65;
    v8 = v64;
    v61 = v104;
    (*(void (**)(char *, uint64_t))(v97 + 8))(v73, v74);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v71 + 56))(v70, 0, 1, v72);
    v75 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48);
    v28 = v99;
    v76 = v70;
    v46 = v69;
    v60 = v68;
    if (v75(v76, 1, v72) == 1)
      goto LABEL_23;
    v77 = v101;
    v78 = *(void (**)(char *, uint64_t, uint64_t))(v105 + 32);
    v79 = v93;
    v80 = v111;
    v78(v93, v109, v111);
    v81 = &v94[*(int *)(v8 + 48)];
    v82 = v8;
    v83 = v106;
    v84 = *(_QWORD *)(v106 + v60);
    result = ((uint64_t (*)(char *, char *, uint64_t))v78)(v81, v79, v80);
    if (__OFADD__(v84, 1))
      goto LABEL_33;
    *(_QWORD *)(v83 + v60) = v84 + 1;
    v46 = (uint64_t)v95;
    v85 = (char *)v95 + *(int *)(v82 + 48);
    *v95 = v84;
    v78(v85, (uint64_t)v81, v80);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v77 + 56))(v46, 0, 1, v82);
    v8 = v82;
    v28 = v99;
    v61 = v104;
LABEL_26:
    v86 = v108;
    sub_237E21FC0(v46, (uint64_t)v108, &qword_25689C580);
    v87 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v77 + 48))(v86, 1, v8);
    v24 = v105;
    if (v87 == 1)
    {
      sub_237E2209C(v106, &qword_25689C590);
      return swift_bridgeObjectRelease();
    }
    v88 = *v108;
    v89 = v111;
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v105 + 32))(v28, (uint64_t)v108 + *(int *)(v8 + 48), v111);
    if ((v88 & 0x8000000000000000) != 0)
      break;
    if (v88 >= *(_QWORD *)(v103 + 16))
      goto LABEL_32;
    v90 = *(double *)(v100 + 16 * v88);
    CGRectGetHeight(v102);
    sub_237EE2994();
    sub_237EE21CC();
    LOBYTE(v113[0]) = v91 & 1;
    LOBYTE(v114) = v92 & 1;
    sub_237EE2154();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v89);
    v56 = v56 + v90 - a6;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PlayClockFace.Character()
{
  return &type metadata for PlayClockFace.Character;
}

ValueMetadata *type metadata accessor for PlayClockFace.BlurredSeparator()
{
  return &type metadata for PlayClockFace.BlurredSeparator;
}

uint64_t sub_237EB371C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C520);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C528);
  sub_237EB2BF0();
  sub_237EB2D44();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237EB378C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237EB379C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237EB37AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_237EE2328();
  *a1 = result;
  return result;
}

uint64_t sub_237EB37D4()
{
  swift_retain();
  return sub_237EE2334();
}

uint64_t sub_237EB37FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE21D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EB3840(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_237EE21D8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_237EB3880()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689C5E8;
  if (!qword_25689C5E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689C5B8);
    v2[0] = sub_237E22690(&qword_25689C5F0, &qword_25689C5A8, MEMORY[0x24BDF4750]);
    v2[1] = sub_237E22690(&qword_25689B3C8, &qword_25689B3D0, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689C5E8);
  }
  return result;
}

uint64_t sub_237EB391C()
{
  return sub_237E4F3F4(&qword_25689C5F8, &qword_25689C5E0, (uint64_t (*)(void))sub_237EB3950, MEMORY[0x24BDEDB58]);
}

unint64_t sub_237EB3950()
{
  unint64_t result;

  result = qword_25689C600;
  if (!qword_25689C600)
  {
    result = MEMORY[0x23B8271D0](&unk_237EE77D0, &type metadata for FittedText);
    atomic_store(result, (unint64_t *)&qword_25689C600);
  }
  return result;
}

uint64_t sub_237EB399C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_256897E18, (uint64_t (*)(uint64_t))type metadata accessor for RollingClockViewModel, (uint64_t)&unk_237EE4558);
  sub_237EE1F20();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC11ClockPoster21RollingClockViewModel__timeString;
  swift_beginAccess();
  return sub_237E21EBC(v4, a2, type metadata accessor for TimeString);
}

uint64_t sub_237EB3A54(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v4 = type metadata accessor for TimeString(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_237E21EBC(a1, (uint64_t)v6, v7);
  v8 = *a2;
  swift_getKeyPath();
  v11 = v8;
  v12 = v6;
  v13 = v8;
  sub_237E20E98(&qword_256897E18, (uint64_t (*)(uint64_t))type metadata accessor for RollingClockViewModel, (uint64_t)&unk_237EE4558);
  sub_237EE1F14();
  swift_release();
  return sub_237E3B63C((uint64_t)v6);
}

uint64_t sub_237EB3B4C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v13;
  __int128 v14[6];
  _OWORD v15[6];
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237EB5DA8();
  sub_237EE32D0();
  if (!v2)
  {
    sub_237E471FC();
    sub_237EE312C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_237E2D180(v14, (uint64_t)v15);
    v9 = v15[5];
    *(_OWORD *)(a2 + 64) = v15[4];
    *(_OWORD *)(a2 + 80) = v9;
    *(_BYTE *)(a2 + 96) = v16;
    v10 = v15[1];
    *(_OWORD *)a2 = v15[0];
    *(_OWORD *)(a2 + 16) = v10;
    v11 = v15[3];
    *(_OWORD *)(a2 + 32) = v15[2];
    *(_OWORD *)(a2 + 48) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_237EB3C94()
{
  sub_237EB5DA8();
  return sub_237EE3324();
}

uint64_t sub_237EB3CBC()
{
  sub_237EB5DA8();
  return sub_237EE3330();
}

uint64_t sub_237EB3CE4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_237EB3B4C(a1, a2);
}

uint64_t sub_237EB3CF8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9B8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237EB5DA8();
  sub_237EE32DC();
  sub_237E47240();
  sub_237EE3168();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_237EB3DEC()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  return swift_retain();
}

uint64_t sub_237EB3E74@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_237EB3F04()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  swift_retain();
  sub_237EE1F14();
  swift_release();
  return swift_release();
}

uint64_t sub_237EB3FBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = type metadata accessor for TimeString(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getKeyPath();
  v12 = v0;
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  v4 = *(_QWORD *)(v0 + 16);
  swift_getKeyPath();
  v12 = v4;
  sub_237E20E98(&qword_256897E18, (uint64_t (*)(uint64_t))type metadata accessor for RollingClockViewModel, (uint64_t)&unk_237EE4558);
  swift_retain();
  sub_237EE1F20();
  swift_release();
  v5 = v4 + OBJC_IVAR____TtC11ClockPoster21RollingClockViewModel__timeString;
  swift_beginAccess();
  sub_237E21EBC(v5, (uint64_t)v3, type metadata accessor for TimeString);
  swift_release();
  v6 = sub_237EE2AD8();
  v7 = *v3;
  if (v6 == 2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v10 = 9142498;
    v11 = 0xA300000000000000;
    sub_237EE2AF0();
    v7 = v10;
  }
  sub_237E3B63C((uint64_t)v3);
  return v7;
}

uint64_t sub_237EB4170()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_237EB4204@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  v4 = *(_QWORD *)(v3 + 32);
  *a2 = *(_QWORD *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB4294()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  swift_bridgeObjectRetain();
  sub_237EE1F14();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB4350()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F14();
  swift_release();
  swift_getKeyPath();
  sub_237EE1F14();
  swift_release();
  sub_237EB3FBC();
  swift_getKeyPath();
  sub_237EE1F14();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB44AC()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB4534@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB45C4()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  swift_bridgeObjectRetain();
  sub_237EE1F14();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB467C()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB4704@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB4794()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  swift_bridgeObjectRetain();
  sub_237EE1F14();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_237EB484C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t KeyPath;
  _QWORD v7[2];
  __int128 v8;
  double (*v9)@<D0>(uint64_t *@<X0>, double *@<X8>);
  uint64_t v10;

  v1 = v0;
  v2 = sub_237EB3FBC();
  v4 = v3;
  swift_getKeyPath();
  v7[0] = v0;
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  if (v2 == *(_QWORD *)(v0 + 24) && v4 == *(_QWORD *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_237EE31BC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
      sub_237EB4350();
  }
  swift_getKeyPath();
  v7[0] = v1;
  sub_237EE1F20();
  swift_release();
  if (*(_QWORD *)(v1 + 48))
    goto LABEL_9;
  v7[0] = sub_237EB5FD4((int64_t *)0xFFFFFFFFFFFFFFFBLL, 5);
  sub_237EB7228();
  if (*(_QWORD *)(v7[0] + 16) >= 5uLL)
  {
    v7[1] = v7[0] + 32;
    v8 = xmmword_237EEC820;
    v9 = sub_237EB4A68;
    v10 = 0;
    sub_237EB79E8(v7);
    swift_release();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    swift_retain();
    sub_237EE1F14();
    swift_release();
    swift_release();
LABEL_9:
    swift_bridgeObjectRetain();
    return;
  }
  __break(1u);
}

double sub_237EB4A68@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result;

  result = (double)*a1 * 0.0174532925;
  *a2 = result;
  return result;
}

uint64_t sub_237EB4A84()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB4B0C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 56);
  return swift_bridgeObjectRetain();
}

uint64_t sub_237EB4B9C()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  swift_bridgeObjectRetain();
  sub_237EE1F14();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB4C54()
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
  uint64_t KeyPath;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29[8];
  _BYTE v30[104];
  _QWORD v31[12];
  unsigned __int8 v32;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237EE1FB0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v31[0] = v0;
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  if (*(_QWORD *)(v0 + 56))
  {
    v9 = *(_QWORD *)(v0 + 56);
LABEL_6:
    swift_bridgeObjectRetain();
    return v9;
  }
  v25 = v4;
  v26 = v6;
  v27 = v5;
  v28 = v8;
  swift_getKeyPath();
  v31[0] = v0;
  sub_237EE1F20();
  swift_release();
  swift_beginAccess();
  sub_237E29CD0(v0 + 64, (uint64_t)v30);
  sub_237E28430((uint64_t)v30, (uint64_t)v31);
  sub_237E2A078((uint64_t)v30);
  sub_237EB80F4((uint64_t)v31);
  sub_237E2846C((uint64_t)v31);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  v31[0] = v0;
  sub_237EE1F14();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v31[0] = v0;
  sub_237EE1F20();
  swift_release();
  if (!*(_QWORD *)(v0 + 56))
  {
    v24 = v0 + 64;
    if (qword_2542C6458 != -1)
      goto LABEL_19;
    goto LABEL_8;
  }
  swift_getKeyPath();
  v31[0] = v0;
  sub_237EE1F20();
  swift_release();
  v9 = *(_QWORD *)(v0 + 56);
  if (v9)
  {
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  __break(1u);
LABEL_11:
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v25, v27);
  while (1)
  {
    swift_retain_n();
    v15 = sub_237EE1F98();
    v16 = sub_237EE2D90();
    LODWORD(v25) = v16;
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v29[0] = v18;
      *(_DWORD *)v17 = 136315138;
      v23[1] = v17 + 4;
      swift_getKeyPath();
      v31[0] = v1;
      sub_237EE1F20();
      swift_release();
      sub_237E29CD0(v24, (uint64_t)v30);
      sub_237E28430((uint64_t)v30, (uint64_t)v31);
      sub_237E2A078((uint64_t)v30);
      v19 = sub_237E269C0();
      v21 = v20;
      sub_237E2846C((uint64_t)v31);
      v31[0] = sub_237E2A660(v19, v21, v29);
      sub_237EE2EE0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237E17000, v15, (os_log_type_t)v25, "unsupported look for Play: %s, choosing default", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v18, -1, -1);
      MEMORY[0x23B8272A8](v17, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v27);
    v22 = sub_237E353DC();
    if (!*(_QWORD *)(v22 + 16))
    {
      memset(v31, 0, sizeof(v31));
      v32 = -1;
      swift_bridgeObjectRelease();
      __break(1u);
    }
    sub_237E28430(v22 + 32, (uint64_t)v31);
    swift_bridgeObjectRelease();
    if (v32 != 255)
      break;
    __break(1u);
LABEL_19:
    swift_once();
LABEL_8:
    v12 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    v13 = v12;
    v14 = (uint64_t)v25;
    sub_237E2CAA0(v13, (uint64_t)v25);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v14, 1, v27) != 1)
      goto LABEL_11;
    sub_237E6072C((uint64_t)v28);
    sub_237E4B270((uint64_t)v25);
  }
  result = sub_237EE309C();
  __break(1u);
  return result;
}

uint64_t sub_237EB51E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  swift_beginAccess();
  return sub_237E29CD0(v1 + 64, a1);
}

uint64_t sub_237EB528C(uint64_t a1, __int128 *a2)
{
  uint64_t v3;

  v3 = a1 + 64;
  swift_beginAccess();
  sub_237EB8A94(a2, v3);
  return swift_endAccess();
}

uint64_t (*sub_237EB52EC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_237EB5328()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 161);
}

uint64_t sub_237EB53C0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 161);
  return result;
}

uint64_t sub_237EB5460()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F14();
  return swift_release();
}

void (*sub_237EB5508(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC11ClockPoster13PlayViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_237EE1F38();
  swift_release();
  v4[7] = sub_237EB52EC();
  return sub_237EB55F0;
}

void sub_237EB55F0(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_237EE1F2C();
  swift_release();
  free(v1);
}

uint64_t sub_237EB5660()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  return *(unsigned __int8 *)(v0 + 162);
}

uint64_t sub_237EB56E4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 162);
  return result;
}

uint64_t sub_237EB5770()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F14();
  return swift_release();
}

uint64_t sub_237EB5818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237E2A078(v0 + 64);
  v1 = v0 + OBJC_IVAR____TtC11ClockPoster13PlayViewModel___observationRegistrar;
  v2 = sub_237EE1F50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_237EB5898()
{
  return type metadata accessor for PlayViewModel();
}

uint64_t type metadata accessor for PlayViewModel()
{
  uint64_t result;

  result = qword_25689C638;
  if (!qword_25689C638)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237EB58DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237EE1F50();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayViewModelContext()
{
  return &type metadata for PlayViewModelContext;
}

unint64_t sub_237EB5994(uint64_t a1)
{
  unint64_t result;

  result = sub_237EB59B8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237EB59B8()
{
  unint64_t result;

  result = qword_25689C8D8;
  if (!qword_25689C8D8)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC938, &type metadata for PlayViewModelContext);
    atomic_store(result, (unint64_t *)&qword_25689C8D8);
  }
  return result;
}

unint64_t sub_237EB59FC(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_237EB5A38();
  a1[2] = sub_237EB5A7C();
  a1[3] = sub_237EB5AC0();
  result = sub_237EB5B04();
  a1[4] = result;
  return result;
}

unint64_t sub_237EB5A38()
{
  unint64_t result;

  result = qword_25689C940;
  if (!qword_25689C940)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC960, &type metadata for PlayViewModelContext);
    atomic_store(result, (unint64_t *)&qword_25689C940);
  }
  return result;
}

unint64_t sub_237EB5A7C()
{
  unint64_t result;

  result = qword_25689C948;
  if (!qword_25689C948)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC9CC, &type metadata for PlayViewModelContext);
    atomic_store(result, (unint64_t *)&qword_25689C948);
  }
  return result;
}

unint64_t sub_237EB5AC0()
{
  unint64_t result;

  result = qword_25689C950;
  if (!qword_25689C950)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC9A4, &type metadata for PlayViewModelContext);
    atomic_store(result, (unint64_t *)&qword_25689C950);
  }
  return result;
}

unint64_t sub_237EB5B04()
{
  unint64_t result;

  result = qword_25689C958;
  if (!qword_25689C958)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEC97C, &type metadata for PlayViewModelContext);
    atomic_store(result, (unint64_t *)&qword_25689C958);
  }
  return result;
}

uint64_t sub_237EB5B48()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F14();
  return swift_release();
}

uint64_t sub_237EB5BF0()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F14();
  return swift_release();
}

void (*sub_237EB5C98(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_237EB5508(v2);
  return sub_237E23288;
}

uint64_t sub_237EB5CE0(uint64_t a1)
{
  uint64_t result;

  result = sub_237E20E98(&qword_25689C9A0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA30);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_237EB5D24()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 162) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_237EB5D44()
{
  return sub_237EB5D58();
}

uint64_t sub_237EB5D58()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 161) = v2;
  return result;
}

unint64_t sub_237EB5DA8()
{
  unint64_t result;

  result = qword_25689C9B0;
  if (!qword_25689C9B0)
  {
    result = MEMORY[0x23B8271D0](&unk_237EECCB4, &type metadata for PlayViewModelContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C9B0);
  }
  return result;
}

size_t sub_237EB5DEC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689A010);
  v3 = *(_QWORD *)(type metadata accessor for WorldViewModel.Pin(0) - 8);
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
      sub_237EB7538(&v11, (uint64_t)v6 + v5, v1, a1);
      v10 = v9;
      swift_bridgeObjectRetain();
      sub_237E24AD8();
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

uint64_t sub_237EB5F04(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_13;
  }
  v3 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v2 == -1)
    return MEMORY[0x24BEE4AF8];
  v5 = result;
  if (v3 <= 0)
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689A030);
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v8 = v7 - 32;
    if (v7 < 32)
      v8 = v7 - 25;
    v6[2] = v3;
    v6[3] = 2 * (v8 >> 3);
  }
  result = sub_237EB736C((uint64_t)&v9, (uint64_t)(v6 + 4), v3, v5, a2);
  if (result == v3)
    return (uint64_t)v6;
LABEL_14:
  __break(1u);
  return result;
}

int64_t *sub_237EB5FD4(int64_t *result, int64_t a2)
{
  uint64_t v2;
  int64_t v4;
  int64_t *v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8[3];

  v2 = a2 - (_QWORD)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v2)
      return (int64_t *)MEMORY[0x24BEE4AF8];
    v4 = (int64_t)result;
    if (v2 <= 0)
    {
      v5 = (int64_t *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689A030);
      v5 = (int64_t *)swift_allocObject();
      v6 = _swift_stdlib_malloc_size(v5);
      v7 = v6 - 32;
      if (v6 < 32)
        v7 = v6 - 25;
      v5[2] = v2;
      v5[3] = 2 * (v7 >> 3);
    }
    result = sub_237EB73F8(v8, v5 + 4, v2, v4, a2);
    if (result == (int64_t *)v2)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_237EB6098(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9D0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6200(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_237EB6850(a1, a2, a3, a4, &qword_2542C6468, &qword_2542C6540);
}

uint64_t sub_237EB6214(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6398(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9E0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6500(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9E8);
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
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB665C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689A010);
  v10 = *(_QWORD *)(type metadata accessor for WorldViewModel.Pin(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for WorldViewModel.Pin(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB683C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_237EB6850(a1, a2, a3, a4, &qword_256899E18, &qword_25689A048);
}

uint64_t sub_237EB6850(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v15 = (unint64_t)(v13 + 4);
  v16 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11)
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB69F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256899E00);
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
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6B50(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689A050);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6CAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542C6560);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6DF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256898100);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB6F60(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256899DF8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237EB70CC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689A030);
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
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

void sub_237EB7228()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = v2 - 2;
  if (v2 >= 2)
  {
    v4 = 0;
    while (1)
    {
      v13 = 0;
      MEMORY[0x23B8272B4](&v13, 8);
      v6 = (v13 * (unsigned __int128)v2) >> 64;
      if (v2 > v13 * v2)
      {
        v7 = -(uint64_t)v2 % v2;
        if (v7 > v13 * v2)
        {
          do
          {
            v13 = 0;
            MEMORY[0x23B8272B4](&v13, 8);
          }
          while (v7 > v13 * v2);
          v6 = (v13 * (unsigned __int128)v2) >> 64;
        }
      }
      v8 = v4 + v6;
      if (__OFADD__(v4, v6))
        break;
      if (v4 != v8)
      {
        v9 = *(_QWORD *)(v1 + 16);
        if (v4 >= v9)
          goto LABEL_19;
        if (v8 >= v9)
          goto LABEL_20;
        v10 = *(_QWORD *)(v1 + 32 + 8 * v4);
        v11 = *(_QWORD *)(v1 + 32 + 8 * v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_237EB7820(v1);
        v12 = *(_QWORD *)(v1 + 16);
        if (v4 >= v12)
          goto LABEL_21;
        *(_QWORD *)(v1 + 32 + 8 * v4) = v11;
        if (v8 >= v12)
          goto LABEL_22;
        *(_QWORD *)(v1 + 32 + 8 * v8) = v10;
        *v0 = v1;
      }
      --v2;
      if (v4++ == v3)
        return;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
}

uint64_t sub_237EB736C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;

  if (!a2)
  {
    v7 = 0;
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    v7 = 0;
LABEL_14:
    v8 = a4;
LABEL_15:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_QWORD *)(result + 16) = v8;
    *(_BYTE *)(result + 24) = v7;
    return a3;
  }
  if (a3 < 0)
    goto LABEL_17;
  v5 = 0;
  v6 = a4;
  while (1)
  {
    v7 = v6 == a5;
    if (v6 != a5)
      break;
    v8 = 0;
LABEL_8:
    *(_QWORD *)(a2 + 8 * v5) = v6;
    if (a3 - 1 == v5)
      goto LABEL_15;
    ++v5;
    v9 = v6 == a5;
    v6 = v8;
    if (v9)
    {
      v7 = 1;
      a3 = v5;
      goto LABEL_15;
    }
  }
  v8 = v6 + 1;
  if (!__OFADD__(v6, 1))
    goto LABEL_8;
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

int64_t *sub_237EB73F8(int64_t *result, int64_t *a2, uint64_t a3, int64_t a4, int64_t a5)
{
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int64_t *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64x2_t v14;
  int64x2_t *v15;
  int64x2_t v16;
  int64_t *v17;
  int64_t v18;

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
LABEL_6:
    v5 = a4;
LABEL_7:
    *result = a4;
    result[1] = a5;
    result[2] = v5;
    return (int64_t *)a3;
  }
  if (a3 < 0)
    goto LABEL_31;
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4)
    goto LABEL_32;
  v6 = a5 - a4;
  if (a5 > a4)
  {
    v5 = a4 + 1;
    *a2 = a4;
    if (a3 == 1)
      goto LABEL_7;
    if (v5 == a5)
    {
      a3 = 1;
      v5 = a5;
      goto LABEL_7;
    }
    v7 = v6 - 2;
    if (v6 - 2 >= (unint64_t)(a3 - 2))
      v7 = a3 - 2;
    if (v7 >= ~a4 + a5)
      v7 = ~a4 + a5;
    v8 = v7 + 1;
    if (v8 >= 5)
    {
      v11 = v8 & 3;
      if ((v8 & 3) == 0)
        v11 = 4;
      v12 = v8 - v11;
      v13 = v5 + v8 - v11;
      v10 = &a2[v8 - v11];
      v9 = v12 + 2;
      v14 = vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_237EE7820);
      v15 = (int64x2_t *)(a2 + 3);
      v16 = vdupq_n_s64(2uLL);
      do
      {
        v15[-1] = v14;
        *v15 = vaddq_s64(v14, v16);
        v14 = vaddq_s64(v14, vdupq_n_s64(4uLL));
        v15 += 2;
        v12 -= 4;
      }
      while (v12);
      v5 = v13;
    }
    else
    {
      v9 = 2;
      v10 = a2;
    }
    v17 = v10 + 1;
    while (v5 < a5)
    {
      v18 = v5 + 1;
      *v17 = v5;
      if (a3 == v9)
      {
        ++v5;
        goto LABEL_7;
      }
      ++v9;
      ++v17;
      ++v5;
      if (a5 == v18)
      {
        v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_237EB7538(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v8 = type metadata accessor for WorldViewModel.Pin(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v28 - v13;
  v16 = a4 + 64;
  v15 = *(_QWORD *)(a4 + 64);
  v31 = -1 << *(_BYTE *)(a4 + 32);
  if (-v31 < 64)
    v17 = ~(-1 << -(char)v31);
  else
    v17 = -1;
  v18 = v17 & v15;
  if (!a2)
  {
    v19 = 0;
LABEL_34:
    v27 = ~v31;
    *a1 = a4;
    a1[1] = v16;
    a1[2] = v27;
    a1[3] = v19;
    a1[4] = v18;
    return;
  }
  if (!a3)
  {
    v19 = 0;
    goto LABEL_34;
  }
  if (a3 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v30 = a1;
  v19 = 0;
  v20 = 0;
  v32 = a4 + 64;
  v33 = (unint64_t)(63 - v31) >> 6;
  v29 = v33 - 1;
  if (!v18)
    goto LABEL_9;
LABEL_8:
  v21 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  v22 = v21 | (v19 << 6);
  while (1)
  {
    ++v20;
    v26 = *(_QWORD *)(v9 + 72);
    sub_237E21EBC(*(_QWORD *)(a4 + 56) + v26 * v22, (uint64_t)v11, type metadata accessor for WorldViewModel.Pin);
    sub_237EB8A50((uint64_t)v11, (uint64_t)v14);
    sub_237EB8A50((uint64_t)v14, a2);
    if (v20 == a3)
      goto LABEL_33;
    a2 += v26;
    if (v18)
      goto LABEL_8;
LABEL_9:
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v23 >= v33)
    {
      v18 = 0;
LABEL_33:
      a1 = v30;
      v16 = v32;
      goto LABEL_34;
    }
    v16 = v32;
    v24 = *(_QWORD *)(v32 + 8 * v23);
    if (!v24)
      break;
LABEL_18:
    v18 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v23 << 6);
    v19 = v23;
  }
  v19 += 2;
  if (v23 + 1 >= v33)
  {
    v18 = 0;
    v19 = v23;
LABEL_39:
    a1 = v30;
    goto LABEL_34;
  }
  v24 = *(_QWORD *)(v32 + 8 * v19);
  if (v24)
    goto LABEL_14;
  v25 = v23 + 2;
  if (v23 + 2 >= v33)
    goto LABEL_36;
  v24 = *(_QWORD *)(v32 + 8 * v25);
  if (v24)
    goto LABEL_17;
  v19 = v23 + 3;
  if (v23 + 3 >= v33)
  {
    v18 = 0;
    v19 = v23 + 2;
    goto LABEL_39;
  }
  v24 = *(_QWORD *)(v32 + 8 * v19);
  if (v24)
  {
LABEL_14:
    v23 = v19;
    goto LABEL_18;
  }
  v25 = v23 + 4;
  if (v23 + 4 >= v33)
  {
LABEL_36:
    v18 = 0;
    goto LABEL_39;
  }
  v24 = *(_QWORD *)(v32 + 8 * v25);
  if (v24)
  {
LABEL_17:
    v23 = v25;
    goto LABEL_18;
  }
  while (1)
  {
    v23 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v23 >= v33)
    {
      v18 = 0;
      v19 = v29;
      goto LABEL_39;
    }
    v24 = *(_QWORD *)(v32 + 8 * v23);
    ++v25;
    if (v24)
      goto LABEL_18;
  }
LABEL_42:
  __break(1u);
}

uint64_t sub_237EB77E4(uint64_t a1)
{
  return sub_237EB6214(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_237EB77F8(uint64_t a1)
{
  return sub_237EB6500(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_237EB780C(_QWORD *a1)
{
  return sub_237EB665C(0, a1[2], 0, a1);
}

uint64_t sub_237EB7820(uint64_t a1)
{
  return sub_237EB70CC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_237EB7834(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(result + 16);
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v1)
  {
    result = swift_bridgeObjectRetain();
    v3 = 0;
    v4 = 0;
    v5 = v2 + 4;
    v6 = (uint64_t *)(result + 40);
    while (1)
    {
      v7 = *(v6 - 1);
      v8 = *v6;
      if (v3)
      {
        result = swift_bridgeObjectRetain();
        v9 = __OFSUB__(v3--, 1);
        if (v9)
          goto LABEL_28;
      }
      else
      {
        v10 = v2[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_29;
        v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1)
          v12 = 1;
        else
          v12 = v11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25689CA08);
        v13 = (_QWORD *)swift_allocObject();
        v14 = (uint64_t)(_swift_stdlib_malloc_size(v13) - 32) / 24;
        v13[2] = v12;
        v13[3] = 2 * v14;
        v15 = v13 + 4;
        v16 = v2[3] >> 1;
        v5 = &v13[3 * v16 + 4];
        v17 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        if (v2[2])
        {
          if (v13 != v2 || v15 >= &v2[3 * v16 + 4])
            memmove(v15, v2 + 4, 24 * v16);
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        result = swift_release();
        v2 = v13;
        v9 = __OFSUB__(v17, 1);
        v3 = v17 - 1;
        if (v9)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
      }
      v6 += 2;
      *v5 = v4;
      v5[1] = v7;
      v5[2] = v8;
      v5 += 3;
      if (v1 == ++v4)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_24;
      }
    }
  }
  v3 = 0;
LABEL_24:
  v19 = v2[3];
  if (v19 >= 2)
  {
    v20 = v19 >> 1;
    v9 = __OFSUB__(v20, v3);
    v21 = v20 - v3;
    if (v9)
      goto LABEL_30;
    v2[2] = v21;
  }
  return (uint64_t)v2;
}

_QWORD *sub_237EB79E8(_QWORD *result)
{
  __int128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  const void *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *(*v46)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[2];

  v1 = *((_OWORD *)result + 1);
  v49[0] = *(_OWORD *)result;
  v49[1] = v1;
  v2 = v1;
  v3 = *((_QWORD *)&v1 + 1) >> 1;
  v4 = (*((_QWORD *)&v1 + 1) >> 1) - v1;
  if (__OFSUB__(*((_QWORD *)&v1 + 1) >> 1, (_QWORD)v1))
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v5 = result;
  v6 = *((_QWORD *)&v49[0] + 1);
  if (v4 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9C8);
    v7 = (_QWORD *)swift_allocObject();
    v8 = v7 + 4;
    v9 = _swift_stdlib_malloc_size(v7);
    v10 = v9 - 32;
    if (v9 < 32)
      v10 = v9 - 25;
    v45 = *((_QWORD *)&v49[0] + 1);
    v11 = v10 >> 3;
    v7[2] = v4;
    v7[3] = 2 * (v10 >> 3);
    v12 = (v10 >> 3) & 0x7FFFFFFFFFFFFFFFLL;
    v46 = (_QWORD *(*)(uint64_t *__return_ptr, uint64_t *))v5[4];
    sub_237EB8914((uint64_t)v49);
    v13 = v2 + v12 - v3;
    v43 = v3;
    if (v2 <= v3)
      v14 = v3;
    else
      v14 = v2;
    v15 = v14 - v2;
    v16 = v11 | 0x8000000000000000;
    result = (_QWORD *)swift_retain();
    v17 = 0;
    v18 = v2;
    v19 = 0;
    v44 = v18;
    v20 = v45 + 8 * v18;
    do
    {
      if (v4 == v19)
      {
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      if (v15 == v19)
        goto LABEL_40;
      v48 = *(_QWORD *)(v20 + 8 * v19);
      result = v46(&v47, &v48);
      if (v16 == v19)
        goto LABEL_41;
      v21 = v19 + 1;
      v8[v19] = v47;
      v17 -= 8;
      v19 = v21;
    }
    while (v4 != v21);
    v22 = &v8[v17 / 0xFFFFFFFFFFFFFFF8];
    v2 = v44;
    v6 = v45;
    v23 = v44 + v21;
    v25 = v43 - v23;
    v24 = v43 <= v23;
    if (v43 != v23)
      goto LABEL_17;
    goto LABEL_35;
  }
  if (v4 < 0)
    goto LABEL_45;
  v46 = (_QWORD *(*)(uint64_t *__return_ptr, uint64_t *))result[4];
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 24) >> 1;
  sub_237EB8914((uint64_t)v49);
  result = (_QWORD *)swift_retain();
  v22 = v7 + 4;
  v23 = v2;
  v25 = v3 - v2;
  v24 = v3 <= v2;
  if (v3 != v2)
  {
LABEL_17:
    if (v24)
    {
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (v23 < v2)
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    v26 = (uint64_t *)(v6 + 8 * v23);
    while (1)
    {
      v27 = *v26++;
      v48 = v27;
      result = v46(&v47, &v48);
      v28 = v47;
      if (!v13)
      {
        v29 = v7[3];
        if ((uint64_t)((v29 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_43;
        v30 = v29 & 0xFFFFFFFFFFFFFFFELL;
        if (v30 <= 1)
          v31 = 1;
        else
          v31 = v30;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9C8);
        v32 = (_QWORD *)swift_allocObject();
        v33 = _swift_stdlib_malloc_size(v32);
        v34 = v33 - 32;
        if (v33 < 32)
          v34 = v33 - 25;
        v35 = v34 >> 3;
        v32[2] = v31;
        v32[3] = 2 * (v34 >> 3);
        v36 = (unint64_t)(v32 + 4);
        v37 = v7[3] >> 1;
        if (v7[2])
        {
          v38 = v7 + 4;
          if (v32 != v7 || v36 >= (unint64_t)v38 + 8 * v37)
            memmove(v32 + 4, v38, 8 * v37);
          v7[2] = 0;
        }
        v22 = (_QWORD *)(v36 + 8 * v37);
        v13 = (v35 & 0x7FFFFFFFFFFFFFFFLL) - v37;
        result = (_QWORD *)swift_release();
        v7 = v32;
      }
      v39 = __OFSUB__(v13--, 1);
      if (v39)
        break;
      *v22++ = v28;
      if (!--v25)
        goto LABEL_35;
    }
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
LABEL_35:
  sub_237EB893C((uint64_t)v49);
  result = (_QWORD *)swift_release();
  v40 = v7[3];
  if (v40 < 2)
    return v7;
  v41 = v40 >> 1;
  v39 = __OFSUB__(v41, v13);
  v42 = v41 - v13;
  if (!v39)
  {
    v7[2] = v42;
    return v7;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_237EB7CE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t KeyPath;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = type metadata accessor for TimeString(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237EB3FBC();
  v7 = v6;
  swift_getKeyPath();
  v8 = v0 + OBJC_IVAR____TtC11ClockPoster13PlayViewModel___observationRegistrar;
  v29 = v0;
  v9 = sub_237E20E98(&qword_2568984E0, (uint64_t (*)(uint64_t))type metadata accessor for PlayViewModel, (uint64_t)&unk_237EECA68);
  sub_237EE1F20();
  swift_release();
  if (v5 == *(_QWORD *)(v0 + 24) && v7 == *(_QWORD *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_237EE31BC();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      sub_237EB4350();
  }
  swift_getKeyPath();
  v29 = v1;
  sub_237EE1F20();
  swift_release();
  result = *(_QWORD *)(v1 + 40);
  if (!result)
  {
    swift_getKeyPath();
    v29 = v1;
    sub_237EE1F20();
    swift_release();
    v12 = *(_QWORD *)(v1 + 16);
    swift_getKeyPath();
    v29 = v12;
    sub_237E20E98(&qword_256897E18, (uint64_t (*)(uint64_t))type metadata accessor for RollingClockViewModel, (uint64_t)&unk_237EE4558);
    swift_retain();
    sub_237EE1F20();
    swift_release();
    v13 = v12 + OBJC_IVAR____TtC11ClockPoster21RollingClockViewModel__timeString;
    swift_beginAccess();
    sub_237E21EBC(v13, (uint64_t)v4, type metadata accessor for TimeString);
    swift_release();
    if (sub_237EE2AD8() == 2)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v27 = 9142498;
      v28 = 0xA300000000000000;
      sub_237EE2AF0();
    }
    sub_237E3B63C((uint64_t)v4);
    v14 = sub_237EE2AD8();
    v26 = v9;
    if (v14)
    {
      v15 = v14;
      v24[1] = v8;
      v25 = v1;
      v27 = MEMORY[0x24BEE4AF8];
      result = sub_237E626C0(0, v14 & ~(v14 >> 63), 0);
      if (v15 < 0)
      {
        __break(1u);
        goto LABEL_21;
      }
      v16 = v27;
      do
      {
        v17 = sub_237EE2B68();
        v19 = v18;
        v27 = v16;
        v21 = *(_QWORD *)(v16 + 16);
        v20 = *(_QWORD *)(v16 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_237E626C0(v20 > 1, v21 + 1, 1);
          v16 = v27;
        }
        *(_QWORD *)(v16 + 16) = v21 + 1;
        v22 = v16 + 16 * v21;
        *(_QWORD *)(v22 + 32) = v17;
        *(_QWORD *)(v22 + 40) = v19;
        sub_237EE2AE4();
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      v1 = v25;
    }
    else
    {
      swift_bridgeObjectRelease();
      v16 = MEMORY[0x24BEE4AF8];
    }
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v24[-2] = v1;
    v24[-1] = v16;
    v27 = v1;
    sub_237EE1F14();
    swift_release();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    v27 = v1;
    sub_237EE1F20();
    swift_release();
    result = *(_QWORD *)(v1 + 40);
    if (result)
      return result;
LABEL_21:
    __break(1u);
  }
  return result;
}

uint64_t sub_237EB80F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  uint64_t aBlock;
  uint64_t v72;
  id (*v73)(uint64_t, void *);
  void *v74;
  id (*v75)(uint64_t);
  uint64_t v76;
  _QWORD v77[3];
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[3];
  uint64_t v81;
  uint64_t v82;
  __int128 v83[2];
  __int128 v84;
  char v85;

  sub_237E28430(a1, (uint64_t)v83);
  if (v85 == 2)
  {
    swift_bridgeObjectRelease();
    sub_237E2D1BC(v83, (uint64_t)v80);
    sub_237E2D1BC(&v84, (uint64_t)v77);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9C0);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_237EEC830;
    v37 = v81;
    v38 = v82;
    __swift_project_boxed_opaque_existential_1(v80, v81);
    v39 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v38 + 56))(v37, v38);
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = v39;
    *(_QWORD *)(v40 + 24) = 0x4063200000000000;
    v41 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF20;
    v76 = v40;
    v42 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_11;
    v43 = _Block_copy(&aBlock);
    v44 = v39;
    v45 = objc_msgSend(v41, sel_initWithDynamicProvider_, v43);
    _Block_release(v43);

    swift_release();
    *(_QWORD *)(v36 + 32) = MEMORY[0x23B825D24](v45);
    v46 = v78;
    v47 = v79;
    __swift_project_boxed_opaque_existential_1(v77, v78);
    v48 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 40))(v46, v47);
    v49 = swift_allocObject();
    *(_QWORD *)(v49 + 16) = v48;
    *(_QWORD *)(v49 + 24) = 0x4063200000000000;
    v50 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v49;
    aBlock = v42;
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_21_1;
    v51 = _Block_copy(&aBlock);
    v52 = v48;
    v53 = objc_msgSend(v50, sel_initWithDynamicProvider_, v51);
    _Block_release(v51);

    swift_release();
    *(_QWORD *)(v36 + 40) = MEMORY[0x23B825D24](v53);
    *(_QWORD *)(v36 + 48) = sub_237EE270C();
    v54 = v81;
    v55 = v82;
    __swift_project_boxed_opaque_existential_1(v80, v81);
    v56 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v55 + 40))(v54, v55);
    v57 = swift_allocObject();
    *(_QWORD *)(v57 + 16) = v56;
    *(_QWORD *)(v57 + 24) = 0x4063200000000000;
    v58 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v57;
    aBlock = v42;
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_28_1;
    v59 = _Block_copy(&aBlock);
    v60 = v56;
    v61 = objc_msgSend(v58, sel_initWithDynamicProvider_, v59);
    _Block_release(v59);

    swift_release();
    *(_QWORD *)(v36 + 56) = MEMORY[0x23B825D24](v61);
    v62 = v78;
    v63 = v79;
    __swift_project_boxed_opaque_existential_1(v77, v78);
    v64 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v63 + 56))(v62, v63);
    v65 = swift_allocObject();
    *(_QWORD *)(v65 + 16) = v64;
    *(_QWORD *)(v65 + 24) = 0x4063200000000000;
    v66 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v65;
    aBlock = v42;
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_35;
    v67 = _Block_copy(&aBlock);
    v68 = v64;
    v69 = objc_msgSend(v66, sel_initWithDynamicProvider_, v67);
    _Block_release(v67);

    swift_release();
    *(_QWORD *)(v36 + 64) = MEMORY[0x23B825D24](v69);
    aBlock = v36;
    sub_237EE2BEC();
    v35 = aBlock;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
  }
  else
  {
    if (v85)
    {
      sub_237E2846C((uint64_t)v83);
      return 0;
    }
    swift_bridgeObjectRelease();
    sub_237E2D1BC(v83, (uint64_t)v80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C9C0);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_237EEC830;
    v2 = v81;
    v3 = v82;
    __swift_project_boxed_opaque_existential_1(v80, v81);
    v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = 0x4063200000000000;
    v6 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v5;
    v7 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_42;
    v8 = _Block_copy(&aBlock);
    v9 = v4;
    v10 = objc_msgSend(v6, sel_initWithDynamicProvider_, v8);
    _Block_release(v8);

    swift_release();
    *(_QWORD *)(v1 + 32) = MEMORY[0x23B825D24](v10);
    v11 = v81;
    v12 = v82;
    __swift_project_boxed_opaque_existential_1(v80, v81);
    v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v12 + 40))(v11, v12);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    *(_QWORD *)(v14 + 24) = 0x4063200000000000;
    v15 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v14;
    aBlock = v7;
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_49;
    v16 = _Block_copy(&aBlock);
    v17 = v13;
    v18 = objc_msgSend(v15, sel_initWithDynamicProvider_, v16);
    _Block_release(v16);

    swift_release();
    *(_QWORD *)(v1 + 40) = MEMORY[0x23B825D24](v18);
    *(_QWORD *)(v1 + 48) = sub_237EE270C();
    v19 = v81;
    v20 = v82;
    __swift_project_boxed_opaque_existential_1(v80, v81);
    v21 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 56))(v19, v20);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v21;
    *(_QWORD *)(v22 + 24) = 0x4063200000000000;
    v23 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v22;
    aBlock = v7;
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_56;
    v24 = _Block_copy(&aBlock);
    v25 = v21;
    v26 = objc_msgSend(v23, sel_initWithDynamicProvider_, v24);
    _Block_release(v24);

    swift_release();
    *(_QWORD *)(v1 + 56) = MEMORY[0x23B825D24](v26);
    v27 = v81;
    v28 = v82;
    __swift_project_boxed_opaque_existential_1(v80, v81);
    v29 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 40))(v27, v28);
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = v29;
    *(_QWORD *)(v30 + 24) = 0x4063200000000000;
    v31 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v75 = sub_237E2DF74;
    v76 = v30;
    aBlock = v7;
    v72 = 1107296256;
    v73 = sub_237E7D770;
    v74 = &block_descriptor_63;
    v32 = _Block_copy(&aBlock);
    v33 = v29;
    v34 = objc_msgSend(v31, sel_initWithDynamicProvider_, v32);
    _Block_release(v32);

    swift_release();
    *(_QWORD *)(v1 + 64) = MEMORY[0x23B825D24](v34);
    aBlock = v1;
    sub_237EE2BEC();
    v35 = aBlock;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v80);
  return v35;
}

uint64_t sub_237EB8868()
{
  return sub_237EB88B8();
}

uint64_t sub_237EB887C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_237EB88B8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 56) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB8900()
{
  return sub_237EB8994();
}

uint64_t sub_237EB8914(uint64_t a1)
{
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_237EB893C(uint64_t a1)
{
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_237EB8964()
{
  return sub_237EB89CC();
}

uint64_t sub_237EB8980()
{
  return sub_237EB8C3C();
}

uint64_t sub_237EB8994()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB89CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[4];
  *(_QWORD *)(v1 + 24) = v0[3];
  *(_QWORD *)(v1 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EB8A18()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_237EB8A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WorldViewModel.Pin(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EB8A94(__int128 *a1, uint64_t a2)
{
  assignWithCopy for WorldViewModelContext(a2, a1);
  return a2;
}

uint64_t storeEnumTagSinglePayload for PlayViewModelContext.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237EB8B08 + 4 * byte_237EEC850[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237EB8B28 + 4 * byte_237EEC855[v4]))();
}

_BYTE *sub_237EB8B08(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237EB8B28(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237EB8B30(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237EB8B38(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237EB8B40(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237EB8B48(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PlayViewModelContext.CodingKeys()
{
  return &type metadata for PlayViewModelContext.CodingKeys;
}

unint64_t sub_237EB8B68()
{
  unint64_t result;

  result = qword_25689C9F0;
  if (!qword_25689C9F0)
  {
    result = MEMORY[0x23B8271D0](&unk_237EECC8C, &type metadata for PlayViewModelContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C9F0);
  }
  return result;
}

unint64_t sub_237EB8BB0()
{
  unint64_t result;

  result = qword_25689C9F8;
  if (!qword_25689C9F8)
  {
    result = MEMORY[0x23B8271D0](&unk_237EECBFC, &type metadata for PlayViewModelContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689C9F8);
  }
  return result;
}

unint64_t sub_237EB8BF8()
{
  unint64_t result;

  result = qword_25689CA00;
  if (!qword_25689CA00)
  {
    result = MEMORY[0x23B8271D0](&unk_237EECC24, &type metadata for PlayViewModelContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25689CA00);
  }
  return result;
}

uint64_t sub_237EB8C3C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_237EB8CC8()
{
  sub_237EB5D24();
}

_QWORD *sub_237EB8CDC()
{
  _QWORD *result;

  type metadata accessor for WorldDataProvider();
  swift_allocObject();
  result = sub_237EB8D18();
  qword_25689DFE8 = (uint64_t)result;
  return result;
}

_QWORD *sub_237EB8D18()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CB98);
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 1;
  type metadata accessor for CPUnfairLock();
  v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v3 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v3;
  *(_BYTE *)(v1 + 40) = 0;
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CBA0);
  v4 = swift_allocObject();
  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 96);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B740);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 104);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v4 + v7) = v8;
  *(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 112)) = v3;
  *(_BYTE *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 120)) = 0;
  v0[3] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CBA8);
  v9 = swift_allocObject();
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  v11 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v9 + 16) = v10;
  *(_QWORD *)(v9 + 24) = v11;
  v0[4] = v9;
  v12 = (char *)v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity;
  v13 = type metadata accessor for City();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  return v0;
}

uint64_t sub_237EB8E94()
{
  _DWORD *v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  _QWORD *v35;
  id v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  _DWORD *v40;
  _QWORD *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  float v65;
  double v66;
  float v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  os_unfair_lock_s *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  BOOL v84;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v86;
  _DWORD *v87;
  os_log_type_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  char *v96;
  _QWORD *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  char v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  os_unfair_lock_s *v107;
  uint64_t v108;
  uint64_t v109;
  os_unfair_lock_s *v110;
  os_unfair_lock_s *v111;
  char v112;
  uint64_t v113;
  uint64_t result;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  id v125;
  __int128 v126;
  char *v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;
  os_unfair_lock_s *v131;
  char *v132;
  os_unfair_lock_s *v133;
  uint64_t v134;
  _QWORD *v135;
  id v136;
  uint64_t v137;
  char *v138;
  uint64_t *v139;
  char *v140;
  char *v141;
  char *v142;
  uint64_t v143;
  _QWORD *v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  _QWORD *v152;
  _DWORD *v153;
  uint64_t v154;
  _QWORD *v155;
  _QWORD *v156;
  uint64_t v157[18];
  char *v158;
  uint64_t v159[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (_DWORD *)((char *)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v124 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v129 = (uint64_t)&v124 - v9;
  v10 = sub_237EE1FB0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (os_unfair_lock_s *)((char *)&v124 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x24BDAC7A8](v12);
  v142 = (char *)&v124 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v132 = (char *)&v124 - v17;
  v154 = type metadata accessor for City();
  v137 = *(_QWORD *)(v154 - 8);
  v18 = MEMORY[0x24BDAC7A8](v154);
  v20 = (uint64_t *)((char *)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v124 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v156 = (uint64_t *)((char *)&v124 - v25);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v124 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v139 = (uint64_t *)((char *)&v124 - v29);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  MEMORY[0x24BDAC7A8](v30);
  v140 = (char *)&v124 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_237EE1EC0();
  v149 = *(_QWORD *)(v32 - 8);
  v150 = v32;
  MEMORY[0x24BDAC7A8](v32);
  v141 = (char *)&v124 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  if (!v34)
  {
    v20 = (_QWORD *)v10;
    if (qword_2542C6458 != -1)
LABEL_76:
      swift_once();
    v115 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_237E22004(v115, (uint64_t)v5, &qword_2542C6548);
    if ((*(unsigned int (**)(_DWORD *, uint64_t, _QWORD *))(v11 + 48))(v5, 1, v20) == 1)
    {
      sub_237E6072C((uint64_t)v14);
      sub_237E2209C((uint64_t)v5, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(os_unfair_lock_s *, _DWORD *, _QWORD *))(v11 + 32))(v14, v5, v20);
    }
    swift_retain_n();
    v116 = sub_237EE1F98();
    v117 = sub_237EE2D90();
    if (os_log_type_enabled(v116, v117))
    {
      v151 = v11;
      v118 = swift_slowAlloc();
      v152 = v20;
      v119 = (uint8_t *)v118;
      v120 = swift_slowAlloc();
      v159[0] = v120;
      *(_DWORD *)v119 = 136446210;
      v156 = v119 + 4;
      swift_retain();
      v121 = sub_237E269DC();
      v123 = v122;
      swift_release();
      v157[15] = sub_237E2A660(v121, v123, v159);
      sub_237EE2EE0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_237E17000, v116, v117, "[%{public}s] WorldClockManager is nil. Cannot fetch world clock data.", v119, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v120, -1, -1);
      MEMORY[0x23B8272A8](v119, -1, -1);

      return (*(uint64_t (**)(os_unfair_lock_s *, _QWORD *))(v151 + 8))(v14, v152);
    }
    else
    {

      swift_release_n();
      return (*(uint64_t (**)(os_unfair_lock_s *, _QWORD *))(v11 + 8))(v14, v20);
    }
  }
  v152 = (_QWORD *)v10;
  v155 = v23;
  v5 = v34;
  objc_msgSend(v34, sel_loadCities);
  v35 = (_QWORD *)*((_QWORD *)v1 + 4);
  v14 = (os_unfair_lock_s *)(v35[2] + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  v35[3] = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v14);
  swift_endAccess();
  swift_release();
  v125 = v5;
  v36 = objc_msgSend(v5, sel_cities);
  if (!v36)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v37 = v36;
  v148 = MEMORY[0x24BEE4AD8] + 8;
  v38 = sub_237EE2BD4();

  v35 = v142;
  v147 = *(_QWORD *)(v38 + 16);
  if (!v147)
  {
LABEL_66:

    return swift_bridgeObjectRelease();
  }
  v138 = v8;
  v151 = v11;
  v11 = 0;
  v131 = 0;
  v146 = v38 + 32;
  *(_QWORD *)&v39 = 136446466;
  v126 = v39;
  *(_QWORD *)&v39 = 136446210;
  v128 = v39;
  v153 = v1;
  v143 = v38;
  v127 = v28;
  while (1)
  {
    if (v11 >= *(_QWORD *)(v38 + 16))
    {
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    sub_237E2CE14(v146 + 32 * v11, (uint64_t)v157);
    sub_237E74A2C(0, &qword_25689CB88);
    if (!swift_dynamicCast())
    {
      v5 = v1;
      if (qword_2542C6458 != -1)
        swift_once();
      v53 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      v54 = (uint64_t)v138;
      sub_237E22004(v53, (uint64_t)v138, &qword_2542C6548);
      v56 = v151;
      v55 = v152;
      if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v151 + 48))(v54, 1, v152) == 1)
      {
        sub_237E6072C((uint64_t)v35);
        sub_237E2209C(v54, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(_QWORD *, uint64_t, _QWORD *))(v56 + 32))(v35, v54, v55);
      }
      v1 = v5;
      swift_retain_n();
      v14 = (os_unfair_lock_s *)sub_237EE1F98();
      v57 = sub_237EE2D90();
      if (os_log_type_enabled((os_log_t)v14, v57))
      {
        v5 = (_DWORD *)swift_slowAlloc();
        v58 = swift_slowAlloc();
        v157[0] = v58;
        *v5 = v128;
        swift_retain();
        v59 = sub_237E269DC();
        v61 = v60;
        swift_release();
        *(_QWORD *)(v5 + 1) = sub_237E2A660(v59, v61, v157);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237E17000, (os_log_t)v14, v57, "[%{public}s] City from WorldClockManager is not the expected type, WorldClockCity.", (uint8_t *)v5, 0xCu);
        swift_arrayDestroy();
        v62 = v58;
        v1 = v153;
        MEMORY[0x23B8272A8](v62, -1, -1);
        v35 = v142;
        MEMORY[0x23B8272A8](v5, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      (*(void (**)(_QWORD *, _QWORD *))(v151 + 8))(v35, v152);
      v38 = v143;
      goto LABEL_7;
    }
    v40 = v1;
    v145 = v11;
    v41 = v158;
    v42 = objc_msgSend(v158, sel_timeZone);
    if (!v42)
    {
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
      goto LABEL_80;
    }
    v43 = v42;
    sub_237EE2A84();

    v35 = v140;
    sub_237EE1E78();
    swift_bridgeObjectRelease();
    v45 = v149;
    v44 = v150;
    v46 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v149 + 48))(v35, 1, v150);
    v144 = v41;
    if (v46 == 1)
    {
      sub_237E2209C((uint64_t)v35, &qword_256897E10);
      v47 = (uint64_t)v132;
      if (qword_2542C6458 != -1)
        swift_once();
      v48 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      v49 = v48;
      v50 = v129;
      sub_237E22004(v49, v129, &qword_2542C6548);
      v52 = v151;
      v51 = v152;
      if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v151 + 48))(v50, 1, v152) == 1)
      {
        sub_237E6072C(v47);
        sub_237E2209C(v50, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, _QWORD *))(v52 + 32))(v47, v50, v51);
      }
      swift_retain_n();
      v14 = v144;
      v86 = v47;
      v5 = (_DWORD *)sub_237EE1F98();
      v87 = v40;
      v88 = sub_237EE2D90();
      if (os_log_type_enabled((os_log_t)v5, v88))
      {
        v89 = swift_slowAlloc();
        v144 = (_QWORD *)swift_slowAlloc();
        v90 = swift_slowAlloc();
        v157[0] = v90;
        *(_DWORD *)v89 = v126;
        swift_retain();
        v91 = sub_237E269DC();
        v93 = v92;
        swift_release();
        *(_QWORD *)(v89 + 4) = sub_237E2A660(v91, v93, v157);
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v89 + 12) = 2114;
        *(_QWORD *)(v89 + 14) = v14;
        v94 = v144;
        *v144 = v14;

        _os_log_impl(&dword_237E17000, (os_log_t)v5, v88, "[%{public}s] TimeZone for %{public}@ is invalid.", (uint8_t *)v89, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
        swift_arrayDestroy();
        MEMORY[0x23B8272A8](v94, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x23B8272A8](v90, -1, -1);
        v95 = v89;
        v38 = v143;
        MEMORY[0x23B8272A8](v95, -1, -1);

        (*(void (**)(char *, _QWORD *))(v151 + 8))(v132, v152);
      }
      else
      {

        swift_release_n();
        (*(void (**)(uint64_t, _QWORD *))(v151 + 8))(v86, v152);
      }
      v1 = v87;
      v35 = v142;
      goto LABEL_65;
    }
    (*(void (**)(char *, _QWORD *, uint64_t))(v45 + 32))(v141, v35, v44);
    v63 = objc_msgSend(v41, sel_alCity);
    if (!v63)
      goto LABEL_78;
    v64 = v63;
    objc_msgSend(v63, sel_latitude);
    v66 = v65;
    v136 = v64;
    objc_msgSend(v64, sel_longitude);
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v66, v67);
    v68 = objc_msgSend(v41, sel_name);
    if (!v68)
      goto LABEL_79;
    v69 = v68;
    v70 = sub_237EE2A84();
    v72 = v71;

    v11 = v154;
    v73 = v139;
    (*(void (**)(uint64_t, char *, uint64_t))(v149 + 16))((uint64_t)v139 + *(int *)(v154 + 24), v141, v150);
    *v73 = v70;
    v73[1] = v72;
    v73[2] = (uint64_t)v35;
    v74 = (uint64_t)v73;
    v75 = (uint64_t)v127;
    sub_237EBADA4(v74, (uint64_t)v127);
    v76 = *((_QWORD *)v40 + 4);
    v77 = v75;
    v78 = (os_unfair_lock_s *)(*(_QWORD *)(v76 + 16) + 16);
    swift_beginAccess();
    v135 = v35;
    swift_retain();
    os_unfair_lock_lock(v78);
    swift_beginAccess();
    v134 = v76;
    v5 = *(_DWORD **)(v76 + 24);
    swift_bridgeObjectRetain();
    v133 = v78;
    os_unfair_lock_unlock(v78);
    swift_endAccess();
    sub_237EE3264();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237EE2ACC();
    swift_bridgeObjectRelease();
    v79 = *(id *)(v77 + 16);
    sub_237EE2EBC();

    v14 = (os_unfair_lock_s *)(v77 + *(int *)(v11 + 24));
    v130 = sub_237E20E98((unint64_t *)&unk_25689C110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
    sub_237EE2A18();
    v80 = sub_237EE3294();
    v81 = -1 << *((_BYTE *)v5 + 32);
    v82 = v80 & ~v81;
    if (((*(_QWORD *)((char *)v5 + ((v82 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> v82) & 1) != 0)
    {
      v83 = ~v81;
      v11 = *(_QWORD *)(v137 + 72);
      while (1)
      {
        sub_237EBADA4(*((_QWORD *)v5 + 6) + v11 * v82, (uint64_t)v20);
        v84 = *v20 == *(_QWORD *)v77 && v20[1] == *(_QWORD *)(v77 + 8);
        if (v84 || (sub_237EE31BC() & 1) != 0)
        {
          sub_237E74A2C(0, (unint64_t *)&qword_25689D9D0);
          if ((sub_237EE2EB0() & 1) != 0 && (MEMORY[0x23B825514]((char *)v20 + *(int *)(v154 + 24), v14) & 1) != 0)
            break;
        }
        sub_237EBAE2C((uint64_t)v20);
        v82 = (v82 + 1) & v83;
        if (((*(_QWORD *)((char *)v5 + ((v82 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> v82) & 1) == 0)
          goto LABEL_36;
      }
      sub_237EBAE2C((uint64_t)v20);
      goto LABEL_60;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_237EBADA4(v77, (uint64_t)v156);
    v158 = (char *)v5;
    if (*((_QWORD *)v5 + 3) > *((_QWORD *)v5 + 2))
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_237EBB530();
      goto LABEL_58;
    }
    if (isUniquelyReferenced_nonNull_native)
      sub_237EBAEB0();
    else
      sub_237EBB8BC();
    v96 = v158;
    sub_237EE3264();
    v97 = v156;
    swift_bridgeObjectRetain();
    sub_237EE2ACC();
    swift_bridgeObjectRelease();
    v98 = (id)v97[2];
    sub_237EE2EBC();

    v14 = (os_unfair_lock_s *)((char *)v97 + *(int *)(v154 + 24));
    sub_237EE2A18();
    v99 = sub_237EE3294();
    v100 = -1 << v96[32];
    v82 = v99 & ~v100;
    if (((*(_QWORD *)&v96[((v82 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v82) & 1) != 0)
      break;
LABEL_58:
    v5 = v158;
    *(_QWORD *)&v158[((v82 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] |= 1 << v82;
    sub_237EBADE8((uint64_t)v156, *((_QWORD *)v5 + 6) + *(_QWORD *)(v137 + 72) * v82);
    v104 = *((_QWORD *)v5 + 2);
    v105 = __OFADD__(v104, 1);
    v106 = v104 + 1;
    if (v105)
      goto LABEL_75;
    *((_QWORD *)v5 + 2) = v106;
LABEL_60:
    swift_bridgeObjectRelease();
    sub_237EBAE2C(v77);
    v107 = v133;
    swift_beginAccess();
    os_unfair_lock_lock(v107);
    *(_QWORD *)(v134 + 24) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v107);
    swift_endAccess();
    swift_release();
    swift_bridgeObjectRelease();
    v108 = *((_QWORD *)v153 + 2);
    v109 = *((_QWORD *)v153 + 4);
    v110 = (os_unfair_lock_s *)(*(_QWORD *)(v109 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v110);
    swift_beginAccess();
    v5 = *(_DWORD **)(v109 + 24);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v110);
    swift_endAccess();
    swift_release();
    v111 = (os_unfair_lock_s *)(*(_QWORD *)(v108 + 24) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v111);
    swift_endAccess();
    swift_beginAccess();
    v14 = *(os_unfair_lock_s **)(v108 + 16);
    if ((unint64_t)v14 < 2)
      goto LABEL_63;
    swift_bridgeObjectRetain();
    sub_237E9F974((uint64_t)v14);
    v112 = sub_237EBBED4((uint64_t)v14, (uint64_t)v5);
    swift_bridgeObjectRelease();
    sub_237E47D4C((uint64_t)v14);
    if ((v112 & 1) == 0)
    {
      v14 = *(os_unfair_lock_s **)(v108 + 16);
LABEL_63:
      *(_QWORD *)(v108 + 16) = v5;
      swift_bridgeObjectRetain();
      sub_237E47D4C((uint64_t)v14);
      swift_beginAccess();
      swift_retain();
      v113 = swift_bridgeObjectRetain();
      v14 = v131;
      sub_237EBC254(v113, v108);
      v131 = v14;
      swift_bridgeObjectRelease();
      swift_release();
    }
    swift_beginAccess();
    os_unfair_lock_unlock(v111);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    v1 = v153;
    sub_237EBA238();

    sub_237EBAE2C((uint64_t)v139);
    (*(void (**)(char *, uint64_t))(v149 + 8))(v141, v150);
    v35 = v142;
    v38 = v143;
LABEL_65:
    v11 = v145;
LABEL_7:
    if (++v11 == v147)
      goto LABEL_66;
  }
  v101 = ~v100;
  v11 = *(_QWORD *)(v137 + 72);
  v35 = v155;
  while (1)
  {
    sub_237EBADA4(*((_QWORD *)v96 + 6) + v11 * v82, (uint64_t)v35);
    v102 = *v35 == *v156 && v35[1] == v156[1];
    if (v102 || (sub_237EE31BC() & 1) != 0)
    {
      sub_237E74A2C(0, (unint64_t *)&qword_25689D9D0);
      v103 = sub_237EE2EB0();
      v35 = v155;
      if ((v103 & 1) != 0 && (MEMORY[0x23B825514]((char *)v155 + *(int *)(v154 + 24), v14) & 1) != 0)
        break;
    }
    sub_237EBAE2C((uint64_t)v35);
    v82 = (v82 + 1) & v101;
    if (((*(_QWORD *)&v96[((v82 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v82) & 1) == 0)
      goto LABEL_58;
  }
LABEL_81:
  sub_237EBAE2C((uint64_t)v35);
  result = sub_237EE31D4();
  __break(1u);
  return result;
}

uint64_t sub_237EBA118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  _BYTE v8[24];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B740);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = *(_QWORD *)(v0 + 24);
  v5 = v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity;
  swift_beginAccess();
  sub_237E22004(v5, (uint64_t)v3, &qword_25689B740);
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_endAccess();
  sub_237E92E1C((uint64_t)v3);
  swift_beginAccess();
  os_unfair_lock_unlock(v6);
  swift_endAccess();
  swift_release();
  return sub_237E2209C((uint64_t)v3, &qword_25689B740);
}

uint64_t sub_237EBA238()
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  int64_t v35;
  int v36;
  uint64_t v37;
  void (*v38)(uint64_t *, uint64_t, uint64_t, int64_t);
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_QWORD, _QWORD);
  uint64_t v44;
  uint64_t v45;
  unsigned int (*v46)(uint64_t, uint64_t, int64_t);
  uint64_t *v47;
  void (*v48)(_QWORD, _QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t result;
  uint64_t v52;
  uint64_t v53;
  os_unfair_lock_s *v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int64_t v63;
  unint64_t v64;
  int64_t v65;
  unint64_t i;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  void (*v79)(char *, int64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int64_t v89;
  char *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(char *, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;

  v1 = v0;
  v2 = type metadata accessor for City();
  v96 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v92 = (uint64_t)&v80 - v6;
  v95 = sub_237EE1D70();
  v88 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_237EE1EC0();
  v94 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v90 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CB78);
  MEMORY[0x24BDAC7A8](v82);
  v91 = (uint64_t *)((char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v81 = (uint64_t)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v83 = (uint64_t)&v80 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v85 = (uint64_t *)((char *)&v80 - v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B740);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v84 = (uint64_t)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v80 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v80 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v80 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v80 - v29;
  v87 = v1;
  v31 = v1 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity;
  swift_beginAccess();
  v86 = v31;
  sub_237E22004(v31, (uint64_t)v30, &qword_25689B740);
  v32 = v96;
  v93 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v96 + 48);
  LODWORD(v31) = v93(v30, 1, v2);
  v33 = v90;
  sub_237E2209C((uint64_t)v30, &qword_25689B740);
  v97 = v25;
  if ((_DWORD)v31 == 1)
    goto LABEL_11;
  v34 = v94;
  v35 = v89;
  sub_237E22004(v86, (uint64_t)v28, &qword_25689B740);
  v36 = v93(v28, 1, v2);
  v80 = v2;
  if (v36)
  {
    sub_237E2209C((uint64_t)v28, &qword_25689B740);
    v37 = v34;
    v38 = *(void (**)(uint64_t *, uint64_t, uint64_t, int64_t))(v34 + 56);
    v39 = v85;
    v38(v85, 1, 1, v35);
  }
  else
  {
    v39 = v85;
    (*(void (**)(uint64_t *, char *, int64_t))(v34 + 16))(v85, &v28[*(int *)(v2 + 24)], v35);
    v40 = (uint64_t)v28;
    v37 = v34;
    sub_237E2209C(v40, &qword_25689B740);
    v38 = *(void (**)(uint64_t *, uint64_t, uint64_t, int64_t))(v34 + 56);
    v38(v39, 0, 1, v35);
  }
  v41 = v83;
  v42 = v82;
  sub_237EE1EB4();
  v38((uint64_t *)v41, 0, 1, v35);
  v43 = (void (*)(_QWORD, _QWORD))v91;
  v44 = (uint64_t)v91 + *(int *)(v42 + 48);
  sub_237E22004((uint64_t)v39, (uint64_t)v91, &qword_256897E10);
  sub_237E22004(v41, v44, &qword_256897E10);
  v45 = (uint64_t)v39;
  v46 = *(unsigned int (**)(uint64_t, uint64_t, int64_t))(v37 + 48);
  if (v46((uint64_t)v43, 1, v35) == 1)
  {
    sub_237E2209C(v41, &qword_256897E10);
    sub_237E2209C(v45, &qword_256897E10);
    if (v46(v44, 1, v35) == 1)
    {
      v47 = &qword_256897E10;
      v48 = (void (*)(_QWORD, _QWORD))v91;
      return sub_237E2209C((uint64_t)v48, v47);
    }
    goto LABEL_10;
  }
  v49 = v81;
  sub_237E22004((uint64_t)v43, v81, &qword_256897E10);
  if (v46(v44, 1, v35) == 1)
  {
    sub_237E2209C(v83, &qword_256897E10);
    sub_237E2209C((uint64_t)v85, &qword_256897E10);
    (*(void (**)(uint64_t, int64_t))(v94 + 8))(v49, v35);
LABEL_10:
    sub_237E2209C((uint64_t)v91, &qword_25689CB78);
    v2 = v80;
    v32 = v96;
    v25 = v97;
    v33 = v90;
    goto LABEL_11;
  }
  v77 = v94;
  v33 = v90;
  (*(void (**)(char *, uint64_t, int64_t))(v94 + 32))(v90, v44, v35);
  sub_237E20E98(&qword_25689CB80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF538]);
  v78 = sub_237EE2A48();
  v79 = *(void (**)(char *, int64_t))(v77 + 8);
  v79(v33, v35);
  sub_237E2209C(v83, &qword_256897E10);
  sub_237E2209C((uint64_t)v85, &qword_256897E10);
  v79((char *)v49, v35);
  result = sub_237E2209C((uint64_t)v43, &qword_256897E10);
  v2 = v80;
  v32 = v96;
  v25 = v97;
  if ((v78 & 1) == 0)
  {
LABEL_11:
    v85 = *(uint64_t **)(v32 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v85)(v25, 1, 1, v2);
    sub_237EE1EB4();
    sub_237EE1D64();
    v50 = sub_237EE1E84();
    v91 = *(uint64_t **)(v88 + 8);
    ((void (*)(char *, uint64_t))v91)(v8, v95);
    result = (*(uint64_t (**)(char *, int64_t))(v94 + 8))(v33, v89);
    v90 = (char *)(v50 + 86400);
    if (__OFADD__(v50, 86400))
    {
LABEL_49:
      __break(1u);
      return result;
    }
    v52 = v2;
    v53 = *(_QWORD *)(v87 + 32);
    v54 = (os_unfair_lock_s *)(*(_QWORD *)(v53 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v54);
    swift_beginAccess();
    v55 = *(_QWORD *)(v53 + 24);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v54);
    swift_endAccess();
    result = swift_release();
    v56 = 0;
    v57 = 0;
    v58 = *(_QWORD *)(v55 + 56);
    v88 = v55 + 56;
    v94 = v55;
    v59 = 1 << *(_BYTE *)(v55 + 32);
    v60 = -1;
    if (v59 < 64)
      v60 = ~(-1 << v59);
    v61 = v60 & v58;
    v89 = (unint64_t)(v59 + 63) >> 6;
    if ((v60 & v58) != 0)
      goto LABEL_31;
LABEL_17:
    v63 = v57 + 1;
    if (__OFADD__(v57, 1))
      goto LABEL_46;
    if (v63 < v89)
    {
      v64 = *(_QWORD *)(v88 + 8 * v63);
      ++v57;
      if (v64)
        goto LABEL_30;
      v57 = v63 + 1;
      if (v63 + 1 >= v89)
        goto LABEL_40;
      v64 = *(_QWORD *)(v88 + 8 * v57);
      if (v64)
        goto LABEL_30;
      v57 = v63 + 2;
      if (v63 + 2 >= v89)
        goto LABEL_40;
      v64 = *(_QWORD *)(v88 + 8 * v57);
      if (v64)
      {
LABEL_30:
        v61 = (v64 - 1) & v64;
        for (i = __clz(__rbit64(v64)) + (v57 << 6); ; i = v67 | (v57 << 6))
        {
          v68 = v92;
          sub_237EBADA4(*(_QWORD *)(v94 + 48) + *(_QWORD *)(v96 + 72) * i, v92);
          sub_237EBADE8(v68, (uint64_t)v5);
          sub_237EE1D64();
          v69 = sub_237EE1E84();
          result = ((uint64_t (*)(char *, uint64_t))v91)(v8, v95);
          v70 = v69 + 86400;
          if (__OFADD__(v69, 86400))
            break;
          v71 = v70 - (_QWORD)v90;
          if (__OFSUB__(v70, v90))
            goto LABEL_45;
          if (v71 < 0)
          {
            v72 = __OFSUB__(0, v71);
            v71 = (uint64_t)&v90[-v70];
            if (v72)
              goto LABEL_47;
          }
          sub_237E22004((uint64_t)v97, (uint64_t)v22, &qword_25689B740);
          v73 = v93(v22, 1, v52);
          sub_237E2209C((uint64_t)v22, &qword_25689B740);
          if (v73 == 1 || v71 < v56)
          {
            v62 = (uint64_t)v97;
            sub_237E2209C((uint64_t)v97, &qword_25689B740);
            sub_237EBADE8((uint64_t)v5, v62);
            result = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v85)(v62, 0, 1, v52);
            v56 = v71;
            if (!v61)
              goto LABEL_17;
          }
          else
          {
            result = sub_237EBAE2C((uint64_t)v5);
            if (!v61)
              goto LABEL_17;
          }
LABEL_31:
          v67 = __clz(__rbit64(v61));
          v61 &= v61 - 1;
        }
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
      v65 = v63 + 3;
      if (v65 < v89)
      {
        v64 = *(_QWORD *)(v88 + 8 * v65);
        if (!v64)
        {
          while (1)
          {
            v57 = v65 + 1;
            if (__OFADD__(v65, 1))
              goto LABEL_48;
            if (v57 >= v89)
              goto LABEL_40;
            v64 = *(_QWORD *)(v88 + 8 * v57);
            ++v65;
            if (v64)
              goto LABEL_30;
          }
        }
        v57 = v65;
        goto LABEL_30;
      }
    }
LABEL_40:
    swift_release();
    v74 = (uint64_t)v97;
    v75 = v84;
    sub_237E22004((uint64_t)v97, v84, &qword_25689B740);
    v76 = v86;
    swift_beginAccess();
    sub_237EBAE68(v75, v76);
    swift_endAccess();
    sub_237EBA118();
    sub_237E2209C(v75, &qword_25689B740);
    v48 = (void (*)(_QWORD, _QWORD))v74;
    v47 = &qword_25689B740;
    return sub_237E2209C((uint64_t)v48, v47);
  }
  return result;
}

uint64_t sub_237EBABCC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  sub_237E2209C(v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity, &qword_25689B740);
  return swift_deallocClassInstance();
}

uint64_t sub_237EBAC1C()
{
  return type metadata accessor for WorldDataProvider();
}

uint64_t type metadata accessor for WorldDataProvider()
{
  uint64_t result;

  result = qword_25689CA40;
  if (!qword_25689CA40)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237EBAC60()
{
  unint64_t v0;

  sub_237EBACE0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_237EBACE0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25689CA50)
  {
    type metadata accessor for City();
    v0 = sub_237EE2ED4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25689CA50);
  }
}

uint64_t sub_237EBAD34(uint64_t a1)
{
  MEMORY[0x23B8271D0](&unk_237EECD7C, a1);
  return CustomStringConvertibleViaMirror.description.getter(a1);
}

uint64_t sub_237EBAD68(uint64_t a1)
{
  uint64_t result;

  result = sub_237E20E98(&qword_25689CB70, (uint64_t (*)(uint64_t))type metadata accessor for WorldDataProvider, (uint64_t)&unk_237EECD54);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237EBADA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for City();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EBADE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for City();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EBAE2C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for City();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237EBAE68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B740);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EBAEB0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
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
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  v1 = v0;
  v2 = type metadata accessor for City();
  v34 = *(_QWORD *)(v2 - 8);
  v35 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (id *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CB90);
  v6 = sub_237EE2F70();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v33 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v31 = v0;
    v32 = (unint64_t)(v8 + 63) >> 6;
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
        if (v18 >= v32)
          goto LABEL_33;
        v19 = v33[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v32)
            goto LABEL_33;
          v19 = v33[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v32)
              goto LABEL_33;
            v19 = v33[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v31;
                v30 = 1 << *(_BYTE *)(v5 + 32);
                if (v30 > 63)
                  bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v30;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v32)
                    goto LABEL_33;
                  v19 = v33[v14];
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
      v21 = *(_QWORD *)(v34 + 72);
      sub_237EBADE8(*(_QWORD *)(v5 + 48) + v21 * v17, (uint64_t)v4);
      sub_237EE3264();
      swift_bridgeObjectRetain();
      sub_237EE2ACC();
      swift_bridgeObjectRelease();
      v22 = v4[2];
      sub_237EE2EBC();

      sub_237EE1EC0();
      sub_237E20E98((unint64_t *)&unk_25689C110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
      sub_237EE2A18();
      result = sub_237EE3294();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = sub_237EBADE8((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v21);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_237EBB260()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
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

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CBB0);
  result = sub_237EE2F70();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v14 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v15 = v14 | (v5 << 6);
      }
      else
      {
        v16 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v10)
          goto LABEL_33;
        v17 = v6[v16];
        ++v5;
        if (!v17)
        {
          v5 = v16 + 1;
          if (v16 + 1 >= v10)
            goto LABEL_33;
          v17 = v6[v5];
          if (!v17)
          {
            v5 = v16 + 2;
            if (v16 + 2 >= v10)
              goto LABEL_33;
            v17 = v6[v5];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v10)
              {
LABEL_33:
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v29;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v5 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v17 = v6[v5];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v5 = v18;
            }
          }
        }
LABEL_23:
        v9 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v5 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_237EE3264();
      sub_237EE3288();
      sub_237EE3288();
      result = sub_237EE3294();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v11 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
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

void *sub_237EBB530()
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

  v1 = v0;
  v2 = type metadata accessor for City();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CB90);
  v6 = *v0;
  v7 = sub_237EE2F64();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v8;
    return result;
  }
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
      goto LABEL_30;
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
    sub_237EBADA4(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5);
    result = (void *)sub_237EBADE8((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_237EBB728()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CBB0);
  v2 = *v0;
  v3 = sub_237EE2F64();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_237EBB8BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
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
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0;
  v2 = type metadata accessor for City();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (id *)((char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CB90);
  v6 = sub_237EE2F70();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v30 = v0;
  v31 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v32 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v32)
      goto LABEL_33;
    v19 = *(_QWORD *)(v31 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_33;
      v19 = *(_QWORD *)(v31 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_33;
        v19 = *(_QWORD *)(v31 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v11 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(_QWORD *)(v33 + 72);
    sub_237EBADA4(*(_QWORD *)(v5 + 48) + v21 * v17, (uint64_t)v4);
    sub_237EE3264();
    swift_bridgeObjectRetain();
    sub_237EE2ACC();
    swift_bridgeObjectRelease();
    v22 = v4[2];
    sub_237EE2EBC();

    sub_237EE1EC0();
    sub_237E20E98((unint64_t *)&unk_25689C110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
    sub_237EE2A18();
    result = sub_237EE3294();
    v23 = -1 << *(_BYTE *)(v7 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    result = sub_237EBADE8((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v21);
    ++*(_QWORD *)(v7 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v30;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v31 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v32)
      goto LABEL_33;
    v19 = *(_QWORD *)(v31 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_237EBBC34()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
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

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CBB0);
  result = sub_237EE2F70();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v14 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v15 = v14 | (v5 << 6);
      goto LABEL_24;
    }
    v16 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v10)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v5;
    if (!v17)
    {
      v5 = v16 + 1;
      if (v16 + 1 >= v10)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v5);
      if (!v17)
      {
        v5 = v16 + 2;
        if (v16 + 2 >= v10)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v5);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v9 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v5 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_237EE3264();
    sub_237EE3288();
    sub_237EE3288();
    result = sub_237EE3294();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v11 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v5 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v5);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_237EBBED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t i;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  id v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BOOL v34;
  int64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;

  v4 = type metadata accessor for City();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (id *)((char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (id *)((char *)&v35 - v9);
  result = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)&v35 - v13;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v15 = 0;
  v16 = a1 + 56;
  v17 = 1 << *(_BYTE *)(a1 + 32);
  if (v17 < 64)
    v18 = ~(-1 << v17);
  else
    v18 = -1;
  v19 = v18 & *(_QWORD *)(a1 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  v21 = a2 + 56;
  v38 = v12;
  v39 = a1;
  v36 = a1 + 56;
  v37 = v14;
  v35 = v20;
  if (!v19)
    goto LABEL_8;
LABEL_7:
  v40 = (v19 - 1) & v19;
  v41 = v15;
  for (i = __clz(__rbit64(v19)) | (v15 << 6); ; i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    v27 = *(_QWORD *)(v12 + 72);
    sub_237EBADA4(*(_QWORD *)(a1 + 48) + v27 * i, (uint64_t)v14);
    sub_237EBADE8((uint64_t)v14, (uint64_t)v10);
    sub_237EE3264();
    swift_bridgeObjectRetain();
    sub_237EE2ACC();
    swift_bridgeObjectRelease();
    v28 = v10[2];
    sub_237EE2EBC();

    v29 = (char *)v10 + *(int *)(v4 + 24);
    sub_237EE1EC0();
    sub_237E20E98((unint64_t *)&unk_25689C110, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
    sub_237EE2A18();
    v30 = sub_237EE3294();
    v31 = -1 << *(_BYTE *)(a2 + 32);
    v32 = v30 & ~v31;
    if (((*(_QWORD *)(v21 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
    {
LABEL_35:
      sub_237EBAE2C((uint64_t)v10);
      return 0;
    }
    v33 = ~v31;
    while (1)
    {
      sub_237EBADA4(*(_QWORD *)(a2 + 48) + v32 * v27, (uint64_t)v7);
      v34 = *v7 == *v10 && v7[1] == v10[1];
      if (v34 || (sub_237EE31BC() & 1) != 0)
      {
        sub_237E74A2C(0, (unint64_t *)&qword_25689D9D0);
        if ((sub_237EE2EB0() & 1) != 0 && (MEMORY[0x23B825514]((char *)v7 + *(int *)(v4 + 24), v29) & 1) != 0)
          break;
      }
      sub_237EBAE2C((uint64_t)v7);
      v32 = (v32 + 1) & v33;
      if (((*(_QWORD *)(v21 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
        goto LABEL_35;
    }
    sub_237EBAE2C((uint64_t)v7);
    result = sub_237EBAE2C((uint64_t)v10);
    v12 = v38;
    a1 = v39;
    v16 = v36;
    v14 = v37;
    v20 = v35;
    v19 = v40;
    v15 = v41;
    if (v40)
      goto LABEL_7;
LABEL_8:
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v23 >= v20)
      return 1;
    v24 = *(_QWORD *)(v16 + 8 * v23);
    v25 = v15 + 1;
    if (!v24)
    {
      v25 = v23 + 1;
      if (v23 + 1 >= v20)
        return 1;
      v24 = *(_QWORD *)(v16 + 8 * v25);
      if (!v24)
      {
        v25 = v23 + 2;
        if (v23 + 2 >= v20)
          return 1;
        v24 = *(_QWORD *)(v16 + 8 * v25);
        if (!v24)
          break;
      }
    }
LABEL_21:
    v40 = (v24 - 1) & v24;
    v41 = v25;
  }
  v26 = v23 + 3;
  if (v26 >= v20)
    return 1;
  v24 = *(_QWORD *)(v16 + 8 * v26);
  if (v24)
  {
    v25 = v26;
    goto LABEL_21;
  }
  while (1)
  {
    v25 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v25 >= v20)
      return 1;
    v24 = *(_QWORD *)(v16 + 8 * v25);
    ++v26;
    if (v24)
      goto LABEL_21;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_237EBC254(uint64_t a1, uint64_t a2)
{
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
  unint64_t v17;
  uint64_t *v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B8B8);
  v27 = *(_QWORD *)(v4 - 8);
  v28 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B8C0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v26 - v12;
  v14 = *(_QWORD *)(a1 + 64);
  v29 = a1 + 64;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v30 = v15;
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v18 = (uint64_t *)(a2 + 16);
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  v20 = 0;
  v30 = (unint64_t)(v30 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v21 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_23;
    }
    v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v23 >= v30)
      return swift_release();
    v24 = *(_QWORD *)(v29 + 8 * v23);
    ++v20;
    if (!v24)
    {
      v20 = v23 + 1;
      if (v23 + 1 >= v30)
        return swift_release();
      v24 = *(_QWORD *)(v29 + 8 * v20);
      if (!v24)
      {
        v20 = v23 + 2;
        if (v23 + 2 >= v30)
          return swift_release();
        v24 = *(_QWORD *)(v29 + 8 * v20);
        if (!v24)
        {
          v20 = v23 + 3;
          if (v23 + 3 >= v30)
            return swift_release();
          v24 = *(_QWORD *)(v29 + 8 * v20);
          if (!v24)
            break;
        }
      }
    }
LABEL_22:
    v17 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v20 << 6);
LABEL_23:
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v13, *(_QWORD *)(a1 + 56) + *(_QWORD *)(v8 + 72) * v22, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v13, v7);
    if (*v18 != 1)
    {
      v31 = *v18;
      swift_bridgeObjectRetain();
      sub_237EE2C7C();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  v25 = v23 + 4;
  if (v25 >= v30)
    return swift_release();
  v24 = *(_QWORD *)(v29 + 8 * v25);
  if (v24)
  {
    v20 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    v20 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v20 >= v30)
      return swift_release();
    v24 = *(_QWORD *)(v29 + 8 * v20);
    ++v25;
    if (v24)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_237EBC518(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t v22;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE28);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v22 - v9;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v12 = result;
    sub_237E22004(a1, (uint64_t)v4, &qword_25689CE28);
    v13 = type metadata accessor for SystemOverrideClockData();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v4, 1, v13) == 1)
    {
      sub_237E2209C((uint64_t)v4, &qword_25689CE28);
      v14 = sub_237EE1D70();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 1, 1, v14);
    }
    else
    {
      v15 = sub_237EE1D70();
      v16 = *(_QWORD *)(v15 - 8);
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v4, v15);
      sub_237EC1BE8((uint64_t)v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    sub_237EBC7C0((uint64_t)v10);
    v17 = *(_QWORD *)(v12 + 32);
    v18 = *(_QWORD **)(v12 + 40);
    v19 = (os_unfair_lock_s *)(v18[2] + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v19);
    v20 = (uint64_t)v18 + *(_QWORD *)(*v18 + 96);
    swift_beginAccess();
    sub_237E22004(v20, (uint64_t)v8, &qword_25689C140);
    os_unfair_lock_unlock(v19);
    swift_endAccess();
    swift_release();
    v21 = (os_unfair_lock_s *)(*(_QWORD *)(v17 + *(_QWORD *)(*(_QWORD *)v17 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v21);
    swift_endAccess();
    sub_237E934B0((uint64_t)v8);
    swift_beginAccess();
    os_unfair_lock_unlock(v21);
    swift_endAccess();
    sub_237E2209C((uint64_t)v8, &qword_25689C140);
    return swift_release();
  }
  return result;
}

uint64_t sub_237EBC7C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  _QWORD *v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = *(_QWORD **)(v1 + 40);
  sub_237E22004(a1, (uint64_t)&v13[-v7], &qword_25689C140);
  v10 = (os_unfair_lock_s *)(v9[2] + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v10);
  sub_237E22004((uint64_t)v8, (uint64_t)v6, &qword_25689C140);
  v11 = (uint64_t)v9 + *(_QWORD *)(*v9 + 96);
  swift_beginAccess();
  sub_237EC1A00((uint64_t)v6, v11);
  swift_endAccess();
  os_unfair_lock_unlock(v10);
  swift_endAccess();
  sub_237E2209C((uint64_t)v8, &qword_25689C140);
  swift_release();
  return sub_237E2209C(a1, &qword_25689C140);
}

uint64_t sub_237EBC908()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SystemOverrideClock()
{
  return objc_opt_self();
}

uint64_t sub_237EBC95C@<X0>(_QWORD *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void (*a5)(_QWORD, _QWORD, _QWORD)@<X4>, unsigned int (*a6)(char *, uint64_t, uint64_t)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
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
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD, _QWORD, _QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v30 = a3;
  v31 = a5;
  v34 = a8;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_237EE1D70();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for SystemOverrideClockData();
  v32 = *(_QWORD *)(v20 - 8);
  v33 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237EBCB38(a1, a2, v30, a4, v31, a6, a7, (uint64_t)v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23 = sub_237EE1EC0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(a7, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_237E2209C((uint64_t)v15, &qword_25689C140);
    v24 = 1;
    v25 = v34;
  }
  else
  {
    v26 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v26(v19, v15, v16);
    v26(v22, v19, v16);
    v27 = v34;
    sub_237EC0E18((uint64_t)v22, v34);
    v24 = 0;
    v25 = v27;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v25, v24, 1, v33);
}

uint64_t sub_237EBCB38@<X0>(_QWORD *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, void (*a5)(_QWORD, _QWORD, _QWORD)@<X4>, unsigned int (*a6)(char *, uint64_t, uint64_t)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
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
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
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
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  unsigned int (*v94)(char *, uint64_t, uint64_t);
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  _QWORD *v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  _QWORD *v109;
  void (*v110)(char *, char *, uint64_t);
  char *v111;
  char *v112;
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  unsigned int v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  unsigned int v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(uint64_t, _QWORD, uint64_t);
  uint64_t v133;
  char *v134;
  char v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  uint64_t v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(char *, char *, uint64_t);
  NSObject *v154;
  os_log_type_t v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  void (*v160)(char *, uint64_t);
  char *v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void (*v167)(char *, uint64_t);
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  NSObject *v174;
  os_log_type_t v175;
  uint8_t *v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  void (*v180)(char *, uint64_t);
  uint8_t *v181;
  void (*v182)(char *, uint64_t);
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void (*v187)(char *, char *, uint64_t);
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  NSObject *v193;
  os_log_type_t v194;
  uint8_t *v195;
  char *v196;
  char *v197;
  NSObject *v198;
  os_log_type_t v199;
  int v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  void (*v204)(char *, uint64_t);
  char *v205;
  uint64_t v206;
  unint64_t v207;
  void (*v208)(_QWORD, _QWORD, _QWORD);
  void (*v209)(char *, uint64_t);
  uint64_t v210;
  uint64_t v211;
  char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char *v216;
  char *v217;
  uint64_t v218;
  char *v219;
  char *v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;
  char *v229;
  char *v230;
  uint64_t v231;
  __int128 v232;
  char *v233;
  uint64_t v234;
  char *v235;
  char *v236;
  uint64_t v237;
  char *v238;
  char *v239;
  void (*v240)(_QWORD, _QWORD, _QWORD);
  unsigned int (*v241)(char *, uint64_t, uint64_t);
  uint64_t v242;
  char *v243;
  char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  char *v251;
  unint64_t v252;
  uint64_t v253;
  uint64_t v254;
  char *v255;
  char *v256;
  _QWORD *v257;
  uint64_t v258;
  uint64_t v259;
  char *v260;
  unint64_t v261;
  char *v262;
  char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void (*v267)(_QWORD, _QWORD, _QWORD);

  v241 = a6;
  v240 = a5;
  v252 = a4;
  v247 = a3;
  v261 = a2;
  v257 = a1;
  v242 = a8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  MEMORY[0x24BDAC7A8](v9);
  v236 = (char *)&v210 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CDF8);
  MEMORY[0x24BDAC7A8](v11);
  v235 = (char *)&v210 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v254 = sub_237EE1A88();
  v245 = *(_QWORD *)(v254 - 8);
  v13 = MEMORY[0x24BDAC7A8](v254);
  v222 = (char *)&v210 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v219 = (char *)&v210 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v251 = (char *)&v210 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v255 = (char *)&v210 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v256 = (char *)&v210 - v21;
  v259 = sub_237EE1EC0();
  v246 = *(_QWORD *)(v259 - 8);
  MEMORY[0x24BDAC7A8](v259);
  v233 = (char *)&v210 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v232 = sub_237EE1DF4();
  v231 = *(_QWORD *)(v232 - 8);
  MEMORY[0x24BDAC7A8](v232);
  v230 = (char *)&v210 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v250 = sub_237EE1E6C();
  v249 = *(_QWORD *)(v250 - 8);
  MEMORY[0x24BDAC7A8](v250);
  v263 = (char *)&v210 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v213 = (uint64_t)&v210 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v237 = (uint64_t)&v210 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v218 = (uint64_t)&v210 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v211 = (uint64_t)&v210 - v32;
  v258 = sub_237EE1FB0();
  v253 = *(_QWORD *)(v258 - 8);
  v33 = MEMORY[0x24BDAC7A8](v258);
  v214 = (uint64_t)&v210 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v243 = (char *)&v210 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v221 = (uint64_t)&v210 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v215 = (uint64_t)&v210 - v39;
  v40 = sub_237EE1D70();
  v41 = *(_QWORD **)(v40 - 8);
  v42 = MEMORY[0x24BDAC7A8](v40);
  v239 = (char *)&v210 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = MEMORY[0x24BDAC7A8](v42);
  v244 = (char *)&v210 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v260 = (char *)&v210 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v229 = (char *)&v210 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v216 = (char *)&v210 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v212 = (char *)&v210 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v217 = (char *)&v210 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v220 = (char *)&v210 - v57;
  MEMORY[0x24BDAC7A8](v56);
  v262 = (char *)&v210 - v58;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  v60 = MEMORY[0x24BDAC7A8](v59);
  v234 = (uint64_t)&v210 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = MEMORY[0x24BDAC7A8](v60);
  v248 = (uint64_t)&v210 - v63;
  v64 = MEMORY[0x24BDAC7A8](v62);
  v238 = (char *)&v210 - v65;
  v66 = MEMORY[0x24BDAC7A8](v64);
  v228 = (char *)&v210 - v67;
  v68 = MEMORY[0x24BDAC7A8](v66);
  v225 = (uint64_t)&v210 - v69;
  v70 = MEMORY[0x24BDAC7A8](v68);
  v226 = (uint64_t)&v210 - v71;
  v72 = MEMORY[0x24BDAC7A8](v70);
  v227 = (uint64_t)&v210 - v73;
  v74 = MEMORY[0x24BDAC7A8](v72);
  v76 = (char *)&v210 - v75;
  v77 = MEMORY[0x24BDAC7A8](v74);
  v79 = (char *)&v210 - v78;
  v80 = MEMORY[0x24BDAC7A8](v77);
  v82 = (char *)&v210 - v81;
  v83 = MEMORY[0x24BDAC7A8](v80);
  v85 = (char *)&v210 - v84;
  v86 = MEMORY[0x24BDAC7A8](v83);
  v88 = (char *)&v210 - v87;
  v89 = MEMORY[0x24BDAC7A8](v86);
  v91 = (char *)&v210 - v90;
  MEMORY[0x24BDAC7A8](v89);
  v93 = (char *)&v210 - v92;
  sub_237EBE6A4((uint64_t)v240, (uint64_t)v241, a7, (uint64_t)&v210 - v92);
  sub_237EBF1B4(v247, v252, a7, (uint64_t)v91);
  v247 = a7;
  sub_237EBF1B4((uint64_t)v257, v261, a7, (uint64_t)v88);
  v257 = v41;
  v94 = (unsigned int (*)(char *, uint64_t, uint64_t))v41[6];
  v252 = (unint64_t)v93;
  LODWORD(v93) = v94(v93, 1, v40);
  v261 = (unint64_t)v91;
  sub_237E22004((uint64_t)v91, (uint64_t)v85, &qword_25689C140);
  if ((_DWORD)v93 == 1)
  {
    v95 = v94(v85, 1, v40);
    sub_237E2209C((uint64_t)v85, &qword_25689C140);
    sub_237E22004((uint64_t)v88, (uint64_t)v82, &qword_25689C140);
    v96 = v40;
    v97 = (uint64_t)v88;
    if (v95 == 1 && v94(v82, 1, v40) == 1)
    {
      v98 = (uint64_t)v88;
      sub_237E2209C((uint64_t)v82, &qword_25689C140);
      v99 = v258;
      if (qword_2542C6458 != -1)
        swift_once();
      v100 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      v101 = v100;
      v102 = v213;
      sub_237E22004(v101, v213, &qword_2542C6548);
      v103 = v253;
      v104 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v253 + 48))(v102, 1, v99);
      v105 = v257;
      v106 = v214;
      if (v104 == 1)
      {
        sub_237E6072C(v214);
        sub_237E2209C(v102, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 32))(v214, v102, v99);
      }
      v193 = sub_237EE1F98();
      v194 = sub_237EE2D78();
      if (os_log_type_enabled(v193, v194))
      {
        v195 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v195 = 0;
        _os_log_impl(&dword_237E17000, v193, v194, "Status bar overrides for all time & date entries are nil. Not using override time.", v195, 2u);
        MEMORY[0x23B8272A8](v195, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v106, v99);
      sub_237E2209C(v98, &qword_25689C140);
      sub_237E2209C(v261, &qword_25689C140);
      sub_237E2209C(v252, &qword_25689C140);
      v185 = 1;
      v184 = v242;
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v105[7])(v184, v185, 1, v96);
    }
  }
  else
  {
    sub_237E2209C((uint64_t)v85, &qword_25689C140);
    sub_237E22004((uint64_t)v88, (uint64_t)v82, &qword_25689C140);
    v96 = v40;
    v97 = (uint64_t)v88;
  }
  sub_237E2209C((uint64_t)v82, &qword_25689C140);
  sub_237E22004(v261, (uint64_t)v79, &qword_25689C140);
  v107 = v94(v79, 1, v96);
  v108 = v258;
  v224 = v97;
  v241 = v94;
  if (v107 == 1)
  {
    sub_237E2209C((uint64_t)v79, &qword_25689C140);
    v109 = v257;
  }
  else
  {
    v109 = v257;
    v110 = (void (*)(char *, char *, uint64_t))v257[4];
    v111 = v220;
    v110(v220, v79, v96);
    sub_237E22004(v97, (uint64_t)v76, &qword_25689C140);
    if (v94(v76, 1, v96) == 1)
    {
      ((void (*)(char *, uint64_t))v109[1])(v111, v96);
      sub_237E2209C((uint64_t)v76, &qword_25689C140);
    }
    else
    {
      v112 = v217;
      v110(v217, v76, v96);
      sub_237E20E98(&qword_256898838, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      if ((sub_237EE2A48() & 1) == 0)
      {
        v187 = (void (*)(char *, char *, uint64_t))v257[2];
        v187(v262, v111, v96);
        if (qword_2542C6458 != -1)
          swift_once();
        v188 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
        swift_beginAccess();
        v189 = v211;
        sub_237E22004(v188, v211, &qword_2542C6548);
        v190 = v253;
        v191 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v253 + 48))(v189, 1, v108);
        v192 = v215;
        if (v191 == 1)
        {
          sub_237E6072C(v215);
          sub_237E2209C(v189, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v190 + 32))(v215, v189, v108);
        }
        v196 = v212;
        v197 = v220;
        v187(v212, v220, v96);
        v187(v216, v112, v96);
        v198 = sub_237EE1F98();
        v199 = sub_237EE2D90();
        v200 = v199;
        if (os_log_type_enabled(v198, v199))
        {
          v201 = swift_slowAlloc();
          v240 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
          v267 = v240;
          *(_DWORD *)v201 = 136446466;
          sub_237E20E98((unint64_t *)&qword_256899610, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
          LODWORD(v229) = v200;
          v202 = sub_237EE3180();
          v266 = sub_237E2A660(v202, v203, (uint64_t *)&v267);
          sub_237EE2EE0();
          swift_bridgeObjectRelease();
          v204 = (void (*)(char *, uint64_t))v257[1];
          v204(v196, v96);
          *(_WORD *)(v201 + 12) = 2082;
          v205 = v216;
          v206 = sub_237EE3180();
          v266 = sub_237E2A660(v206, v207, (uint64_t *)&v267);
          sub_237EE2EE0();
          swift_bridgeObjectRelease();
          v204(v205, v96);
          _os_log_impl(&dword_237E17000, v198, (os_log_type_t)v229, "Status bar overrides for timeEntry and shortTimeEntry are both set and do not match.\nChoosing timeEntry.\ntimeEntry=%{public}s\nshortTimeEntry=%{public}s'", (uint8_t *)v201, 0x16u);
          v208 = v240;
          swift_arrayDestroy();
          MEMORY[0x23B8272A8](v208, -1, -1);
          MEMORY[0x23B8272A8](v201, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v253 + 8))(v215, v258);
          v204(v217, v96);
          v204(v220, v96);
        }
        else
        {

          v209 = (void (*)(char *, uint64_t))v257[1];
          v209(v216, v96);
          v209(v196, v96);
          (*(void (**)(uint64_t, uint64_t))(v253 + 8))(v192, v108);
          v209(v112, v96);
          v209(v197, v96);
        }
        v121 = v260;
        v94 = v241;
        v120 = (uint64_t)v238;
        goto LABEL_22;
      }
      v109 = v257;
      v113 = (void (*)(char *, uint64_t))v257[1];
      v113(v112, v96);
      v113(v111, v96);
    }
  }
  v114 = v226;
  sub_237E22004(v261, v226, &qword_25689C140);
  v115 = v225;
  sub_237E22004(v97, v225, &qword_25689C140);
  v116 = v94((char *)v114, 1, v96);
  v117 = v229;
  v118 = (uint64_t)v228;
  v119 = v227;
  if (v116 == 1)
  {
    sub_237E34B08(v115, v227);
    sub_237E2209C(v114, &qword_25689C140);
  }
  else
  {
    sub_237E2209C(v115, &qword_25689C140);
    ((void (*)(uint64_t, uint64_t, uint64_t))v109[4])(v119, v114, v96);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v109[7])(v119, 0, 1, v96);
  }
  v120 = (uint64_t)v238;
  sub_237E22004(v119, v118, &qword_25689C140);
  if (v94((char *)v118, 1, v96) == 1)
  {
    sub_237EE1D40();
    sub_237E2209C(v119, &qword_25689C140);
    sub_237E2209C(v118, &qword_25689C140);
    v110 = (void (*)(char *, char *, uint64_t))v109[4];
  }
  else
  {
    sub_237E2209C(v119, &qword_25689C140);
    v110 = (void (*)(char *, char *, uint64_t))v109[4];
    v110(v117, (char *)v118, v96);
  }
  v110(v262, v117, v96);
  v121 = v260;
LABEL_22:
  sub_237E22004(v252, v120, &qword_25689C140);
  v122 = v94((char *)v120, 1, v96);
  v223 = v96;
  if (v122 == 1)
  {
    sub_237EE1D40();
    sub_237E2209C(v120, &qword_25689C140);
  }
  else
  {
    v110(v121, (char *)v120, v96);
  }
  v123 = v231;
  v124 = v230;
  v125 = v232;
  (*(void (**)(char *, _QWORD, _QWORD))(v231 + 104))(v230, *MEMORY[0x24BDCEF70], v232);
  sub_237EE1E00();
  (*(void (**)(char *, uint64_t))(v123 + 8))(v124, v125);
  v240 = *(void (**)(_QWORD, _QWORD, _QWORD))(v246 + 16);
  v240(v233, v247, v259);
  sub_237EE1E54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE00);
  v126 = sub_237EE1E60();
  v127 = *(_QWORD *)(v126 - 8);
  v128 = *(_QWORD *)(v127 + 72);
  v129 = *(unsigned __int8 *)(v127 + 80);
  v130 = (v129 + 32) & ~v129;
  v238 = (char *)(v130 + 3 * v128);
  v233 = (char *)(v129 | 7);
  v131 = swift_allocObject();
  v232 = xmmword_237EE79C0;
  *(_OWORD *)(v131 + 16) = xmmword_237EE79C0;
  v132 = *(void (**)(uint64_t, _QWORD, uint64_t))(v127 + 104);
  v132(v131 + v130, *MEMORY[0x24BDCF240], v126);
  v132(v131 + v130 + v128, *MEMORY[0x24BDCF250], v126);
  v132(v131 + v130 + 2 * v128, *MEMORY[0x24BDCF220], v126);
  sub_237EC1754(v131);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_237EE1E18();
  swift_bridgeObjectRelease();
  v133 = swift_allocObject();
  *(_OWORD *)(v133 + 16) = v232;
  v132(v133 + v130, *MEMORY[0x24BDCF230], v126);
  v132(v133 + v130 + v128, *MEMORY[0x24BDCF258], v126);
  v132(v133 + v130 + 2 * v128, *MEMORY[0x24BDCF260], v126);
  sub_237EC1754(v133);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_237EE1E18();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v249 + 56))(v235, 1, 1, v250);
  v246 = *(_QWORD *)(v246 + 56);
  v134 = v236;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v246)(v236, 1, 1, v259);
  v238 = (char *)sub_237EE1A1C();
  LODWORD(v233) = v135 & 1;
  *(_QWORD *)&v232 = sub_237EE1A28();
  LODWORD(v231) = v136 & 1;
  v230 = (char *)sub_237EE19EC();
  sub_237EE1A04();
  sub_237EE1A40();
  sub_237EE1A58();
  sub_237EE1A70();
  v137 = v259;
  v240(v134, v247, v259);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v246)(v134, 0, 1, v137);
  sub_237EE1A7C();
  v138 = v248;
  sub_237EE1E30();
  v139 = v138;
  v140 = v234;
  sub_237E22004(v139, v234, &qword_25689C140);
  v96 = v223;
  if (v241((char *)v140, 1, v223) == 1)
  {
    sub_237E2209C(v140, &qword_25689C140);
    v141 = v254;
    v142 = v258;
    v143 = v253;
    if (qword_2542C6458 != -1)
      swift_once();
    v144 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    v145 = v144;
    v146 = v218;
    sub_237E22004(v145, v218, &qword_2542C6548);
    v147 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v143 + 48))(v146, 1, v142);
    v148 = v245;
    v149 = v222;
    v150 = v219;
    v151 = v221;
    if (v147 == 1)
    {
      sub_237E6072C(v221);
      sub_237E2209C(v146, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v143 + 32))(v221, v146, v142);
    }
    v153 = *(void (**)(char *, char *, uint64_t))(v148 + 16);
    v153(v150, v256, v141);
    v153(v149, v255, v141);
    v154 = sub_237EE1F98();
    v155 = sub_237EE2D90();
    v156 = v155;
    if (os_log_type_enabled(v154, v155))
    {
      v157 = swift_slowAlloc();
      v259 = swift_slowAlloc();
      v266 = v259;
      *(_DWORD *)v157 = 136446466;
      sub_237E20E98(&qword_25689CE08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
      LODWORD(v247) = v156;
      v158 = sub_237EE3180();
      v265 = sub_237E2A660(v158, v159, &v266);
      sub_237EE2EE0();
      swift_bridgeObjectRelease();
      v160 = *(void (**)(char *, uint64_t))(v148 + 8);
      v160(v150, v254);
      *(_WORD *)(v157 + 12) = 2082;
      v161 = v222;
      v162 = sub_237EE3180();
      v265 = sub_237E2A660(v162, v163, &v266);
      v164 = v254;
      sub_237EE2EE0();
      swift_bridgeObjectRelease();
      v160(v161, v164);
      _os_log_impl(&dword_237E17000, v154, (os_log_type_t)v247, "Cannot combine date components.\nChoosing hours and minutes.\nday,month,year=%{public}s\nhour,minute=%{public}s'", (uint8_t *)v157, 0x16u);
      v152 = 2;
      v165 = v259;
      swift_arrayDestroy();
      v166 = v165;
      v143 = v253;
      v142 = v258;
      MEMORY[0x23B8272A8](v166, -1, -1);
      MEMORY[0x23B8272A8](v157, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v221, v142);
    }
    else
    {
      v167 = *(void (**)(char *, uint64_t))(v148 + 8);
      v167(v150, v141);
      v167(v149, v141);

      (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v151, v142);
      v152 = 2;
    }
    v140 = (uint64_t)v262;
    v105 = v257;
  }
  else
  {
    v152 = 4;
    v105 = v257;
    v142 = v258;
    v143 = v253;
  }
  v168 = v244;
  v169 = (uint64_t)v243;
  ((void (*)(char *, uint64_t, uint64_t))v105[v152])(v244, v140, v96);
  if (qword_2542C6458 != -1)
    swift_once();
  v170 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
  swift_beginAccess();
  v171 = v170;
  v172 = v237;
  sub_237E22004(v171, v237, &qword_2542C6548);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v143 + 48))(v172, 1, v142) == 1)
  {
    sub_237E6072C(v169);
    sub_237E2209C(v172, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v143 + 32))(v169, v172, v142);
  }
  v173 = v239;
  ((void (*)(char *, char *, uint64_t))v105[2])(v239, v168, v96);
  v174 = sub_237EE1F98();
  v175 = sub_237EE2D78();
  if (os_log_type_enabled(v174, v175))
  {
    v176 = (uint8_t *)swift_slowAlloc();
    v177 = swift_slowAlloc();
    v265 = v177;
    *(_DWORD *)v176 = 136446210;
    sub_237E20E98((unint64_t *)&qword_256899610, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v178 = sub_237EE3180();
    v264 = sub_237E2A660(v178, v179, &v265);
    sub_237EE2EE0();
    swift_bridgeObjectRelease();
    v180 = (void (*)(char *, uint64_t))v105[1];
    v180(v173, v96);
    _os_log_impl(&dword_237E17000, v174, v175, "Status bar override date set: %{public}s", v176, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v177, -1, -1);
    v181 = v176;
    v168 = v244;
    MEMORY[0x23B8272A8](v181, -1, -1);

    (*(void (**)(char *, uint64_t))(v253 + 8))(v243, v258);
  }
  else
  {

    v180 = (void (*)(char *, uint64_t))v105[1];
    v180(v173, v96);
    (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v169, v142);
  }
  sub_237E2209C(v248, &qword_25689C140);
  v182 = *(void (**)(char *, uint64_t))(v245 + 8);
  v183 = v254;
  v182(v251, v254);
  v182(v255, v183);
  v182(v256, v183);
  (*(void (**)(char *, uint64_t))(v249 + 8))(v263, v250);
  v180(v260, v96);
  v180(v262, v96);
  sub_237E2209C(v224, &qword_25689C140);
  sub_237E2209C(v261, &qword_25689C140);
  sub_237E2209C(v252, &qword_25689C140);
  v184 = v242;
  ((void (*)(uint64_t, char *, uint64_t))v105[4])(v242, v168, v96);
  v185 = 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v105[7])(v184, v185, 1, v96);
}

uint64_t sub_237EBE6A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint8_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;

  v104 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v102 = (uint64_t)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v89 - v10;
  v12 = sub_237EE1FB0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v109 = (uint8_t *)&v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v94 = (uint64_t)&v89 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v17);
  v103 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_237EE1EC0();
  v100 = *(_QWORD *)(v19 - 8);
  v101 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v99 = (char *)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_237EE1DF4();
  v97 = *(_QWORD *)(v21 - 8);
  v98 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v89 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_237EE1E6C();
  v24 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v108 = (char *)&v89 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v89 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CDF8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v89 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_237EE1A88();
  v33 = MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v89 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v90 = v11;
    v93 = v36;
    v91 = v34;
    v92 = v33;
    v95 = v24;
    v96 = a4;
    v112 = a1;
    v113 = a2;
    v114 = 47;
    v115 = 0xE100000000000000;
    sub_237E33174();
    v37 = sub_237EE2EF8();
    v38 = *(_QWORD *)(v37 + 16);
    v106 = v13;
    v107 = v12;
    v105 = v37;
    if (v38)
    {
      swift_bridgeObjectRetain();
      v39 = (uint64_t *)(v37 + 40);
      v40 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v41 = *v39;
        v112 = *(v39 - 1);
        v113 = v41;
        sub_237EBF6B0(&v112, &v114);
        if ((v115 & 1) == 0)
        {
          v42 = v114;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v40 = sub_237E61958(0, v40[2] + 1, 1, v40);
          v44 = v40[2];
          v43 = v40[3];
          if (v44 >= v43 >> 1)
            v40 = sub_237E61958((_QWORD *)(v43 > 1), v44 + 1, 1, v40);
          v40[2] = v44 + 1;
          v40[v44 + 4] = v42;
        }
        v39 += 2;
        --v38;
      }
      while (v38);
      swift_bridgeObjectRelease();
      v13 = v106;
      v12 = v107;
    }
    else
    {
      v40 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    if (v40[2] == 3)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v95 + 56))(v31, 1, 1, v110);
      v47 = v100;
      v48 = v101;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v100 + 56))(v28, 1, 1, v101);
      v49 = v93;
      sub_237EE1A70();
      v51 = v97;
      v50 = v98;
      (*(void (**)(char *, _QWORD, uint64_t))(v97 + 104))(v23, *MEMORY[0x24BDCEF70], v98);
      v52 = v108;
      sub_237EE1E00();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v23, v50);
      (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v99, v104, v48);
      sub_237EE1E54();
      v53 = (uint64_t)v103;
      sub_237EE1E30();
      v54 = sub_237EE1D70();
      v55 = *(_QWORD *)(v54 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54) == 1)
      {
        v56 = v110;
        sub_237E2209C(v53, &qword_25689C140);
        if (qword_2542C6458 != -1)
          swift_once();
        v57 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
        swift_beginAccess();
        v58 = (uint64_t)v90;
        sub_237E22004(v57, (uint64_t)v90, &qword_2542C6548);
        v60 = v106;
        v59 = v107;
        v61 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v106 + 48))(v58, 1, v107);
        v62 = v94;
        if (v61 == 1)
        {
          sub_237E6072C(v94);
          sub_237E2209C(v58, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32))(v94, v58, v59);
        }
        swift_bridgeObjectRetain();
        v81 = sub_237EE1F98();
        v82 = sub_237EE2D90();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)swift_slowAlloc();
          v84 = swift_slowAlloc();
          v114 = v84;
          *(_DWORD *)v83 = 136446210;
          v109 = v83 + 4;
          v85 = swift_bridgeObjectRetain();
          v86 = MEMORY[0x23B82624C](v85, MEMORY[0x24BEE0D00]);
          v88 = v87;
          swift_bridgeObjectRelease();
          v111 = sub_237E2A660(v86, v88, &v114);
          sub_237EE2EE0();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_237E17000, v81, v82, "Cannot convert date components ints to date. Components: '%{public}s'", v83, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B8272A8](v84, -1, -1);
          MEMORY[0x23B8272A8](v83, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v94, v107);
          (*(void (**)(char *, uint64_t))(v95 + 8))(v108, v110);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v62, v107);
          (*(void (**)(char *, uint64_t))(v95 + 8))(v52, v56);
        }
        (*(void (**)(char *, uint64_t))(v91 + 8))(v93, v92);
        v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56);
        v70 = v96;
        v71 = 1;
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v95 + 8))(v52, v110);
        (*(void (**)(char *, uint64_t))(v91 + 8))(v49, v92);
        v68 = v96;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 32))(v96, v53, v54);
        v69 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56);
        v70 = v68;
        v71 = 0;
      }
      return v69(v70, v71, 1, v54);
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_2542C6458 != -1)
        swift_once();
      v63 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      v64 = v63;
      v65 = v102;
      sub_237E22004(v64, v102, &qword_2542C6548);
      v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v65, 1, v12);
      v67 = (uint64_t)v109;
      if (v66 == 1)
      {
        sub_237E6072C((uint64_t)v109);
        sub_237E2209C(v65, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t, uint64_t))(v13 + 32))(v109, v65, v12);
      }
      swift_bridgeObjectRetain();
      v72 = sub_237EE1F98();
      v73 = sub_237EE2D90();
      if (os_log_type_enabled(v72, v73))
      {
        v74 = (uint8_t *)swift_slowAlloc();
        v75 = swift_slowAlloc();
        v114 = v75;
        *(_DWORD *)v74 = 136446210;
        v110 = (uint64_t)(v74 + 4);
        v76 = swift_bridgeObjectRetain();
        v77 = MEMORY[0x23B82624C](v76, MEMORY[0x24BEE0D00]);
        v79 = v78;
        swift_bridgeObjectRelease();
        v111 = sub_237E2A660(v77, v79, &v114);
        sub_237EE2EE0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_237E17000, v72, v73, "Expected 3 date components, not '%{public}s'", v74, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B8272A8](v75, -1, -1);
        MEMORY[0x23B8272A8](v74, -1, -1);

        (*(void (**)(uint8_t *, uint64_t))(v13 + 8))(v109, v12);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v67, v12);
      }
      v80 = sub_237EE1D70();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 56))(v96, 1, 1, v80);
    }
  }
  else
  {
    v45 = sub_237EE1D70();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(a4, 1, 1, v45);
  }
}

uint64_t sub_237EBF1B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237EE1FB0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v31 = v13;
    v32 = v11;
    v30 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_237EBFC30(v34, a2, *(uint64_t *)"h:mm a", 0xE600000000000000, a3, v16);
    swift_bridgeObjectRelease();
    v17 = sub_237EE1D70();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    if (v19(v16, 1, v17) != 1)
      goto LABEL_9;
    sub_237E2209C((uint64_t)v16, &qword_25689C140);
    v33 = a4;
    swift_bridgeObjectRetain();
    a4 = v33;
    sub_237EBFC30(v34, a2, *(uint64_t *)"HH:mm", 0xE500000000000000, a3, v16);
    swift_bridgeObjectRelease();
    if (v19(v16, 1, v17) != 1)
      goto LABEL_9;
    sub_237E2209C((uint64_t)v16, &qword_25689C140);
    swift_bridgeObjectRetain();
    sub_237EBFC30(v34, a2, *(uint64_t *)"HH:mm:ss", *(uint64_t *)"", a3, v16);
    a4 = v33;
    swift_bridgeObjectRelease();
    if (v19(v16, 1, v17) == 1)
    {
      sub_237E2209C((uint64_t)v16, &qword_25689C140);
      swift_arrayDestroy();
      v20 = (uint64_t)v31;
      if (qword_2542C6458 != -1)
        swift_once();
      v21 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      sub_237E22004(v21, (uint64_t)v9, &qword_2542C6548);
      v22 = v32;
      v23 = v30;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v9, 1, v30) == 1)
      {
        sub_237E6072C(v20);
        sub_237E2209C((uint64_t)v9, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v20, v9, v23);
      }
      swift_bridgeObjectRetain();
      v26 = sub_237EE1F98();
      v27 = sub_237EE2D90();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        v29 = swift_slowAlloc();
        v36 = v29;
        *(_DWORD *)v28 = 136315138;
        swift_bridgeObjectRetain();
        v35 = sub_237E2A660(v34, a2, &v36);
        sub_237EE2EE0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_237E17000, v26, v27, "Couldn't convert '%s' to override date", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B8272A8](v29, -1, -1);
        MEMORY[0x23B8272A8](v28, -1, -1);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v23);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v23);
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v33, 1, 1, v17);
    }
    else
    {
LABEL_9:
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a4, v16, v17);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a4, 0, 1, v17);
    }
  }
  else
  {
    v25 = sub_237EE1D70();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(a4, 1, 1, v25);
  }
}

uint64_t sub_237EBF6B0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  unsigned __int8 *v39;
  unsigned int v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;

  v46 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237EE1FB0();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v12 = a1[1];
  v14 = HIBYTE(v12) & 0xF;
  v15 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v12 & 0x2000000000000000) != 0)
    v16 = HIBYTE(v12) & 0xF;
  else
    v16 = *a1 & 0xFFFFFFFFFFFFLL;
  if (!v16)
    goto LABEL_46;
  if ((v12 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v18 = (uint64_t)sub_237EC0F38(v13, v12, 10);
    v20 = v42;
    result = swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  if ((v12 & 0x2000000000000000) == 0)
  {
    if ((v13 & 0x1000000000000000) != 0)
      v17 = (unsigned __int8 *)((v12 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v17 = (unsigned __int8 *)sub_237EE2FC4();
    result = (uint64_t)sub_237EC101C(v17, v15, 10);
    v18 = result;
    v20 = v19 & 1;
LABEL_44:
    if ((v20 & 1) == 0)
    {
      v30 = 0;
LABEL_54:
      v38 = v46;
      *v46 = v18;
      *((_BYTE *)v38 + 8) = v30;
      return result;
    }
LABEL_46:
    if (qword_2542C6458 != -1)
      swift_once();
    v31 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_237E22004(v31, (uint64_t)v6, &qword_2542C6548);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_237E6072C((uint64_t)v11);
      sub_237E2209C((uint64_t)v6, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
    }
    swift_bridgeObjectRetain_n();
    v32 = sub_237EE1F98();
    v33 = sub_237EE2D90();
    if (os_log_type_enabled(v32, v33))
    {
      v44 = v7;
      v34 = swift_slowAlloc();
      v45 = v2;
      v35 = (uint8_t *)v34;
      v36 = swift_slowAlloc();
      v43 = v8;
      v37 = v36;
      v49 = v36;
      *(_DWORD *)v35 = 136446210;
      swift_bridgeObjectRetain();
      v47 = sub_237E2A660(v13, v12, &v49);
      sub_237EE2EE0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237E17000, v32, v33, "Couldn't covert '%{public}s' to int", v35, 0xCu);
      v30 = 1;
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v37, -1, -1);
      MEMORY[0x23B8272A8](v35, -1, -1);

      result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v11, v44);
      v18 = 0;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      v18 = 0;
      v30 = 1;
    }
    goto LABEL_54;
  }
  v48[0] = *a1;
  v48[1] = v12 & 0xFFFFFFFFFFFFFFLL;
  if (v13 == 43)
  {
    if (!v14)
      goto LABEL_64;
    if (v14 == 1 || (BYTE1(v13) - 48) > 9u)
      goto LABEL_31;
    v18 = (BYTE1(v13) - 48);
    if (v14 != 2)
    {
      if ((BYTE2(v13) - 48) > 9u)
        goto LABEL_31;
      v18 = 10 * (BYTE1(v13) - 48) + (BYTE2(v13) - 48);
      v21 = v14 - 3;
      if (v21)
      {
        v22 = (unsigned __int8 *)v48 + 3;
        while (1)
        {
          v23 = *v22 - 48;
          if (v23 > 9)
            goto LABEL_31;
          v24 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63)
            goto LABEL_31;
          v18 = v24 + v23;
          if (__OFADD__(v24, v23))
            goto LABEL_31;
          v20 = 0;
          ++v22;
          if (!--v21)
            goto LABEL_44;
        }
      }
    }
LABEL_43:
    v20 = 0;
    goto LABEL_44;
  }
  if (v13 != 45)
  {
    if (!v14 || (v13 - 48) > 9u)
      goto LABEL_31;
    v18 = (v13 - 48);
    if (v14 != 1)
    {
      if ((BYTE1(v13) - 48) > 9u)
        goto LABEL_31;
      v18 = 10 * (v13 - 48) + (BYTE1(v13) - 48);
      v25 = v14 - 2;
      if (v25)
      {
        v26 = (unsigned __int8 *)v48 + 2;
        while (1)
        {
          v27 = *v26 - 48;
          if (v27 > 9)
            goto LABEL_31;
          v28 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63)
            goto LABEL_31;
          v18 = v28 + v27;
          if (__OFADD__(v28, v27))
            goto LABEL_31;
          v20 = 0;
          ++v26;
          if (!--v25)
            goto LABEL_44;
        }
      }
    }
    goto LABEL_43;
  }
  if (v14)
  {
    if (v14 != 1 && (BYTE1(v13) - 48) <= 9u)
    {
      if (v14 == 2)
      {
        v20 = 0;
        v18 = -(uint64_t)(BYTE1(v13) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v13) - 48) <= 9u)
      {
        v18 = -10 * (BYTE1(v13) - 48) - (BYTE2(v13) - 48);
        v29 = v14 - 3;
        if (!v29)
          goto LABEL_43;
        v39 = (unsigned __int8 *)v48 + 3;
        while (1)
        {
          v40 = *v39 - 48;
          if (v40 > 9)
            break;
          v41 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63)
            break;
          v18 = v41 - v40;
          if (__OFSUB__(v41, v40))
            break;
          v20 = 0;
          ++v39;
          if (!--v29)
            goto LABEL_44;
        }
      }
    }
LABEL_31:
    v18 = 0;
    v20 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_237EBFC30@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void (*v31)(char *);
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  char *v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t, uint64_t);
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  void (*v62)(char *);
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;

  v75 = a6;
  v76 = a5;
  v68 = a3;
  v69 = a4;
  v66 = a1;
  v67 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v6);
  v74 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237EE1DF4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_237EE1E6C();
  v13 = *(_QWORD *)(v12 - 8);
  v61 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_237EE1D70();
  v72 = *(_QWORD *)(v16 - 8);
  v73 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v59 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v58 - v19;
  sub_237EE1D40();
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v78 = *MEMORY[0x24BDCEF70];
  v62 = *(void (**)(char *))(v9 + 104);
  v62(v11);
  sub_237EE1E00();
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v11, v8);
  v60 = v22;
  v23 = (void *)sub_237EE1E24();
  v77 = *(void (**)(char *, uint64_t))(v13 + 8);
  v77(v15, v12);
  objc_msgSend(v21, sel_setCalendar_, v23);

  v24 = (void *)sub_237EE1E9C();
  objc_msgSend(v21, sel_setTimeZone_, v24);

  v25 = (void *)sub_237EE2A54();
  objc_msgSend(v21, sel_setDateFormat_, v25);

  v26 = (void *)sub_237EE1CF8();
  v70 = v21;
  v27 = objc_msgSend(v21, sel_stringFromDate_, v26);

  v28 = sub_237EE2A84();
  v64 = v29;
  v65 = v28;

  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v31 = v62;
  ((void (*)(char *, _QWORD, uint64_t))v62)(v11, v78, v8);
  sub_237EE1E00();
  v22(v11, v8);
  v32 = (void *)sub_237EE1E24();
  v33 = v61;
  v77(v15, v61);
  objc_msgSend(v30, sel_setCalendar_, v32);

  v34 = (void *)sub_237EE1E9C();
  objc_msgSend(v30, sel_setTimeZone_, v34);

  v35 = (void *)sub_237EE2A54();
  objc_msgSend(v30, sel_setDateFormat_, v35);

  v71 = v20;
  v36 = (void *)sub_237EE1CF8();
  v37 = objc_msgSend(v30, sel_stringFromDate_, v36);

  v63 = sub_237EE2A84();
  v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  ((void (*)(char *, _QWORD, uint64_t))v31)(v11, v78, v8);
  sub_237EE1E00();
  v39 = v11;
  v40 = v66;
  v60(v39, v8);
  v41 = (void *)sub_237EE1E24();
  v77(v15, v33);
  v42 = v67;
  objc_msgSend(v38, sel_setCalendar_, v41);

  v43 = (void *)sub_237EE1E9C();
  objc_msgSend(v38, sel_setTimeZone_, v43);

  v81 = 0x2D4D4D2D79797979;
  v82 = 0xEB00000000206464;
  sub_237EE2AF0();
  sub_237EE2AF0();
  sub_237EE2AF0();
  v44 = (void *)sub_237EE2A54();
  swift_bridgeObjectRelease();
  objc_msgSend(v38, sel_setDateFormat_, v44);

  v81 = v40;
  v82 = v42;
  v79 = 58;
  v80 = 0xE100000000000000;
  sub_237E33174();
  if (*(_QWORD *)(sub_237EE2EF8() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_237EE2AD8();
  }
  swift_bridgeObjectRelease();
  v81 = 0;
  v82 = 0xE000000000000000;
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  v81 = v65;
  v82 = v64;
  sub_237EE2AF0();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  v45 = (void *)sub_237EE2A54();
  swift_bridgeObjectRelease();
  v46 = objc_msgSend(v38, sel_dateFromString_, v45);

  if (!v46)
  {

    v56 = v72;
    v49 = v73;
    (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
    v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
    v51 = (uint64_t)v74;
    v52(v74, 1, 1, v49);
    goto LABEL_7;
  }
  v47 = v59;
  sub_237EE1D34();

  v48 = v72;
  v49 = v73;
  (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
  v50 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  v51 = (uint64_t)v74;
  v50(v74, v47, v49);
  v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56);
  v52((char *)v51, 0, 1, v49);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v51, 1, v49) == 1)
  {
LABEL_7:
    sub_237E2209C(v51, &qword_25689C140);
    v54 = v75;
    v55 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v52)(v54, v55, 1, v49);
  }
  v53 = v75;
  v50(v75, (char *)v51, v49);
  v54 = v53;
  v55 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v52)(v54, v55, 1, v49);
}

void sub_237EC036C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237EE1FB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v2 + 16))
  {
    if (qword_2542C6458 != -1)
      swift_once();
    v12 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_237E22004(v12, (uint64_t)v7, &qword_2542C6548);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_237E6072C((uint64_t)v11);
      sub_237E2209C((uint64_t)v7, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    }
    v13 = sub_237EE1F98();
    v14 = sub_237EE2D90();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_237E17000, v13, v14, "SystemSystemStatusBarOverrideProvider handler is not nil. Cannot replace it'", v15, 2u);
      MEMORY[0x23B8272A8](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = a1;
    *(_QWORD *)(v2 + 24) = a2;
    swift_retain();
    sub_237E208F4(0);
    sub_237EC058C();
  }
}

void sub_237EC058C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void (*v8)(char *);
  _QWORD aBlock[6];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE28);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + 32);
  v5 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_237EC19E0;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237EC07BC;
  aBlock[3] = &block_descriptor_12;
  v6 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v4, sel_observeDataWithBlock_, v6);
  _Block_release(v6);
  v7 = objc_msgSend(v4, sel_data);
  sub_237EC0810(v7, (uint64_t)v3);
  v8 = *(void (**)(char *))(v0 + 16);
  if (v8)
  {
    swift_retain();
    v8(v3);
    sub_237E208F4((uint64_t)v8);
  }
  sub_237E2209C((uint64_t)v3, &qword_25689CE28);

}

uint64_t sub_237EC06DC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t result;
  uint64_t v6;
  void (*v7)(char *);
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE28);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6 = result;
    sub_237EC0810(a1, (uint64_t)v4);
    v7 = *(void (**)(char *))(v6 + 16);
    if (v7)
    {
      swift_retain();
      v7(v4);
      sub_237E208F4((uint64_t)v7);
    }
    sub_237E2209C((uint64_t)v4, &qword_25689CE28);
    return swift_release();
  }
  return result;
}

void sub_237EC07BC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_237EC0810(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  unsigned int v16;
  id v17;
  _QWORD *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  id v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;

  v4 = sub_237EE1EC0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    goto LABEL_11;
  v7 = a1;
  v8 = objc_msgSend(v7, sel_customOverrides);
  v9 = objc_msgSend(v8, sel_shortTimeEntry);

  if (!v9 || (v10 = objc_msgSend(v9, sel_isEnabled), v9, (v10 & 1) == 0))
  {
    v11 = objc_msgSend(v7, sel_customOverrides);
    v12 = objc_msgSend(v11, sel_timeEntry);

    if (!v12 || (v13 = objc_msgSend(v12, sel_isEnabled), v12, (v13 & 1) == 0))
    {
      v14 = objc_msgSend(v7, sel_customOverrides);
      v15 = objc_msgSend(v14, sel_dateEntry);

      if (!v15 || (v16 = objc_msgSend(v15, sel_isEnabled), v15, !v16))
      {

LABEL_11:
        v22 = type metadata accessor for SystemOverrideClockData();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a2, 1, 1, v22);
        return;
      }
    }
  }
  v17 = objc_msgSend(v7, sel_customOverrides);
  v18 = objc_msgSend(v17, sel_shortTimeEntry);

  if (v18)
  {
    v19 = objc_msgSend(v18, sel_stringValue);

    v18 = (_QWORD *)sub_237EE2A84();
    v21 = v20;

  }
  else
  {
    v21 = 0;
  }
  v23 = objc_msgSend(v7, sel_customOverrides);
  v24 = objc_msgSend(v23, sel_timeEntry);

  if (v24)
  {
    v25 = objc_msgSend(v24, sel_stringValue);

    v24 = (id)sub_237EE2A84();
    v27 = v26;

  }
  else
  {
    v27 = 0;
  }
  v28 = objc_msgSend(v7, sel_customOverrides);
  v29 = objc_msgSend(v28, sel_dateEntry);

  if (v29)
  {
    v30 = objc_msgSend(v29, sel_stringValue);

    v29 = (id)sub_237EE2A84();
    v32 = v31;

  }
  else
  {
    v32 = 0;
  }
  sub_237EE1EB4();
  sub_237EBC95C(v18, v21, (uint64_t)v24, v27, (void (*)(_QWORD, _QWORD, _QWORD))v29, v32, (uint64_t)v6, a2);

}

uint64_t sub_237EC0B48()
{
  uint64_t v0;

  sub_237E208F4(*(_QWORD *)(v0 + 16));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SystemSystemStatusBarOverrideProvider()
{
  return objc_opt_self();
}

uint64_t sub_237EC0B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_237EC0BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_237EC0C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_237EC0C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_237EC0C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_237EC0CE0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237EC0CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_237EC0D28()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237EC0D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_237EE1D70();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SystemOverrideClockData()
{
  uint64_t result;

  result = qword_25689CDC0;
  if (!qword_25689CDC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237EC0DB0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237EE1D70();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237EC0E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SystemOverrideClockData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_237EC0E5C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256898640);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_237EC0EC0(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_237EE2B5C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B82618C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_237EC0F38(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_237EE2B74();
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
  v5 = sub_237EC1298();
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
    v7 = (unsigned __int8 *)sub_237EE2FC4();
  }
LABEL_7:
  v11 = sub_237EC101C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_237EC101C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

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
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
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
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
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
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_237EC1298()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_237EE2B80();
  v4 = sub_237EC1314(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_237EC1314(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_237EC1458(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_237EC0E5C(v9, 0);
      v12 = sub_237EC1544((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x23B82612C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x23B82612CLL);
LABEL_9:
      sub_237EE2FC4();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23B82612C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_237EC1458(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_237EC0EC0(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_237EC0EC0(a2, a3, a4);
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
    return sub_237EE2B2C();
  }
  __break(1u);
  return result;
}

unint64_t sub_237EC1544(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_237EC0EC0(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_237EE2B38();
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
          result = sub_237EE2FC4();
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
    result = sub_237EC0EC0(v12, a6, a7);
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
    v12 = sub_237EE2B14();
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

uint64_t sub_237EC1754(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_237EE1E60();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE10);
    v10 = sub_237EE2F7C();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_237E20E98(&qword_25689CE18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_237EE2A0C();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_237E20E98(&qword_25689CE20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_237EE2A48();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_237EC19BC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237EC19E0(void *a1)
{
  return sub_237EC06DC(a1);
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_237EC1A00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EC1A48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE30);
    v3 = sub_237EE2F7C();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_237EE3264();
      swift_bridgeObjectRetain();
      sub_237EE2ACC();
      result = sub_237EE3294();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_237EE31BC(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_237EE31BC();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_237EC1BE8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SystemOverrideClockData();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_237EC1C24(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  uint64_t v8;
  id v9;
  __int128 v11[6];
  objc_super v12;

  v3 = OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace;
  type metadata accessor for PlayClockFaceView();
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  *(_QWORD *)&v1[v3] = v4;
  sub_237E28430(a1, (uint64_t)&v1[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look]);
  v1[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_isDisplayStyleRedMode] = 0;
  v1[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode] = 0;
  objc_allocWithZone((Class)type metadata accessor for ClockFaceHostView());
  v5 = v4;
  v6 = v1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView] = sub_237E6E680(v5);

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for ClockFaceViewController();
  v7 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);

  sub_237E28430(a1, (uint64_t)v11);
  v8 = (uint64_t)v7 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look;
  swift_beginAccess();
  v9 = v7;
  sub_237E38500(v11, v8);
  swift_endAccess();
  sub_237EC1E24();
  sub_237E2846C((uint64_t)v11);

  sub_237E2846C(a1);
  return v9;
}

uint64_t sub_237EC1E24()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v78;
  char *v79;
  NSObject *v80;
  os_log_type_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  _QWORD *v88;
  os_log_t v89;
  uint64_t v90;
  os_log_t v91;
  int v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95[3];
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[3];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id (*v103)(uint64_t, void *);
  void *v104;
  id (*v105)(uint64_t);
  uint64_t v106;
  __int128 v107[2];
  __int128 v108[3];
  char v109;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v91 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237EE1FB0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (uint64_t)&v0[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look];
  swift_beginAccess();
  sub_237E28430(v8, (uint64_t)v107);
  if (v109 == 2)
  {
    swift_bridgeObjectRelease();
    sub_237E2D1BC(v107, (uint64_t)v98);
    sub_237E2D1BC(v108, (uint64_t)v95);
    v94 = *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568982F8);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_237EE9C20;
    v44 = v99;
    v45 = v100;
    __swift_project_boxed_opaque_existential_1(v98, v99);
    v46 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v45 + 56))(v44, v45);
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = v46;
    *(_QWORD *)(v47 + 24) = 0x4063200000000000;
    v48 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF20;
    v106 = v47;
    v49 = MEMORY[0x24BDAC760];
    v101 = MEMORY[0x24BDAC760];
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_13;
    v50 = _Block_copy(&v101);
    v51 = v46;
    v52 = objc_msgSend(v48, sel_initWithDynamicProvider_, v50);
    _Block_release(v50);

    swift_release();
    *(_QWORD *)(v43 + 32) = v52;
    v53 = v96;
    v54 = v97;
    __swift_project_boxed_opaque_existential_1(v95, v96);
    v55 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v54 + 40))(v53, v54);
    v56 = swift_allocObject();
    *(_QWORD *)(v56 + 16) = v55;
    *(_QWORD *)(v56 + 24) = 0x4063200000000000;
    v57 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v56;
    v101 = v49;
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_7_3;
    v58 = _Block_copy(&v101);
    v59 = v55;
    v60 = objc_msgSend(v57, sel_initWithDynamicProvider_, v58);
    _Block_release(v58);

    swift_release();
    *(_QWORD *)(v43 + 40) = v60;
    *(_QWORD *)(v43 + 48) = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    v61 = v99;
    v62 = v100;
    __swift_project_boxed_opaque_existential_1(v98, v99);
    v63 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v62 + 40))(v61, v62);
    v64 = swift_allocObject();
    *(_QWORD *)(v64 + 16) = v63;
    *(_QWORD *)(v64 + 24) = 0x4063200000000000;
    v65 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v64;
    v101 = v49;
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_14_2;
    v66 = _Block_copy(&v101);
    v67 = v63;
    v68 = objc_msgSend(v65, sel_initWithDynamicProvider_, v66);
    _Block_release(v66);

    swift_release();
    *(_QWORD *)(v43 + 56) = v68;
    v69 = v96;
    v70 = v97;
    __swift_project_boxed_opaque_existential_1(v95, v96);
    v71 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v70 + 56))(v69, v70);
    v72 = swift_allocObject();
    *(_QWORD *)(v72 + 16) = v71;
    *(_QWORD *)(v72 + 24) = 0x4063200000000000;
    v73 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v72;
    v101 = v49;
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_21_2;
    v74 = _Block_copy(&v101);
    v75 = v71;
    v76 = objc_msgSend(v73, sel_initWithDynamicProvider_, v74);
    _Block_release(v74);

    swift_release();
    *(_QWORD *)(v43 + 64) = v76;
    v101 = v43;
    sub_237EE2BEC();
    sub_237EE0E24(v101);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v95);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v98);
  }
  if (!v109)
  {
    swift_bridgeObjectRelease();
    sub_237E2D1BC(v107, (uint64_t)v98);
    v94 = *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568982F8);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_237EE9C20;
    v10 = v99;
    v11 = v100;
    __swift_project_boxed_opaque_existential_1(v98, v99);
    v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 56))(v10, v11);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    *(_QWORD *)(v13 + 24) = 0x4063200000000000;
    v14 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v13;
    v15 = MEMORY[0x24BDAC760];
    v101 = MEMORY[0x24BDAC760];
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_28_2;
    v16 = _Block_copy(&v101);
    v17 = v12;
    v18 = objc_msgSend(v14, sel_initWithDynamicProvider_, v16);
    _Block_release(v16);

    swift_release();
    *(_QWORD *)(v9 + 32) = v18;
    v19 = v99;
    v20 = v100;
    __swift_project_boxed_opaque_existential_1(v98, v99);
    v21 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 40))(v19, v20);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v21;
    *(_QWORD *)(v22 + 24) = 0x4063200000000000;
    v23 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v22;
    v101 = v15;
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_35_0;
    v24 = _Block_copy(&v101);
    v25 = v21;
    v26 = objc_msgSend(v23, sel_initWithDynamicProvider_, v24);
    _Block_release(v24);

    swift_release();
    *(_QWORD *)(v9 + 40) = v26;
    *(_QWORD *)(v9 + 48) = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    v27 = v99;
    v28 = v100;
    __swift_project_boxed_opaque_existential_1(v98, v99);
    v29 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v28 + 56))(v27, v28);
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = v29;
    *(_QWORD *)(v30 + 24) = 0x4063200000000000;
    v31 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v30;
    v101 = v15;
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_42_0;
    v32 = _Block_copy(&v101);
    v33 = v29;
    v34 = objc_msgSend(v31, sel_initWithDynamicProvider_, v32);
    _Block_release(v32);

    swift_release();
    *(_QWORD *)(v9 + 56) = v34;
    v35 = v99;
    v36 = v100;
    __swift_project_boxed_opaque_existential_1(v98, v99);
    v37 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v36 + 40))(v35, v36);
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = v37;
    *(_QWORD *)(v38 + 24) = 0x4063200000000000;
    v39 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v38;
    v101 = v15;
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_49_0;
    v40 = _Block_copy(&v101);
    v41 = v37;
    v42 = objc_msgSend(v39, sel_initWithDynamicProvider_, v40);
    _Block_release(v40);

    swift_release();
    *(_QWORD *)(v9 + 64) = v42;
    v101 = v9;
    sub_237EE2BEC();
    sub_237EE0E24(v101);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v98);
  }
  if (qword_2542C6458 != -1)
    swift_once();
  v78 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
  swift_beginAccess();
  sub_237E22004(v78, (uint64_t)v3, &qword_2542C6548);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_237E6072C((uint64_t)v7);
    sub_237E2209C((uint64_t)v3, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  v79 = v0;
  v80 = sub_237EE1F98();
  v81 = sub_237EE2D90();
  v82 = v81;
  if (os_log_type_enabled(v80, v81))
  {
    v83 = swift_slowAlloc();
    v93 = (_QWORD *)swift_slowAlloc();
    v94 = swift_slowAlloc();
    v95[0] = v94;
    *(_DWORD *)v83 = 136446466;
    v92 = v82;
    sub_237E28430(v8, (uint64_t)&v101);
    v91 = v80;
    v84 = sub_237E269C0();
    v86 = v85;
    sub_237E2846C((uint64_t)&v101);
    v101 = sub_237E2A660(v84, v86, v95);
    sub_237EE2EE0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v83 + 12) = 2114;
    v101 = (uint64_t)v79;
    v87 = v79;
    sub_237EE2EE0();
    v88 = v93;
    *v93 = v79;

    v89 = v91;
    _os_log_impl(&dword_237E17000, v91, (os_log_type_t)v92, "Unsupported look. Look: '%{public}s' for '%{public}@'", (uint8_t *)v83, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v88, -1, -1);
    v90 = v94;
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v90, -1, -1);
    MEMORY[0x23B8272A8](v83, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_237E2846C((uint64_t)v107);
}

uint64_t sub_237EC28DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  v4[6] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898BC0);
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256898BC8);
  v4[12] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898BD0);
  v4[13] = v6;
  v4[14] = *(_QWORD *)(v6 - 8);
  v4[15] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898BD8);
  v4[16] = v7;
  v4[17] = *(_QWORD *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = sub_237EE2C4C();
  v4[20] = sub_237EE2C40();
  v4[21] = sub_237EE2C28();
  v4[22] = v8;
  return swift_task_switch();
}

uint64_t sub_237EC2A34()
{
  uint64_t v0;

  if (qword_256897AE0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 184) = qword_25689DF08;
  return swift_task_switch();
}

uint64_t sub_237EC2A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v1 + 112);
  swift_retain();
  sub_237E8FF84(v3, v1, v2);
  return swift_task_switch();
}

uint64_t sub_237EC2AF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[14];
  v1 = v0[15];
  v3 = v0[13];
  sub_237EE2C88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[24] = sub_237EE2C40();
  v4 = (_QWORD *)swift_task_alloc();
  v0[25] = v4;
  *v4 = v0;
  v4[1] = sub_237EC2BBC;
  return sub_237EE2C94();
}

uint64_t sub_237EC2BBC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_237EC2C10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  int v8;
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
  int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v1 = *(_QWORD *)(v0 + 96);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 48))(v1, 1, *(_QWORD *)(v0 + 56)) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    swift_release();
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)(v0 + 40) + 16;
  sub_237E38724(v1, *(_QWORD *)(v0 + 88));
  v3 = MEMORY[0x23B827344](v2);
  if (!v3)
  {
    v13 = *(_QWORD *)(v0 + 136);
    v12 = *(_QWORD *)(v0 + 144);
    v14 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 88);
    swift_release();
    sub_237E2209C(v15, &qword_256898BC0);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    goto LABEL_7;
  }
  v4 = (void *)v3;
  v5 = *(_QWORD *)(v0 + 80);
  sub_237E22004(*(_QWORD *)(v0 + 88), v5, &qword_256898BC0);
  v6 = type metadata accessor for Alarm();
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48);
  v8 = v7(v5, 1, v6);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 48);
  if (v8 == 1)
  {
    sub_237E2209C(*(_QWORD *)(v0 + 80), &qword_256898BC0);
    v11 = sub_237EE1D70();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  else
  {
    v17 = sub_237EE1D70();
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v10, v9, v17);
    sub_237E387B0(v9);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
  }
  v19 = *(_QWORD *)(v0 + 72);
  sub_237E22004(*(_QWORD *)(v0 + 88), v19, &qword_256898BC0);
  v20 = v7(v19, 1, v6);
  v21 = *(_QWORD *)(v0 + 72);
  if (v20 == 1)
  {
    sub_237E2209C(v21, &qword_256898BC0);
    v22 = 2;
  }
  else
  {
    v22 = *(_BYTE *)(v21 + *(int *)(v6 + 20));
    sub_237E387B0(v21);
  }
  v23 = *(_QWORD *)(v0 + 88);
  v24 = *(_QWORD *)(v0 + 48);
  sub_237EC3114(v24, v22);

  sub_237E2209C(v24, &qword_25689C140);
  sub_237E2209C(v23, &qword_256898BC0);
  *(_QWORD *)(v0 + 192) = sub_237EE2C40();
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v25;
  *v25 = v0;
  v25[1] = sub_237EC2BBC;
  return sub_237EE2C94();
}

id sub_237EC3034(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  id result;
  unsigned __int8 v10;

  v2 = v1;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView);
  v10 = 2;
  v5 = *(_BYTE *)(v1 + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode);
  v6 = v4;
  sub_237E38828(a1, &v10, v5);

  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
  sub_237E70428(a1);
  v8 = *(void **)(v7 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
  if (v8)
    objc_msgSend(v8, sel_setNeedsLayout);
  result = *(id *)(v7 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
  if (result)
    return objc_msgSend(result, sel_setNeedsLayout);
  return result;
}

id sub_237EC3114(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id result;
  void *v21;
  objc_class *ObjCClassFromMetadata;
  char *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char *v40;
  uint64_t v41;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237EE1D70();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t, __n128))v14)(a1, 1, v9, v11) == 1)
  {
    v15 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
    v16 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView;
    v17 = *(void **)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
    if (v17)
    {
      objc_msgSend(v17, sel_removeFromSuperview);
      v18 = *(void **)(v15 + v16);
      *(_QWORD *)(v15 + v16) = 0;

      objc_msgSend(*(id *)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView), sel_setNeedsLayout);
    }
    v19 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView;
    result = *(id *)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
    if (result)
    {
      objc_msgSend(result, sel_removeFromSuperview);
      v21 = *(void **)(v15 + v19);
      *(_QWORD *)(v15 + v19) = 0;

      return objc_msgSend(*(id *)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView), sel_setNeedsLayout);
    }
  }
  else
  {
    sub_237E22004(a1, (uint64_t)v8, &qword_25689C140);
    if (v14(v8, 1, v9) == 1)
    {
      return (id)sub_237E2209C((uint64_t)v8, &qword_25689C140);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
      if (a2 != 2)
      {
        type metadata accessor for AlarmComplicationCurvedTextView();
        ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        v23 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_init);
        v24 = objc_msgSend(v23, sel_layer);
        objc_msgSend(v24, sel_setGeometryFlipped_, 1);

        v25 = *(void **)&v23[OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter];
        v26 = (void *)sub_237EE1CF8();
        objc_msgSend(v25, sel_setOverrideDate_, v26);

        v27 = *(_QWORD *)(v3 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
        v28 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView;
        v29 = *(void **)(v27 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
        if (v29)
        {
          objc_msgSend(v29, sel_removeFromSuperview);
          v30 = *(void **)(v27 + v28);
        }
        else
        {
          v30 = 0;
        }
        *(_QWORD *)(v27 + v28) = v23;
        v31 = v23;

        v32 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView;
        objc_msgSend(*(id *)(v27 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView), sel_setNeedsLayout);

        v33 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_init);
        v34 = objc_msgSend(v33, sel_layer);
        objc_msgSend(v34, sel_setGeometryFlipped_, 1);

        v35 = *(void **)&v33[OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter];
        v36 = (void *)sub_237EE1CF8();
        objc_msgSend(v35, sel_setOverrideDate_, v36);

        v37 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView;
        v38 = *(void **)(v27 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
        if (v38)
        {
          objc_msgSend(v38, sel_removeFromSuperview);
          v39 = *(void **)(v27 + v37);
        }
        else
        {
          v39 = 0;
        }
        *(_QWORD *)(v27 + v37) = v33;
        v40 = v33;

        objc_msgSend(*(id *)(v27 + v32), sel_setNeedsLayout);
      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
  }
  return result;
}

void sub_237EC34A0()
{
  uint64_t v0;

  sub_237E2846C(v0 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look);

}

id sub_237EC34CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayClockFaceViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PlayClockFaceViewController()
{
  return objc_opt_self();
}

uint64_t sub_237EC3554(uint64_t a1)
{
  uint64_t result;

  result = sub_237EC3678(&qword_25689CE70, MEMORY[0x24BDD0240]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237EC3588@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look;
  swift_beginAccess();
  return sub_237E28430(v3, a1);
}

uint64_t sub_237EC35D8(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look;
  swift_beginAccess();
  sub_237E38500(a1, v3);
  swift_endAccess();
  sub_237EC1E24();
  return sub_237E2846C((uint64_t)a1);
}

uint64_t sub_237EC3644(uint64_t a1)
{
  uint64_t result;

  result = sub_237EC3678(&qword_25689CE78, (uint64_t)&unk_237EECEAC);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_237EC3678(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for PlayClockFaceViewController();
    result = MEMORY[0x23B8271D0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237EC36B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_237EC36F0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237EC3714()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EC3740(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_237E20844;
  return sub_237EC28DC(a1, v4, v5, v6);
}

double sub_237EC3800@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F20();
  swift_release();
  result = *(double *)(v3 + 32);
  *a2 = result;
  return result;
}

uint64_t sub_237EC388C()
{
  swift_getKeyPath();
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F14();
  return swift_release();
}

uint64_t sub_237EC393C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F20();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__solarPosition;
  swift_beginAccess();
  return sub_237E22004(v4, a2, &qword_256899D48);
}

uint64_t sub_237EC39F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256899D48);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_237E22004(a1, (uint64_t)v6, &qword_256899D48);
  v7 = *a2;
  swift_getKeyPath();
  v10 = v7;
  v11 = v6;
  v12 = v7;
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F14();
  swift_release();
  return sub_237E2209C((uint64_t)v6, &qword_256899D48);
}

uint64_t sub_237EC3AFC(uint64_t a1, char a2)
{
  return sub_237EC3FAC(a1, a2, 0xD000000000000015, 0x8000000237EF05A0);
}

uint64_t sub_237EC3B18(uint64_t a1, char a2)
{
  return sub_237EC3FAC(a1, a2, 0xD000000000000015, 0x8000000237EF04F0);
}

uint64_t sub_237EC3B34(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_237EE237C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_237EE2D9C();
    v9 = sub_237EE2514();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_237E2A660(0x6C616E6F6974704FLL, 0xEE003E746E6F463CLL, &v15);
      sub_237EE2EE0();
      _os_log_impl(&dword_237E17000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v12, -1, -1);
      MEMORY[0x23B8272A8](v11, -1, -1);
    }

    sub_237EE2370();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_237EC3CFC(uint64_t a1, char a2)
{
  return sub_237EC3FAC(a1, a2, 0x656956646C726F57, 0xEE006C65646F4D77);
}

uint64_t sub_237EC3D20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_237EE237C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898698);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237E22004(v2, (uint64_t)v10, &qword_256898698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_237EE21A8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_237EE2D9C();
    v14 = sub_237EE2514();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_237E2A660(0x694474756F79614CLL, 0xEF6E6F6974636572, &v20);
      sub_237EE2EE0();
      _os_log_impl(&dword_237E17000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v18, -1, -1);
      MEMORY[0x23B8272A8](v16, -1, -1);
    }

    sub_237EE2370();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_237EC3F64(uint64_t a1, char a2)
{
  return sub_237EC3FAC(a1, a2, 0x65695672616C6F53, 0xEE006C65646F4D77);
}

uint64_t sub_237EC3F88(uint64_t a1, char a2)
{
  return sub_237EC3FAC(a1, a2, 0x7765695679616C50, 0xED00006C65646F4DLL);
}

uint64_t sub_237EC3FAC(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v8 = sub_237EE237C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v12 = sub_237EE2D9C();
    v13 = sub_237EE2514();
    v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      v21 = a4;
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v17 = a3;
      v18 = v16;
      v23 = v16;
      *(_DWORD *)v15 = 136315138;
      v22 = sub_237E2A660(v17, v21, &v23);
      sub_237EE2EE0();
      _os_log_impl(&dword_237E17000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v18, -1, -1);
      MEMORY[0x23B8272A8](v15, -1, -1);
    }

    sub_237EE2370();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v23;
  }
  return a1;
}

uint64_t sub_237EC4168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char *v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  char v29;
  __int128 v30;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CED8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE0);
  MEMORY[0x24BDAC7A8](v27);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - v13;
  v30 = *(_OWORD *)(a1 + 56);
  v28 = *(_OWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  v15 = v29;
  *(_QWORD *)v6 = sub_237EE23F4();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEF0);
  sub_237EC43D0(a1, (uint64_t)&v6[*(int *)(v16 + 44)]);
  v28 = *(_OWORD *)(a1 + 72);
  sub_237EE27D8();
  if (v29 == 1)
    v17 = sub_237EE270C();
  else
    v17 = sub_237EE2700();
  v18 = v17;
  v19 = sub_237EE252C();
  sub_237E22004((uint64_t)v6, (uint64_t)v11, &qword_25689CED8);
  v20 = &v11[*(int *)(v27 + 36)];
  *(_QWORD *)v20 = v18;
  v20[8] = v19;
  sub_237E2209C((uint64_t)v6, &qword_25689CED8);
  sub_237E21FC0((uint64_t)v11, (uint64_t)v14, &qword_25689CEE0);
  v28 = v30;
  sub_237EE27D8();
  v21 = v29;
  v22 = v29 ^ 1;
  sub_237E22004((uint64_t)v14, (uint64_t)v8, &qword_25689CEE0);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 9) = v15 ^ 1;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEF8);
  sub_237E22004((uint64_t)v8, a2 + *(int *)(v23 + 48), &qword_25689CEE0);
  v24 = a2 + *(int *)(v23 + 64);
  *(_QWORD *)v24 = 0;
  *(_BYTE *)(v24 + 8) = v22;
  *(_BYTE *)(v24 + 9) = v21;
  sub_237E2209C((uint64_t)v14, &qword_25689CEE0);
  return sub_237E2209C((uint64_t)v8, &qword_25689CEE0);
}

uint64_t sub_237EC43D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
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
  char v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD *v50;
  __int128 v51;
  char *v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t KeyPath;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  char v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;

  v80 = a2;
  v73 = sub_237EE24CC();
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v71 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF00);
  v67 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v65 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF08);
  MEMORY[0x24BDAC7A8](v68);
  v70 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF10);
  v81 = *(_QWORD *)(v6 - 8);
  v82 = (char *)v6;
  MEMORY[0x24BDAC7A8](v6);
  v66 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF18);
  MEMORY[0x24BDAC7A8](v8);
  v79 = (uint64_t)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v83 = (char *)&v65 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF20);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF28);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF30);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v65 - v22;
  *(_QWORD *)v17 = sub_237EE2394();
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 1;
  v24 = (uint64_t)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689CF38) + 44)];
  v74 = a1;
  sub_237EC546C(a1, v24);
  v25 = sub_237EE252C();
  sub_237E22004((uint64_t)v17, (uint64_t)v20, &qword_25689CF28);
  v26 = &v20[*(int *)(v18 + 36)];
  *v26 = v25;
  *((_QWORD *)v26 + 1) = 0x4040000000000000;
  *((_QWORD *)v26 + 2) = 0;
  *((_QWORD *)v26 + 3) = 0;
  *((_QWORD *)v26 + 4) = 0;
  v26[40] = 0;
  sub_237E2209C((uint64_t)v17, &qword_25689CF28);
  v78 = v23;
  sub_237E21FC0((uint64_t)v20, (uint64_t)v23, &qword_25689CF30);
  *(_QWORD *)&v85 = sub_237EC5F50();
  *((_QWORD *)&v85 + 1) = v27;
  sub_237E33174();
  v28 = sub_237EE25F8();
  v30 = v29;
  LOBYTE(v23) = v31 & 1;
  v32 = sub_237EE2598();
  v34 = v33;
  LOBYTE(v18) = v35 & 1;
  sub_237E21F3C(v28, v30, (char)v23);
  swift_bridgeObjectRelease();
  v36 = sub_237EE2544();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v14, 1, 1, v36);
  sub_237EE2550();
  sub_237E2209C((uint64_t)v14, &qword_25689CF20);
  v37 = sub_237EE25BC();
  v76 = v38;
  v77 = v39;
  v41 = v40;
  v42 = v74;
  swift_release();
  sub_237E21F3C(v32, v34, v18);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v85 = *(_OWORD *)(v42 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  v43 = sub_237EE27D8();
  v44 = 1;
  if ((v84 & 1) == 0)
  {
    MEMORY[0x24BDAC7A8](v43);
    *(&v65 - 2) = (char *)v42;
    sub_237EE2520();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF40);
    sub_237E22690(&qword_25689CF48, &qword_25689CF40, MEMORY[0x24BDF5428]);
    v45 = v65;
    sub_237EE2070();
    sub_237EE2904();
    sub_237EE20E8();
    v46 = v67;
    v47 = (uint64_t)v70;
    v48 = v69;
    (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v70, v45, v69);
    v49 = v68;
    v50 = (_OWORD *)(v47 + *(int *)(v68 + 36));
    v51 = v86;
    *v50 = v85;
    v50[1] = v51;
    v50[2] = v87;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v48);
    v52 = v71;
    sub_237EE24C0();
    v53 = sub_237EC9278();
    v54 = v66;
    MEMORY[0x23B825CD0](v52, v49, v53, 16.0);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v52, v73);
    sub_237E2209C(v47, &qword_25689CF08);
    (*(void (**)(char *, char *, char *))(v81 + 32))(v83, v54, v82);
    v44 = 0;
  }
  v55 = (uint64_t)v83;
  (*(void (**)(char *, uint64_t, uint64_t, char *))(v81 + 56))(v83, v44, 1, v82);
  v56 = v41 & 1;
  v57 = (uint64_t)v78;
  sub_237E22004((uint64_t)v78, (uint64_t)v20, &qword_25689CF30);
  v58 = v79;
  sub_237E22004(v55, v79, &qword_25689CF18);
  v59 = v80;
  sub_237E22004((uint64_t)v20, v80, &qword_25689CF30);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF60);
  v61 = v59 + *(int *)(v60 + 48);
  v82 = v20;
  v62 = KeyPath;
  v63 = v76;
  *(_QWORD *)v61 = v37;
  *(_QWORD *)(v61 + 8) = v63;
  *(_BYTE *)(v61 + 16) = v56;
  *(_QWORD *)(v61 + 24) = v77;
  *(_QWORD *)(v61 + 32) = v62;
  *(_BYTE *)(v61 + 40) = 2;
  sub_237E22004(v58, v59 + *(int *)(v60 + 64), &qword_25689CF18);
  sub_237E21EAC(v37, v63, v56);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_237E2209C(v55, &qword_25689CF18);
  sub_237E2209C(v57, &qword_25689CF30);
  sub_237E2209C(v58, &qword_25689CF18);
  sub_237E21F3C(v37, v63, v56);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_237E2209C((uint64_t)v82, &qword_25689CF30);
}

uint64_t sub_237EC4AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v35[0] = a1;
  v40 = a2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
  MEMORY[0x24BDAC7A8](v36);
  v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v35 - v5;
  v7 = type metadata accessor for ColorProviderGraph(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF70);
  v39 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v38 = (char *)v35 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF78);
  MEMORY[0x24BDAC7A8](v15);
  v37 = (uint64_t)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v35 - v18;
  sub_237EC4ECC((char *)v35 - v18);
  type metadata accessor for SolarViewModel();
  v35[1] = sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  *(_QWORD *)v9 = sub_237EE20B8();
  v9[8] = v20 & 1;
  LOBYTE(v41) = 1;
  sub_237EE27CC();
  v21 = v43;
  v9[16] = v42;
  *((_QWORD *)v9 + 3) = v21;
  v22 = type metadata accessor for ColorProviderPoint(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v6, 1, 1, v22);
  sub_237E22004((uint64_t)v6, (uint64_t)v3, &qword_25689CF68);
  sub_237EE27CC();
  sub_237E2209C((uint64_t)v6, &qword_25689CF68);
  v23 = &v9[*(int *)(v7 + 28)];
  v41 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF80);
  sub_237EE27CC();
  v24 = v43;
  *(_QWORD *)v23 = v42;
  *((_QWORD *)v23 + 1) = v24;
  LOBYTE(v3) = *(_BYTE *)(v35[0] + 8);
  v25 = swift_retain();
  sub_237EC3FAC(v25, (char)v3, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  sub_237E20E98(&qword_25689CF88, type metadata accessor for ColorProviderGraph, (uint64_t)&unk_237EED1A8);
  sub_237EE2640();
  swift_release();
  sub_237E21F00((uint64_t)v9, type metadata accessor for ColorProviderGraph);
  v27 = v38;
  v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v38, v12, v10);
  v28 = v37;
  sub_237E22004((uint64_t)v19, v37, &qword_25689CF78);
  v29 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v30 = v26;
  v29(v12, v27, v10);
  v31 = v40;
  sub_237E22004(v28, v40, &qword_25689CF78);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF90);
  v29((char *)(v31 + *(int *)(v32 + 48)), v12, v10);
  v33 = *(void (**)(char *, uint64_t))(v30 + 8);
  v33(v27, v10);
  sub_237E2209C((uint64_t)v19, &qword_25689CF78);
  v33(v12, v10);
  return sub_237E2209C(v28, &qword_25689CF78);
}

uint64_t sub_237EC4ECC@<X0>(char *a1@<X8>)
{
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  int *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;

  v56 = a1;
  v2 = sub_237EE23D0();
  MEMORY[0x24BDAC7A8](v2);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF98);
  v3 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v45 - v7;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v45 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v45 - v13;
  v65 = *(_OWORD *)(v1 + 40);
  v61 = *(_OWORD *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689B348);
  sub_237EE27F0();
  v61 = xmmword_237EECF10;
  v15 = swift_allocObject();
  v16 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v15 + 64) = v16;
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v1 + 64);
  *(_QWORD *)(v15 + 96) = *(_QWORD *)(v1 + 80);
  v17 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v15 + 32) = v17;
  sub_237EC9330(v1);
  sub_237EC93A0();
  v58 = v14;
  sub_237EE2868();
  sub_237EE23C4();
  sub_237EE23B8();
  v63 = v65;
  result = sub_237EE27D8();
  if ((~(_QWORD)v61 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (*(double *)&v61 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (*(double *)&v61 < 9.22337204e18)
  {
    *(_QWORD *)&v63 = (uint64_t)*(double *)&v61;
    sub_237EE23A0();
    sub_237EE23B8();
    sub_237EE23E8();
    v53 = sub_237EE25E0();
    v54 = v19;
    v55 = v20;
    v52 = v21 & 1;
    v63 = *(_OWORD *)(v1 + 16);
    v64 = *(_QWORD *)(v1 + 32);
    v59 = *(_OWORD *)(v1 + 16);
    v60 = *(_QWORD *)(v1 + 32);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFA8);
    v23 = v56;
    v24 = v22;
    sub_237EE2898();
    v59 = xmmword_237EECF20;
    v25 = v11;
    v49 = v11;
    v26 = MEMORY[0x24BEE13C8];
    sub_237EE2868();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689D9E0);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_237EE55E0;
    v61 = v63;
    v62 = v64;
    MEMORY[0x23B825EF8](&v59, v24);
    v28 = v59;
    v29 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v27 + 56) = v26;
    *(_QWORD *)(v27 + 64) = v29;
    *(_QWORD *)(v27 + 32) = v28;
    *(_QWORD *)&v61 = sub_237EE2A90();
    *((_QWORD *)&v61 + 1) = v30;
    sub_237E33174();
    v46 = sub_237EE25F8();
    v45 = v31;
    v47 = v32;
    LOBYTE(v24) = v33 & 1;
    v50 = v3;
    v34 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
    v51 = v8;
    v35 = v57;
    v34(v8, v58, v57);
    LOBYTE(v27) = v52;
    LOBYTE(v61) = v52;
    v48 = v5;
    v34(v5, v25, v35);
    v34(v23, v8, v35);
    v36 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25689CFB0);
    v37 = &v23[v36[12]];
    v39 = v53;
    v38 = v54;
    *(_QWORD *)v37 = v53;
    *((_QWORD *)v37 + 1) = v38;
    v37[16] = v27;
    *((_QWORD *)v37 + 3) = v55;
    v34(&v23[v36[16]], v5, v35);
    v40 = &v23[v36[20]];
    v41 = v46;
    v42 = v45;
    *(_QWORD *)v40 = v46;
    *((_QWORD *)v40 + 1) = v42;
    v40[16] = v24;
    *((_QWORD *)v40 + 3) = v47;
    v43 = v39;
    sub_237E21EAC(v39, v38, v27);
    swift_bridgeObjectRetain();
    sub_237E21EAC(v41, v42, v24);
    v44 = *(void (**)(char *, uint64_t))(v50 + 8);
    swift_bridgeObjectRetain();
    v44(v49, v35);
    v44(v58, v35);
    sub_237E21F3C(v41, v42, v24);
    swift_bridgeObjectRelease();
    v44(v48, v35);
    sub_237E21F3C(v43, v38, v61);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v44)(v51, v35);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_237EC546C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  char v30;
  __int128 v31;

  v27 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFB8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v28 = (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - v13;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v27 - v16;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v27 - v19;
  v31 = *(_OWORD *)(a1 + 56);
  v29 = *(_OWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  if (v30 == 1)
  {
    sub_237EC577C((uint64_t)sub_237EC9414, (uint64_t)v20);
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v21(v20, 0, 1, v3);
  }
  else
  {
    v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v21(v20, 1, 1, v3);
  }
  sub_237EC577C((uint64_t)sub_237EC95E4, (uint64_t)v8);
  v29 = v31;
  sub_237EE27D8();
  if ((v30 & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    sub_237EC577C((uint64_t)sub_237EC9414, (uint64_t)v17);
    v22 = 0;
  }
  v21(v17, v22, 1, v3);
  sub_237E22004((uint64_t)v20, (uint64_t)v14, &qword_25689CFC0);
  v23 = v28;
  sub_237E22004((uint64_t)v8, v28, &qword_25689CFB8);
  sub_237E22004((uint64_t)v17, (uint64_t)v11, &qword_25689CFC0);
  v24 = v27;
  sub_237E22004((uint64_t)v14, v27, &qword_25689CFC0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFC8);
  sub_237E22004(v23, v24 + *(int *)(v25 + 48), &qword_25689CFB8);
  sub_237E22004((uint64_t)v11, v24 + *(int *)(v25 + 64), &qword_25689CFC0);
  sub_237E2209C((uint64_t)v17, &qword_25689CFC0);
  sub_237E2209C((uint64_t)v8, &qword_25689CFB8);
  sub_237E2209C((uint64_t)v20, &qword_25689CFC0);
  sub_237E2209C((uint64_t)v11, &qword_25689CFC0);
  sub_237E2209C(v23, &qword_25689CFB8);
  return sub_237E2209C((uint64_t)v14, &qword_25689CFC0);
}

uint64_t sub_237EC577C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
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
  char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v32;
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
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v32 = a1;
  v37 = a2;
  v3 = sub_237EE2508();
  v4 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  v36 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFD0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFD8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFE0);
  v33 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_allocObject();
  v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v16 + 64) = v17;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v2 + 64);
  *(_QWORD *)(v16 + 96) = *(_QWORD *)(v2 + 80);
  v18 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v18;
  v38 = v2;
  sub_237EC9330(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CFE8);
  sub_237EC9424();
  sub_237EE2808();
  v19 = sub_237EE2748();
  KeyPath = swift_getKeyPath();
  *(_QWORD *)&v39 = v19;
  swift_retain();
  v21 = sub_237EE20F4();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  swift_release();
  v22 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  *v22 = KeyPath;
  v22[1] = v21;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_237EE24FC();
  sub_237EC94F8();
  sub_237E20E98(qword_25689D018, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  v23 = v35;
  sub_237EE2634();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v23);
  sub_237E2209C((uint64_t)v13, &qword_25689CFD8);
  sub_237EE2904();
  sub_237EE21E4();
  v24 = v33;
  v25 = v37;
  v26 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 16))(v37, v15, v34);
  v27 = (_OWORD *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689CFB8) + 36));
  v28 = v44;
  v27[4] = v43;
  v27[5] = v28;
  v27[6] = v45;
  v29 = v40;
  *v27 = v39;
  v27[1] = v29;
  v30 = v42;
  v27[2] = v41;
  v27[3] = v30;
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v26);
}

uint64_t sub_237EC5AE8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  return sub_237EE27E4();
}

uint64_t sub_237EC5B60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t result;

  sub_237EE2FA0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  v2 = sub_237EE2778();
  sub_237EE26E8();
  KeyPath = swift_getKeyPath();
  result = sub_237EE20F4();
  *a1 = v2;
  a1[1] = KeyPath;
  a1[2] = result;
  return result;
}

uint64_t sub_237EC5C8C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  return sub_237EE27E4();
}

uint64_t sub_237EC5D04@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t result;
  __int128 v6;

  v6 = *(_OWORD *)(a1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  v3 = sub_237EE2778();
  sub_237EE27D8();
  if (v6 == 1)
    sub_237EE26E8();
  else
    sub_237EE26F4();
  KeyPath = swift_getKeyPath();
  result = sub_237EE20F4();
  *a2 = v3;
  a2[1] = KeyPath;
  a2[2] = result;
  return result;
}

uint64_t sub_237EC5E34(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;

  v2 = *(_BYTE *)(a2 + 8);
  v3 = swift_retain();
  sub_237EC3FAC(v3, v2, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689B348);
  sub_237EE27D8();
  swift_getKeyPath();
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F14();
  swift_release();
  return swift_release();
}

uint64_t sub_237EC5F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t v17;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256899D48);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for CurrentLocationSolarPosition(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256897B48 != -1)
    swift_once();
  v8 = sub_237EA2010();
  v16 = v8;
  v17 = v9;
  v10 = *(_BYTE *)(v0 + 8);
  v11 = swift_retain();
  v12 = sub_237EC3FAC(v11, v10, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  swift_getKeyPath();
  v15[3] = v12;
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F20();
  swift_release();
  v13 = v12 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__solarPosition;
  swift_beginAccess();
  sub_237E22004(v13, (uint64_t)v3, &qword_256899D48);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_237E2209C((uint64_t)v3, &qword_256899D48);
  }
  else
  {
    sub_237E47CE0((uint64_t)v3, (uint64_t)v7, type metadata accessor for CurrentLocationSolarPosition);
    v15[1] = 10;
    v15[2] = 0xE100000000000000;
    sub_237E4F908();
    sub_237EE2AF0();
    swift_bridgeObjectRelease();
    sub_237EE2AF0();
    swift_bridgeObjectRelease();
    sub_237E21F00((uint64_t)v7, type metadata accessor for CurrentLocationSolarPosition);
    return v16;
  }
  return v8;
}

uint64_t sub_237EC61B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v11[5];
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEC0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_OWORD *)(v1 + 48);
  v11[2] = *(_OWORD *)(v1 + 32);
  v11[3] = v6;
  v11[4] = *(_OWORD *)(v1 + 64);
  v12 = *(_QWORD *)(v1 + 80);
  v7 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v7;
  *(_QWORD *)v5 = sub_237EE2394();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEC8);
  sub_237EC4168((uint64_t)v11, (uint64_t)&v5[*(int *)(v8 + 44)]);
  v9 = sub_237EE2724();
  sub_237E22004((uint64_t)v5, a1, &qword_25689CEC0);
  *(_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25689CED0) + 36)) = v9;
  return sub_237E2209C((uint64_t)v5, &qword_25689CEC0);
}

id sub_237EC6328()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SolarClockFaceDebugHUDUIKitBridgeView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SolarClockFaceDebugHUDUIKitBridgeView()
{
  return objc_opt_self();
}

uint64_t destroy for SolarClockFaceDebugHUD()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SolarClockFaceDebugHUD(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SolarClockFaceDebugHUD(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
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

uint64_t assignWithTake for SolarClockFaceDebugHUD(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SolarClockFaceDebugHUD(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SolarClockFaceDebugHUD(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SolarClockFaceDebugHUD()
{
  return &type metadata for SolarClockFaceDebugHUD;
}

uint64_t sub_237EC66C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237EC66D4@<X0>(char *a1@<X8>)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
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
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  void *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t OpaqueTypeConformance2;
  char *v78;
  void *v79;
  uint64_t v80;
  char *v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  int *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  void (*v115)(char *, uint64_t);
  uint64_t v116;
  void (*v117)(char *, uint64_t);
  uint64_t v118;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  void (*v141)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  char *v160;
  char *v161;
  void (*v162)(char *, char *, uint64_t);
  uint64_t v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;

  v140 = a1;
  v157 = type metadata accessor for ColorProviderGraph(0);
  v136 = *(_QWORD *)(v157 - 8);
  MEMORY[0x24BDAC7A8](v157);
  v138 = v2;
  v139 = (uint64_t)&v120 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D210);
  v129 = *(_QWORD *)(v130 - 8);
  MEMORY[0x24BDAC7A8](v130);
  v128 = (char *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D218);
  v132 = *(_QWORD *)(v133 - 8);
  MEMORY[0x24BDAC7A8](v133);
  v131 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D220);
  v135 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137);
  v134 = (char *)&v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D228);
  v152 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v161 = (char *)&v120 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v151 = (char *)&v120 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D230);
  MEMORY[0x24BDAC7A8](v9);
  v125 = (char *)&v120 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D238);
  v123 = *(_QWORD *)(v124 - 8);
  MEMORY[0x24BDAC7A8](v124);
  v122 = (char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D240);
  v143 = *(_QWORD *)(v144 - 8);
  MEMORY[0x24BDAC7A8](v144);
  v142 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D248);
  v159 = *(_QWORD *)(v163 - 8);
  MEMORY[0x24BDAC7A8](v163);
  v160 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v158 = (char *)&v120 - v15;
  v16 = type metadata accessor for ColorProviderPoint(0);
  v155 = *(_QWORD *)(v16 - 8);
  v156 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v145 = (uint64_t)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
  MEMORY[0x24BDAC7A8](v18);
  v154 = (char *)&v120 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_237EE23D0();
  MEMORY[0x24BDAC7A8](v20);
  v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D250);
  v148 = *(_QWORD *)(v150 - 8);
  MEMORY[0x24BDAC7A8](v150);
  v149 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v120 - v23;
  sub_237EE23DC();
  v162 = (void (*)(char *, char *, uint64_t))v1;
  v26 = *(_QWORD *)(v1 + 24);
  LOBYTE(v168) = *(_BYTE *)(v1 + 16);
  v25 = v168;
  v169 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27F0();
  v147 = v24;
  sub_237EE2874();
  sub_237EE23C4();
  sub_237EE23B8();
  LOBYTE(v164) = v25;
  v165 = v26;
  sub_237EE27D8();
  sub_237EE23AC();
  swift_bridgeObjectRelease();
  sub_237EE23B8();
  sub_237EE23E8();
  v127 = sub_237EE25E0();
  v126 = v27;
  v29 = v28;
  v146 = v30;
  __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  v31 = (uint64_t)v154;
  sub_237EE27D8();
  v32 = v31;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v155 + 48))(v31, 1, v156))
  {
    v33 = sub_237E2209C(v31, &qword_25689CF68);
    v156 = 0;
    v157 = 0;
    v154 = 0;
    v155 = 0;
  }
  else
  {
    v34 = v31;
    v35 = v145;
    sub_237E21EBC(v34, v145, type metadata accessor for ColorProviderPoint);
    sub_237E2209C(v32, &qword_25689CF68);
    v36 = sub_237EC774C();
    v38 = v37;
    sub_237E21F00(v35, type metadata accessor for ColorProviderPoint);
    v164 = (void *)v36;
    v165 = v38;
    sub_237E33174();
    v39 = sub_237EE25F8();
    v41 = v40;
    v43 = v42 & 1;
    v44 = sub_237EE2598();
    v46 = v45;
    v48 = v47 & 1;
    sub_237E21F3C(v39, v41, v43);
    swift_bridgeObjectRelease();
    sub_237EE2568();
    v49 = sub_237EE25BC();
    v156 = v50;
    v157 = v49;
    LOBYTE(v41) = v51;
    v155 = v52;
    swift_release();
    v154 = (char *)(v41 & 1);
    sub_237E21F3C(v44, v46, v48);
    v33 = swift_bridgeObjectRelease();
  }
  LODWORD(v145) = v29 & 1;
  MEMORY[0x24BDAC7A8](v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D258);
  sub_237ECB508();
  v53 = v122;
  sub_237EE2028();
  v164 = &unk_2509BEB58;
  v54 = sub_237EE204C();
  v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56);
  v56 = (uint64_t)v125;
  v55(v125, 1, 1, v54);
  v57 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v55;
  v141 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v55;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D280);
  v59 = sub_237E22690(&qword_25689D288, &qword_25689D238, MEMORY[0x24BDB8148]);
  v60 = sub_237ECB630(&qword_25689D290, &qword_25689D280, MEMORY[0x24BDB84C8]);
  v61 = v142;
  v62 = (void *)v124;
  v121 = v58;
  v63 = v60;
  v120 = v60;
  sub_237EE2610();
  sub_237E2209C(v56, &qword_25689D230);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v123 + 8))(v53, v62);
  v168 = sub_237EC7F58();
  v57(v56, 1, 1, v54);
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D298);
  v164 = v62;
  v165 = v58;
  v166 = v59;
  v167 = (char *)v63;
  swift_getOpaqueTypeConformance2();
  v122 = (char *)sub_237ECB630(&qword_25689D2A0, &qword_25689D298, MEMORY[0x24BDB84D0]);
  v64 = v160;
  v65 = v144;
  sub_237EE2604();
  sub_237E2209C(v56, &qword_25689D230);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v143 + 8))(v61, v65);
  (*(void (**)(char *, char *, uint64_t))(v159 + 32))(v158, v64, v163);
  sub_237EE23DC();
  v144 = sub_237EE25E0();
  v143 = v66;
  v124 = v67;
  LODWORD(v142) = v68 & 1;
  MEMORY[0x24BDAC7A8](v144);
  v69 = (uint64_t)v162;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2A8);
  sub_237ECB68C();
  v70 = v128;
  sub_237EE2028();
  v164 = &unk_2509BEB88;
  v71 = v54;
  v141(v56, 1, 1, v54);
  v72 = sub_237E22690(&qword_25689D2B8, &qword_25689D210, MEMORY[0x24BDB8148]);
  v73 = v131;
  v74 = (void *)v130;
  v75 = v121;
  v76 = v120;
  sub_237EE2610();
  sub_237E2209C(v56, &qword_25689D230);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v129 + 8))(v70, v74);
  v168 = sub_237EC7F58();
  v141(v56, 1, 1, v71);
  v164 = v74;
  v165 = v75;
  v166 = v72;
  v167 = (char *)v76;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v78 = v134;
  v79 = (void *)v133;
  v80 = v123;
  v81 = v122;
  sub_237EE2604();
  sub_237E2209C(v56, &qword_25689D230);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v132 + 8))(v73, v79);
  v82 = *(_BYTE *)(v69 + 8);
  v83 = swift_retain();
  v84 = sub_237EC3FAC(v83, v82, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  swift_getKeyPath();
  v164 = (void *)v84;
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F20();
  swift_release();
  v85 = *(_QWORD *)(v84 + 24);
  swift_release();
  v168 = v85;
  v86 = v139;
  sub_237E21EBC(v69, v139, type metadata accessor for ColorProviderGraph);
  v87 = (*(unsigned __int8 *)(v136 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v136 + 80);
  v88 = swift_allocObject();
  sub_237E47CE0(v86, v88 + v87, type metadata accessor for ColorProviderGraph);
  v164 = v79;
  v165 = v80;
  v166 = OpaqueTypeConformance2;
  v167 = v81;
  swift_getOpaqueTypeConformance2();
  v89 = v161;
  v90 = v137;
  sub_237EE2688();
  swift_release();
  (*(void (**)(char *, uint64_t))(v135 + 8))(v78, v90);
  v91 = v152;
  v92 = v151;
  v93 = v153;
  (*(void (**)(char *, char *, uint64_t))(v152 + 32))(v151, v89, v153);
  v94 = *(void (**)(char *, char *, uint64_t))(v148 + 16);
  v95 = v149;
  v96 = v150;
  v94(v149, v147, v150);
  LOBYTE(v69) = v145;
  LOBYTE(v164) = v145;
  v141 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v159 + 16);
  v97 = v160;
  ((void (*)(char *, char *, uint64_t))v141)(v160, v158, v163);
  LOBYTE(v84) = (_BYTE)v142;
  LOBYTE(v168) = (_BYTE)v142;
  v162 = *(void (**)(char *, char *, uint64_t))(v91 + 16);
  v162(v89, v92, v93);
  v98 = v140;
  v94(v140, v95, v96);
  v99 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25689D2C0);
  v100 = &v98[v99[12]];
  v101 = v127;
  v102 = v126;
  *(_QWORD *)v100 = v127;
  *((_QWORD *)v100 + 1) = v102;
  v100[16] = v69;
  *((_QWORD *)v100 + 3) = v146;
  v103 = &v98[v99[16]];
  v104 = v156;
  *(_QWORD *)v103 = v157;
  *((_QWORD *)v103 + 1) = v104;
  v156 = v104;
  v106 = v154;
  v105 = v155;
  *((_QWORD *)v103 + 2) = v154;
  *((_QWORD *)v103 + 3) = v105;
  v154 = v106;
  ((void (*)(char *, char *, uint64_t))v141)(&v98[v99[20]], v97, v163);
  v107 = &v98[v99[24]];
  v108 = v144;
  v109 = v143;
  *(_QWORD *)v107 = v144;
  *((_QWORD *)v107 + 1) = v109;
  v107[16] = v84;
  *((_QWORD *)v107 + 3) = v124;
  v110 = &v98[v99[28]];
  v111 = v153;
  v162(v110, v161, v153);
  LOBYTE(v99) = v145;
  sub_237E21EAC(v101, v102, v145);
  swift_bridgeObjectRetain();
  sub_237ECB900(v157, v104, (char)v106, v155);
  sub_237E21EAC(v108, v109, (char)v142);
  swift_bridgeObjectRetain();
  v112 = v101;
  LOBYTE(v106) = (_BYTE)v99;
  sub_237E21EAC(v101, v102, (char)v99);
  v113 = *(void (**)(char *, uint64_t))(v152 + 8);
  swift_bridgeObjectRetain();
  v114 = v111;
  v113(v151, v111);
  v115 = *(void (**)(char *, uint64_t))(v159 + 8);
  v116 = v163;
  v115(v158, v163);
  sub_237E21F3C(v101, v102, (char)v106);
  swift_bridgeObjectRelease();
  v117 = *(void (**)(char *, uint64_t))(v148 + 8);
  v118 = v150;
  v117(v147, v150);
  v113(v161, v114);
  sub_237E21F3C(v144, v143, v168);
  swift_bridgeObjectRelease();
  v115(v160, v116);
  sub_237ECB930(v157, v156, (char)v154, v155);
  sub_237E21F3C(v112, v102, (char)v164);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v117)(v149, v118);
}

uint64_t sub_237EC774C()
{
  sub_237EE2FA0();
  swift_bridgeObjectRelease();
  sub_237EC8FB4();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  type metadata accessor for ColorProviderPoint(0);
  sub_237EC8FB4();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  sub_237EC8FB4();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  sub_237EE2FA0();
  swift_bridgeObjectRelease();
  sub_237EC90DC();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  sub_237EC90DC();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  sub_237EC90DC();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0x202D2065756C6156;
}

uint64_t sub_237EC7948()
{
  type metadata accessor for ColorProviderGraph(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2D0);
  sub_237EE27D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF80);
  sub_237EE1D94();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D270);
  sub_237E22690(&qword_25689D2F0, &qword_25689CF80, MEMORY[0x24BEE12D8]);
  sub_237ECB56C();
  sub_237E20E98(&qword_25689D2F8, type metadata accessor for ColorProviderPoint, (uint64_t)&unk_237EED170);
  return sub_237EE28A4();
}

uint64_t sub_237EC7A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t OpaqueTypeConformance2;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v16 = a2;
  v3 = type metadata accessor for ColorProviderPoint(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D310);
  v6 = *(_QWORD *)(type metadata accessor for ColorProviderPoint.Sample(0) - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_237EE79C0;
  v10 = v9 + v8;
  sub_237E21EBC(a1, v10, type metadata accessor for ColorProviderPoint.Sample);
  sub_237E21EBC(a1 + *(int *)(v3 + 20), v10 + v7, type metadata accessor for ColorProviderPoint.Sample);
  sub_237E21EBC(a1 + *(int *)(v3 + 24), v10 + 2 * v7, type metadata accessor for ColorProviderPoint.Sample);
  v21 = v9;
  sub_237E21EBC(a1, (uint64_t)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ColorProviderPoint);
  v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v12 = swift_allocObject();
  sub_237E47CE0((uint64_t)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, type metadata accessor for ColorProviderPoint);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D318);
  sub_237EE1D94();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D320);
  sub_237E22690(&qword_25689D328, &qword_25689D318, MEMORY[0x24BEE12D8]);
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689D278);
  v17 = sub_237EE2040();
  v18 = MEMORY[0x24BDF3E48];
  v19 = MEMORY[0x24BDB8320];
  v20 = MEMORY[0x24BDF3E18];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v17 = v13;
  v18 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_237E20E98(&qword_25689D330, type metadata accessor for ColorProviderPoint.Sample, (uint64_t)&unk_237EED110);
  return sub_237EE28A4();
}

uint64_t sub_237EC7CB8@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v20 = a1;
  v24 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D300);
  MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_237EE2040();
  v21 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D278);
  v10 = *(_QWORD *)(v9 - 8);
  v22 = v9;
  v23 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237EE23DC();
  LODWORD(v25) = *(_DWORD *)(a2 + *(int *)(type metadata accessor for ColorProviderPoint(0) + 28));
  sub_237EE201C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EE23DC();
  v13 = v20;
  LODWORD(v25) = *v20;
  sub_237EE201C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EE2034();
  v25 = *((_QWORD *)v13 + 1);
  v14 = MEMORY[0x24BDF3E48];
  v15 = MEMORY[0x24BDB8320];
  v16 = MEMORY[0x24BDF3E18];
  sub_237EE2010();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  v25 = v6;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  swift_getOpaqueTypeConformance2();
  v17 = v22;
  sub_237EE2004();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v12, v17);
}

uint64_t sub_237EC7F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  float v15;
  uint64_t result;
  unint64_t v17;
  float v18;
  float v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ColorProviderPoint(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - v9;
  v11 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ColorProviderGraph(0) + 28));
  v12 = *v11;
  v13 = v11[1];
  v27 = *v11;
  v28 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2D0);
  sub_237EE27D8();
  v14 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRelease();
  v15 = 0.0;
  if (v14 >= 3)
  {
    v27 = v12;
    v28 = v13;
    result = sub_237EE27D8();
    if (*(_QWORD *)(v29 + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v26 = v3;
      v17 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      sub_237E21EBC(v29 + *(_QWORD *)(v5 + 72) + v17, (uint64_t)v10, type metadata accessor for ColorProviderPoint);
      swift_bridgeObjectRelease();
      v18 = *(float *)&v10[*(int *)(v4 + 28)];
      sub_237E21F00((uint64_t)v10, type metadata accessor for ColorProviderPoint);
      v27 = v12;
      v28 = v13;
      result = sub_237EE27D8();
      if (*(_QWORD *)(v29 + 16))
      {
        sub_237E21EBC(v29 + v17, (uint64_t)v7, type metadata accessor for ColorProviderPoint);
        swift_bridgeObjectRelease();
        v19 = *(float *)&v7[*(int *)(v4 + 28)];
        sub_237E21F00((uint64_t)v7, type metadata accessor for ColorProviderPoint);
        v15 = (float)(v18 - v19) * 110.0;
        v3 = v26;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_5:
  v27 = v12;
  v28 = v13;
  sub_237EE27D8();
  v20 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v20 < 0x6F)
  {
    v27 = v12;
    v28 = v13;
    sub_237EE27D8();
    if (*(_QWORD *)(v29 + 16))
    {
      sub_237E21EBC(v29 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), (uint64_t)v3, type metadata accessor for ColorProviderPoint);
      v25 = 0;
    }
    else
    {
      v25 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, v25, 1, v4);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_237E2209C((uint64_t)v3, &qword_25689CF68);
      v23 = 0.0;
LABEL_16:
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689D308);
      result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_237EE4470;
      *(float *)(result + 32) = v23;
      *(float *)(result + 36) = v15 + v23;
      return result;
    }
    v23 = *(float *)&v3[*(int *)(v4 + 28)];
    v24 = (uint64_t)v3;
LABEL_15:
    sub_237E21F00(v24, type metadata accessor for ColorProviderPoint);
    goto LABEL_16;
  }
  v27 = v12;
  v28 = v13;
  sub_237EE27D8();
  v21 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRelease();
  v27 = v12;
  v28 = v13;
  result = sub_237EE27D8();
  v22 = v21 - 110;
  if (v21 < 0x6E)
    goto LABEL_19;
  if (v22 < *(_QWORD *)(v29 + 16))
  {
    sub_237E21EBC(v29+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v22, (uint64_t)v10, type metadata accessor for ColorProviderPoint);
    swift_bridgeObjectRelease();
    v23 = *(float *)&v10[*(int *)(v4 + 28)];
    v24 = (uint64_t)v10;
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_237EC82F0()
{
  type metadata accessor for ColorProviderGraph(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2D0);
  sub_237EE27D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF80);
  sub_237EE1D94();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D278);
  sub_237E22690(&qword_25689D2F0, &qword_25689CF80, MEMORY[0x24BEE12D8]);
  sub_237EE2040();
  swift_getOpaqueTypeConformance2();
  sub_237E20E98(&qword_25689D2F8, type metadata accessor for ColorProviderPoint, (uint64_t)&unk_237EED170);
  return sub_237EE28A4();
}

uint64_t sub_237EC8430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D300);
  MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_237EE2040();
  v10 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237EE23DC();
  LODWORD(v12) = *(_DWORD *)(a1 + *(int *)(type metadata accessor for ColorProviderPoint(0) + 28));
  sub_237EE201C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EE23DC();
  LODWORD(v12) = *(_DWORD *)(a1 + 16);
  sub_237EE201C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237EE2034();
  v12 = *(_QWORD *)(a1 + 8);
  sub_237EE2010();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v7, v5);
}

uint64_t sub_237EC8634(uint64_t a1, double *a2, uint64_t a3)
{
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
  double v18;
  float v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  _OWORD v52[7];
  uint64_t v53;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v35 - v9;
  v11 = type metadata accessor for ColorProviderPoint(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v35 - v16;
  v18 = *a2;
  sub_237EC89A4((uint64_t)&v44);
  if (!*((_QWORD *)&v45 + 1))
    return sub_237E2209C((uint64_t)&v44, &qword_25689D2C8);
  v40 = v7;
  v52[4] = v48;
  v52[5] = v49;
  v52[6] = v50;
  v53 = v51;
  v52[0] = v44;
  v52[1] = v45;
  v52[2] = v46;
  v52[3] = v47;
  sub_237E2D270(v52, &v44);
  v19 = v18;
  sub_237EC8BEC(&v44, (uint64_t)v17, v19);
  v36 = type metadata accessor for ColorProviderGraph(0);
  v20 = *(int *)(v36 + 28);
  v41 = a3;
  v21 = (uint64_t *)(a3 + v20);
  v22 = *v21;
  v23 = v21[1];
  *(_QWORD *)&v44 = *v21;
  *((_QWORD *)&v44 + 1) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2D0);
  sub_237EE27D8();
  v24 = v43;
  sub_237E21EBC((uint64_t)v17, (uint64_t)v14, type metadata accessor for ColorProviderPoint);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v39 = v10;
  v37 = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v24 = sub_237E62380(0, *(_QWORD *)(v24 + 16) + 1, 1, v24);
  v27 = *(_QWORD *)(v24 + 16);
  v26 = *(_QWORD *)(v24 + 24);
  v38 = v17;
  if (v27 >= v26 >> 1)
    v24 = sub_237E62380(v26 > 1, v27 + 1, 1, v24);
  *(_QWORD *)(v24 + 16) = v27 + 1;
  v28 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v29 = *(_QWORD *)(v12 + 72);
  sub_237E47CE0((uint64_t)v14, v24 + v28 + v29 * v27, type metadata accessor for ColorProviderPoint);
  v43 = v24;
  if (*(_QWORD *)(v24 + 16) >= 0x65uLL)
  {
    sub_237ED07E0(0, 1);
    v24 = v43;
  }
  *(_QWORD *)&v44 = v22;
  *((_QWORD *)&v44 + 1) = v23;
  v42 = v24;
  sub_237EE27E4();
  *(_QWORD *)&v44 = v22;
  *((_QWORD *)&v44 + 1) = v23;
  sub_237EE27D8();
  v30 = *(_QWORD *)(v42 + 16);
  v31 = (uint64_t)v39;
  if (v30)
  {
    sub_237E21EBC(v42 + v28 + (v30 - 1) * v29, (uint64_t)v39, type metadata accessor for ColorProviderPoint);
    v32 = 0;
  }
  else
  {
    v32 = 1;
  }
  v34 = (uint64_t)v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v31, v32, 1, v37);
  swift_bridgeObjectRelease();
  sub_237E22004(v31, v34, &qword_25689CF68);
  __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  sub_237EE27E4();
  sub_237E2209C(v31, &qword_25689CF68);
  sub_237E21F00((uint64_t)v38, type metadata accessor for ColorProviderPoint);
  return sub_237ECB960((uint64_t)v52);
}

uint64_t sub_237EC89A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  __int128 v14[2];

  v3 = *(_QWORD *)(v1 + 24);
  LOBYTE(v11[0]) = *(_BYTE *)(v1 + 16);
  v11[1] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CEE8);
  sub_237EE27D8();
  v4 = *(_BYTE *)(v1 + 8);
  v5 = swift_retain();
  v6 = sub_237EC3FAC(v5, v4, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  if (LOBYTE(v14[0]) == 1)
  {
    swift_getKeyPath();
    v11[0] = v6;
    sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
    sub_237EE1F20();
    swift_release();
    v7 = v6 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__colorPalette;
    swift_beginAccess();
    sub_237E22004(v7, (uint64_t)v11, &qword_25689AB00);
    result = swift_release();
    if (v12)
    {
      v9 = &v13;
      goto LABEL_6;
    }
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  v11[0] = v6;
  sub_237E20E98(&qword_256898680, (uint64_t (*)(uint64_t))type metadata accessor for SolarViewModel, (uint64_t)&unk_237EE9F0C);
  sub_237EE1F20();
  swift_release();
  v10 = v6 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__colorPalette;
  swift_beginAccess();
  sub_237E22004(v10, (uint64_t)v11, &qword_25689AB00);
  result = swift_release();
  if (!v12)
    goto LABEL_10;
  v9 = v11;
LABEL_6:
  sub_237E2CFE8((uint64_t)v9, (uint64_t)v14);
  sub_237E79AC0((uint64_t)v11);
  sub_237E2D1BC(v14, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2E8);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *(_QWORD *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t sub_237EC8BEC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _BYTE v37[40];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v36 = type metadata accessor for ColorProviderPoint.Sample(0);
  MEMORY[0x24BDAC7A8](v36);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - v9;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - v12;
  v14 = (int *)type metadata accessor for ColorProviderPoint(0);
  sub_237EE1D88();
  v15 = a1[3];
  v16 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v15);
  v17 = (*(float (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  v19 = a1[8];
  v18 = a1[9];
  __swift_project_boxed_opaque_existential_1(a1 + 5, v19);
  v20 = (*(float (**)(uint64_t, uint64_t))(v18 + 8))(v19, v18);
  v21 = a1[13];
  v22 = a1[14];
  v35 = a1 + 10;
  __swift_project_boxed_opaque_existential_1(a1 + 10, v21);
  v23 = (*(float (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
  *(float *)(a2 + v14[7]) = a3;
  v24 = sub_237EE26DC();
  sub_237E2CFE8((uint64_t)a1, (uint64_t)v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D2D8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    noise2();
    v26 = v25;
    sub_237ECB994((uint64_t)&v38);
  }
  else
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    sub_237E2209C((uint64_t)&v38, &qword_25689D2E0);
    v26 = 0;
  }
  *(float *)v13 = v17;
  *((_QWORD *)v13 + 1) = v24;
  *((_DWORD *)v13 + 4) = v26;
  sub_237EE1D88();
  sub_237E47CE0((uint64_t)v13, a2, type metadata accessor for ColorProviderPoint.Sample);
  v27 = sub_237EE26DC();
  sub_237E2CFE8((uint64_t)(a1 + 5), (uint64_t)v37);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    noise2();
    v29 = v28;
    sub_237ECB994((uint64_t)&v38);
  }
  else
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    sub_237E2209C((uint64_t)&v38, &qword_25689D2E0);
    v29 = 0;
  }
  *(float *)v10 = v20;
  *((_QWORD *)v10 + 1) = v27;
  *((_DWORD *)v10 + 4) = v29;
  sub_237EE1D88();
  sub_237E47CE0((uint64_t)v10, a2 + v14[5], type metadata accessor for ColorProviderPoint.Sample);
  v30 = sub_237EE26DC();
  sub_237E2CFE8((uint64_t)v35, (uint64_t)v37);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    noise2();
    v32 = v31;
    sub_237ECB994((uint64_t)&v38);
  }
  else
  {
    v40 = 0;
    v38 = 0u;
    v39 = 0u;
    sub_237E2209C((uint64_t)&v38, &qword_25689D2E0);
    v32 = 0;
  }
  *(float *)v7 = v23;
  *((_QWORD *)v7 + 1) = v30;
  *((_DWORD *)v7 + 4) = v32;
  sub_237EE1D88();
  sub_237ECB960((uint64_t)a1);
  return sub_237E47CE0((uint64_t)v7, a2 + v14[6], type metadata accessor for ColorProviderPoint.Sample);
}

uint64_t sub_237EC8FB4()
{
  float *v0;
  float v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v1 = roundf(*v0 * 100.0);
  if ((~LODWORD(v1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v1 <= -9.2234e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v1 >= 9.2234e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (((uint64_t)v1 & 0x8000000000000000) == 0)
  {
    v2 = 32;
LABEL_8:
    v4 = v2;
    sub_237EE2AF0();
    swift_bridgeObjectRelease();
    sub_237EE2AF0();
    swift_bridgeObjectRelease();
    sub_237EE3180();
    sub_237EE2AF0();
    swift_bridgeObjectRelease();
    return v4;
  }
  if (!__OFSUB__(0, (uint64_t)v1))
  {
    v2 = 45;
    goto LABEL_8;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_237EC90DC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_DWORD *)(v0 + 16);
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689D9E0);
  v2 = swift_allocObject();
  v3 = MEMORY[0x24BEE14E8];
  *(_OWORD *)(v2 + 16) = xmmword_237EE55E0;
  v4 = MEMORY[0x24BEE1568];
  *(_QWORD *)(v2 + 56) = v3;
  *(_QWORD *)(v2 + 64) = v4;
  *(_DWORD *)(v2 + 32) = v1;
  sub_237EE2A90();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_237EC91A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_237EE1D94();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_237EC91E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_237EE1D94();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_237EC9224@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_237EE2310();
  *a1 = result;
  return result;
}

uint64_t sub_237EC924C()
{
  return sub_237EE231C();
}

uint64_t sub_237EC9270@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_237EC4AD8(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_237EC9278()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689CF50;
  if (!qword_25689CF50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689CF08);
    v2[0] = sub_237E22690(&qword_25689CF58, &qword_25689CF00, MEMORY[0x24BDEB238]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689CF50);
  }
  return result;
}

uint64_t type metadata accessor for ColorProviderGraph(uint64_t a1)
{
  return sub_237E42BC0(a1, (uint64_t *)&unk_25689D1B8);
}

uint64_t type metadata accessor for ColorProviderPoint(uint64_t a1)
{
  return sub_237E42BC0(a1, qword_25689D078);
}

uint64_t sub_237EC9328(uint64_t a1)
{
  uint64_t v1;

  return sub_237EC5E34(a1, v1 + 16);
}

uint64_t sub_237EC9330(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_237EC93A0()
{
  unint64_t result;

  result = qword_25689CFA0;
  if (!qword_25689CFA0)
  {
    result = MEMORY[0x23B8271D0](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_25689CFA0);
  }
  return result;
}

uint64_t sub_237EC93EC()
{
  uint64_t v0;

  return sub_237E76C90(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_237EC9414()
{
  return sub_237EC5AE8();
}

uint64_t sub_237EC941C@<X0>(uint64_t *a1@<X8>)
{
  return sub_237EC5B60(a1);
}

unint64_t sub_237EC9424()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25689CFF0;
  if (!qword_25689CFF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689CFE8);
    v2 = sub_237E22690(&qword_25689CFF8, &qword_25689D000, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25689CFF0);
  }
  return result;
}

uint64_t sub_237EC94A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_237EE2340();
  *a1 = result;
  return result;
}

uint64_t sub_237EC94D0()
{
  swift_retain();
  return sub_237EE234C();
}

unint64_t sub_237EC94F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689D008;
  if (!qword_25689D008)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689CFD8);
    v2[0] = sub_237E22690(&qword_25689D010, &qword_25689CFD0, MEMORY[0x24BDF43B0]);
    v2[1] = sub_237E22690(&qword_25689CFF8, &qword_25689D000, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689D008);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EC95E4()
{
  return sub_237EC5C8C();
}

uint64_t sub_237EC95EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_237EC5D04(*(_QWORD *)(v1 + 16), a1);
}

char *sub_237EC95F4(uint64_t a1, uint64_t *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  char *v14;
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
  uint64_t v26;

  v4 = (char *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (char *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    v7 = type metadata accessor for ColorProviderPoint.Sample(0);
    v8 = *(int *)(v7 + 28);
    v9 = &v4[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = sub_237EE1D94();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    v13 = a3[5];
    v14 = &v4[v13];
    v15 = (uint64_t)a2 + v13;
    *(_DWORD *)v14 = *(_DWORD *)v15;
    *((_QWORD *)v14 + 1) = *(_QWORD *)(v15 + 8);
    *((_DWORD *)v14 + 4) = *(_DWORD *)(v15 + 16);
    v16 = *(int *)(v7 + 28);
    v17 = &v14[v16];
    v18 = v15 + v16;
    swift_retain();
    v12(v17, v18, v11);
    v19 = a3[6];
    v20 = &v4[v19];
    v21 = (uint64_t)a2 + v19;
    *(_DWORD *)v20 = *(_DWORD *)v21;
    *((_QWORD *)v20 + 1) = *(_QWORD *)(v21 + 8);
    *((_DWORD *)v20 + 4) = *(_DWORD *)(v21 + 16);
    v22 = *(int *)(v7 + 28);
    v23 = &v20[v22];
    v24 = v21 + v22;
    swift_retain();
    v12(v23, v24, v11);
    v25 = a3[8];
    *(_DWORD *)&v4[a3[7]] = *(_DWORD *)((char *)a2 + a3[7]);
    v12(&v4[v25], (uint64_t)a2 + v25, v11);
  }
  return v4;
}

uint64_t type metadata accessor for ColorProviderPoint.Sample(uint64_t a1)
{
  return sub_237E42BC0(a1, qword_25689D118);
}

uint64_t sub_237EC977C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t);

  swift_release();
  v4 = type metadata accessor for ColorProviderPoint.Sample(0);
  v5 = a1 + *(int *)(v4 + 28);
  v6 = sub_237EE1D94();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v10(v5, v6);
  v7 = a1 + a2[5];
  swift_release();
  v10(v7 + *(int *)(v4 + 28), v6);
  v8 = a1 + a2[6];
  swift_release();
  v10(v8 + *(int *)(v4 + 28), v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(a1 + a2[8], v6);
}

uint64_t sub_237EC9850(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
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

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  v7 = *(int *)(v6 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D94();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_retain();
  v11(v8, v9, v10);
  v12 = a3[5];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v15 = *(int *)(v6 + 28);
  v16 = v13 + v15;
  v17 = v14 + v15;
  swift_retain();
  v11(v16, v17, v10);
  v18 = a3[6];
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_DWORD *)v19 = *(_DWORD *)v20;
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(v20 + 16);
  v21 = *(int *)(v6 + 28);
  v22 = v19 + v21;
  v23 = v20 + v21;
  swift_retain();
  v11(v22, v23, v10);
  v24 = a3[8];
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + v24, a2 + v24, v10);
  return a1;
}

uint64_t sub_237EC9998(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  v7 = *(int *)(v6 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D94();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v12 = a3[5];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)(a2 + v12);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(a2 + v12 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v11(v13 + *(int *)(v6 + 28), v14 + *(int *)(v6 + 28), v10);
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_DWORD *)v16 = *(_DWORD *)(a2 + v15);
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(a2 + v15 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(v16 + 16) = *(_DWORD *)(v17 + 16);
  v11(v16 + *(int *)(v6 + 28), v17 + *(int *)(v6 + 28), v10);
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + a3[8], a2 + a3[8], v10);
  return a1;
}

uint64_t sub_237EC9AF4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  v7 = *(int *)(v6 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D94();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v12 = a3[5];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v11(v13 + *(int *)(v6 + 28), v14 + *(int *)(v6 + 28), v10);
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_DWORD *)v16 = *(_DWORD *)v17;
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
  *(_DWORD *)(v16 + 16) = *(_DWORD *)(v17 + 16);
  v11(v16 + *(int *)(v6 + 28), v17 + *(int *)(v6 + 28), v10);
  v18 = a3[8];
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + v18, a2 + v18, v10);
  return a1;
}

uint64_t sub_237EC9C14(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  v7 = *(int *)(v6 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D94();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v12 = a3[5];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_DWORD *)v13 = *(_DWORD *)(a2 + v12);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(a2 + v12 + 8);
  swift_release();
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v11(v13 + *(int *)(v6 + 28), v14 + *(int *)(v6 + 28), v10);
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_DWORD *)v16 = *(_DWORD *)(a2 + v15);
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(a2 + v15 + 8);
  swift_release();
  *(_DWORD *)(v16 + 16) = *(_DWORD *)(v17 + 16);
  v11(v16 + *(int *)(v6 + 28), v17 + *(int *)(v6 + 28), v10);
  v18 = a3[8];
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + v18, a2 + v18, v10);
  return a1;
}

uint64_t sub_237EC9D4C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237EC9D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_237EE1D94();
    v10 = a1 + *(int *)(a3 + 32);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_237EC9DCC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237EC9DD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for ColorProviderPoint.Sample(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_237EE1D94();
    v12 = a1 + *(int *)(a4 + 32);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_237EC9E54()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for ColorProviderPoint.Sample(319);
  if (v1 <= 0x3F)
  {
    result = sub_237EE1D94();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *sub_237EC9EE8(uint64_t a1, uint64_t *a2, uint64_t a3)
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
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    v5 = *(int *)(a3 + 28);
    v6 = a1 + v5;
    v7 = (uint64_t)a2 + v5;
    v8 = sub_237EE1D94();
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    swift_retain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_237EC9F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_237EE1D94();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_237EC9FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_237EE1D94();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t sub_237ECA05C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_237ECA0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_237ECA14C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_237ECA1C8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ECA1D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_237EE1D94();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_237ECA250()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ECA25C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_237EE1D94();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_237ECA2D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237EE1D94();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237ECA358(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  char v7;
  uint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  int *v11;
  uint64_t v12;
  unsigned int (*v13)(_DWORD *, uint64_t, int *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  uint64_t v41;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = v15 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = *((_BYTE *)a2 + 8);
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v8 = *(int *)(a3 + 24);
    v9 = (_DWORD *)(a1 + v8);
    v10 = (_DWORD *)((char *)a2 + v8);
    v11 = (int *)type metadata accessor for ColorProviderPoint(0);
    v12 = *((_QWORD *)v11 - 1);
    v13 = *(unsigned int (**)(_DWORD *, uint64_t, int *))(v12 + 48);
    swift_retain();
    swift_retain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      *v9 = *v10;
      *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
      v9[4] = v10[4];
      v40 = type metadata accessor for ColorProviderPoint.Sample(0);
      v41 = v12;
      v16 = *(int *)(v40 + 28);
      v17 = (char *)v9 + v16;
      v38 = (char *)v10 + v16;
      v18 = sub_237EE1D94();
      v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
      v39 = v19;
      swift_retain();
      v19(v17, v38, v18);
      v20 = v11[5];
      v21 = (char *)v9 + v20;
      v22 = (char *)v10 + v20;
      *(_DWORD *)v21 = *(_DWORD *)v22;
      *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
      *((_DWORD *)v21 + 4) = *((_DWORD *)v22 + 4);
      v23 = *(int *)(v40 + 28);
      v24 = &v21[v23];
      v25 = &v22[v23];
      swift_retain();
      v19(v24, v25, v18);
      v26 = v11[6];
      v27 = (char *)v9 + v26;
      v28 = (char *)v10 + v26;
      *(_DWORD *)v27 = *(_DWORD *)v28;
      *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
      *((_DWORD *)v27 + 4) = *((_DWORD *)v28 + 4);
      v29 = *(int *)(v40 + 28);
      v30 = &v27[v29];
      v31 = &v28[v29];
      swift_retain();
      v39(v30, v31, v18);
      *(_DWORD *)((char *)v9 + v11[7]) = *(_DWORD *)((char *)v10 + v11[7]);
      v39((char *)v9 + v11[8], (char *)v10 + v11[8], v18);
      (*(void (**)(_DWORD *, _QWORD, uint64_t, int *))(v41 + 56))(v9, 0, 1, v11);
    }
    v32 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
    *(_QWORD *)((char *)v9 + *(int *)(v32 + 28)) = *(_QWORD *)((char *)v10 + *(int *)(v32 + 28));
    v33 = *(int *)(a3 + 28);
    v34 = (_QWORD *)(v4 + v33);
    v35 = (uint64_t *)((char *)a2 + v33);
    v36 = v35[1];
    *v34 = *v35;
    v34[1] = v36;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_237ECA5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = (int *)type metadata accessor for ColorProviderPoint(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v5 - 1) + 48))(v4, 1, v5))
  {
    swift_release();
    v6 = type metadata accessor for ColorProviderPoint.Sample(0);
    v7 = v4 + *(int *)(v6 + 28);
    v8 = sub_237EE1D94();
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v9(v7, v8);
    v10 = v4 + v5[5];
    swift_release();
    v9(v10 + *(int *)(v6 + 28), v8);
    v11 = v4 + v5[6];
    swift_release();
    v9(v11 + *(int *)(v6 + 28), v8);
    v9(v4 + v5[8], v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_237ECA6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  int *v10;
  uint64_t v11;
  unsigned int (*v12)(_DWORD *, uint64_t, int *);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v3 = a3;
  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v7 = *(int *)(a3 + 24);
  v8 = (_DWORD *)(a1 + v7);
  v9 = (_DWORD *)(a2 + v7);
  v10 = (int *)type metadata accessor for ColorProviderPoint(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(unsigned int (**)(_DWORD *, uint64_t, int *))(v11 + 48);
  swift_retain();
  swift_retain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    *v8 = *v9;
    *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
    v8[4] = v9[4];
    v39 = v3;
    v14 = type metadata accessor for ColorProviderPoint.Sample(0);
    v15 = *(int *)(v14 + 28);
    v37 = (char *)v8 + v15;
    v16 = (char *)v9 + v15;
    v17 = sub_237EE1D94();
    v38 = v11;
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    swift_retain();
    v18(v37, v16, v17);
    v19 = v10[5];
    v20 = (char *)v8 + v19;
    v21 = (char *)v9 + v19;
    *(_DWORD *)v20 = *(_DWORD *)v21;
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    *((_DWORD *)v20 + 4) = *((_DWORD *)v21 + 4);
    v22 = *(int *)(v14 + 28);
    v23 = &v20[v22];
    v24 = &v21[v22];
    swift_retain();
    v18(v23, v24, v17);
    v25 = v10[6];
    v26 = (char *)v8 + v25;
    v27 = (char *)v9 + v25;
    *(_DWORD *)v26 = *(_DWORD *)v27;
    *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
    *((_DWORD *)v26 + 4) = *((_DWORD *)v27 + 4);
    v28 = *(int *)(v14 + 28);
    v3 = v39;
    v29 = &v26[v28];
    v30 = &v27[v28];
    swift_retain();
    v18(v29, v30, v17);
    *(_DWORD *)((char *)v8 + v10[7]) = *(_DWORD *)((char *)v9 + v10[7]);
    v18((char *)v8 + v10[8], (char *)v9 + v10[8], v17);
    (*(void (**)(_DWORD *, _QWORD, uint64_t, int *))(v38 + 56))(v8, 0, 1, v10);
  }
  v31 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  *(_QWORD *)((char *)v8 + *(int *)(v31 + 28)) = *(_QWORD *)((char *)v9 + *(int *)(v31 + 28));
  v32 = *(int *)(v3 + 28);
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_237ECA940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
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
  void (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = (int *)type metadata accessor for ColorProviderPoint(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *(_DWORD *)v8 = *(_DWORD *)v9;
      *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
      swift_retain();
      swift_release();
      *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
      v38 = type metadata accessor for ColorProviderPoint.Sample(0);
      v39 = *(int *)(v38 + 28);
      v40 = v8 + v39;
      v41 = v9 + v39;
      v42 = sub_237EE1D94();
      v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 24);
      v54(v40, v41, v42);
      v43 = v10[5];
      v44 = v8 + v43;
      v56 = a3;
      v45 = v9 + v43;
      *(_DWORD *)v44 = *(_DWORD *)(v9 + v43);
      *(_QWORD *)(v44 + 8) = *(_QWORD *)(v9 + v43 + 8);
      swift_retain();
      swift_release();
      *(_DWORD *)(v44 + 16) = *(_DWORD *)(v45 + 16);
      v54(v44 + *(int *)(v38 + 28), v45 + *(int *)(v38 + 28), v42);
      v46 = v10[6];
      v47 = v8 + v46;
      v48 = v9 + v46;
      *(_DWORD *)v47 = *(_DWORD *)(v9 + v46);
      *(_QWORD *)(v47 + 8) = *(_QWORD *)(v9 + v46 + 8);
      swift_retain();
      swift_release();
      *(_DWORD *)(v47 + 16) = *(_DWORD *)(v48 + 16);
      v49 = *(int *)(v38 + 28);
      v50 = v47 + v49;
      a3 = v56;
      v54(v50, v48 + v49, v42);
      *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
      v54(v8 + v10[8], v9 + v10[8], v42);
      goto LABEL_7;
    }
    sub_237E21F00(v8, type metadata accessor for ColorProviderPoint);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
    memcpy((void *)v8, (const void *)v9, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_7;
  }
  *(_DWORD *)v8 = *(_DWORD *)v9;
  v55 = a3;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
  v53 = type metadata accessor for ColorProviderPoint.Sample(0);
  v15 = *(int *)(v53 + 28);
  v51 = v8 + v15;
  v16 = v9 + v15;
  v17 = sub_237EE1D94();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
  v52 = v18;
  swift_retain();
  v18(v51, v16, v17);
  v19 = v10[5];
  v20 = v8 + v19;
  v21 = v9 + v19;
  *(_DWORD *)v20 = *(_DWORD *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  *(_DWORD *)(v20 + 16) = *(_DWORD *)(v21 + 16);
  v22 = *(int *)(v53 + 28);
  v23 = v20 + v22;
  v24 = v21 + v22;
  swift_retain();
  v18(v23, v24, v17);
  v25 = v10[6];
  v26 = v8 + v25;
  v27 = v9 + v25;
  *(_DWORD *)v26 = *(_DWORD *)v27;
  *(_QWORD *)(v26 + 8) = *(_QWORD *)(v27 + 8);
  *(_DWORD *)(v26 + 16) = *(_DWORD *)(v27 + 16);
  v28 = *(int *)(v53 + 28);
  v29 = v26 + v28;
  v30 = v27 + v28;
  swift_retain();
  v31 = v30;
  a3 = v55;
  v52(v29, v31, v17);
  *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
  v52(v8 + v10[8], v9 + v10[8], v17);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v33 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  *(_QWORD *)(v8 + *(int *)(v33 + 28)) = *(_QWORD *)(v9 + *(int *)(v33 + 28));
  swift_retain();
  swift_release();
  v34 = *(int *)(a3 + 28);
  v35 = a1 + v34;
  v36 = a2 + v34;
  *(_QWORD *)(a1 + v34) = *(_QWORD *)(a2 + v34);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v35 + 8) = *(_QWORD *)(v36 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_237ECAD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = (_DWORD *)(a1 + v6);
  v8 = (_DWORD *)(a2 + v6);
  v9 = (int *)type metadata accessor for ColorProviderPoint(0);
  v10 = *((_QWORD *)v9 - 1);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    *v7 = *v8;
    *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
    v7[4] = v8[4];
    v26 = v10;
    v12 = type metadata accessor for ColorProviderPoint.Sample(0);
    v13 = *(int *)(v12 + 28);
    v14 = (char *)v7 + v13;
    v15 = (char *)v8 + v13;
    v16 = sub_237EE1D94();
    v27 = v3;
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32);
    v17(v14, v15, v16);
    v18 = v9[5];
    v19 = (char *)v7 + v18;
    v20 = (char *)v8 + v18;
    *(_DWORD *)v19 = *(_DWORD *)v20;
    *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
    *((_DWORD *)v19 + 4) = *((_DWORD *)v20 + 4);
    v17(&v19[*(int *)(v12 + 28)], &v20[*(int *)(v12 + 28)], v16);
    v21 = v9[6];
    v22 = (char *)v7 + v21;
    v23 = (char *)v8 + v21;
    *(_DWORD *)v22 = *(_DWORD *)v23;
    *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
    *((_DWORD *)v22 + 4) = *((_DWORD *)v23 + 4);
    v17(&v22[*(int *)(v12 + 28)], &v23[*(int *)(v12 + 28)], v16);
    *(_DWORD *)((char *)v7 + v9[7]) = *(_DWORD *)((char *)v8 + v9[7]);
    v17((char *)v7 + v9[8], (char *)v8 + v9[8], v16);
    v3 = v27;
    (*(void (**)(_DWORD *, _QWORD, uint64_t, int *))(v26 + 56))(v7, 0, 1, v9);
  }
  v24 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  *(_QWORD *)((char *)v7 + *(int *)(v24 + 28)) = *(_QWORD *)((char *)v8 + *(int *)(v24 + 28));
  *(_OWORD *)(a1 + *(int *)(v3 + 28)) = *(_OWORD *)(a2 + *(int *)(v3 + 28));
  return a1;
}

uint64_t sub_237ECAF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
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
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
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

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = (int *)type metadata accessor for ColorProviderPoint(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *(_DWORD *)v8 = *(_DWORD *)v9;
      *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
      swift_release();
      *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
      v33 = type metadata accessor for ColorProviderPoint.Sample(0);
      v34 = *(int *)(v33 + 28);
      v49 = a3;
      v35 = v8 + v34;
      v36 = v9 + v34;
      v37 = sub_237EE1D94();
      v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 40);
      v38(v35, v36, v37);
      v39 = v10[5];
      v40 = v8 + v39;
      v41 = v9 + v39;
      *(_DWORD *)v40 = *(_DWORD *)(v9 + v39);
      *(_QWORD *)(v40 + 8) = *(_QWORD *)(v9 + v39 + 8);
      swift_release();
      *(_DWORD *)(v40 + 16) = *(_DWORD *)(v41 + 16);
      v38(v40 + *(int *)(v33 + 28), v41 + *(int *)(v33 + 28), v37);
      v42 = v10[6];
      v43 = v8 + v42;
      v44 = v9 + v42;
      *(_DWORD *)v43 = *(_DWORD *)(v9 + v42);
      *(_QWORD *)(v43 + 8) = *(_QWORD *)(v9 + v42 + 8);
      swift_release();
      *(_DWORD *)(v43 + 16) = *(_DWORD *)(v44 + 16);
      v45 = *(int *)(v33 + 28);
      v46 = v43 + v45;
      a3 = v49;
      v38(v46, v44 + v45, v37);
      *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
      v38(v8 + v10[8], v9 + v10[8], v37);
      goto LABEL_7;
    }
    sub_237E21F00(v8, type metadata accessor for ColorProviderPoint);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689CF68);
    memcpy((void *)v8, (const void *)v9, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  *(_DWORD *)v8 = *(_DWORD *)v9;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
  v15 = type metadata accessor for ColorProviderPoint.Sample(0);
  v16 = *(int *)(v15 + 28);
  v47 = v8 + v16;
  v48 = a3;
  v17 = v9 + v16;
  v18 = sub_237EE1D94();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32);
  v20 = v17;
  a3 = v48;
  v19(v47, v20, v18);
  v21 = v10[5];
  v22 = v8 + v21;
  v23 = v9 + v21;
  *(_DWORD *)v22 = *(_DWORD *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  *(_DWORD *)(v22 + 16) = *(_DWORD *)(v23 + 16);
  v19(v22 + *(int *)(v15 + 28), v23 + *(int *)(v15 + 28), v18);
  v24 = v10[6];
  v25 = v8 + v24;
  v26 = v9 + v24;
  *(_DWORD *)v25 = *(_DWORD *)v26;
  *(_QWORD *)(v25 + 8) = *(_QWORD *)(v26 + 8);
  *(_DWORD *)(v25 + 16) = *(_DWORD *)(v26 + 16);
  v19(v25 + *(int *)(v15 + 28), v26 + *(int *)(v15 + 28), v18);
  *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
  v19(v8 + v10[8], v9 + v10[8], v18);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  *(_QWORD *)(v8 + *(int *)(v28 + 28)) = *(_QWORD *)(v9 + *(int *)(v28 + 28));
  swift_release();
  v29 = *(int *)(a3 + 28);
  v30 = a1 + v29;
  v31 = (_QWORD *)(a2 + v29);
  *(_QWORD *)(a1 + v29) = *v31;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v30 + 8) = v31[1];
  swift_release();
  return a1;
}

uint64_t sub_237ECB258()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ECB264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_237ECB2E8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ECB2F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

void sub_237ECB374()
{
  unint64_t v0;

  sub_237ECB3F8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_237ECB3F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25689D1C8[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689CF68);
    v0 = sub_237EE27FC();
    if (!v1)
      atomic_store(v0, qword_25689D1C8);
  }
}

unint64_t sub_237ECB454()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25689D200;
  if (!qword_25689D200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689CED0);
    v2[0] = sub_237E22690(&qword_25689D208, &qword_25689CEC0, MEMORY[0x24BDF4498]);
    v2[1] = sub_237E22690(&qword_256898AA0, &qword_256898A90, MEMORY[0x24BDF0710]);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689D200);
  }
  return result;
}

uint64_t sub_237ECB4F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237ECB500()
{
  return sub_237EC7948();
}

unint64_t sub_237ECB508()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25689D260;
  if (!qword_25689D260)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689D258);
    v2 = sub_237ECB56C();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDB8490], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25689D260);
  }
  return result;
}

unint64_t sub_237ECB56C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];

  result = qword_25689D268;
  if (!qword_25689D268)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689D270);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689D278);
    sub_237EE2040();
    v3[3] = MEMORY[0x24BDB8320];
    v3[4] = MEMORY[0x24BDF3E18];
    v3[1] = v2;
    v3[2] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDB8490], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25689D268);
  }
  return result;
}

uint64_t sub_237ECB630(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3;
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDB84B8], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_237ECB684()
{
  return sub_237EC82F0();
}

unint64_t sub_237ECB68C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[5];

  result = qword_25689D2B0;
  if (!qword_25689D2B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689D2A8);
    v2[1] = sub_237EE2040();
    v2[2] = MEMORY[0x24BDF3E48];
    v2[3] = MEMORY[0x24BDB8320];
    v2[4] = MEMORY[0x24BDF3E18];
    v2[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDB8490], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25689D2B0);
  }
  return result;
}

uint64_t sub_237ECB730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for ColorProviderGraph(0);
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  swift_release();
  swift_release();
  v3 = v2 + *(int *)(v1 + 24);
  v4 = (int *)type metadata accessor for ColorProviderPoint(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((_QWORD *)v4 - 1) + 48))(v3, 1, v4))
  {
    swift_release();
    v5 = type metadata accessor for ColorProviderPoint.Sample(0);
    v6 = v3 + *(int *)(v5 + 28);
    v7 = sub_237EE1D94();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v8(v6, v7);
    v9 = v3 + v4[5];
    swift_release();
    v8(v9 + *(int *)(v5 + 28), v7);
    v10 = v3 + v4[6];
    swift_release();
    v8(v10 + *(int *)(v5 + 28), v7);
    v8(v3 + v4[8], v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25689D158);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237ECB8B4(uint64_t a1, double *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorProviderGraph(0) - 8) + 80);
  return sub_237EC8634(a1, a2, v2 + ((v5 + 16) & ~v5));
}

uint64_t sub_237ECB900(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_237E21EAC(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_237ECB930(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_237E21F3C(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_237ECB960(uint64_t a1)
{
  destroy for ColorProvider(a1);
  return a1;
}

uint64_t sub_237ECB994(uint64_t a1)
{
  destroy for NoiseColorChannelGenerator();
  return a1;
}

uint64_t sub_237ECB9D0()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v1 = (int *)type metadata accessor for ColorProviderPoint(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  v4 = type metadata accessor for ColorProviderPoint.Sample(0);
  v5 = v3 + *(int *)(v4 + 28);
  v6 = sub_237EE1D94();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = v3 + v1[5];
  swift_release();
  v7(v8 + *(int *)(v4 + 28), v6);
  v9 = v3 + v1[6];
  swift_release();
  v7(v9 + *(int *)(v4 + 28), v6);
  v7(v3 + v1[8], v6);
  return swift_deallocObject();
}

uint64_t sub_237ECBACC@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ColorProviderPoint(0) - 8) + 80);
  return sub_237EC7CB8(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_237ECBB18()
{
  return sub_237E22690(&qword_25689D338, &qword_25689D340, MEMORY[0x24BDF5428]);
}

uint64_t sub_237ECBB44()
{
  return sub_237EC93EC();
}

uint64_t sub_237ECBB58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_237EE2C64();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_237EE2C58();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_237E2209C(a1, &qword_256897E20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_237EE2C28();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_237ECBC8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_237EE2C64();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_237EE2C58();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_237E2209C(a1, &qword_256897E20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_237EE2C28();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689C120);
  return swift_task_create();
}

uint64_t sub_237ECBDC0(unint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_237E46E78(v3);
  v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[a1];
      v8 = v7[4];
      memmove(v7 + 4, v7 + 5, 8 * v6);
      v3[2] = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t sub_237ECBE90@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t *v2;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_237E46E8C(v5);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6 - 1;
  v8 = sub_237EE1D94();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    result = sub_237EE30D8();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  *(_QWORD *)(v5 + 16) = v7;
  *v2 = v5;
  return result;
}

uint64_t sub_237ECBFCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (qword_256897B48 != -1)
    swift_once();
  v0 = qword_25689B990;
  swift_retain();
  v1 = sub_237EE3318();
  v3 = v2;
  type metadata accessor for Scheduler();
  v4 = swift_allocObject();
  result = sub_237ECC96C(v0, v1, v3);
  qword_25689DFF0 = v4;
  return result;
}

uint64_t sub_237ECC064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237EE2C64();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  if ((_DWORD)a1 == 1)
  {
    sub_237E2209C((uint64_t)v6, &qword_256897E20);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    sub_237EE2C58();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_237EE2C28();
      v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_25689D600;
  *(_QWORD *)(v13 + 24) = v9;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_237ECC240(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_237E487A8;
  return v7();
}

uint64_t (*sub_237ECC294(uint64_t *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;

  v32 = a2;
  v6 = type metadata accessor for ScheduledTask();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689D598);
  v12 = swift_allocBox();
  v14 = v13;
  v15 = sub_237EE1D94();
  v16 = *(_QWORD *)(v15 - 8);
  v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
  v31(v14, 1, 1, v15);
  v17 = (os_unfair_lock_s *)(*(_QWORD *)(v3 + 80) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v17);
  swift_endAccess();
  if (!*(_QWORD *)(v3 + 40))
  {
    v28 = *(_QWORD *)(v3 + 32);
    v18 = sub_237EE2C64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 1, 1, v18);
    v19 = swift_allocObject();
    v30 = v12;
    v20 = v19;
    swift_weakInit();
    v21 = (_QWORD *)swift_allocObject();
    v29 = a1;
    v22 = a3;
    v23 = v21;
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = v28;
    v21[5] = v20;
    v12 = v30;
    swift_retain();
    v24 = (uint64_t)v23;
    a3 = v22;
    a1 = v29;
    *(_QWORD *)(v3 + 40) = sub_237ECBB58((uint64_t)v11, (uint64_t)&unk_25689D5D0, v24);
    swift_release();
  }
  sub_237ECD654(v32, a3, a1, (uint64_t)v8);
  sub_237E2209C(v14, &qword_25689D598);
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 16))(v14, v8, v15);
  v31(v14, 0, 1, v15);
  if (*(_BYTE *)(v3 + 48) == 1)
    sub_237ECDD28((uint64_t)v8);
  sub_237ECF76C((uint64_t)v8);
  swift_beginAccess();
  os_unfair_lock_unlock(v17);
  swift_endAccess();
  v25 = swift_allocObject();
  swift_weakInit();
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v25;
  *(_QWORD *)(v26 + 24) = v12;
  return sub_237ECFB5C;
}

uint64_t sub_237ECC550()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  os_unfair_lock_s *v3;

  v0 = swift_projectBox();
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v2 = result;
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(result + 80) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v3);
    swift_endAccess();
    sub_237ECC610(v2, v0);
    swift_beginAccess();
    os_unfair_lock_unlock(v3);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_237ECC610(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B6E8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D598);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - v14;
  swift_beginAccess();
  sub_237E22004(a2, (uint64_t)v15, &qword_25689D598);
  v16 = sub_237EE1D94();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  result = v18(v15, 1, v16);
  if ((_DWORD)result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v20 = type metadata accessor for ScheduledTask();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v6, 1, 1, v20);
  swift_beginAccess();
  sub_237E8F26C((uint64_t)v6, (uint64_t)v15);
  swift_endAccess();
  swift_beginAccess();
  sub_237E22004(a2, (uint64_t)v12, &qword_25689D598);
  result = v18(v12, 1, v16);
  if ((_DWORD)result != 1)
  {
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)(a1 + 64) + 16))
    {
      swift_bridgeObjectRetain();
      sub_237EAD3B4((uint64_t)v12);
      if ((v21 & 1) != 0)
      {
        swift_retain();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA00);
        sub_237EE2CAC();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    v22 = *(void (**)(char *, uint64_t))(v17 + 8);
    v22(v12, v16);
    swift_beginAccess();
    sub_237E22004(a2, (uint64_t)v9, &qword_25689D598);
    result = v18(v9, 1, v16);
    if ((_DWORD)result == 1)
      goto LABEL_13;
    swift_beginAccess();
    sub_237E97BE0((uint64_t)v9);
    v22(v9, v16);
    swift_endAccess();
    swift_release();
    swift_beginAccess();
    result = sub_237ECFC14((unint64_t *)(a1 + 72), a2);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 16);
    if (v23 >= result)
    {
      sub_237ED07F4(result, v23, (uint64_t (*)(void))sub_237E625A0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
      return swift_endAccess();
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_237ECC96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B9E8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v28 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 56) = v16;
  *(_QWORD *)(v3 + 64) = v16;
  *(_QWORD *)(v3 + 72) = MEMORY[0x24BEE4AF8];
  type metadata accessor for CPUnfairLock();
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v3 + 80) = v17;
  *(_QWORD *)(v3 + 24) = a3;
  *(_QWORD *)(v3 + 32) = a1;
  *(_QWORD *)(v3 + 16) = a2;
  v18 = *(_QWORD *)(a1 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideClock);
  v19 = type metadata accessor for OverrideTime(0);
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v9, 1, 1, v19);
  v21 = (os_unfair_lock_s *)(*(_QWORD *)(v18 + 40) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v21);
  swift_endAccess();
  v22 = v18 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  sub_237E2209C((uint64_t)v9, &qword_25689B9E8);
  sub_237E22004(v22, (uint64_t)v9, &qword_25689B9E8);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock(v21);
  swift_endAccess();
  sub_237E21FC0((uint64_t)v9, (uint64_t)v12, &qword_25689B9E8);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v12, 1, v19))
  {
    sub_237E2209C((uint64_t)v12, &qword_25689B9E8);
    v23 = sub_237EE1D70();
    v24 = 1;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
  }
  else
  {
    v25 = sub_237EE1D70();
    v26 = *(_QWORD *)(v25 - 8);
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v15, v12, v25);
    sub_237E2209C((uint64_t)v12, &qword_25689B9E8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v15, 0, 1, v25);
    v24 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v15, 1, v25) == 1;
  }
  sub_237E2209C((uint64_t)v15, &qword_25689C140);
  *(_BYTE *)(v3 + 48) = v24;
  return v3;
}

uint64_t sub_237ECCC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[24] = a4;
  v5[25] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  v5[26] = swift_task_alloc();
  v6 = sub_237EE1D70();
  v5[27] = v6;
  v5[28] = *(_QWORD *)(v6 - 8);
  v5[29] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  v5[30] = v7;
  v5[31] = *(_QWORD *)(v7 - 8);
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256898AF0);
  v5[34] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689C240);
  v5[35] = v8;
  v5[36] = *(_QWORD *)(v8 - 8);
  v5[37] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898AF8);
  v5[38] = v9;
  v5[39] = *(_QWORD *)(v9 - 8);
  v5[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237ECCD80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[36];
  v1 = v0[37];
  v3 = v0[35];
  v4 = v0[24];
  v5 = *(_QWORD *)(v4 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream);
  swift_retain();
  sub_237E8F7E4(v5, v4, v1);
  sub_237EE2C88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[41] = 0;
  v6 = (_QWORD *)swift_task_alloc();
  v0[42] = v6;
  *v6 = v0;
  v6[1] = sub_237ECCE6C;
  return sub_237EE2C94();
}

uint64_t sub_237ECCE6C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237ECCEC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t Strong;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;

  v1 = v0[34];
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v0[31] + 48))(v1, 1, v0[30]) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[39] + 8))(v0[40], v0[38]);
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  v3 = v0[41];
  sub_237E21FC0(v1, v0[33], &qword_25689C140);
  sub_237EE2CC4();
  if (v3)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[39] + 8))(v0[40], v0[38]);
    sub_237E2209C(v0[33], &qword_25689C140);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    v8 = v0[33];
    (*(void (**)(_QWORD, _QWORD))(v0[39] + 8))(v0[40], v0[38]);
    sub_237E2209C(v8, &qword_25689C140);
    goto LABEL_3;
  }
  v6 = Strong;
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(Strong + 80) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v7);
  swift_endAccess();
  sub_237EE2CC4();
  v9 = v0[32];
  v11 = v0[27];
  v10 = v0[28];
  sub_237E22004(v0[33], v9, &qword_25689C140);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v11) == 1)
  {
    sub_237E2209C(v0[32], &qword_25689C140);
    v12 = *(_BYTE *)(v6 + 48);
    *(_BYTE *)(v6 + 48) = 1;
    if ((v12 & 1) == 0)
    {
      swift_beginAccess();
      v15 = swift_bridgeObjectRetain();
      sub_237ED0500(v15, (void (*)(char *, uint64_t))sub_237ECFC10);
      swift_bridgeObjectRelease();
    }
    v16 = 0;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[28] + 32))(v0[29], v0[32], v0[27]);
    v13 = *(unsigned __int8 *)(v6 + 48);
    *(_BYTE *)(v6 + 48) = 0;
    if (v13 == 1)
    {
      swift_beginAccess();
      v14 = swift_bridgeObjectRetain();
      sub_237ED0500(v14, (void (*)(char *, uint64_t))sub_237ECFC10);
      swift_bridgeObjectRelease();
    }
    v17 = v0[28];
    v18 = v0[29];
    v19 = v0[27];
    v16 = sub_237ECD530(v18);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
  }
  swift_beginAccess();
  os_unfair_lock_unlock(v7);
  swift_endAccess();
  if (v16)
  {
    v35 = v16[2];
    if (v35)
    {
      swift_bridgeObjectRetain_n();
      v20 = 0;
      while (1)
      {
        v21 = v0[26];
        v22 = v16;
        v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = *(_OWORD *)&v16[2 * v20 + 4];
        v24 = sub_237EE2C64();
        v25 = *(_QWORD *)(v24 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v21, 1, 1, v24);
        v26 = (_QWORD *)swift_allocObject();
        v26[2] = 0;
        v27 = v26 + 2;
        v26[3] = 0;
        v26[4] = sub_237ECFB10;
        v26[5] = v23;
        v28 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v21, 1, v24);
        swift_retain_n();
        v29 = v0[26];
        if (v28 == 1)
        {
          sub_237E2209C(v0[26], &qword_256897E20);
          if (!*v27)
            goto LABEL_27;
        }
        else
        {
          sub_237EE2C58();
          (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v24);
          if (!*v27)
          {
LABEL_27:
            v30 = 0;
            v32 = 0;
            goto LABEL_28;
          }
        }
        swift_getObjectType();
        swift_unknownObjectRetain();
        v30 = sub_237EE2C28();
        v32 = v31;
        swift_unknownObjectRelease();
LABEL_28:
        v33 = swift_allocObject();
        *(_QWORD *)(v33 + 16) = &unk_25689D5E0;
        *(_QWORD *)(v33 + 24) = v26;
        if (v32 | v30)
        {
          v0[2] = 0;
          v0[3] = 0;
          v0[4] = v30;
          v0[5] = v32;
        }
        v16 = v22;
        ++v20;
        swift_task_create();
        swift_release();
        swift_release();
        if (v35 == v20)
        {
          swift_bridgeObjectRelease_n();
          break;
        }
      }
    }
  }
  swift_release();
  sub_237E2209C(v0[33], &qword_25689C140);
  swift_bridgeObjectRelease();
  v0[41] = 0;
  v34 = (_QWORD *)swift_task_alloc();
  v0[42] = v34;
  *v34 = v0;
  v34[1] = sub_237ECCE6C;
  return sub_237EE2C94();
}

uint64_t sub_237ECD4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_237ECD500()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_237ECD530(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = sub_237ECE7D8(a1);
  if (!v2)
    return 0;
  v4 = v2;
  v5 = v3;
  v6 = 0;
  do
  {
    if (!v6)
      v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v4;
    *(_QWORD *)(v7 + 24) = v5;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v6 = sub_237E625B4(0, v6[2] + 1, 1, v6);
    v9 = v6[2];
    v8 = v6[3];
    if (v9 >= v8 >> 1)
      v6 = sub_237E625B4((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
    v6[2] = v9 + 1;
    v10 = &v6[2 * v9];
    v10[4] = sub_237ECFB10;
    v10[5] = v7;
    sub_237E208F4(v4);
    v4 = sub_237ECE7D8(a1);
    v5 = v11;
  }
  while (v4);
  return v6;
}

uint64_t sub_237ECD654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t *, uint64_t);
  uint64_t v35;
  uint64_t *v36;
  void (*v37)(char *, unint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t result;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, unint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t, uint64_t, uint64_t);
  char *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  char *v92;

  v86 = a3;
  v89 = a2;
  v90 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D5B0);
  MEMORY[0x24BDAC7A8](v5);
  v72 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ScheduledTask();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v79 = (uint64_t)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D5B8);
  v87 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v76 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D598);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D5C0);
  MEMORY[0x24BDAC7A8](v15);
  v91 = (char **)((char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v17);
  v88 = (uint64_t *)((char *)&v72 - v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B6E8);
  MEMORY[0x24BDAC7A8](v19);
  v85 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v72 - v22;
  v24 = sub_237EE1D94();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v92 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v75 = (char *)&v72 - v28;
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v72 - v30;
  v32 = a4 + *(int *)(v7 + 20);
  v33 = sub_237EE1D70();
  v34 = *(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
  v78 = v32;
  v34(v32, v86, v33);
  v35 = v89;
  swift_retain();
  sub_237EE1D88();
  v36 = (uint64_t *)(a4 + *(int *)(v7 + 24));
  *v36 = v90;
  v36[1] = v35;
  v37 = *(void (**)(char *, unint64_t, uint64_t))(v25 + 16);
  v90 = v24;
  v81 = v37;
  v37(v31, a4, v24);
  v73 = a4;
  v38 = a4;
  v39 = v7;
  sub_237ECF7A8(v38, (uint64_t)v23);
  v40 = v8;
  v84 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v84(v23, 0, 1, v7);
  v41 = v83;
  v42 = (uint64_t *)(v83 + 56);
  swift_beginAccess();
  v86 = v42;
  sub_237E8F26C((uint64_t)v23, (uint64_t)v31);
  swift_endAccess();
  v74 = v41 + 72;
  swift_beginAccess();
  v43 = *(_QWORD *)(v41 + 72);
  v89 = *(_QWORD *)(v43 + 16);
  v82 = v43;
  result = swift_bridgeObjectRetain();
  v80 = 0;
  v45 = 0;
  v83 = v25;
  while (1)
  {
    v46 = v89;
    if (v45 == v89)
    {
      v47 = v90;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v14, 1, 1, v90);
      v45 = v46;
LABEL_7:
      sub_237E2209C((uint64_t)v14, &qword_25689D598);
      v48 = 1;
      goto LABEL_10;
    }
    v47 = v90;
    if (v45 >= *(_QWORD *)(v82 + 16))
    {
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v81(v14, v82+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(_QWORD *)(v25 + 72) * v45++, v90);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v14, 0, 1, v47);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v14, 1, v47) == 1)
      goto LABEL_7;
    v77 = v45;
    v49 = v39;
    v50 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v51 = v75;
    v50(v75, v14, v47);
    v52 = &v76[*(int *)(v10 + 48)];
    result = ((uint64_t (*)(char *, char *, uint64_t))v50)(v52, v51, v47);
    v53 = v80 + 1;
    if (__OFADD__(v80, 1))
      goto LABEL_25;
    v54 = (char *)v91 + *(int *)(v10 + 48);
    *v91 = v80;
    v50(v54, v52, v47);
    v48 = 0;
    v80 = v53;
    v39 = v49;
    v25 = v83;
    v45 = v77;
LABEL_10:
    v55 = v87;
    v56 = v91;
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v87 + 56))(v91, v48, 1, v10);
    v57 = (uint64_t)v56;
    v58 = v88;
    sub_237E21FC0(v57, (uint64_t)v88, &qword_25689D5C0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v55 + 48))(v58, 1, v10) == 1)
      break;
    v59 = *v58;
    v60 = (uint64_t)v92;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v92, (char *)v58 + *(int *)(v10 + 48), v47);
    v61 = *v86;
    if (*(_QWORD *)(*v86 + 16))
    {
      swift_bridgeObjectRetain();
      v62 = sub_237EAD3B4(v60);
      v64 = (uint64_t)v85;
      if ((v63 & 1) != 0)
      {
        sub_237ECF7A8(*(_QWORD *)(v61 + 56) + *(_QWORD *)(v40 + 72) * v62, (uint64_t)v85);
        v65 = v64;
        v66 = 0;
      }
      else
      {
        v65 = (uint64_t)v85;
        v66 = 1;
      }
      v84((char *)v65, v66, 1, v39);
      v67 = v64;
      swift_bridgeObjectRelease();
      v25 = v83;
    }
    else
    {
      v67 = (uint64_t)v85;
      v84(v85, 1, 1, v39);
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v92, v47);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v67, 1, v39) == 1)
    {
      result = sub_237E2209C(v67, &qword_25689B6E8);
    }
    else
    {
      v68 = v79;
      sub_237ECF728(v67, v79);
      v69 = sub_237EE1D10();
      result = sub_237ECF76C(v68);
      if ((v69 & 1) != 0)
      {
        v47 = v90;
        goto LABEL_21;
      }
    }
  }
  v59 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  v70 = v74;
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v70 + 16) < v59)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if ((v59 & 0x8000000000000000) == 0)
  {
    v71 = (uint64_t)v72;
    v81(v72, v73, v47);
    sub_237ECF93C(v59, v59, v71);
    return swift_endAccess();
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_237ECDD28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237EE1D94();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v39 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v36 - v11;
  v40 = (uint64_t)&v36 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v36 - v14;
  v16 = sub_237EE1D70();
  v42 = *(_QWORD *)(v16 - 8);
  v43 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v41 = (uint64_t)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237EA1DE0(v41);
  type metadata accessor for ScheduledTask();
  sub_237EE1C08();
  v19 = v18;
  sub_237EE1C08();
  v21 = v19 - v20;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v22(v15, a1, v7);
  v23 = *(_QWORD *)(v1 + 16);
  v37 = *(_QWORD *)(v1 + 24);
  v38 = v23;
  v22(v12, (uint64_t)v15, v7);
  v24 = sub_237EE2C64();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
  v25 = swift_allocObject();
  swift_weakInit();
  v26 = v39;
  v22(v39, (uint64_t)v15, v7);
  v27 = (*(unsigned __int8 *)(v8 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 0;
  *(double *)(v28 + 32) = v21;
  v29 = v37;
  *(_QWORD *)(v28 + 40) = v38;
  *(_QWORD *)(v28 + 48) = v29;
  *(_QWORD *)(v28 + 56) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v28 + v27, v26, v7);
  v30 = sub_237ECBB58((uint64_t)v6, (uint64_t)&unk_25689D5A8, v28);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0x8000000000000000;
  v32 = v30;
  v33 = v40;
  sub_237E9C7D8(v32, v40, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 64) = v44;
  swift_bridgeObjectRelease();
  v34 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v34(v33, v7);
  swift_endAccess();
  v34((uint64_t)v15, v7);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
}

uint64_t sub_237ECE010(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v8 + 160) = a7;
  *(_QWORD *)(v8 + 168) = a8;
  *(_QWORD *)(v8 + 144) = a5;
  *(_QWORD *)(v8 + 152) = a6;
  *(double *)(v8 + 136) = a1;
  v9 = sub_237EE303C();
  *(_QWORD *)(v8 + 176) = v9;
  *(_QWORD *)(v8 + 184) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 192) = swift_task_alloc();
  v10 = sub_237EE3024();
  *(_QWORD *)(v8 + 200) = v10;
  *(_QWORD *)(v8 + 208) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  *(_QWORD *)(v8 + 224) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237ECE0B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 152);
  sub_237EE300C();
  v6 = sub_237EE3318();
  MEMORY[0x23B826684](v6);
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 232) = v7;
  v7(v1, v2);
  *(_QWORD *)(v0 + 112) = v5;
  *(_QWORD *)(v0 + 120) = v4;
  *(_BYTE *)(v0 + 128) = 0;
  sub_237EE3204();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v8;
  sub_237E20E98(&qword_25689C148, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  *v8 = v0;
  v8[1] = sub_237ECE1A0;
  return sub_237EE2CD0();
}

uint64_t sub_237ECE1A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 184);
  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  v4 = v2[28];
  v5 = (void (*)(uint64_t, uint64_t))v2[29];
  v6 = v2[25];
  (*(void (**)(_QWORD, _QWORD))(v3 + 8))(v2[24], v2[22]);
  v5(v4, v6);
  return swift_task_switch();
}

uint64_t sub_237ECE258()
{
  _QWORD *v0;
  uint64_t Strong;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t (*v4)(void);
  void (*v5)(uint64_t);
  uint64_t v6;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    goto LABEL_7;
  v2 = v0[31];
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(Strong + 80) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v3);
  swift_endAccess();
  sub_237EE2CC4();
  if (!v2)
  {
    v5 = (void (*)(uint64_t))sub_237ECE530(v0[21]);
    swift_beginAccess();
    os_unfair_lock_unlock(v3);
    swift_endAccess();
    if (v5)
    {
      v6 = swift_retain();
      v5(v6);
      sub_237E208F4((uint64_t)v5);
      swift_release();
      sub_237E208F4((uint64_t)v5);
    }
    else
    {
      swift_release();
    }
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  swift_beginAccess();
  os_unfair_lock_unlock(v3);
  swift_endAccess();
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_237ECE3F0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237ECE440(uint64_t a1)
{
  uint64_t v1;
  char v3;

  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v1 + 64) + 16))
  {
    swift_bridgeObjectRetain();
    sub_237EAD3B4(a1);
    if ((v3 & 1) != 0)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA00);
      sub_237EE2CAC();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  sub_237E97BE0(a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_237ECE530(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  unint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = sub_237EE1D94();
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ScheduledTask();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B6E8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - v14;
  swift_beginAccess();
  v16 = *(_QWORD *)(v1 + 56);
  v17 = *(_QWORD *)(v16 + 16);
  v27 = a1;
  if (v17)
  {
    swift_bridgeObjectRetain();
    v18 = sub_237EAD3B4(a1);
    if ((v19 & 1) != 0)
    {
      sub_237ECF7A8(*(_QWORD *)(v16 + 56) + *(_QWORD *)(v7 + 72) * v18, (uint64_t)v15);
      v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v20(v15, 0, 1, v6);
    }
    else
    {
      v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v20(v15, 1, 1, v6);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v20(v15, 1, 1, v6);
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6))
  {
    sub_237E2209C((uint64_t)v15, &qword_25689B6E8);
    v21 = 0;
  }
  else
  {
    sub_237ECF7A8((uint64_t)v15, (uint64_t)v9);
    sub_237E2209C((uint64_t)v15, &qword_25689B6E8);
    v21 = *(_QWORD *)&v9[*(int *)(v6 + 24)];
    swift_retain();
    sub_237ECF76C((uint64_t)v9);
  }
  v22 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v5, v27, v26);
  v20(v12, 1, 1, v6);
  swift_beginAccess();
  sub_237E8F26C((uint64_t)v12, (uint64_t)v5);
  swift_endAccess();
  swift_beginAccess();
  sub_237E97BE0(v22);
  swift_endAccess();
  swift_release();
  return v21;
}

uint64_t sub_237ECE7D8(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v23;
  char *v24;
  unint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(uint64_t, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t, uint64_t);
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  unint64_t v56;
  unsigned int (*v57)(char *, uint64_t, uint64_t);
  void (*v58)(char *, _QWORD, uint64_t, uint64_t);
  void (*v59)(char *, unint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;

  v2 = v1;
  v63 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B6E8);
  MEMORY[0x24BDAC7A8](v3);
  v62 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v51 - v6;
  v64 = type metadata accessor for ScheduledTask();
  v8 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D598);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v51 - v15;
  v17 = sub_237EE1D94();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v61 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v60 = (uint64_t)&v51 - v21;
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v51 - v23;
  v25 = (unint64_t *)(v2 + 72);
  swift_beginAccess();
  v26 = *(_QWORD *)(v2 + 72);
  v27 = *(_QWORD *)(v26 + 16);
  if (!v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    goto LABEL_7;
  }
  v56 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v55 = *(_QWORD *)(v18 + 72);
  v59 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
  v59(v16, v26 + v56 + v55 * (v27 - 1), v17);
  v58 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v58(v16, 0, 1, v17);
  v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v57(v16, 1, v17) == 1)
  {
LABEL_7:
    v34 = &qword_25689D598;
    v35 = (uint64_t)v16;
LABEL_12:
    sub_237E2209C(v35, v34);
    return 0;
  }
  v54 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v54(v24, v16, v17);
  v53 = v2 + 56;
  swift_beginAccess();
  v28 = *(_QWORD *)(v2 + 56);
  if (!*(_QWORD *)(v28 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v7, 1, 1, v64);
LABEL_11:
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    v34 = &qword_25689B6E8;
    v35 = (uint64_t)v7;
    goto LABEL_12;
  }
  v52 = v10;
  swift_bridgeObjectRetain();
  v29 = sub_237EAD3B4((uint64_t)v24);
  if ((v30 & 1) != 0)
  {
    sub_237ECF7A8(*(_QWORD *)(v28 + 56) + *(_QWORD *)(v8 + 72) * v29, (uint64_t)v7);
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v32 = v7;
    v33 = 0;
  }
  else
  {
    v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v32 = v7;
    v33 = 1;
  }
  v36 = v64;
  v51 = v31;
  v31(v32, v33, 1, v64);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v36) == 1)
    goto LABEL_11;
  v39 = (uint64_t)v52;
  sub_237ECF728((uint64_t)v7, (uint64_t)v52);
  v40 = v39;
  if ((sub_237EE1D10() & 1) == 0)
  {
    sub_237ECF76C(v39);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v24, v17);
    return 0;
  }
  swift_beginAccess();
  v41 = *v25;
  if (*(_QWORD *)(*v25 + 16))
  {
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
      goto LABEL_18;
  }
  else
  {
    __break(1u);
  }
  result = sub_237E46E8C(v41);
  v41 = result;
LABEL_18:
  v42 = (void (*)(uint64_t, char *, uint64_t))v54;
  v43 = *(_QWORD *)(v41 + 16);
  if (v43)
  {
    v44 = v43 - 1;
    v54(v13, (char *)(v41 + v56 + (v43 - 1) * v55), v17);
    *(_QWORD *)(v41 + 16) = v44;
    *v25 = v41;
    v58(v13, 0, 1, v17);
    if (v57(v13, 1, v17) == 1)
    {
      sub_237E2209C((uint64_t)v13, &qword_25689D598);
      v45 = v60;
      sub_237ECBE90(*(_QWORD *)(*v25 + 16) - 1, v60);
      v46 = v45;
    }
    else
    {
      v46 = v60;
      v42(v60, v13, v17);
    }
    v47 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v47(v46, v17);
    swift_endAccess();
    v48 = (uint64_t)v61;
    v59(v61, (unint64_t)v24, v17);
    v49 = (uint64_t)v62;
    v50 = v64;
    v51(v62, 1, 1, v64);
    swift_beginAccess();
    sub_237E8F26C(v49, v48);
    swift_endAccess();
    swift_beginAccess();
    sub_237E97BE0((uint64_t)v24);
    swift_endAccess();
    swift_release();
    v47((uint64_t)v24, v17);
    v37 = *(_QWORD *)(v40 + *(int *)(v50 + 24));
    swift_retain();
    sub_237ECF76C(v40);
    return v37;
  }
  __break(1u);
  return result;
}

uint64_t sub_237ECED68()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Scheduler()
{
  return objc_opt_self();
}

uint64_t *sub_237ECEDD4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_237EE1D94();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_237EE1D70();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
  }
  swift_retain();
  return a1;
}

uint64_t sub_237ECEE98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_release();
}

uint64_t sub_237ECEF0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  return a1;
}

uint64_t sub_237ECEFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_237ECF050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_237ECF0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_237EE1D94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_237EE1D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_237ECF17C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ECF188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_237EE1D94();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_237EE1D70();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_237ECF230()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ECF23C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_237EE1D94();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_237EE1D70();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for ScheduledTask()
{
  uint64_t result;

  result = qword_25689D548;
  if (!qword_25689D548)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237ECF31C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_237EE1D94();
  if (v1 <= 0x3F)
  {
    result = sub_237EE1D70();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Scheduler.Schedule(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237ECF3F8 + 4 * byte_237EED24D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237ECF42C + 4 * byte_237EED248[v4]))();
}

uint64_t sub_237ECF42C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237ECF434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237ECF43CLL);
  return result;
}

uint64_t sub_237ECF448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237ECF450);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237ECF454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237ECF45C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Scheduler.Schedule()
{
  return &type metadata for Scheduler.Schedule;
}

unint64_t sub_237ECF47C()
{
  unint64_t result;

  result = qword_25689D588;
  if (!qword_25689D588)
  {
    result = MEMORY[0x23B8271D0](&unk_237EED308, &type metadata for Scheduler.Schedule);
    atomic_store(result, (unint64_t *)&qword_25689D588);
  }
  return result;
}

uint64_t sub_237ECF4C0()
{
  sub_237EE3264();
  sub_237EE1D94();
  sub_237E20E98(&qword_25689ACD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_237EE2A18();
  return sub_237EE3294();
}

uint64_t sub_237ECF52C()
{
  sub_237EE1D94();
  sub_237E20E98(&qword_25689ACD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_237EE2A18();
}

uint64_t sub_237ECF584()
{
  sub_237EE3264();
  sub_237EE1D94();
  sub_237E20E98(&qword_25689ACD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_237EE2A18();
  return sub_237EE3294();
}

BOOL sub_237ECF5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t, __n128);
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v4 = sub_237EE1D94();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16);
  v13((char *)&v16 - v11, a1, v4, v10);
  ((void (*)(char *, uint64_t, uint64_t))v13)(v8, a2, v4);
  sub_237E20E98(&qword_25689C340, v5, MEMORY[0x24BDCEA98]);
  LOBYTE(a2) = sub_237EE2A48();
  v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v8, v4);
  v14(v12, v4);
  return (a2 & 1) == 0;
}

uint64_t sub_237ECF6FC()
{
  return sub_237E20E98(&qword_25689D590, (uint64_t (*)(uint64_t))type metadata accessor for ScheduledTask, (uint64_t)&unk_237EED330);
}

uint64_t sub_237ECF728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ScheduledTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237ECF76C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ScheduledTask();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237ECF7A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ScheduledTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237ECF7EC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237ECF810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_237EE1D94();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_237ECF88C(uint64_t a1)
{
  double *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_237EE1D94() - 8) + 80);
  v5 = *((_QWORD *)v1 + 2);
  v6 = *((_QWORD *)v1 + 3);
  v7 = v1[4];
  v8 = *((_QWORD *)v1 + 5);
  v9 = *((_QWORD *)v1 + 6);
  v10 = *((_QWORD *)v1 + 7);
  v11 = (uint64_t)v1 + ((v4 + 64) & ~v4);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_237E487A8;
  return sub_237ECE010(v7, a1, v5, v6, v8, v9, v10, v11);
}

uint64_t sub_237ECF93C(uint64_t a1, int64_t a2, uint64_t a3)
{
  unint64_t *v3;
  unint64_t v5;
  int64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t result;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > *(_QWORD *)(v5 + 24) >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    v5 = sub_237E625A0(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *v3 = v5;
  }
  v14 = sub_237EE1D94();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = v5 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v17 = *(_QWORD *)(v15 + 72);
  v18 = v16 + v17 * a1;
  swift_arrayDestroy();
  if (!v9)
    goto LABEL_25;
  v19 = *(_QWORD *)(v5 + 16);
  v20 = v19 - a2;
  if (__OFSUB__(v19, a2))
    goto LABEL_33;
  if (v20 < 0)
  {
LABEL_35:
    result = sub_237EE30D8();
    __break(1u);
    return result;
  }
  v21 = v18 + v17;
  v22 = v16 + v17 * a2;
  if (v18 + v17 < v22 || v21 >= v22 + v20 * v17)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v21 != v22)
  {
    swift_arrayInitWithTakeBackToFront();
  }
  v24 = *(_QWORD *)(v5 + 16);
  v25 = __OFADD__(v24, v9);
  v26 = v24 + v9;
  if (v25)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(_QWORD *)(v5 + 16) = v26;
LABEL_25:
  if (v17 >= 1)
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  return sub_237E2209C(a3, &qword_25689D5B0);
}

uint64_t sub_237ECFB10()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_237ECFB30()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237ECFB5C()
{
  return sub_237ECC550();
}

uint64_t sub_237ECFB64()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237ECFB98(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_237E20844;
  return sub_237ECCC44(a1, v4, v5, v7, v6);
}

uint64_t sub_237ECFC14(unint64_t *a1, uint64_t a2)
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
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void (*v36)(_QWORD, _QWORD, _QWORD);
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  void (*v48)(_BYTE *, uint64_t);
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t result;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  _BYTE *v58;
  unint64_t v60;
  _BYTE *v61;
  void (*v62)(uint64_t, _BYTE *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t (*v68)(uint64_t, uint64_t, uint64_t);
  int v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t *v72;
  uint64_t v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  void (*v77)(_BYTE *, unint64_t, uint64_t);
  uint64_t v78;
  unint64_t v79;
  uint64_t (*v80)(unint64_t, _BYTE *, uint64_t);
  _BYTE *v81;
  char v82;
  void (*v83)(_BYTE *, uint64_t);
  _BYTE *v84;
  _BYTE *v85;
  _BYTE v86[16];
  uint64_t v87;
  unint64_t v88;
  _BYTE *v89;
  _BYTE *v90;
  _BYTE *v91;
  int v92;
  _BYTE *v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t, uint64_t);
  _BYTE *v98;
  unint64_t *v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t v102;
  unint64_t v103;
  void (*v104)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v105;
  void (*v106)(_QWORD, _QWORD, _QWORD);
  uint64_t v107;
  _BYTE *v108;
  unint64_t v109;
  uint64_t v110;

  v4 = sub_237EE1D94();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v89 = &v86[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v90 = &v86[-v8];
  MEMORY[0x24BDAC7A8](v9);
  v101 = &v86[-v10];
  MEMORY[0x24BDAC7A8](v11);
  v91 = &v86[-v12];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D5F0);
  MEMORY[0x24BDAC7A8](v13);
  v93 = &v86[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v86[-v16];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D598);
  MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v98 = &v86[-v20];
  MEMORY[0x24BDAC7A8](v21);
  MEMORY[0x24BDAC7A8](v22);
  MEMORY[0x24BDAC7A8](v23);
  v25 = &v86[-v24];
  MEMORY[0x24BDAC7A8](v26);
  v31 = &v86[-v30];
  v32 = *a1;
  v102 = *(_QWORD *)(*a1 + 16);
  if (!v102)
    return 0;
  v108 = v17;
  v95 = v29;
  v96 = v28;
  v87 = v27;
  v99 = a1;
  v33 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v103 = v32;
  swift_bridgeObjectRetain();
  v105 = a2;
  swift_beginAccess();
  v34 = v103;
  v35 = 0;
  v107 = *(_QWORD *)(v5 + 72);
  v110 = v5;
  v36 = *(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16);
  v88 = v33;
  v37 = v33;
  v100 = v13;
  v106 = v36;
  v94 = v25;
  while (1)
  {
    v109 = v35;
    v36(v31, v34 + v37, v4);
    v39 = v110;
    v104 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v110 + 56);
    v104(v31, 0, 1, v4);
    sub_237E22004(v105, (uint64_t)v25, &qword_25689D598);
    v40 = (uint64_t)v108;
    v41 = (uint64_t)&v108[*(int *)(v13 + 48)];
    sub_237E22004((uint64_t)v31, (uint64_t)v108, &qword_25689D598);
    sub_237E22004((uint64_t)v25, v41, &qword_25689D598);
    v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
    if (v42(v40, 1, v4) == 1)
      break;
    v43 = v95;
    sub_237E22004(v40, v95, &qword_25689D598);
    if (v42(v41, 1, v4) != 1)
    {
      v97 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v42;
      v46 = v110;
      v47 = v91;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v110 + 32))(v91, v41, v4);
      sub_237E20E98(&qword_25689C340, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v92 = sub_237EE2A48();
      v48 = *(void (**)(_BYTE *, uint64_t))(v46 + 8);
      v49 = v47;
      v13 = v100;
      v48(v49, v4);
      v50 = (uint64_t)v94;
      sub_237E2209C((uint64_t)v94, &qword_25689D598);
      sub_237E2209C((uint64_t)v31, &qword_25689D598);
      v51 = v43;
      v25 = (_BYTE *)v50;
      v48((_BYTE *)v51, v4);
      sub_237E2209C(v40, &qword_25689D598);
      v38 = v109;
      if ((v92 & 1) != 0)
        goto LABEL_14;
      goto LABEL_5;
    }
    v44 = (uint64_t)v94;
    sub_237E2209C((uint64_t)v94, &qword_25689D598);
    sub_237E2209C((uint64_t)v31, &qword_25689D598);
    v45 = v43;
    v25 = (_BYTE *)v44;
    (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v45, v4);
LABEL_4:
    sub_237E2209C((uint64_t)v108, &qword_25689D5F0);
    v38 = v109;
LABEL_5:
    v35 = v38 + 1;
    v37 += v107;
    v34 = v103;
    v36 = v106;
    if (v102 == v35)
    {
      swift_bridgeObjectRelease();
      return *(_QWORD *)(v34 + 16);
    }
  }
  sub_237E2209C((uint64_t)v25, &qword_25689D598);
  sub_237E2209C((uint64_t)v31, &qword_25689D598);
  if (v42(v41, 1, v4) != 1)
    goto LABEL_4;
  v97 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v42;
  sub_237E2209C((uint64_t)v108, &qword_25689D598);
  v38 = v109;
LABEL_14:
  v52 = v103;
  result = swift_bridgeObjectRelease();
  v54 = v38 + 1;
  if (__OFADD__(v38, 1))
    goto LABEL_46;
  if (v54 == *(_QWORD *)(v52 + 16))
    return v38;
  v55 = v107 + v37;
  result = swift_beginAccess();
  v56 = v103;
  v57 = &qword_25689D598;
  v58 = v98;
  while (2)
  {
    if (v54 < *(_QWORD *)(v56 + 16))
    {
      v109 = v55;
      v60 = v56 + v55;
      v61 = v101;
      v62 = (void (*)(uint64_t, _BYTE *, uint64_t))v106;
      v63 = (uint64_t)v58;
      v106(v101, v60, v4);
      v64 = v96;
      v62(v96, v61, v4);
      v104((_BYTE *)v64, 0, 1, v4);
      sub_237E22004(v105, (uint64_t)v58, v57);
      v65 = v93;
      v66 = (uint64_t)&v93[*(int *)(v100 + 48)];
      sub_237E22004(v64, (uint64_t)v93, v57);
      sub_237E22004(v63, v66, v57);
      v67 = v57;
      v68 = v97;
      if (v97((uint64_t)v65, 1, v4) == 1)
      {
        sub_237E2209C(v63, v67);
        sub_237E2209C(v64, v67);
        v69 = v68(v66, 1, v4);
        v70 = v110;
        v57 = v67;
        v71 = v109;
        if (v69 == 1)
        {
          sub_237E2209C((uint64_t)v65, v67);
          result = (*(uint64_t (**)(_BYTE *, uint64_t))(v70 + 8))(v101, v4);
          v72 = v99;
          goto LABEL_20;
        }
LABEL_27:
        sub_237E2209C((uint64_t)v65, &qword_25689D5F0);
        result = (*(uint64_t (**)(_BYTE *, uint64_t))(v70 + 8))(v101, v4);
        v72 = v99;
      }
      else
      {
        v73 = v87;
        sub_237E22004((uint64_t)v65, v87, v67);
        v74 = v68(v66, 1, v4);
        v70 = v110;
        if (v74 == 1)
        {
          sub_237E2209C((uint64_t)v98, v67);
          sub_237E2209C(v96, v67);
          (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v73, v4);
          v57 = v67;
          v71 = v109;
          goto LABEL_27;
        }
        v81 = v91;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v110 + 32))(v91, v66, v4);
        sub_237E20E98(&qword_25689C340, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
        v82 = sub_237EE2A48();
        v83 = *(void (**)(_BYTE *, uint64_t))(v70 + 8);
        v84 = v81;
        v85 = v93;
        v83(v84, v4);
        sub_237E2209C((uint64_t)v98, v67);
        sub_237E2209C(v96, v67);
        v83((_BYTE *)v73, v4);
        sub_237E2209C((uint64_t)v85, v67);
        result = ((uint64_t (*)(_BYTE *, uint64_t))v83)(v101, v4);
        v72 = v99;
        v57 = v67;
        v71 = v109;
        if ((v82 & 1) != 0)
        {
LABEL_20:
          ++v54;
          v56 = *v72;
          v55 = v71 + v107;
          v58 = v98;
          if (v54 == *(_QWORD *)(*v72 + 16))
            return v38;
          continue;
        }
      }
      if (v54 != v38)
      {
        if ((v38 & 0x8000000000000000) != 0)
          goto LABEL_41;
        v75 = *v72;
        v76 = *(_QWORD *)(*v72 + 16);
        if (v38 >= v76)
          goto LABEL_42;
        v77 = (void (*)(_BYTE *, unint64_t, uint64_t))v106;
        v78 = v38 * v107;
        result = ((uint64_t (*)(_BYTE *, unint64_t, uint64_t))v106)(v90, v75 + v88 + v38 * v107, v4);
        if (v54 >= v76)
          goto LABEL_43;
        v77(v89, v75 + v71, v4);
        result = swift_isUniquelyReferenced_nonNull_native();
        *v99 = v75;
        if ((result & 1) == 0)
        {
          result = sub_237E46E8C(v75);
          v75 = result;
          *v99 = result;
        }
        if (v38 >= *(_QWORD *)(v75 + 16))
          goto LABEL_44;
        v79 = v75 + v88 + v78;
        v80 = *(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v110 + 40);
        result = v80(v79, v89, v4);
        v72 = v99;
        if (v54 >= *(_QWORD *)(*v99 + 16))
          goto LABEL_45;
        result = v80(*v99 + v71, v90, v4);
        v57 = &qword_25689D598;
      }
      if (__OFADD__(v38++, 1))
        goto LABEL_40;
      goto LABEL_20;
    }
    break;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_237ED0500(uint64_t a1, void (*a2)(char *, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D5E8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 64);
  v24 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v25 = (unint64_t)(v8 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v25)
      return swift_release();
    v21 = *(_QWORD *)(v24 + 8 * v20);
    ++v12;
    if (!v21)
    {
      v12 = v20 + 1;
      if (v20 + 1 >= v25)
        return swift_release();
      v21 = *(_QWORD *)(v24 + 8 * v12);
      if (!v21)
      {
        v12 = v20 + 2;
        if (v20 + 2 >= v25)
          return swift_release();
        v21 = *(_QWORD *)(v24 + 8 * v12);
        if (!v21)
        {
          v12 = v20 + 3;
          if (v20 + 3 >= v25)
            return swift_release();
          v21 = *(_QWORD *)(v24 + 8 * v12);
          if (!v21)
            break;
        }
      }
    }
LABEL_22:
    v10 = (v21 - 1) & v21;
    v14 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_5:
    v15 = *(_QWORD *)(a1 + 48);
    v16 = sub_237EE1D94();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v6, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v16);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = v17 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ScheduledTask() - 8) + 72) * v14;
    v19 = (uint64_t)&v6[*(int *)(v4 + 48)];
    sub_237ECF7A8(v18, v19);
    a2(v6, v19);
    result = sub_237E2209C((uint64_t)v6, &qword_25689D5E8);
  }
  v22 = v20 + 4;
  if (v22 >= v25)
    return swift_release();
  v21 = *(_QWORD *)(v24 + 8 * v22);
  if (v21)
  {
    v12 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v12 >= v25)
      return swift_release();
    v21 = *(_QWORD *)(v24 + 8 * v12);
    ++v22;
    if (v21)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_237ED0744()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237ED076C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_237E20844;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch();
}

uint64_t sub_237ED07CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((*(_BYTE *)(v2 + 48) & 1) != 0)
    return sub_237ECDD28(a2);
  else
    return sub_237ECE440(a2);
}

uint64_t sub_237ED07E0(uint64_t a1, uint64_t a2)
{
  return sub_237ED07F4(a1, a2, (uint64_t (*)(void))sub_237E62380, type metadata accessor for ColorProviderPoint);
}

uint64_t sub_237ED07F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(_QWORD))
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v10 = a1 - a2;
  if (__OFSUB__(0, v9))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (__OFADD__(v7, v10))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v7 - v9 > *(_QWORD *)(v6 + 24) >> 1)
    v6 = a3();
  v13 = *(_QWORD *)(a4(0) - 8);
  v14 = v6 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v15 = *(_QWORD *)(v13 + 72);
  v16 = v15 * a1;
  v17 = v14 + v15 * a1;
  result = swift_arrayDestroy();
  if (!v9)
    goto LABEL_22;
  v19 = *(_QWORD *)(v6 + 16);
  v20 = v19 - a2;
  if (__OFSUB__(v19, a2))
    goto LABEL_28;
  if ((v20 & 0x8000000000000000) == 0)
  {
    if (v16 < v15 * a2 || v17 >= v14 + v15 * a2 + v20 * v15)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != v15 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v22 = *(_QWORD *)(v6 + 16);
    v23 = __OFADD__(v22, v10);
    v24 = v22 - v9;
    if (!v23)
    {
      *(_QWORD *)(v6 + 16) = v24;
LABEL_22:
      *v4 = v6;
      return result;
    }
    goto LABEL_29;
  }
LABEL_30:
  result = sub_237EE30D8();
  __break(1u);
  return result;
}

uint64_t objectdestroy_25Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237ED09D4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v2 = *(int **)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_237E487A8;
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_237E487A8;
  return v6();
}

uint64_t sub_237ED0A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t destroy for ColorProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
}

_OWORD *initializeWithCopy for ColorProvider(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for ColorProvider(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  return a1;
}

uint64_t assignWithTake for ColorProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorProvider()
{
  return &type metadata for ColorProvider;
}

uint64_t sub_237ED0C70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16[2];
  __int128 v17[2];

  v4 = v3;
  v8 = v3[3];
  v9 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v8);
  sub_237E35B18(a1, v8, a2, v9, (uint64_t *)v17);
  v10 = v4[8];
  v11 = v4[9];
  __swift_project_boxed_opaque_existential_1(v4 + 5, v10);
  sub_237E35B18(a1, v10, a2, v11, (uint64_t *)v16);
  v12 = v4 + 10;
  v13 = v4[13];
  v14 = v4[14];
  __swift_project_boxed_opaque_existential_1(v12, v13);
  sub_237E35B18(a1, v13, a2, v14, (uint64_t *)(a3 + 80));
  sub_237E2D1BC(v17, a3);
  return sub_237E2D1BC(v16, a3 + 40);
}

id sub_237ED0D5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  v3 = (*(float (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  v4 = v0[8];
  v5 = v0[9];
  __swift_project_boxed_opaque_existential_1(v0 + 5, v4);
  v6 = (*(float (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v8 = v0[13];
  v7 = v0[14];
  __swift_project_boxed_opaque_existential_1(v0 + 10, v8);
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, v3, v6, (*(float (**)(uint64_t, uint64_t))(v7 + 8))(v8, v7), 1.0);
}

unint64_t sub_237ED0E38(uint64_t a1)
{
  unint64_t result;

  result = sub_237ED0E5C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237ED0E5C()
{
  unint64_t result;

  result = qword_25689D610;
  if (!qword_25689D610)
  {
    result = MEMORY[0x23B8271D0](&unk_237EED3C4, &type metadata for ColorProvider);
    atomic_store(result, (unint64_t *)&qword_25689D610);
  }
  return result;
}

unint64_t sub_237ED0EA0(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_237ED0E5C();
  result = sub_237ED0ECC();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_237ED0ECC()
{
  unint64_t result;

  result = qword_25689D618;
  if (!qword_25689D618)
  {
    result = MEMORY[0x23B8271D0](&unk_237EED3EC, &type metadata for ColorProvider);
    atomic_store(result, (unint64_t *)&qword_25689D618);
  }
  return result;
}

BOOL sub_237ED0F10(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;

  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  v6 = (*(float (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v7 = a1[8];
  v8 = a1[9];
  __swift_project_boxed_opaque_existential_1(a1 + 5, v7);
  v9 = (*(float (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  v10 = a1 + 10;
  v12 = a1[13];
  v11 = a1[14];
  __swift_project_boxed_opaque_existential_1(v10, v12);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, v6, v9, (*(float (**)(uint64_t, uint64_t))(v11 + 8))(v12, v11), 1.0);
  v14 = a2[3];
  v15 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v14);
  v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  v17 = a2[8];
  v18 = a2[9];
  __swift_project_boxed_opaque_existential_1(a2 + 5, v17);
  v19 = (*(float (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
  v20 = a2 + 10;
  v22 = a2[13];
  v21 = a2[14];
  __swift_project_boxed_opaque_existential_1(v20, v22);
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithHue_saturation_brightness_alpha_, v16, v19, (*(float (**)(uint64_t, uint64_t))(v21 + 8))(v22, v21), 1.0);
  sub_237ED10C0();
  v24 = sub_237EE2EB0();

  return (v24 & 1) == 0;
}

unint64_t sub_237ED10C0()
{
  unint64_t result;

  result = qword_25689D620;
  if (!qword_25689D620)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25689D620);
  }
  return result;
}

uint64_t sub_237ED10FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_237ED1120(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237E21EBC(v2, (uint64_t)v4, type metadata accessor for LocationAccuracy);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_237E21F00((uint64_t)v4, type metadata accessor for LocationAccuracy);
    return 0x6E776F6E6B6E55;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v9 = sub_237EE19C8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_237ED1250()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v1 = type metadata accessor for LocationAccuracy(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = 0;
  v22 = 0xE000000000000000;
  sub_237EE2FA0();
  swift_bridgeObjectRelease();
  v21 = 60;
  v22 = 0xE100000000000000;
  v8 = *v0;
  objc_msgSend(*v0, sel_coordinate);
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689D9E0);
  v11 = swift_allocObject();
  v19 = xmmword_237EE55E0;
  v12 = MEMORY[0x24BEE13C8];
  *(_OWORD *)(v11 + 16) = xmmword_237EE55E0;
  v13 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v11 + 56) = v12;
  *(_QWORD *)(v11 + 64) = v13;
  *(_QWORD *)(v11 + 32) = v10;
  sub_237EE2A90();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  objc_msgSend(v8, sel_coordinate);
  v15 = v14;
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v19;
  *(_QWORD *)(v16 + 56) = v12;
  *(_QWORD *)(v16 + 64) = v13;
  *(_QWORD *)(v16 + 32) = v15;
  sub_237EE2A90();
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  v17 = type metadata accessor for CurrentLocation(0);
  sub_237E21EBC(v20 + *(int *)(v17 + 20), (uint64_t)v3, type metadata accessor for LocationAccuracy);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_237E21F00((uint64_t)v3, type metadata accessor for LocationAccuracy);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    sub_237EE19C8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  return v21;
}

uint64_t sub_237ED1500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_237E74A2C(0, (unint64_t *)&qword_25689D9D0);
  if ((sub_237EE2EB0() & 1) != 0)
    return sub_237ED7774(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20));
  else
    return 0;
}

id sub_237ED1580()
{
  objc_class *v0;
  _QWORD *v1;
  id result;
  objc_super v3;

  v0 = (objc_class *)type metadata accessor for LocationDataProvider();
  v1 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = MEMORY[0x24BEE4B00];
  v3.receiver = v1;
  v3.super_class = v0;
  result = objc_msgSendSuper2(&v3, sel_init);
  qword_25689DFF8 = (uint64_t)result;
  return result;
}

id sub_237ED15E4()
{
  objc_class *v0;
  _QWORD *v1;
  objc_super v3;

  v1 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = MEMORY[0x24BEE4B00];
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t sub_237ED163C(char *a1, char *a2)
{
  return sub_237EAA5DC(*a1, *a2);
}

uint64_t sub_237ED1648@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_237EE30F0();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_237ED16A4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6C616E7265746E69;
  if (*v1)
    v2 = 0x4B72656874616577;
  v3 = 0xEA00000000004955;
  if (*v1)
    v3 = 0xEA00000000007469;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_237ED16EC()
{
  sub_237EE3264();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  return sub_237EE3294();
}

uint64_t sub_237ED1774()
{
  sub_237EE2ACC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237ED17D8()
{
  sub_237EE3264();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  return sub_237EE3294();
}

id sub_237ED185C(char a1)
{
  uint64_t v1;
  int v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  id v15;
  uint64_t v16;

  v2 = a1 & 1;
  v3 = (uint64_t *)(v1 + 112);
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 112);
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_237EAD7FC(v2), (v6 & 1) != 0))
  {
    v15 = *(id *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_endAccess();
    return v15;
  }
  else
  {
    swift_endAccess();
    v8 = objc_allocWithZone((Class)type metadata accessor for LocationSource(0));
    if (v2)
    {
      v10 = 0x8000000237EF08D0;
      v9 = 0xD000000000000011;
      v11 = 0;
    }
    else
    {
      v9 = 0xD000000000000035;
      v10 = 0x8000000237EF08F0;
      v11 = 1;
    }
    v12 = sub_237ED1A54(v9, v10, v11);
    swift_beginAccess();
    v13 = v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v3;
    *v3 = 0x8000000000000000;
    sub_237E9BD78((uint64_t)v13, v2, isUniquelyReferenced_nonNull_native);
    *v3 = v16;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v13;
  }
}

uint64_t sub_237ED1A04()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for LocationDataProvider()
{
  return objc_opt_self();
}

uint64_t sub_237ED1A48()
{
  uint64_t v0;

  return sub_237E27994(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

id sub_237ED1A54(uint64_t a1, uint64_t a2, int a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  char *v29;
  void *v30;
  id v31;
  objc_class *v32;
  _BYTE v34[4];
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;
  unint64_t v40;
  unint64_t v41;

  v35 = a3;
  v38 = sub_237EE2DE4();
  MEMORY[0x24BDAC7A8](v38);
  v6 = sub_237EE2DF0();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_237EE29D0();
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA40);
  v14 = swift_allocObject();
  type metadata accessor for CPUnfairLock();
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v14 + 16) = v15;
  *(_BYTE *)(v14 + 24) = 0;
  *(_QWORD *)&v3[v13] = v14;
  v16 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__location;
  v17 = type metadata accessor for CurrentLocation(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA48);
  v18 = (_QWORD *)swift_allocObject();
  v19 = swift_allocObject();
  *(_DWORD *)(v19 + 16) = 0;
  v18[2] = v19;
  sub_237ED8674((uint64_t)v12, (uint64_t)v18 + *(_QWORD *)(*v18 + 96));
  *(_QWORD *)&v3[v16] = v18;
  v20 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689DA50);
  v21 = swift_allocObject();
  v22 = v21 + *(_QWORD *)(*(_QWORD *)v21 + 96);
  v23 = type metadata accessor for CurrentLocationResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v24 = *(_QWORD *)(*(_QWORD *)v21 + 104);
  v25 = swift_allocObject();
  *(_DWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v21 + v24) = v25;
  *(_QWORD *)(v21 + *(_QWORD *)(*(_QWORD *)v21 + 112)) = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v21 + *(_QWORD *)(*(_QWORD *)v21 + 120)) = 0;
  *(_QWORD *)&v3[v20] = v21;
  v26 = objc_opt_self();
  v27 = v3;
  v28 = objc_msgSend((id)v26, sel_meters);
  sub_237E74A2C(0, &qword_25689D6D8);
  sub_237EE19BC();
  *(_QWORD *)&v27[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion] = 0;
  *(_QWORD *)&v27[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager] = 1;
  v29 = &v27[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source];
  *(_QWORD *)v29 = a1;
  *((_QWORD *)v29 + 1) = a2;
  LOBYTE(v26) = v35;
  v29[16] = v35 & 1;
  v40 = 0;
  v41 = 0xE000000000000000;
  sub_237E2CC6C();
  sub_237EE2FA0();
  swift_bridgeObjectRelease();
  v40 = 0xD00000000000001FLL;
  v41 = 0x8000000237EF0930;
  if ((v26 & 1) != 0)
  {
    v30 = (void *)sub_237EE2A54();
    v31 = objc_msgSend(v30, sel_lastPathComponent);

    sub_237EE2A84();
    sub_237E7E5F0();
  }
  sub_237E74A2C(0, (unint64_t *)&qword_25689C150);
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE29C4();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v36 + 104))(v8, *MEMORY[0x24BEE5758], v37);
  v40 = MEMORY[0x24BEE4AF8];
  sub_237ED86BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA68);
  sub_237ED8704();
  sub_237EE2F1C();
  *(_QWORD *)&v27[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue] = sub_237EE2E14();

  v32 = (objc_class *)type metadata accessor for LocationSource(0);
  v39.receiver = v27;
  v39.super_class = v32;
  return objc_msgSendSuper2(&v39, sel_init);
}

void sub_237ED1F14()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD *v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237EE1FB0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 16] & 1) == 0)
  {
    v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 8];
    if (qword_2542C6458 != -1)
      swift_once();
    v9 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
    swift_beginAccess();
    sub_237E22004(v9, (uint64_t)v3, &qword_2542C6548);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_237E6072C((uint64_t)v7);
      sub_237E2209C((uint64_t)v3, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    }
    v10 = v0;
    v11 = sub_237EE1F98();
    v12 = sub_237EE2DA8();
    if (os_log_type_enabled(v11, v12))
    {
      v27 = v4;
      v13 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      v25 = v13;
      *(_DWORD *)v13 = 138543362;
      v28 = v10;
      v14 = v10;
      v26 = v8;
      v15 = v14;
      v4 = v27;
      sub_237EE2EE0();
      v16 = v24;
      *v24 = v10;

      v17 = v12;
      v18 = v25;
      _os_log_impl(&dword_237E17000, v11, v17, "[%{public}@] Taking in-use assertion'", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v16, -1, -1);
      MEMORY[0x23B8272A8](v18, -1, -1);
    }
    else
    {

      v11 = v10;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v19 = (void *)objc_opt_self();
    v20 = (void *)sub_237EE2A54();
    v21 = (void *)sub_237EE2A54();
    v22 = (objc_class *)objc_msgSend(v19, sel_newAssertionForBundleIdentifier_withReason_, v20, v21);

    v23 = *(Class *)((char *)&v10->isa
                   + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion);
    *(Class *)((char *)&v10->isa
             + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion) = v22;

  }
}

void *sub_237ED2250()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *result;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237EE1FB0();
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)&v6 = MEMORY[0x24BDAC7A8](v4).n128_u64[0];
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion;
  result = *(void **)&v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion];
  if (result)
  {
    objc_msgSend(result, sel_invalidate, v6);
    v11 = *(void **)&v0[v9];
    *(_QWORD *)&v0[v9] = 0;

    if (qword_2542C6458 != -1)
      swift_once();
    v12 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
    swift_beginAccess();
    sub_237E22004(v12, (uint64_t)v3, &qword_2542C6548);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_237E6072C((uint64_t)v8);
      sub_237E2209C((uint64_t)v3, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
    }
    v13 = v0;
    v14 = sub_237EE1F98();
    v15 = sub_237EE2DA8();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v22 = v4;
      v23 = v13;
      v18 = (_QWORD *)v17;
      v21 = v5;
      *(_DWORD *)v16 = 138543362;
      v19 = v13;
      v5 = v21;
      sub_237EE2EE0();
      *v18 = v13;

      _os_log_impl(&dword_237E17000, v14, v15, "[%{public}@] Removing in-use assertion", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
      swift_arrayDestroy();
      v20 = v18;
      v4 = v22;
      MEMORY[0x23B8272A8](v20, -1, -1);
      MEMORY[0x23B8272A8](v16, -1, -1);
    }
    else
    {

      v14 = v13;
    }

    return (void *)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

void sub_237ED2508(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  os_unfair_lock_s *v18;
  char *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;

  v34 = a1;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA28);
  v37 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689DA30);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v32 - v7;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v32 - v15;
  v17 = *(_QWORD *)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream];
  v18 = (os_unfair_lock_s *)(*(_QWORD *)(v17 + *(_QWORD *)(*(_QWORD *)v17 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  v19 = v1;
  os_unfair_lock_lock(v18);
  v20 = *(_QWORD *)(*(_QWORD *)v17 + 120);
  v21 = *(_BYTE *)(v17 + v20);
  if ((v21 & 1) == 0)
    *(_BYTE *)(v17 + v20) = 1;
  os_unfair_lock_unlock(v18);
  swift_endAccess();
  v22 = type metadata accessor for CurrentLocationResult(0);
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v23(v16, 1, 1, v22);
  if ((v21 & 1) == 0)
  {
    sub_237ED2D40((uint64_t)v13);
    v23(v13, 0, 1, v22);
    sub_237E9F9C4((uint64_t)v13, (uint64_t)v16, &qword_25689DA20);
  }
  v38 = v19;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995C0);
  v35 = *(_QWORD *)(v24 - 8);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  v25(v10, 1, 1, v24);
  swift_beginAccess();
  os_unfair_lock_lock(v18);
  v26 = swift_endAccess();
  v27 = MEMORY[0x24BDAC7A8](v26);
  *(&v32 - 2) = v17;
  *(&v32 - 1) = v28;
  v33 = v28;
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v37 + 104))(v3, *MEMORY[0x24BEE6A10], v39, v27);
  v29 = (uint64_t)v36;
  sub_237EE2CA0();
  v25((char *)v29, 0, 1, v24);
  sub_237E9F9C4(v29, (uint64_t)v10, (uint64_t *)&unk_25689DA30);
  swift_beginAccess();
  os_unfair_lock_unlock(v18);
  swift_endAccess();
  v30 = v40;
  v31 = v35;
  sub_237E22004((uint64_t)v10, v40, (uint64_t *)&unk_25689DA30);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v30, 1, v24) == 1)
  {

    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v34, v30, v24);
    sub_237E2209C((uint64_t)v10, (uint64_t *)&unk_25689DA30);
    sub_237E2209C(v33, &qword_25689DA20);
    swift_release();

  }
}

id sub_237ED28CC()
{
  _BYTE *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager;
  v2 = *(void **)&v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager];
  v3 = v2;
  if (v2 == (void *)1)
  {
    v3 = sub_237ED2938(v0);
    v4 = *(void **)&v0[v1];
    *(_QWORD *)&v0[v1] = v3;
    v5 = v3;
    sub_237ED864C(v4);
  }
  sub_237ED865C(v2);
  return v3;
}

id sub_237ED2938(_BYTE *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  id v17;
  _BYTE *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  NSObject *v29;
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237EE1FB0();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v6) = a1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 16];
  v32 = v9;
  v33 = v8;
  if ((v6 & 1) != 0)
  {
    sub_237E2CC6C();
    if ((sub_237EB149C() & 1) != 0)
    {
      sub_237E7E5F0();
      v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA88]), sel_init);
      if (v10)
        return v10;
    }
    else
    {
      v16 = *(void **)&a1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
      v17 = objc_allocWithZone(MEMORY[0x24BDBFA88]);
      v18 = a1;
      v19 = v16;
      v20 = (void *)sub_237EE2A54();
      sub_237E7E5F0();
      v10 = objc_msgSend(v17, sel_initWithEffectiveBundlePath_delegate_onQueue_, v20, v18, v19);

      if (v10)
        return v10;
    }
  }
  else
  {
    v11 = *(void **)&a1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
    v12 = objc_allocWithZone(MEMORY[0x24BDBFA88]);
    sub_237E2CC6C();
    v13 = v11;
    v14 = a1;
    v15 = (void *)sub_237EE2A54();
    sub_237E7E5F0();
    v10 = objc_msgSend(v12, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v15, v14, v13);

    if (v10)
      return v10;
  }
  if (qword_2542C6458 != -1)
    swift_once();
  v21 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_237E22004(v21, (uint64_t)v4, &qword_2542C6548);
  v23 = v32;
  v22 = v33;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v4, 1, v33) == 1)
  {
    sub_237E6072C((uint64_t)v7);
    sub_237E2209C((uint64_t)v4, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v7, v4, v22);
  }
  v24 = a1;
  v25 = sub_237EE1F98();
  v26 = sub_237EE2D9C();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138543362;
    v34 = v24;
    v29 = v24;
    sub_237EE2EE0();
    *v28 = v24;

    v22 = v33;
    _os_log_impl(&dword_237E17000, v25, v26, "[%{public}@] Error initing location manager'", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    v30 = v28;
    v23 = v32;
    MEMORY[0x23B8272A8](v30, -1, -1);
    MEMORY[0x23B8272A8](v27, -1, -1);
  }
  else
  {

    v25 = v24;
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v22);
  return 0;
}

uint64_t sub_237ED2D40@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  char *v15;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v19 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - v6;
  v8 = type metadata accessor for CurrentLocationResult(0);
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  v10 = *(void **)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  *(_QWORD *)(v11 + 24) = v7;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_237ED861C;
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = sub_237ECFB10;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237ED10FC;
  aBlock[3] = &block_descriptor_9;
  v13 = _Block_copy(aBlock);
  v14 = v10;
  v15 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v14, v13);

  _Block_release(v13);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_237E22004((uint64_t)v7, (uint64_t)v4, &qword_25689DA20);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8);
    if ((_DWORD)result != 1)
    {
      sub_237E47CE0((uint64_t)v4, v19, type metadata accessor for CurrentLocationResult);
      sub_237E2209C((uint64_t)v7, &qword_25689DA20);
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

void sub_237ED2F5C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = type metadata accessor for LocationAccuracy(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_237ED36E4() & 1) != 0)
  {
    v6 = sub_237ED28CC();
    if (v6 && (v7 = v6, v8 = objc_msgSend(v6, sel_location), v7, v8))
    {
      objc_msgSend(v8, sel_horizontalAccuracy);
      v9 = objc_msgSend((id)objc_opt_self(), sel_meters);
      sub_237E74A2C(0, &qword_25689D6D8);
      sub_237EE19BC();
      v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
      sub_237E2209C((uint64_t)a2, &qword_25689DA20);
      v11 = type metadata accessor for CurrentLocation(0);
      sub_237E47CE0((uint64_t)v5, (uint64_t)a2 + *(int *)(v11 + 20), type metadata accessor for LocationAccuracy);
      *a2 = v8;
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a2, 0, 1, v11);
      v12 = type metadata accessor for CurrentLocationResult(0);
      v13 = v12;
      *((_BYTE *)a2 + *(int *)(v12 + 20)) = 2;
    }
    else
    {
      sub_237E2209C((uint64_t)a2, &qword_25689DA20);
      v15 = type metadata accessor for CurrentLocation(0);
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 1, 1, v15);
      v12 = type metadata accessor for CurrentLocationResult(0);
      v13 = v12;
      *((_BYTE *)a2 + *(int *)(v12 + 20)) = 1;
    }
  }
  else
  {
    sub_237E2209C((uint64_t)a2, &qword_25689DA20);
    v14 = type metadata accessor for CurrentLocation(0);
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
    v12 = type metadata accessor for CurrentLocationResult(0);
    v13 = v12;
    *((_BYTE *)a2 + *(int *)(v12 + 20)) = 0;
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a2, 0, 1, v13);
  sub_237ED31B0();
}

void sub_237ED31B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  char v16;
  uint64_t v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA08);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237EE29DC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (uint64_t *)((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v0 + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, __n128))(v5 + 104))(v8, *MEMORY[0x24BEE5610], v4, v6);
  v10 = v9;
  LOBYTE(v9) = sub_237EE29E8();
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v8, v4);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    return;
  }
  v11 = sub_237ED28CC();
  if (!v11)
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v3, 1, 1, v19);
    sub_237ED46AC((uint64_t)v3);
LABEL_9:
    sub_237E2209C((uint64_t)v3, &qword_25689DA08);
    return;
  }
  v12 = v11;
  if ((sub_237ED36E4() & 1) == 0)
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v3, 1, 1, v20);
    sub_237ED46AC((uint64_t)v3);

    goto LABEL_9;
  }
  v13 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating;
  v14 = *(_QWORD *)(v0
                  + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating);
  v15 = (os_unfair_lock_s *)(*(_QWORD *)(v14 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v15);
  swift_beginAccess();
  v16 = *(_BYTE *)(v14 + 24);
  os_unfair_lock_unlock(v15);
  swift_endAccess();
  swift_release();
  if ((v16 & 1) == 0)
  {
    v17 = *(_QWORD *)(v0 + v13);
    v18 = (os_unfair_lock_s *)(*(_QWORD *)(v17 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v18);
    swift_beginAccess();
    *(_BYTE *)(v17 + 24) = 1;
    os_unfair_lock_unlock(v18);
    swift_endAccess();
    swift_release();
    objc_msgSend(v12, sel_startUpdatingLocation);
  }

}

void sub_237ED3418()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;
  _QWORD *v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint8_t *v20;
  uint64_t v21;
  NSObject *v22;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237EE1FB0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237ED28CC();
  if (v8)
  {
    v9 = v8;
    if (qword_2542C6458 != -1)
      swift_once();
    v10 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
    swift_beginAccess();
    sub_237E22004(v10, (uint64_t)v3, &qword_2542C6548);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_237E6072C((uint64_t)v7);
      sub_237E2209C((uint64_t)v3, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    }
    v11 = v0;
    v12 = sub_237EE1F98();
    v13 = sub_237EE2DA8();
    if (os_log_type_enabled(v12, v13))
    {
      v21 = v4;
      v14 = (uint8_t *)swift_slowAlloc();
      v19 = (_QWORD *)swift_slowAlloc();
      v20 = v14;
      *(_DWORD *)v14 = 138543362;
      v22 = v11;
      v15 = v11;
      sub_237EE2EE0();
      v16 = v19;
      *v19 = v11;

      v17 = v20;
      v4 = v21;
      _os_log_impl(&dword_237E17000, v12, v13, "[%{public}@] Requesting location authorization", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v16, -1, -1);
      MEMORY[0x23B8272A8](v17, -1, -1);
    }
    else
    {

      v12 = v11;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    objc_msgSend(v9, sel_requestWhenInUseAuthorizationWithPrompt);

  }
}

uint64_t sub_237ED36E4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  char *v15;
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
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
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
  NSObject *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  NSObject *v55;
  _QWORD *v56;
  uint8_t *v57;
  NSObject *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  NSObject *v63;
  _QWORD *v64;
  NSObject *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  _QWORD *v69;
  NSObject *v70;
  _QWORD *v71;
  NSObject *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  _QWORD *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  _QWORD *v82;
  NSObject *v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v86 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v86 - v5;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v86 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v86 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v86 - v14;
  v16 = sub_237EE1FB0();
  v17 = *(_QWORD *)(v16 - 8);
  v90 = v16;
  v91 = v17;
  MEMORY[0x24BDAC7A8](v16);
  v87 = (uint64_t)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v86 - v20;
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v86 - v23;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v86 - v26;
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v86 - v29;
  v89 = v0;
  result = (uint64_t)sub_237ED28CC();
  if (result)
  {
    v88 = result;
    switch(objc_msgSend((id)result, sel__authorizationStatus))
    {
      case 0u:
        if (qword_2542C6458 != -1)
          swift_once();
        v32 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_237E22004(v32, (uint64_t)v3, &qword_2542C6548);
        v33 = v90;
        v34 = v91;
        v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 48))(v3, 1, v90);
        v36 = v87;
        if (v35 == 1)
        {
          sub_237E6072C(v87);
          sub_237E2209C((uint64_t)v3, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v87, v3, v33);
        }
        v49 = v33;
        v50 = v89;
        v51 = sub_237EE1F98();
        v52 = sub_237EE2DA8();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc();
          v54 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v53 = 138543362;
          v92 = v50;
          v55 = v50;
          sub_237EE2EE0();
          *v54 = v50;

          _os_log_impl(&dword_237E17000, v51, v52, "[%{public}@] Location Permissions - notDetermined", v53, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
          swift_arrayDestroy();
          v56 = v54;
          v34 = v91;
          MEMORY[0x23B8272A8](v56, -1, -1);
          v57 = v53;
          v36 = v87;
          MEMORY[0x23B8272A8](v57, -1, -1);
        }
        else
        {

          v51 = v50;
        }

        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v49);
        goto LABEL_40;
      case 1u:
        if (qword_2542C6458 != -1)
          swift_once();
        v37 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_237E22004(v37, (uint64_t)v6, &qword_2542C6548);
        v39 = v90;
        v38 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v6, 1, v90) == 1)
        {
          sub_237E6072C((uint64_t)v21);
          sub_237E2209C((uint64_t)v6, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v21, v6, v39);
        }
        v58 = v89;
        v59 = sub_237EE1F98();
        v60 = sub_237EE2DA8();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          v62 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v61 = 138543362;
          v92 = v58;
          v63 = v58;
          sub_237EE2EE0();
          *v62 = v58;

          v39 = v90;
          _os_log_impl(&dword_237E17000, v59, v60, "[%{public}@] Location Permissions - restricted", v61, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
          swift_arrayDestroy();
          v64 = v62;
          v38 = v91;
          MEMORY[0x23B8272A8](v64, -1, -1);
          MEMORY[0x23B8272A8](v61, -1, -1);
        }
        else
        {

          v59 = v58;
        }

        (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v39);
        goto LABEL_45;
      case 2u:
        if (qword_2542C6458 != -1)
          swift_once();
        v40 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_237E22004(v40, (uint64_t)v9, &qword_2542C6548);
        v42 = v90;
        v41 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v9, 1, v90) == 1)
        {
          sub_237E6072C((uint64_t)v24);
          sub_237E2209C((uint64_t)v9, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v24, v9, v42);
        }
        v65 = v89;
        v66 = sub_237EE1F98();
        v67 = sub_237EE2DA8();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (uint8_t *)swift_slowAlloc();
          v69 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v68 = 138543362;
          v92 = v65;
          v70 = v65;
          sub_237EE2EE0();
          *v69 = v65;

          v42 = v90;
          _os_log_impl(&dword_237E17000, v66, v67, "[%{public}@] Location Permissions - denied", v68, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
          swift_arrayDestroy();
          v71 = v69;
          v41 = v91;
          MEMORY[0x23B8272A8](v71, -1, -1);
          MEMORY[0x23B8272A8](v68, -1, -1);
        }
        else
        {

          v66 = v65;
        }

        (*(void (**)(char *, uint64_t))(v41 + 8))(v24, v42);
        goto LABEL_45;
      case 3u:
        if (qword_2542C6458 != -1)
          swift_once();
        v43 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_237E22004(v43, (uint64_t)v15, &qword_2542C6548);
        v45 = v90;
        v44 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v15, 1, v90) == 1)
        {
          sub_237E6072C((uint64_t)v30);
          sub_237E2209C((uint64_t)v15, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v30, v15, v45);
        }
        v72 = v89;
        v73 = sub_237EE1F98();
        v74 = sub_237EE2DA8();
        if (os_log_type_enabled(v73, v74))
        {
          v75 = (uint8_t *)swift_slowAlloc();
          v76 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v75 = 138543362;
          v92 = v72;
          v77 = v72;
          sub_237EE2EE0();
          *v76 = v72;

          v45 = v90;
          _os_log_impl(&dword_237E17000, v73, v74, "[%{public}@] Location Permissions - always", v75, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
          swift_arrayDestroy();
          MEMORY[0x23B8272A8](v76, -1, -1);
          MEMORY[0x23B8272A8](v75, -1, -1);
          v72 = v88;
        }
        else
        {

          v73 = v72;
        }
        v85 = v91;

        (*(void (**)(char *, uint64_t))(v85 + 8))(v30, v45);
        goto LABEL_50;
      case 4u:
        if (qword_2542C6458 != -1)
          swift_once();
        v46 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_237E22004(v46, (uint64_t)v12, &qword_2542C6548);
        v48 = v90;
        v47 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v12, 1, v90) == 1)
        {
          sub_237E6072C((uint64_t)v27);
          sub_237E2209C((uint64_t)v12, &qword_2542C6548);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v27, v12, v48);
        }
        v78 = v89;
        v79 = sub_237EE1F98();
        v80 = sub_237EE2DA8();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = (uint8_t *)swift_slowAlloc();
          v82 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v81 = 138543362;
          v92 = v78;
          v83 = v78;
          sub_237EE2EE0();
          *v82 = v78;

          v48 = v90;
          _os_log_impl(&dword_237E17000, v79, v80, "[%{public}@] Location Permissions - whenInUse", v81, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
          swift_arrayDestroy();
          v84 = v82;
          v47 = v91;
          MEMORY[0x23B8272A8](v84, -1, -1);
          MEMORY[0x23B8272A8](v81, -1, -1);
        }
        else
        {

          v79 = v78;
        }

        (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v48);
LABEL_50:
        result = 1;
        break;
      default:
LABEL_40:
        sub_237ED3418();

LABEL_45:
        result = 0;
        break;
    }
  }
  return result;
}

unint64_t sub_237ED42BC()
{
  uint64_t v0;
  char v1;
  void *v2;
  id v3;

  sub_237EE2FA0();
  swift_bridgeObjectRelease();
  v1 = *(_BYTE *)(v0 + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 16);
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();
  if ((v1 & 1) != 0)
  {
    v2 = (void *)sub_237EE2A54();
    v3 = objc_msgSend(v2, sel_lastPathComponent);

    sub_237EE2A84();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  sub_237EE2AF0();

  sub_237EE2AF0();
  swift_bridgeObjectRelease();
  return 0xD000000000000015;
}

id sub_237ED4490()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationSource(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237ED4580()
{
  return type metadata accessor for LocationSource(0);
}

uint64_t type metadata accessor for LocationSource(uint64_t a1)
{
  return sub_237E42BC0(a1, (uint64_t *)&unk_25689D6C0);
}

void sub_237ED459C()
{
  unint64_t v0;

  sub_237ED4648();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_237ED4648()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25689D6D0)
  {
    sub_237E74A2C(255, &qword_25689D6D8);
    v0 = sub_237EE19D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25689D6D0);
  }
}

uint64_t sub_237ED46AC(uint64_t a1)
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
  void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __n128 v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  id v26;
  uint64_t v27;
  os_unfair_lock_s *v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  void (*v47)(char *, char *, uint64_t);
  _QWORD *v48;
  char *v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  id v52;
  uint64_t v53;
  uint64_t v54;
  os_unfair_lock_s *v55;
  NSObject *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  NSObject *v62;
  _QWORD *v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  os_unfair_lock_s *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void **v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  NSObject *v82;

  v76 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v2);
  v70 = (uint64_t)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237EE1FB0();
  v73 = *(_QWORD *)(v4 - 8);
  v74 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v72 = (uint64_t)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for CurrentLocationResult(0);
  MEMORY[0x24BDAC7A8](v78);
  v80 = (uint64_t)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CurrentLocation(0);
  v79 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v71 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA08);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (void **)((char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA10);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t *)((char *)&v68 - v16);
  MEMORY[0x24BDAC7A8](v18);
  v77 = (void **)((char *)&v68 - v19);
  v20 = sub_237EE29DC();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (uint64_t *)((char *)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v81 = v1;
  v25 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue);
  *v24 = v25;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, __n128))(v21 + 104))(v24, *MEMORY[0x24BEE5610], v20, v22);
  v26 = v25;
  LOBYTE(v25) = sub_237EE29E8();
  (*(void (**)(_QWORD *, uint64_t))(v21 + 8))(v24, v20);
  if ((v25 & 1) == 0)
  {
    __break(1u);
LABEL_13:
    swift_once();
    goto LABEL_4;
  }
  v27 = *(_QWORD *)((char *)v81
                  + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating);
  v28 = (os_unfair_lock_s *)(*(_QWORD *)(v27 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v28);
  swift_beginAccess();
  *(_BYTE *)(v27 + 24) = 0;
  os_unfair_lock_unlock(v28);
  swift_endAccess();
  swift_release();
  v29 = sub_237ED28CC();
  objc_msgSend(v29, sel_stopUpdatingLocation);

  sub_237E22004(v76, (uint64_t)v11, &qword_25689DA08);
  v30 = (*(uint64_t (**)(void **, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  v75 = v7;
  if (v30 != 1)
  {
    v38 = *(int *)(v12 + 48);
    v39 = (char *)v77 + v38;
    v40 = (char *)v11 + v38;
    v41 = *v11;
    *v77 = *v11;
    v42 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
    v43 = *(_QWORD *)(v42 - 8);
    v44 = v7;
    v45 = *(void (**)(char *, char *, uint64_t))(v43 + 32);
    v45(v39, v40, v42);
    v46 = (char *)v17 + *(int *)(v12 + 48);
    *v17 = v41;
    v47 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
    v47(v46, v39, v42);
    v48 = v71;
    v49 = &v71[*(int *)(v44 + 20)];
    v50 = &v69[*(int *)(v12 + 48)];
    v47(v50, v39, v42);
    v45(v49, v50, v42);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v49, 0, 1, v42);
    *v48 = v41;
    v51 = *(void (**)(char *, uint64_t))(v43 + 8);
    v52 = v41;
    v51(v46, v42);
    v53 = v80;
    v54 = *(_QWORD *)((char *)v81
                    + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream);
    sub_237E21EBC((uint64_t)v48, v80, type metadata accessor for CurrentLocation);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v79 + 56))(v53, 0, 1, v75);
    *(_BYTE *)(v53 + *(int *)(v78 + 20)) = 2;
    v55 = (os_unfair_lock_s *)(*(_QWORD *)(v54 + *(_QWORD *)(*(_QWORD *)v54 + 104)) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v55);
    swift_endAccess();
    sub_237E94274(v53);
    swift_beginAccess();
    os_unfair_lock_unlock(v55);
    swift_endAccess();
    swift_release();
    sub_237E21F00(v53, type metadata accessor for CurrentLocationResult);
    sub_237E21F00((uint64_t)v48, type metadata accessor for CurrentLocation);
    return sub_237E2209C((uint64_t)v77, &qword_25689DA10);
  }
  v17 = v81;
  sub_237E2209C((uint64_t)v11, &qword_25689DA08);
  if (qword_2542C6458 != -1)
    goto LABEL_13;
LABEL_4:
  v31 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  v32 = v31;
  v33 = v70;
  sub_237E22004(v32, v70, &qword_2542C6548);
  v35 = v73;
  v34 = v74;
  v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v33, 1, v74);
  v37 = v72;
  if (v36 == 1)
  {
    sub_237E6072C(v72);
    sub_237E2209C(v33, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v72, v33, v34);
  }
  v57 = v17;
  v58 = sub_237EE1F98();
  v59 = sub_237EE2DA8();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    v61 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v60 = 138543362;
    v82 = v57;
    v62 = v57;
    v37 = v72;
    sub_237EE2EE0();
    *v61 = v57;

    _os_log_impl(&dword_237E17000, v58, v59, "[%{public}@] No location found. Return fallback location", v60, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    v63 = v61;
    v35 = v73;
    MEMORY[0x23B8272A8](v63, -1, -1);
    v64 = v60;
    v34 = v74;
    MEMORY[0x23B8272A8](v64, -1, -1);
  }
  else
  {

    v58 = v57;
  }

  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v34);
  v65 = *(uint64_t *)((char *)&v57->isa
                   + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream);
  v66 = v80;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(v80, 1, 1, v75);
  *(_BYTE *)(v66 + *(int *)(v78 + 20)) = 0;
  v67 = (os_unfair_lock_s *)(*(_QWORD *)(v65 + *(_QWORD *)(*(_QWORD *)v65 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v67);
  swift_endAccess();
  sub_237E94274(v66);
  swift_beginAccess();
  os_unfair_lock_unlock(v67);
  swift_endAccess();
  swift_release();
  return sub_237E21F00(v66, type metadata accessor for CurrentLocationResult);
}

void sub_237ED4E58(NSObject *a1, unint64_t a2)
{
  char *v2;
  char *v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  __n128 v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  id v26;
  uint64_t v27;
  os_unfair_lock_s *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  NSObject *v67;
  char **v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;

  v3 = v2;
  v67 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA08);
  MEMORY[0x24BDAC7A8](v5);
  v68 = (char **)((char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v65 - v11;
  v13 = sub_237EE1FB0();
  v14 = *(_QWORD *)(v13 - 8);
  v69 = v13;
  v70 = v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v65 - v18;
  v20 = sub_237EE29DC();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (uint64_t *)((char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = *(void **)&v3[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  *v24 = v25;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, __n128))(v21 + 104))(v24, *MEMORY[0x24BEE5610], v20, v22);
  v26 = v25;
  LOBYTE(v25) = sub_237EE29E8();
  (*(void (**)(_QWORD *, uint64_t))(v21 + 8))(v24, v20);
  if ((v25 & 1) != 0)
  {
    v27 = *(_QWORD *)&v3[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating];
    v28 = (os_unfair_lock_s *)(*(_QWORD *)(v27 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v28);
    swift_beginAccess();
    *(_BYTE *)(v27 + 24) = 1;
    os_unfair_lock_unlock(v28);
    swift_endAccess();
    swift_release();
    if (!(a2 >> 62))
    {
      v29 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v29)
        goto LABEL_4;
LABEL_22:
      swift_bridgeObjectRelease();
      if (qword_2542C6458 != -1)
        swift_once();
      v54 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
      swift_beginAccess();
      sub_237E22004(v54, (uint64_t)v9, &qword_2542C6548);
      v56 = v69;
      v55 = v70;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48))(v9, 1, v69) == 1)
      {
        sub_237E6072C((uint64_t)v16);
        sub_237E2209C((uint64_t)v9, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v16, v9, v56);
      }
      v57 = v3;
      v58 = sub_237EE1F98();
      v59 = sub_237EE2D84();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        v61 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v60 = 138543362;
        v72 = v57;
        v62 = v57;
        v56 = v69;
        sub_237EE2EE0();
        *v61 = v57;

        v55 = v70;
        _os_log_impl(&dword_237E17000, v58, v59, "[%{public}@] singleLocationUpdate ends (no location)", v60, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
        swift_arrayDestroy();
        MEMORY[0x23B8272A8](v61, -1, -1);
        MEMORY[0x23B8272A8](v60, -1, -1);
      }
      else
      {

        v58 = v57;
      }

      (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v56);
      v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA10);
      v64 = (uint64_t)v68;
      (*(void (**)(char **, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v68, 1, 1, v63);
      sub_237ED46AC(v64);
      v53 = v64;
      goto LABEL_31;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  v29 = sub_237EE30A8();
  if (!v29)
    goto LABEL_22;
LABEL_4:
  v30 = v29 - 1;
  if (__OFSUB__(v29, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_33:
    v16 = (char *)MEMORY[0x23B826624](v30, a2);
    v31 = v70;
    goto LABEL_9;
  }
  v31 = v70;
  if ((v30 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v30 < *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v16 = (char *)*(id *)(a2 + 8 * v30 + 32);
LABEL_9:
    swift_bridgeObjectRelease();
    if ((-[NSObject _limitsPrecision](v67, sel__limitsPrecision) & 1) == 0)
    {
      objc_msgSend(v16, sel_horizontalAccuracy);
      if (v32 > 1500.0)
      {

        return;
      }
    }
    if (qword_2542C6458 == -1)
      goto LABEL_13;
    goto LABEL_36;
  }
  __break(1u);
LABEL_36:
  swift_once();
LABEL_13:
  v33 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_237E22004(v33, (uint64_t)v12, &qword_2542C6548);
  v34 = v69;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v12, 1, v69) == 1)
  {
    sub_237E6072C((uint64_t)v19);
    sub_237E2209C((uint64_t)v12, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v19, v12, v34);
  }
  v35 = v3;
  v36 = v16;
  v37 = v35;
  v38 = v36;
  v39 = sub_237EE1F98();
  v40 = sub_237EE2D84();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v66 = v19;
    v43 = (_QWORD *)v42;
    v67 = swift_slowAlloc();
    v71 = (uint64_t)v37;
    v72 = v67;
    *(_DWORD *)v41 = 138543619;
    v44 = v37;
    sub_237EE2EE0();
    *v43 = v37;

    *(_WORD *)(v41 + 12) = 2081;
    v71 = (uint64_t)v38;
    sub_237E74A2C(0, &qword_25689DA18);
    v45 = v38;
    v46 = sub_237EE2AA8();
    v71 = sub_237E2A660(v46, v47, (uint64_t *)&v72);
    sub_237EE2EE0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_237E17000, v39, v40, "[%{public}@] singleLocationUpdate ends (location: %{private}s)", (uint8_t *)v41, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v43, -1, -1);
    v48 = v67;
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v48, -1, -1);
    MEMORY[0x23B8272A8](v41, -1, -1);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v66, v69);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v34);
  }
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA10);
  v50 = (uint64_t)v68;
  *v68 = v38;
  v51 = v38;
  objc_msgSend(v51, sel_horizontalAccuracy);
  v52 = objc_msgSend((id)objc_opt_self(), sel_meters);
  sub_237E74A2C(0, &qword_25689D6D8);
  sub_237EE19BC();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v50, 0, 1, v49);
  sub_237ED46AC(v50);

  v53 = v50;
LABEL_31:
  sub_237E2209C(v53, &qword_25689DA08);
}

id sub_237ED582C()
{
  uint64_t v0;
  id result;

  type metadata accessor for PlacemarkNameLookup();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA68]), sel_init);
  *(_QWORD *)(v0 + 112) = result;
  qword_25689E000 = v0;
  return result;
}

uint64_t sub_237ED5880(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[20] = a1;
  v2[21] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  v2[22] = swift_task_alloc();
  v3 = sub_237EE1FB0();
  v2[23] = v3;
  v2[24] = *(_QWORD *)(v3 - 8);
  v2[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237ED5904()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[20];
  v2 = *(void **)(v0[21] + 112);
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_237ED59A8;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_237ED5D78;
  v4[3] = &block_descriptor_14;
  v4[4] = v3;
  objc_msgSend(v2, sel_reverseGeocodeLocation_completionHandler_, v1, v4);
  return swift_continuation_await();
}

uint64_t sub_237ED59A8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

void sub_237ED5A08()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 144);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    v5 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  v2 = sub_237EE30A8();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_8;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v3 = (id)MEMORY[0x23B826624](0, v1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v3 = *(id *)(v1 + 32);
LABEL_6:
    v4 = v3;
    swift_bridgeObjectRelease();
    v5 = sub_237ED7D1C(v4);
    v2 = v6;

LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v5, v2);
    return;
  }
  __break(1u);
}

uint64_t sub_237ED5AF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;

  swift_willThrow();
  if (qword_2542C6458 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_237E22004(v4, v3, &qword_2542C6548);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v5 = *(_QWORD *)(v0 + 176);
    sub_237E6072C(*(_QWORD *)(v0 + 200));
    sub_237E2209C(v5, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 32))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
  }
  v6 = *(void **)(v0 + 208);
  v7 = v6;
  v8 = v6;
  v9 = sub_237EE1F98();
  v10 = sub_237EE2D84();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(void **)(v0 + 208);
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138477827;
    v15 = v12;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 152) = v16;
    sub_237EE2EE0();
    *v14 = v16;

    _os_log_impl(&dword_237E17000, v9, v10, "Error lookup name for location %{private}@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v14, -1, -1);
    MEMORY[0x23B8272A8](v13, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t sub_237ED5D78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA00);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_237E74A2C(0, &qword_25689D9F8);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_237EE2BD4();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_237ED5E20()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for PlacemarkNameLookup()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for LocationSource.Source()
{
  return &type metadata for LocationSource.Source;
}

char *sub_237ED5E74(char *a1, char **a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for CurrentLocation(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = *a2;
      *(_QWORD *)a1 = *a2;
      v12 = *(int *)(v7 + 20);
      v13 = &a1[v12];
      v14 = (char *)a2 + v12;
      v15 = v11;
      v16 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
      v17 = *(_QWORD *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16))
      {
        v18 = type metadata accessor for LocationAccuracy(0);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v14, v16);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    a1[*(int *)(a3 + 20)] = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t type metadata accessor for CurrentLocation(uint64_t a1)
{
  return sub_237E42BC0(a1, qword_25689D980);
}

uint64_t type metadata accessor for LocationAccuracy(uint64_t a1)
{
  return sub_237E42BC0(a1, qword_25689D918);
}

uint64_t sub_237ED6010(id *a1)
{
  uint64_t v2;
  uint64_t result;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = type metadata accessor for CurrentLocation(0);
  result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {

    v4 = (char *)a1 + *(int *)(v2 + 20);
    v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
    v6 = *(_QWORD *)(v5 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return result;
}

void **sub_237ED60B4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for CurrentLocation(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = *a2;
    *a1 = *a2;
    v10 = *(int *)(v6 + 20);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = v9;
    v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
    {
      v16 = type metadata accessor for LocationAccuracy(0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v12, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
    }
    (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void **sub_237ED61FC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void **, uint64_t, uint64_t);
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  void **v20;
  void **v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  int v32;

  v6 = type metadata accessor for CurrentLocation(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v22 = *a2;
      v23 = *a1;
      *a1 = *a2;
      v24 = v22;

      v25 = *(int *)(v6 + 20);
      v26 = (char *)a1 + v25;
      v27 = (char *)a2 + v25;
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
      v29 = *(_QWORD *)(v28 - 8);
      v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
      v31 = v30(v26, 1, v28);
      v32 = v30(v27, 1, v28);
      if (v31)
      {
        if (!v32)
        {
          (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v32)
        {
          (*(void (**)(char *, char *, uint64_t))(v29 + 24))(v26, v27, v28);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for LocationAccuracy(0) - 8) + 64);
      v20 = (void **)v26;
      v21 = (void **)v27;
      goto LABEL_8;
    }
    sub_237E21F00((uint64_t)a1, type metadata accessor for CurrentLocation);
LABEL_7:
    v19 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8) - 8) + 64);
    v20 = a1;
    v21 = a2;
LABEL_8:
    memcpy(v20, v21, v19);
    goto LABEL_14;
  }
  if (v10)
    goto LABEL_7;
  v11 = *a2;
  *a1 = *a2;
  v12 = *(int *)(v6 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = v11;
  v16 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16))
  {
    v18 = type metadata accessor for LocationAccuracy(0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v14, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_237ED6448(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for CurrentLocation(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v9 = *(int *)(v6 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = type metadata accessor for LocationAccuracy(0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

void **sub_237ED658C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void **, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  void **v18;
  const void *v19;
  void *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  int v28;

  v6 = type metadata accessor for CurrentLocation(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v20 = *a1;
      *a1 = *a2;

      v21 = *(int *)(v6 + 20);
      v22 = (char *)a1 + v21;
      v23 = (char *)a2 + v21;
      v24 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
      v25 = *(_QWORD *)(v24 - 8);
      v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
      v27 = v26(v22, 1, v24);
      v28 = v26(v23, 1, v24);
      if (v27)
      {
        if (!v28)
        {
          (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v28)
        {
          (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for LocationAccuracy(0) - 8) + 64);
      v18 = (void **)v22;
      v19 = v23;
      goto LABEL_8;
    }
    sub_237E21F00((uint64_t)a1, type metadata accessor for CurrentLocation);
LABEL_7:
    v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8) - 8) + 64);
    v18 = a1;
    v19 = a2;
LABEL_8:
    memcpy(v18, v19, v17);
    goto LABEL_14;
  }
  if (v10)
    goto LABEL_7;
  *a1 = *a2;
  v11 = *(int *)(v6 + 20);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = type metadata accessor for LocationAccuracy(0);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_237ED67D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ED67DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 5)
    return v9 - 4;
  else
    return 0;
}

uint64_t sub_237ED6858()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ED6864(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 4;
  return result;
}

uint64_t type metadata accessor for CurrentLocationResult(uint64_t a1)
{
  return sub_237E42BC0(a1, qword_25689D868);
}

void sub_237ED68F4()
{
  unint64_t v0;

  sub_237E511B8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_237ED6964(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_237ED6A30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_237ED6A9C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_237ED6B44(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_237ED6C38(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_237ED6CE0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_237ED6DD4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ED6DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_237ED6E30()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ED6E3C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_237ED6E90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_237ED6ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

void sub_237ED6F10()
{
  unint64_t v0;

  sub_237ED4648();
  if (v0 <= 0x3F)
    swift_initEnumMetadataSinglePayload();
}

uint64_t storeEnumTagSinglePayload for LocationDataProvider.Use(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237ED6FB0 + 4 * byte_237EED47A[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237ED6FE4 + 4 * byte_237EED475[v4]))();
}

uint64_t sub_237ED6FE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237ED6FEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237ED6FF4);
  return result;
}

uint64_t sub_237ED7000(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237ED7008);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237ED700C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237ED7014(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationDataProvider.Use()
{
  return &type metadata for LocationDataProvider.Use;
}

void **sub_237ED7030(void **a1, void **a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = v5;
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      v12 = type metadata accessor for LocationAccuracy(0);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v8, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
  }
  return a1;
}

uint64_t sub_237ED7114(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

void **sub_237ED7194(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9))
  {
    v11 = type metadata accessor for LocationAccuracy(0);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v6, v7, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  }
  return a1;
}

void **sub_237ED7254(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = type metadata accessor for LocationAccuracy(0);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_QWORD *sub_237ED7370(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = type metadata accessor for LocationAccuracy(0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void **sub_237ED742C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = type metadata accessor for LocationAccuracy(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_237ED7544()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237ED7550(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for LocationAccuracy(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_237ED75CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_237ED75D8(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for LocationAccuracy(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_237ED764C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LocationAccuracy(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_237ED76C8()
{
  unint64_t result;

  result = qword_25689D9B8;
  if (!qword_25689D9B8)
  {
    result = MEMORY[0x23B8271D0](&unk_237EED670, &type metadata for LocationDataProvider.Use);
    atomic_store(result, (unint64_t *)&qword_25689D9B8);
  }
  return result;
}

unint64_t sub_237ED770C(uint64_t a1)
{
  unint64_t result;

  result = sub_237ED7730();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237ED7730()
{
  unint64_t result;

  result = qword_25689D9C0;
  if (!qword_25689D9C0)
  {
    result = MEMORY[0x23B8271D0](&unk_237EED710, &type metadata for LocationSource.Source);
    atomic_store(result, (unint64_t *)&qword_25689D9C0);
  }
  return result;
}

uint64_t sub_237ED7774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25689D800);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocationAccuracy(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9D8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v13[*(int *)(v14 + 48)];
  sub_237E21EBC(a1, (uint64_t)v13, type metadata accessor for LocationAccuracy);
  sub_237E21EBC(a2, v15, type metadata accessor for LocationAccuracy);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v13, 1, v4) != 1)
  {
    sub_237E21EBC((uint64_t)v13, (uint64_t)v10, type metadata accessor for LocationAccuracy);
    if (v16(v15, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      sub_237E74A2C(0, &qword_25689D6D8);
      v17 = sub_237EE19B0();
      v18 = *(void (**)(char *, uint64_t))(v5 + 8);
      v18(v7, v4);
      v18(v10, v4);
      sub_237E21F00((uint64_t)v13, type metadata accessor for LocationAccuracy);
      return v17 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_237E2209C((uint64_t)v13, &qword_25689D9D8);
    v17 = 0;
    return v17 & 1;
  }
  sub_237E21F00((uint64_t)v13, type metadata accessor for LocationAccuracy);
  v17 = 1;
  return v17 & 1;
}

BOOL sub_237ED79A8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = type metadata accessor for CurrentLocation(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256899D20);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
  MEMORY[0x24BDAC7A8](v11);
  v30 = (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v27 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v27 - v17;
  v28 = a1;
  sub_237E22004(a1, (uint64_t)&v27 - v17, &qword_2568995B8);
  v29 = a2;
  sub_237E22004(a2, (uint64_t)v15, &qword_2568995B8);
  v19 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_237E22004((uint64_t)v18, (uint64_t)v10, &qword_2568995B8);
  sub_237E22004((uint64_t)v15, v19, &qword_2568995B8);
  v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v20((uint64_t)v10, 1, v4) == 1)
  {
    sub_237E2209C((uint64_t)v15, &qword_2568995B8);
    sub_237E2209C((uint64_t)v18, &qword_2568995B8);
    if (v20(v19, 1, v4) == 1)
    {
      sub_237E2209C((uint64_t)v10, &qword_2568995B8);
LABEL_4:
      v21 = type metadata accessor for CurrentLocationResult(0);
      return *(unsigned __int8 *)(v28 + *(int *)(v21 + 20)) == *(unsigned __int8 *)(v29 + *(int *)(v21 + 20));
    }
    goto LABEL_7;
  }
  v23 = v30;
  sub_237E22004((uint64_t)v10, v30, &qword_2568995B8);
  if (v20(v19, 1, v4) == 1)
  {
    sub_237E2209C((uint64_t)v15, &qword_2568995B8);
    sub_237E2209C((uint64_t)v18, &qword_2568995B8);
    sub_237E21F00(v23, type metadata accessor for CurrentLocation);
LABEL_7:
    v24 = &qword_256899D20;
    v25 = (uint64_t)v10;
LABEL_8:
    sub_237E2209C(v25, v24);
    return 0;
  }
  sub_237E47CE0(v19, (uint64_t)v7, type metadata accessor for CurrentLocation);
  sub_237E74A2C(0, (unint64_t *)&qword_25689D9D0);
  if ((sub_237EE2EB0() & 1) == 0)
  {
    sub_237E21F00((uint64_t)v7, type metadata accessor for CurrentLocation);
    sub_237E2209C((uint64_t)v15, &qword_2568995B8);
    sub_237E2209C((uint64_t)v18, &qword_2568995B8);
    sub_237E21F00(v23, type metadata accessor for CurrentLocation);
    v25 = (uint64_t)v10;
    v24 = &qword_2568995B8;
    goto LABEL_8;
  }
  v26 = sub_237ED7774(v23 + *(int *)(v4 + 20), (uint64_t)&v7[*(int *)(v4 + 20)]);
  sub_237E21F00((uint64_t)v7, type metadata accessor for CurrentLocation);
  sub_237E2209C((uint64_t)v15, &qword_2568995B8);
  sub_237E2209C((uint64_t)v18, &qword_2568995B8);
  sub_237E21F00(v23, type metadata accessor for CurrentLocation);
  sub_237E2209C((uint64_t)v10, &qword_2568995B8);
  if ((v26 & 1) != 0)
    goto LABEL_4;
  return 0;
}

uint64_t sub_237ED7D1C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_locality);
  if (!v2)
  {
    v2 = objc_msgSend(a1, sel_name);
    if (!v2)
    {
      v2 = objc_msgSend(a1, sel_subAdministrativeArea);
      if (!v2)
      {
        v2 = objc_msgSend(a1, sel_administrativeArea);
        if (!v2)
        {
          v2 = objc_msgSend(a1, sel_inlandWater);
          if (!v2)
          {
            v2 = objc_msgSend(a1, sel_country);
            if (!v2)
            {
              v2 = objc_msgSend(a1, sel_ocean);
              if (!v2)
                return 0;
            }
          }
        }
      }
    }
  }
  v3 = sub_237EE2A84();

  return v3;
}

uint64_t sub_237ED7E44(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  id v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA08);
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)sub_237EE1FB0();
  v9 = *(v8 - 1);
  MEMORY[0x24BDAC7A8](v8);
  v44 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_237EE29DC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v42 = v1;
  v16 = *(void **)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  *v15 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, __n128))(v12 + 104))(v15, *MEMORY[0x24BEE5610], v11, v13);
  v17 = v16;
  v18 = sub_237EE29E8();
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v15, v11);
  if ((v18 & 1) != 0)
  {
    if (qword_2542C6458 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v19 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_237E22004(v19, (uint64_t)v7, &qword_2542C6548);
  v20 = v9;
  v21 = (*(uint64_t (**)(char *, uint64_t, _QWORD *))(v9 + 48))(v7, 1, v8);
  v22 = v44;
  if (v21 == 1)
  {
    sub_237E6072C(v44);
    sub_237E2209C((uint64_t)v7, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(uint64_t, char *, _QWORD *))(v9 + 32))(v44, v7, v8);
  }
  v23 = v42;
  v24 = a1;
  v25 = v23;
  v26 = a1;
  v27 = sub_237EE1F98();
  v28 = sub_237EE2D84();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v42 = v8;
    v31 = (_QWORD *)v30;
    v40 = swift_slowAlloc();
    v45 = (uint64_t)v25;
    v46 = v40;
    *(_DWORD *)v29 = 138543618;
    v41 = v20;
    v32 = v25;
    sub_237EE2EE0();
    *v31 = v25;

    *(_WORD *)(v29 + 12) = 2082;
    v45 = (uint64_t)a1;
    v33 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA00);
    v34 = sub_237EE2AA8();
    v45 = sub_237E2A660(v34, v35, &v46);
    sub_237EE2EE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237E17000, v27, v28, "[%{public}@] singleLocationUpdate END (error: %{public}s)", (uint8_t *)v29, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v31, -1, -1);
    v36 = v40;
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v36, -1, -1);
    MEMORY[0x23B8272A8](v29, -1, -1);

    (*(void (**)(uint64_t, id))(v41 + 8))(v44, v42);
  }
  else
  {

    (*(void (**)(uint64_t, _QWORD *))(v20 + 8))(v22, v8);
  }
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA10);
  v38 = (uint64_t)v43;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v43, 1, 1, v37);
  sub_237ED46AC(v38);
  return sub_237E2209C(v38, &qword_25689DA08);
}

void sub_237ED82D0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_237EE1FB0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_237EE29DC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, __n128))(v10 + 104))(v13, *MEMORY[0x24BEE5610], v9, v11);
  v15 = v14;
  LOBYTE(v14) = sub_237EE29E8();
  (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v13, v9);
  if ((v14 & 1) != 0)
  {
    if (qword_2542C6458 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v16 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_237E22004(v16, (uint64_t)v4, &qword_2542C6548);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_237E6072C((uint64_t)v8);
    sub_237E2209C((uint64_t)v4, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  }
  v17 = v1;
  v18 = sub_237EE1F98();
  v19 = sub_237EE2D84();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    v23 = v5;
    v24 = v6;
    *(_DWORD *)v20 = 138543362;
    v25 = v17;
    v22 = v17;
    v5 = v23;
    v6 = v24;
    sub_237EE2EE0();
    *v21 = v17;

    _os_log_impl(&dword_237E17000, v18, v19, "[%{public}@] singleLocationUpdate did change authorization", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689D9F0);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v21, -1, -1);
    MEMORY[0x23B8272A8](v20, -1, -1);
  }
  else
  {

    v18 = v17;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_237ED31B0();
}

uint64_t sub_237ED85F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_237ED861C()
{
  uint64_t v0;

  sub_237ED2F5C(*(_QWORD *)(v0 + 16), *(_QWORD **)(v0 + 24));
}

uint64_t sub_237ED8624()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

void sub_237ED864C(id a1)
{
  if (a1 != (id)1)

}

id sub_237ED865C(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_237ED866C(uint64_t a1)
{
  uint64_t v1;

  return sub_237E91EC4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_237ED8674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_237ED86BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25689DA60;
  if (!qword_25689DA60)
  {
    v1 = sub_237EE2DE4();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_25689DA60);
  }
  return result;
}

unint64_t sub_237ED8704()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25689DA70;
  if (!qword_25689DA70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25689DA68);
    result = MEMORY[0x23B8271D0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25689DA70);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for LocationStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237ED879C + 4 * byte_237EED484[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_237ED87D0 + 4 * byte_237EED47F[v4]))();
}

uint64_t sub_237ED87D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237ED87D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237ED87E0);
  return result;
}

uint64_t sub_237ED87EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237ED87F4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_237ED87F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237ED8800(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationStatus()
{
  return &type metadata for LocationStatus;
}

unint64_t sub_237ED8820()
{
  unint64_t result;

  result = qword_25689DA78;
  if (!qword_25689DA78)
  {
    result = MEMORY[0x23B8271D0](&unk_237EED7F4, &type metadata for LocationStatus);
    atomic_store(result, (unint64_t *)&qword_25689DA78);
  }
  return result;
}

void sub_237ED8868(uint64_t a1, id a2, double a3, double a4, double a5, double a6)
{
  char *v6;
  id v13;
  id v14;
  char *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  objc_super v41;

  *(_QWORD *)&v6[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label] = 0;
  v41.receiver = v6;
  v41.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  v13 = objc_msgSendSuper2(&v41, sel_initWithFrame_, a3, a4, a5, a6);
  v14 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v15 = (char *)v13;
  v16 = objc_msgSend(v14, sel_init);
  v17 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack;
  v18 = *(void **)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack];
  *(_QWORD *)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack] = v16;

  v19 = *(void **)&v15[v17];
  if (!v19)
  {
    __break(1u);
    goto LABEL_13;
  }
  objc_msgSend(v19, sel_setSpacing_, 0.0);
  v20 = *(void **)&v15[v17];
  if (!v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  objc_msgSend(v20, sel_setAxis_, 0);
  v21 = *(void **)&v15[v17];
  if (!v21)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v21, sel_setAlignment_, 3);
  v22 = *(void **)&v15[v17];
  if (!v22)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(v22, sel_setDistribution_, 3);
  v23 = *(void **)&v15[v17];
  if (!v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v23, sel_setSpacing_, 4.0);
  if (!*(_QWORD *)&v15[v17])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v15, sel_addSubview_);
  v24 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE240]);
  v25 = objc_msgSend(v24, sel_fontWithSize_, 18.0);

  v26 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v25);
  v27 = v26;
  if ((a2 & 1) != 0)
  {
    v29 = v26;
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    v28 = v27;
  }
  v30 = (void *)sub_237EE2A54();
  swift_bridgeObjectRelease();
  a2 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v30, v27);

  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, a2);
  v32 = *(void **)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon];
  *(_QWORD *)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon] = v31;

  v33 = sub_237EB121C(22.0);
  v34 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label;
  v35 = *(void **)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label];
  *(_QWORD *)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label] = v33;

  v36 = *(void **)&v15[v34];
  if (v36)
  {
    v37 = v36;
    v38 = (void *)sub_237EE1CF8();
    v39 = objc_msgSend((id)objc_opt_self(), sel_textProviderWithDate_, v38);

    objc_msgSend(v37, sel_setTextProvider_, v39);
    v40 = sub_237EE1D70();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 8))(a1, v40);
    return;
  }
LABEL_18:

  __break(1u);
}

void sub_237ED8D94()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id (*v24)(uint64_t);
  uint64_t v25;

  v1 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = v1;
  v3 = objc_msgSend(v0, sel_tintColor);
  if (!v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v4 = v3;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = 0x4069800000000000;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v24 = sub_237E2DF20;
  v25 = v5;
  v7 = MEMORY[0x24BDAC760];
  v20 = MEMORY[0x24BDAC760];
  v21 = 1107296256;
  v22 = sub_237E7D770;
  v23 = &block_descriptor_15;
  v8 = _Block_copy(&v20);
  v9 = v4;
  v10 = objc_msgSend(v6, sel_initWithDynamicProvider_, v8);
  _Block_release(v8);

  swift_release();
  objc_msgSend(v2, sel_setTintColor_, v10);

  v11 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label];
  if (v11)
  {
    v12 = (void *)objc_opt_self();
    v13 = v11;
    v14 = objc_msgSend(v12, sel_whiteColor);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    *(_QWORD *)(v15 + 24) = 0x4063200000000000;
    v16 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v24 = sub_237E2DF74;
    v25 = v15;
    v20 = v7;
    v21 = 1107296256;
    v22 = sub_237E7D770;
    v23 = &block_descriptor_7_4;
    v17 = _Block_copy(&v20);
    v18 = v14;
    v19 = objc_msgSend(v16, sel_initWithDynamicProvider_, v17);
    _Block_release(v17);

    swift_release();
    objc_msgSend(v13, sel_setTextColor_, v19);

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_237ED8FD8()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v1 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack;
  v2 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack];
  if (!v2)
  {
    __break(1u);
    goto LABEL_16;
  }
  v3 = objc_msgSend(v2, sel_subviews);
  sub_237E387EC();
  v4 = sub_237EE2BD4();

  v5 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon;
  v6 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon];
  if (!v6)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v7 = v6;
  v8 = sub_237E60450((uint64_t)v7, v4);
  swift_bridgeObjectRelease();

  if ((v8 & 1) == 0)
  {
    v9 = *(void **)&v0[v1];
    if (!v9)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    if (!*(_QWORD *)&v0[v5])
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    objc_msgSend(v9, sel_addArrangedSubview_);
  }
  v10 = *(void **)&v0[v1];
  if (!v10)
    goto LABEL_17;
  v11 = objc_msgSend(v10, sel_subviews);
  v12 = sub_237EE2BD4();

  v13 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label;
  v14 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label];
  if (!v14)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v15 = v14;
  v16 = sub_237E60450((uint64_t)v15, v12);
  swift_bridgeObjectRelease();

  if ((v16 & 1) != 0)
    goto LABEL_13;
  v17 = *(void **)&v0[v1];
  if (!v17)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (*(_QWORD *)&v0[v13])
  {
    objc_msgSend(v17, sel_addArrangedSubview_);
LABEL_13:
    v18 = *(void **)&v0[v1];
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v0, sel_bounds);
      objc_msgSend(v19, sel_setFrame_);

      return;
    }
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

id sub_237ED91C8(double a1, double a2)
{
  uint64_t v2;
  id result;
  double v6;

  result = *(id *)(v2 + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label);
  if (result)
  {
    objc_msgSend(result, sel_sizeThatFits_);
    result = *(id *)(v2 + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon);
    if (result)
      return objc_msgSend(result, sel_sizeThatFits_, a1 - v6, a2);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_237ED92A4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnalogClockFaceAlarmComplicationView()
{
  return objc_opt_self();
}

uint64_t sub_237ED933C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t initializeWithCopy for SolarTerminatorPath(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SolarTerminatorPath(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for SolarTerminatorPath(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SolarTerminatorPath(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SolarTerminatorPath(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SolarTerminatorPath()
{
  return &type metadata for SolarTerminatorPath;
}

BOOL sub_237ED9504()
{
  double v0;
  char v1;
  long double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  _QWORD *v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double *v14;
  double v15;

  v0 = COERCE_DOUBLE(sub_237ED9790());
  if ((v1 & 1) != 0)
    return 0;
  v2 = v0;
  v3 = sin((v0 + 284.0) * 0.98630137 * 0.0174532925) * 23.45;
  v4 = (fmod(v2, 1.0) * 24.0 + -12.0) * 15.0;
  v5 = tan(v3 * 0.0174532925);
  v6 = 0;
  v7 = fabs(v3);
  if (v7 <= 15.0 && v7 <= 10.0)
    v8 = 1;
  else
    v8 = 3;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    if (v6 % v8)
      goto LABEL_10;
    v15 = (double)v6 + -180.0;
    if (v5 == 0.0)
    {
      v11 = 0.0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_14:
        v9 = sub_237E61EFC(0, v9[2] + 1, 1, v9);
    }
    else
    {
      v10 = cos((v4 + v15) * 0.0174532925);
      v11 = atan(-v10 / v5) * 57.2957795;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        goto LABEL_14;
    }
    v13 = v9[2];
    v12 = v9[3];
    if (v13 >= v12 >> 1)
      v9 = sub_237E61EFC((_QWORD *)(v12 > 1), v13 + 1, 1, v9);
    v9[2] = v13 + 1;
    v14 = (double *)&v9[2 * v13];
    v14[4] = v11;
    v14[5] = v15;
LABEL_10:
    ++v6;
  }
  while (v6 != 361);
  return v3 > 0.0;
}

uint64_t sub_237ED9700(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 8);
  result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0)
    return (*(_QWORD *)a1 == *(_QWORD *)a2) & ~(_DWORD)result;
  return result;
}

uint64_t sub_237ED9728(unsigned __int8 *a1, unsigned __int8 *a2, int32x2_t a3)
{
  unsigned __int8 v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;

  if (*a1 == *a2)
  {
    v3 = a1[24];
    v4 = a2[24];
    v5 = *((_QWORD *)a2 + 2);
    v6 = *((_QWORD *)a1 + 2);
    sub_237EDA788(*((_QWORD *)a1 + 1), *((_QWORD *)a2 + 1), a3);
    if ((v7 & 1) != 0)
    {
      if ((v3 & 1) != 0)
      {
        if (v4)
          return 1;
      }
      else
      {
        if (v6 == v5)
          v9 = v4;
        else
          v9 = 1;
        if ((v9 & 1) == 0)
          return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_237ED9790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t result;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v1 = sub_237EE1A88();
  v51 = *(_QWORD *)(v1 - 8);
  v52 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v50 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_237EE1DF4();
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237EE1E6C();
  v48 = *(_QWORD *)(v6 - 8);
  v49 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v47 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_237EE1D70();
  v11 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v46 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_237EE1EC0();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v42 - v21;
  v23 = v0;
  sub_237ED9BF8((uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    v24 = &qword_256897E10;
    v25 = (uint64_t)v15;
LABEL_5:
    sub_237E2209C(v25, v24);
    *(double *)&result = 0.0;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
  sub_237ED9FE4((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, v53) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
    v24 = &qword_25689C140;
    v25 = (uint64_t)v10;
    goto LABEL_5;
  }
  v43 = v11;
  v27 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v28 = v46;
  v27(v46, v10, v53);
  v29 = *MEMORY[0x24BDCEF70];
  v30 = v44;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 104);
  v42 = v23;
  v32 = v45;
  v31(v5, v29, v45);
  v33 = v47;
  sub_237EE1E00();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v32);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v19, v22, v16);
  sub_237EE1E54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE00);
  v34 = sub_237EE1E60();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_237EE55E0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v35 + 104))(v37 + v36, *MEMORY[0x24BDCF260], v34);
  sub_237EC1754(v37);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v38 = v50;
  sub_237EE1E0C();
  swift_bridgeObjectRelease();
  v39 = sub_237EE1A58();
  LOBYTE(v37) = v40;
  v41 = (double)v39 / 86400.0;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v52);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v49);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v28, v53);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
  if ((v37 & 1) != 0)
    *(double *)&result = 1.0;
  else
    *(double *)&result = v41 + 1.0;
  return result;
}

uint64_t sub_237ED9BF8@<X0>(uint64_t a1@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = sub_237EE1D70();
  v38 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237EE1FB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237EE1E90();
  v15 = sub_237EE1EC0();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    v34 = v2;
    v37 = v9;
    sub_237E2209C((uint64_t)v14, &qword_256897E10);
    if (qword_2542C6458 != -1)
      swift_once();
    v17 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_237E2CAA0(v17, (uint64_t)v7);
    v18 = v37;
    v19 = v8;
    v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v7, 1, v8);
    v35 = a1;
    if (v20 == 1)
    {
      sub_237E6072C((uint64_t)v11);
      sub_237E2209C((uint64_t)v7, &qword_2542C6548);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v11, v7, v8);
    }
    v22 = v38;
    v23 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v4, v36, v34);
    v24 = sub_237EE1F98();
    v25 = sub_237EE2D90();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v36 = v19;
      v27 = (uint8_t *)v26;
      v33 = swift_slowAlloc();
      v40 = v33;
      *(_DWORD *)v27 = 136446210;
      v32 = v27 + 4;
      sub_237EDA900();
      v28 = sub_237EE3180();
      v39 = sub_237E2A660(v28, v29, &v40);
      sub_237EE2EE0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v4, v23);
      _os_log_impl(&dword_237E17000, v24, v25, "[%{public}s] Cannot get GMT time zone to calculate solar curves", v27, 0xCu);
      v21 = 1;
      v30 = v33;
      swift_arrayDestroy();
      MEMORY[0x23B8272A8](v30, -1, -1);
      MEMORY[0x23B8272A8](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v36);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v23);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v19);
      v21 = 1;
    }
    a1 = v35;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a1, v14, v15);
    v21 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a1, v21, 1, v15);
}

uint64_t sub_237ED9FE4@<X0>(uint64_t a1@<X8>)
{
  uint8_t *v1;
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
  char *v12;
  uint64_t v13;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  char *v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  uint64_t v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v80 = a1;
  v2 = sub_237EE1D70();
  v78 = *(_QWORD *)(v2 - 8);
  v79 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  MEMORY[0x24BDAC7A8](v4);
  v66 = (uint64_t)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237EE1FB0();
  v69 = *(_QWORD *)(v6 - 8);
  v70 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v68 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  MEMORY[0x24BDAC7A8](v8);
  v71 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_237EE1A88();
  v75 = *(_QWORD *)(v10 - 8);
  v76 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_237EE1DF4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_237EE1E6C();
  v73 = *(_QWORD *)(v17 - 8);
  v74 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v77 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E10);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_237EE1EC0();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v63 - v27;
  v72 = v1;
  sub_237ED9BF8((uint64_t)v21);
  v29 = v22;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_237E2209C((uint64_t)v21, &qword_256897E10);
    v30 = 1;
    v32 = v79;
    v31 = v80;
    v33 = v78;
  }
  else
  {
    v34 = v28;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v28, v21, v29);
    (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BDCEF70], v13);
    v35 = v77;
    sub_237EE1E00();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v25, v34, v29);
    v36 = v29;
    sub_237EE1E54();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689CE00);
    v37 = sub_237EE1E60();
    v38 = *(_QWORD *)(v37 - 8);
    v39 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_237EE55E0;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v38 + 104))(v40 + v39, *MEMORY[0x24BDCF240], v37);
    sub_237EC1754(v40);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v41 = v72;
    sub_237EE1E18();
    swift_bridgeObjectRelease();
    sub_237EE1A34();
    sub_237EE19F8();
    sub_237EE1A10();
    sub_237EE1A4C();
    sub_237EE1A64();
    v42 = (uint64_t)v71;
    sub_237EE1E30();
    v43 = v78;
    v32 = v79;
    v44 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v42, 1, v79) == 1;
    v45 = v23;
    v33 = v43;
    v46 = v12;
    if (v44)
    {
      v47 = v41;
      v63 = v46;
      v64 = v45;
      v65 = v36;
      sub_237E2209C(v42, &qword_25689C140);
      if (qword_2542C6458 != -1)
        swift_once();
      v48 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      v49 = v66;
      sub_237E2CAA0(v48, v66);
      v51 = v69;
      v50 = v70;
      v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v49, 1, v70);
      v53 = v67;
      v54 = v68;
      if (v52 == 1)
      {
        sub_237E6072C(v68);
        sub_237E2209C(v49, &qword_2542C6548);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v68, v49, v50);
      }
      (*(void (**)(char *, uint8_t *, uint64_t))(v33 + 16))(v53, v47, v32);
      v55 = v53;
      v56 = sub_237EE1F98();
      v57 = sub_237EE2D90();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        v59 = swift_slowAlloc();
        v82 = v59;
        *(_DWORD *)v58 = 136446210;
        v72 = v58 + 4;
        sub_237EDA900();
        v60 = sub_237EE3180();
        v81 = sub_237E2A660(v60, v61, &v82);
        sub_237EE2EE0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v55, v32);
        _os_log_impl(&dword_237E17000, v56, v57, "[%{public}s] Cannot get new years day", v58, 0xCu);
        v30 = 1;
        swift_arrayDestroy();
        MEMORY[0x23B8272A8](v59, -1, -1);
        MEMORY[0x23B8272A8](v58, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
        (*(void (**)(char *, uint64_t))(v75 + 8))(v63, v76);
        (*(void (**)(char *, uint64_t))(v73 + 8))(v77, v74);
        (*(void (**)(char *, uint64_t))(v64 + 8))(v34, v65);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v33 + 8))(v55, v32);
        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v54, v50);
        (*(void (**)(char *, uint64_t))(v75 + 8))(v63, v76);
        (*(void (**)(char *, uint64_t))(v73 + 8))(v77, v74);
        (*(void (**)(char *, uint64_t))(v64 + 8))(v34, v65);
        v30 = 1;
      }
      v31 = v80;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v75 + 8))(v12, v76);
      (*(void (**)(char *, uint64_t))(v73 + 8))(v35, v74);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v34, v36);
      v31 = v80;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v80, v42, v32);
      v30 = 0;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v31, v30, 1, v32);
}

int32x2_t sub_237EDA788(uint64_t a1, uint64_t a2, int32x2_t result)
{
  uint64_t v3;
  float64x2_t *v5;
  float64x2_t *v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3 == *(_QWORD *)(a2 + 16) && v3 && a1 != a2)
  {
    result = *(int32x2_t *)(a1 + 40);
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32) && *(double *)&result == *(double *)(a2 + 40))
    {
      v5 = (float64x2_t *)(a1 + 48);
      v6 = (float64x2_t *)(a2 + 48);
      v7 = v3 - 1;
      do
      {
        if (!v7)
          break;
        v8 = *v5++;
        v9 = v8;
        v10 = *v6++;
        result = vmovn_s64(vceqq_f64(v9, v10));
        --v7;
      }
      while ((result.i32[0] & result.i32[1] & 1) != 0);
    }
  }
  return result;
}

uint64_t sub_237EDA808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    goto LABEL_7;
  if (!v2 || a1 == a2)
    goto LABEL_6;
  swift_retain();
  swift_retain();
  v5 = sub_237EE26D0();
  swift_release();
  swift_release();
  if ((v5 & 1) == 0)
  {
LABEL_7:
    v6 = 0;
    return v6 & 1;
  }
  if (v2 == 1)
  {
LABEL_6:
    v6 = 1;
    return v6 & 1;
  }
  v8 = v2 - 2;
  v9 = a1 + 40;
  v10 = a2 + 40;
  do
  {
    v9 += 8;
    v10 += 8;
    swift_retain();
    swift_retain();
    v6 = sub_237EE26D0();
    swift_release();
    swift_release();
    v12 = v8-- != 0;
  }
  while ((v6 & 1) != 0 && v12);
  return v6 & 1;
}

unint64_t sub_237EDA900()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256899610;
  if (!qword_256899610)
  {
    v1 = sub_237EE1D70();
    result = MEMORY[0x23B8271D0](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_256899610);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SolarTerminatorPath.PreferredRenderingMethod(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SolarTerminatorPath.PreferredRenderingMethod(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_237EDA998(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_237EDA9B4(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SolarTerminatorPath.PreferredRenderingMethod()
{
  return &type metadata for SolarTerminatorPath.PreferredRenderingMethod;
}

uint64_t sub_237EDA9E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_237EE2C64();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_237EE2C58();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_237E2209C(a1, &qword_256897E20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_237EE2C28();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_237EDAB30(uint64_t a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t inited;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  __int128 v40;
  objc_super v41;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v5[OBJC_IVAR____TtC11ClockPoster35AnalogClockFaceDateComplicationView_dateTextProvider] = 0;
  v14 = (objc_class *)type metadata accessor for AnalogClockFaceDateComplicationView();
  v41.receiver = v5;
  v41.super_class = v14;
  v15 = objc_msgSendSuper2(&v41, sel_initWithFrame_options_, a1, a2, a3, a4, a5);
  if (v15)
  {
    v16 = (void *)*MEMORY[0x24BEBE210];
    v17 = (void *)objc_opt_self();
    v18 = v15;
    v19 = v16;
    v20 = objc_msgSend(v17, sel_preferredFontDescriptorWithTextStyle_, v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256898480);
    inited = swift_initStackObject();
    v40 = xmmword_237EE55E0;
    *(_OWORD *)(inited + 16) = xmmword_237EE55E0;
    v22 = (void *)*MEMORY[0x24BEBB590];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB590];
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689C408);
    v23 = swift_initStackObject();
    *(_OWORD *)(v23 + 16) = v40;
    v24 = (void *)*MEMORY[0x24BEBB620];
    *(_QWORD *)(v23 + 32) = *MEMORY[0x24BEBB620];
    *(_QWORD *)(v23 + 40) = *MEMORY[0x24BEBB600];
    v25 = v20;
    v26 = v22;
    v27 = v24;
    v28 = sub_237EAB5E0(v23);
    *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C410);
    *(_QWORD *)(inited + 40) = v28;
    sub_237EAB168(inited);
    type metadata accessor for AttributeName(0);
    sub_237E20E98((unint64_t *)&qword_256898288, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_237EE4F50);
    v29 = (void *)sub_237EE29F4();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v25, sel_fontDescriptorByAddingAttributes_, v29);

    v31 = (void *)objc_opt_self();
    v32 = v18;
    v33 = objc_msgSend(v31, sel_fontWithDescriptor_size_, v30, 22.0);
    objc_msgSend(v32, sel_setFont_, v33);

    objc_msgSend(v32, sel_setUppercase_, 1);
    objc_msgSend(v32, sel_setTextAlignment_, 1);
    v34 = sub_237EE2C64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v13, 1, 1, v34);
    v35 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_237EE2C4C();
    swift_retain();
    v36 = sub_237EE2C40();
    v37 = (_QWORD *)swift_allocObject();
    v38 = MEMORY[0x24BEE6930];
    v37[2] = v36;
    v37[3] = v38;
    v37[4] = v35;
    swift_release();
    sub_237EDA9E4((uint64_t)v13, (uint64_t)&unk_25689DB18, (uint64_t)v37);
    swift_release();

  }
  return v15;
}

uint64_t sub_237EDAECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256898AF0);
  v4[6] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25689C240);
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256898AF8);
  v4[10] = v6;
  v4[11] = *(_QWORD *)(v6 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = sub_237EE2C4C();
  v4[14] = sub_237EE2C40();
  v4[15] = sub_237EE2C28();
  v4[16] = v7;
  return swift_task_switch();
}

uint64_t sub_237EDAFB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_256897B48 != -1)
    swift_once();
  v2 = v0[8];
  v1 = v0[9];
  v3 = v0[7];
  v4 = qword_25689B990;
  v5 = *(_QWORD *)(qword_25689B990 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream);
  swift_retain();
  sub_237E8F7E4(v5, v4, v1);
  sub_237EE2C88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[17] = sub_237EE2C40();
  v6 = (_QWORD *)swift_task_alloc();
  v0[18] = v6;
  *v6 = v0;
  v6[1] = sub_237EDB0E4;
  return sub_237EE2C94();
}

uint64_t sub_237EDB0E4()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_237EDB138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689C140);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
    swift_release();
  }
  else
  {
    v3 = MEMORY[0x23B827344](*(_QWORD *)(v0 + 40) + 16);
    if (v3)
    {
      v4 = (void *)v3;
      v5 = *(_QWORD *)(v0 + 48);
      sub_237EDB3D8();

      sub_237E2209C(v5, &qword_256898AF0);
      *(_QWORD *)(v0 + 136) = sub_237EE2C40();
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v6;
      *v6 = v0;
      v6[1] = sub_237EDB0E4;
      return sub_237EE2C94();
    }
    v8 = *(_QWORD *)(v0 + 48);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
    swift_release();
    sub_237E2209C(v8, &qword_256898AF0);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_237EDB3D8()
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
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id result;
  void *v52;
  char *v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  void *v69;
  id v70;
  id v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
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
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  id v100;
  id aBlock;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;

  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DAF0);
  v79 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v97 = (char *)&v74 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = sub_237EE1A94();
  v94 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v93 = (char *)&v74 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256899A10);
  v91 = *(_QWORD *)(v2 - 8);
  v92 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v90 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_237EE1B54();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v81 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v95 = (char *)&v74 - v6;
  v7 = sub_237EE1CD4();
  v88 = *(_QWORD *)(v7 - 8);
  v89 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_237EE1C44();
  v86 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_237EE1CA4();
  v82 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_237EE1CC8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v74 - v19;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v74 - v22;
  v85 = sub_237EE1D70();
  v84 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v25 = (char *)&v74 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_237EE1B0C();
  v98 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v77 = (char *)&v74 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v99 = (char *)&v74 - v28;
  if (qword_256897B48 != -1)
    swift_once();
  sub_237EA1DE0((uint64_t)v25);
  MEMORY[0x23B825010]();
  sub_237EE1C80();
  sub_237EE1CBC();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v13, v83);
  v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  v29(v17, v14);
  sub_237EE1C38();
  sub_237EE1C20();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v11, v87);
  v29(v20, v14);
  sub_237EE1C14();
  v29(v23, v14);
  sub_237E20E98(&qword_256899A18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE318], MEMORY[0x24BDCE310]);
  v30 = v99;
  v31 = v89;
  sub_237EE1D58();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v9, v31);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v25, v85);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v74 - 2) = v33;
  swift_getKeyPath();
  v34 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v34;
  *(_QWORD *)(v35 + 24) = 0x4063200000000000;
  v36 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  v105 = sub_237E2DF20;
  v106 = v35;
  aBlock = (id)MEMORY[0x24BDAC760];
  v102 = 1107296256;
  v103 = sub_237E7D770;
  v104 = &block_descriptor_16;
  v37 = _Block_copy(&aBlock);
  v38 = v34;
  v39 = objc_msgSend(v36, sel_initWithDynamicProvider_, v37);
  _Block_release(v37);

  swift_release();
  aBlock = v39;
  sub_237EDBECC();
  sub_237EE1AE8();
  v40 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v40);
  *(&v74 - 2) = v41;
  swift_getKeyPath();
  sub_237E4E910();
  v42 = v90;
  sub_237EE1B30();
  swift_release();
  v43 = v93;
  v44 = v94;
  v45 = v96;
  (*(void (**)(char *, _QWORD, uint64_t))(v94 + 104))(v93, *MEMORY[0x24BDCC120], v96);
  v46 = v95;
  v47 = v92;
  sub_237EE1B3C();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v42, v47);
  v48 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v48);
  *(&v74 - 2) = v49;
  swift_getKeyPath();
  v50 = v97;
  sub_237EE1B30();
  swift_release();
  result = objc_msgSend(v100, sel_tintColor);
  if (result)
  {
    v52 = result;
    v53 = v30;
    v54 = swift_allocObject();
    *(_QWORD *)(v54 + 16) = v52;
    *(_QWORD *)(v54 + 24) = 0x4069800000000000;
    v55 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
    v105 = sub_237E2DF74;
    v106 = v54;
    v56 = (void *)MEMORY[0x24BDAC760];
    aBlock = (id)MEMORY[0x24BDAC760];
    v102 = 1107296256;
    v103 = sub_237E7D770;
    v104 = &block_descriptor_23;
    v57 = _Block_copy(&aBlock);
    v58 = v52;
    v59 = objc_msgSend(v55, sel_initWithDynamicProvider_, v57);
    _Block_release(v57);

    swift_release();
    aBlock = v59;
    v60 = v81;
    v61 = v80;
    sub_237EE1B3C();

    (*(void (**)(char *, uint64_t))(v79 + 8))(v50, v61);
    sub_237EE1AF4();
    sub_237EDC190();
    v62 = v78;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v77, v53, v78);
    v63 = (void *)sub_237EE2E38();
    v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1688]), sel_initWithAttributedString_, v63);
    v65 = objc_msgSend(v63, sel_length);
    v66 = swift_allocObject();
    *(_QWORD *)(v66 + 16) = v64;
    *(_QWORD *)(v66 + 24) = v63;
    v67 = swift_allocObject();
    *(_QWORD *)(v67 + 16) = sub_237EDC1F8;
    *(_QWORD *)(v67 + 24) = v66;
    v105 = sub_237ECFB10;
    v106 = v67;
    aBlock = v56;
    v102 = 1107296256;
    v103 = sub_237EDC0B8;
    v104 = &block_descriptor_32_0;
    v68 = v46;
    v69 = _Block_copy(&aBlock);
    v70 = v64;
    v71 = v63;
    swift_retain();
    swift_release();
    objc_msgSend(v70, sel_enumerateAttributesInRange_options_usingBlock_, 0, v65, 0, v69);
    _Block_release(v69);
    LOBYTE(v65) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = (id)swift_release();
    if ((v65 & 1) == 0)
    {
      objc_msgSend(v100, sel_setAttributedText_, v70);

      v72 = *(void (**)(char *, uint64_t))(v75 + 8);
      v73 = v76;
      v72(v60, v76);
      v72(v68, v73);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v99, v62);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_237EDBDCC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DB08);
  return sub_237EE2A48() & 1;
}

id sub_237EDBE50()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalogClockFaceDateComplicationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnalogClockFaceDateComplicationView()
{
  return objc_opt_self();
}

void sub_237EDBEB0()
{
  sub_237EE1AAC();
  __break(1u);
}

unint64_t sub_237EDBECC()
{
  unint64_t result;

  result = qword_25689DAF8;
  if (!qword_25689DAF8)
  {
    result = MEMORY[0x23B8271D0](MEMORY[0x24BEBBE08], MEMORY[0x24BEBBE18]);
    atomic_store(result, (unint64_t *)&qword_25689DAF8);
  }
  return result;
}

void sub_237EDBF10()
{
  sub_237EDBECC();
  sub_237EE1BCC();
  __break(1u);
}

uint64_t sub_237EDBF34()
{
  return 8;
}

uint64_t sub_237EDBF40()
{
  return swift_release();
}

uint64_t sub_237EDBF48(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_237EDBF58()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DB08);
  return sub_237EE2A24();
}

_QWORD *sub_237EDBF9C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_237EDBFA8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_237EDBFCC(int a1, uint64_t a2, uint64_t a3, int a4, void *a5, id a6)
{
  id v9;
  void *v10;
  id v11;
  id v12;

  v9 = objc_msgSend(a6, sel_string);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, sel_substringWithRange_, a2, a3);

    sub_237EE2A84();
    sub_237EE2AB4();
    swift_bridgeObjectRelease();
    v12 = (id)sub_237EE2A54();
    swift_bridgeObjectRelease();
    objc_msgSend(a5, sel_replaceCharactersInRange_withString_, a2, a3, v12);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_237EDC0B8(uint64_t a1)
{
  void (*v1)(void);

  v1 = *(void (**)(void))(a1 + 32);
  type metadata accessor for Key(0);
  sub_237E20E98((unint64_t *)&qword_256898250, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_237EE4F0C);
  sub_237EE2A00();
  v1();
  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_237EDC17C()
{
  return 8;
}

unint64_t sub_237EDC190()
{
  unint64_t result;

  result = qword_25689DB00;
  if (!qword_25689DB00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25689DB00);
  }
  return result;
}

uint64_t sub_237EDC1CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_237EDC1F8(int a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;

  sub_237EDBFCC(a1, a2, a3, a4, *(void **)(v4 + 16), *(id *)(v4 + 24));
}

uint64_t sub_237EDC200()
{
  return swift_deallocObject();
}

uint64_t sub_237EDC210()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237EDC234()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EDC260(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_237E20844;
  return sub_237EDAECC(a1, v4, v5, v6);
}

uint64_t sub_237EDC2CC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_237EDC330;
  return v6(a1);
}

uint64_t sub_237EDC330()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_237EDC37C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EDC3A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_237E20844;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25689DB20 + dword_25689DB20))(a1, v4);
}

uint64_t sub_237EDC430()
{
  return swift_initClassMetadata2();
}

uint64_t sub_237EDC47C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 104) + 8);
  v2 = *(void (**)(uint64_t, uint64_t))(v1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  swift_unknownObjectRetain();
  v2(v3, v1);
  return swift_unknownObjectRelease();
}

uint64_t sub_237EDC4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  v2 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  swift_unknownObjectRetain();
  LOBYTE(v1) = v2(v3, v1);
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t sub_237EDC534(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  v3 = *v1;
  v4 = *(unsigned __int8 *)(v1[3] + qword_25689DBA8);
  v5 = *(_QWORD *)(v3 + 104);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 32);
  v7 = *(_QWORD *)(v3 + 88);
  swift_unknownObjectRetain();
  v6(a1, v4, v7, v5);
  return swift_unknownObjectRelease();
}

uint64_t sub_237EDC5A4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_237EDC5C8()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

void type metadata accessor for SwiftUIClockFace()
{
  JUMPOUT(0x23B827140);
}

uint64_t type metadata accessor for ClockHostingController()
{
  uint64_t result;

  result = qword_25689DBB8;
  if (!qword_25689DBB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237EDC63C()
{
  return swift_initClassMetadata2();
}

id sub_237EDC684()
{
  return (id)sub_237EDCE44();
}

uint64_t sub_237EDC6A0()
{
  return sub_237EDC4DC() & 1;
}

uint64_t sub_237EDC6C4(uint64_t a1)
{
  return sub_237EDC534(a1);
}

uint64_t (*sub_237EDC6E4(uint64_t a1))(uint64_t a1)
{
  _QWORD *v1;

  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = sub_237EDC4DC() & 1;
  return sub_237EDC720;
}

uint64_t sub_237EDC720(uint64_t a1)
{
  return sub_237EDC534(*(unsigned __int8 *)(a1 + 8));
}

void sub_237EDC744(_BYTE *a1@<X8>)
{
  sub_237E37904(a1);
}

uint64_t sub_237EDC758(uint64_t a1)
{
  MEMORY[0x23B8271D0](&unk_237EEDB90, a1);
  return CustomStringConvertibleViaMirror.description.getter(a1);
}

uint64_t sub_237EDC78C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t (*v6)(uint64_t, uint64_t);
  char v7;

  v1 = *(_QWORD *)(v0 + 16);
  swift_getObjectType();
  v2 = swift_conformsToProtocol2();
  if (v2)
    v3 = v2;
  else
    v3 = 0;
  if (v2)
    v4 = v1;
  else
    v4 = 0;
  if (!v4)
    return 0;
  ObjectType = swift_getObjectType();
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  swift_unknownObjectRetain();
  v7 = v6(ObjectType, v3);
  swift_unknownObjectRelease();
  return v7 & 1;
}

uint64_t sub_237EDC818(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(uint64_t, uint64_t, double, double);

  v5 = *(_QWORD *)(v2 + 16);
  swift_getObjectType();
  result = swift_conformsToProtocol2();
  if (result)
    v7 = result;
  else
    v7 = 0;
  if (result)
    v8 = v5;
  else
    v8 = 0;
  if (v8)
  {
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(uint64_t, uint64_t, double, double))(v7 + 16);
    swift_unknownObjectRetain();
    v10(ObjectType, v7, a1, a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_237EDC8C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 104) + 16);
  v2 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  swift_unknownObjectRetain();
  LOBYTE(v1) = v2(v3, v1);
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t sub_237EDC924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 104) + 16);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_unknownObjectRetain();
  v4(a1, v5, v3);
  return swift_unknownObjectRelease();
}

uint64_t (*sub_237EDC98C(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = sub_237EDC8C8() & 1;
  return sub_237EDC9C4;
}

uint64_t sub_237EDC9C4(uint64_t a1)
{
  return sub_237EDC924(*(unsigned __int8 *)(a1 + 8));
}

void sub_237EDC9E8(_BYTE *a1, uint64_t a2, void *a3)
{
  id v4;

  a1[qword_25689DBA8] = 0;
  a1[qword_25689DBB0] = 0;
  v4 = a3;

  sub_237EE309C();
  __break(1u);
}

void sub_237EDCA68()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  UIView *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;

  v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for ClockHostingController();
  objc_msgSendSuper2(&v16, sel_viewWillLayoutSubviews);
  v2 = qword_25689DBB0;
  if ((*((_BYTE *)v0 + qword_25689DBB0) & 1) == 0)
  {
    v3 = objc_msgSend(v0, sel_view);
    if (v3)
    {
      v4 = v3;
      v5 = (UIView *)objc_msgSend(v3, sel_superview);

      if (!v5)
        return;
      v6 = objc_msgSend(v1, sel_view);
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

        v8 = objc_msgSend(v1, sel_view);
        if (v8)
        {
          v9 = v8;
          -[UIView bounds](v5, sel_bounds);
          objc_msgSend(v9, sel_setFrame_);

          v10 = objc_msgSend(v1, sel_view);
          if (v10)
          {
            v11 = v10;
            UIView.cp_applyFullscreenConstraints(inContainer:)(v5);

            v12 = objc_msgSend(v1, sel_view);
            if (v12)
            {
              v13 = v12;
              objc_msgSend(v12, sel_invalidateIntrinsicContentSize);

              v14 = objc_msgSend(v1, sel_view);
              if (v14)
              {
                v15 = v14;
                objc_msgSend(v14, sel_setNeedsUpdateConstraints);

                *((_BYTE *)v1 + v2) = 1;
                return;
              }
LABEL_16:
              __break(1u);
              return;
            }
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
}

void sub_237EDCC1C(void *a1)
{
  id v1;

  v1 = a1;
  sub_237EDCA68();

}

void sub_237EDCC50(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for ClockHostingController();
  v4 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a3);
  v4[qword_25689DBA8] = 1;

}

void sub_237EDCCC0(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for ClockHostingController();
  v4 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidDisappear_, a3);
  v4[qword_25689DBA8] = 0;

}

uint64_t sub_237EDCD2C()
{
  return 1;
}

id sub_237EDCD34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClockHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_237EDCD68()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_237EDCD94()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_237EDCDC0()
{
  return type metadata accessor for ClockHostingController();
}

uint64_t sub_237EDCDC8(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B8271D0](&unk_237EEDB68);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237EDCDF4()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_237EDCE18(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x23B8271D0](&unk_237EEDB90);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_237EDCE44()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_237EDCE4C@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v2 = v1;
  v40 = a1;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DD00);
  v42 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DD08);
  MEMORY[0x24BDAC7A8](v4);
  v45 = (uint64_t)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)&v38 - v7;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B2B0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v38 - v18;
  v20 = *(_QWORD *)(v1 + 24);
  v21 = (os_unfair_lock_s *)(*(_QWORD *)(v20 + *(_QWORD *)(*(_QWORD *)v20 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v21);
  v22 = *(_QWORD *)(*(_QWORD *)v20 + 120);
  v23 = *(_BYTE *)(v20 + v22);
  if ((v23 & 1) == 0)
    *(_BYTE *)(v20 + v22) = 1;
  os_unfair_lock_unlock(v21);
  swift_endAccess();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B250);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v19, 1, 1, v24);
  if ((v23 & 1) == 0)
  {
    v26 = sub_237EE2C64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v13, 1, 1, v26);
    v27 = swift_allocObject();
    swift_weakInit();
    v28 = (_QWORD *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v27;
    sub_237ECBB58((uint64_t)v13, (uint64_t)&unk_25689DD18, (uint64_t)v28);
    swift_release();
    v29 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v16, 1, 1, v29);
    v25(v16, 0, 1, v24);
    sub_237E9F9C4((uint64_t)v16, (uint64_t)v19, &qword_25689B2B0);
  }
  v46 = v2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B2B8);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v32(v10, 1, 1, v30);
  swift_beginAccess();
  os_unfair_lock_lock(v21);
  v33 = swift_endAccess();
  v34 = MEMORY[0x24BDAC7A8](v33);
  *(&v38 - 2) = v20;
  *(&v38 - 1) = (uint64_t)v19;
  v39 = v19;
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v42 + 104))(v43, *MEMORY[0x24BEE6A10], v44, v34);
  v35 = (uint64_t)v41;
  sub_237EE2CA0();
  v32((char *)v35, 0, 1, v30);
  sub_237E9F9C4(v35, (uint64_t)v10, &qword_25689DD08);
  swift_beginAccess();
  os_unfair_lock_unlock(v21);
  swift_endAccess();
  v36 = v45;
  sub_237E22004((uint64_t)v10, v45, &qword_25689DD08);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v36, 1, v30) == 1)
  {
    result = swift_release();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v40, v36, v30);
    sub_237E2209C((uint64_t)v10, &qword_25689DD08);
    sub_237E2209C((uint64_t)v39, &qword_25689B2B0);
    return swift_release();
  }
  return result;
}

uint64_t sub_237EDD2CC()
{
  uint64_t result;

  type metadata accessor for WeatherDataProvider();
  swift_allocObject();
  result = sub_237EDD304();
  qword_25689E018 = result;
  return result;
}

uint64_t sub_237EDD304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  sub_237EE1F08();
  *(_QWORD *)(v0 + 16) = sub_237EE1EFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DD48);
  v2 = swift_allocObject();
  v3 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 96);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689B250);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 104);
  type metadata accessor for CPUnfairLock();
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v2 + v5) = v6;
  *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 112)) = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 120)) = 0;
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = 0;
  return v1;
}

uint64_t sub_237EDD3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[15] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256897E20);
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689B250);
  v4[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DD20);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568995B8);
  v4[20] = swift_task_alloc();
  v5 = type metadata accessor for CurrentLocationResult(0);
  v4[21] = v5;
  v4[22] = *(_QWORD *)(v5 - 8);
  v4[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA20);
  v4[24] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995C0);
  v4[25] = v6;
  v4[26] = *(_QWORD *)(v6 - 8);
  v4[27] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995C8);
  v4[28] = v7;
  v4[29] = *(_QWORD *)(v7 - 8);
  v4[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237EDD554()
{
  uint64_t v0;

  if (qword_256897B68 != -1)
    swift_once();
  *(_QWORD *)(v0 + 248) = qword_25689DFF8;
  return swift_task_switch();
}

uint64_t sub_237EDD5B8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = sub_237ED185C(1);
  sub_237ED2508(v1);

  return swift_task_switch();
}

uint64_t sub_237EDD60C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[26];
  v1 = v0[27];
  v3 = v0[25];
  sub_237EE2C88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[32] = 0;
  v4 = (_QWORD *)swift_task_alloc();
  v0[33] = v4;
  *v4 = v0;
  v4[1] = sub_237EDD6C4;
  return sub_237EE2C94();
}

uint64_t sub_237EDD6C4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_237EDD718()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v11;
  uint64_t v12;
  int v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_unfair_lock_s *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;

  v1 = v0[24];
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v0[22] + 48))(v1, 1, v0[21]) == 1)
    goto LABEL_8;
  sub_237EDF308(v1, v0[23]);
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_237E21F00(v0[23], type metadata accessor for CurrentLocationResult);
LABEL_8:
    (*(void (**)(_QWORD, _QWORD))(v0[29] + 8))(v0[30], v0[28]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  v3 = Strong;
  if (*(_QWORD *)(Strong + 32))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25689DA00);
    sub_237EE2CAC();
    swift_release();
  }
  v4 = v0[32];
  sub_237EE2CC4();
  if (v4)
  {
    v5 = v0[29];
    v6 = v0[30];
    v7 = v0[28];
    v8 = v0[23];
    swift_release();
    sub_237E21F00(v8, type metadata accessor for CurrentLocationResult);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  v11 = v0[20];
  sub_237E22004(v0[23], v11, &qword_2568995B8);
  v12 = type metadata accessor for CurrentLocation(0);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v11, 1, v12);
  v14 = (id *)v0[20];
  if (v13 == 1)
  {
    v16 = v0[18];
    v15 = v0[19];
    sub_237E2209C(v0[20], &qword_2568995B8);
    v17 = sub_237EE1ED8();
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v15, 1, 1, v17);
    v19 = *(_QWORD *)(v3 + 24);
    sub_237E22004(v15, v16, &qword_25689DD20);
    v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
    v22 = v0[17];
    v21 = v0[18];
    if (v20 == 1)
    {
      sub_237E2209C(v21, &qword_25689DD20);
      v23 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
    }
    else
    {
      sub_237EE1ECC();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
      v34 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v22, 0, 1, v34);
    }
    v35 = v0[23];
    v36 = v0[19];
    v37 = v0[17];
    v38 = (os_unfair_lock_s *)(*(_QWORD *)(v19 + *(_QWORD *)(*(_QWORD *)v19 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v38);
    swift_endAccess();
    sub_237E95010(v37);
    swift_beginAccess();
    os_unfair_lock_unlock(v38);
    swift_endAccess();
    sub_237E2209C(v37, &qword_25689B250);
    sub_237E2209C(v36, &qword_25689DD20);
    sub_237E21F00(v35, type metadata accessor for CurrentLocationResult);
  }
  else
  {
    v24 = v0[16];
    v25 = *v14;
    sub_237E21F00((uint64_t)v14, type metadata accessor for CurrentLocation);
    v26 = sub_237EE2C64();
    v27 = *(_QWORD *)(v26 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v24, 1, 1, v26);
    v28 = swift_allocObject();
    swift_weakInit();
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v28;
    v29[5] = v25;
    v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v24, 1, v26);
    v31 = v0[16];
    if (v30 == 1)
    {
      sub_237E2209C(v0[16], &qword_256897E20);
      v32 = 0;
      v33 = 0;
    }
    else
    {
      sub_237EE2C58();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v31, v26);
      if (v29[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v32 = sub_237EE2C28();
        v33 = v39;
        swift_unknownObjectRelease();
      }
      else
      {
        v32 = 0;
        v33 = 0;
      }
    }
    if (v33 | v32)
    {
      v0[2] = 0;
      v0[3] = 0;
      v0[4] = v32;
      v0[5] = v33;
    }
    v40 = v0[23];
    v41 = swift_task_create();
    sub_237E21F00(v40, type metadata accessor for CurrentLocationResult);
    *(_QWORD *)(v3 + 32) = v41;
    swift_release();
  }
  swift_release();
  v0[32] = 0;
  v42 = (_QWORD *)swift_task_alloc();
  v0[33] = v42;
  *v42 = v0;
  v42[1] = sub_237EDD6C4;
  return sub_237EE2C94();
}

uint64_t sub_237EDDD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[26] = a4;
  v5[27] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542C6548);
  v5[28] = swift_task_alloc();
  v6 = sub_237EE1FB0();
  v5[29] = v6;
  v5[30] = *(_QWORD *)(v6 - 8);
  v5[31] = swift_task_alloc();
  v7 = sub_237EE3024();
  v5[32] = v7;
  v5[33] = *(_QWORD *)(v7 - 8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v8 = sub_237EE303C();
  v5[36] = v8;
  v5[37] = *(_QWORD *)(v8 - 8);
  v5[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689B250);
  v5[39] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25689DD38);
  v5[40] = v9;
  v5[41] = *(_QWORD *)(v9 - 8);
  v5[42] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25689DD20);
  v5[43] = swift_task_alloc();
  v5[44] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237EDDE6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t Strong;
  _QWORD *v6;
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
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  _QWORD *v25;

  swift_beginAccess();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 352);
  v2 = sub_237EE1ED8();
  *(_QWORD *)(v0 + 360) = v2;
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v0 + 368) = v3;
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  *(_QWORD *)(v0 + 376) = v4;
  v4(v1, 1, 1, v2);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_QWORD *)(v0 + 384) = *(_QWORD *)(Strong + 16);
    swift_retain();
    swift_release();
    sub_237EE1EE4();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v6;
    *v6 = v0;
    v6[1] = sub_237EDE2B0;
    return sub_237EE1EF0();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 352);
    v9 = *(_QWORD *)(v0 + 344);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0 + 376))(v9, 1, 1, *(_QWORD *)(v0 + 360));
    sub_237E9F9C4(v9, v8, &qword_25689DD20);
    sub_237EE2CC4();
    v10 = swift_weakLoadStrong();
    if (v10)
    {
      v11 = *(_QWORD *)(v0 + 360);
      v12 = *(_QWORD *)(v0 + 368);
      v13 = *(_QWORD *)(v0 + 352);
      v14 = *(_QWORD *)(v10 + 24);
      swift_retain();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11))
      {
        v15 = *(_QWORD *)(v0 + 312);
        v16 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
      }
      else
      {
        v17 = *(_QWORD *)(v0 + 312);
        sub_237EE1ECC();
        v18 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
      }
      v19 = *(_QWORD *)(v0 + 312);
      v20 = (os_unfair_lock_s *)(*(_QWORD *)(v14 + *(_QWORD *)(*(_QWORD *)v14 + 104)) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v20);
      swift_endAccess();
      sub_237E95010(v19);
      swift_beginAccess();
      os_unfair_lock_unlock(v20);
      swift_endAccess();
      swift_release();
      sub_237E2209C(v19, &qword_25689B250);
    }
    v22 = *(_QWORD *)(v0 + 264);
    v21 = *(_QWORD *)(v0 + 272);
    v23 = *(_QWORD *)(v0 + 256);
    sub_237EE3030();
    *(_OWORD *)(v0 + 184) = xmmword_237EEDC10;
    *(_QWORD *)(v0 + 168) = 0;
    *(_QWORD *)(v0 + 160) = 0;
    *(_BYTE *)(v0 + 176) = 1;
    sub_237E2CF28(&qword_25689C148, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_237EE31EC();
    sub_237E2CF28(&qword_25689DD40, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_237EE3048();
    v24 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    *(_QWORD *)(v0 + 408) = v24;
    v24(v21, v23);
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v25;
    *v25 = v0;
    v25[1] = sub_237EDE678;
    return sub_237EE31F8();
  }
}

uint64_t sub_237EDE2B0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[41] + 8))(v2[42], v2[40]);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_237EDE338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;

  v1 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 344);
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v0 + 376))(v3, 0, 1, *(_QWORD *)(v0 + 360));
  sub_237E9F9C4(v3, v2, &qword_25689DD20);
  sub_237EE2CC4();
  if (v1)
  {
    sub_237E2209C(*(_QWORD *)(v0 + 352), &qword_25689DD20);
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
  else
  {
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v6 = *(_QWORD *)(v0 + 360);
      v7 = *(_QWORD *)(v0 + 368);
      v8 = *(_QWORD *)(v0 + 352);
      v9 = *(_QWORD *)(Strong + 24);
      swift_retain();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6))
      {
        v10 = *(_QWORD *)(v0 + 312);
        v11 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
      }
      else
      {
        v12 = *(_QWORD *)(v0 + 312);
        sub_237EE1ECC();
        v13 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 0, 1, v13);
      }
      v14 = *(_QWORD *)(v0 + 312);
      v15 = (os_unfair_lock_s *)(*(_QWORD *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 104)) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v15);
      swift_endAccess();
      sub_237E95010(v14);
      swift_beginAccess();
      os_unfair_lock_unlock(v15);
      swift_endAccess();
      swift_release();
      sub_237E2209C(v14, &qword_25689B250);
    }
    v17 = *(_QWORD *)(v0 + 264);
    v16 = *(_QWORD *)(v0 + 272);
    v18 = *(_QWORD *)(v0 + 256);
    sub_237EE3030();
    *(_OWORD *)(v0 + 184) = xmmword_237EEDC10;
    *(_QWORD *)(v0 + 168) = 0;
    *(_QWORD *)(v0 + 160) = 0;
    *(_BYTE *)(v0 + 176) = 1;
    sub_237E2CF28(&qword_25689C148, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_237EE31EC();
    sub_237E2CF28(&qword_25689DD40, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_237EE3048();
    v19 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    *(_QWORD *)(v0 + 408) = v19;
    v19(v16, v18);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v20;
    *v20 = v0;
    v20[1] = sub_237EDE678;
    return sub_237EE31F8();
  }
}

uint64_t sub_237EDE678()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 424) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 408))(*(_QWORD *)(v2 + 280), *(_QWORD *)(v2 + 256));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 296);
    v3 = *(_QWORD *)(v2 + 304);
    v5 = *(_QWORD *)(v2 + 288);
    (*(void (**)(_QWORD, _QWORD))(v2 + 408))(*(_QWORD *)(v2 + 280), *(_QWORD *)(v2 + 256));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_237EDE718()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t Strong;
  _QWORD *v9;
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
  os_unfair_lock_s *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  _QWORD *v27;

  sub_237E2209C(*(_QWORD *)(v0 + 352), &qword_25689DD20);
  if ((sub_237EE2CB8() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  v3 = *(_QWORD *)(v0 + 424);
  v4 = *(_QWORD *)(v0 + 352);
  v5 = sub_237EE1ED8();
  *(_QWORD *)(v0 + 360) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v0 + 368) = v6;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  *(_QWORD *)(v0 + 376) = v7;
  v7(v4, 1, 1, v5);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_QWORD *)(v0 + 384) = *(_QWORD *)(Strong + 16);
    swift_retain();
    swift_release();
    sub_237EE1EE4();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v9;
    *v9 = v0;
    v9[1] = sub_237EDE2B0;
    return sub_237EE1EF0();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 352);
    v11 = *(_QWORD *)(v0 + 344);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0 + 376))(v11, 1, 1, *(_QWORD *)(v0 + 360));
    sub_237E9F9C4(v11, v10, &qword_25689DD20);
    sub_237EE2CC4();
    if (v3)
    {
      sub_237E2209C(*(_QWORD *)(v0 + 352), &qword_25689DD20);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v1 = *(uint64_t (**)(void))(v0 + 8);
      return v1();
    }
    v12 = swift_weakLoadStrong();
    if (v12)
    {
      v13 = *(_QWORD *)(v0 + 360);
      v14 = *(_QWORD *)(v0 + 368);
      v15 = *(_QWORD *)(v0 + 352);
      v16 = *(_QWORD *)(v12 + 24);
      swift_retain();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13))
      {
        v17 = *(_QWORD *)(v0 + 312);
        v18 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
      }
      else
      {
        v19 = *(_QWORD *)(v0 + 312);
        sub_237EE1ECC();
        v20 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 0, 1, v20);
      }
      v21 = *(_QWORD *)(v0 + 312);
      v22 = (os_unfair_lock_s *)(*(_QWORD *)(v16 + *(_QWORD *)(*(_QWORD *)v16 + 104)) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v22);
      swift_endAccess();
      sub_237E95010(v21);
      swift_beginAccess();
      os_unfair_lock_unlock(v22);
      swift_endAccess();
      swift_release();
      sub_237E2209C(v21, &qword_25689B250);
    }
    v24 = *(_QWORD *)(v0 + 264);
    v23 = *(_QWORD *)(v0 + 272);
    v25 = *(_QWORD *)(v0 + 256);
    sub_237EE3030();
    *(_OWORD *)(v0 + 184) = xmmword_237EEDC10;
    *(_QWORD *)(v0 + 168) = 0;
    *(_QWORD *)(v0 + 160) = 0;
    *(_BYTE *)(v0 + 176) = 1;
    sub_237E2CF28(&qword_25689C148, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_237EE31EC();
    sub_237E2CF28(&qword_25689DD40, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_237EE3048();
    v26 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    *(_QWORD *)(v0 + 408) = v26;
    v26(v23, v25);
    v27 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v27;
    *v27 = v0;
    v27[1] = sub_237EDE678;
    return sub_237EE31F8();
  }
}

uint64_t sub_237EDEBA8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
  sub_237E2209C(*(_QWORD *)(v0 + 352), &qword_25689DD20);
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

uint64_t sub_237EDEC7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t Strong;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  _QWORD *v35;
  uint64_t v37;
  uint64_t v38;

  if (qword_2542C6458 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = qword_2542C64F8 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
  swift_beginAccess();
  sub_237E22004(v4, v3, &qword_2542C6548);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v5 = *(_QWORD *)(v0 + 224);
    sub_237E6072C(*(_QWORD *)(v0 + 248));
    sub_237E2209C(v5, &qword_2542C6548);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 32))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 232));
  }
  v6 = *(void **)(v0 + 400);
  v7 = v6;
  v8 = v6;
  v9 = sub_237EE1F98();
  v10 = sub_237EE2D90();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(void **)(v0 + 400);
  v14 = *(_QWORD *)(v0 + 240);
  v13 = *(_QWORD *)(v0 + 248);
  v15 = *(_QWORD *)(v0 + 232);
  if (v11)
  {
    v37 = *(_QWORD *)(v0 + 248);
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v38 = v17;
    *(_DWORD *)v16 = 136446210;
    swift_getErrorValue();
    v18 = sub_237EE3210();
    *(_QWORD *)(v16 + 4) = sub_237E2A660(v18, v19, &v38);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_237E17000, v9, v10, "Cannot get weather, error: '%{public}s'", (uint8_t *)v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B8272A8](v17, -1, -1);
    MEMORY[0x23B8272A8](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v37, v15);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  sub_237EE2CC4();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v21 = *(_QWORD *)(v0 + 360);
    v22 = *(_QWORD *)(v0 + 368);
    v23 = *(_QWORD *)(v0 + 352);
    v24 = *(_QWORD *)(Strong + 24);
    swift_retain();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v23, 1, v21))
    {
      v25 = *(_QWORD *)(v0 + 312);
      v26 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
    }
    else
    {
      v27 = *(_QWORD *)(v0 + 312);
      sub_237EE1ECC();
      v28 = __swift_instantiateConcreteTypeFromMangledName(qword_25689AD70);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 0, 1, v28);
    }
    v29 = *(_QWORD *)(v0 + 312);
    v30 = (os_unfair_lock_s *)(*(_QWORD *)(v24 + *(_QWORD *)(*(_QWORD *)v24 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v30);
    swift_endAccess();
    sub_237E95010(v29);
    swift_beginAccess();
    os_unfair_lock_unlock(v30);
    swift_endAccess();
    swift_release();
    sub_237E2209C(v29, &qword_25689B250);
  }
  v32 = *(_QWORD *)(v0 + 264);
  v31 = *(_QWORD *)(v0 + 272);
  v33 = *(_QWORD *)(v0 + 256);
  sub_237EE3030();
  *(_OWORD *)(v0 + 184) = xmmword_237EEDC10;
  *(_QWORD *)(v0 + 168) = 0;
  *(_QWORD *)(v0 + 160) = 0;
  *(_BYTE *)(v0 + 176) = 1;
  sub_237E2CF28(&qword_25689C148, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_237EE31EC();
  sub_237E2CF28(&qword_25689DD40, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_237EE3048();
  v34 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  *(_QWORD *)(v0 + 408) = v34;
  v34(v31, v33);
  v35 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 416) = v35;
  *v35 = v0;
  v35[1] = sub_237EDE678;
  return sub_237EE31F8();
}

uint64_t sub_237EDF1B4()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeatherDataProvider()
{
  return objc_opt_self();
}

uint64_t sub_237EDF208(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_237E2CF28(&qword_25689DCF8, a2, (uint64_t (*)(uint64_t))type metadata accessor for WeatherDataProvider, (uint64_t)&unk_237EEDC64);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_237EDF244(uint64_t a1)
{
  uint64_t v1;

  return sub_237E9276C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_237EDF24C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237EDF270()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_237EDF29C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_237E20844;
  return sub_237EDD3D8(a1, v4, v5, v6);
}

uint64_t sub_237EDF308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CurrentLocationResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237EDF34C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_237EDF380(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_237E487A8;
  return sub_237EDDD04(a1, v4, v5, v7, v6);
}

uint64_t destroy for WorldMap()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorldMap(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorldMap(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v4 = *(_OWORD *)(a2 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v4;
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  return a1;
}

uint64_t assignWithTake for WorldMap(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldMap(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 152))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldMap(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
      *(_BYTE *)(result + 152) = 1;
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
    *(_BYTE *)(result + 152) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldMap()
{
  return &type metadata for WorldMap;
}

uint64_t sub_237EDF698(char a1)
{
  uint64_t v1;
  _BYTE v3[40];
  __int128 v4;

  if ((a1 & 1) != 0)
  {
    sub_237EDFDF8(v1 + 80, (uint64_t)v3);
    sub_237EDFDF8((uint64_t)v3, (uint64_t)&v4);
  }
  if (qword_256897B88 != -1)
    swift_once();
  return UIPointRoundToScale();
}

uint64_t sub_237EDF798@<X0>(_QWORD *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  double *v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v11 = a2 + a7;
  v12 = a3 + a6;
  v13 = a4 - (a7 + a9);
  v14 = a5 - (a6 + a8);
  v15 = v9[5] - (v9[16] + v9[18]);
  v16 = v9[6] - (v9[15] + v9[17]);
  if (v14 / v16 >= v13 / v15)
    v17 = v13 / v15;
  else
    v17 = v14 / v16;
  if (fabs(v17 + -1.0) <= 0.05)
  {
    v18 = 4;
  }
  else
  {
    v24.origin.x = a2 + a7;
    v24.origin.y = a3 + a6;
    v24.size.width = a4 - (a7 + a9);
    v24.size.height = a5 - (a6 + a8);
    v25.origin.x = v11 + (CGRectGetWidth(v24) - v15 * v17) * 0.5;
    v25.origin.y = v12;
    v25.size.width = v13;
    v25.size.height = v14;
    CGRectGetHeight(v25);
    v18 = 1;
  }
  result = UIRectIntegralWithScale();
  *a1 = v20;
  a1[1] = v21;
  a1[2] = v22;
  a1[3] = v23;
  a1[4] = v18;
  return result;
}

uint64_t sub_237EDF8DC()
{
  double *v0;

  return sub_237E27D78(*v0, v0[1], v0[2], v0[3]);
}

double sub_237EDF8E8()
{
  double result;

  *(_QWORD *)&xmmword_25689E020 = 0x6946646574746F44;
  *((_QWORD *)&xmmword_25689E020 + 1) = 0xEA00000000006C6CLL;
  qword_25689E030 = 0xD000000000000016;
  unk_25689E038 = 0x8000000237EF0D70;
  xmmword_25689E040 = xmmword_237EEDCB0;
  qword_25689E050 = 0x4077100000000000;
  unk_25689E058 = 0;
  *(_QWORD *)&xmmword_25689E060 = 0;
  *((_QWORD *)&xmmword_25689E060 + 1) = 0x4000000000000000;
  xmmword_25689E070 = xmmword_237EEDCC0;
  xmmword_25689E080 = xmmword_237EEDCD0;
  byte_25689E090 = 0;
  *(_OWORD *)&algn_25689E091[7] = xmmword_237EEDCE0;
  result = 61.666;
  *(__int128 *)((char *)&xmmword_25689E0A0 + 8) = xmmword_237EEDCF0;
  return result;
}

void sub_237EDF988()
{
  id v0;
  uint64_t v1;
  uint64_t v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v0, sel_scale);
  v2 = v1;

  qword_25689DD50 = v2;
}

BOOL sub_237EDF9E8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[9];
  uint64_t v12;
  _OWORD v13[9];
  uint64_t v14;

  v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v11[8] = *(_OWORD *)(a1 + 128);
  v12 = *(_QWORD *)(a1 + 144);
  v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  v14 = *(_QWORD *)(a2 + 144);
  v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_237EDFC70((uint64_t)v11, (uint64_t)v13);
}

uint64_t sub_237EDFA78()
{
  sub_237EE3264();
  swift_bridgeObjectRetain();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  return sub_237EE3294();
}

uint64_t sub_237EDFAD0()
{
  swift_bridgeObjectRetain();
  sub_237EE2ACC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237EDFB14()
{
  sub_237EE3264();
  swift_bridgeObjectRetain();
  sub_237EE2ACC();
  swift_bridgeObjectRelease();
  return sub_237EE3294();
}

uint64_t sub_237EDFB68()
{
  return sub_237E27F7C();
}

unint64_t sub_237EDFBC0(uint64_t a1)
{
  unint64_t result;

  result = sub_237EDFBE4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237EDFBE4()
{
  unint64_t result;

  result = qword_25689DD58;
  if (!qword_25689DD58)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEDD28, &type metadata for WorldMap);
    atomic_store(result, (unint64_t *)&qword_25689DD58);
  }
  return result;
}

unint64_t sub_237EDFC2C()
{
  unint64_t result;

  result = qword_25689DD60;
  if (!qword_25689DD60)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEDDAC, &type metadata for WorldMap);
    atomic_store(result, (unint64_t *)&qword_25689DD60);
  }
  return result;
}

BOOL sub_237EDFC70(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  _BOOL8 result;
  BOOL v7;
  char v8;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_237EE31BC(), result = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = sub_237EE31BC(), result = 0, (v8 & 1) != 0))
    {
      if (*(double *)(a1 + 32) != *(double *)(a2 + 32)
        || *(double *)(a1 + 40) != *(double *)(a2 + 40)
        || *(double *)(a1 + 48) != *(double *)(a2 + 48)
        || *(double *)(a1 + 56) != *(double *)(a2 + 56)
        || *(double *)(a1 + 64) != *(double *)(a2 + 64)
        || *(double *)(a1 + 72) != *(double *)(a2 + 72))
      {
        return 0;
      }
      if ((*(_BYTE *)(a1 + 112) & 1) != 0)
      {
        if (!*(_BYTE *)(a2 + 112))
          return 0;
        return *(double *)(a1 + 120) == *(double *)(a2 + 120)
            && *(double *)(a1 + 128) == *(double *)(a2 + 128)
            && *(double *)(a1 + 136) == *(double *)(a2 + 136)
            && *(double *)(a1 + 144) == *(double *)(a2 + 144);
      }
      result = 0;
      if ((*(_BYTE *)(a2 + 112) & 1) == 0
        && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *(float64x2_t *)(a2 + 80)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a2 + 96)))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) == 0)
      {
        return *(double *)(a1 + 120) == *(double *)(a2 + 120)
            && *(double *)(a1 + 128) == *(double *)(a2 + 128)
            && *(double *)(a1 + 136) == *(double *)(a2 + 136)
            && *(double *)(a1 + 144) == *(double *)(a2 + 144);
      }
    }
  }
  return result;
}

uint64_t sub_237EDFDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568995D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for WorldMap.DotFillSpec()
{
  return &type metadata for WorldMap.DotFillSpec;
}

unint64_t sub_237EDFE50(uint64_t a1)
{
  unint64_t result;

  result = sub_237EDFE74();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_237EDFE74()
{
  unint64_t result;

  result = qword_25689DD68;
  if (!qword_25689DD68)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEDDE0, &type metadata for WorldMap.DotFillSpec);
    atomic_store(result, (unint64_t *)&qword_25689DD68);
  }
  return result;
}

void sub_237EE0048()
{
  char *v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v1 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon])
  {
    swift_bridgeObjectRetain();
    v2 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE240]);
    v3 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v2);

    v4 = v3;
    v5 = (void *)sub_237EE2A54();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v5, v4);

    v7 = *(void **)&v0[v1];
    if (v7)
    {
      objc_msgSend(v7, sel_setImage_, v6);
      v8 = *(void **)&v0[v1];
      if ((v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics + 24] & 1) != 0)
      {
        if (!v8)
        {
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }
        objc_msgSend(v8, sel_setContentMode_, 1);
      }
      else
      {
        if (!v8)
        {
LABEL_17:
          __break(1u);
          return;
        }
        v9 = v8;
        if (objc_msgSend(v0, sel__shouldReverseLayoutDirection))
          v10 = 12;
        else
          v10 = 11;
        objc_msgSend(v9, sel_setContentMode_, v10);

      }
      v11 = *(void **)&v0[v1];
      if (v11)
      {
        v13 = v11;
        v12 = objc_msgSend(v0, sel_tintColor);
        objc_msgSend(v13, sel_setTintColor_, v12);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
}

void sub_237EE0274()
{
  char *v0;
  id v1;
  double v2;
  double v3;
  double *v4;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  double Width;
  void *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v30.receiver = v0;
  v30.super_class = (Class)type metadata accessor for AlarmComplicationView();
  objc_msgSendSuper2(&v30, sel_layoutSubviews);
  sub_237EE0600();
  objc_msgSend(v0, sel_frame);
  CGRectGetHeight(v31);
  v1 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v1, sel_displayScale);

  UIRoundToScale();
  v3 = v2;
  v4 = (double *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics];
  if ((v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics + 24] & 1) == 0)
  {
    v26 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
    if (v26)
    {
      v27 = v26;
      objc_msgSend(v0, sel_frame);
      objc_msgSend(v27, sel_setFrame_, 0.0, 0.0, CGRectGetWidth(v35), v3);

      v28 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel];
      if (v28)
      {
        v22 = v28;
        objc_msgSend(v0, sel_frame);
        objc_msgSend(v22, sel_setFrame_, 0.0, v3, CGRectGetWidth(v36), v3);
LABEL_14:

        return;
      }
      goto LABEL_17;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v5 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel;
  v6 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel];
  if (!v6)
  {
    __break(1u);
    goto LABEL_16;
  }
  v7 = v6;
  objc_msgSend(v0, sel_frame);
  objc_msgSend(v7, sel_sizeThatFits_, v8, v9);
  v11 = v10;

  v12 = v4[2];
  objc_msgSend(v0, sel_frame);
  CGRectGetWidth(v32);
  v13 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v13, sel_displayScale);

  UIRoundToScale();
  v15 = v14;
  objc_msgSend(v0, sel_frame);
  CGRectGetHeight(v33);
  v16 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v16, sel_displayScale);

  UIRoundToScale();
  v18 = v17;
  v19 = objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
  v20 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
  if (v19 == (id)1)
  {
    if (v20)
    {
      objc_msgSend(v20, sel_setFrame_, v11 + v15, v18, v12, v3);
      v21 = *(void **)&v0[v5];
      if (v21)
      {
        v22 = v21;
        objc_msgSend(v0, sel_frame);
        Width = CGRectGetWidth(v34);
        v24 = v22;
        v25 = v15;
LABEL_13:
        objc_msgSend(v24, sel_setFrame_, v25, v18, Width, v3);
        goto LABEL_14;
      }
      goto LABEL_19;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v20)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v20, sel_setFrame_, v15, v18, v12, v3);
  v29 = *(void **)&v0[v5];
  if (v29)
  {
    v22 = v29;
    objc_msgSend(v0, sel_frame);
    Width = CGRectGetWidth(v37);
    v24 = v22;
    v25 = v12 + v15;
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
}

void sub_237EE0600()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_237EE1D70();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel])
  {
    v7 = sub_237EB121C(*(double *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics]);
    v8 = *(void **)&v0[v6];
    *(_QWORD *)&v0[v6] = v7;

    v9 = *(void **)&v0[v6];
    if (v9)
    {
      v10 = v9;
      v11 = (void *)sub_237EE2A54();
      v12 = objc_msgSend((id)objc_opt_self(), sel_textProviderWithText_, v11);

      objc_msgSend(v10, sel_setTextProvider_, v12);
      v13 = *(void **)&v1[v6];
      if (v13)
      {
        v14 = (void *)objc_opt_self();
        v15 = v13;
        v16 = objc_msgSend(v14, sel_whiteColor);
        v17 = swift_allocObject();
        *(_QWORD *)(v17 + 16) = v16;
        v18 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
        aBlock[4] = sub_237E7DAD8;
        aBlock[5] = v17;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_237E7D770;
        aBlock[3] = &block_descriptor_17;
        v19 = _Block_copy(aBlock);
        v20 = v16;
        v21 = objc_msgSend(v18, sel_initWithDynamicProvider_, v19);
        _Block_release(v19);

        swift_release();
        objc_msgSend(v15, sel_setTextColor_, v21);

        v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
        v23 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon;
        v24 = *(void **)&v1[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
        *(_QWORD *)&v1[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon] = v22;

        if (*(_QWORD *)&v1[v23])
        {
          objc_msgSend(v1, sel_addSubview_);
          if (*(_QWORD *)&v1[v6])
          {
            objc_msgSend(v1, sel_addSubview_);
            sub_237EE0048();
            if (!*(_QWORD *)&v1[v6])
              return;
            (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v1[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_fireDate], v2);
            v25 = (void *)sub_237EE1CF8();
            v26 = objc_msgSend((id)objc_opt_self(), sel_textProviderWithDate_, v25);

            (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
            v27 = *(void **)&v1[v6];
            if (v27)
            {
              objc_msgSend(v27, sel_setTextProvider_, v26);

              return;
            }
LABEL_14:
            __break(1u);
            return;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

id sub_237EE0934()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AlarmComplicationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237EE09C8()
{
  return type metadata accessor for AlarmComplicationView();
}

uint64_t type metadata accessor for AlarmComplicationView()
{
  uint64_t result;

  result = qword_25689DDA8;
  if (!qword_25689DDA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237EE0A0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_237EE1D70();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AlarmComplicationView.Metrics(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AlarmComplicationView.Metrics(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 24) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmComplicationView.Metrics()
{
  return &type metadata for AlarmComplicationView.Metrics;
}

uint64_t sub_237EE0B34()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

uint64_t storeEnumTagSinglePayload for AlarmComplicationView.Metrics.IconPosition(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237EE0BBC + 4 * byte_237EEDE55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237EE0BF0 + 4 * byte_237EEDE50[v4]))();
}

uint64_t sub_237EE0BF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237EE0BF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237EE0C00);
  return result;
}

uint64_t sub_237EE0C0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237EE0C14);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237EE0C18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237EE0C20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AlarmComplicationView.Metrics.IconPosition()
{
  return &type metadata for AlarmComplicationView.Metrics.IconPosition;
}

unint64_t sub_237EE0C40()
{
  unint64_t result;

  result = qword_25689DDB8;
  if (!qword_25689DDB8)
  {
    result = MEMORY[0x23B8271D0](&unk_237EEDF28, &type metadata for AlarmComplicationView.Metrics.IconPosition);
    atomic_store(result, (unint64_t *)&qword_25689DDB8);
  }
  return result;
}

char *sub_237EE0C84(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  char *v10;
  char *v11;
  objc_super v13;

  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView] = 0;
  v9 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView;
  v10 = v4;
  *(_QWORD *)&v4[v9] = sub_237EE1008();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for PlayClockFaceView();
  v11 = (char *)objc_msgSendSuper2(&v13, sel_initWithFrame_, a1, a2, a3, a4);
  *(_QWORD *)(*(_QWORD *)&v11[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView]
            + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_delegate
            + 8) = &off_2509C6AE0;
  swift_unknownObjectWeakAssign();
  return v11;
}

uint64_t sub_237EE0E24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors) = a1;
  result = swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v1 + v2);
  if (v4)
  {
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView);
    *(_QWORD *)(*(_QWORD *)(v5 + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeLabel) + 32) = v4;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    sub_237E3AEC4();
    *(_QWORD *)(*(_QWORD *)(v5 + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_offScreenTimeLabel) + 32) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_237E3AEC4();
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_237EE0ECC()
{
  char *v0;
  id v1;
  unint64_t v2;
  id v3;
  char v4;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for PlayClockFaceView();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  v1 = objc_msgSend(v0, sel_subviews);
  sub_237E387EC();
  v2 = sub_237EE2BD4();

  v3 = *(id *)&v0[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView];
  v4 = sub_237E60450((uint64_t)v3, v2);
  swift_bridgeObjectRelease();

  if ((v4 & 1) == 0)
    objc_msgSend(v0, sel_addSubview_, v3);
  objc_msgSend(v3, sel_setFrame_, sub_237EB0EE8());
  objc_msgSend(v0, sel_bounds);
  UIRectGetCenter();
  objc_msgSend(v3, sel_setCenter_);
  return objc_msgSend(v0, sel_setClipsToBounds_, 1);
}

uint64_t sub_237EE1008()
{
  _BYTE *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t i;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _BYTE *v24;
  unint64_t v25;
  unint64_t v26;

  type metadata accessor for RollingTimeView();
  v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (qword_256897AF0 != -1)
    swift_once();
  v1 = (void *)qword_25689DF18;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeLabel];
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = qword_25689DF18;
  v4 = v1;

  v5 = *(_QWORD *)(v2 + 16);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    result = sub_237EE30A8();
    v6 = result;
    if (!result)
      goto LABEL_12;
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (!v6)
      goto LABEL_12;
  }
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  for (i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x23B826624](i, v5);
    else
      v9 = *(id *)(v5 + 8 * i + 32);
    v10 = v9;
    objc_msgSend(v9, sel_setFont_, *(_QWORD *)(v2 + 24));

  }
LABEL_12:
  swift_bridgeObjectRelease_n();

  v11 = *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_offScreenTimeLabel];
  v12 = *(void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = v1;
  v13 = v4;

  v14 = *(_QWORD *)(v11 + 16);
  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v15)
      goto LABEL_14;
LABEL_21:

    swift_bridgeObjectRelease_n();
    v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_blurColon] = 1;
    *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_overlap] = 0x403E000000000000;
    sub_237EE2A84();
    v19 = objc_allocWithZone(MEMORY[0x24BDE56B0]);
    v20 = (void *)sub_237EE2A54();
    swift_bridgeObjectRelease();
    v21 = objc_msgSend(v19, sel_initWithType_, v20);

    v22 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_compositingFilter];
    *(_QWORD *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_compositingFilter] = v21;
    v23 = v21;

    v24 = v0;
    sub_237E745A8((uint64_t)v24, (uint64_t)v24);

    v24[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_transformModifier] = 1;
    v25 = swift_bridgeObjectRetain();
    sub_237E725A4(v25);
    swift_bridgeObjectRelease();
    v26 = swift_bridgeObjectRetain();
    sub_237E725A4(v26);
    swift_bridgeObjectRelease();
    return (uint64_t)v24;
  }
  swift_bridgeObjectRetain_n();
  result = sub_237EE30A8();
  v15 = result;
  if (!result)
    goto LABEL_21;
LABEL_14:
  if (v15 >= 1)
  {
    for (j = 0; j != v15; ++j)
    {
      if ((v14 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x23B826624](j, v14);
      else
        v17 = *(id *)(v14 + 8 * j + 32);
      v18 = v17;
      objc_msgSend(v17, sel_setFont_, *(_QWORD *)(v11 + 24));

    }
    goto LABEL_21;
  }
LABEL_23:
  __break(1u);
  return result;
}

id sub_237EE136C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayClockFaceView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PlayClockFaceView()
{
  return objc_opt_self();
}

void sub_237EE1414(NSObject *a1, double a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t aBlock;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
  if (v3)
  {
    v4 = *(void **)(v2 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
    if (v4)
    {
      v7 = (void *)objc_opt_self();
      v8 = v3;
      v9 = v4;
      objc_msgSend(v7, sel_begin);
      if (qword_256897AF8 != -1)
        swift_once();
      objc_msgSend(v7, sel_setAnimationTimingFunction_, qword_25689DF20);
      dispatch_group_enter(a1);
      v10 = (void *)objc_opt_self();
      v11 = swift_allocObject();
      *(_QWORD *)(v11 + 16) = v8;
      v28 = sub_237EE1914;
      v29 = v11;
      v12 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v25 = 1107296256;
      v26 = sub_237E38D84;
      v27 = &block_descriptor_18;
      v13 = _Block_copy(&aBlock);
      v23 = v8;
      swift_release();
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = a1;
      v28 = sub_237EE1940;
      v29 = v14;
      aBlock = v12;
      v25 = 1107296256;
      v26 = sub_237E731D8;
      v27 = &block_descriptor_6_2;
      v15 = _Block_copy(&aBlock);
      v16 = a1;
      swift_release();
      objc_msgSend(v10, sel_animateWithDuration_delay_options_animations_completion_, 0, v13, v15, 0.166666667, a2);
      _Block_release(v15);
      _Block_release(v13);
      dispatch_group_enter(v16);
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = v9;
      v28 = sub_237EE1948;
      v29 = v17;
      aBlock = v12;
      v25 = 1107296256;
      v26 = sub_237E38D84;
      v27 = &block_descriptor_12_0;
      v18 = _Block_copy(&aBlock);
      v19 = v9;
      swift_release();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v16;
      v28 = sub_237EE195C;
      v29 = v20;
      aBlock = v12;
      v25 = 1107296256;
      v26 = sub_237E731D8;
      v27 = &block_descriptor_18;
      v21 = _Block_copy(&aBlock);
      v22 = v16;
      swift_release();
      objc_msgSend(v10, sel_animateWithDuration_delay_options_animations_completion_, 0, v18, v21, 0.5, a2 + 0.166666667 + 0.5);
      _Block_release(v21);
      _Block_release(v18);
      objc_msgSend(v7, sel_commit);

    }
  }
}

void sub_237EE1738(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;

  if (a1)
  {
    v23 = a1;
    v3 = objc_msgSend(a2, sel_text);
    if (!v3)
    {
      v21 = v23;
LABEL_13:

      return;
    }
    v4 = v3;
    v5 = sub_237EE2A84();
    v7 = v6;

    v8 = qword_256897B10;
    swift_bridgeObjectRetain();
    if (v8 != -1)
      swift_once();
    v9 = qword_25689DF38;
    if (*(_QWORD *)(qword_25689DF38 + 16))
    {
      v10 = sub_237EAD554(v5, v7);
      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(v9 + 56) + 40 * v10;
        v13 = *(double *)v12;
        v14 = *(double *)(v12 + 8);
        v15 = *(double *)(v12 + 16);
        v16 = *(double *)(v12 + 24);
        v17 = *(id *)(v12 + 32);
        swift_bridgeObjectRelease_n();
        v18 = objc_msgSend(v23, sel_superview);

        if (!v18)
          objc_msgSend(a2, sel_addSubview_, v23);
        objc_msgSend(a2, sel__tightBoundingRectOfFirstLine);
        objc_msgSend(v23, sel_setFrame_, v19 - v13, v14 + v20, v15, v16);
        v22 = v17;
        sub_237E2D84C((unint64_t)v22);

        v21 = v22;
        goto LABEL_13;
      }
    }

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_237EE18F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_237EE1914()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 0.0);
}

uint64_t block_copy_helper_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_18()
{
  return swift_release();
}

void sub_237EE1940()
{
  uint64_t v0;

  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

id sub_237EE1948()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 1.0);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_237EE19A4()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_237EE19B0()
{
  return MEMORY[0x24BDCB458]();
}

uint64_t sub_237EE19BC()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_237EE19C8()
{
  return MEMORY[0x24BDCB570]();
}

uint64_t sub_237EE19D4()
{
  return MEMORY[0x24BDCB588]();
}

uint64_t sub_237EE19E0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_237EE19EC()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_237EE19F8()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t sub_237EE1A04()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_237EE1A10()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_237EE1A1C()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_237EE1A28()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_237EE1A34()
{
  return MEMORY[0x24BDCBD48]();
}

uint64_t sub_237EE1A40()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_237EE1A4C()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_237EE1A58()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_237EE1A64()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_237EE1A70()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_237EE1A7C()
{
  return MEMORY[0x24BDCBDD8]();
}

uint64_t sub_237EE1A88()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_237EE1A94()
{
  return MEMORY[0x24BDCC138]();
}

uint64_t sub_237EE1AA0()
{
  return MEMORY[0x24BDCC1A8]();
}

uint64_t sub_237EE1AAC()
{
  return MEMORY[0x24BEBBE40]();
}

uint64_t sub_237EE1AB8()
{
  return MEMORY[0x24BEBBE48]();
}

uint64_t sub_237EE1AC4()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_237EE1AD0()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_237EE1ADC()
{
  return MEMORY[0x24BDEAD78]();
}

uint64_t sub_237EE1AE8()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_237EE1AF4()
{
  return MEMORY[0x24BDCC358]();
}

uint64_t sub_237EE1B00()
{
  return MEMORY[0x24BDCC5A0]();
}

uint64_t sub_237EE1B0C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_237EE1B18()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_237EE1B24()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_237EE1B30()
{
  return MEMORY[0x24BDCC868]();
}

uint64_t sub_237EE1B3C()
{
  return MEMORY[0x24BDCC878]();
}

uint64_t sub_237EE1B48()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_237EE1B54()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_237EE1B60()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_237EE1B6C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_237EE1B78()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_237EE1B84()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_237EE1B90()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_237EE1B9C()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_237EE1BA8()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_237EE1BB4()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_237EE1BC0()
{
  return MEMORY[0x24BDCD2D0]();
}

uint64_t sub_237EE1BCC()
{
  return MEMORY[0x24BEBBE70]();
}

uint64_t sub_237EE1BD8()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_237EE1BE4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_237EE1BF0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_237EE1BFC()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_237EE1C08()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_237EE1C14()
{
  return MEMORY[0x24BDCDFF0]();
}

uint64_t sub_237EE1C20()
{
  return MEMORY[0x24BDCE010]();
}

uint64_t sub_237EE1C2C()
{
  return MEMORY[0x24BDCE028]();
}

uint64_t sub_237EE1C38()
{
  return MEMORY[0x24BDCE060]();
}

uint64_t sub_237EE1C44()
{
  return MEMORY[0x24BDCE078]();
}

uint64_t sub_237EE1C50()
{
  return MEMORY[0x24BDCE098]();
}

uint64_t sub_237EE1C5C()
{
  return MEMORY[0x24BDCE0B0]();
}

uint64_t sub_237EE1C68()
{
  return MEMORY[0x24BDCE0D0]();
}

uint64_t sub_237EE1C74()
{
  return MEMORY[0x24BDCE0E0]();
}

uint64_t sub_237EE1C80()
{
  return MEMORY[0x24BDCE168]();
}

uint64_t sub_237EE1C8C()
{
  return MEMORY[0x24BDCE178]();
}

uint64_t sub_237EE1C98()
{
  return MEMORY[0x24BDCE1A8]();
}

uint64_t sub_237EE1CA4()
{
  return MEMORY[0x24BDCE1E0]();
}

uint64_t sub_237EE1CB0()
{
  return MEMORY[0x24BDCE230]();
}

uint64_t sub_237EE1CBC()
{
  return MEMORY[0x24BDCE250]();
}

uint64_t sub_237EE1CC8()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_237EE1CD4()
{
  return MEMORY[0x24BDCE318]();
}

uint64_t sub_237EE1CE0()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_237EE1CEC()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_237EE1CF8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_237EE1D04()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_237EE1D10()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_237EE1D1C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_237EE1D28()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_237EE1D34()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_237EE1D40()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_237EE1D4C()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_237EE1D58()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_237EE1D64()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_237EE1D70()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_237EE1D7C()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_237EE1D88()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_237EE1D94()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_237EE1DA0()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_237EE1DAC()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_237EE1DB8()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_237EE1DC4()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_237EE1DD0()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_237EE1DDC()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_237EE1DE8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_237EE1DF4()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_237EE1E00()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_237EE1E0C()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_237EE1E18()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_237EE1E24()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_237EE1E30()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_237EE1E3C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_237EE1E48()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_237EE1E54()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_237EE1E60()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_237EE1E6C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_237EE1E78()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_237EE1E84()
{
  return MEMORY[0x24BDCF4B8]();
}

uint64_t sub_237EE1E90()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_237EE1E9C()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_237EE1EA8()
{
  return MEMORY[0x24BDCF4E8]();
}

uint64_t sub_237EE1EB4()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_237EE1EC0()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_237EE1ECC()
{
  return MEMORY[0x24BDFA348]();
}

uint64_t sub_237EE1ED8()
{
  return MEMORY[0x24BDFA3E8]();
}

uint64_t sub_237EE1EE4()
{
  return MEMORY[0x24BDFA448]();
}

uint64_t sub_237EE1EF0()
{
  return MEMORY[0x24BDFA480]();
}

uint64_t sub_237EE1EFC()
{
  return MEMORY[0x24BDFA490]();
}

uint64_t sub_237EE1F08()
{
  return MEMORY[0x24BDFA498]();
}

uint64_t sub_237EE1F14()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_237EE1F20()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_237EE1F2C()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_237EE1F38()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_237EE1F44()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_237EE1F50()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_237EE1F5C()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_237EE1F68()
{
  return MEMORY[0x24BDCF770]();
}

uint64_t sub_237EE1F74()
{
  return MEMORY[0x24BDCF788]();
}

uint64_t sub_237EE1F80()
{
  return MEMORY[0x24BDCF798]();
}

uint64_t sub_237EE1F8C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_237EE1F98()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_237EE1FA4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_237EE1FB0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_237EE1FBC()
{
  return MEMORY[0x24BEBC210]();
}

uint64_t sub_237EE1FC8()
{
  return MEMORY[0x24BEBC218]();
}

uint64_t sub_237EE1FD4()
{
  return MEMORY[0x24BEBC228]();
}

uint64_t sub_237EE1FE0()
{
  return MEMORY[0x24BEBC238]();
}

uint64_t sub_237EE1FEC()
{
  return MEMORY[0x24BEBC240]();
}

uint64_t sub_237EE1FF8()
{
  return MEMORY[0x24BEBC248]();
}

uint64_t sub_237EE2004()
{
  return MEMORY[0x24BDB7BE0]();
}

uint64_t sub_237EE2010()
{
  return MEMORY[0x24BDB7C20]();
}

uint64_t sub_237EE201C()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_237EE2028()
{
  return MEMORY[0x24BDB8120]();
}

uint64_t sub_237EE2034()
{
  return MEMORY[0x24BDB8318]();
}

uint64_t sub_237EE2040()
{
  return MEMORY[0x24BDB8328]();
}

uint64_t sub_237EE204C()
{
  return MEMORY[0x24BDB8338]();
}

uint64_t sub_237EE2058()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_237EE2064()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_237EE2070()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_237EE207C()
{
  return MEMORY[0x24BDEB268]();
}

uint64_t sub_237EE2088()
{
  return MEMORY[0x24BDEB280]();
}

uint64_t sub_237EE2094()
{
  return MEMORY[0x24BDEB288]();
}

uint64_t sub_237EE20A0()
{
  return MEMORY[0x24BDEB290]();
}

uint64_t sub_237EE20AC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_237EE20B8()
{
  return MEMORY[0x24BDEB5B0]();
}

uint64_t sub_237EE20C4()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_237EE20D0()
{
  return MEMORY[0x24BDEBD10]();
}

uint64_t sub_237EE20DC()
{
  return MEMORY[0x24BDEBD28]();
}

uint64_t sub_237EE20E8()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_237EE20F4()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_237EE2100()
{
  return MEMORY[0x24BDEBF98]();
}

uint64_t sub_237EE210C()
{
  return MEMORY[0x24BDEBFC8]();
}

uint64_t sub_237EE2118()
{
  return MEMORY[0x24BDEBFD0]();
}

uint64_t sub_237EE2124()
{
  return MEMORY[0x24BDEBFF0]();
}

uint64_t sub_237EE2130()
{
  return MEMORY[0x24BDEC110]();
}

uint64_t sub_237EE213C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_237EE2148()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_237EE2154()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_237EE2160()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_237EE216C()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_237EE2178()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_237EE2184()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_237EE2190()
{
  return MEMORY[0x24BDECCE8]();
}

uint64_t sub_237EE219C()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_237EE21A8()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_237EE21B4()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_237EE21C0()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_237EE21CC()
{
  return MEMORY[0x24BDED8E0]();
}

uint64_t sub_237EE21D8()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_237EE21E4()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_237EE21F0()
{
  return MEMORY[0x24BDEDD28]();
}

uint64_t sub_237EE21FC()
{
  return MEMORY[0x24BDEDD30]();
}

uint64_t sub_237EE2208()
{
  return MEMORY[0x24BDEDD38]();
}

uint64_t sub_237EE2214()
{
  return MEMORY[0x24BDEDD40]();
}

uint64_t sub_237EE2220()
{
  return MEMORY[0x24BDEDD48]();
}

uint64_t sub_237EE222C()
{
  return MEMORY[0x24BDEDD70]();
}

uint64_t sub_237EE2238()
{
  return MEMORY[0x24BDEDD78]();
}

uint64_t sub_237EE2244()
{
  return MEMORY[0x24BDEDD88]();
}

uint64_t sub_237EE2250()
{
  return MEMORY[0x24BDEDD98]();
}

uint64_t sub_237EE225C()
{
  return MEMORY[0x24BDEDDA0]();
}

uint64_t sub_237EE2268()
{
  return MEMORY[0x24BDEDDA8]();
}

uint64_t sub_237EE2274()
{
  return MEMORY[0x24BDEDDB0]();
}

uint64_t sub_237EE2280()
{
  return MEMORY[0x24BDEDDB8]();
}

uint64_t sub_237EE228C()
{
  return MEMORY[0x24BDEDDC0]();
}

uint64_t sub_237EE2298()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_237EE22A4()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_237EE22B0()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_237EE22BC()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_237EE22C8()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_237EE22D4()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_237EE22E0()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_237EE22EC()
{
  return MEMORY[0x24BDEE258]();
}

uint64_t sub_237EE22F8()
{
  return MEMORY[0x24BDEE270]();
}

uint64_t sub_237EE2304()
{
  return MEMORY[0x24BDEE278]();
}

uint64_t sub_237EE2310()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_237EE231C()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_237EE2328()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_237EE2334()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_237EE2340()
{
  return MEMORY[0x24BDEE3B0]();
}

uint64_t sub_237EE234C()
{
  return MEMORY[0x24BDEE3B8]();
}

uint64_t sub_237EE2358()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_237EE2364()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_237EE2370()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_237EE237C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_237EE2388()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_237EE2394()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_237EE23A0()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_237EE23AC()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_237EE23B8()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_237EE23C4()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_237EE23D0()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_237EE23DC()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_237EE23E8()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_237EE23F4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_237EE2400()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_237EE240C()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_237EE2418()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_237EE2424()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_237EE2430()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_237EE243C()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_237EE2448()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_237EE2454()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_237EE2460()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_237EE246C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_237EE2478()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_237EE2484()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_237EE2490()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_237EE249C()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_237EE24A8()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_237EE24B4()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_237EE24C0()
{
  return MEMORY[0x24BDEFBE0]();
}

uint64_t sub_237EE24CC()
{
  return MEMORY[0x24BDEFBE8]();
}

uint64_t sub_237EE24D8()
{
  return MEMORY[0x24BDF0758]();
}

uint64_t sub_237EE24E4()
{
  return MEMORY[0x24BDF0768]();
}

uint64_t sub_237EE24F0()
{
  return MEMORY[0x24BDF0B50]();
}

uint64_t sub_237EE24FC()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_237EE2508()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_237EE2514()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_237EE2520()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_237EE252C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_237EE2538()
{
  return MEMORY[0x24BDF1558]();
}

uint64_t sub_237EE2544()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_237EE2550()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_237EE255C()
{
  return MEMORY[0x24BDF17A8]();
}

uint64_t sub_237EE2568()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_237EE2574()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_237EE2580()
{
  return MEMORY[0x24BDF1BC8]();
}

uint64_t sub_237EE258C()
{
  return MEMORY[0x24BDF1BD8]();
}

uint64_t sub_237EE2598()
{
  return MEMORY[0x24BDF1BF8]();
}

uint64_t sub_237EE25A4()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_237EE25B0()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_237EE25BC()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_237EE25C8()
{
  return MEMORY[0x24BDF1DE0]();
}

uint64_t sub_237EE25D4()
{
  return MEMORY[0x24BDF1DE8]();
}

uint64_t sub_237EE25E0()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_237EE25EC()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_237EE25F8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_237EE2604()
{
  return MEMORY[0x24BDB83A8]();
}

uint64_t sub_237EE2610()
{
  return MEMORY[0x24BDB83D8]();
}

uint64_t sub_237EE261C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_237EE2628()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_237EE2634()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_237EE2640()
{
  return MEMORY[0x24BDF2348]();
}

uint64_t sub_237EE264C()
{
  return MEMORY[0x24BDF2498]();
}

uint64_t sub_237EE2658()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_237EE2664()
{
  return MEMORY[0x24BDF26C0]();
}

uint64_t sub_237EE2670()
{
  return MEMORY[0x24BDF2818]();
}

uint64_t sub_237EE267C()
{
  return MEMORY[0x24BDF3490]();
}

uint64_t sub_237EE2688()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_237EE2694()
{
  return MEMORY[0x24BDF3960]();
}

uint64_t sub_237EE26A0()
{
  return MEMORY[0x24BDF3970]();
}

uint64_t sub_237EE26AC()
{
  return MEMORY[0x24BDF3BA8]();
}

uint64_t sub_237EE26B8()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_237EE26C4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_237EE26D0()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_237EE26DC()
{
  return MEMORY[0x24BDF3C60]();
}

uint64_t sub_237EE26E8()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_237EE26F4()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_237EE2700()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_237EE270C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_237EE2718()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_237EE2724()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_237EE2730()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_237EE273C()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_237EE2748()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_237EE2754()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_237EE2760()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_237EE276C()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_237EE2778()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_237EE2784()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_237EE2790()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_237EE279C()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_237EE27A8()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_237EE27B4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_237EE27C0()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_237EE27CC()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_237EE27D8()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_237EE27E4()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_237EE27F0()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_237EE27FC()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_237EE2808()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_237EE2814()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_237EE2820()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_237EE282C()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_237EE2838()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_237EE2844()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_237EE2850()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_237EE285C()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_237EE2868()
{
  return MEMORY[0x24BDF45D8]();
}

uint64_t sub_237EE2874()
{
  return MEMORY[0x24BDF4698]();
}

uint64_t sub_237EE2880()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_237EE288C()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_237EE2898()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_237EE28A4()
{
  return MEMORY[0x24BDB8480]();
}

uint64_t sub_237EE28B0()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_237EE28BC()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_237EE28C8()
{
  return MEMORY[0x24BDF4CE0]();
}

uint64_t sub_237EE28D4()
{
  return MEMORY[0x24BDF4D00]();
}

uint64_t sub_237EE28E0()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_237EE28EC()
{
  return MEMORY[0x24BDF4DF8]();
}

uint64_t sub_237EE28F8()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_237EE2904()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_237EE2910()
{
  return MEMORY[0x24BDF4F80]();
}

uint64_t sub_237EE291C()
{
  return MEMORY[0x24BDF4F98]();
}

uint64_t sub_237EE2928()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_237EE2934()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_237EE2940()
{
  return MEMORY[0x24BDF5018]();
}

uint64_t sub_237EE294C()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_237EE2958()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_237EE2964()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_237EE2970()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_237EE297C()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_237EE2988()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_237EE2994()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_237EE29A0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_237EE29AC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_237EE29B8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_237EE29C4()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_237EE29D0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_237EE29DC()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_237EE29E8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_237EE29F4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_237EE2A00()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_237EE2A0C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_237EE2A18()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_237EE2A24()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_237EE2A30()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t sub_237EE2A3C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_237EE2A48()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_237EE2A54()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_237EE2A60()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_237EE2A6C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_237EE2A78()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_237EE2A84()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_237EE2A90()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_237EE2A9C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_237EE2AA8()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_237EE2AB4()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_237EE2AC0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_237EE2ACC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_237EE2AD8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_237EE2AE4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_237EE2AF0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_237EE2AFC()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_237EE2B08()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_237EE2B14()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_237EE2B20()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_237EE2B2C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_237EE2B38()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_237EE2B44()
{
  return MEMORY[0x24BEE0C70]();
}

uint64_t sub_237EE2B50()
{
  return MEMORY[0x24BEE0C80]();
}

uint64_t sub_237EE2B5C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_237EE2B68()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_237EE2B74()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_237EE2B80()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_237EE2B8C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_237EE2B98()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_237EE2BA4()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_237EE2BB0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_237EE2BBC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_237EE2BC8()
{
  return MEMORY[0x24BDCFBB0]();
}

uint64_t sub_237EE2BD4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_237EE2BE0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_237EE2BEC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_237EE2BF8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_237EE2C04()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_237EE2C10()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_237EE2C1C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_237EE2C28()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_237EE2C34()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_237EE2C40()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_237EE2C4C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_237EE2C58()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_237EE2C64()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_237EE2C70()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_237EE2C7C()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_237EE2C88()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_237EE2C94()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_237EE2CA0()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_237EE2CAC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_237EE2CB8()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_237EE2CC4()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_237EE2CD0()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_237EE2CDC()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_237EE2CE8()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_237EE2CF4()
{
  return MEMORY[0x24BEE13B8]();
}

uint64_t sub_237EE2D00()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_237EE2D0C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_237EE2D18()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_237EE2D24()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_237EE2D30()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_237EE2D3C()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_237EE2D48()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_237EE2D54()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_237EE2D60()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_237EE2D6C()
{
  return MEMORY[0x24BDCFD58]();
}

uint64_t sub_237EE2D78()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_237EE2D84()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_237EE2D90()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_237EE2D9C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_237EE2DA8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_237EE2DB4()
{
  return MEMORY[0x24BDBD7D0]();
}

uint64_t sub_237EE2DC0()
{
  return MEMORY[0x24BDBD7E8]();
}

uint64_t sub_237EE2DCC()
{
  return MEMORY[0x24BDBD7F8]();
}

uint64_t sub_237EE2DD8()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_237EE2DE4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_237EE2DF0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_237EE2DFC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_237EE2E08()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_237EE2E14()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_237EE2E20()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_237EE2E2C()
{
  return MEMORY[0x24BEBCD08]();
}

uint64_t sub_237EE2E38()
{
  return MEMORY[0x24BDCFFF8]();
}

uint64_t sub_237EE2E44()
{
  return MEMORY[0x24BDD0010]();
}

uint64_t sub_237EE2E50()
{
  return MEMORY[0x24BDD0028]();
}

uint64_t sub_237EE2E5C()
{
  return MEMORY[0x24BDD0058]();
}

uint64_t sub_237EE2E68()
{
  return MEMORY[0x24BDD00A8]();
}

uint64_t sub_237EE2E74()
{
  return MEMORY[0x24BEBCFA8]();
}

uint64_t sub_237EE2E80()
{
  return MEMORY[0x24BEBCFB0]();
}

uint64_t sub_237EE2E8C()
{
  return MEMORY[0x24BEBCFF8]();
}

uint64_t sub_237EE2E98()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_237EE2EA4()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_237EE2EB0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_237EE2EBC()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_237EE2EC8()
{
  return MEMORY[0x24BDD0260]();
}

uint64_t sub_237EE2ED4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_237EE2EE0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_237EE2EEC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_237EE2EF8()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_237EE2F04()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_237EE2F10()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_237EE2F1C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_237EE2F28()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_237EE2F34()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_237EE2F40()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_237EE2F4C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_237EE2F58()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_237EE2F64()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_237EE2F70()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_237EE2F7C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_237EE2F88()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_237EE2F94()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_237EE2FA0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_237EE2FAC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_237EE2FB8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_237EE2FC4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_237EE2FD0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_237EE2FDC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_237EE2FE8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_237EE2FF4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_237EE3000()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_237EE300C()
{
  return MEMORY[0x24BEE6DB0]();
}

uint64_t sub_237EE3018()
{
  return MEMORY[0x24BEE6DB8]();
}

uint64_t sub_237EE3024()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_237EE3030()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_237EE303C()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_237EE3048()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_237EE3054()
{
  return MEMORY[0x24BEE2BA8]();
}

uint64_t sub_237EE3060()
{
  return MEMORY[0x24BEE2BC0]();
}

uint64_t sub_237EE306C()
{
  return MEMORY[0x24BEE2BC8]();
}

uint64_t sub_237EE3078()
{
  return MEMORY[0x24BEE2BD0]();
}

uint64_t sub_237EE3084()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_237EE3090()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_237EE309C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_237EE30A8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_237EE30B4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_237EE30C0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_237EE30CC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_237EE30D8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_237EE30E4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_237EE30F0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_237EE30FC()
{
  return MEMORY[0x24BEE32B0]();
}

uint64_t sub_237EE3108()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_237EE3114()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_237EE3120()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_237EE312C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_237EE3138()
{
  return MEMORY[0x24BEE3400]();
}

uint64_t sub_237EE3144()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_237EE3150()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_237EE315C()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_237EE3168()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_237EE3174()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_237EE3180()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_237EE318C()
{
  return MEMORY[0x24BEE3608]();
}

uint64_t sub_237EE3198()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_237EE31A4()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_237EE31B0()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t sub_237EE31BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_237EE31C8()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_237EE31D4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_237EE31E0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_237EE31EC()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_237EE31F8()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_237EE3204()
{
  return MEMORY[0x24BEE7148]();
}

uint64_t sub_237EE3210()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_237EE321C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_237EE3228()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_237EE3234()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_237EE3240()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_237EE324C()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_237EE3258()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_237EE3264()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_237EE3270()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_237EE327C()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_237EE3288()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_237EE3294()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_237EE32A0()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_237EE32AC()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_237EE32B8()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_237EE32C4()
{
  return MEMORY[0x24BEE45D8]();
}

uint64_t sub_237EE32D0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_237EE32DC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_237EE32E8()
{
  return MEMORY[0x24BEE47F8]();
}

uint64_t sub_237EE32F4()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_237EE3300()
{
  return MEMORY[0x24BEE4880]();
}

uint64_t sub_237EE330C()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_237EE3318()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_237EE3324()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_237EE3330()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_237EE333C()
{
  return MEMORY[0x24BEE4A98]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMake(CGAffineTransform *__return_ptr retstr, CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D0](retstr, a, b, c, d, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA98](gray, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return MEMORY[0x24BDBEFA0]((__n128)point1, *(__n128 *)&point1.y, (__n128)point2, *(__n128 *)&point2.y);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CLKDegreesToRadians()
{
  return MEMORY[0x24BDB85C0]();
}

uint64_t CLKHourMinuteSecondAnglesForTime()
{
  return MEMORY[0x24BDB85F0]();
}

uint64_t CLKUIInterpolateBetweenColors()
{
  return MEMORY[0x24BE16EE8]();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x24BDC47A0](font, glyph, matrix);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x24BDC47D0](name, matrix, options, size);
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48D0](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x24BDC4A88](line);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
  MEMORY[0x24BDC4B08](run, range.location, range.length, buffer);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x24BDC4B10](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x24BDC4B28](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
  MEMORY[0x24BDC4B30](run, range.location, range.length, buffer);
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
  MEMORY[0x24BDC4B48](run, range.location, range.length, buffer);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return MEMORY[0x24BEB0FE0]();
}

uint64_t TextToFourCharCode()
{
  return MEMORY[0x24BE29A90]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x24BEBE038]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x24BEBE160]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x24BEBE610]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x24BEBE618]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x24BEBE668]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t UIRectIntegralWithViewScale()
{
  return MEMORY[0x24BEBE6C0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x24BEBE748]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x24BE0BEE8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x24BEE4B50]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
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

uint64_t noise2()
{
  return MEMORY[0x24BE72DE0]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAFB28](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

