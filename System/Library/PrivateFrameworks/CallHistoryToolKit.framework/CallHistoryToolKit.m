_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InputScreenShareType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InputScreenShareType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376F8588 + 4 * byte_237704A75[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2376F85BC + 4 * byte_237704A70[v4]))();
}

uint64_t sub_2376F85BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376F85C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376F85CCLL);
  return result;
}

uint64_t sub_2376F85D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376F85E0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2376F85E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376F85EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376F85F8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2376F8604(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InputScreenShareType()
{
  return &type metadata for InputScreenShareType;
}

uint64_t getEnumTagSinglePayload for InputSimNum(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InputSimNum(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376F86F8 + 4 * byte_237704A7F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2376F872C + 4 * byte_237704A7A[v4]))();
}

uint64_t sub_2376F872C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376F8734(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376F873CLL);
  return result;
}

uint64_t sub_2376F8748(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376F8750);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2376F8754(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376F875C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2376F8768(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for InputSimNum()
{
  return &type metadata for InputSimNum;
}

uint64_t sub_2376F8784@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v15 - v8;
  if ((a1 & 1) == 0)
  {
    sub_2377043E8();
    v10 = sub_237704424();
    v11 = *(_QWORD *)(v10 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
    if ((_DWORD)result != 1)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v9, v10);
    __break(1u);
    goto LABEL_8;
  }
  sub_2377043E8();
  v13 = sub_237704424();
  v14 = *(_QWORD *)(v13 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v13);
  if ((_DWORD)result == 1)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v7, v13);
}

BOOL sub_2376F88D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2376F88E8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x68536E6565726373;
    else
      v3 = 0x6F4365746F6D6572;
    if (v2 == 1)
      v4 = 0xEB00000000657261;
    else
      v4 = 0xED00006C6F72746ELL;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x68536E6565726373;
      else
        v6 = 0x6F4365746F6D6572;
      if (v5 == 1)
        v7 = 0xEB00000000657261;
      else
        v7 = 0xED00006C6F72746ELL;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1701736302;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1701736302)
  {
LABEL_21:
    v8 = sub_23770476C();
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

uint64_t sub_2376F8A18()
{
  sub_237704784();
  sub_237704790();
  return sub_23770479C();
}

uint64_t sub_2376F8A5C()
{
  return sub_237704790();
}

uint64_t sub_2376F8A84()
{
  sub_237704784();
  sub_237704790();
  return sub_23770479C();
}

_QWORD *sub_2376F8AC4@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_2376F8AE4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_2376F8AF4()
{
  unint64_t result;

  result = qword_2568091A0;
  if (!qword_2568091A0)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704B4C, &type metadata for InputSimNum);
    atomic_store(result, (unint64_t *)&qword_2568091A0);
  }
  return result;
}

uint64_t sub_2376F8B38()
{
  sub_2376F8F78();
  return sub_23770464C();
}

uint64_t sub_2376F8B9C()
{
  sub_2376F8F78();
  return sub_237704478();
}

uint64_t sub_2376F8BE0()
{
  return sub_237704460();
}

uint64_t sub_2376F8BF4()
{
  return sub_23770446C();
}

uint64_t sub_2376F8C08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2376F88E8(*a1, *a2);
}

uint64_t sub_2376F8C14()
{
  sub_237704784();
  sub_237704604();
  swift_bridgeObjectRelease();
  return sub_23770479C();
}

uint64_t sub_2376F8CC0()
{
  sub_237704604();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2376F8D48()
{
  sub_237704784();
  sub_237704604();
  swift_bridgeObjectRelease();
  return sub_23770479C();
}

uint64_t sub_2376F8DF0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2376FC41C();
  *a1 = result;
  return result;
}

void sub_2376F8E1C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE400000000000000;
  v4 = 0xEB00000000657261;
  v5 = 0x68536E6565726373;
  if (v2 != 1)
  {
    v5 = 0x6F4365746F6D6572;
    v4 = 0xED00006C6F72746ELL;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 1701736302;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

unint64_t sub_2376F8E8C()
{
  unint64_t result;

  result = qword_2568091A8;
  if (!qword_2568091A8)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704BEC, &type metadata for InputScreenShareType);
    atomic_store(result, (unint64_t *)&qword_2568091A8);
  }
  return result;
}

uint64_t sub_2376F8ED0()
{
  sub_2376F8FBC();
  return sub_23770464C();
}

uint64_t sub_2376F8F34()
{
  sub_2376F8FBC();
  return sub_237704478();
}

unint64_t sub_2376F8F78()
{
  unint64_t result;

  result = qword_2568091B0;
  if (!qword_2568091B0)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704AD4, &type metadata for InputSimNum);
    atomic_store(result, (unint64_t *)&qword_2568091B0);
  }
  return result;
}

unint64_t sub_2376F8FBC()
{
  unint64_t result;

  result = qword_2568091B8;
  if (!qword_2568091B8)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704B74, &type metadata for InputScreenShareType);
    atomic_store(result, (unint64_t *)&qword_2568091B8);
  }
  return result;
}

double sub_2376F9000()
{
  uint64_t v0;
  double result;
  _DWORD *v2;
  _DWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256809200);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 6;
  v2 = (_DWORD *)MEMORY[0x24BE14970];
  *(_OWORD *)(v0 + 16) = xmmword_237704CC0;
  *(_DWORD *)(v0 + 32) = *v2;
  v3 = (_DWORD *)MEMORY[0x24BE14978];
  *(_QWORD *)(v0 + 40) = 0x3FC999999999999ALL;
  *(_DWORD *)(v0 + 48) = *v3;
  *(_QWORD *)(v0 + 56) = 0x3FC999999999999ALL;
  *(_DWORD *)(v0 + 64) = *MEMORY[0x24BE14958];
  *(_QWORD *)(v0 + 72) = 0x3FB999999999999ALL;
  *(_DWORD *)(v0 + 80) = *MEMORY[0x24BE14980];
  *(_QWORD *)(v0 + 88) = 0x3FD3333333333333;
  *(_DWORD *)(v0 + 96) = *MEMORY[0x24BE14960];
  *(_QWORD *)(v0 + 104) = 0x3FC851EB851EB852;
  *(_DWORD *)(v0 + 112) = *MEMORY[0x24BE14990];
  *(_QWORD *)(v0 + 120) = 0x3F847AE147AE147BLL;
  qword_256809610 = v0;
  return result;
}

void sub_2376F90F4()
{
  qword_256809618 = (uint64_t)&unk_2508F7ED8;
}

void sub_2376F9108()
{
  qword_256809620 = (uint64_t)&unk_2508F7F18;
}

uint64_t sub_2376F911C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568091F8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237704CD0;
  *(_QWORD *)(v0 + 32) = sub_2377045E0();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = 0x3FE6666666666666;
  result = sub_2377045E0();
  *(_QWORD *)(v0 + 56) = result;
  *(_QWORD *)(v0 + 64) = v3;
  *(_QWORD *)(v0 + 72) = 0x3FD1EB851EB851ECLL;
  *(_QWORD *)(v0 + 80) = 0xD000000000000020;
  *(_QWORD *)(v0 + 88) = 0x8000000237705840;
  *(_QWORD *)(v0 + 96) = 0x3F947AE147AE147BLL;
  qword_256809628 = v0;
  return result;
}

uint64_t sub_2376F91D8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  double v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double *v16;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    goto LABEL_20;
  v2 = result;
  v3 = (unsigned int *)(result + 32);
  if (v1 == 1)
  {
    v4 = 0;
    v5 = 0.0;
  }
  else
  {
    v4 = v1 & 0x7FFFFFFFFFFFFFFELL;
    v6 = (double *)(result + 56);
    v5 = 0.0;
    v7 = v1 & 0x7FFFFFFFFFFFFFFELL;
    do
    {
      v8 = *(v6 - 2);
      v9 = *v6;
      v6 += 4;
      v5 = v5 + v8 + v9;
      v7 -= 2;
    }
    while (v7);
    if (v1 == v4)
      goto LABEL_9;
  }
  v10 = v1 - v4;
  v11 = (double *)(result + 16 * v4 + 40);
  do
  {
    v12 = *v11;
    v11 += 2;
    v5 = v5 + v12;
    --v10;
  }
  while (v10);
LABEL_9:
  if (v5 <= 0.0)
    return *v3;
  if (v5 >= 0.0)
  {
    sub_2376FC374(result, 0.0, v5);
    v14 = *(double *)(v2 + 40) + 0.0;
    if (v13 >= v14)
    {
      v15 = v1 - 1;
      if (v1 == 1)
      {
LABEL_16:
        v3 = &v3[4 * v1 - 4];
      }
      else
      {
        v16 = (double *)(v2 + 48);
        while (1)
        {
          v14 = v14 + v16[1];
          if (v13 < v14)
            break;
          v16 += 2;
          if (!--v15)
            goto LABEL_16;
        }
        v3 = (unsigned int *)v16;
      }
    }
    return *v3;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_2376F92DC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    goto LABEL_20;
  v2 = result;
  v3 = result + 32;
  if (v1 == 1)
  {
    v4 = 0;
    v5 = 0.0;
  }
  else
  {
    v4 = v1 & 0x7FFFFFFFFFFFFFFELL;
    v6 = (double *)(result + 56);
    v5 = 0.0;
    v7 = v1 & 0x7FFFFFFFFFFFFFFELL;
    do
    {
      v8 = *(v6 - 2);
      v9 = *v6;
      v6 += 4;
      v5 = v5 + v8 + v9;
      v7 -= 2;
    }
    while (v7);
    if (v1 == v4)
      goto LABEL_9;
  }
  v10 = v1 - v4;
  v11 = (double *)(result + 16 * v4 + 40);
  do
  {
    v12 = *v11;
    v11 += 2;
    v5 = v5 + v12;
    --v10;
  }
  while (v10);
LABEL_9:
  if (v5 <= 0.0)
    return *(_QWORD *)v3;
  if (v5 >= 0.0)
  {
    sub_2376FC374(result, 0.0, v5);
    v14 = *(double *)(v2 + 40) + 0.0;
    if (v13 >= v14)
    {
      v15 = v1 - 1;
      if (v1 == 1)
      {
LABEL_16:
        v3 = v3 + 16 * v1 - 16;
      }
      else
      {
        v16 = v2 + 48;
        while (1)
        {
          v14 = v14 + *(double *)(v16 + 8);
          if (v13 < v14)
            break;
          v16 += 16;
          if (!--v15)
            goto LABEL_16;
        }
        v3 = v16;
      }
    }
    return *(_QWORD *)v3;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_2376F93E0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  double v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    goto LABEL_20;
  v2 = result;
  v3 = (uint64_t *)(result + 32);
  if (v1 == 1)
  {
    v4 = 0;
    v5 = 0.0;
  }
  else
  {
    v4 = v1 & 0x7FFFFFFFFFFFFFFELL;
    v6 = (double *)(result + 72);
    v5 = 0.0;
    v7 = v1 & 0x7FFFFFFFFFFFFFFELL;
    do
    {
      v8 = *(v6 - 3);
      v9 = *v6;
      v6 += 6;
      v5 = v5 + v8 + v9;
      v7 -= 2;
    }
    while (v7);
    if (v1 == v4)
      goto LABEL_9;
  }
  v10 = v1 - v4;
  v11 = (double *)(result + 24 * v4 + 48);
  do
  {
    v12 = *v11;
    v11 += 3;
    v5 = v5 + v12;
    --v10;
  }
  while (v10);
LABEL_9:
  if (v5 <= 0.0)
  {
LABEL_12:
    v15 = *v3;
    swift_bridgeObjectRetain();
    return v15;
  }
  if (v5 >= 0.0)
  {
    sub_2376FC374(result, 0.0, v5);
    v14 = *(double *)(v2 + 48) + 0.0;
    if (v13 >= v14)
    {
      v16 = v1 - 1;
      if (v1 == 1)
      {
LABEL_17:
        v3 = &v3[3 * v1 - 3];
      }
      else
      {
        v17 = v2 + 56;
        while (1)
        {
          v14 = v14 + *(double *)(v17 + 16);
          if (v13 < v14)
            break;
          v17 += 24;
          if (!--v16)
            goto LABEL_17;
        }
        v3 = (uint64_t *)v17;
      }
    }
    goto LABEL_12;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

id sub_2376F9510(int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, uint64_t a7, char a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  id v32;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void (*v42)(char *, uint64_t);
  id v43;
  char *v44;
  uint64_t v45;
  uint64_t inited;
  unint64_t v47;
  uint64_t v48;
  id v49;
  char v50;
  id v51;
  uint64_t v52;
  void *v53;
  double v55;
  int v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;

  v58 = a7;
  v55 = *(double *)&a4;
  v56 = a1;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C8);
  MEMORY[0x24BDAC7A8](v18);
  v57 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_237704424();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v55 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2377043DC();
  v59 = *(_QWORD *)(v27 - 8);
  v60 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v61 = (uint64_t)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x100000000) != 0)
  {
    if (qword_256809180 != -1)
      swift_once();
    a2 = sub_2376F91D8(qword_256809610);
  }
  sub_2376FC5B0(a3, (uint64_t)v26, &qword_2568091C0);
  v29 = v59;
  v30 = v60;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v26, 1, v60) == 1)
  {
    sub_2376F9B74(v61);
    sub_2376FC4A4((uint64_t)v26, &qword_2568091C0);
    if ((a5 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v61, v26, v30);
    if ((a5 & 1) != 0)
    {
LABEL_7:
      v31 = 0.0;
      if ((*MEMORY[0x24BE14968] & a2) == 1)
        v31 = (double)arc4random_uniform(0x3840u);
      if (a6)
        goto LABEL_10;
      goto LABEL_13;
    }
  }
  v31 = v55;
  if (a6)
  {
LABEL_10:
    v32 = a6;
    goto LABEL_14;
  }
LABEL_13:
  v32 = sub_2376FC73C();
LABEL_14:
  if ((a8 & 1) != 0)
  {
    v35 = qword_256809188;
    v36 = a6;
    if (v35 != -1)
      swift_once();
    v58 = sub_2376F92DC(qword_256809618);
  }
  else
  {
    v34 = a6;
  }
  v56 &= 1u;
  if ((a10 & 1) != 0)
  {
    if (qword_256809190 != -1)
      swift_once();
    a9 = sub_2376F92DC(qword_256809620);
  }
  if (!a12)
  {
    if (qword_256809198 != -1)
      swift_once();
    sub_2376F93E0(qword_256809628);
  }
  v37 = objc_allocWithZone(MEMORY[0x24BE14948]);
  swift_bridgeObjectRetain();
  v38 = objc_msgSend(v37, sel_init);
  objc_msgSend(v38, sel_setCallStatus_, a2);
  v39 = (void *)sub_2377043AC();
  objc_msgSend(v38, sel_setDate_, v39);

  objc_msgSend(v38, sel_setDuration_, v31);
  objc_msgSend(v38, sel_setHandleType_, objc_msgSend(v32, sel_type));
  objc_msgSend(v38, sel_setMediaType_, v58);
  objc_msgSend(v38, sel_setTtyType_, a9);
  objc_msgSend(v38, sel_setRead_, 0);
  v40 = (void *)sub_2377045D4();
  swift_bridgeObjectRelease();
  objc_msgSend(v38, sel_setServiceProvider_, v40);

  sub_2376F8784(v56, (uint64_t)v23);
  v41 = (void *)sub_237704400();
  v42 = *(void (**)(char *, uint64_t))(v21 + 8);
  v42(v23, v20);
  objc_msgSend(v38, sel_setLocalParticipantUUID_, v41);

  v43 = objc_msgSend(v38, sel_localParticipantUUID);
  if (v43)
  {
    sub_23770440C();

    v44 = v57;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v57, v23, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v44, 0, 1, v20);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v44, 1, v20) == 1)
    {
      v43 = 0;
    }
    else
    {
      v43 = (id)sub_237704400();
      v42(v44, v20);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v57, 1, 1, v20);
  }
  v45 = v59;
  objc_msgSend(v38, sel_setOutgoingLocalParticipantUUID_, v43, *(_QWORD *)&v55);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568091E8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237704CE0;
  *(_QWORD *)(inited + 32) = v32;
  v62 = inited;
  sub_23770467C();
  v47 = v62;
  if (v62 >> 62)
  {
    v51 = v32;
    swift_bridgeObjectRetain();
    v52 = sub_23770473C();
    swift_bridgeObjectRelease();
    v50 = a13;
    if (!v52)
      goto LABEL_36;
    goto LABEL_34;
  }
  v48 = *(_QWORD *)((v62 & 0xFFFFFFFFFFFFF8) + 0x10);
  v49 = v32;
  v50 = a13;
  if (v48)
LABEL_34:
    sub_2376FC8CC(v47);
LABEL_36:
  swift_bridgeObjectRelease();
  sub_2376FC524();
  sub_2376FC560();
  v53 = (void *)sub_2377046AC();
  swift_bridgeObjectRelease();
  objc_msgSend(v38, sel_setRemoteParticipantHandles_, v53);

  objc_msgSend(v38, sel_setHasMessage_, 0);
  objc_msgSend(v38, sel_setScreenSharingType_, qword_237704C98[v50]);

  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v61, v60);
  return v38;
}

uint64_t sub_2376F9B74@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  double v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  v1 = sub_237704448();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_2377043DC();
  v8 = *(_QWORD *)(v29 - 8);
  v9 = MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - v11;
  v13 = sub_237704454();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23770443C();
  sub_2377043D0();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCF220], v1);
  sub_237704430();
  v17 = v4;
  v18 = v8;
  v19 = v29;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v17, v1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v7, 1, v19) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    sub_2376FC4A4((uint64_t)v7, &qword_2568091C0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v30, v12, v19);
  }
  v21 = v14;
  v22 = v13;
  v23 = v28;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v28, v7, v19);
  result = sub_237704394();
  if ((~*(_QWORD *)&v24 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v24 <= -1.0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v24 >= 4294967300.0)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v25 = v23;
  arc4random_uniform(v24);
  sub_2377043A0();
  v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  v26(v25, v19);
  v26(v12, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v16, v22);
}

uint64_t sub_2376F9E18(int a1)
{
  void *v1;
  void *v2;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void (*v48)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  id v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  void (*v139)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v140;
  char *v141;
  int v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  _QWORD v146[2];
  uint64_t v147;
  unint64_t v148;

  v2 = v1;
  v142 = a1;
  v3 = sub_237704424();
  v143 = *(_QWORD *)(v3 - 8);
  v144 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v135 = (char *)&v134 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C0);
  MEMORY[0x24BDAC7A8](v5);
  v138 = (char *)&v134 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v140 = (char *)&v134 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v141 = (char *)&v134 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v137 = (char *)&v134 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v136 = (char *)&v134 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v134 - v16;
  v18 = sub_237704334();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v134 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091D0);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v134 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v134 - v26;
  v147 = 2683;
  v148 = 0xE200000000000000;
  v28 = objc_msgSend(v1, sel_uniqueId);
  sub_2377045E0();

  v146[0] = 0x657571696E752209;
  v146[1] = 0xEF22203A20226449;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v29 = objc_msgSend(v2, sel_name);
  if (v29)
  {
    v30 = v29;
    v31 = sub_2377045E0();
    v33 = v32;

  }
  else
  {
    v31 = 0;
    v33 = 0;
  }
  sub_2376FB754(1701667182, 0xE400000000000000, v31, v33);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v2, sel_imageURL);
  if (v34)
  {
    v35 = v34;
    sub_2377042F8();

    v36 = 0;
  }
  else
  {
    v36 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v25, v36, 1, v18);
  sub_2376FC4E0((uint64_t)v25, (uint64_t)v27, &qword_2568091D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v27, 1, v18))
  {
    sub_2376FC4A4((uint64_t)v27, &qword_2568091D0);
    v37 = 0;
    v38 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v21, v27, v18);
    sub_2376FC4A4((uint64_t)v27, &qword_2568091D0);
    v37 = sub_2377042BC();
    v38 = v39;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  v40 = v144;
  sub_2376FB754(0x4C52556567616D69, 0xE800000000000000, v37, v38);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v41 = objc_msgSend(v2, sel_junkIdentificationCategory);
  if (v41)
  {
    v42 = v41;
    v43 = sub_2377045E0();
    v45 = v44;

  }
  else
  {
    v43 = 0;
    v45 = 0;
  }
  sub_2376FB754(0xD00000000000001ALL, 0x80000002377055C0, v43, v45);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v46 = objc_msgSend(v2, sel_localParticipantUUID);
  if (v46)
  {
    v47 = v46;
    sub_23770440C();

    v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v143 + 56);
    v48((uint64_t)v17, 0, 1, v40);
  }
  else
  {
    v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v143 + 56);
    v48((uint64_t)v17, 1, 1, v40);
  }
  sub_2376FB864(0xD000000000000014, 0x80000002377055E0, (uint64_t)v17);
  sub_2376FC4A4((uint64_t)v17, &qword_2568091C8);
  sub_237704628();
  swift_bridgeObjectRelease();
  v49 = objc_msgSend(v2, sel_outgoingLocalParticipantUUID);
  if (v49)
  {
    v50 = v49;
    v51 = (uint64_t)v136;
    sub_23770440C();

    v52 = 0;
  }
  else
  {
    v52 = 1;
    v51 = (uint64_t)v136;
  }
  v53 = 1;
  v48(v51, v52, 1, v40);
  sub_2376FB864(0xD00000000000001CLL, 0x8000000237705600, v51);
  sub_2376FC4A4(v51, &qword_2568091C8);
  sub_237704628();
  swift_bridgeObjectRelease();
  v54 = objc_msgSend(v2, sel_participantGroupUUID);
  if (v54)
  {
    v55 = v54;
    v56 = (uint64_t)v137;
    sub_23770440C();

    v53 = 0;
  }
  else
  {
    v56 = (uint64_t)v137;
  }
  v48(v56, v53, 1, v40);
  sub_2376FB864(0xD000000000000014, 0x8000000237705620, v56);
  sub_2376FC4A4(v56, &qword_2568091C8);
  sub_237704628();
  swift_bridgeObjectRelease();
  v57 = objc_msgSend(v2, sel_remoteParticipantHandles);
  if (!v57)
    goto LABEL_27;
  v58 = v57;
  sub_2376FC524();
  sub_2376FC560();
  v59 = sub_2377046B8();

  if ((v59 & 0xC000000000000001) == 0)
  {
    if (!*(_QWORD *)(v59 + 16))
      goto LABEL_26;
    goto LABEL_25;
  }
  if (sub_237704700())
  {
LABEL_25:
    sub_2376FBA90(0xD000000000000018, 0x80000002377057A0, v59);
    swift_bridgeObjectRelease();
    sub_237704628();
  }
LABEL_26:
  swift_bridgeObjectRelease();
LABEL_27:
  v60 = (void *)objc_opt_self();
  v61 = objc_msgSend(v60, sel_callMediaTypeAsString_, objc_msgSend(v2, sel_mediaType));
  sub_2377045E0();

  v146[0] = 0xD000000000000010;
  v146[1] = 0x8000000237705640;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v62 = objc_msgSend(v60, sel_callTTYTypeAsString_, objc_msgSend(v2, sel_ttyType));
  sub_2377045E0();

  strcpy((char *)v146, "\t\"ttyType\" : \"");
  HIBYTE(v146[1]) = -18;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v63 = objc_msgSend(v60, sel_callHandleTypeAsString_, objc_msgSend(v2, sel_handleType));
  sub_2377045E0();

  v146[0] = 0xD000000000000011;
  v146[1] = 0x8000000237705660;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v64 = objc_msgSend(v2, sel_serviceProvider);
  if (v64)
  {
    v65 = v64;
    v66 = sub_2377045E0();
    v68 = v67;

  }
  else
  {
    v66 = 0;
    v68 = 0;
  }
  sub_2376FB754(0x5065636976726573, 0xEF72656469766F72, v66, v68);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v69 = objc_msgSend(v60, sel_callStatusAsString_, objc_msgSend(v2, sel_callStatus));
  sub_2377045E0();

  v146[0] = 0xD000000000000011;
  v146[1] = 0x8000000237705680;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v70 = objc_msgSend(v2, sel_date);
  if (v70)
  {
    v71 = v70;
    v72 = (uint64_t)v138;
    sub_2377043B8();

    v73 = sub_2377043DC();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v73 - 8) + 56))(v72, 0, 1, v73);
  }
  else
  {
    v74 = sub_2377043DC();
    v72 = (uint64_t)v138;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v138, 1, 1, v74);
  }
  sub_2376FBDDC(1702125924, 0xE400000000000000, v72, 0);
  sub_2376FC4A4(v72, &qword_2568091C0);
  sub_237704628();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_duration);
  v146[0] = 0;
  v146[1] = 0xE000000000000000;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_2377046A0();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_callerIdAvailability);
  v75 = (id)CHCallerIdAvailabilityAsString();
  if (v75)
  {
    v76 = v75;
    v77 = sub_2377045E0();
    v79 = v78;

  }
  else
  {
    v77 = 0;
    v79 = 0;
  }
  sub_2376FB754(0xD000000000000014, 0x80000002377056A0, v77, v79);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_callerIdIsBlocked);
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v80 = objc_msgSend(v2, sel_callerName);
  v139 = v48;
  if (v80)
  {
    v81 = v80;
    v82 = sub_2377045E0();
    v84 = v83;

  }
  else
  {
    v82 = 0;
    v84 = 0;
  }
  sub_2376FB754(0x614E72656C6C6163, 0xEA0000000000656DLL, v82, v84);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v85 = objc_msgSend(v2, sel_callerIdLabel);
  sub_2377045E0();

  v146[0] = 0xD000000000000014;
  v146[1] = 0x80000002377056E0;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v86 = objc_msgSend(v2, sel_callerIdLocation);
  sub_2377045E0();

  v146[0] = 0xD000000000000017;
  v146[1] = 0x8000000237705700;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v87 = objc_msgSend(v2, sel_bytesOfDataUsed);
  v88 = objc_msgSend(v87, sel_integerValue);

  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  v145 = v88;
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v89 = objc_msgSend(v2, sel_isoCountryCode);
  if (v89)
  {
    v90 = v89;
    v91 = sub_2377045E0();
    v93 = v92;

  }
  else
  {
    v91 = 0;
    v93 = 0;
  }
  sub_2376FB754(0x746E756F436F7369, 0xEE0065646F437972, v91, v93);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_read);
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v94 = objc_msgSend(v2, sel_disconnectedCause);
  if (v94)
  {
    v95 = v94;
    v96 = objc_msgSend(v94, sel_integerValue);

  }
  else
  {
    v96 = 0;
  }
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  v145 = v96;
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v97 = objc_msgSend(v2, sel_filteredOutReason);
  if (v97)
  {
    v98 = v97;
    v99 = objc_msgSend(v97, sel_integerValue);

  }
  else
  {
    v99 = 0;
  }
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  v145 = v99;
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v100 = (void *)objc_opt_self();
  v101 = objc_msgSend(v100, sel_ch_stringWithCHRecentCallJunkConfidence_, objc_msgSend(v2, sel_junkConfidence));
  if (v101)
  {
    v102 = v101;
    v103 = sub_2377045E0();
    v105 = v104;

  }
  else
  {
    v103 = 0;
    v105 = 0;
  }
  sub_2376FB754(0x666E6F436B6E756ALL, 0xEE0065636E656469, v103, v105);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v106 = objc_msgSend(v2, sel_contactIdentifier);
  if (v106)
  {
    v107 = v106;
    v108 = sub_2377045E0();
    v110 = v109;

  }
  else
  {
    v108 = 0;
    v110 = 0;
  }
  sub_2376FB754(0xD000000000000011, 0x8000000237705760, v108, v110);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_multiCall);
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v111 = objc_msgSend(v2, sel_unreadCount);
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  v145 = v111;
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v112 = objc_msgSend(v100, sel_ch_stringWithCHRecentCallVerificationStatus_, objc_msgSend(v2, sel_verificationStatus));
  if (v112)
  {
    v113 = v112;
    v114 = sub_2377045E0();
    v116 = v115;

  }
  else
  {
    v114 = 0;
    v116 = 0;
  }
  sub_2376FB754(0xD000000000000012, 0x8000000237705780, v114, v116);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_hasMessage);
  v146[0] = 8713;
  v146[1] = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  v117 = objc_msgSend(v2, sel_conversationID);
  if (v117)
  {
    v118 = v117;
    v119 = (uint64_t)v140;
    sub_23770440C();

    v120 = 0;
    v122 = v143;
    v121 = v144;
  }
  else
  {
    v120 = 1;
    v122 = v143;
    v121 = v144;
    v119 = (uint64_t)v140;
  }
  v123 = (uint64_t)v141;
  v139(v119, v120, 1, v121);
  sub_2376FC4E0(v119, v123, &qword_2568091C8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v122 + 48))(v123, 1, v121))
  {
    sub_2376FC4A4(v123, &qword_2568091C8);
    v124 = 0;
    v125 = 0;
  }
  else
  {
    v126 = v135;
    (*(void (**)(char *, uint64_t, uint64_t))(v122 + 16))(v135, v123, v121);
    sub_2376FC4A4(v123, &qword_2568091C8);
    v124 = sub_2377043F4();
    v125 = v127;
    (*(void (**)(char *, uint64_t))(v122 + 8))(v126, v121);
  }
  sub_2376FB754(0x61737265766E6F63, 0xEE0044496E6F6974, v124, v125);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  v128 = objc_msgSend(v100, sel_ch_stringWithCHCallScreenSharingType_, objc_msgSend(v2, sel_screenSharingType));
  if (v128)
  {
    v129 = v128;
    v130 = sub_2377045E0();
    v132 = v131;

  }
  else
  {
    v130 = 0;
    v132 = 0;
  }
  sub_2376FB754(0x68536E6565726373, 0xEF65707954657261, v130, v132);
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  return v147;
}

uint64_t sub_2376FB754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    sub_237704628();
    sub_237704628();
  }
  sub_237704628();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  return 8713;
}

uint64_t sub_2376FB864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_237704424();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376FC5B0(a3, (uint64_t)v6, &qword_2568091C8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2376FC4A4((uint64_t)v6, &qword_2568091C8);
    v13 = 8713;
    v14 = 0xE200000000000000;
    sub_237704628();
    sub_237704628();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    return v13;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v13 = 8713;
    v14 = 0xE200000000000000;
    sub_237704628();
    sub_237704628();
    sub_2377043F4();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    v11 = v13;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return v11;
}

uint64_t sub_2376FBA90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v14 = 8713;
  v15 = 0xE200000000000000;
  sub_237704628();
  sub_237704628();
  v16 = 8713;
  v17 = 0xE200000000000000;
  v4 = swift_bridgeObjectRetain();
  v13 = a3;
  sub_2376FC0B8(v4, (uint64_t)&v14);
  sub_2376FC174();
  if (!v5)
  {
LABEL_11:
    sub_2376FC5A8();
    v14 = 9;
    v15 = 0xE100000000000000;
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    sub_237704628();
    swift_bridgeObjectRelease();
    return v16;
  }
  v6 = v5;
  v7 = a3 & 0xC000000000000001;
  while (1)
  {
    sub_237704724();
    sub_237704628();
    objc_msgSend(v6, sel_type);
    sub_237704760();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    v8 = objc_msgSend(v6, sel_value);
    sub_2377045E0();

    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    v9 = objc_msgSend(v6, sel_normalizedValue);
    if (v9)
    {
      v10 = v9;
      sub_2377045E0();

    }
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    if (!v7)
      break;
    result = sub_237704700();
    if (__OFSUB__(result, 1))
      goto LABEL_12;
LABEL_10:
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    sub_237704628();

    swift_bridgeObjectRelease();
    sub_2376FC174();
    v6 = v12;
    if (!v12)
      goto LABEL_11;
  }
  result = *(_QWORD *)(v13 + 16);
  if (!__OFSUB__(result, 1))
    goto LABEL_10;
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_2376FBDDC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t v28;

  v26 = a4;
  v24 = a1;
  v25 = a2;
  v5 = sub_237704370();
  v22 = *(_QWORD *)(v5 - 8);
  v23 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_237704388();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2377043DC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376FC5B0(a3, (uint64_t)v14, &qword_2568091C0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_2376FC4A4((uint64_t)v14, &qword_2568091C0);
    v27 = 8713;
    v28 = 0xE200000000000000;
    sub_237704628();
    sub_237704628();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    return v27;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    v27 = 8713;
    v28 = 0xE200000000000000;
    sub_237704628();
    sub_237704628();
    sub_23770437C();
    sub_237704364();
    sub_2377043C4();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v23);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    v19 = v27;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  return v19;
}

uint64_t sub_2376FC0B8@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  if ((result & 0xC000000000000001) != 0)
  {
    sub_2377046F4();
    sub_2376FC524();
    sub_2376FC560();
    sub_2377046C4();
    result = v10;
    v3 = v11;
    v4 = v12;
    v5 = v13;
  }
  else
  {
    v6 = -1;
    v7 = -1 << *(_BYTE *)(result + 32);
    v8 = ~v7;
    v3 = result + 56;
    v9 = -v7;
    if (v9 < 64)
      v6 = ~(-1 << v9);
    v5 = v6 & *(_QWORD *)(result + 56);
    v4 = (unint64_t)v8;
  }
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v3;
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2376FC174()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  int64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;

  v1 = v0;
  if ((*v0 & 0x8000000000000000) != 0)
  {
    if (sub_23770470C())
    {
      sub_2376FC524();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      if (v15)
        goto LABEL_6;
    }
    return;
  }
  v3 = v0[3];
  v2 = v0[4];
  if (v2)
  {
    v4 = (v2 - 1) & v2;
    v5 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_4:
    v6 = *(void **)(*(_QWORD *)(*v0 + 48) + 8 * v5);
    v7 = v6;
    goto LABEL_5;
  }
  v9 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_35:
    __break(1u);
    return;
  }
  v10 = (unint64_t)(v0[2] + 64) >> 6;
  if (v9 >= v10)
  {
    v6 = 0;
    v4 = 0;
    goto LABEL_5;
  }
  v11 = v0[1];
  v12 = *(_QWORD *)(v11 + 8 * v9);
  if (v12)
  {
LABEL_14:
    v4 = (v12 - 1) & v12;
    v5 = __clz(__rbit64(v12)) + (v9 << 6);
    v3 = v9;
    goto LABEL_4;
  }
  v13 = v3 + 2;
  if (v3 + 2 >= v10)
    goto LABEL_31;
  v12 = *(_QWORD *)(v11 + 8 * v13);
  if (v12)
  {
LABEL_19:
    v9 = v13;
    goto LABEL_14;
  }
  if (v3 + 3 >= v10)
    goto LABEL_32;
  v12 = *(_QWORD *)(v11 + 8 * (v3 + 3));
  if (v12)
  {
    v9 = v3 + 3;
    goto LABEL_14;
  }
  v13 = v3 + 4;
  if (v3 + 4 < v10)
  {
    v12 = *(_QWORD *)(v11 + 8 * v13);
    if (v12)
      goto LABEL_19;
    v9 = v3 + 5;
    if (v3 + 5 < v10)
    {
      v12 = *(_QWORD *)(v11 + 8 * v9);
      if (v12)
        goto LABEL_14;
      v9 = v10 - 1;
      v14 = v3 + 6;
      while (v10 != v14)
      {
        v12 = *(_QWORD *)(v11 + 8 * v14++);
        if (v12)
        {
          v9 = v14 - 1;
          goto LABEL_14;
        }
      }
LABEL_31:
      v6 = 0;
      v4 = 0;
      v3 = v9;
      goto LABEL_5;
    }
LABEL_32:
    v6 = 0;
    v4 = 0;
    v3 = v13;
    goto LABEL_5;
  }
  v6 = 0;
  v4 = 0;
  v3 += 3;
LABEL_5:
  v1[3] = v3;
  v1[4] = v4;
  if (v6)
  {
LABEL_6:
    v8 = v1[5];
    if (!__OFADD__(v8, 1))
    {
      v1[5] = v8 + 1;
      return;
    }
    __break(1u);
    goto LABEL_35;
  }
}

void sub_2376FC360(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_2376FC368@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2376FC374(uint64_t result, double a2, double a3)
{
  double v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v6 = result;
  v7 = 0;
  result = MEMORY[0x23B81B230](&v7, 8);
  if (v5 * ((double)(v7 & 0x1FFFFFFFFFFFFFLL) * 1.11022302e-16) + a2 == a3)
    return sub_2376FC374(v6, a2, a3);
  return result;
}

uint64_t sub_2376FC41C()
{
  unint64_t v0;

  v0 = sub_237704748();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81B1D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2376FC4A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2376FC4E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_2376FC524()
{
  unint64_t result;

  result = qword_2568091D8;
  if (!qword_2568091D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2568091D8);
  }
  return result;
}

unint64_t sub_2376FC560()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2568091E0;
  if (!qword_2568091E0)
  {
    v1 = sub_2376FC524();
    result = MEMORY[0x23B81B1E8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2568091E0);
  }
  return result;
}

uint64_t sub_2376FC5A8()
{
  return swift_release();
}

uint64_t sub_2376FC5B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2376FC5F4()
{
  uint64_t v0;
  _QWORD v2[4];

  v2[2] = 0;
  v2[3] = 0xE000000000000000;
  v0 = 10;
  do
  {
    v2[0] = 0;
    MEMORY[0x23B81B230](v2, 8);
    v2[0] = (v2[0] >> 61) + 2;
    sub_237704760();
    sub_237704628();
    swift_bridgeObjectRelease();
    --v0;
  }
  while (v0);
  v2[0] = 12587;
  v2[1] = 0xE200000000000000;
  sub_237704628();
  swift_bridgeObjectRelease();
  return v2[0];
}

uint64_t sub_2376FC6B4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_23770461C();
    return sub_237704640();
  }
  return result;
}

id sub_2376FC73C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v19;
  unint64_t v20;

  v0 = sub_237704424();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = 0;
  MEMORY[0x23B81B230](&v19, 8);
  if ((v19 & 0x20000) != 0)
  {
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_237704418();
    sub_2377043F4();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v5 = sub_2376FC6B4(8);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x23B81AE64](v5, v7, v9, v11);
    v14 = v13;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = v12;
    v20 = v14;
    sub_237704628();
    v4 = 3;
  }
  else
  {
    sub_2376FC5F4();
    v4 = 2;
  }
  v15 = objc_allocWithZone(MEMORY[0x24BE14928]);
  v16 = (void *)sub_2377045D4();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithType_value_, v4, v16);

  return v17;
}

void sub_2376FC8CC(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23770473C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568091F0);
      v3 = sub_237704718();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_23770473C();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v39 = v1;
    while (1)
    {
      v8 = MEMORY[0x23B81AF9C](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_2377046DC();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        sub_2376FC524();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_2377046E8();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v39;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_2377046E8();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v39;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v41)
        return;
    }
  }
  v24 = 0;
  v40 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v1 + 32 + 8 * v24);
    v26 = sub_2377046DC();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_2376FC524();
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_2377046E8();

      if ((v33 & 1) != 0)
        goto LABEL_24;
      v34 = ~v27;
      v28 = (v28 + 1) & v34;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) != 0)
      {
        while (1)
        {
          v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
          v36 = sub_2377046E8();

          if ((v36 & 1) != 0)
            break;
          v28 = (v28 + 1) & v34;
          v29 = v28 >> 6;
          v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
          v31 = 1 << v28;
          if ((v30 & (1 << v28)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v41;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v41;
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_2376FCC24(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2376FCC58 + 4 * byte_237704CF0[a1]))(0x6D30333B305B1BLL, 0xE700000000000000);
}

uint64_t sub_2376FCC58()
{
  return 0x6D31333B305B1BLL;
}

uint64_t sub_2376FCC6C()
{
  return 0x6D32333B305B1BLL;
}

uint64_t sub_2376FCC80()
{
  return 0x6D33333B305B1BLL;
}

uint64_t sub_2376FCC94()
{
  return 0x6D34333B305B1BLL;
}

uint64_t sub_2376FCCA8()
{
  return 0x6D35333B305B1BLL;
}

uint64_t sub_2376FCCBC()
{
  return 0x6D36333B305B1BLL;
}

uint64_t sub_2376FCCD0()
{
  return 0x6D37333B305B1BLL;
}

uint64_t sub_2376FCCE4()
{
  return 0x6D303B305B1BLL;
}

uint64_t sub_2376FCCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v36[0] = 0;
  v8 = sub_237704598();
  result = MEMORY[0x23B81AE10](1, v8, v36);
  if ((_DWORD)result)
    return result;
  v10 = WORD1(v36[0]);
  v11 = (double)a3 / (double)a4;
  v12 = 0.0;
  if (v11 >= 0.0)
    v12 = (double)a3 / (double)a4;
  if (v11 <= 1.0)
    v13 = v12;
  else
    v13 = 1.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809210);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_237704D00;
  v15 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v14 + 64) = v15;
  *(double *)(v14 + 32) = v13 * 100.0;
  sub_2377045EC();
  v16 = sub_237704610();
  v17 = v10 - v16;
  if (__OFSUB__(v10, v16))
  {
    __break(1u);
    goto LABEL_20;
  }
  v18 = sub_237704610();
  v19 = v17 - v18;
  if (__OFSUB__(v17, v18))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v20 = v19 - 4;
  if (__OFSUB__(v19, 4))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = v13 * (double)v20;
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  v22 = (uint64_t)v21;
  MEMORY[0x23B81AEA0](8951522, 0xA300000000000000, (uint64_t)v21);
  if (__OFSUB__(v20, v22))
    goto LABEL_25;
  MEMORY[0x23B81AEA0](9541346, 0xA300000000000000, v20 - v22);
  swift_bridgeObjectRetain();
  sub_237704628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_237704628();
  sub_237704628();
  swift_bridgeObjectRetain();
  sub_237704628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_237704628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  swift_bridgeObjectRetain();
  sub_237704628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((a5 & 1) != 0)
  {
    v23 = objc_allocWithZone(MEMORY[0x24BDD1798]);
    v24 = sub_2376FD4C0(0xD000000000000021, 0x8000000237705870, 1);
    v25 = sub_237704610();
    v26 = (void *)sub_2377045D4();
    v27 = (void *)sub_2377045D4();
    v28 = objc_msgSend(v24, sel_stringByReplacingMatchesInString_options_range_withTemplate_, v26, 0, 0, v25, v27);

    sub_2377045E0();
    v29 = objc_allocWithZone(MEMORY[0x24BDD1798]);
    v30 = sub_2376FD4C0(0xD000000000000021, 0x8000000237705870, 1);
    v31 = sub_237704610();
    v32 = (void *)sub_2377045D4();
    v33 = (void *)sub_2377045D4();
    v34 = objc_msgSend(v30, sel_stringByReplacingMatchesInString_options_range_withTemplate_, v32, 0, 0, v31, v33);

  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_237704628();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_237704D00;
  *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v35 + 32) = 0x4B5B1B41315B1BLL;
  *(_QWORD *)(v35 + 40) = 0xE700000000000000;
  sub_237704778();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2376FD278(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_2377045C8();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376FD2E8()
{
  uint64_t v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = *(int **)(v0 + 16);
  sub_2377045BC();
  v4 = (uint64_t (*)(void))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  *v2 = v0;
  v2[1] = sub_2376FD348;
  return v4();
}

uint64_t sub_2376FD348()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

unint64_t sub_2376FD3AC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t result;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void (*v7)(uint64_t, uint64_t);

  sub_2377045BC();
  v1 = sub_2377045B0();
  result = sub_2377045B0();
  v3 = v1 - result;
  if (v1 < result)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 32);
    v6 = round((double)v3 / 1000000000.0 * 100.0) / 100.0;
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 40) + 8);
    v7(*(_QWORD *)(v0 + 48), v5);
    v7(v4, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(double))(v0 + 8))(v6);
  }
  return result;
}

uint64_t sub_2376FD470()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 32));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_2376FD4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_2377045D4();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_2377042A4();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2376FD598(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568093A0);
  sub_237704508();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_237704D10;
  sub_2377044F0();
  sub_2377044FC();
  sub_237704514();
  MEMORY[0x24BDAC7A8]();
  sub_2377044CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809220);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237704484();
  v3 = sub_237704490();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 0, 1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23770449C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_237704544();
  MEMORY[0x24BDAC7A8]();
  sub_237704538();
  return sub_237704574();
}

uint64_t InsertCall.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(char *, _QWORD, uint64_t, uint64_t);
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
  _QWORD v20[2];
  uint64_t (*v21)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;

  sub_2376FD598(1);
  v2 = type metadata accessor for InsertCall();
  v28 = v2;
  v29 = a1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256809220) - 8) + 64);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v26 = v3;
  v27 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_237704484();
  v4 = sub_237704490();
  v5 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5((char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v4);
  v25 = (uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v5;
  v20[1] = *(_QWORD *)(*(_QWORD *)(sub_237704514() - 8) + 64);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v22 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2377044D8();
  v7 = sub_23770455C();
  v24 = a1 + *(int *)(v2 + 24);
  v31 = 0;
  MEMORY[0x24BDAC7A8](v7);
  sub_237704484();
  v5((char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v4);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  v9 = *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  MEMORY[0x24BDAC7A8](v8);
  v23 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = (char *)v20 - v23;
  v11 = sub_23770449C();
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12 = v21(v10, 1, 1, v11);
  MEMORY[0x24BDAC7A8](v12);
  sub_2377044D8();
  v13 = sub_237704544();
  MEMORY[0x24BDAC7A8](v13);
  sub_237704538();
  sub_2376FDBBC();
  v14 = sub_237704574();
  v30 = 0;
  MEMORY[0x24BDAC7A8](v14);
  v15 = (char *)v20 - v27;
  sub_237704484();
  v16 = v25(v15, 0, 1, v4);
  MEMORY[0x24BDAC7A8](v16);
  v17 = v21((char *)v20 - v23, 1, 1, v11);
  MEMORY[0x24BDAC7A8](v17);
  v18 = sub_2377044D8();
  MEMORY[0x24BDAC7A8](v18);
  sub_237704538();
  sub_2376FDC00();
  return sub_237704574();
}

uint64_t type metadata accessor for InsertCall()
{
  uint64_t result;

  result = qword_256809320;
  if (!qword_256809320)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2376FDBBC()
{
  unint64_t result;

  result = qword_256809230;
  if (!qword_256809230)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704C54, &type metadata for InputSimNum);
    atomic_store(result, (unint64_t *)&qword_256809230);
  }
  return result;
}

unint64_t sub_2376FDC00()
{
  unint64_t result;

  result = qword_256809238;
  if (!qword_256809238)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704C14, &type metadata for InputScreenShareType);
    atomic_store(result, (unint64_t *)&qword_256809238);
  }
  return result;
}

uint64_t InsertCall.run()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch();
}

uint64_t sub_2376FDC5C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE14938]), sel_init);
  *(_QWORD *)(v0 + 48) = v2;
  type metadata accessor for InsertCall();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  sub_237704550();
  objc_msgSend(v2, sel_setGenerateSyncTransactions_, *(unsigned __int8 *)(v0 + 88));
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_2376FDD2C;
  return sub_2376FD278((uint64_t)&unk_256809258, v3);
}

uint64_t sub_2376FDD2C(double a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(double *)(v4 + 80) = a1;
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2376FDDA8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 48);
  sub_237704724();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_237704628();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  sub_237704568();
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  sub_2377046A0();
  sub_237704628();
  sub_237704628();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_237704D00;
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0x4B5B1B41315B1BLL;
  *(_QWORD *)(v2 + 40) = 0xE700000000000000;
  sub_237704778();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376FDF60()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376FDF9C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[18] = a1;
  v2[19] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C0);
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376FDFF8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  *(_QWORD *)(v0 + 128) = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  result = sub_237704568();
  v2 = *(_QWORD *)(v0 + 136);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    if (v2)
    {
      type metadata accessor for InsertCall();
      v3 = 0;
      do
      {
        v4 = *(_QWORD *)(v0 + 160);
        ++v3;
        sub_237704568();
        sub_2376FCCF8(0x6E69747265736E49, 0xEF736C6C61632067, v3, *(_QWORD *)(v0 + 120), 0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
        sub_237704568();
        v5 = *(unsigned __int8 *)(v0 + 177);
        v6 = sub_2377043DC();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
        sub_237704568();
        v7 = sub_2376F9510(v5, 0x100000000, v4, 0, 1, 0, 0, 1, 0, 1, 0, 0, *(_BYTE *)(v0 + 176));
        sub_2376FFC4C(v4);
        v8 = v7;
        MEMORY[0x23B81AEC4]();
        if (*(_QWORD *)((*(_QWORD *)(v0 + 128) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 128) & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
          sub_237704688();
        sub_237704694();
        sub_23770467C();

      }
      while (v2 != v3);
    }
    v9 = *(void **)(v0 + 152);
    sub_2376FFC8C();
    v10 = sub_237704664();
    *(_QWORD *)(v0 + 168) = v10;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_2376FE29C;
    v11 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v12 = (_QWORD *)(v0 + 80);
    v12[1] = 0x40000000;
    v12[2] = sub_237702178;
    v12[3] = &block_descriptor;
    v12[4] = v11;
    objc_msgSend(v9, sel_addArrayToCallHistory_withCompletion_, v10, v12);
    return swift_continuation_await();
  }
  return result;
}

uint64_t sub_2376FE29C()
{
  return swift_task_switch();
}

uint64_t sub_2376FE2E8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376FE324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2376FE374;
  return sub_2376FDF9C(v2, v3);
}

uint64_t sub_2376FE374()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

BOOL sub_2376FE3BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2376FE3D0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2376FE3FC + 4 * byte_237704D30[*v0]))(0x746E756F63, 0xE500000000000000);
}

uint64_t sub_2376FE3FC()
{
  return 0x746361736E617274;
}

uint64_t sub_2376FE41C()
{
  return 0x44496D6973;
}

uint64_t sub_2376FE42C()
{
  return 0x68536E6565726373;
}

uint64_t sub_2376FE450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2376FFA68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2376FE474()
{
  return 0;
}

void sub_2376FE480(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2376FE48C()
{
  sub_2376FECAC();
  return sub_2377047B4();
}

uint64_t sub_2376FE4B4()
{
  sub_2376FECAC();
  return sub_2377047C0();
}

uint64_t InsertCall.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  void (*v12)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v57;
  uint64_t (*v58)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  _QWORD *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  unint64_t v67;
  char *v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;

  v63 = a1;
  v52 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809268);
  v54 = *(_QWORD *)(v2 - 8);
  v55 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v66 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for InsertCall();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376FD598(1);
  v7 = *(int *)(v4 + 20);
  v62 = (char *)v4;
  v8 = &v6[v7];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809220);
  v10 = *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64);
  MEMORY[0x24BDAC7A8](v9);
  v60 = v10;
  v61 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_237704484();
  v11 = sub_237704490();
  v12 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v59 = v11;
  v12((char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v11);
  v58 = (uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v12;
  v13 = sub_237704514();
  v68 = *(char **)(*(_QWORD *)(v13 - 8) + 64);
  MEMORY[0x24BDAC7A8](v13);
  v67 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2377044D8();
  v53 = v8;
  v15 = sub_23770455C();
  v65 = &v6[*(int *)(v4 + 24)];
  v74 = 0;
  MEMORY[0x24BDAC7A8](v15);
  sub_237704484();
  v12((char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v11);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  v17 = *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64);
  MEMORY[0x24BDAC7A8](v16);
  v57 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  v18 = (char *)&v51 - v57;
  v19 = sub_23770449C();
  v56 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20 = v56(v18, 1, 1, v19);
  MEMORY[0x24BDAC7A8](v20);
  sub_2377044D8();
  v21 = sub_237704544();
  MEMORY[0x24BDAC7A8](v21);
  sub_237704538();
  sub_2376FDBBC();
  v22 = v63;
  v23 = sub_237704574();
  v24 = *((int *)v62 + 7);
  v62 = v6;
  v25 = &v6[v24];
  v73 = 0;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v51 - v61;
  sub_237704484();
  v27 = v58(v26, 0, 1, v59);
  MEMORY[0x24BDAC7A8](v27);
  v28 = v56((char *)&v51 - v57, 1, 1, v19);
  MEMORY[0x24BDAC7A8](v28);
  v29 = sub_2377044D8();
  MEMORY[0x24BDAC7A8](v29);
  sub_237704538();
  sub_2376FDC00();
  sub_237704574();
  __swift_project_boxed_opaque_existential_1(v22, v22[3]);
  sub_2376FECAC();
  v30 = v64;
  sub_2377047A8();
  if (v30)
  {
    v31 = (uint64_t)v62;
  }
  else
  {
    v68 = v25;
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
    v33 = *(_QWORD *)(v32 - 8);
    MEMORY[0x24BDAC7A8](v32);
    v35 = (char *)&v51 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
    v72 = 0;
    sub_2376FED90(&qword_256809278, &qword_256809260, MEMORY[0x24BE08930]);
    sub_237704754();
    v31 = (uint64_t)v62;
    (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v62, v35, v32);
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    v37 = *(_QWORD *)(v36 - 8);
    MEMORY[0x24BDAC7A8](v36);
    v39 = (char *)&v51 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    v71 = 1;
    sub_2376FED90(&qword_256809280, &qword_256809248, MEMORY[0x24BE08900]);
    sub_237704754();
    (*(void (**)(char *, char *, uint64_t))(v37 + 40))(v53, v39, v36);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
    v41 = *(_QWORD *)(v40 - 8);
    MEMORY[0x24BDAC7A8](v40);
    v43 = (char *)&v51 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
    v70 = 2;
    sub_2376FED90(&qword_256809290, &qword_256809288, MEMORY[0x24BE08930]);
    sub_237704754();
    (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v65, v43, v40);
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
    v46 = *(_QWORD *)(v45 - 8);
    MEMORY[0x24BDAC7A8](v45);
    v48 = (char *)&v51 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    v69 = 3;
    sub_2376FED90(&qword_2568092A0, &qword_256809298, MEMORY[0x24BE08930]);
    v49 = v55;
    v50 = v66;
    sub_237704754();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v50, v49);
    (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v68, v48, v45);
    sub_2376FEDD0(v31, v52);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return sub_2376FED10(v31);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2376FECAC()
{
  unint64_t result;

  result = qword_256809270;
  if (!qword_256809270)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704F04, &type metadata for InsertCall.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256809270);
  }
  return result;
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

uint64_t sub_2376FED10(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InsertCall();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81B1DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2376FED90(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B81B1E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2376FEDD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InsertCall();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2376FEE14()
{
  return sub_2376FEF18((unint64_t *)&unk_2568092A8, (uint64_t)&protocol conformance descriptor for InsertCall);
}

uint64_t sub_2376FEE38()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_2376FE374;
  v2[5] = v0;
  return swift_task_switch();
}

uint64_t sub_2376FEE94()
{
  return sub_2376FEF18(&qword_2568092B8, (uint64_t)&protocol conformance descriptor for InsertCall);
}

uint64_t sub_2376FEEB8()
{
  return sub_2377044B4();
}

uint64_t sub_2376FEECC()
{
  return sub_2377044A8();
}

uint64_t sub_2376FEEE0()
{
  return sub_2377044C0();
}

uint64_t sub_2376FEEF4()
{
  return sub_2376FEF18(&qword_2568092C0, (uint64_t)&protocol conformance descriptor for InsertCall);
}

uint64_t sub_2376FEF18(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for InsertCall();
    result = MEMORY[0x23B81B1E8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2376FEF5C()
{
  return sub_23770452C();
}

uint64_t sub_2376FEF70()
{
  return sub_237704520();
}

uint64_t sub_2376FEF84@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InsertCall.init(from:)(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for InsertCall(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  }
  return a1;
}

uint64_t destroy for InsertCall(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for InsertCall(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for InsertCall(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t initializeWithTake for InsertCall(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t assignWithTake for InsertCall(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsertCall()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376FF528(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = a3[5];
    }
    else
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
      v12 = *(_QWORD *)(v14 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v8 = v14;
        v13 = a3[6];
      }
      else
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
        v12 = *(_QWORD *)(v8 - 8);
        v13 = a3[7];
      }
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for InsertCall()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2376FF600(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809260);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[5];
    }
    else
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809288);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[6];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809298);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[7];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_2376FF6D4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_2376FF7F0(319, &qword_256809330, MEMORY[0x24BEE1768], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BE08920]);
  if (v0 <= 0x3F)
  {
    sub_2376FF7F0(319, &qword_256809338, MEMORY[0x24BEE1328], MEMORY[0x24BE088F0]);
    if (v1 <= 0x3F)
    {
      sub_2376FF7F0(319, &qword_256809340, (uint64_t)&type metadata for InputSimNum, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BE08920]);
      if (v2 <= 0x3F)
      {
        sub_2376FF7F0(319, qword_256809348, (uint64_t)&type metadata for InputScreenShareType, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BE08920]);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_2376FF7F0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t getEnumTagSinglePayload for InsertCall.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InsertCall.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2376FF910 + 4 * byte_237704D39[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2376FF944 + 4 * byte_237704D34[v4]))();
}

uint64_t sub_2376FF944(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376FF94C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2376FF954);
  return result;
}

uint64_t sub_2376FF960(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2376FF968);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2376FF96C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2376FF974(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InsertCall.CodingKeys()
{
  return &type metadata for InsertCall.CodingKeys;
}

unint64_t sub_2376FF994()
{
  unint64_t result;

  result = qword_256809380;
  if (!qword_256809380)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704EDC, &type metadata for InsertCall.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256809380);
  }
  return result;
}

unint64_t sub_2376FF9DC()
{
  unint64_t result;

  result = qword_256809388;
  if (!qword_256809388)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704E4C, &type metadata for InsertCall.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256809388);
  }
  return result;
}

unint64_t sub_2376FFA24()
{
  unint64_t result;

  result = qword_256809390;
  if (!qword_256809390)
  {
    result = MEMORY[0x23B81B1E8](&unk_237704E74, &type metadata for InsertCall.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256809390);
  }
  return result;
}

uint64_t sub_2376FFA68(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x746E756F63 && a2 == 0xE500000000000000;
  if (v2 || (sub_23770476C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746361736E617274 && a2 == 0xEB000000006E6F69 || (sub_23770476C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x44496D6973 && a2 == 0xE500000000000000 || (sub_23770476C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x68536E6565726373 && a2 == 0xEF65707954657261)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23770476C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2376FFC4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568091C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2376FFC8C()
{
  unint64_t result;

  result = qword_256809398;
  if (!qword_256809398)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256809398);
  }
  return result;
}

uint64_t ReplaceDatabase.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t v20;
  unint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093A0);
  v0 = *(_QWORD *)(sub_237704508() - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(unsigned __int8 *)(v0 + 80);
  v23 = v2 | 7;
  v24 = ((v2 + 32) & ~v2) + 2 * v1;
  v22 = xmmword_237704D10;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_237704D10;
  sub_2377044F0();
  sub_2377044E4();
  v3 = sub_237704514();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  MEMORY[0x24BDAC7A8](v3);
  v21 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2377044CC();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809220);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  MEMORY[0x24BDAC7A8](v5);
  v20 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&v18 - v20;
  sub_237704484();
  v8 = sub_237704490();
  v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  v19(v7, 0, 1, v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23770449C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = sub_237704544();
  MEMORY[0x24BDAC7A8](v13);
  sub_237704538();
  sub_237704580();
  type metadata accessor for ReplaceDatabase();
  *(_OWORD *)(swift_allocObject() + 16) = v22;
  sub_2377044F0();
  v14 = sub_2377044E4();
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_2377044CC();
  MEMORY[0x24BDAC7A8](v15);
  v16 = (char *)&v18 - v20;
  sub_237704484();
  v19(v16, 0, 1, v8);
  return sub_23770455C();
}

uint64_t type metadata accessor for ReplaceDatabase()
{
  uint64_t result;

  result = qword_256809458;
  if (!qword_256809458)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ReplaceDatabase.run()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[19] = v0;
  v2 = sub_2377042B0();
  v1[20] = v2;
  v1[21] = *(_QWORD *)(v2 - 8);
  v1[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568091D0);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v3 = sub_237704334();
  v1[26] = v3;
  v1[27] = *(_QWORD *)(v3 - 8);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237700178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  id v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id v25;
  unint64_t v26;
  id v27;
  void *v28;
  unsigned int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  unint64_t v64;
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
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  unsigned int v98;
  void *v99;
  id v100;
  id v101;
  void *v102;
  void *v103;
  unsigned int v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  uint64_t v117;
  id v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(uint64_t, uint64_t);
  uint64_t v128;
  void (*v129)(uint64_t, unint64_t, uint64_t);
  void (*v130)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v131)(uint64_t, uint64_t, uint64_t);
  void (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t, uint64_t, uint64_t);
  unsigned int v134;
  uint64_t v135;
  unint64_t v136;
  void *v137;
  void (*v138)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 176);
  v6 = *(_QWORD *)(v0 + 160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  sub_237704568();
  v138 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
  v138(v3, 1, 1, v1);
  v7 = *MEMORY[0x24BDCD7A0];
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104);
  v8(v4, v7, v6);
  sub_237704310();
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_defaultManager);
  sub_237704304();
  v11 = (void *)sub_2377045D4();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_fileExistsAtPath_, v11);

  if (!v12)
  {
    v65 = *(_QWORD *)(v0 + 256);
    v66 = *(_QWORD *)(v0 + 208);
    v67 = *(_QWORD *)(v0 + 216);
    sub_237704724();
    swift_bridgeObjectRelease();
    sub_237701994(&qword_2568093B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    sub_237704760();
    sub_237704628();
    swift_bridgeObjectRelease();
    sub_237704628();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_237704D00;
    *(_QWORD *)(v68 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v68 + 32) = 0xD000000000000014;
    *(_QWORD *)(v68 + 40) = 0x8000000237705A80;
    swift_bridgeObjectRetain();
    sub_237704778();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v65, v66);
LABEL_36:
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
  v13 = *(_QWORD *)(v0 + 240);
  v14 = *(_QWORD *)(v0 + 216);
  v135 = *(_QWORD *)(v0 + 208);
  v137 = v9;
  v15 = *(_QWORD *)(v0 + 168);
  v16 = *(_QWORD *)(v0 + 176);
  v17 = *(_QWORD *)(v0 + 160);
  sub_2377042D4();
  *(_QWORD *)(v0 + 32) = 0x6C74636863;
  *(_QWORD *)(v0 + 40) = 0xE500000000000000;
  v134 = v7;
  v133 = v8;
  v8(v16, v7, v17);
  sub_237701148();
  sub_237704328();
  v132 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v132(v16, v17);
  swift_bridgeObjectRelease();
  v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v18(v13, v135);
  v19 = objc_msgSend(v137, sel_defaultManager);
  sub_237704304();
  v20 = (void *)sub_2377045D4();
  swift_bridgeObjectRelease();
  LODWORD(v13) = objc_msgSend(v19, sel_fileExistsAtPath_, v20);

  if ((_DWORD)v13)
  {
    v21 = objc_msgSend(v137, sel_defaultManager);
    v22 = (void *)sub_2377042E0();
    *(_QWORD *)(v0 + 136) = 0;
    v23 = objc_msgSend(v21, sel_removeItemAtURL_error_, v22, v0 + 136);

    v24 = *(void **)(v0 + 136);
    if (!v23)
    {
      v88 = *(_QWORD *)(v0 + 248);
      v87 = *(_QWORD *)(v0 + 256);
      v89 = *(_QWORD *)(v0 + 208);
      v90 = v24;
      sub_2377042A4();

      swift_willThrow();
      v18(v88, v89);
      v18(v87, v89);
      goto LABEL_36;
    }
    v25 = v24;
  }
  type metadata accessor for ReplaceDatabase();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  sub_237704550();
  if (*(_BYTE *)(v0 + 264))
    v26 = 0xEF706D655479726FLL;
  else
    v26 = 0xEB0000000079726FLL;
  v27 = objc_msgSend(v137, sel_defaultManager);
  v28 = (void *)sub_2377042E0();
  *(_QWORD *)(v0 + 104) = 0;
  v29 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v0 + 104);

  v30 = *(void **)(v0 + 104);
  v31 = *(_QWORD *)(v0 + 248);
  v32 = *(_QWORD *)(v0 + 256);
  if (!v29)
  {
    v85 = *(_QWORD *)(v0 + 208);
    v86 = v30;
    swift_bridgeObjectRelease();
    sub_2377042A4();

    swift_willThrow();
    v18(v31, v85);
    v18(v32, v85);
    goto LABEL_36;
  }
  v33 = *(_QWORD *)(v0 + 240);
  v127 = v18;
  v34 = *(_QWORD *)(v0 + 208);
  v35 = *(_QWORD *)(v0 + 176);
  v36 = *(_QWORD *)(v0 + 160);
  v37 = v30;
  v38 = objc_msgSend(v137, sel_defaultManager);
  v39 = (void *)sub_2377042E0();
  v136 = v26;
  swift_bridgeObjectRetain();
  sub_237704628();
  *(_QWORD *)(v0 + 80) = 0x747369486C6C6143;
  *(_QWORD *)(v0 + 88) = v26;
  v133(v35, v134, v36);
  sub_237704328();
  v132(v35, v36);
  swift_bridgeObjectRelease();
  v40 = (void *)sub_2377042E0();
  v41 = v34;
  v42 = v127;
  v127(v33, v41);
  *(_QWORD *)(v0 + 96) = 0;
  LODWORD(v33) = objc_msgSend(v38, sel_copyItemAtURL_toURL_error_, v39, v40, v0 + 96);

  v43 = *(id *)(v0 + 96);
  if (!(_DWORD)v33)
  {
    v91 = v43;
    v93 = *(_QWORD *)(v0 + 248);
    v92 = *(_QWORD *)(v0 + 256);
    v94 = *(_QWORD *)(v0 + 208);
    swift_bridgeObjectRelease();
    sub_2377042A4();

    swift_willThrow();
    v127(v93, v94);
    v95 = v92;
    goto LABEL_34;
  }
  v44 = (id)getMobileUserLibraryDirectoryPath();
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)(v0 + 240);
    v47 = *(_QWORD *)(v0 + 208);
    v48 = *(_QWORD *)(v0 + 216);
    v49 = *(_QWORD *)(v0 + 192);
    sub_2377042F8();

    v130 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
    v130(v49, v46, v47);
    v138(v49, 0, 1, v47);
    v131 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
    result = v131(v49, 1, v47);
    if ((_DWORD)result != 1)
    {
      v51 = *(_QWORD *)(v0 + 208);
      v52 = *(_QWORD *)(v0 + 192);
      v53 = *(_QWORD *)(v0 + 176);
      v54 = *(_QWORD *)(v0 + 160);
      strcpy((char *)(v0 + 64), "CallHistoryDB");
      *(_WORD *)(v0 + 78) = -4864;
      v133(v53, v134, v54);
      sub_23770431C();
      v132(v53, v54);
      swift_bridgeObjectRelease();
      v127(v52, v51);
      v55 = objc_msgSend(v137, sel_defaultManager);
      v56 = (void *)sub_2377042E0();
      *(_QWORD *)(v0 + 112) = 0;
      v57 = objc_msgSend(v55, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v56, 0, 0, v0 + 112);

      v58 = *(void **)(v0 + 112);
      if (v57)
      {
        v59 = sub_237704670();
        v60 = v58;

        v61 = *(_QWORD *)(v59 + 16);
        v62 = v138;
        if (v61)
        {
          v63 = *(_QWORD *)(v0 + 216);
          v64 = v59 + ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80));
          v128 = *(_QWORD *)(v63 + 72);
          v129 = *(void (**)(uint64_t, unint64_t, uint64_t))(v63 + 16);
          while (1)
          {
            v69 = *(_QWORD *)(v0 + 208);
            v70 = *(_QWORD *)(v0 + 184);
            v129(v70, v64, v69);
            v62(v70, 0, 1, v69);
            if (v131(v70, 1, v69) == 1)
              break;
            v71 = *(_QWORD *)(v0 + 240);
            v72 = *(_QWORD *)(v0 + 208);
            v130(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 184), v72);
            sub_2377042EC();
            v73 = sub_2377042C8();
            v75 = v74;
            v42(v71, v72);
            if (v73 == 0x747369486C6C6143 && v75 == v136 || (sub_23770476C() & 1) != 0)
            {
              v42(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 208));
              swift_bridgeObjectRelease();
            }
            else
            {
              v76 = *(_QWORD *)(v0 + 240);
              v126 = *(_QWORD *)(v0 + 208);
              v77 = *(_QWORD *)(v0 + 176);
              v125 = *(_QWORD *)(v0 + 160);
              __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
              v78 = swift_allocObject();
              *(_OWORD *)(v78 + 16) = xmmword_237704D00;
              sub_237704724();
              swift_bridgeObjectRelease();
              sub_237704628();
              swift_bridgeObjectRelease();
              *(_QWORD *)(v78 + 56) = MEMORY[0x24BEE0D00];
              *(_QWORD *)(v78 + 32) = 0xD000000000000010;
              *(_QWORD *)(v78 + 40) = 0x8000000237705AE0;
              sub_237704778();
              swift_bridgeObjectRelease();
              v79 = objc_msgSend(v137, sel_defaultManager);
              v80 = (void *)sub_2377042E0();
              *(_QWORD *)(v0 + 48) = sub_2377042C8();
              *(_QWORD *)(v0 + 56) = v81;
              v133(v77, v134, v125);
              sub_237704328();
              v132(v77, v125);
              swift_bridgeObjectRelease();
              v82 = (void *)sub_2377042E0();
              v83 = v76;
              v42 = v127;
              v127(v83, v126);
              *(_QWORD *)(v0 + 144) = 0;
              LODWORD(v77) = objc_msgSend(v79, sel_copyItemAtURL_toURL_error_, v80, v82, v0 + 144);

              v84 = *(id *)(v0 + 144);
              if (!(_DWORD)v77)
              {
                v119 = v84;
                v121 = *(_QWORD *)(v0 + 248);
                v120 = *(_QWORD *)(v0 + 256);
                v123 = *(_QWORD *)(v0 + 224);
                v122 = *(_QWORD *)(v0 + 232);
                v124 = *(_QWORD *)(v0 + 208);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_2377042A4();

                swift_willThrow();
                v127(v123, v124);
                v127(v122, v124);
                v127(v121, v124);
                v127(v120, v124);
                goto LABEL_36;
              }
              v127(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 208));
              v62 = v138;
            }
            v64 += v128;
            if (!--v61)
              goto LABEL_27;
          }
        }
        else
        {
LABEL_27:
          v62(*(_QWORD *)(v0 + 184), 1, 1, *(_QWORD *)(v0 + 208));
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v96 = objc_msgSend(v137, sel_defaultManager);
        v97 = (void *)sub_2377042E0();
        *(_QWORD *)(v0 + 120) = 0;
        v98 = objc_msgSend(v96, sel_removeItemAtURL_error_, v97, v0 + 120);

        v99 = *(void **)(v0 + 120);
        if (v98)
        {
          v100 = v99;
          v101 = objc_msgSend(v137, sel_defaultManager);
          v102 = (void *)sub_2377042E0();
          v103 = (void *)sub_2377042E0();
          *(_QWORD *)(v0 + 128) = 0;
          v104 = objc_msgSend(v101, sel_copyItemAtURL_toURL_error_, v102, v103, v0 + 128);

          v105 = *(void **)(v0 + 128);
          v107 = *(_QWORD *)(v0 + 248);
          v106 = *(_QWORD *)(v0 + 256);
          v108 = *(_QWORD *)(v0 + 232);
          v109 = *(_QWORD *)(v0 + 208);
          if (v104)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
            v110 = swift_allocObject();
            *(_OWORD *)(v110 + 16) = xmmword_237704D00;
            v111 = v105;
            sub_237704724();
            swift_bridgeObjectRelease();
            sub_237701994(&qword_2568093B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
            sub_237704760();
            sub_237704628();
            swift_bridgeObjectRelease();
            sub_237704628();
            sub_237704760();
            sub_237704628();
            swift_bridgeObjectRelease();
            sub_237704628();
            *(_QWORD *)(v110 + 56) = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v110 + 32) = 0xD000000000000010;
            *(_QWORD *)(v110 + 40) = 0x8000000237705AC0;
            sub_237704778();
            swift_bridgeObjectRelease();
            v42(v108, v109);
            v42(v107, v109);
            v42(v106, v109);
            goto LABEL_36;
          }
          v118 = v105;
          sub_2377042A4();

          swift_willThrow();
          v42(v108, v109);
          v42(v107, v109);
          v95 = v106;
          v117 = v109;
LABEL_35:
          v42(v95, v117);
          goto LABEL_36;
        }
        v113 = *(_QWORD *)(v0 + 248);
        v112 = *(_QWORD *)(v0 + 256);
        v114 = *(_QWORD *)(v0 + 232);
        v94 = *(_QWORD *)(v0 + 208);
        v116 = v99;
        sub_2377042A4();

      }
      else
      {
        v113 = *(_QWORD *)(v0 + 248);
        v112 = *(_QWORD *)(v0 + 256);
        v114 = *(_QWORD *)(v0 + 232);
        v94 = *(_QWORD *)(v0 + 208);
        v115 = v58;
        swift_bridgeObjectRelease();
        sub_2377042A4();

      }
      swift_willThrow();
      v42(v114, v94);
      v42(v113, v94);
      v95 = v112;
LABEL_34:
      v117 = v94;
      goto LABEL_35;
    }
  }
  else
  {
    result = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))v138)(*(_QWORD *)(v0 + 192), 1, 1, *(_QWORD *)(v0 + 208));
  }
  __break(1u);
  return result;
}

unint64_t sub_237701148()
{
  unint64_t result;

  result = qword_2568093C0;
  if (!qword_2568093C0)
  {
    result = MEMORY[0x23B81B1E8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2568093C0);
  }
  return result;
}

uint64_t sub_23770118C()
{
  _BYTE *v0;

  if (*v0)
    return 0x546563616C706572;
  else
    return 1701603686;
}

uint64_t sub_2377011C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_237702080(a1, a2);
  *a3 = result;
  return result;
}

void sub_2377011EC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2377011F8()
{
  sub_237701808();
  return sub_2377047B4();
}

uint64_t sub_237701220()
{
  sub_237701808();
  return sub_2377047C0();
}

uint64_t ReplaceDatabase.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  char *v56;
  char v57;
  char v58;

  v55 = a1;
  v42 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093C8);
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v54 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = type metadata accessor for ReplaceDatabase();
  MEMORY[0x24BDAC7A8](v53);
  v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093A0);
  v6 = *(_QWORD *)(sub_237704508() - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v48 = v7;
  v50 = v8 | 7;
  v51 = ((v8 + 32) & ~v8) + 2 * v7;
  v9 = swift_allocObject();
  v49 = xmmword_237704D10;
  *(_OWORD *)(v9 + 16) = xmmword_237704D10;
  sub_2377044F0();
  sub_2377044E4();
  v10 = sub_237704514();
  v11 = *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  MEMORY[0x24BDAC7A8](v10);
  v47 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_2377044CC();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809220);
  v13 = *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64);
  MEMORY[0x24BDAC7A8](v12);
  v46 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  v14 = (char *)&v41 - v46;
  sub_237704484();
  v15 = sub_237704490();
  v45 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v45(v14, 0, 1, v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_23770449C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  v20 = sub_237704544();
  MEMORY[0x24BDAC7A8](v20);
  sub_237704538();
  v21 = (uint64_t)v5;
  sub_237704580();
  v22 = &v5[*(int *)(v53 + 20)];
  *(_OWORD *)(swift_allocObject() + 16) = v49;
  sub_2377044F0();
  v23 = sub_2377044E4();
  MEMORY[0x24BDAC7A8](v23);
  v24 = sub_2377044CC();
  v25 = v54;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v41 - v46;
  sub_237704484();
  v27 = v15;
  v28 = v55;
  v45(v26, 0, 1, v27);
  sub_23770455C();
  __swift_project_boxed_opaque_existential_1(v28, v28[3]);
  sub_237701808();
  v29 = v56;
  sub_2377047A8();
  if (!v29)
  {
    v56 = v22;
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
    v31 = *(_QWORD *)(v30 - 8);
    MEMORY[0x24BDAC7A8](v30);
    v33 = (char *)&v41 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    v58 = 0;
    sub_2376FED90((unint64_t *)&qword_2568093D8, &qword_2568093B0, MEMORY[0x24BE08930]);
    sub_237704754();
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 40))(v21, v33, v30);
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    v35 = *(_QWORD *)(v34 - 8);
    MEMORY[0x24BDAC7A8](v34);
    v37 = (char *)&v41 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    v57 = 1;
    sub_2376FED90(&qword_256809280, &qword_256809248, MEMORY[0x24BE08900]);
    v38 = v25;
    v39 = v44;
    sub_237704754();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v38, v39);
    (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v56, v37, v34);
    sub_237701888(v21, v42);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return sub_23770184C(v21);
}

unint64_t sub_237701808()
{
  unint64_t result;

  result = qword_2568093D0;
  if (!qword_2568093D0)
  {
    result = MEMORY[0x23B81B1E8](&unk_237705138, &type metadata for ReplaceDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568093D0);
  }
  return result;
}

uint64_t sub_23770184C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ReplaceDatabase();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_237701888(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReplaceDatabase();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2377018CC()
{
  return sub_237701994((unint64_t *)&unk_2568093E0, (uint64_t (*)(uint64_t))type metadata accessor for ReplaceDatabase, (uint64_t)&protocol conformance descriptor for ReplaceDatabase);
}

uint64_t sub_2377018F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2376FE374;
  return ReplaceDatabase.run()();
}

uint64_t sub_23770193C()
{
  return sub_237701994(&qword_2568093F0, (uint64_t (*)(uint64_t))type metadata accessor for ReplaceDatabase, (uint64_t)&protocol conformance descriptor for ReplaceDatabase);
}

uint64_t sub_237701968()
{
  return sub_237701994(&qword_2568093F8, (uint64_t (*)(uint64_t))type metadata accessor for ReplaceDatabase, (uint64_t)&protocol conformance descriptor for ReplaceDatabase);
}

uint64_t sub_237701994(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B81B1E8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2377019D8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ReplaceDatabase.init(from:)(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for ReplaceDatabase(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for ReplaceDatabase(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for ReplaceDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ReplaceDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ReplaceDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ReplaceDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplaceDatabase()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237701D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ReplaceDatabase()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237701DA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809248);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_237701E28()
{
  unint64_t v0;
  unint64_t v1;

  sub_2376FF7F0(319, qword_256809468, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BE08920]);
  if (v0 <= 0x3F)
  {
    sub_2376FF7F0(319, &qword_256809338, MEMORY[0x24BEE1328], MEMORY[0x24BE088F0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t storeEnumTagSinglePayload for ReplaceDatabase.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237701F28 + 4 * byte_237704F65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_237701F5C + 4 * byte_237704F60[v4]))();
}

uint64_t sub_237701F5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237701F64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237701F6CLL);
  return result;
}

uint64_t sub_237701F78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237701F80);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_237701F84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237701F8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplaceDatabase.CodingKeys()
{
  return &type metadata for ReplaceDatabase.CodingKeys;
}

unint64_t sub_237701FAC()
{
  unint64_t result;

  result = qword_256809498;
  if (!qword_256809498)
  {
    result = MEMORY[0x23B81B1E8](&unk_237705110, &type metadata for ReplaceDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256809498);
  }
  return result;
}

unint64_t sub_237701FF4()
{
  unint64_t result;

  result = qword_2568094A0;
  if (!qword_2568094A0)
  {
    result = MEMORY[0x23B81B1E8](&unk_237705080, &type metadata for ReplaceDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568094A0);
  }
  return result;
}

unint64_t sub_23770203C()
{
  unint64_t result;

  result = qword_2568094A8;
  if (!qword_2568094A8)
  {
    result = MEMORY[0x23B81B1E8](&unk_2377050A8, &type metadata for ReplaceDatabase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568094A8);
  }
  return result;
}

uint64_t sub_237702080(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701603686 && a2 == 0xE400000000000000;
  if (v2 || (sub_23770476C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x546563616C706572 && a2 == 0xEB00000000706D65)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23770476C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_237702178()
{
  return swift_continuation_resume();
}

uint64_t ImportFile.init()()
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
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568093A0);
  sub_237704508();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_237704D10;
  sub_2377044F0();
  sub_2377044E4();
  v0 = sub_237704514();
  MEMORY[0x24BDAC7A8](v0);
  sub_2377044CC();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809220);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237704484();
  v4 = sub_237704490();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 0, 1, v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23770449C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = sub_237704544();
  MEMORY[0x24BDAC7A8](v9);
  sub_237704538();
  return sub_237704580();
}

uint64_t ImportFile.run()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[22] = v0;
  v2 = sub_2377042B0();
  v1[23] = v2;
  v1[24] = *(_QWORD *)(v2 - 8);
  v1[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568091D0);
  v1[26] = swift_task_alloc();
  v3 = sub_237704334();
  v1[27] = v3;
  v1[28] = *(_QWORD *)(v3 - 8);
  v1[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_237702454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  sub_237704568();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v3, 1, 1, v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, *MEMORY[0x24BDCD7A0], v6);
  sub_237704310();
  v7 = sub_237704340();
  *(_QWORD *)(v0 + 240) = v7;
  *(_QWORD *)(v0 + 248) = v8;
  v9 = v7;
  v10 = v8;
  sub_237702938(0, &qword_2568094B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568094C0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_237704D10;
  *(_QWORD *)(v11 + 32) = sub_237702938(0, &qword_2568094C8);
  *(_QWORD *)(v11 + 40) = sub_237702938(0, (unint64_t *)&qword_256809398);
  sub_2377046D0();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568094D8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE14938]), sel_init);
      *(_QWORD *)(v0 + 256) = v12;
      v13 = sub_237704664();
      *(_QWORD *)(v0 + 264) = v13;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_237702860;
      v14 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      v15 = (_QWORD *)(v0 + 80);
      v15[1] = 0x40000000;
      v15[2] = sub_237702178;
      v15[3] = &block_descriptor_0;
      v15[4] = v14;
      objc_msgSend(v12, sel_addArrayToCallHistory_withCompletion_, v13, v15);
      return swift_continuation_await();
    }
  }
  else
  {
    sub_2377029B4(v0 + 120);
  }
  v18 = *(_QWORD *)(v0 + 224);
  v17 = *(_QWORD *)(v0 + 232);
  v19 = *(_QWORD *)(v0 + 216);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_237704D00;
  sub_237704724();
  sub_237704628();
  sub_237701994(&qword_2568093B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v20 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v20 + 32) = 0;
  *(_QWORD *)(v20 + 40) = 0xE000000000000000;
  sub_237704778();
  sub_237702970(v9, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237702860()
{
  return swift_task_switch();
}

uint64_t sub_2377028AC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 216);

  sub_237702970(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_237702938(uint64_t a1, unint64_t *a2)
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

uint64_t sub_237702970(uint64_t a1, unint64_t a2)
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

uint64_t sub_2377029B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568094D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2377029F4()
{
  return 1;
}

uint64_t sub_2377029FC()
{
  sub_237704784();
  sub_237704790();
  return sub_23770479C();
}

uint64_t sub_237702A3C()
{
  return sub_237704790();
}

uint64_t sub_237702A60()
{
  sub_237704784();
  sub_237704790();
  return sub_23770479C();
}

uint64_t sub_237702A9C()
{
  return 1701603686;
}

uint64_t sub_237702AAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 1701603686 && a2 == 0xE400000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_23770476C();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_237702B30(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_237702B3C()
{
  sub_237702F90();
  return sub_2377047B4();
}

uint64_t sub_237702B64()
{
  sub_237702F90();
  return sub_2377047C0();
}

uint64_t ImportFile.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a2;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568094E0);
  v27 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ImportFile();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568093A0);
  sub_237704508();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_237704D10;
  sub_2377044F0();
  sub_2377044E4();
  v9 = sub_237704514();
  MEMORY[0x24BDAC7A8](v9);
  sub_2377044CC();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809220);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237704484();
  v13 = sub_237704490();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 0, 1, v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256809228);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23770449C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  v18 = sub_237704544();
  MEMORY[0x24BDAC7A8](v18);
  sub_237704538();
  sub_237704580();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237702F90();
  sub_2377047A8();
  if (!v2)
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
    v25[1] = v25;
    v20 = *(_QWORD *)(v19 - 8);
    MEMORY[0x24BDAC7A8](v19);
    v22 = (char *)v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_237703010();
    v23 = v28;
    sub_237704754();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v23);
    (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v8, v22, v19);
    sub_23770305C((uint64_t)v8, v26);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_237702FD4((uint64_t)v8);
}

uint64_t type metadata accessor for ImportFile()
{
  uint64_t result;

  result = qword_256809568;
  if (!qword_256809568)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_237702F90()
{
  unint64_t result;

  result = qword_2568094E8;
  if (!qword_2568094E8)
  {
    result = MEMORY[0x23B81B1E8](&unk_237705364, &type metadata for ImportFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568094E8);
  }
  return result;
}

uint64_t sub_237702FD4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ImportFile();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_237703010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568093D8;
  if (!qword_2568093D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2568093B0);
    result = MEMORY[0x23B81B1E8](MEMORY[0x24BE08930], v1);
    atomic_store(result, (unint64_t *)&qword_2568093D8);
  }
  return result;
}

uint64_t sub_23770305C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ImportFile();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2377030A0()
{
  return sub_237701994((unint64_t *)&unk_2568094F0, (uint64_t (*)(uint64_t))type metadata accessor for ImportFile, (uint64_t)&protocol conformance descriptor for ImportFile);
}

uint64_t sub_2377030CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2376FE374;
  return ImportFile.run()();
}

uint64_t sub_237703110()
{
  return sub_237701994(&qword_256809500, (uint64_t (*)(uint64_t))type metadata accessor for ImportFile, (uint64_t)&protocol conformance descriptor for ImportFile);
}

uint64_t sub_23770313C()
{
  return sub_237701994(&qword_256809508, (uint64_t (*)(uint64_t))type metadata accessor for ImportFile, (uint64_t)&protocol conformance descriptor for ImportFile);
}

uint64_t sub_23770316C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ImportFile.init(from:)(a1, a2);
}

uint64_t initializeBufferWithCopyOfBuffer for ImportFile(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for ImportFile(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ImportFile(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ImportFile(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ImportFile(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ImportFile(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImportFile()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237703324(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ImportFile()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237703370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568093B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_2377033B4()
{
  unint64_t v0;

  sub_23770341C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23770341C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256809468[0])
  {
    v0 = sub_23770458C();
    if (!v1)
      atomic_store(v0, qword_256809468);
  }
}

uint64_t getEnumTagSinglePayload for ImportFile.CodingKeys(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for ImportFile.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_237703504 + 4 * byte_237705190[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_237703524 + 4 * byte_237705195[v4]))();
}

_BYTE *sub_237703504(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_237703524(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23770352C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_237703534(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23770353C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_237703544(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_237703550()
{
  return 0;
}

ValueMetadata *type metadata accessor for ImportFile.CodingKeys()
{
  return &type metadata for ImportFile.CodingKeys;
}

unint64_t sub_23770356C()
{
  unint64_t result;

  result = qword_2568095A0;
  if (!qword_2568095A0)
  {
    result = MEMORY[0x23B81B1E8](&unk_23770533C, &type metadata for ImportFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568095A0);
  }
  return result;
}

unint64_t sub_2377035B4()
{
  unint64_t result;

  result = qword_2568095A8;
  if (!qword_2568095A8)
  {
    result = MEMORY[0x23B81B1E8](&unk_2377052AC, &type metadata for ImportFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568095A8);
  }
  return result;
}

unint64_t sub_2377035FC()
{
  unint64_t result;

  result = qword_2568095B0;
  if (!qword_2568095B0)
  {
    result = MEMORY[0x23B81B1E8](&unk_2377052D4, &type metadata for ImportFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2568095B0);
  }
  return result;
}

uint64_t ExportFile.run()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_2377042B0();
  v0[5] = v1;
  v0[6] = *(_QWORD *)(v1 - 8);
  v0[7] = swift_task_alloc();
  v2 = sub_237704424();
  v0[8] = v2;
  v0[9] = *(_QWORD *)(v2 - 8);
  v0[10] = swift_task_alloc();
  v3 = sub_237704334();
  v0[11] = v3;
  v0[12] = *(_QWORD *)(v3 - 8);
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23770372C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(v0 + 104);
  v29 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80);
  v30 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 40);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v9 = objc_msgSend(v8, sel_temporaryDirectory);

  sub_2377042F8();
  sub_237704418();
  sub_237703B38();
  v31 = sub_237704760();
  v32 = v10;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_237704628();
  *(_QWORD *)(v0 + 16) = v31;
  *(_QWORD *)(v0 + 24) = v32;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v6, *MEMORY[0x24BDCD7A0], v7);
  sub_237701148();
  v11 = MEMORY[0x24BEE0D00];
  sub_23770431C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v12 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v12(v1, v30);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE14938]), sel_init);
  sub_237703CF4(v13);
  v14 = (void *)objc_opt_self();
  sub_2376FFC8C();
  v15 = (void *)sub_237704664();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 32) = 0;
  v16 = objc_msgSend(v14, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v15, 1, v0 + 32);

  v17 = *(id *)(v0 + 32);
  v18 = *(_QWORD *)(v0 + 112);
  if (v16)
  {
    v19 = sub_23770434C();
    v21 = v20;

    sub_237704358();
    v22 = *(_QWORD *)(v0 + 112);
    v28 = *(_QWORD *)(v0 + 88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
    v25 = v12;
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_237704D00;
    sub_237704724();
    swift_bridgeObjectRelease();
    sub_2377042BC();
    sub_237704628();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v26 + 56) = v11;
    *(_QWORD *)(v26 + 32) = 0xD00000000000001BLL;
    *(_QWORD *)(v26 + 40) = 0x8000000237705B60;
    sub_237704778();
    swift_bridgeObjectRelease();
    sub_237702970(v19, v21);

    v25(v22, v28);
  }
  else
  {
    v23 = v17;
    v24 = *(_QWORD *)(v0 + 88);
    sub_2377042A4();

    swift_willThrow();
    v12(v18, v24);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_237703B38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2568095C0;
  if (!qword_2568095C0)
  {
    v1 = sub_237704424();
    result = MEMORY[0x23B81B1E8](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_2568095C0);
  }
  return result;
}

uint64_t ExportFile.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

unint64_t sub_237703BA8()
{
  unint64_t result;

  result = qword_2568095C8;
  if (!qword_2568095C8)
  {
    result = MEMORY[0x23B81B1E8](&protocol conformance descriptor for ExportFile, &type metadata for ExportFile);
    atomic_store(result, (unint64_t *)&qword_2568095C8);
  }
  return result;
}

uint64_t sub_237703BEC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2376FE374;
  return ExportFile.run()();
}

unint64_t sub_237703C34()
{
  unint64_t result;

  result = qword_2568095D8;
  if (!qword_2568095D8)
  {
    result = MEMORY[0x23B81B1E8](&protocol conformance descriptor for ExportFile, &type metadata for ExportFile);
    atomic_store(result, (unint64_t *)&qword_2568095D8);
  }
  return result;
}

unint64_t sub_237703C7C()
{
  unint64_t result;

  result = qword_2568095E0;
  if (!qword_2568095E0)
  {
    result = MEMORY[0x23B81B1E8](&protocol conformance descriptor for ExportFile, &type metadata for ExportFile);
    atomic_store(result, (unint64_t *)&qword_2568095E0);
  }
  return result;
}

uint64_t sub_237703CC0(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

ValueMetadata *type metadata accessor for ExportFile()
{
  return &type metadata for ExportFile;
}

id sub_237703CF4(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id result;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(a1, sel_recentCalls);
  if (v2)
  {
    v3 = v2;
    sub_2376FFC8C();
    v4 = sub_237704670();

  }
  else
  {
    v4 = MEMORY[0x24BEE4AF8];
  }
  if (!objc_msgSend(a1, sel_canLoadOlderRecentCalls))
    return (id)v4;
  swift_bridgeObjectRelease();
  result = objc_msgSend(a1, sel_fetchRecentCallsSyncWithCoalescing_, 1);
  if (result)
  {
    v6 = result;
    sub_2376FFC8C();
    v4 = sub_237704670();

    if (objc_msgSend(a1, sel_canLoadOlderRecentCalls))
    {
      v7 = MEMORY[0x24BEE4AF8];
      do
      {
        swift_bridgeObjectRelease();
        v9 = objc_msgSend(a1, sel_loadOlderRecentCalls);
        if (v9)
        {
          v8 = v9;
          v4 = sub_237704670();

        }
        else
        {
          v4 = v7;
        }
      }
      while ((objc_msgSend(a1, sel_canLoadOlderRecentCalls) & 1) != 0);
    }
    return (id)v4;
  }
  __break(1u);
  return result;
}

uint64_t GetRecents.run()()
{
  return swift_task_switch();
}

uint64_t sub_237703E58()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE14938]), sel_init);
  v2 = (unint64_t)sub_237703CF4(v1);
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
    v15 = swift_allocObject();
    v16 = MEMORY[0x24BEE0D00];
    *(_OWORD *)(v15 + 16) = xmmword_237704D00;
    *(_QWORD *)(v15 + 56) = v16;
    *(_QWORD *)(v15 + 32) = 0x736C6C6163206F4ELL;
    *(_QWORD *)(v15 + 40) = 0xE800000000000000;
    sub_237704778();
LABEL_16:
    swift_bridgeObjectRelease();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  v3 = sub_23770473C();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256809218);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_237704D00;
  v17 = v0;
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23770473C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_QWORD *)(v0 + 16) = v5;
  sub_237704760();
  sub_237704628();
  swift_bridgeObjectRelease();
  sub_237704628();
  v6 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 32) = 544501575;
  *(_QWORD *)(v4 + 40) = 0xE400000000000000;
  sub_237704778();
  result = swift_bridgeObjectRelease();
  v8 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
    __break(1u);
  }
  else if (v3 >= 1)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x23B81AF9C](i, v2);
      else
        v10 = *(id *)(v2 + 8 * i + 32);
      v11 = v10;
      v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_237704D00;
      v13 = sub_2376F9E18(v8 == i);
      *(_QWORD *)(v12 + 56) = v6;
      *(_QWORD *)(v12 + 32) = v13;
      *(_QWORD *)(v12 + 40) = v14;
      sub_237704778();
      swift_bridgeObjectRelease();

    }
    swift_bridgeObjectRelease();
    v0 = v17;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t GetRecents.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

unint64_t sub_237704168()
{
  unint64_t result;

  result = qword_2568095F0;
  if (!qword_2568095F0)
  {
    result = MEMORY[0x23B81B1E8](&protocol conformance descriptor for GetRecents, &type metadata for GetRecents);
    atomic_store(result, (unint64_t *)&qword_2568095F0);
  }
  return result;
}

uint64_t sub_2377041AC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2376FE374;
  return swift_task_switch();
}

unint64_t sub_237704208()
{
  unint64_t result;

  result = qword_256809600;
  if (!qword_256809600)
  {
    result = MEMORY[0x23B81B1E8](&protocol conformance descriptor for GetRecents, &type metadata for GetRecents);
    atomic_store(result, (unint64_t *)&qword_256809600);
  }
  return result;
}

unint64_t sub_237704250()
{
  unint64_t result;

  result = qword_256809608;
  if (!qword_256809608)
  {
    result = MEMORY[0x23B81B1E8](&protocol conformance descriptor for GetRecents, &type metadata for GetRecents);
    atomic_store(result, (unint64_t *)&qword_256809608);
  }
  return result;
}

ValueMetadata *type metadata accessor for GetRecents()
{
  return &type metadata for GetRecents;
}

uint64_t sub_2377042A4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2377042B0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2377042BC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2377042C8()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_2377042D4()
{
  return MEMORY[0x24BDCD8C0]();
}

uint64_t sub_2377042E0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2377042EC()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_2377042F8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_237704304()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_237704310()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_23770431C()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_237704328()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_237704334()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_237704340()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23770434C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_237704358()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_237704364()
{
  return MEMORY[0x24BDCDEC8]();
}

uint64_t sub_237704370()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_23770437C()
{
  return MEMORY[0x24BDCDF10]();
}

uint64_t sub_237704388()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_237704394()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2377043A0()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2377043AC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2377043B8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2377043C4()
{
  return MEMORY[0x24BDCE8C0]();
}

uint64_t sub_2377043D0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2377043DC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2377043E8()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2377043F4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_237704400()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23770440C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_237704418()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_237704424()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_237704430()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23770443C()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_237704448()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_237704454()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_237704460()
{
  return MEMORY[0x24BE087A8]();
}

uint64_t sub_23770446C()
{
  return MEMORY[0x24BE087C0]();
}

uint64_t sub_237704478()
{
  return MEMORY[0x24BE087D0]();
}

uint64_t sub_237704484()
{
  return MEMORY[0x24BE087F8]();
}

uint64_t sub_237704490()
{
  return MEMORY[0x24BE08800]();
}

uint64_t sub_23770449C()
{
  return MEMORY[0x24BE08810]();
}

uint64_t sub_2377044A8()
{
  return MEMORY[0x24BE08830]();
}

uint64_t sub_2377044B4()
{
  return MEMORY[0x24BE08838]();
}

uint64_t sub_2377044C0()
{
  return MEMORY[0x24BE08840]();
}

uint64_t sub_2377044CC()
{
  return MEMORY[0x24BE08850]();
}

uint64_t sub_2377044D8()
{
  return MEMORY[0x24BE08858]();
}

uint64_t sub_2377044E4()
{
  return MEMORY[0x24BE08860]();
}

uint64_t sub_2377044F0()
{
  return MEMORY[0x24BE08868]();
}

uint64_t sub_2377044FC()
{
  return MEMORY[0x24BE08870]();
}

uint64_t sub_237704508()
{
  return MEMORY[0x24BE08878]();
}

uint64_t sub_237704514()
{
  return MEMORY[0x24BE08890]();
}

uint64_t sub_237704520()
{
  return MEMORY[0x24BE088A0]();
}

uint64_t sub_23770452C()
{
  return MEMORY[0x24BE088B8]();
}

uint64_t sub_237704538()
{
  return MEMORY[0x24BE088D0]();
}

uint64_t sub_237704544()
{
  return MEMORY[0x24BE088D8]();
}

uint64_t sub_237704550()
{
  return MEMORY[0x24BE088E0]();
}

uint64_t sub_23770455C()
{
  return MEMORY[0x24BE088E8]();
}

uint64_t sub_237704568()
{
  return MEMORY[0x24BE08908]();
}

uint64_t sub_237704574()
{
  return MEMORY[0x24BE08910]();
}

uint64_t sub_237704580()
{
  return MEMORY[0x24BE08918]();
}

uint64_t sub_23770458C()
{
  return MEMORY[0x24BE08920]();
}

uint64_t sub_237704598()
{
  return MEMORY[0x24BEE5348]();
}

uint64_t sub_2377045A4()
{
  return MEMORY[0x24BEE5368]();
}

uint64_t sub_2377045B0()
{
  return MEMORY[0x24BEE5558]();
}

uint64_t sub_2377045BC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2377045C8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2377045D4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2377045E0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2377045EC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2377045F8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_237704604()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_237704610()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23770461C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_237704628()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_237704634()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_237704640()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_23770464C()
{
  return MEMORY[0x24BE08948]();
}

uint64_t sub_237704658()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_237704664()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_237704670()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23770467C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_237704688()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_237704694()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2377046A0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_2377046AC()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2377046B8()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2377046C4()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2377046D0()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t sub_2377046DC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2377046E8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2377046F4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_237704700()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23770470C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_237704718()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_237704724()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_237704730()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23770473C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_237704748()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_237704754()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_237704760()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23770476C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_237704778()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_237704784()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_237704790()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23770479C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2377047A8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2377047B4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2377047C0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t CHCallerIdAvailabilityAsString()
{
  return MEMORY[0x24BE14920]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

uint64_t getMobileUserLibraryDirectoryPath()
{
  return MEMORY[0x24BE14950]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

