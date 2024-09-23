uint64_t sub_23E1CBECC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23E1CBED4()
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

uint64_t *sub_23E1CBF4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = v10[1];
    v12 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_23E1CBFFC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_23E1CC03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_23E1CC09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23E1CC108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23E1CC164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23E1CC1C8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23E1CC244 + 4 * byte_23E1DBAE0[v10]))();
  }
}

void sub_23E1CC2C8(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23E1CC3BC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23E1CC434);
}

void sub_23E1CC3C4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23E1CC3CCLL);
  JUMPOUT(0x23E1CC434);
}

void sub_23E1CC40C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23E1CC434);
}

void sub_23E1CC414()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23E1CC434);
}

uint64_t sub_23E1CC41C(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x23E1CC434);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x23E1CC430);
    JUMPOUT(0x23E1CC428);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

void type metadata accessor for ForEachWithIndex()
{
  JUMPOUT(0x24264DB28);
}

uint64_t sub_23E1CC458()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E1CC494@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  char *v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  void (*v29)(char *, uint64_t);
  _QWORD v31[2];
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v40 = a2;
  v41 = *(a1 - 1);
  v39 = *(_QWORD *)(v41 + 64);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(v4 + 16);
  v33 = *(_QWORD *)(v4 + 32);
  v7 = sub_23E1DB720();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  swift_getAssociatedTypeWitness();
  v8 = MEMORY[0x24BEE1768];
  swift_getTupleTypeMetadata2();
  v9 = sub_23E1DB660();
  v37 = v9;
  v10 = a1[3];
  v35 = MEMORY[0x24264DB94](MEMORY[0x24BEE12D8], v9);
  v49 = v9;
  v50 = v8;
  v51 = v10;
  v52 = v35;
  v11 = v10;
  v53 = MEMORY[0x24BEE1778];
  v31[0] = sub_23E1DB51C();
  v38 = *(_QWORD *)(v31[0] - 8);
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v32 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v34 = (char *)v31 - v14;
  sub_23E1DB654();
  MEMORY[0x24264DB94](MEMORY[0x24BEE2FC0], v7);
  v49 = sub_23E1DB66C();
  v42 = v6;
  v43 = v10;
  v15 = a1[5];
  v16 = a1[6];
  v17 = v33;
  v44 = v33;
  v45 = v15;
  v18 = a1[7];
  v46 = v16;
  v47 = v18;
  v31[1] = swift_getKeyPath();
  v19 = v41;
  v20 = v36;
  (*(void (**)(char *, uint64_t, _QWORD *))(v41 + 16))(v36, v2, a1);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v22 = (char *)swift_allocObject();
  *((_QWORD *)v22 + 2) = v6;
  *((_QWORD *)v22 + 3) = v11;
  *((_QWORD *)v22 + 4) = v17;
  *((_QWORD *)v22 + 5) = v15;
  *((_QWORD *)v22 + 6) = v16;
  *((_QWORD *)v22 + 7) = v18;
  (*(void (**)(char *, char *, _QWORD *))(v41 + 32))(&v22[v21], v20, a1);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = v6;
  v23[3] = v11;
  v23[4] = v17;
  v23[5] = v15;
  v23[6] = v16;
  v23[7] = v18;
  v23[8] = sub_23E1CCA84;
  v23[9] = v22;
  v24 = v32;
  sub_23E1DB510();
  v48 = v15;
  v25 = v31[0];
  MEMORY[0x24264DB94](MEMORY[0x24BDF4A08], v31[0], &v48);
  v26 = v38;
  v27 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v28 = v34;
  v27(v34, v24, v25);
  v29 = *(void (**)(char *, uint64_t))(v26 + 8);
  v29(v24, v25);
  v27(v40, v28, v25);
  return ((uint64_t (*)(char *, uint64_t))v29)(v28, v25);
}

void sub_23E1CC810(uint64_t a1)
{
  uint64_t v1;

  v1 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for ForEachWithIndex();
}

uint64_t sub_23E1CC8A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t);

  (*(void (**)(uint64_t, uint64_t))(v2 + *(int *)(a1 + 68)))(v5, v4);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v9(v7, v6, v1);
  v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v10(v6, v1);
  v9(v3, v7, v1);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(v7, v1);
}

uint64_t sub_23E1CC91C(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4;
  uint64_t TupleTypeMetadata2;

  v4 = *(_QWORD *)a1;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(v4, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

uint64_t sub_23E1CC9C0()
{
  return sub_23E1DB4E0();
}

void sub_23E1CC9DC()
{
  type metadata accessor for ForEachWithIndex();
}

uint64_t sub_23E1CCA10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  (*(void (**)(uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v1 + ((v2 + 64) & ~v2));
  swift_release();
  return swift_deallocObject();
}

void sub_23E1CCA84()
{
  type metadata accessor for ForEachWithIndex();
}

void sub_23E1CCAD4()
{
  uint64_t v0;

  sub_23E1CC810(v0);
}

uint64_t sub_23E1CCB30()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23E1CCB54(char *a1)
{
  uint64_t v1;

  return sub_23E1CC91C(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 64));
}

uint64_t sub_23E1CCB84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 24);
  swift_getAssociatedTypeWitness();
  v3 = MEMORY[0x24BEE1768];
  swift_getTupleTypeMetadata2();
  v7 = sub_23E1DB660();
  v8 = v3;
  v9 = v1;
  v10 = MEMORY[0x24264DB94](MEMORY[0x24BEE12D8], v7);
  v11 = MEMORY[0x24BEE1778];
  v4 = sub_23E1DB51C();
  v6 = v2;
  return MEMORY[0x24264DB94](MEMORY[0x24BDF4A08], v4, &v6);
}

uint64_t CarPlayIntercomControlView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v4;
  uint64_t v5;

  v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for CarPlayIntercomControlView() + 20));
  sub_23E1DB618();
  sub_23E1CEE3C((unint64_t *)&qword_256D3B000, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *v4 = sub_23E1DB474();
  v4[1] = v5;
  sub_23E1DB54C();
  return sub_23E1CD2AC(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlModel);
}

uint64_t type metadata accessor for CarPlayIntercomControlView()
{
  uint64_t result;

  result = qword_256D3B080;
  if (!qword_256D3B080)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CarPlayIntercomControlView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = type metadata accessor for CarPlayIntercomControlView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_23E1CD224(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B018);
  sub_23E1CEDB8(&qword_256D3B020, &qword_256D3B018, MEMORY[0x24BDF5428]);
  return sub_23E1DB570();
}

uint64_t sub_23E1CCE20@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;

  v43 = a1;
  v52 = a2;
  v48 = sub_23E1DB5D0();
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v44 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B0D0);
  v47 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v45 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B0D8);
  v51 = *(_QWORD *)(v42 - 8);
  v4 = MEMORY[0x24BDAC7A8](v42);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v50 = (char *)&v39 - v7;
  v8 = sub_23E1DB588();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B0E0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v39 - v17;
  if (qword_256D3AF60 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_23E1DB594();
  sub_23E1CEE3C(&qword_256D3B0E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEADDA0], MEMORY[0x24BEADD78]);
  sub_23E1DB4EC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = *(uint64_t (**)(char *, char *, uint64_t))(v13 + 32);
  v40 = v13;
  v41 = v18;
  v20 = v19(v18, v16, v12);
  MEMORY[0x24BDAC7A8](v20);
  v21 = v44;
  *(&v39 - 2) = v43;
  sub_23E1DB5C4();
  v22 = sub_23E1CEE3C(&qword_256D3B0F0, (uint64_t (*)(uint64_t))MEMORY[0x24BEADEF8], MEMORY[0x24BEADED8]);
  v23 = v45;
  v24 = v48;
  sub_23E1DB4EC();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v21, v24);
  v53 = v24;
  v54 = v22;
  swift_getOpaqueTypeConformance2();
  v25 = v6;
  v26 = v49;
  sub_23E1DB4B0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v23, v26);
  v28 = v50;
  v27 = v51;
  v29 = v6;
  v30 = v42;
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v50, v29, v42);
  v31 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v32 = v41;
  v31(v16, v41, v12);
  v33 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v33(v25, v28, v30);
  v34 = v52;
  v31(v52, v16, v12);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B0F8);
  v33(&v34[*(int *)(v35 + 48)], v25, v30);
  v36 = *(void (**)(char *, uint64_t))(v27 + 8);
  v36(v28, v30);
  v37 = *(void (**)(char *, uint64_t))(v40 + 8);
  v37(v32, v12);
  v36(v25, v30);
  return ((uint64_t (*)(char *, uint64_t))v37)(v16, v12);
}

uint64_t sub_23E1CD224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarPlayIntercomControlView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24264DB7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23E1CD2AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24264DB88](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23E1CD338()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E1CD348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  void (*v19)(uint64_t *, char *, uint64_t);
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = type metadata accessor for CarPlayIntercomControlView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B100);
  v25 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v24 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - v9;
  sub_23E1CD224(a1, (uint64_t)v5);
  v11 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v12 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)v5, v12 + v11, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlView);
  v27 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B108);
  sub_23E1CEDB8(&qword_256D3B110, &qword_256D3B108, MEMORY[0x24BDF41A8]);
  sub_23E1DB504();
  sub_23E1CD224(a1, (uint64_t)v5);
  v13 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)v5, v13 + v11, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlView);
  v26 = a1;
  v14 = v24;
  sub_23E1DB504();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B118);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_23E1DBBB0;
  *(_QWORD *)(v15 + 56) = v6;
  v16 = sub_23E1CEDB8(&qword_256D3B120, &qword_256D3B100, MEMORY[0x24BDF43B0]);
  *(_QWORD *)(v15 + 64) = v16;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v15 + 32));
  v18 = v25;
  v19 = *(void (**)(uint64_t *, char *, uint64_t))(v25 + 16);
  v19(boxed_opaque_existential_1, v10, v6);
  *(_QWORD *)(v15 + 96) = v6;
  *(_QWORD *)(v15 + 104) = v16;
  v20 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v15 + 72));
  v19(v20, v14, v6);
  v21 = MEMORY[0x24264D714](v15);
  swift_bridgeObjectRelease();
  v22 = *(void (**)(char *, uint64_t))(v18 + 8);
  v22(v14, v6);
  v22(v10, v6);
  return v21;
}

uint64_t sub_23E1CD5F0()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B140);
  MEMORY[0x24BDAC7A8](v0);
  v24 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B148);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B150);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23E1DB360();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B158);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_23E1DBBC0;
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  sub_23E1DB3F0();
  sub_23E1CD9B0(MEMORY[0x24BEE4AF8]);
  v13 = sub_23E1DB3B4();
  v14 = MEMORY[0x24BEAD1E8];
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = v14;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 32));
  sub_23E1DB3A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23E1DB36C();
  if (qword_256D3AF70 != -1)
    swift_once();
  v15 = sub_23E1DB438();
  __swift_project_value_buffer(v15, (uint64_t)qword_256D3B580);
  v16 = sub_23E1DB420();
  v17 = sub_23E1DB678();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_23E1CA000, v16, v17, "#CarPlayIntercomControlView start/stop button tapped, performing direct action.", v18, 2u);
    MEMORY[0x24264DBF4](v18, -1, -1);
  }

  type metadata accessor for CarPlayIntercomControlView();
  sub_23E1DB540();
  v19 = sub_23E1DB600();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v7, 1, v19) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return sub_23E1CEEE8((uint64_t)v7, &qword_256D3B150);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v4, v11, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
    v22 = sub_23E1DB57C();
    v23 = (uint64_t)v24;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v24, 1, 1, v22);
    sub_23E1DB5F4();
    sub_23E1CEEE8(v23, &qword_256D3B140);
    sub_23E1CEEE8((uint64_t)v4, &qword_256D3B148);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v7, v19);
  }
}

unint64_t sub_23E1CD9B0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B160);
  v2 = sub_23E1DB72C();
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
    sub_23E1CEF54(v6, (uint64_t)v15);
    result = sub_23E1CEF24((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_23E1CEF9C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_23E1CDADC()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B128);
  sub_23E1DB528();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38];
  swift_getOpaqueTypeConformance2();
  sub_23E1CEE3C(&qword_256D3B130, v0, MEMORY[0x24BEADA20]);
  return sub_23E1DB4F8();
}

uint64_t sub_23E1CDBB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  sub_23E1CEE7C();
  v0 = sub_23E1DB48C();
  v2 = v1;
  v4 = v3 & 1;
  sub_23E1DB4EC();
  sub_23E1CEEC0(v0, v2, v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E1CDC70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = sub_23E1DB3CC();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_23E1DB528();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  sub_23E1DB3F0();
  sub_23E1DB3C0();
  swift_bridgeObjectRelease();
  sub_23E1DB534();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
}

uint64_t sub_23E1CDDA8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B140);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B148);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B150);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23E1DB360();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B158);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_23E1DBBC0;
  sub_23E1CD9B0(MEMORY[0x24BEE4AF8]);
  v14 = sub_23E1DB3B4();
  v15 = MEMORY[0x24BEAD1E8];
  *(_QWORD *)(v13 + 56) = v14;
  *(_QWORD *)(v13 + 64) = v15;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v13 + 32));
  sub_23E1DB3A8();
  swift_bridgeObjectRelease();
  sub_23E1DB36C();
  if (qword_256D3AF70 != -1)
    swift_once();
  v16 = sub_23E1DB438();
  __swift_project_value_buffer(v16, (uint64_t)qword_256D3B580);
  v17 = sub_23E1DB420();
  v18 = sub_23E1DB678();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_23E1CA000, v17, v18, "#CarPlayIntercomControlView reply button tapped, performing direct action.", v19, 2u);
    MEMORY[0x24264DBF4](v19, -1, -1);
  }

  type metadata accessor for CarPlayIntercomControlView();
  sub_23E1DB540();
  v20 = sub_23E1DB600();
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v8, 1, v20) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return sub_23E1CEEE8((uint64_t)v8, &qword_256D3B150);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
    v23 = sub_23E1DB57C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v2, 1, 1, v23);
    sub_23E1DB5F4();
    sub_23E1CEEE8((uint64_t)v2, &qword_256D3B140);
    sub_23E1CEEE8((uint64_t)v5, &qword_256D3B148);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v20);
  }
}

uint64_t sub_23E1CE110()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B128);
  sub_23E1DB528();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BEADA38];
  swift_getOpaqueTypeConformance2();
  sub_23E1CEE3C(&qword_256D3B130, v0, MEMORY[0x24BEADA20]);
  return sub_23E1DB4F8();
}

uint64_t sub_23E1CE1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  sub_23E1CEE7C();
  v0 = sub_23E1DB48C();
  v2 = v1;
  v4 = v3 & 1;
  sub_23E1DB4EC();
  sub_23E1CEEC0(v0, v2, v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23E1CE2B0()
{
  uint64_t v0;

  v0 = sub_23E1DB3CC();
  MEMORY[0x24BDAC7A8](v0);
  sub_23E1DB3C0();
  return sub_23E1DB534();
}

uint64_t sub_23E1CE334(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_23E1CD224(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B018);
  sub_23E1CEDB8(&qword_256D3B020, &qword_256D3B018, MEMORY[0x24BDF5428]);
  return sub_23E1DB570();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarPlayIntercomControlView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  id v24;
  uint64_t v25;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = type metadata accessor for CarPlayIntercomControlModel();
    v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
    v10 = *(int *)(v9 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = *(int *)(a3 + 20);
    v15 = *(int *)(a3 + 24);
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (char *)a2 + v14;
    v19 = *(void **)v17;
    v18 = *((_QWORD *)v17 + 1);
    *v16 = v19;
    v16[1] = v18;
    v20 = (char *)a1 + v15;
    v21 = (char *)a2 + v15;
    v22 = sub_23E1DB558();
    v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
    v24 = v19;
    v23(v20, v21, v22);
  }
  return a1;
}

uint64_t destroy for CarPlayIntercomControlView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v6 = type metadata accessor for CarPlayIntercomControlModel();
  v5(a1 + *(int *)(v6 + 20), v4);
  v7 = a1 + *(int *)(v6 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  v9 = a1 + *(int *)(a2 + 24);
  v10 = sub_23E1DB558();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

uint64_t initializeWithCopy for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  id v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(v8 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = *(int *)(a3 + 20);
  v14 = *(int *)(a3 + 24);
  v15 = (_QWORD *)(a1 + v13);
  v16 = a2 + v13;
  v18 = *(void **)v16;
  v17 = *(_QWORD *)(v16 + 8);
  *v15 = v18;
  v15[1] = v17;
  v19 = a1 + v14;
  v20 = a2 + v14;
  v21 = sub_23E1DB558();
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16);
  v23 = v18;
  v22(v19, v20, v21);
  return a1;
}

uint64_t assignWithCopy for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(v8 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = *(int *)(a3 + 20);
  v14 = (_QWORD *)(a1 + v13);
  v15 = a2 + v13;
  v16 = *(void **)(a1 + v13);
  v17 = *(void **)(a2 + v13);
  *v14 = v17;
  v18 = v17;

  v14[1] = *(_QWORD *)(v15 + 8);
  v19 = *(int *)(a3 + 24);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = sub_23E1DB558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

uint64_t initializeWithTake for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(v8 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_23E1DB558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  v9 = *(int *)(v8 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = *(int *)(a3 + 20);
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  v16 = *(void **)(a1 + v13);
  *v14 = *v15;

  v14[1] = v15[1];
  v17 = *(int *)(a3 + 24);
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_23E1DB558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayIntercomControlView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1CE9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  uint64_t v11;

  v6 = type metadata accessor for CarPlayIntercomControlModel();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 2147483646)
  {
    v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF)
      LODWORD(v9) = -1;
    v10 = v9 - 1;
    if (v10 < 0)
      v10 = -1;
    return (v10 + 1);
  }
  else
  {
    v11 = sub_23E1DB558();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for CarPlayIntercomControlView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1CEAA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for CarPlayIntercomControlModel();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
      return result;
    }
    v10 = sub_23E1DB558();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23E1CEB4C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for CarPlayIntercomControlModel();
  if (v1 <= 0x3F)
  {
    result = sub_23E1DB558();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23E1CEBD8()
{
  return sub_23E1CEDB8(&qword_256D3B0C0, &qword_256D3B0C8, MEMORY[0x24BEADC00]);
}

uint64_t sub_23E1CEC08@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarPlayIntercomControlView() - 8) + 80);
  return sub_23E1CCE20(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_23E1CEC44()
{
  uint64_t v0;

  return sub_23E1CD348(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23E1CEC50()
{
  return sub_23E1CED74((uint64_t (*)(uint64_t))sub_23E1CD5F0);
}

uint64_t sub_23E1CEC5C()
{
  return sub_23E1CDADC();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for CarPlayIntercomControlView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = type metadata accessor for CarPlayIntercomControlModel();
  v5(v3 + *(int *)(v6 + 20), v4);
  v7 = v3 + *(int *)(v6 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

  v9 = v3 + *(int *)(v1 + 24);
  v10 = sub_23E1DB558();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject();
}

uint64_t sub_23E1CED68()
{
  return sub_23E1CED74((uint64_t (*)(uint64_t))sub_23E1CDDA8);
}

uint64_t sub_23E1CED74(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarPlayIntercomControlView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_23E1CEDB0()
{
  return sub_23E1CE110();
}

uint64_t sub_23E1CEDB8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24264DB94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t sub_23E1CEE34()
{
  return sub_23E1CE1E0();
}

uint64_t sub_23E1CEE3C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24264DB94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23E1CEE7C()
{
  unint64_t result;

  result = qword_256D3B138;
  if (!qword_256D3B138)
  {
    result = MEMORY[0x24264DB94](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256D3B138);
  }
  return result;
}

uint64_t sub_23E1CEEC0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23E1CEEE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23E1CEF24(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23E1DB6B4();
  return sub_23E1CEFAC(a1, v2);
}

uint64_t sub_23E1CEF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23E1CEF9C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_23E1CEFAC(uint64_t a1, uint64_t a2)
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
      sub_23E1CF070(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24264D870](v9, a1);
      sub_23E1CF0AC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_23E1CF070(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23E1CF0AC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_23E1CF0E0()
{
  return sub_23E1CDBB0();
}

uint64_t sub_23E1CF0E8@<X0>(uint64_t a1@<X8>)
{
  return sub_23E1CDC70(a1);
}

uint64_t HomeAppLaunchView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  sub_23E1DB618();
  sub_23E1CF168();
  *a2 = sub_23E1DB474();
  a2[1] = v4;
  v5 = type metadata accessor for HomeAppLaunchView();
  sub_23E1DB54C();
  return sub_23E1CD2AC(a1, (uint64_t)a2 + *(int *)(v5 + 24), (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchModel);
}

unint64_t sub_23E1CF168()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D3B000;
  if (!qword_256D3B000)
  {
    v1 = sub_23E1DB618();
    result = MEMORY[0x24264DB94](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&qword_256D3B000);
  }
  return result;
}

uint64_t type metadata accessor for HomeAppLaunchView()
{
  uint64_t result;

  result = qword_256D3B1D8;
  if (!qword_256D3B1D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t HomeAppLaunchView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = type metadata accessor for HomeAppLaunchView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_23E1CF3C8(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B170);
  sub_23E1CEDB8(&qword_256D3B178, &qword_256D3B170, MEMORY[0x24BDF43B0]);
  return sub_23E1DB570();
}

uint64_t sub_23E1CF2E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE v8[16];
  uint64_t v9;

  v2 = type metadata accessor for HomeAppLaunchView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  sub_23E1CF3C8(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5, (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchView);
  v9 = a1;
  return sub_23E1DB504();
}

uint64_t sub_23E1CF3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeAppLaunchView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E1CF414()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E1CF424(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B140);
  MEMORY[0x24BDAC7A8](v2);
  v45 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B148);
  MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B150);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_23E1DB360();
  v9 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23E1DB354();
  v47 = *(_QWORD *)(v12 - 8);
  v48 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for HomeAppLaunchView();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256D3AF78 != -1)
    swift_once();
  v18 = sub_23E1DB438();
  __swift_project_value_buffer(v18, (uint64_t)qword_256D3B598);
  sub_23E1CF3C8(a1, (uint64_t)v17);
  v19 = sub_23E1DB420();
  v20 = sub_23E1DB678();
  if (os_log_type_enabled(v19, v20))
  {
    v41[0] = v14;
    v21 = swift_slowAlloc();
    v43 = v8;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v41[1] = a1;
    v24 = v23;
    v49 = v23;
    v42 = v9;
    *(_DWORD *)v22 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    sub_23E1DB3F0();
    v50 = sub_23E1D39B4(v50, v51, &v49);
    v14 = (char *)v41[0];
    v9 = v42;
    sub_23E1DB69C();
    swift_bridgeObjectRelease();
    sub_23E1D031C((uint64_t)v17);
    _os_log_impl(&dword_23E1CA000, v19, v20, "#HomeAppLaunchView Launching App: %s.", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24264DBF4](v24, -1, -1);
    v25 = v22;
    v8 = v43;
    MEMORY[0x24264DBF4](v25, -1, -1);
  }
  else
  {
    sub_23E1D031C((uint64_t)v17);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  sub_23E1DB348();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B158);
  v26 = v14;
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_23E1DBBC0;
  v28 = sub_23E1DB3B4();
  v29 = MEMORY[0x24BEAD1E8];
  *(_QWORD *)(v27 + 56) = v28;
  *(_QWORD *)(v27 + 64) = v29;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v27 + 32));
  v31 = v47;
  (*(void (**)(uint64_t *, char *, uint64_t))(v47 + 16))(boxed_opaque_existential_1, v26, v48);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BEAD198], v28);
  sub_23E1DB36C();
  sub_23E1DB540();
  v32 = sub_23E1DB600();
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v8, 1, v32) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v46);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v48);
    return sub_23E1CEEE8((uint64_t)v8, &qword_256D3B150);
  }
  else
  {
    v35 = (uint64_t)v44;
    v36 = v46;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v44, v11, v46);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v35, 0, 1, v36);
    v37 = *MEMORY[0x24BEADC70];
    v38 = sub_23E1DB57C();
    v43 = v11;
    v39 = *(_QWORD *)(v38 - 8);
    v40 = (uint64_t)v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 104))(v45, v37, v38);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v38);
    sub_23E1DB5F4();
    sub_23E1CEEE8(v40, &qword_256D3B140);
    sub_23E1CEEE8(v35, &qword_256D3B148);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v43, v46);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v48);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v8, v32);
  }
}

uint64_t sub_23E1CF974@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  type metadata accessor for HomeAppLaunchView();
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  sub_23E1CEE7C();
  result = sub_23E1DB48C();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23E1CFA08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_23E1CF3C8(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B170);
  sub_23E1CEDB8(&qword_256D3B178, &qword_256D3B170, MEMORY[0x24BDF43B0]);
  return sub_23E1DB570();
}

char *initializeBufferWithCopyOfBuffer for HomeAppLaunchView(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = sub_23E1DB558();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = *(int *)(a3 + 24);
    v15 = &v7[v14];
    v16 = (uint64_t)a2 + v14;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    v19 = type metadata accessor for HomeAppLaunchModel();
    v18(&v15[*(int *)(v19 + 20)], v16 + *(int *)(v19 + 20), v17);
  }
  return v7;
}

uint64_t destroy for HomeAppLaunchView(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v10)(char *, uint64_t);

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23E1DB558();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)a1 + *(int *)(a2 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v10(v6, v7);
  v8 = &v6[*(int *)(type metadata accessor for HomeAppLaunchModel() + 20)];
  return ((uint64_t (*)(char *, uint64_t))v10)(v8, v7);
}

_QWORD *initializeWithCopy for HomeAppLaunchView(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;

  v7 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23E1DB558();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v13 = v7;
  v12(v9, v10, v11);
  v14 = *(int *)(a3 + 24);
  v15 = (char *)a1 + v14;
  v16 = a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
  v18(v15, v16, v17);
  v19 = type metadata accessor for HomeAppLaunchModel();
  v18(&v15[*(int *)(v19 + 20)], v16 + *(int *)(v19 + 20), v17);
  return a1;
}

uint64_t assignWithCopy for HomeAppLaunchView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23E1DB558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24);
  v17(v14, v15, v16);
  v18 = type metadata accessor for HomeAppLaunchModel();
  v17(v14 + *(int *)(v18 + 20), v15 + *(int *)(v18 + 20), v16);
  return a1;
}

_OWORD *initializeWithTake for HomeAppLaunchView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23E1DB558();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v15 = type metadata accessor for HomeAppLaunchModel();
  v14(&v11[*(int *)(v15 + 20)], &v12[*(int *)(v15 + 20)], v13);
  return a1;
}

uint64_t assignWithTake for HomeAppLaunchView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(uint64_t, char *, uint64_t);
  uint64_t v16;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23E1DB558();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v15 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v16 = type metadata accessor for HomeAppLaunchModel();
  v15(v12 + *(int *)(v16 + 20), &v13[*(int *)(v16 + 20)], v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeAppLaunchView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1CFFC4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_23E1DB558();
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 20);
    }
    else
    {
      v11 = type metadata accessor for HomeAppLaunchModel();
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(&a1[v12], a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for HomeAppLaunchView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23E1D007C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v8 = sub_23E1DB558();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for HomeAppLaunchModel();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t sub_23E1D0118()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23E1DB558();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for HomeAppLaunchModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23E1D01A8()
{
  return sub_23E1CEDB8(&qword_256D3B218, &qword_256D3B220, MEMORY[0x24BEADC00]);
}

uint64_t sub_23E1D01D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HomeAppLaunchView() - 8) + 80);
  return sub_23E1CF2E0(v0 + ((v1 + 16) & ~v1));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;

  v1 = type metadata accessor for HomeAppLaunchView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  v5 = sub_23E1DB558();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)v3 + *(int *)(v1 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v9 = type metadata accessor for HomeAppLaunchModel();
  v8(&v6[*(int *)(v9 + 20)], v7);
  return swift_deallocObject();
}

uint64_t sub_23E1D02E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HomeAppLaunchView() - 8) + 80);
  return sub_23E1CF424(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_23E1D0314@<X0>(uint64_t a1@<X8>)
{
  return sub_23E1CF974(a1);
}

uint64_t sub_23E1D031C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HomeAppLaunchView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23E1D0358()
{
  strcpy((char *)&qword_256D3D960, "com.apple.Home");
  algn_256D3D968[7] = -18;
}

uint64_t HomeAppLaunchModel.bundleId.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  return v1;
}

uint64_t HomeAppLaunchModel.buttonLabel.getter()
{
  uint64_t v1;

  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  return v1;
}

uint64_t type metadata accessor for HomeAppLaunchModel()
{
  uint64_t result;

  result = qword_256D3B2B8;
  if (!qword_256D3B2B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1D043C()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t HomeAppLaunchModel.bundleId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t (*HomeAppLaunchModel.bundleId.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v2[4] = sub_23E1DB3E4();
  return sub_23E1D0510;
}

uint64_t sub_23E1D0514@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  result = sub_23E1DB3F0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23E1D0570()
{
  type metadata accessor for HomeAppLaunchModel();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t HomeAppLaunchModel.buttonLabel.setter()
{
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t (*HomeAppLaunchModel.buttonLabel.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v2[4] = sub_23E1DB3E4();
  return sub_23E1D0510;
}

void sub_23E1D0688(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t static HomeAppLaunchModel.responseViewId.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_23E1D06D4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x614C6E6F74747562;
  else
    return 0x6449656C646E7562;
}

BOOL sub_23E1D0714(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23E1D072C()
{
  sub_23E1DB798();
  sub_23E1DB7A4();
  return sub_23E1DB7B0();
}

uint64_t sub_23E1D0770()
{
  return sub_23E1DB7A4();
}

uint64_t sub_23E1D0798()
{
  sub_23E1DB798();
  sub_23E1DB7A4();
  return sub_23E1DB7B0();
}

uint64_t sub_23E1D07D8()
{
  char *v0;

  return sub_23E1D06D4(*v0);
}

uint64_t sub_23E1D07E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1D1558(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23E1D0804()
{
  return 0;
}

void sub_23E1D0810(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23E1D081C()
{
  sub_23E1D09E8();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D0844()
{
  sub_23E1D09E8();
  return sub_23E1DB7E0();
}

uint64_t HomeAppLaunchModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B228);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D09E8();
  sub_23E1DB7C8();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1D0CE4(&qword_256D3B238, MEMORY[0x24BEAD370]);
  sub_23E1DB780();
  if (!v1)
  {
    type metadata accessor for HomeAppLaunchModel();
    v8[14] = 1;
    sub_23E1DB780();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23E1D09E8()
{
  unint64_t result;

  result = qword_256D3B230;
  if (!qword_256D3B230)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DBE78, &type metadata for HomeAppLaunchModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B230);
  }
  return result;
}

uint64_t HomeAppLaunchModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v21 = a2;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v24 = *(_QWORD *)(v26 - 8);
  v4 = MEMORY[0x24BDAC7A8](v26);
  v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v25 = (char *)&v19 - v6;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B240);
  v7 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HomeAppLaunchModel();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D09E8();
  sub_23E1DB7BC();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = v10;
  v20 = a1;
  v13 = v7;
  v14 = v22;
  v15 = v24;
  v28 = 0;
  sub_23E1D0CE4(&qword_256D3B248, MEMORY[0x24BEAD380]);
  v16 = v23;
  sub_23E1DB75C();
  v17 = v25;
  v25 = *(char **)(v15 + 32);
  ((void (*)(char *, char *, uint64_t))v25)(v12, v17, v26);
  v27 = 1;
  sub_23E1DB75C();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v16);
  ((void (*)(char *, char *, uint64_t))v25)(&v12[*(int *)(v19 + 20)], v14, v26);
  sub_23E1D0D48((uint64_t)v12, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return sub_23E1D0D8C((uint64_t)v12);
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

uint64_t sub_23E1D0CE4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B008);
    v6[0] = MEMORY[0x24BEE0D38];
    v6[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x24264DB94](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23E1D0D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeAppLaunchModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E1D0D8C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HomeAppLaunchModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E1D0DC8()
{
  return sub_23E1D0E10(&qword_256D3B250, (uint64_t)&protocol conformance descriptor for HomeAppLaunchModel);
}

uint64_t sub_23E1D0DEC()
{
  return sub_23E1D0E10(&qword_256D3B258, (uint64_t)&protocol conformance descriptor for HomeAppLaunchModel);
}

uint64_t sub_23E1D0E10(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for HomeAppLaunchModel();
    result = MEMORY[0x24264DB94](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23E1D0E50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeAppLaunchModel.init(from:)(a1, a2);
}

uint64_t sub_23E1D0E64(_QWORD *a1)
{
  return HomeAppLaunchModel.encode(to:)(a1);
}

uint64_t sub_23E1D0E78@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  result = sub_23E1DB3F0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeAppLaunchModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for HomeAppLaunchModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeAppLaunchModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1D11B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HomeAppLaunchModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1D11FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_23E1D1240()
{
  unint64_t v0;

  sub_23E1D12A8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_23E1D12A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D3B2C8[0])
  {
    v0 = sub_23E1DB408();
    if (!v1)
      atomic_store(v0, qword_256D3B2C8);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HomeAppLaunchModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HomeAppLaunchModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1D13E8 + 4 * byte_23E1DBD15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23E1D141C + 4 * byte_23E1DBD10[v4]))();
}

uint64_t sub_23E1D141C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D1424(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1D142CLL);
  return result;
}

uint64_t sub_23E1D1438(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1D1440);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23E1D1444(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D144C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D1458(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23E1D1464(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HomeAppLaunchModel.CodingKeys()
{
  return &type metadata for HomeAppLaunchModel.CodingKeys;
}

unint64_t sub_23E1D1484()
{
  unint64_t result;

  result = qword_256D3B2F8;
  if (!qword_256D3B2F8)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DBE50, &type metadata for HomeAppLaunchModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B2F8);
  }
  return result;
}

unint64_t sub_23E1D14CC()
{
  unint64_t result;

  result = qword_256D3B300;
  if (!qword_256D3B300)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DBDC0, &type metadata for HomeAppLaunchModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B300);
  }
  return result;
}

unint64_t sub_23E1D1514()
{
  unint64_t result;

  result = qword_256D3B308;
  if (!qword_256D3B308)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DBDE8, &type metadata for HomeAppLaunchModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B308);
  }
  return result;
}

uint64_t sub_23E1D1558(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23E1DB78C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t HomeDisambiguationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  sub_23E1DB618();
  sub_23E1CEE3C((unint64_t *)&qword_256D3B000, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  *a2 = sub_23E1DB474();
  a2[1] = v4;
  v5 = type metadata accessor for HomeDisambiguationView();
  sub_23E1DB54C();
  return sub_23E1CD2AC(a1, (uint64_t)a2 + *(int *)(v5 + 24), type metadata accessor for HomeDisambiguationModel);
}

uint64_t type metadata accessor for HomeDisambiguationView()
{
  uint64_t result;

  result = qword_256D3B3B8;
  if (!qword_256D3B3B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t HomeDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  id *v15;
  int v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = v1;
  v35 = a1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B310);
  v31 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B318);
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E1DB5E8();
  MEMORY[0x24BDAC7A8](v6);
  v28[1] = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B320);
  v30 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v29 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for HomeDisambiguationView();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (id *)((char *)v28 - v14);
  type metadata accessor for HomeDisambiguationModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  sub_23E1DB3F0();
  v16 = v40;
  sub_23E1D3600(v2, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  if (v16 == 1)
  {
    if (!*v15)
    {
      sub_23E1DB618();
      sub_23E1CEE3C((unint64_t *)&qword_256D3B000, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
      result = sub_23E1DB468();
      __break(1u);
      return result;
    }
    v17 = *v15;
    sub_23E1DB60C();

    LOBYTE(v17) = sub_23E1DB684();
    sub_23E1D3978((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
    if ((v17 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      sub_23E1DB3F0();
      v41 = MEMORY[0x24BEE0D00];
      v42 = MEMORY[0x24BEAE5B8];
      v39 = 0;
      v37 = 0u;
      v38 = 0u;
      sub_23E1DB5DC();
      sub_23E1D3600(v2, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
      v18 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v19 = swift_allocObject();
      sub_23E1CD2AC((uint64_t)v13, v19 + v18, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B350);
      sub_23E1CEDB8(&qword_256D3B358, &qword_256D3B350, (uint64_t)&unk_23E1DBB38);
      v20 = v29;
      sub_23E1DB5A0();
      v21 = v30;
      v22 = v33;
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v34, v20, v33);
      swift_storeEnumTagMultiPayload();
      sub_23E1CEDB8(&qword_256D3B340, &qword_256D3B320, MEMORY[0x24BEADE50]);
      sub_23E1CEDB8(&qword_256D3B348, &qword_256D3B310, MEMORY[0x24BEADC00]);
      sub_23E1DB480();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v22);
    }
  }
  else
  {
    sub_23E1D3978((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  }
  sub_23E1D3600(v2, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  v24 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v25 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)v13, v25 + v24, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B330);
  sub_23E1CEDB8(&qword_256D3B338, &qword_256D3B330, MEMORY[0x24BDF5428]);
  sub_23E1DB570();
  v26 = v31;
  v27 = v36;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v34, v4, v36);
  swift_storeEnumTagMultiPayload();
  sub_23E1CEDB8(&qword_256D3B340, &qword_256D3B320, MEMORY[0x24BEADE50]);
  sub_23E1CEDB8(&qword_256D3B348, &qword_256D3B310, MEMORY[0x24BEADC00]);
  sub_23E1DB480();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v4, v27);
}

uint64_t sub_23E1D1C44@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t result;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v32 = a2;
  v3 = type metadata accessor for HomeDisambiguationView();
  v4 = *(_QWORD *)(v3 - 8);
  v28[1] = v3;
  v29 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v30 = v5;
  v31 = (uint64_t)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23E1DB588();
  v28[0] = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B0E0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B448);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v28 - v17;
  if (*a1)
  {
    v19 = *a1;
    sub_23E1DB60C();

    if ((sub_23E1DB684() & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      sub_23E1DB3F0();
      sub_23E1DB594();
      sub_23E1CEE3C(&qword_256D3B0E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEADDA0], MEMORY[0x24BEADD78]);
      sub_23E1DB4EC();
      (*(void (**)(char *, uint64_t))(v28[0] + 8))(v8, v6);
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v12, v9);
      v20 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v18, v20, 1, v9);
    type metadata accessor for HomeDisambiguationModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    sub_23E1DB3F0();
    v21 = v33;
    v22 = v31;
    sub_23E1D3600((uint64_t)a1, v31, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
    v23 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    v24 = swift_allocObject();
    sub_23E1CD2AC(v22, v24 + v23, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
    sub_23E1D41B8((uint64_t)v18, (uint64_t)v16);
    v25 = v32;
    sub_23E1D41B8((uint64_t)v16, v32);
    v26 = (_QWORD *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256D3B450) + 48));
    *v26 = v21;
    v26[1] = sub_23E1D35FC;
    v26[2] = v24;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_23E1CEEE8((uint64_t)v18, &qword_256D3B448);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_23E1CEEE8((uint64_t)v16, &qword_256D3B448);
  }
  else
  {
    sub_23E1DB618();
    sub_23E1CEE3C((unint64_t *)&qword_256D3B000, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    result = sub_23E1DB468();
    __break(1u);
  }
  return result;
}

uint64_t sub_23E1D1FC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HomeDisambiguationView() - 8) + 80);
  return sub_23E1D1C44((id *)(v1 + ((v3 + 16) & ~v3)), a1);
}

uint64_t sub_23E1D1FFC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[2];

  v4 = type metadata accessor for HomeDisambiguationView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  type metadata accessor for HomeDisambiguationModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  sub_23E1DB3F0();
  v7 = v11[1];
  sub_23E1D3600(a1, (uint64_t)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  result = sub_23E1CD2AC((uint64_t)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  *a2 = v7;
  a2[1] = sub_23E1D35FC;
  a2[2] = v9;
  return result;
}

uint64_t sub_23E1D2100@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HomeDisambiguationView() - 8) + 80);
  return sub_23E1D1FFC(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_23E1D213C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23E1D214C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
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
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v57 = a1;
  v58 = a4;
  v6 = sub_23E1DB378();
  v55 = *(_QWORD *)(v6 - 8);
  v56 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v54 = (uint64_t)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for HomeDisambiguationView();
  v45 = *(_QWORD *)(v8 - 8);
  v9 = *(_QWORD *)(v45 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for HomeTarget(0);
  v42 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v42 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23E1DB5B8();
  v15 = *(_QWORD *)(v14 - 8);
  v47 = v14;
  v48 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B408);
  v19 = *(_QWORD *)(v18 - 8);
  v49 = v18;
  v50 = v19;
  MEMORY[0x24BDAC7A8](v18);
  v43 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B410);
  v52 = *(_QWORD *)(v21 - 8);
  v53 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v46 = (char *)&v41 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B418);
  MEMORY[0x24BDAC7A8](v51);
  v44 = (char *)&v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  v85 = MEMORY[0x24BEE0D00];
  v86 = MEMORY[0x24BEAE5B8];
  v82 = 0;
  v80 = 0u;
  v81 = 0u;
  v79 = 0;
  v77 = 0u;
  v78 = 0u;
  v76 = 0;
  v74 = 0u;
  v75 = 0u;
  v73 = 0;
  v71 = 0u;
  v72 = 0u;
  v70 = 0;
  v68 = 0u;
  v69 = 0u;
  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v61 = 0;
  v59 = 0u;
  v60 = 0u;
  sub_23E1DB5AC();
  sub_23E1D3600(a2, (uint64_t)v13, type metadata accessor for HomeTarget);
  sub_23E1D3600(a3, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  v24 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v25 = (v12 + *(unsigned __int8 *)(v45 + 80) + v24) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  v26 = swift_allocObject();
  sub_23E1CD2AC((uint64_t)v13, v26 + v24, type metadata accessor for HomeTarget);
  sub_23E1CD2AC((uint64_t)v10, v26 + v25, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
  v27 = sub_23E1CEE3C(&qword_256D3B428, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE90], MEMORY[0x24BEADE70]);
  v28 = v43;
  v29 = v47;
  sub_23E1DB4A4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v29);
  v30 = v54;
  sub_23E1D2AC0(v54);
  v83 = v29;
  v84 = v27;
  swift_getOpaqueTypeConformance2();
  v31 = v46;
  v32 = v49;
  sub_23E1DB498();
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v30, v56);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v28, v32);
  LOBYTE(v28) = v57 == 0;
  sub_23E1DB618();
  sub_23E1CEE3C((unint64_t *)&qword_256D3B000, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  v33 = sub_23E1DB474();
  v35 = v34;
  v37 = v52;
  v36 = v53;
  v38 = (uint64_t)v44;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v44, v31, v53);
  v39 = v38 + *(int *)(v51 + 36);
  *(_QWORD *)v39 = v33;
  *(_QWORD *)(v39 + 8) = v35;
  *(_BYTE *)(v39 + 16) = (_BYTE)v28;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v31, v36);
  sub_23E1D385C();
  sub_23E1DB4EC();
  return sub_23E1CEEE8(v38, &qword_256D3B418);
}

uint64_t sub_23E1D2610(uint64_t a1, uint64_t a2)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B140);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B148);
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B150);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for HomeTarget(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23E1DB360();
  v41 = *(_QWORD *)(v14 - 8);
  v42 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B158);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_23E1DBBC0;
  v18 = sub_23E1DB3B4();
  v19 = MEMORY[0x24BEAD1E8];
  *(_QWORD *)(v17 + 56) = v18;
  *(_QWORD *)(v17 + 64) = v19;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v17 + 32));
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  *boxed_opaque_existential_1 = sub_23E1DB390();
  *((_BYTE *)boxed_opaque_existential_1 + 8) = 0;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BEAD1C8], v18);
  v40 = v16;
  sub_23E1DB36C();
  if (qword_256D3AF78 != -1)
    swift_once();
  v21 = sub_23E1DB438();
  __swift_project_value_buffer(v21, (uint64_t)qword_256D3B598);
  sub_23E1D3600(a1, (uint64_t)v13, type metadata accessor for HomeTarget);
  v22 = sub_23E1DB420();
  v23 = sub_23E1DB678();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v37 = v5;
    v25 = (uint8_t *)v24;
    v26 = swift_slowAlloc();
    v45 = v26;
    *(_DWORD *)v25 = 136315138;
    v36 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    sub_23E1DB3F0();
    v43 = sub_23E1D39B4(v43, v44, &v45);
    v10 = v36;
    sub_23E1DB69C();
    swift_bridgeObjectRelease();
    sub_23E1D3978((uint64_t)v13, type metadata accessor for HomeTarget);
    _os_log_impl(&dword_23E1CA000, v22, v23, "#HomeDisambiguationView target tapped, performing direct action for %s.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24264DBF4](v26, -1, -1);
    v27 = v25;
    v5 = v37;
    MEMORY[0x24264DBF4](v27, -1, -1);
  }
  else
  {
    sub_23E1D3978((uint64_t)v13, type metadata accessor for HomeTarget);
  }

  type metadata accessor for HomeDisambiguationView();
  sub_23E1DB540();
  v28 = sub_23E1DB600();
  v29 = *(_QWORD *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v10, 1, v28) == 1)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
    return sub_23E1CEEE8((uint64_t)v10, &qword_256D3B150);
  }
  else
  {
    v32 = v40;
    v31 = v41;
    v33 = (uint64_t)v38;
    v34 = v42;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v40, v42);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56))(v33, 0, 1, v34);
    v35 = sub_23E1DB57C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v5, 1, 1, v35);
    sub_23E1DB5F4();
    sub_23E1CEEE8((uint64_t)v5, &qword_256D3B140);
    sub_23E1CEEE8(v33, &qword_256D3B148);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v34);
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v10, v28);
  }
}

uint64_t sub_23E1D2AC0@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  id v7;
  id v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v2 = (uint64_t)v1;
  v4 = type metadata accessor for HomeDisambiguationView();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (id *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*v1)
  {
    v7 = *v1;
    sub_23E1DB60C();

    LOBYTE(v7) = sub_23E1DB684();
    sub_23E1D3600(v2, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
    if ((v7 & 1) != 0)
    {
      sub_23E1D3978((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
      goto LABEL_6;
    }
    if (*v6)
    {
      v8 = *v6;
      sub_23E1DB60C();

      LOBYTE(v8) = sub_23E1DB690();
      sub_23E1D3978((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for HomeDisambiguationView);
      if ((v8 & 1) == 0)
      {
        v9 = (unsigned int *)MEMORY[0x24BEAB4F0];
        goto LABEL_8;
      }
LABEL_6:
      v9 = (unsigned int *)MEMORY[0x24BEAB508];
LABEL_8:
      v10 = *v9;
      v11 = sub_23E1DB378();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(a1, v10, v11);
    }
  }
  sub_23E1DB618();
  sub_23E1CEE3C((unint64_t *)&qword_256D3B000, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
  result = sub_23E1DB468();
  __break(1u);
  return result;
}

char *initializeBufferWithCopyOfBuffer for HomeDisambiguationView(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  int *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    *((_QWORD *)a1 + 1) = a2[1];
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = sub_23E1DB558();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = *(int *)(a3 + 24);
    v15 = &v7[v14];
    v16 = (uint64_t)a2 + v14;
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    v19 = (int *)type metadata accessor for HomeDisambiguationModel(0);
    v20 = v19[5];
    v21 = &v15[v20];
    v22 = v16 + v20;
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    v24 = v19[6];
    v25 = &v15[v24];
    v26 = v16 + v24;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    v18(&v15[v19[7]], v16 + v19[7], v17);
  }
  return v7;
}

uint64_t destroy for HomeDisambiguationView(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  int *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v14)(char *, uint64_t);

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_23E1DB558();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)a1 + *(int *)(a2 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v14 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v14(v6, v7);
  v8 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v9 = &v6[v8[5]];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = &v6[v8[6]];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return ((uint64_t (*)(char *, uint64_t))v14)(&v6[v8[7]], v7);
}

_QWORD *initializeWithCopy for HomeDisambiguationView(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  int *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v7 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = sub_23E1DB558();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  v13 = v7;
  v12(v9, v10, v11);
  v14 = *(int *)(a3 + 24);
  v15 = (char *)a1 + v14;
  v16 = a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
  v18(v15, v16, v17);
  v19 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v20 = v19[5];
  v21 = &v15[v20];
  v22 = v16 + v20;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  v24 = v19[6];
  v25 = &v15[v24];
  v26 = v16 + v24;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  v18(&v15[v19[7]], v16 + v19[7], v17);
  return a1;
}

uint64_t assignWithCopy for HomeDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v9 = *(int *)(a3 + 20);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_23E1DB558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24);
  v17(v14, v15, v16);
  v18 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v19 = v18[5];
  v20 = v14 + v19;
  v21 = v15 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  v23 = v18[6];
  v24 = v14 + v23;
  v25 = v15 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 24))(v24, v25, v26);
  v17(v14 + v18[7], v15 + v18[7], v16);
  return a1;
}

_OWORD *initializeWithTake for HomeDisambiguationView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23E1DB558();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v15 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v16 = v15[5];
  v17 = &v11[v16];
  v18 = &v12[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v20 = v15[6];
  v21 = &v11[v20];
  v22 = &v12[v20];
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  v14(&v11[v15[7]], &v12[v15[7]], v13);
  return a1;
}

uint64_t assignWithTake for HomeDisambiguationView(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(uint64_t, char *, uint64_t);
  int *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23E1DB558();
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v15 = *(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v16 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v17 = v16[5];
  v18 = v12 + v17;
  v19 = &v13[v17];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = v16[6];
  v22 = v12 + v21;
  v23 = &v13[v21];
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v15(v12 + v16[7], &v13[v16[7]], v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeDisambiguationView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1D3374(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_23E1DB558();
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 20);
    }
    else
    {
      v11 = type metadata accessor for HomeDisambiguationModel(0);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(&a1[v12], a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for HomeDisambiguationView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23E1D342C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v8 = sub_23E1DB558();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for HomeDisambiguationModel(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t sub_23E1D34C8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23E1DB558();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for HomeDisambiguationModel(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_23E1D355C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256D3B3F8;
  if (!qword_256D3B3F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B400);
    v2[0] = sub_23E1CEDB8(&qword_256D3B340, &qword_256D3B320, MEMORY[0x24BEADE50]);
    v2[1] = sub_23E1CEDB8(&qword_256D3B348, &qword_256D3B310, MEMORY[0x24BEADC00]);
    result = MEMORY[0x24264DB94](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D3B3F8);
  }
  return result;
}

uint64_t sub_23E1D3600(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23E1D3644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (*v12)(unint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v1 = type metadata accessor for HomeTarget(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for HomeDisambiguationView();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = v0 + v3;
  v9 = sub_23E1DB33C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v0 + v3, v9);
  v10 = v0 + v3 + *(int *)(v1 + 20);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v12 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v13 = v8 + *(int *)(v1 + 24);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);

  v15 = v0 + v7 + *(int *)(v5 + 20);
  v16 = sub_23E1DB558();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17 = v0 + v7 + *(int *)(v5 + 24);
  v12(v17, v11);
  v18 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v19 = v17 + v18[5];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  v21 = v17 + v18[6];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
  v12(v17 + v18[7], v11);
  return swift_deallocObject();
}

uint64_t sub_23E1D37FC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for HomeTarget(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HomeDisambiguationView() - 8) + 80);
  return sub_23E1D2610(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

unint64_t sub_23E1D385C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_256D3B430;
  if (!qword_256D3B430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B418);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B408);
    sub_23E1DB5B8();
    sub_23E1CEE3C(&qword_256D3B428, (uint64_t (*)(uint64_t))MEMORY[0x24BEADE90], MEMORY[0x24BEADE70]);
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = sub_23E1D3934();
    result = MEMORY[0x24264DB94](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_256D3B430);
  }
  return result;
}

unint64_t sub_23E1D3934()
{
  unint64_t result;

  result = qword_256D3B438;
  if (!qword_256D3B438)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC180, &type metadata for CarPlayDisambiguationListItem);
    atomic_store(result, (unint64_t *)&qword_256D3B438);
  }
  return result;
}

uint64_t sub_23E1D3978(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23E1D39B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23E1D3A84(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23E1D3FF4((uint64_t)v12, *a3);
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
      sub_23E1D3FF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23E1D3A84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23E1DB6A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23E1D3C3C(a5, a6);
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
  v8 = sub_23E1DB6FC();
  if (!v8)
  {
    sub_23E1DB714();
    __break(1u);
LABEL_17:
    result = sub_23E1DB738();
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

uint64_t sub_23E1D3C3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23E1D3CD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23E1D3EA8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23E1D3EA8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23E1D3CD0(uint64_t a1, unint64_t a2)
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
      v3 = sub_23E1D3E44(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23E1DB6D8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23E1DB714();
      __break(1u);
LABEL_10:
      v2 = sub_23E1DB648();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23E1DB738();
    __break(1u);
LABEL_14:
    result = sub_23E1DB714();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23E1D3E44(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B440);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23E1D3EA8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B440);
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
  result = sub_23E1DB738();
  __break(1u);
  return result;
}

uint64_t sub_23E1D3FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  int *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v1 = type metadata accessor for HomeDisambiguationView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 20);
  v5 = sub_23E1DB558();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)v3 + *(int *)(v1 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v9 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  v10 = &v6[v9[5]];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = &v6[v9[6]];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v8(&v6[v9[7]], v7);
  return swift_deallocObject();
}

uint64_t sub_23E1D4164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for HomeDisambiguationView() - 8) + 80);
  return sub_23E1D214C(a1, a2, v3 + ((v7 + 16) & ~v7), a3);
}

uint64_t sub_23E1D41B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CarPlayIntercomControlModel.isPlaying.getter()
{
  unsigned __int8 v1;

  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  sub_23E1DB3F0();
  return v1;
}

uint64_t type metadata accessor for CarPlayIntercomControlModel()
{
  uint64_t result;

  result = qword_256D3B4E8;
  if (!qword_256D3B4E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CarPlayIntercomControlModel.playStopText.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  return v1;
}

uint64_t CarPlayIntercomControlModel.replyText.getter()
{
  uint64_t v1;

  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1DB3F0();
  return v1;
}

uint64_t CarPlayIntercomControlModel.playStopText.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t (*CarPlayIntercomControlModel.playStopText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v2[4] = sub_23E1DB3E4();
  return sub_23E1D0510;
}

uint64_t sub_23E1D4388@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  result = sub_23E1DB3F0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23E1D43E4()
{
  type metadata accessor for CarPlayIntercomControlModel();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t CarPlayIntercomControlModel.replyText.setter()
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  return sub_23E1DB3FC();
}

uint64_t (*CarPlayIntercomControlModel.replyText.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v2[4] = sub_23E1DB3E4();
  return sub_23E1D0510;
}

uint64_t sub_23E1D44FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  result = sub_23E1DB3F0();
  *a1 = v3;
  return result;
}

uint64_t sub_23E1D4558()
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  return sub_23E1DB3FC();
}

uint64_t CarPlayIntercomControlModel.isPlaying.setter()
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  return sub_23E1DB3FC();
}

uint64_t (*CarPlayIntercomControlModel.isPlaying.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  v2[4] = sub_23E1DB3E4();
  return sub_23E1D0510;
}

unint64_t static CarPlayIntercomControlModel.responseViewId.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t CarPlayIntercomControlModel.init(playStopText:replyText:isPlaying:)()
{
  sub_23E1DB3D8();
  type metadata accessor for CarPlayIntercomControlModel();
  sub_23E1DB3D8();
  return sub_23E1DB3D8();
}

uint64_t sub_23E1D4714(char a1)
{
  return *(_QWORD *)&aPlaystopreplyt[8 * a1];
}

BOOL sub_23E1D4734(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23E1D4748()
{
  char *v0;

  return sub_23E1D4714(*v0);
}

uint64_t sub_23E1D4750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1D5780(a1, a2);
  *a3 = result;
  return result;
}

void sub_23E1D4774(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_23E1D4780()
{
  sub_23E1D498C();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D47A8()
{
  sub_23E1D498C();
  return sub_23E1DB7E0();
}

uint64_t CarPlayIntercomControlModel.encode(to:)(_QWORD *a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B458);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D498C();
  sub_23E1DB7C8();
  v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1D0CE4(&qword_256D3B238, MEMORY[0x24BEAD370]);
  sub_23E1DB780();
  if (!v1)
  {
    type metadata accessor for CarPlayIntercomControlModel();
    v10 = 1;
    sub_23E1DB780();
    v9 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    sub_23E1D49D0(&qword_256D3B468, MEMORY[0x24BEAD370]);
    sub_23E1DB780();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23E1D498C()
{
  unint64_t result;

  result = qword_256D3B460;
  if (!qword_256D3B460)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC0D0, &type metadata for CarPlayIntercomControlModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B460);
  }
  return result;
}

uint64_t sub_23E1D49D0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B010);
    v6[0] = MEMORY[0x24BEE1348];
    v6[1] = MEMORY[0x24BEE1330];
    result = MEMORY[0x24264DB94](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CarPlayIntercomControlModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;

  v29 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v34 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v26 - v8;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B470);
  v9 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CarPlayIntercomControlModel();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1[3];
  v36 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_23E1D498C();
  v35 = v11;
  v16 = v37;
  sub_23E1DB7BC();
  if (v16)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  v37 = v9;
  v26 = v12;
  v27 = v14;
  v17 = v34;
  v40 = 0;
  sub_23E1D0CE4(&qword_256D3B248, MEMORY[0x24BEAD380]);
  v18 = v32;
  sub_23E1DB75C();
  v19 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
  v19(v27, v18, v4);
  v39 = 1;
  sub_23E1DB75C();
  v20 = v26;
  v21 = (uint64_t)v27;
  v19(&v27[*(int *)(v26 + 20)], v7, v4);
  v38 = 2;
  sub_23E1D49D0(&qword_256D3B478, MEMORY[0x24BEAD380]);
  v22 = v30;
  v23 = v31;
  v24 = v35;
  sub_23E1DB75C();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v33);
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v21 + *(int *)(v20 + 24), v23, v22);
  sub_23E1D4DDC(v21, v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return sub_23E1D4E20(v21);
}

uint64_t sub_23E1D4DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarPlayIntercomControlModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23E1D4E20(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CarPlayIntercomControlModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23E1D4E5C()
{
  return sub_23E1D4EA4(&qword_256D3B480, (uint64_t)&protocol conformance descriptor for CarPlayIntercomControlModel);
}

uint64_t sub_23E1D4E80()
{
  return sub_23E1D4EA4(&qword_256D3B488, (uint64_t)&protocol conformance descriptor for CarPlayIntercomControlModel);
}

uint64_t sub_23E1D4EA4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for CarPlayIntercomControlModel();
    result = MEMORY[0x24264DB94](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23E1D4EE4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CarPlayIntercomControlModel.init(from:)(a1, a2);
}

uint64_t sub_23E1D4EF8(_QWORD *a1)
{
  return CarPlayIntercomControlModel.encode(to:)(a1);
}

uint64_t sub_23E1D4F0C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  result = sub_23E1DB3F0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CarPlayIntercomControlModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t initializeWithCopy for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t assignWithCopy for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

uint64_t initializeWithTake for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t assignWithTake for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayIntercomControlModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1D5350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CarPlayIntercomControlModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1D53D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23E1D545C()
{
  unint64_t v0;
  unint64_t v1;

  sub_23E1D5500(319, qword_256D3B2C8);
  if (v0 <= 0x3F)
  {
    sub_23E1D5500(319, qword_256D3B4F8);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23E1D5500(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23E1DB408();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t getEnumTagSinglePayload for CarPlayIntercomControlModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarPlayIntercomControlModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1D5620 + 4 * byte_23E1DBF65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1D5654 + 4 * byte_23E1DBF60[v4]))();
}

uint64_t sub_23E1D5654(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D565C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1D5664);
  return result;
}

uint64_t sub_23E1D5670(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1D5678);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1D567C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D5684(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23E1D5690(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CarPlayIntercomControlModel.CodingKeys()
{
  return &type metadata for CarPlayIntercomControlModel.CodingKeys;
}

unint64_t sub_23E1D56AC()
{
  unint64_t result;

  result = qword_256D3B530;
  if (!qword_256D3B530)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC0A8, &type metadata for CarPlayIntercomControlModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B530);
  }
  return result;
}

unint64_t sub_23E1D56F4()
{
  unint64_t result;

  result = qword_256D3B538;
  if (!qword_256D3B538)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC018, &type metadata for CarPlayIntercomControlModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B538);
  }
  return result;
}

unint64_t sub_23E1D573C()
{
  unint64_t result;

  result = qword_256D3B540;
  if (!qword_256D3B540)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC040, &type metadata for CarPlayIntercomControlModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B540);
  }
  return result;
}

uint64_t sub_23E1D5780(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x706F745379616C70 && a2 == 0xEC00000074786554;
  if (v3 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x786554796C706572 && a2 == 0xE900000000000074 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6979616C507369 && a2 == 0xE900000000000067)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23E1DB78C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t initializeBufferWithCopyOfBuffer for CarPlayDisambiguationListItem(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = v3;
  return a1;
}

void destroy for CarPlayDisambiguationListItem(id *a1)
{

}

uint64_t assignWithCopy for CarPlayDisambiguationListItem(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for CarPlayDisambiguationListItem(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayDisambiguationListItem(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CarPlayDisambiguationListItem(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarPlayDisambiguationListItem()
{
  return &type metadata for CarPlayDisambiguationListItem;
}

uint64_t sub_23E1D5A84()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23E1D5A94()
{
  qword_256D3B548 = 0x4000000000000000;
}

uint64_t sub_23E1D5AA4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  unint64_t v17;
  uint64_t result;
  void (*v19)(_BYTE *, uint64_t, uint64_t);
  unint64_t v20;
  _BYTE v21[12];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v22 = a3;
  v23 = a1;
  v24 = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B550);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B558);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B560);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    v16 = a2;
    sub_23E1DB60C();

    if ((sub_23E1DB684() & 1) == 0 || (v22 & 1) != 0)
    {
      v19 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
      v19(v8, v23, v5);
      v19(v11, (uint64_t)v8, v5);
      swift_storeEnumTagMultiPayload();
      v20 = sub_23E1D5D6C();
      v25 = v5;
      v26 = v20;
      swift_getOpaqueTypeConformance2();
      sub_23E1DB480();
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      if (qword_256D3AF68 != -1)
        swift_once();
      v17 = sub_23E1D5D6C();
      sub_23E1DB4BC();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 16))(v11, v15, v12);
      swift_storeEnumTagMultiPayload();
      v25 = v5;
      v26 = v17;
      swift_getOpaqueTypeConformance2();
      sub_23E1DB480();
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    }
  }
  else
  {
    sub_23E1DB618();
    sub_23E1CF168();
    result = sub_23E1DB468();
    __break(1u);
  }
  return result;
}

uint64_t sub_23E1D5D48()
{
  return sub_23E1DB45C();
}

uint64_t sub_23E1D5D60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23E1D5AA4(a1, *(void **)v2, *(unsigned __int8 *)(v2 + 16), a2);
}

unint64_t sub_23E1D5D6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256D3B568;
  if (!qword_256D3B568)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B550);
    result = MEMORY[0x24264DB94](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_256D3B568);
  }
  return result;
}

unint64_t sub_23E1D5DBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];
  unint64_t v3;

  result = qword_256D3B570;
  if (!qword_256D3B570)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B578);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B550);
    v3 = sub_23E1D5D6C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = v3;
    result = MEMORY[0x24264DB94](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256D3B570);
  }
  return result;
}

uint64_t sub_23E1D5E58(uint64_t a1)
{
  return sub_23E1D5EBC(a1, qword_256D3B580);
}

uint64_t static Logger.siriHomeCommunicationUIFramework.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E1D5F4C(&qword_256D3AF70, (uint64_t)qword_256D3B580, a1);
}

uint64_t sub_23E1D5E98(uint64_t a1)
{
  return sub_23E1D5EBC(a1, qword_256D3B598);
}

uint64_t sub_23E1D5EBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23E1DB438();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23E1DB42C();
}

uint64_t static Logger.siriHomeCommunicationUIPlugin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_23E1D5F4C(&qword_256D3AF78, (uint64_t)qword_256D3B598, a1);
}

uint64_t sub_23E1D5F4C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_23E1DB438();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

unint64_t static HomeCommunicationSnippetModel.bundleName.getter()
{
  return 0xD000000000000019;
}

uint64_t HomeCommunicationSnippetModel.snippetHidden(for:idiom:)()
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
  char v9;
  char v10;
  uint64_t v12;

  v1 = v0;
  v2 = sub_23E1DB414();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for HomeCommunicationSnippetModel();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1D61A8(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEA8968], v2);
    sub_23E1CEE3C(&qword_256D3B5B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA89B0], MEMORY[0x24BEA89B8]);
    v9 = sub_23E1DB630();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 0;
  }
  sub_23E1D3978((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HomeCommunicationSnippetModel);
  return v10 & 1;
}

uint64_t type metadata accessor for HomeCommunicationSnippetModel()
{
  uint64_t result;

  result = qword_256D3B6B0;
  if (!qword_256D3B6B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1D61A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HomeCommunicationSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t HomeCommunicationSnippetModel.description.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int EnumCaseMultiPayload;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD);
  uint64_t v18;
  unint64_t v19;

  v1 = type metadata accessor for HomeDisambiguationModel(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for CarPlayIntercomControlModel();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for HomeAppLaunchModel();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HomeCommunicationSnippetModel();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1D61A8(v0, (uint64_t)v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23E1CD2AC((uint64_t)v12, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlModel);
      v18 = 0;
      v19 = 0xE000000000000000;
      sub_23E1DB6CC();
      sub_23E1DB63C();
      sub_23E1DB708();
      sub_23E1DB63C();
      v14 = v18;
      v15 = (uint64_t)v6;
      v16 = (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlModel;
    }
    else
    {
      sub_23E1CD2AC((uint64_t)v12, (uint64_t)v3, type metadata accessor for HomeDisambiguationModel);
      v18 = 0;
      v19 = 0xE000000000000000;
      sub_23E1DB6CC();
      sub_23E1DB63C();
      sub_23E1DB708();
      v14 = v18;
      v15 = (uint64_t)v3;
      v16 = type metadata accessor for HomeDisambiguationModel;
    }
  }
  else
  {
    sub_23E1CD2AC((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchModel);
    v18 = 0;
    v19 = 0xE000000000000000;
    sub_23E1DB63C();
    sub_23E1DB708();
    v14 = v18;
    v15 = (uint64_t)v9;
    v16 = (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchModel;
  }
  sub_23E1D3978(v15, v16);
  return v14;
}

uint64_t sub_23E1D64BC(char a1)
{
  if (!a1)
    return 0x636E75614C707061;
  if (a1 == 1)
    return 0xD000000000000016;
  return 0xD000000000000012;
}

uint64_t sub_23E1D651C()
{
  return 1;
}

void sub_23E1D6530(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23E1D653C()
{
  sub_23E1D6CC4();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D6564()
{
  sub_23E1D6CC4();
  return sub_23E1DB7E0();
}

uint64_t sub_23E1D658C()
{
  sub_23E1D6C80();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D65B4()
{
  sub_23E1D6C80();
  return sub_23E1DB7E0();
}

uint64_t sub_23E1D65DC()
{
  char *v0;

  return sub_23E1D64BC(*v0);
}

uint64_t sub_23E1D65E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1D86D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23E1D6608()
{
  sub_23E1D6BF8();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D6630()
{
  sub_23E1D6BF8();
  return sub_23E1DB7E0();
}

uint64_t sub_23E1D6658()
{
  sub_23E1DB798();
  sub_23E1DB7A4();
  return sub_23E1DB7B0();
}

uint64_t sub_23E1D6698()
{
  return sub_23E1DB7A4();
}

uint64_t sub_23E1D66BC()
{
  sub_23E1DB798();
  sub_23E1DB7A4();
  return sub_23E1DB7B0();
}

uint64_t sub_23E1D66F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1D8818(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23E1D6720()
{
  sub_23E1D6C3C();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D6748()
{
  sub_23E1D6C3C();
  return sub_23E1DB7E0();
}

uint64_t HomeCommunicationSnippetModel.encode(to:)(_QWORD *a1)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int EnumCaseMultiPayload;
  uint64_t (*v21)(_QWORD);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
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
  char v45;
  char v46;
  char v47;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B5B8);
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = type metadata accessor for HomeDisambiguationModel(0);
  MEMORY[0x24BDAC7A8](v37);
  v38 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B5C0);
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v34 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for CarPlayIntercomControlModel();
  MEMORY[0x24BDAC7A8](v32);
  v33 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B5C8);
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for HomeAppLaunchModel();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for HomeCommunicationSnippetModel();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B5D0);
  v43 = *(_QWORD *)(v17 - 8);
  v44 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D6BF8();
  sub_23E1DB7C8();
  sub_23E1D61A8(v42, (uint64_t)v16);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v21 = (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlModel;
      v22 = v33;
      sub_23E1CD2AC((uint64_t)v16, v33, (uint64_t (*)(_QWORD))type metadata accessor for CarPlayIntercomControlModel);
      v46 = 1;
      sub_23E1D6C80();
      v23 = v34;
      v24 = v44;
      sub_23E1DB774();
      sub_23E1CEE3C(&qword_256D3B488, (uint64_t (*)(uint64_t))type metadata accessor for CarPlayIntercomControlModel, (uint64_t)&protocol conformance descriptor for CarPlayIntercomControlModel);
      v25 = v36;
      sub_23E1DB780();
      v26 = v35;
    }
    else
    {
      v21 = type metadata accessor for HomeDisambiguationModel;
      v22 = v38;
      sub_23E1CD2AC((uint64_t)v16, v38, type metadata accessor for HomeDisambiguationModel);
      v47 = 2;
      sub_23E1D6C3C();
      v23 = v39;
      v24 = v44;
      sub_23E1DB774();
      sub_23E1CEE3C(&qword_256D3B5E8, type metadata accessor for HomeDisambiguationModel, (uint64_t)&protocol conformance descriptor for HomeDisambiguationModel);
      v25 = v41;
      sub_23E1DB780();
      v26 = v40;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    v28 = v22;
  }
  else
  {
    v21 = (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchModel;
    sub_23E1CD2AC((uint64_t)v16, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for HomeAppLaunchModel);
    v45 = 0;
    sub_23E1D6CC4();
    v24 = v44;
    sub_23E1DB774();
    sub_23E1CEE3C(&qword_256D3B258, (uint64_t (*)(uint64_t))type metadata accessor for HomeAppLaunchModel, (uint64_t)&protocol conformance descriptor for HomeAppLaunchModel);
    v27 = v31;
    sub_23E1DB780();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v27);
    v28 = (uint64_t)v13;
  }
  sub_23E1D3978(v28, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v19, v24);
}

unint64_t sub_23E1D6BF8()
{
  unint64_t result;

  result = qword_256D3B5D8;
  if (!qword_256D3B5D8)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC740, &type metadata for HomeCommunicationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B5D8);
  }
  return result;
}

unint64_t sub_23E1D6C3C()
{
  unint64_t result;

  result = qword_256D3B5E0;
  if (!qword_256D3B5E0)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC6F0, &type metadata for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B5E0);
  }
  return result;
}

unint64_t sub_23E1D6C80()
{
  unint64_t result;

  result = qword_256D3B5F0;
  if (!qword_256D3B5F0)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC6A0, &type metadata for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B5F0);
  }
  return result;
}

unint64_t sub_23E1D6CC4()
{
  unint64_t result;

  result = qword_256D3B5F8;
  if (!qword_256D3B5F8)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC650, &type metadata for HomeCommunicationSnippetModel.AppLaunchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B5F8);
  }
  return result;
}

uint64_t HomeCommunicationSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  _QWORD *v61;
  uint64_t v62;
  char v63;
  char v64;
  char v65;

  v54 = a2;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B600);
  v53 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v55 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B608);
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v59 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B610);
  v48 = *(_QWORD *)(v6 - 8);
  v49 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v57 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B618);
  v56 = *(_QWORD *)(v58 - 8);
  MEMORY[0x24BDAC7A8](v58);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HomeCommunicationSnippetModel();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v43 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v43 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v43 - v20;
  v22 = a1[3];
  v61 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_23E1D6BF8();
  v60 = v9;
  v23 = v62;
  sub_23E1DB7BC();
  if (v23)
    goto LABEL_9;
  v44 = v16;
  v45 = v19;
  v46 = v13;
  v47 = v21;
  v24 = v57;
  v25 = v58;
  v27 = v59;
  v26 = v60;
  v62 = v10;
  v28 = sub_23E1DB768();
  if (*(_QWORD *)(v28 + 16) != 1)
  {
    v29 = v25;
    v30 = sub_23E1DB6F0();
    swift_allocError();
    v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B620);
    *v32 = v62;
    sub_23E1DB750();
    sub_23E1DB6E4();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BEE26D0], v30);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v26, v29);
LABEL_9:
    v37 = (uint64_t)v61;
    return __swift_destroy_boxed_opaque_existential_1(v37);
  }
  if (*(_BYTE *)(v28 + 32))
  {
    if (*(_BYTE *)(v28 + 32) == 1)
    {
      v64 = 1;
      sub_23E1D6C80();
      sub_23E1DB744();
      type metadata accessor for CarPlayIntercomControlModel();
      sub_23E1CEE3C(&qword_256D3B480, (uint64_t (*)(uint64_t))type metadata accessor for CarPlayIntercomControlModel, (uint64_t)&protocol conformance descriptor for CarPlayIntercomControlModel);
      v35 = (uint64_t)v44;
      v36 = v52;
      sub_23E1DB75C();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v27, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v26, v25);
      v37 = (uint64_t)v61;
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v65 = 2;
      sub_23E1D6C3C();
      v33 = v55;
      sub_23E1DB744();
      type metadata accessor for HomeDisambiguationModel(0);
      sub_23E1CEE3C(&qword_256D3B628, type metadata accessor for HomeDisambiguationModel, (uint64_t)&protocol conformance descriptor for HomeDisambiguationModel);
      v39 = (uint64_t)v46;
      v40 = v50;
      sub_23E1DB75C();
      v41 = v56;
      (*(void (**)(char *, uint64_t))(v53 + 8))(v33, v40);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v25);
      swift_storeEnumTagMultiPayload();
      v35 = v39;
      v37 = (uint64_t)v61;
    }
  }
  else
  {
    v63 = 0;
    sub_23E1D6CC4();
    sub_23E1DB744();
    type metadata accessor for HomeAppLaunchModel();
    sub_23E1CEE3C(&qword_256D3B250, (uint64_t (*)(uint64_t))type metadata accessor for HomeAppLaunchModel, (uint64_t)&protocol conformance descriptor for HomeAppLaunchModel);
    v35 = (uint64_t)v45;
    v38 = v49;
    sub_23E1DB75C();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v38);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v26, v25);
    v37 = (uint64_t)v61;
    swift_storeEnumTagMultiPayload();
  }
  v42 = (uint64_t)v47;
  sub_23E1CD2AC(v35, (uint64_t)v47, (uint64_t (*)(_QWORD))type metadata accessor for HomeCommunicationSnippetModel);
  sub_23E1CD2AC(v42, v54, (uint64_t (*)(_QWORD))type metadata accessor for HomeCommunicationSnippetModel);
  return __swift_destroy_boxed_opaque_existential_1(v37);
}

uint64_t sub_23E1D7388()
{
  return sub_23E1CEE3C(&qword_256D3B630, (uint64_t (*)(uint64_t))type metadata accessor for HomeCommunicationSnippetModel, (uint64_t)&protocol conformance descriptor for HomeCommunicationSnippetModel);
}

uint64_t sub_23E1D73B4()
{
  return sub_23E1CEE3C(&qword_256D3B638, (uint64_t (*)(uint64_t))type metadata accessor for HomeCommunicationSnippetModel, (uint64_t)&protocol conformance descriptor for HomeCommunicationSnippetModel);
}

unint64_t sub_23E1D73E0()
{
  return 0xD000000000000019;
}

uint64_t sub_23E1D73FC()
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
  char v9;
  char v10;
  uint64_t v12;

  v1 = v0;
  v2 = sub_23E1DB414();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E1D61A8(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEA8968], v2);
    sub_23E1CEE3C(&qword_256D3B5B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA89B0], MEMORY[0x24BEA89B8]);
    v9 = sub_23E1DB630();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v10 = v9 ^ 1;
  }
  else
  {
    v10 = 0;
  }
  sub_23E1D3978((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for HomeCommunicationSnippetModel);
  return v10 & 1;
}

uint64_t sub_23E1D7544@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeCommunicationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_23E1D7558(_QWORD *a1)
{
  return HomeCommunicationSnippetModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeCommunicationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
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
  void (*v27)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v28;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      v16(a1, a2, v15);
      v17 = (int *)type metadata accessor for HomeDisambiguationModel(0);
      v18 = v17[5];
      v19 = (char *)a1 + v18;
      v20 = (char *)a2 + v18;
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
      v22 = v17[6];
      v23 = (char *)a1 + v22;
      v24 = (char *)a2 + v22;
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
      v16((uint64_t *)((char *)a1 + v17[7]), (uint64_t *)((char *)a2 + v17[7]), v15);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      v9 = type metadata accessor for CarPlayIntercomControlModel();
      v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
      v10 = *(int *)(v9 + 24);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      v27 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
      v27(a1, a2, v26);
      v28 = type metadata accessor for HomeAppLaunchModel();
      v27((uint64_t *)((char *)a1 + *(int *)(v28 + 20)), (uint64_t *)((char *)a2 + *(int *)(v28 + 20)), v26);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HomeCommunicationSnippetModel(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
    v15(a1, v3);
    v5 = (int *)type metadata accessor for HomeDisambiguationModel(0);
    v6 = a1 + v5[5];
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
    v8 = a1 + v5[6];
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
    v4 = v5[7];
    return ((uint64_t (*)(uint64_t, uint64_t))v15)(a1 + v4, v3);
  }
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result)
      return result;
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
    v15(a1, v3);
    v4 = *(int *)(type metadata accessor for HomeAppLaunchModel() + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v15)(a1 + v4, v3);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(a1, v10);
  v12 = type metadata accessor for CarPlayIntercomControlModel();
  v11(a1 + *(int *)(v12 + 20), v10);
  v13 = a1 + *(int *)(v12 + 24);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

uint64_t initializeWithCopy for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    v13(a1, a2, v12);
    v14 = (int *)type metadata accessor for HomeDisambiguationModel(0);
    v15 = v14[5];
    v16 = a1 + v15;
    v17 = a2 + v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    v19 = v14[6];
    v20 = a1 + v19;
    v21 = a2 + v19;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    v13(a1 + v14[7], a2 + v14[7], v12);
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    if (EnumCaseMultiPayload == 1)
    {
      v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
      v6(a1, a2, v5);
      v7 = type metadata accessor for CarPlayIntercomControlModel();
      v6(a1 + *(int *)(v7 + 20), a2 + *(int *)(v7 + 20), v5);
      v8 = *(int *)(v7 + 24);
      v9 = a1 + v8;
      v10 = a2 + v8;
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
      v23(a1, a2, v5);
      v24 = type metadata accessor for HomeAppLaunchModel();
      v23(a1 + *(int *)(v24 + 20), a2 + *(int *)(v24 + 20), v5);
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;

  if (a1 != a2)
  {
    sub_23E1D3978(a1, (uint64_t (*)(_QWORD))type metadata accessor for HomeCommunicationSnippetModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
      v13(a1, a2, v12);
      v14 = (int *)type metadata accessor for HomeDisambiguationModel(0);
      v15 = v14[5];
      v16 = a1 + v15;
      v17 = a2 + v15;
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
      v19 = v14[6];
      v20 = a1 + v19;
      v21 = a2 + v19;
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
      v13(a1 + v14[7], a2 + v14[7], v12);
    }
    else
    {
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      if (EnumCaseMultiPayload == 1)
      {
        v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
        v6(a1, a2, v5);
        v7 = type metadata accessor for CarPlayIntercomControlModel();
        v6(a1 + *(int *)(v7 + 20), a2 + *(int *)(v7 + 20), v5);
        v8 = *(int *)(v7 + 24);
        v9 = a1 + v8;
        v10 = a2 + v8;
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      }
      else
      {
        v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
        v23(a1, a2, v5);
        v24 = type metadata accessor for HomeAppLaunchModel();
        v23(a1 + *(int *)(v24 + 20), a2 + *(int *)(v24 + 20), v5);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
    v13(a1, a2, v12);
    v14 = (int *)type metadata accessor for HomeDisambiguationModel(0);
    v15 = v14[5];
    v16 = a1 + v15;
    v17 = a2 + v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
    v19 = v14[6];
    v20 = a1 + v19;
    v21 = a2 + v19;
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
    v13(a1 + v14[7], a2 + v14[7], v12);
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    if (EnumCaseMultiPayload == 1)
    {
      v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32);
      v6(a1, a2, v5);
      v7 = type metadata accessor for CarPlayIntercomControlModel();
      v6(a1 + *(int *)(v7 + 20), a2 + *(int *)(v7 + 20), v5);
      v8 = *(int *)(v7 + 24);
      v9 = a1 + v8;
      v10 = a2 + v8;
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    }
    else
    {
      v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32);
      v23(a1, a2, v5);
      v24 = type metadata accessor for HomeAppLaunchModel();
      v23(a1 + *(int *)(v24 + 20), a2 + *(int *)(v24 + 20), v5);
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;

  if (a1 != a2)
  {
    sub_23E1D3978(a1, (uint64_t (*)(_QWORD))type metadata accessor for HomeCommunicationSnippetModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
      v13(a1, a2, v12);
      v14 = (int *)type metadata accessor for HomeDisambiguationModel(0);
      v15 = v14[5];
      v16 = a1 + v15;
      v17 = a2 + v15;
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      v19 = v14[6];
      v20 = a1 + v19;
      v21 = a2 + v19;
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
      v13(a1 + v14[7], a2 + v14[7], v12);
    }
    else
    {
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
      if (EnumCaseMultiPayload == 1)
      {
        v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32);
        v6(a1, a2, v5);
        v7 = type metadata accessor for CarPlayIntercomControlModel();
        v6(a1 + *(int *)(v7 + 20), a2 + *(int *)(v7 + 20), v5);
        v8 = *(int *)(v7 + 24);
        v9 = a1 + v8;
        v10 = a2 + v8;
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      }
      else
      {
        v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32);
        v23(a1, a2, v5);
        v24 = type metadata accessor for HomeAppLaunchModel();
        v23(a1 + *(int *)(v24 + 20), a2 + *(int *)(v24 + 20), v5);
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23E1D80D8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23E1D80E8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for HomeAppLaunchModel();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for CarPlayIntercomControlModel();
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for HomeDisambiguationModel(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for HomeCommunicationSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1D81D0 + 4 * byte_23E1DC1F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1D8204 + 4 * asc_23E1DC1F0[v4]))();
}

uint64_t sub_23E1D8204(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D820C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1D8214);
  return result;
}

uint64_t sub_23E1D8220(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1D8228);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1D822C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1D8234(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.CodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.CodingKeys;
}

uint64_t sub_23E1D825C()
{
  return 0;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.AppLaunchCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.AppLaunchCodingKeys;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys;
}

uint64_t _s28HomeCommunicationUIFramework29HomeCommunicationSnippetModelO19AppLaunchCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s28HomeCommunicationUIFramework29HomeCommunicationSnippetModelO19AppLaunchCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23E1D8314 + 4 * byte_23E1DC1FA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23E1D8334 + 4 * byte_23E1DC1FF[v4]))();
}

_BYTE *sub_23E1D8314(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23E1D8334(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23E1D833C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23E1D8344(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23E1D834C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23E1D8354(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys;
}

unint64_t sub_23E1D8374()
{
  unint64_t result;

  result = qword_256D3B6E8;
  if (!qword_256D3B6E8)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC400, &type metadata for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B6E8);
  }
  return result;
}

unint64_t sub_23E1D83BC()
{
  unint64_t result;

  result = qword_256D3B6F0;
  if (!qword_256D3B6F0)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC4B8, &type metadata for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B6F0);
  }
  return result;
}

unint64_t sub_23E1D8404()
{
  unint64_t result;

  result = qword_256D3B6F8;
  if (!qword_256D3B6F8)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC570, &type metadata for HomeCommunicationSnippetModel.AppLaunchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B6F8);
  }
  return result;
}

unint64_t sub_23E1D844C()
{
  unint64_t result;

  result = qword_256D3B700;
  if (!qword_256D3B700)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC628, &type metadata for HomeCommunicationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B700);
  }
  return result;
}

unint64_t sub_23E1D8494()
{
  unint64_t result;

  result = qword_256D3B708;
  if (!qword_256D3B708)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC4E0, &type metadata for HomeCommunicationSnippetModel.AppLaunchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B708);
  }
  return result;
}

unint64_t sub_23E1D84DC()
{
  unint64_t result;

  result = qword_256D3B710;
  if (!qword_256D3B710)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC508, &type metadata for HomeCommunicationSnippetModel.AppLaunchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B710);
  }
  return result;
}

unint64_t sub_23E1D8524()
{
  unint64_t result;

  result = qword_256D3B718;
  if (!qword_256D3B718)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC428, &type metadata for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B718);
  }
  return result;
}

unint64_t sub_23E1D856C()
{
  unint64_t result;

  result = qword_256D3B720;
  if (!qword_256D3B720)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC450, &type metadata for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B720);
  }
  return result;
}

unint64_t sub_23E1D85B4()
{
  unint64_t result;

  result = qword_256D3B728;
  if (!qword_256D3B728)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC370, &type metadata for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B728);
  }
  return result;
}

unint64_t sub_23E1D85FC()
{
  unint64_t result;

  result = qword_256D3B730;
  if (!qword_256D3B730)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC398, &type metadata for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B730);
  }
  return result;
}

unint64_t sub_23E1D8644()
{
  unint64_t result;

  result = qword_256D3B738;
  if (!qword_256D3B738)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC598, &type metadata for HomeCommunicationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B738);
  }
  return result;
}

unint64_t sub_23E1D868C()
{
  unint64_t result;

  result = qword_256D3B740;
  if (!qword_256D3B740)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC5C0, &type metadata for HomeCommunicationSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B740);
  }
  return result;
}

uint64_t sub_23E1D86D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x636E75614C707061 && a2 == 0xE900000000000068;
  if (v3 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000023E1DE390 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000023E1DE3B0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23E1DB78C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23E1D8818(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23E1DB78C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_23E1D8884()
{
  return 12383;
}

uint64_t HomeTarget.hash(into:)()
{
  sub_23E1DB33C();
  sub_23E1CEE3C(&qword_256D3B748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23E1DB624();
}

uint64_t HomeTarget.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23E1DB33C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t HomeTarget.init(id:name:selectHomeAction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_23E1DB33C();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  type metadata accessor for HomeTarget(0);
  sub_23E1DB3D8();
  sub_23E1D8A08();
  sub_23E1DB384();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
}

uint64_t type metadata accessor for HomeTarget(uint64_t a1)
{
  return sub_23E1D96F4(a1, (uint64_t *)&unk_256D3B840);
}

unint64_t sub_23E1D8A08()
{
  unint64_t result;

  result = qword_256D3B750;
  if (!qword_256D3B750)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256D3B750);
  }
  return result;
}

uint64_t sub_23E1D8A44(char a1)
{
  if (a1 == 2)
    return 0xD000000000000010;
  if (a1 == 1)
    return 1701667182;
  return 25705;
}

uint64_t sub_23E1D8A98()
{
  char *v0;

  return sub_23E1D8A44(*v0);
}

uint64_t sub_23E1D8AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1DB060(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23E1D8AC4()
{
  sub_23E1D8CF4();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D8AEC()
{
  sub_23E1D8CF4();
  return sub_23E1DB7E0();
}

uint64_t HomeTarget.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B758);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D8CF4();
  sub_23E1DB7C8();
  v8[15] = 0;
  sub_23E1DB33C();
  sub_23E1CEE3C(&qword_256D3B768, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23E1DB780();
  if (!v1)
  {
    type metadata accessor for HomeTarget(0);
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    sub_23E1D0CE4(&qword_256D3B238, MEMORY[0x24BEAD370]);
    sub_23E1DB780();
    v8[13] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
    sub_23E1D9308(&qword_256D3B770, MEMORY[0x24BEABA88]);
    sub_23E1DB780();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23E1D8CF4()
{
  unint64_t result;

  result = qword_256D3B760;
  if (!qword_256D3B760)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DCB64, &type metadata for HomeTarget.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B760);
  }
  return result;
}

uint64_t HomeTarget.hashValue.getter()
{
  sub_23E1DB798();
  sub_23E1DB33C();
  sub_23E1CEE3C(&qword_256D3B748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E1DB624();
  return sub_23E1DB7B0();
}

uint64_t HomeTarget.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;

  v28 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v30 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v31 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_23E1DB33C();
  v6 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B778);
  v8 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for HomeTarget(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D8CF4();
  v36 = v10;
  v14 = v38;
  sub_23E1DB7BC();
  if (v14)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v38 = v8;
  v25 = v11;
  v26 = v6;
  v15 = (uint64_t)v13;
  v16 = (uint64_t)a1;
  v17 = v31;
  v18 = v32;
  v19 = v33;
  v41 = 0;
  sub_23E1CEE3C(&qword_256D3B780, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v21 = v34;
  v20 = v35;
  sub_23E1DB75C();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v15, v21, v20);
  v40 = 1;
  sub_23E1D0CE4(&qword_256D3B248, MEMORY[0x24BEAD380]);
  sub_23E1DB75C();
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v15 + *(int *)(v25 + 20), v17, v19);
  v39 = 2;
  sub_23E1D9308(&qword_256D3B788, MEMORY[0x24BEABA90]);
  v22 = v29;
  v23 = v30;
  sub_23E1DB75C();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v37);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v15 + *(int *)(v25 + 24), v23, v22);
  sub_23E1D3600(v15, v28, type metadata accessor for HomeTarget);
  __swift_destroy_boxed_opaque_existential_1(v16);
  return sub_23E1D3978(v15, type metadata accessor for HomeTarget);
}

uint64_t sub_23E1D917C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23E1DB33C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_23E1D91B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeTarget.init(from:)(a1, a2);
}

uint64_t sub_23E1D91C8(_QWORD *a1)
{
  return HomeTarget.encode(to:)(a1);
}

uint64_t sub_23E1D91DC()
{
  sub_23E1DB798();
  sub_23E1DB33C();
  sub_23E1CEE3C(&qword_256D3B748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E1DB624();
  return sub_23E1DB7B0();
}

uint64_t sub_23E1D9248()
{
  sub_23E1DB33C();
  sub_23E1CEE3C(&qword_256D3B748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_23E1DB624();
}

uint64_t sub_23E1D92A0()
{
  sub_23E1DB798();
  sub_23E1DB33C();
  sub_23E1CEE3C(&qword_256D3B748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23E1DB624();
  return sub_23E1DB7B0();
}

uint64_t sub_23E1D9308(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B420);
    result = MEMORY[0x24264DB94](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t static HomeDisambiguationModel.responseViewId.getter()
{
  return 0xD000000000000028;
}

uint64_t sub_23E1D936C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23E1D93A4 + 4 * byte_23E1DC790[a1]))(0xD000000000000013, 0x800000023E1DE420);
}

uint64_t sub_23E1D93A4()
{
  return 0x6449656C646E7562;
}

uint64_t sub_23E1D93BC()
{
  return 0x74706D6F7270;
}

uint64_t sub_23E1D93D0()
{
  return 0x67726154656D6F68;
}

uint64_t sub_23E1D93F0()
{
  unsigned __int8 *v0;

  return sub_23E1D936C(*v0);
}

uint64_t sub_23E1D93F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23E1DB178(a1, a2);
  *a3 = result;
  return result;
}

void sub_23E1D941C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23E1D9428()
{
  sub_23E1D969C();
  return sub_23E1DB7D4();
}

uint64_t sub_23E1D9450()
{
  sub_23E1D969C();
  return sub_23E1DB7E0();
}

uint64_t HomeDisambiguationModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[2];
  char v9;
  char v10;
  char v11;
  char v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B790);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D969C();
  sub_23E1DB7C8();
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  sub_23E1D0CE4(&qword_256D3B238, MEMORY[0x24BEAD370]);
  sub_23E1DB780();
  if (!v1)
  {
    v8[1] = type metadata accessor for HomeDisambiguationModel(0);
    v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    sub_23E1D9C40(&qword_256D3B7A0, MEMORY[0x24BEAD370]);
    sub_23E1DB780();
    v10 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    sub_23E1D49D0(&qword_256D3B468, MEMORY[0x24BEAD370]);
    sub_23E1DB780();
    v9 = 3;
    sub_23E1DB780();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_23E1D969C()
{
  unint64_t result;

  result = qword_256D3B798;
  if (!qword_256D3B798)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DCB14, &type metadata for HomeDisambiguationModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B798);
  }
  return result;
}

uint64_t type metadata accessor for HomeDisambiguationModel(uint64_t a1)
{
  return sub_23E1D96F4(a1, (uint64_t *)&unk_256D3B8E0);
}

uint64_t sub_23E1D96F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23E1D9728(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B7B0);
    v10 = sub_23E1CEE3C(a2, type metadata accessor for HomeTarget, a3);
    result = MEMORY[0x24264DB94](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t HomeDisambiguationModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, char *, uint64_t);
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD v31[2];
  char *v32;
  int *v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  char v51;

  v35 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v39 = *(_QWORD *)(v45 - 8);
  v7 = MEMORY[0x24BDAC7A8](v45);
  v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v44 = (void (*)(uint64_t, char *, uint64_t))((char *)v31 - v10);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B7D0);
  v11 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for HomeDisambiguationModel(0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23E1D969C();
  v46 = v13;
  v17 = v47;
  sub_23E1DB7BC();
  if (v17)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v47 = v11;
  v32 = v9;
  v33 = (int *)v14;
  v18 = (uint64_t)v16;
  v20 = v40;
  v19 = v41;
  v34 = a1;
  v21 = v42;
  v51 = 0;
  v22 = sub_23E1D0CE4(&qword_256D3B248, MEMORY[0x24BEAD380]);
  v23 = v45;
  sub_23E1DB75C();
  v24 = v23;
  v31[1] = v22;
  v25 = *(void (**)(uint64_t, char *, uint64_t))(v39 + 32);
  v25(v18, (char *)v44, v24);
  v50 = 1;
  sub_23E1D9C40(&qword_256D3B7D8, MEMORY[0x24BEAD380]);
  sub_23E1DB75C();
  v44 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v18 + v33[5], v20, v21);
  v49 = 2;
  sub_23E1D49D0(&qword_256D3B478, MEMORY[0x24BEAD380]);
  v26 = v36;
  v27 = v38;
  sub_23E1DB75C();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v18 + v33[6], v26, v27);
  v48 = 3;
  v28 = v32;
  v29 = v45;
  sub_23E1DB75C();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v43);
  v44(v18 + v33[7], v28, v29);
  sub_23E1D3600(v18, v35, type metadata accessor for HomeDisambiguationModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return sub_23E1D3978(v18, type metadata accessor for HomeDisambiguationModel);
}

uint64_t sub_23E1D9C40(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B328);
    v6[0] = sub_23E1D9728(&qword_256D3B7A8, &qword_256D3B7B8, (uint64_t)&protocol conformance descriptor for HomeTarget, MEMORY[0x24BEE12D0]);
    v6[1] = sub_23E1D9728(&qword_256D3B7C0, &qword_256D3B7C8, (uint64_t)&protocol conformance descriptor for HomeTarget, MEMORY[0x24BEE12A0]);
    result = MEMORY[0x24264DB94](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23E1D9CEC()
{
  return sub_23E1CEE3C(&qword_256D3B7B8, type metadata accessor for HomeTarget, (uint64_t)&protocol conformance descriptor for HomeTarget);
}

uint64_t sub_23E1D9D18()
{
  return sub_23E1CEE3C(&qword_256D3B7C8, type metadata accessor for HomeTarget, (uint64_t)&protocol conformance descriptor for HomeTarget);
}

uint64_t sub_23E1D9D44()
{
  return sub_23E1CEE3C(&qword_256D3B748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_23E1D9D70()
{
  return sub_23E1CEE3C(&qword_256D3B7E0, type metadata accessor for HomeTarget, (uint64_t)&protocol conformance descriptor for HomeTarget);
}

uint64_t sub_23E1D9D9C()
{
  return sub_23E1CEE3C(&qword_256D3B628, type metadata accessor for HomeDisambiguationModel, (uint64_t)&protocol conformance descriptor for HomeDisambiguationModel);
}

uint64_t sub_23E1D9DC8()
{
  return sub_23E1CEE3C(&qword_256D3B5E8, type metadata accessor for HomeDisambiguationModel, (uint64_t)&protocol conformance descriptor for HomeDisambiguationModel);
}

uint64_t sub_23E1D9DF4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeDisambiguationModel.init(from:)(a1, a2);
}

uint64_t sub_23E1D9E08(_QWORD *a1)
{
  return HomeDisambiguationModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeTarget(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23E1DB33C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for HomeTarget(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_23E1DB33C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 24);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_23E1DB33C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_23E1DB33C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_23E1DB33C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_23E1DB33C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeTarget()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1DA27C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_23E1DB33C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for HomeTarget()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1DA328(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_23E1DB33C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B420);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23E1DA3D0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23E1DB33C();
  if (v0 <= 0x3F)
  {
    sub_23E1D5500(319, qword_256D3B2C8);
    if (v1 <= 0x3F)
    {
      sub_23E1DA480();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_23E1DA480()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D3B850)
  {
    sub_23E1D8A08();
    v0 = sub_23E1DB39C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D3B850);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeDisambiguationModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
  }
  return a1;
}

uint64_t destroy for HomeDisambiguationModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v10(a1, v4);
  v5 = a1 + a2[5];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(a1 + a2[7], v4);
}

uint64_t initializeWithCopy for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t assignWithCopy for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t initializeWithTake for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t assignWithTake for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeDisambiguationModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1DAA14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for HomeDisambiguationModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23E1DAAC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B008);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B328);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256D3B010);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23E1DAB70()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23E1D5500(319, qword_256D3B2C8);
  if (v0 <= 0x3F)
  {
    sub_23E1DAC30();
    if (v1 <= 0x3F)
    {
      sub_23E1D5500(319, qword_256D3B4F8);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_23E1DAC30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256D3B8F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256D3B7B0);
    v0 = sub_23E1DB408();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256D3B8F0);
  }
}

uint64_t getEnumTagSinglePayload for HomeDisambiguationModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HomeDisambiguationModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1DAD64 + 4 * byte_23E1DC799[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23E1DAD98 + 4 * byte_23E1DC794[v4]))();
}

uint64_t sub_23E1DAD98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1DADA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1DADA8);
  return result;
}

uint64_t sub_23E1DADB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1DADBCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23E1DADC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1DADC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeDisambiguationModel.CodingKeys()
{
  return &type metadata for HomeDisambiguationModel.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for HomeTarget.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23E1DAE30 + 4 * byte_23E1DC7A3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23E1DAE64 + 4 * byte_23E1DC79E[v4]))();
}

uint64_t sub_23E1DAE64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1DAE6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23E1DAE74);
  return result;
}

uint64_t sub_23E1DAE80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23E1DAE88);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23E1DAE8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23E1DAE94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeTarget.CodingKeys()
{
  return &type metadata for HomeTarget.CodingKeys;
}

unint64_t sub_23E1DAEB4()
{
  unint64_t result;

  result = qword_256D3B928;
  if (!qword_256D3B928)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DCA34, &type metadata for HomeTarget.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B928);
  }
  return result;
}

unint64_t sub_23E1DAEFC()
{
  unint64_t result;

  result = qword_256D3B930;
  if (!qword_256D3B930)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DCAEC, &type metadata for HomeDisambiguationModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B930);
  }
  return result;
}

unint64_t sub_23E1DAF44()
{
  unint64_t result;

  result = qword_256D3B938;
  if (!qword_256D3B938)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DCA5C, &type metadata for HomeDisambiguationModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B938);
  }
  return result;
}

unint64_t sub_23E1DAF8C()
{
  unint64_t result;

  result = qword_256D3B940;
  if (!qword_256D3B940)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DCA84, &type metadata for HomeDisambiguationModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B940);
  }
  return result;
}

unint64_t sub_23E1DAFD4()
{
  unint64_t result;

  result = qword_256D3B948;
  if (!qword_256D3B948)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC9A4, &type metadata for HomeTarget.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B948);
  }
  return result;
}

unint64_t sub_23E1DB01C()
{
  unint64_t result;

  result = qword_256D3B950;
  if (!qword_256D3B950)
  {
    result = MEMORY[0x24264DB94](&unk_23E1DC9CC, &type metadata for HomeTarget.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256D3B950);
  }
  return result;
}

uint64_t sub_23E1DB060(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023E1DE400)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_23E1DB78C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_23E1DB178(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x67726154656D6F68 && a2 == 0xEB00000000737465 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023E1DE420 || (sub_23E1DB78C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74706D6F7270 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_23E1DB78C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t _s28HomeCommunicationUIFramework0A6TargetV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23E1DB33C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23E1DB348()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_23E1DB354()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_23E1DB360()
{
  return MEMORY[0x24BEAB3D8]();
}

uint64_t sub_23E1DB36C()
{
  return MEMORY[0x24BEAB428]();
}

uint64_t sub_23E1DB378()
{
  return MEMORY[0x24BEAB538]();
}

uint64_t sub_23E1DB384()
{
  return MEMORY[0x24BEABA58]();
}

uint64_t sub_23E1DB390()
{
  return MEMORY[0x24BEABA68]();
}

uint64_t sub_23E1DB39C()
{
  return MEMORY[0x24BEABA78]();
}

uint64_t sub_23E1DB3A8()
{
  return MEMORY[0x24BEAD1B8]();
}

uint64_t sub_23E1DB3B4()
{
  return MEMORY[0x24BEAD200]();
}

uint64_t sub_23E1DB3C0()
{
  return MEMORY[0x24BEAD2C0]();
}

uint64_t sub_23E1DB3CC()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_23E1DB3D8()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_23E1DB3E4()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_23E1DB3F0()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_23E1DB3FC()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_23E1DB408()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_23E1DB414()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t sub_23E1DB420()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23E1DB42C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23E1DB438()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23E1DB444()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_23E1DB450()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_23E1DB45C()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_23E1DB468()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_23E1DB474()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_23E1DB480()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_23E1DB48C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_23E1DB498()
{
  return MEMORY[0x24BEAD768]();
}

uint64_t sub_23E1DB4A4()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_23E1DB4B0()
{
  return MEMORY[0x24BEAD7E0]();
}

uint64_t sub_23E1DB4BC()
{
  return MEMORY[0x24BEAD818]();
}

uint64_t sub_23E1DB4C8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23E1DB4D4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_23E1DB4E0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_23E1DB4EC()
{
  return MEMORY[0x24BDF29C8]();
}

uint64_t sub_23E1DB4F8()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_23E1DB504()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_23E1DB510()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_23E1DB51C()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_23E1DB528()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_23E1DB534()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_23E1DB540()
{
  return MEMORY[0x24BEADAD8]();
}

uint64_t sub_23E1DB54C()
{
  return MEMORY[0x24BEADAF8]();
}

uint64_t sub_23E1DB558()
{
  return MEMORY[0x24BEADB08]();
}

uint64_t sub_23E1DB564()
{
  return MEMORY[0x24BEADBC8]();
}

uint64_t sub_23E1DB570()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_23E1DB57C()
{
  return MEMORY[0x24BEADCA0]();
}

uint64_t sub_23E1DB588()
{
  return MEMORY[0x24BEADDA0]();
}

uint64_t sub_23E1DB594()
{
  return MEMORY[0x24BEADDC0]();
}

uint64_t sub_23E1DB5A0()
{
  return MEMORY[0x24BEADE28]();
}

uint64_t sub_23E1DB5AC()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_23E1DB5B8()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_23E1DB5C4()
{
  return MEMORY[0x24BEADEF0]();
}

uint64_t sub_23E1DB5D0()
{
  return MEMORY[0x24BEADEF8]();
}

uint64_t sub_23E1DB5DC()
{
  return MEMORY[0x24BEADF18]();
}

uint64_t sub_23E1DB5E8()
{
  return MEMORY[0x24BEADF28]();
}

uint64_t sub_23E1DB5F4()
{
  return MEMORY[0x24BEAE088]();
}

uint64_t sub_23E1DB600()
{
  return MEMORY[0x24BEAE098]();
}

uint64_t sub_23E1DB60C()
{
  return MEMORY[0x24BEAE468]();
}

uint64_t sub_23E1DB618()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_23E1DB624()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23E1DB630()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23E1DB63C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23E1DB648()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23E1DB654()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_23E1DB660()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23E1DB66C()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_23E1DB678()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23E1DB684()
{
  return MEMORY[0x24BEAE620]();
}

uint64_t sub_23E1DB690()
{
  return MEMORY[0x24BEAE638]();
}

uint64_t sub_23E1DB69C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23E1DB6A8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23E1DB6B4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23E1DB6C0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23E1DB6CC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23E1DB6D8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23E1DB6E4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23E1DB6F0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23E1DB6FC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23E1DB708()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23E1DB714()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23E1DB720()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_23E1DB72C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23E1DB738()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23E1DB744()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23E1DB750()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23E1DB75C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23E1DB768()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23E1DB774()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23E1DB780()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23E1DB78C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23E1DB798()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23E1DB7A4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23E1DB7B0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23E1DB7BC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23E1DB7C8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23E1DB7D4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23E1DB7E0()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

