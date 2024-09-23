void sub_235DC6AF8()
{
  qword_25429B408 = 0x5F454349564544;
  unk_25429B410 = 0xE700000000000000;
}

void sub_235DC6B1C()
{
  strcpy((char *)&qword_25429B450, "LocalDeviceID");
  *(_WORD *)&algn_25429B458[6] = -4864;
}

void sub_235DC6B4C()
{
  strcpy((char *)&qword_25429B440, "DeviceIdleMax");
  *(_WORD *)&algn_25429B448[6] = -4864;
}

uint64_t sub_235DC6B7C@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DC6D98(a1);
}

uint64_t sub_235DC6B90()
{
  return sub_235DC6E24();
}

uint64_t sub_235DC6BA4()
{
  return sub_235DC6EAC();
}

uint64_t sub_235DC6BB8()
{
  return sub_235DC6F28();
}

uint64_t (*sub_235DC6BCC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235DE0114();
  return sub_235DC6C44;
}

uint64_t sub_235DC6C48()
{
  return sub_235DC7060();
}

uint64_t sub_235DC6C54(uint64_t a1)
{
  return sub_235DC70CC(a1);
}

uint64_t sub_235DC6C60()
{
  return sub_235DC71E8();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E1A88]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235DC6CAC(uint64_t a1)
{
  return sub_235DC7250(a1);
}

uint64_t (*sub_235DC6CB8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381268);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__allSuggestions;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  sub_235DE00FC();
  swift_endAccess();
  return sub_235DC6D80;
}

uint64_t sub_235DC6D84@<X0>(_QWORD *a1@<X8>)
{
  return sub_235DC6D98(a1);
}

uint64_t sub_235DC6D98@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235DE0120();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_235DC6E10()
{
  return sub_235DC6E24();
}

uint64_t sub_235DC6E24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_235DE012C();
}

uint64_t sub_235DC6E98()
{
  return sub_235DC6EAC();
}

uint64_t sub_235DC6EAC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_235DE0120();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_235DC6F14()
{
  return sub_235DC6F28();
}

uint64_t sub_235DC6F28()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_235DE012C();
}

uint64_t (*sub_235DC6F90(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_235DE0114();
  return sub_235DC6C44;
}

void sub_235DC7008(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_235DC7054()
{
  return sub_235DC7060();
}

uint64_t sub_235DC7060()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  sub_235DE00FC();
  return swift_endAccess();
}

uint64_t sub_235DC70C0(uint64_t a1)
{
  return sub_235DC70CC(a1);
}

uint64_t sub_235DC70CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381268);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - v7;
  v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  sub_235DE0108();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_235DC71DC()
{
  return sub_235DC71E8();
}

uint64_t sub_235DC71E8()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  sub_235DE00FC();
  return swift_endAccess();
}

uint64_t sub_235DC7244(uint64_t a1)
{
  return sub_235DC7250(a1);
}

uint64_t sub_235DC7250(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381268);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  sub_235DE0108();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_235DC7324(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381268);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__filteredSuggestions;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  sub_235DE00FC();
  swift_endAccess();
  return sub_235DC6D80;
}

void sub_235DC73EC(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_235DE0108();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_235DE0108();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

unint64_t sub_235DC7504(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B380);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812E0);
  v6 = sub_235DE03B4();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_235DD8E9C(v12, (uint64_t)v5, &qword_25429B380);
    v14 = *v5;
    v15 = v5[1];
    result = sub_235DDBF18(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = type metadata accessor for AccountSuggestion();
    result = sub_235DCE300(v9, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
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

unint64_t sub_235DC769C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B378);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C0);
  v6 = sub_235DE03B4();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_235DD8E9C(v12, (uint64_t)v5, &qword_25429B378);
    v14 = *v5;
    v15 = v5[1];
    result = sub_235DDBF18(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = sub_235DE0078();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v9, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
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

unint64_t sub_235DC783C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812C0);
  v2 = sub_235DE03B4();
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
    sub_235DD8E9C(v6, (uint64_t)&v15, &qword_2563812C8);
    v7 = v15;
    v8 = v16;
    result = sub_235DDBF18(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_235DD8AF8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_235DC7970@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_235DC79F0(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID, a2);
}

uint64_t sub_235DC797C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_235DC7A4C(a1, a2, a3, a4, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
}

uint64_t sub_235DC7988()
{
  return sub_235DC7ABC();
}

uint64_t sub_235DC7994(uint64_t a1)
{
  return sub_235DC7B0C(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
}

uint64_t (*sub_235DC79A0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235DC79E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_235DC79F0(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates, a2);
}

uint64_t sub_235DC79F0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235DC7A40(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_235DC7A4C(a1, a2, a3, a4, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
}

uint64_t sub_235DC7A4C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235DC7AB0()
{
  return sub_235DC7ABC();
}

uint64_t sub_235DC7ABC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_235DC7B00(uint64_t a1)
{
  return sub_235DC7B0C(a1, &OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
}

uint64_t sub_235DC7B0C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_235DC7B58())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235DC7B9C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_235DC7BEC(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_235DC7C38()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_235DC7C7C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_235DC7CC4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_235DC7D0C()
{
  uint64_t v0;

  v0 = sub_235DE00CC();
  __swift_allocate_value_buffer(v0, qword_25429B2B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25429B2B8);
  return sub_235DE00C0();
}

uint64_t static AccountSuggestionManager.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25429B310 != -1)
    swift_once();
  v2 = sub_235DE00CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static AccountSuggestionManager.logger.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_25429B310 != -1)
    swift_once();
  v2 = sub_235DE00CC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static AccountSuggestionManager.logger.modify())()
{
  uint64_t v0;

  if (qword_25429B310 != -1)
    swift_once();
  v0 = sub_235DE00CC();
  __swift_project_value_buffer(v0, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235DC7F5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v1 = v0;
  v2 = sub_235DE009C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  v7 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults);
  if (!v7)
    goto LABEL_6;
  v8 = qword_25429B320;
  v9 = v7;
  if (v8 != -1)
    swift_once();
  v10 = (void *)sub_235DE01EC();
  v11 = objc_msgSend(v9, sel_stringForKey_, v10);

  if (v11)
  {
    v12 = sub_235DE01F8();

    return v12;
  }
  else
  {
LABEL_6:
    sub_235DE0090();
    v14 = sub_235DE0084();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v15 = *(void **)(v1 + v6);
    if (v15)
    {
      v16 = v15;
      v17 = (void *)sub_235DE01EC();
      if (qword_25429B320 != -1)
        swift_once();
      v18 = (void *)sub_235DE01EC();
      objc_msgSend(v16, sel_setObject_forKey_, v17, v18);

    }
    return v14;
  }
}

uint64_t sub_235DC8114@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_OWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_235DD8D44;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_235DC832C(v4);
}

uint64_t sub_235DC81A8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_235DD8D2C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_235DC832C(v3);
  return sub_235DC8398(v8);
}

uint64_t sub_235DC8260(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *))
{
  uint64_t v6;
  _QWORD v8[2];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v8[0] = sub_235DCE0C8;
  v8[1] = v6;
  a3(v8);
  return swift_release();
}

uint64_t sub_235DC82D4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  v2 = *v1;
  sub_235DC832C(*v1);
  return v2;
}

uint64_t sub_235DC832C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_235DC833C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_235DC8398(v6);
}

uint64_t sub_235DC8398(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*sub_235DC83A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_235DC83EC()
{
  return 1;
}

uint64_t sub_235DC83F4()
{
  sub_235DE0420();
  sub_235DE042C();
  return sub_235DE0438();
}

uint64_t sub_235DC8434()
{
  return sub_235DE042C();
}

uint64_t sub_235DC8458()
{
  sub_235DE0420();
  sub_235DE042C();
  return sub_235DE0438();
}

const char *sub_235DC8494()
{
  return "AccountsUI";
}

const char *sub_235DC84A8()
{
  return "Sync";
}

uint64_t sub_235DC84BC()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for AccountSuggestionManager.Flags;
  v4 = sub_235DC8508();
  v0 = sub_235DE00A8();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_235DC8508()
{
  unint64_t result;

  result = qword_25429B308;
  if (!qword_25429B308)
  {
    result = MEMORY[0x23B7E1AA0](&unk_235DE0B08, &type metadata for AccountSuggestionManager.Flags);
    atomic_store(result, (unint64_t *)&qword_25429B308);
  }
  return result;
}

uint64_t AccountSuggestionManager.__allocating_init(uiMode:)(int a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AccountSuggestionManager.init(uiMode:)(a1);
  return v2;
}

uint64_t AccountSuggestionManager.init(uiMode:)(int a1)
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
  void (*v13)(uint64_t, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  _QWORD *v26;
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
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t result;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  _QWORD aBlock[6];

  v2 = v1;
  v62 = a1;
  v3 = sub_235DE02B8();
  v60 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v59 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235DE02A0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_235DE0168();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__allSuggestions;
  v12 = MEMORY[0x24BEE4AF8];
  aBlock[0] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B388);
  sub_235DE00F0();
  v13 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v13(v11, v10, v7);
  v14 = v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__filteredSuggestions;
  aBlock[0] = v12;
  sub_235DE00F0();
  v13(v14, v10, v7);
  v15 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID;
  *(_QWORD *)(v1 + v15) = sub_235DC7504(v12);
  v16 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates;
  *(_QWORD *)(v1 + v16) = sub_235DC769C(v12);
  v17 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue;
  sub_235DD8B90(0, &qword_25429B3B8);
  sub_235DE015C();
  aBlock[0] = v12;
  sub_235DCE108(&qword_25429B3B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3A0);
  sub_235DCE148(&qword_25429B3A8, &qword_25429B3A0);
  sub_235DE0318();
  (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v59, *MEMORY[0x24BEE5758], v61);
  *(_QWORD *)(v1 + v17) = sub_235DE02DC();
  v18 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
  v19 = objc_allocWithZone(MEMORY[0x24BDD1888]);
  v20 = (void *)sub_235DE01EC();
  v21 = objc_msgSend(v19, sel_initWithStoreIdentifier_type_, v20, 1);

  *(_QWORD *)(v2 + v18) = v21;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvsSubscriber) = 0;
  v22 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  v23 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v24 = (void *)sub_235DE01EC();
  v25 = objc_msgSend(v23, sel_initWithSuiteName_, v24);

  *(_QWORD *)(v2 + v22) = v25;
  v26 = (_QWORD *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  *v26 = 0;
  v26[1] = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem) = 0;
  v27 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_accountTypesThatNeedProperties;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_235DE08B0;
  *(_QWORD *)(v28 + 32) = sub_235DE01F8();
  *(_QWORD *)(v28 + 40) = v29;
  *(_QWORD *)(v28 + 48) = sub_235DE01F8();
  *(_QWORD *)(v28 + 56) = v30;
  *(_QWORD *)(v28 + 64) = sub_235DE01F8();
  *(_QWORD *)(v28 + 72) = v31;
  *(_QWORD *)(v28 + 80) = sub_235DE01F8();
  *(_QWORD *)(v28 + 88) = v32;
  *(_QWORD *)(v28 + 96) = sub_235DE01F8();
  *(_QWORD *)(v28 + 104) = v33;
  *(_QWORD *)(v28 + 112) = sub_235DE01F8();
  *(_QWORD *)(v28 + 120) = v34;
  *(_QWORD *)(v2 + v27) = v28;
  v35 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_supportedAccountTypes;
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_235DE08C0;
  *(_QWORD *)(v36 + 32) = sub_235DE01F8();
  *(_QWORD *)(v36 + 40) = v37;
  *(_QWORD *)(v36 + 48) = sub_235DE01F8();
  *(_QWORD *)(v36 + 56) = v38;
  *(_QWORD *)(v36 + 64) = sub_235DE01F8();
  *(_QWORD *)(v36 + 72) = v39;
  *(_QWORD *)(v36 + 80) = sub_235DE01F8();
  *(_QWORD *)(v36 + 88) = v40;
  *(_QWORD *)(v36 + 96) = sub_235DE01F8();
  *(_QWORD *)(v36 + 104) = v41;
  *(_QWORD *)(v36 + 112) = sub_235DE01F8();
  *(_QWORD *)(v36 + 120) = v42;
  *(_QWORD *)(v36 + 128) = sub_235DE01F8();
  *(_QWORD *)(v36 + 136) = v43;
  *(_QWORD *)(v36 + 144) = sub_235DE01F8();
  *(_QWORD *)(v36 + 152) = v44;
  *(_QWORD *)(v36 + 160) = sub_235DE01F8();
  *(_QWORD *)(v36 + 168) = v45;
  *(_QWORD *)(v36 + 176) = sub_235DE01F8();
  *(_QWORD *)(v36 + 184) = v46;
  *(_QWORD *)(v36 + 192) = sub_235DE01F8();
  *(_QWORD *)(v36 + 200) = v47;
  *(_QWORD *)(v36 + 208) = sub_235DE01F8();
  *(_QWORD *)(v36 + 216) = v48;
  *(_QWORD *)(v36 + 224) = sub_235DE01F8();
  *(_QWORD *)(v36 + 232) = v49;
  *(_QWORD *)(v36 + 240) = sub_235DE01F8();
  *(_QWORD *)(v36 + 248) = v50;
  *(_QWORD *)(v36 + 256) = sub_235DE01F8();
  *(_QWORD *)(v36 + 264) = v51;
  *(_QWORD *)(v2 + v35) = v36;
  v52 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_locallySupportedAccountTypes;
  *(_QWORD *)(v2 + v52) = sub_235DCDEE8();
  *(_BYTE *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode) = v62;
  v53 = *(void **)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = sub_235DD8FA4;
  *(_QWORD *)(v54 + 24) = v2;
  aBlock[4] = sub_235DCE0C8;
  aBlock[5] = v54;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC8CC4;
  aBlock[3] = &block_descriptor;
  v55 = _Block_copy(aBlock);
  v56 = v53;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v56, v55);

  _Block_release(v55);
  LOBYTE(v55) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v55 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v58 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    objc_msgSend(v58, sel_addObserver_selector_name_object_, v2, sel_reloadDelay_, *MEMORY[0x24BDD1378], 0);

    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs), sel_synchronize);
    swift_release();
    return v2;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E1A94](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235DC8CC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_235DC8CE4()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_reloadDelay_, *MEMORY[0x24BDD1378], 0);

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs), sel_synchronize);
}

uint64_t sub_235DC8D60()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v2, sel_removeObserver_name_object_, v1, *MEMORY[0x24BDD1378], 0);

  v3 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvsSubscriber;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvsSubscriber))
  {
    swift_retain();
    sub_235DE00D8();
    swift_release();
  }
  *(_QWORD *)(v1 + v3) = 0;
  return swift_release();
}

uint64_t sub_235DC8E00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  void *v12;
  id v13;
  uint32_t v14;
  double v15;
  void (*v16)(char *, uint64_t);
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v2 = sub_235DE0180();
  v20 = *(_QWORD *)(v2 - 8);
  v21 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v19 - v6;
  v8 = sub_235DE0144();
  MEMORY[0x24BDAC7A8](v8);
  v9 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem;
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem))
  {
    swift_retain();
    sub_235DE0198();
    swift_release();
  }
  aBlock[4] = sub_235DD8D00;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = &block_descriptor_70;
  _Block_copy(aBlock);
  v22 = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  sub_235DE01A4();
  swift_allocObject();
  v10 = sub_235DE018C();
  swift_release();
  *(_QWORD *)(a1 + v9) = v10;
  result = swift_release();
  if (*(_QWORD *)(a1 + v9))
  {
    v12 = *(void **)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
    swift_retain();
    v13 = v12;
    sub_235DE0174();
    v14 = arc4random();
    v15 = fmod((double)v14, 5.0);
    MEMORY[0x23B7E1500](v5, v15);
    v16 = *(void (**)(char *, uint64_t))(v20 + 8);
    v17 = v5;
    v18 = v21;
    v16(v17, v21);
    sub_235DE02AC();
    swift_release();

    return ((uint64_t (*)(char *, uint64_t))v16)(v7, v18);
  }
  return result;
}

uint64_t sub_235DC9070(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v2 = sub_235DE00CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25429B310 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_235DE00B4();
  v8 = sub_235DE0294();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_235DC5000, v7, v8, "reloading after delay", v9, 2u);
    MEMORY[0x23B7E1B3C](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_235DCA8CC();
  *(_QWORD *)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_previousWorkItem) = 0;
  return swift_release();
}

uint64_t sub_235DC91E0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_235DC9244()
{
  return sub_235DCA6C8((uint64_t)sub_235DCE100, (uint64_t)&block_descriptor_9);
}

void sub_235DC9258(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  int64_t v40;
  __int128 v41;
  _OWORD v42[2];
  uint64_t aBlock;
  uint64_t v44;
  _QWORD v45[5];

  v2 = sub_235DE0144();
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v36 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235DE0168();
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
  v7 = *(void **)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
  if (v7)
  {
    v8 = objc_msgSend(v7, sel_dictionaryRepresentation);
    v9 = sub_235DE01D4();

  }
  else
  {
    v9 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
  }
  v10 = 0;
  v11 = *(_QWORD *)(v9 + 64);
  v39 = v9 + 64;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v40 = (unint64_t)(v12 + 63) >> 6;
  v32 = v40 - 1;
  while (1)
  {
    if (v14)
    {
      v17 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v18 = v17 | (v10 << 6);
LABEL_11:
      v19 = *(_QWORD *)(v9 + 56);
      v20 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v18);
      v21 = v20[1];
      *(_QWORD *)&v41 = *v20;
      *((_QWORD *)&v41 + 1) = v21;
      sub_235DD3C20(v19 + 32 * v18, (uint64_t)v42);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    v22 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v22 < v40)
    {
      v23 = *(_QWORD *)(v39 + 8 * v22);
      if (v23)
        goto LABEL_15;
      v24 = v10 + 2;
      ++v10;
      if (v22 + 1 < v40)
      {
        v23 = *(_QWORD *)(v39 + 8 * v24);
        if (v23)
          goto LABEL_18;
        v10 = v22 + 1;
        if (v22 + 2 < v40)
        {
          v23 = *(_QWORD *)(v39 + 8 * (v22 + 2));
          if (v23)
          {
            v22 += 2;
            goto LABEL_15;
          }
          v24 = v22 + 3;
          v10 = v22 + 2;
          if (v22 + 3 < v40)
            break;
        }
      }
    }
LABEL_29:
    v14 = 0;
    memset(v42, 0, sizeof(v42));
    v41 = 0u;
LABEL_30:
    sub_235DD8CB4((uint64_t)&v41, (uint64_t)&aBlock, &qword_25429B370);
    if (!v44)
    {
      swift_release();
      objc_msgSend(*(id *)(a1 + v6), sel_synchronize);
      sub_235DCD2BC();
      sub_235DD8B90(0, &qword_25429B3B8);
      v26 = (void *)sub_235DE02C4();
      v45[2] = sub_235DD8E98;
      v45[3] = a1;
      aBlock = MEMORY[0x24BDAC760];
      v44 = 1107296256;
      v45[0] = sub_235DC91DC;
      v45[1] = &block_descriptor_88;
      v27 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      v28 = v33;
      sub_235DE0150();
      aBlock = MEMORY[0x24BEE4AF8];
      sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
      sub_235DCE148(&qword_25429B398, &qword_25429B390);
      v29 = v36;
      v30 = v38;
      sub_235DE0318();
      MEMORY[0x23B7E1620](0, v28, v29, v27);
      _Block_release(v27);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v30);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v35);
      return;
    }
    v25 = *(void **)(a1 + v6);
    if (v25)
    {
      v15 = v25;
      v16 = (void *)sub_235DE01EC();
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_removeObjectForKey_, v16);

    }
    else
    {
      swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  }
  v23 = *(_QWORD *)(v39 + 8 * v24);
  if (v23)
  {
LABEL_18:
    v22 = v24;
LABEL_15:
    v14 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v22 << 6);
    v10 = v22;
    goto LABEL_11;
  }
  while (1)
  {
    v22 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v22 >= v40)
    {
      v10 = v32;
      goto LABEL_29;
    }
    v23 = *(_QWORD *)(v39 + 8 * v22);
    ++v24;
    if (v23)
      goto LABEL_15;
  }
LABEL_35:
  __break(1u);
}

uint64_t sub_235DC96E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v23 = a5;
  v24 = sub_235DE0144();
  v27 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235DE0168();
  v25 = *(_QWORD *)(v14 - 8);
  v26 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void **)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a1;
  v18[5] = a2;
  v18[6] = v23;
  v18[7] = a6;
  v18[8] = v6;
  aBlock[4] = sub_235DCE1CC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = &block_descriptor_15;
  v19 = _Block_copy(aBlock);
  v20 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235DE0150();
  v28 = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  v21 = v24;
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v16, v13, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v21);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v26);
  return swift_release();
}

uint64_t sub_235DC9928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t inited;
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
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[65];

  v86 = a6;
  v87 = a7;
  v81 = a1;
  v82 = a5;
  v79 = a4;
  v77 = a3;
  v8 = sub_235DE0144();
  v74 = *(_QWORD *)(v8 - 8);
  v75 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v73 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235DE0168();
  v71 = *(_QWORD *)(v10 - 8);
  v72 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v70 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v68 = (uint64_t)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v84 = (uint64_t)&v67 - v15;
  v85 = type metadata accessor for AccountSuggestion();
  v83 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v69 = (uint64_t)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_235DE0078();
  v76 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v18 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_235DE009C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235DE0090();
  v23 = sub_235DE0084();
  v25 = v24;
  v26 = *(void (**)(char *, uint64_t))(v20 + 8);
  v26(v22, v19);
  sub_235DE0090();
  v80 = sub_235DE0084();
  v28 = v27;
  v26(v22, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235DE08D0;
  if (qword_256381230 != -1)
    swift_once();
  v30 = qword_2563817B8;
  *(_QWORD *)(inited + 32) = qword_2563817B0;
  *(_QWORD *)(inited + 40) = v30;
  v31 = MEMORY[0x24BEE0D00];
  v32 = v23;
  *(_QWORD *)(inited + 48) = v23;
  *(_QWORD *)(inited + 56) = v25;
  *(_QWORD *)(inited + 72) = v31;
  *(_QWORD *)(inited + 80) = 0xD000000000000015;
  *(_QWORD *)(inited + 120) = v31;
  v33 = v81;
  *(_QWORD *)(inited + 88) = 0x8000000235DE14F0;
  *(_QWORD *)(inited + 96) = v33;
  *(_QWORD *)(inited + 104) = a2;
  v34 = qword_256381238;
  swift_bridgeObjectRetain();
  v81 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v34 != -1)
    swift_once();
  v35 = qword_2563817C8;
  *(_QWORD *)(inited + 128) = qword_2563817C0;
  *(_QWORD *)(inited + 136) = v35;
  *(_QWORD *)(inited + 168) = v31;
  v36 = v79;
  *(_QWORD *)(inited + 144) = v77;
  *(_QWORD *)(inited + 152) = v36;
  v37 = qword_256381240;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v37 != -1)
    swift_once();
  v38 = qword_2563817D8;
  *(_QWORD *)(inited + 176) = qword_2563817D0;
  *(_QWORD *)(inited + 184) = v38;
  *(_QWORD *)(inited + 216) = v31;
  *(_QWORD *)(inited + 192) = 1953719668;
  *(_QWORD *)(inited + 200) = 0xE400000000000000;
  v39 = qword_256381248;
  swift_bridgeObjectRetain();
  if (v39 != -1)
    swift_once();
  v40 = qword_2563817E8;
  *(_QWORD *)(inited + 224) = qword_2563817E0;
  *(_QWORD *)(inited + 232) = v40;
  swift_bridgeObjectRetain();
  sub_235DE006C();
  sub_235DE0060();
  v42 = v41;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v18, v78);
  *(_QWORD *)(inited + 264) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 240) = v42;
  if (qword_256381250 != -1)
    swift_once();
  v43 = qword_2563817F8;
  *(_QWORD *)(inited + 272) = qword_2563817F0;
  *(_QWORD *)(inited + 280) = v43;
  v44 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 288) = 0;
  *(_QWORD *)(inited + 312) = v44;
  *(_QWORD *)(inited + 320) = 0xD000000000000014;
  *(_QWORD *)(inited + 328) = 0x8000000235DE1510;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_235DE08E0;
  v46 = v80;
  *(_QWORD *)(v45 + 32) = v80;
  *(_QWORD *)(v45 + 40) = v28;
  *(_QWORD *)(inited + 360) = __swift_instantiateConcreteTypeFromMangledName(&qword_2563812D8);
  *(_QWORD *)(inited + 336) = v45;
  v47 = qword_256381258;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v48 = v87;
  if (v47 != -1)
    swift_once();
  v49 = qword_256381808;
  *(_QWORD *)(inited + 368) = qword_256381800;
  *(_QWORD *)(inited + 376) = v49;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B0);
  *(_QWORD *)(inited + 408) = v50;
  *(_QWORD *)(inited + 384) = v82;
  v51 = qword_256381260;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v51 != -1)
    swift_once();
  v52 = qword_256381818;
  *(_QWORD *)(inited + 416) = qword_256381810;
  *(_QWORD *)(inited + 424) = v52;
  *(_QWORD *)(inited + 456) = v50;
  *(_QWORD *)(inited + 432) = v86;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v53 = sub_235DC783C(inited);
  sub_235DD0530(v46, v28);
  swift_bridgeObjectRelease();
  v54 = v84;
  AccountSuggestion.init(with:)(v53, v84);
  v55 = v83;
  v56 = v85;
  v57 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v83 + 48))(v54, 1, v85);
  v58 = v81;
  if (v57 == 1)
  {
    swift_bridgeObjectRelease();
    return sub_235DD8B10(v54, &qword_25429B2E8);
  }
  else
  {
    v60 = v69;
    sub_235DCE300(v54, v69);
    v61 = v68;
    sub_235DCE1E0(v60, v68);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v55 + 56))(v61, 0, 1, v56);
    sub_235DCE558(v61, v32, v58, 1, 0);
    swift_bridgeObjectRelease();
    sub_235DD8B10(v61, &qword_25429B2E8);
    sub_235DD8B90(0, &qword_25429B3B8);
    v62 = (void *)sub_235DE02C4();
    v88[4] = sub_235DD8FA8;
    v88[5] = v48;
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 1107296256;
    v88[2] = sub_235DC91DC;
    v88[3] = &block_descriptor_85;
    v63 = _Block_copy(v88);
    swift_retain();
    swift_release();
    v64 = v70;
    sub_235DE0150();
    v88[0] = MEMORY[0x24BEE4AF8];
    sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
    sub_235DCE148(&qword_25429B398, &qword_25429B390);
    v65 = v73;
    v66 = v75;
    sub_235DE0318();
    MEMORY[0x23B7E1620](0, v64, v65, v63);
    _Block_release(v63);

    (*(void (**)(char *, uint64_t))(v74 + 8))(v65, v66);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v64, v72);
    return sub_235DD38D0(v60);
  }
}

uint64_t sub_235DCA0BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_235DE0144();
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_235DE0168();
  v7 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AccountSuggestion();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = *(void **)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  sub_235DCE1E0(a1, (uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v2;
  sub_235DCE300((uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  aBlock[4] = sub_235DCE344;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = &block_descriptor_21;
  v16 = _Block_copy(aBlock);
  v17 = v13;
  swift_retain();
  sub_235DE0150();
  v22 = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v9, v6, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  return swift_release();
}

uint64_t sub_235DCA314(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t aBlock[6];

  v29 = a2;
  v32 = sub_235DE0144();
  v35 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235DE0168();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AccountSuggestion();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_235DE009C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235DE0090();
  v17 = sub_235DE0084();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_bridgeObjectRetain();
  sub_235DD0530(v17, v19);
  swift_bridgeObjectRelease();
  sub_235DCE1E0(v29, (uint64_t)v12);
  swift_bridgeObjectRetain();
  sub_235DD3C5C(aBlock, v17, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_235DCE1E0((uint64_t)v12, (uint64_t)v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  v20 = *v12;
  v21 = v12[1];
  swift_bridgeObjectRetain();
  sub_235DCE558((uint64_t)v8, v20, v21, 1, 0);
  swift_bridgeObjectRelease();
  sub_235DD8B10((uint64_t)v8, &qword_25429B2E8);
  sub_235DD8B90(0, &qword_25429B3B8);
  v22 = (void *)sub_235DE02C4();
  aBlock[4] = (uint64_t)sub_235DD8FA8;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_235DC91DC;
  aBlock[3] = (uint64_t)&block_descriptor_82;
  v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v24 = v30;
  sub_235DE0150();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  v26 = v31;
  v25 = v32;
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v24, v26, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v26, v25);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v34);
  return sub_235DD38D0((uint64_t)v12);
}

uint64_t sub_235DCA6B4()
{
  return sub_235DCA6C8((uint64_t)sub_235DCE374, (uint64_t)&block_descriptor_24);
}

uint64_t sub_235DCA6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v5 = v2;
  v6 = sub_235DE0144();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v18[0] = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235DE0168();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void **)(v5 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  aBlock[4] = a1;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = a2;
  v15 = _Block_copy(aBlock);
  v16 = v14;
  swift_retain();
  sub_235DE0150();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v13, v9, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v18[0] + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

uint64_t sub_235DCA8CC()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint8_t *v55;
  void *v56;
  id v57;
  unint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
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
  uint64_t v97;
  void (*v98)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v99;
  char v100;
  char v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  char isUniquelyReferenced_nonNull_native;
  int v121;
  char v122;
  Class isa;
  _BOOL8 v124;
  uint64_t v125;
  char v126;
  unint64_t v127;
  char v128;
  NSObject *v129;
  unint64_t v130;
  char **v131;
  Class v132;
  BOOL v133;
  objc_class *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  id v162;
  void *v163;
  id v164;
  uint64_t v165;
  NSObject *v166;
  uint64_t v167;
  NSObject *v168;
  void *v169;
  id v170;
  void *v171;
  void *v172;
  char v173;
  void *v174;
  uint64_t v175;
  id v176;
  void *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  char *v185;
  uint64_t v186;
  uint64_t v187;
  _BYTE *v188;
  unint64_t v189;
  unint64_t v190;
  uint64_t v191;
  _QWORD *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  double v201;
  double v202;
  void *v203;
  void *v204;
  double v205;
  double v206;
  uint64_t v207;
  os_log_type_t v208;
  uint8_t *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  unint64_t v221;
  uint64_t v222;
  _QWORD *v223;
  int64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  unint64_t v232;
  uint64_t v233;
  _QWORD *v234;
  BOOL v235;
  unint64_t v236;
  uint64_t v237;
  char **v238;
  BOOL v239;
  unint64_t i;
  uint64_t v241;
  _QWORD *v242;
  BOOL v243;
  void *v244;
  uint64_t v245;
  NSObject *v246;
  uint64_t v247;
  void *v248;
  char *v249;
  uint64_t v250;
  NSObject *v251;
  os_log_type_t v252;
  uint64_t v253;
  uint64_t result;
  unint64_t v255;
  unint64_t v256;
  unint64_t v257;
  char *v258;
  unint64_t v259;
  char *v260;
  char *v261;
  uint64_t v262;
  char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  NSObject *v268;
  _BYTE *v269;
  char *v270;
  void (*v271)(uint64_t, uint64_t, uint64_t);
  uint64_t v272;
  void (*v273)(NSObject *, uint64_t);
  uint64_t v274;
  uint64_t *v275;
  char *v276;
  NSObject *v277;
  char *v278;
  uint64_t v279;
  char *v280;
  unint64_t v281;
  uint64_t v282;
  unint64_t v283;
  char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  NSObject *v288;
  int64_t v289;
  char *v290;
  unint64_t v291;
  uint64_t *v292;
  char *v293;
  char *v294;
  char *v295;
  char *v296;
  uint64_t *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  NSObject *v301;
  char v302[8];
  char *v303;
  NSObject *v304;
  char v305;
  __int128 v306;
  _OWORD v307[2];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B358);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v270 = (char *)&v255 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v255 - v5;
  v285 = sub_235DE009C();
  v281 = *(_QWORD *)(v285 - 8);
  MEMORY[0x24BDAC7A8](v285);
  v279 = (uint64_t)&v255 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B368);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v294 = (char *)&v255 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v293 = (char *)&v255 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v255 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v296 = (char *)&v255 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2D0);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (unint64_t)&v255 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v263 = (char *)&v255 - v21;
  v282 = sub_235DE0078();
  v22 = *(_QWORD *)(v282 - 8);
  v23 = MEMORY[0x24BDAC7A8](v282);
  v280 = (char *)&v255 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v260 = (char *)&v255 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v284 = (char *)&v255 - v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v287 = (uint64_t)&v255 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v268 = ((char *)&v255 - v31);
  v300 = type metadata accessor for AccountSuggestion();
  v298 = *(_QWORD *)(v300 - 8);
  v32 = MEMORY[0x24BDAC7A8](v300);
  v292 = (uint64_t *)((char *)&v255 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = MEMORY[0x24BDAC7A8](v32);
  v297 = (uint64_t *)((char *)&v255 - v35);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v262 = (uint64_t)&v255 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v267 = (uint64_t)&v255 - v38;
  v39 = sub_235DE00CC();
  v40 = *(_QWORD *)(v39 - 8);
  v41 = MEMORY[0x24BDAC7A8](v39);
  v258 = (char *)&v255 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = MEMORY[0x24BDAC7A8](v41);
  v277 = ((char *)&v255 - v44);
  v45 = MEMORY[0x24BDAC7A8](v43);
  v47 = (uint64_t)&v255 - v46;
  MEMORY[0x24BDAC7A8](v45);
  v49 = ((char *)&v255 - v48);
  v266 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs), sel_synchronize);
  if (qword_25429B310 != -1)
LABEL_224:
    swift_once();
  v50 = __swift_project_value_buffer(v39, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  v272 = v50;
  v274 = v39;
  v271 = v51;
  v51((uint64_t)v49, v50, v39);
  v52 = sub_235DE00B4();
  v53 = sub_235DE0294();
  v54 = os_log_type_enabled(v52, v53);
  v283 = v22;
  v259 = v20;
  if (v54)
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_235DC5000, v52, v53, "reloading account suggestions", v55, 2u);
    MEMORY[0x23B7E1B3C](v55, -1, -1);
  }

  v273 = *(void (**)(NSObject *, uint64_t))(v40 + 8);
  v273(v49, v274);
  v56 = *(void **)(v1 + v266);
  if (v56)
  {
    v57 = objc_msgSend(v56, sel_dictionaryRepresentation);
    v58 = sub_235DE01D4();

  }
  else
  {
    v58 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
  }
  v59 = v274;
  v271(v47, v272, v274);
  swift_bridgeObjectRetain_n();
  v60 = sub_235DE00B4();
  v61 = sub_235DE0294();
  v62 = os_log_type_enabled(v60, v61);
  v278 = v6;
  v276 = v15;
  v269 = (_BYTE *)v58;
  if (v62)
  {
    v63 = swift_slowAlloc();
    v299 = v47;
    v64 = v63;
    v65 = swift_slowAlloc();
    v303 = (char *)v65;
    *(_DWORD *)v64 = 136315138;
    v295 = (char *)(v64 + 4);
    swift_bridgeObjectRetain();
    v66 = sub_235DE01E0();
    v68 = v67;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v306 = sub_235DDB818(v66, v68, (uint64_t *)&v303);
    v58 = (unint64_t)v269;
    sub_235DE02E8();
    swift_bridgeObjectRelease_n();
    v15 = v276;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235DC5000, v60, v61, "loaded suggestion dict: %s", (uint8_t *)v64, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7E1B3C](v65, -1, -1);
    MEMORY[0x23B7E1B3C](v64, -1, -1);

    v69 = v59;
    v22 = MEMORY[0x24BEE4AD8];
    v273(v299, v69);
    v6 = (char *)v282;
    v20 = v283;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v273(v47, v59);
    v6 = (char *)v282;
    v20 = v283;
    v22 = MEMORY[0x24BEE4AD8];
  }
  v70 = (uint64_t *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
  swift_beginAccess();
  v71 = MEMORY[0x24BEE4B00];
  v275 = v70;
  *v70 = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
  v72 = (_QWORD *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
  swift_beginAccess();
  *v72 = v71;
  v40 = (uint64_t)v72;
  swift_bridgeObjectRelease();
  v73 = 0;
  v74 = 1 << *(_BYTE *)(v58 + 32);
  v75 = -1;
  if (v74 < 64)
    v75 = ~(-1 << v74);
  v39 = v75 & *(_QWORD *)(v58 + 64);
  v76 = (unint64_t)(v74 + 63) >> 6;
  v290 = (char *)v307;
  v295 = &v305;
  v255 = v76 - 1;
  v286 = v76;
  v257 = v76 - 5;
  v265 = v58 + 64;
  v256 = v58 + 104;
  v261 = "ize with negative count";
  v291 = 0x8000000235DE1410;
  v289 = v22 + 8;
  v49 = v268;
  v288 = v1;
  v264 = v40;
  v47 = v40;
  while (1)
  {
    if (v39)
    {
      v77 = __clz(__rbit64(v39));
      v39 &= v39 - 1;
      v299 = v73;
      v78 = v77 | (v73 << 6);
LABEL_18:
      v79 = *(_QWORD *)(v58 + 56);
      v80 = (_QWORD *)(*(_QWORD *)(v58 + 48) + 16 * v78);
      v81 = v80[1];
      *(_QWORD *)&v306 = *v80;
      *((_QWORD *)&v306 + 1) = v81;
      sub_235DD3C20(v79 + 32 * v78, (uint64_t)v290);
      swift_bridgeObjectRetain();
      goto LABEL_25;
    }
    v82 = v73 + 1;
    if (__OFADD__(v73, 1))
    {
LABEL_219:
      __break(1u);
LABEL_220:
      __break(1u);
LABEL_221:
      __break(1u);
LABEL_222:
      __break(1u);
LABEL_223:
      __break(1u);
      goto LABEL_224;
    }
    if (v82 >= v286)
    {
      v84 = v73;
    }
    else
    {
      v83 = *(_QWORD *)(v265 + 8 * v82);
      if (v83)
        goto LABEL_22;
      v84 = v73 + 1;
      if (v73 + 2 < v286)
      {
        v83 = *(_QWORD *)(v265 + 8 * (v73 + 2));
        if (v83)
        {
          v82 = v73 + 2;
LABEL_22:
          v39 = (v83 - 1) & v83;
          v78 = __clz(__rbit64(v83)) + (v82 << 6);
          v299 = v82;
          goto LABEL_18;
        }
        v84 = v73 + 2;
        if (v73 + 3 < v286)
        {
          v83 = *(_QWORD *)(v265 + 8 * (v73 + 3));
          if (v83)
          {
            v82 = v73 + 3;
            goto LABEL_22;
          }
          v82 = v73 + 4;
          v84 = v73 + 3;
          if (v73 + 4 < v286)
          {
            v83 = *(_QWORD *)(v265 + 8 * v82);
            if (v83)
              goto LABEL_22;
            while (v257 != v73)
            {
              v83 = *(_QWORD *)(v256 + 8 * v73++);
              if (v83)
              {
                v82 = v73 + 4;
                goto LABEL_22;
              }
            }
            v84 = v255;
          }
        }
      }
    }
    v39 = 0;
    memset(v307, 0, sizeof(v307));
    v299 = v84;
    v306 = 0u;
LABEL_25:
    sub_235DD8CB4((uint64_t)&v306, (uint64_t)&v303, &qword_25429B370);
    v40 = (uint64_t)v304;
    if (!v304)
      break;
    v6 = v303;
    sub_235DD8AF8(v295, &v306);
    if ((sub_235DE024C() & 1) != 0)
    {
      sub_235DD3C20((uint64_t)&v306, (uint64_t)v302);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B0);
      if (!swift_dynamicCast())
        goto LABEL_13;
      AccountSuggestion.init(with:)((uint64_t)v301, (uint64_t)v49);
      if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v298 + 48))(v49, 1, v300) == 1)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v306);
        swift_bridgeObjectRelease();
        sub_235DD8B10((uint64_t)v49, &qword_25429B2E8);
        goto LABEL_14;
      }
      sub_235DCE300((uint64_t)v49, v267);
      if ((sub_235DE024C() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        v106 = sub_235DE021C();
        v107 = sub_235DD7E40(v106, (uint64_t)v6, v40);
        v109 = v108;
        v111 = v110;
        v113 = v112;
        swift_bridgeObjectRelease();
        v114 = v111;
        v20 = v283;
        v6 = (char *)MEMORY[0x23B7E1554](v107, v109, v114, v113);
        v116 = v115;
        swift_bridgeObjectRelease();
        v15 = v276;
        swift_bridgeObjectRelease();
        v40 = v116;
      }
      v117 = v275;
      swift_beginAccess();
      v118 = v267;
      v119 = v262;
      sub_235DCE1E0(v267, v262);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v301 = *v117;
      *v117 = 0x8000000000000000;
      sub_235DDD7C8(v119, (uint64_t)v6, v40, isUniquelyReferenced_nonNull_native);
      *v117 = (uint64_t)v301;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_235DD38D0(v118);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v306);
      v6 = (char *)v282;
      v49 = v268;
      v1 = (unint64_t)v288;
      v22 = MEMORY[0x24BEE4AD8];
      v58 = (unint64_t)v269;
    }
    else
    {
      if (qword_25429B300 != -1)
        swift_once();
      if ((sub_235DE024C() & 1) == 0)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v306);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      sub_235DD3C20((uint64_t)&v306, (uint64_t)v302);
      if (!swift_dynamicCast())
      {
LABEL_13:
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v306);
LABEL_14:
        v6 = (char *)v282;
        goto LABEL_15;
      }
      sub_235DE0054();
      if ((sub_235DE024C() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        v85 = sub_235DE021C();
        v86 = sub_235DD7E40(v85, (uint64_t)v6, v40);
        v88 = v87;
        v90 = v89;
        v92 = v91;
        swift_bridgeObjectRelease();
        v93 = v90;
        v20 = v283;
        v6 = (char *)MEMORY[0x23B7E1554](v86, v88, v93, v92);
        v95 = v94;
        swift_bridgeObjectRelease();
        v15 = v276;
        swift_bridgeObjectRelease();
        v40 = v95;
      }
      v96 = (uint64_t)v263;
      v97 = v282;
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v263, v284, v282);
      v98 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
      v98(v96, 0, 1, v97);
      swift_beginAccess();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v96, 1, v97) == 1)
      {
        sub_235DD8B10(v96, &qword_25429B2D0);
        swift_bridgeObjectRetain();
        v99 = sub_235DDBF18((uint64_t)v6, v40);
        v101 = v100;
        swift_bridgeObjectRelease();
        if ((v101 & 1) != 0)
        {
          v102 = swift_isUniquelyReferenced_nonNull_native();
          v103 = *(_QWORD *)v47;
          v301 = *(NSObject **)v47;
          *(_QWORD *)v47 = 0x8000000000000000;
          v6 = (char *)v282;
          if (!v102)
          {
            sub_235DDE010();
            v103 = (uint64_t)v301;
          }
          swift_bridgeObjectRelease();
          v104 = v259;
          (*(void (**)(unint64_t, unint64_t, char *))(v283 + 32))(v259, *(_QWORD *)(v103 + 56) + *(_QWORD *)(v283 + 72) * v99, v6);
          sub_235DDD2B0(v99, v103);
          *(_QWORD *)v47 = v103;
          swift_bridgeObjectRelease();
          v105 = 0;
        }
        else
        {
          v105 = 1;
          v6 = (char *)v282;
          v104 = v259;
        }
        v98(v104, v105, 1, (uint64_t)v6);
        swift_bridgeObjectRelease();
        sub_235DD8B10(v104, &qword_25429B2D0);
        v20 = v283;
        v49 = v268;
        v58 = (unint64_t)v269;
      }
      else
      {
        v22 = *(_QWORD *)(v20 + 32);
        ((void (*)(char *, uint64_t, uint64_t))v22)(v260, v96, v97);
        v121 = swift_isUniquelyReferenced_nonNull_native();
        v301 = *(NSObject **)v47;
        v49 = v301;
        v1 = v47;
        *(_QWORD *)v47 = 0x8000000000000000;
        v20 = sub_235DDBF18((uint64_t)v6, v40);
        isa = v49[2].isa;
        v124 = (v122 & 1) == 0;
        v125 = (uint64_t)isa + v124;
        if (__OFADD__(isa, v124))
          goto LABEL_223;
        v126 = v122;
        if ((uint64_t)v49[3].isa >= v125)
        {
          if ((v121 & 1) == 0)
            sub_235DDE010();
        }
        else
        {
          sub_235DDCA60(v125, v121);
          v127 = sub_235DDBF18((uint64_t)v6, v40);
          if ((v126 & 1) != (v128 & 1))
            goto LABEL_228;
          v20 = v127;
        }
        v58 = (unint64_t)v269;
        v129 = v301;
        if ((v126 & 1) != 0)
        {
          v130 = (unint64_t)v301[7].isa + *(_QWORD *)(v283 + 72) * v20;
          v20 = v283;
          v6 = (char *)v282;
          (*(void (**)(unint64_t, char *, uint64_t))(v283 + 40))(v130, v260, v282);
        }
        else
        {
          v301[(v20 >> 6) + 8].isa = (Class)((uint64_t)v301[(v20 >> 6) + 8].isa | (1 << v20));
          v131 = (char **)((char *)v129[6].isa + 16 * v20);
          *v131 = v6;
          v131[1] = (char *)v40;
          v6 = (char *)v282;
          ((void (*)(char *, char *, uint64_t))v22)((char *)v129[7].isa + *(_QWORD *)(v283 + 72) * v20, v260, v282);
          v132 = v129[2].isa;
          v133 = __OFADD__(v132, 1);
          v134 = (Class)((char *)v132 + 1);
          if (v133)
          {
            __break(1u);
LABEL_226:
            __break(1u);
LABEL_227:
            __break(1u);
LABEL_228:
            result = sub_235DE0414();
            __break(1u);
            return result;
          }
          v129[2].isa = v134;
          swift_bridgeObjectRetain();
          v20 = v283;
        }
        *(_QWORD *)v47 = v301;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v1 = (unint64_t)v288;
        v15 = v276;
        v49 = v268;
      }
      v22 = MEMORY[0x24BEE4AD8];
      swift_endAccess();
      (*(void (**)(char *, char *))(v20 + 8))(v284, v6);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v306);
    }
LABEL_15:
    v73 = v299;
  }
  swift_release();
  v135 = *v275;
  v136 = *(_QWORD *)(*v275 + 64);
  v289 = *v275 + 64;
  v137 = 1 << *(_BYTE *)(v135 + 32);
  v138 = -1;
  if (v137 < 64)
    v138 = ~(-1 << v137);
  v47 = v138 & v136;
  v284 = (char *)OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  v290 = (char *)((unint64_t)(v137 + 63) >> 6);
  v286 = (uint64_t)(v290 - 1);
  v295 = (char *)v135;
  swift_bridgeObjectRetain();
  v299 = 0;
  v39 = (uint64_t)&qword_25429B360;
  v22 = (uint64_t)v278;
  while (2)
  {
    if (v47)
    {
      v146 = __clz(__rbit64(v47));
      v47 &= v47 - 1;
      v147 = v146 | (v299 << 6);
      v148 = (uint64_t)v296;
      goto LABEL_79;
    }
    v154 = v299 + 1;
    if (__OFADD__(v299, 1))
      goto LABEL_220;
    v148 = (uint64_t)v296;
    if (v154 >= (uint64_t)v290)
      goto LABEL_97;
    v155 = *(_QWORD *)(v289 + 8 * v154);
    if (!v155)
    {
      v156 = v299 + 2;
      ++v299;
      if (v154 + 1 < (uint64_t)v290)
      {
        v155 = *(_QWORD *)(v289 + 8 * v156);
        if (v155)
        {
LABEL_86:
          v154 = v156;
          goto LABEL_83;
        }
        v299 = v154 + 1;
        if (v154 + 2 < (uint64_t)v290)
        {
          v155 = *(_QWORD *)(v289 + 8 * (v154 + 2));
          if (v155)
          {
            v154 += 2;
            goto LABEL_83;
          }
          v156 = v154 + 3;
          v299 = v154 + 2;
          if (v154 + 3 < (uint64_t)v290)
          {
            v155 = *(_QWORD *)(v289 + 8 * v156);
            if (v155)
              goto LABEL_86;
            while (1)
            {
              v154 = v156 + 1;
              if (__OFADD__(v156, 1))
                goto LABEL_226;
              if (v154 >= (uint64_t)v290)
                break;
              v155 = *(_QWORD *)(v289 + 8 * v154);
              ++v156;
              if (v155)
                goto LABEL_83;
            }
            v299 = v286;
          }
        }
      }
LABEL_97:
      v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B360);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v157 - 8) + 56))(v15, 1, 1, v157);
      v47 = 0;
      goto LABEL_98;
    }
LABEL_83:
    v47 = (v155 - 1) & v155;
    v147 = __clz(__rbit64(v155)) + (v154 << 6);
    v299 = v154;
LABEL_79:
    v149 = *((_QWORD *)v295 + 7);
    v150 = (_QWORD *)(*((_QWORD *)v295 + 6) + 16 * v147);
    v151 = v150[1];
    *(_QWORD *)v15 = *v150;
    *((_QWORD *)v15 + 1) = v151;
    v152 = v149 + *(_QWORD *)(v298 + 72) * v147;
    v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B360);
    sub_235DCE1E0(v152, (uint64_t)&v15[*(int *)(v153 + 48)]);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v153 - 8) + 56))(v15, 0, 1, v153);
    swift_bridgeObjectRetain();
LABEL_98:
    sub_235DD8CB4((uint64_t)v15, v148, &qword_25429B368);
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B360);
    v40 = *(_QWORD *)(v39 - 8);
    v49 = *(NSObject **)(v40 + 48);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v49)(v148, 1, v39) != 1)
    {
      swift_bridgeObjectRelease();
      v158 = v148 + *(int *)(v39 + 48);
      v145 = (uint64_t)v297;
      sub_235DCE300(v158, (uint64_t)v297);
      if (*(_BYTE *)(v145 + *(int *)(v300 + 56)) == 1)
      {
        v40 = v145 + *(int *)(v300 + 40);
        v159 = *(_QWORD *)v40;
        v160 = *(void **)&v284[v1];
        if (v160)
        {
          v161 = qword_25429B320;
          swift_bridgeObjectRetain();
          v162 = v160;
          if (v161 != -1)
            swift_once();
          v163 = (void *)sub_235DE01EC();
          v164 = objc_msgSend(v162, sel_stringForKey_, v163);

          if (v164)
          {
            v165 = sub_235DE01F8();
            v49 = v166;

            goto LABEL_110;
          }
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        v167 = v279;
        sub_235DE0090();
        v165 = sub_235DE0084();
        v49 = v168;
        (*(void (**)(uint64_t, uint64_t))(v281 + 8))(v167, v285);
        v169 = *(void **)&v284[v1];
        if (v169)
        {
          v170 = v169;
          v171 = (void *)sub_235DE01EC();
          if (qword_25429B320 != -1)
            swift_once();
          v172 = (void *)sub_235DE01EC();
          objc_msgSend(v170, sel_setObject_forKey_, v171, v172);

          v22 = (uint64_t)v278;
          v6 = (char *)v282;
          v15 = v276;
        }
LABEL_110:
        v173 = sub_235DCD188(v165, (uint64_t)v49, v159);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = v283;
        v145 = (uint64_t)v297;
        if ((v173 & 1) == 0)
        {
          v174 = *(void **)&v284[v1];
          if (!v174)
            goto LABEL_115;
          v175 = qword_25429B320;
          v176 = v174;
          if (v175 != -1)
            swift_once();
          v177 = (void *)sub_235DE01EC();
          v178 = objc_msgSend(v176, sel_stringForKey_, v177);

          if (v178)
          {
            v139 = sub_235DE01F8();
            v141 = v140;

          }
          else
          {
LABEL_115:
            v179 = v279;
            sub_235DE0090();
            v139 = sub_235DE0084();
            v141 = v180;
            (*(void (**)(uint64_t, uint64_t))(v281 + 8))(v179, v285);
            v181 = *(void **)&v284[v1];
            if (v181)
            {
              v182 = v181;
              v183 = (void *)sub_235DE01EC();
              if (qword_25429B320 != -1)
                swift_once();
              v184 = (void *)sub_235DE01EC();
              objc_msgSend(v182, sel_setObject_forKey_, v183, v184);

              v22 = (uint64_t)v278;
              v6 = (char *)v282;
              v20 = v283;
            }
          }
          swift_bridgeObjectRetain();
          sub_235DD3C5C((uint64_t *)&v303, v139, v141);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v142 = v297;
          v143 = v287;
          sub_235DCE1E0((uint64_t)v297, v287);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v298 + 56))(v143, 0, 1, v300);
          v40 = *v142;
          v144 = v142[1];
          swift_bridgeObjectRetain();
          v49 = v288;
          sub_235DCE558(v143, v40, v144, 0, 0);
          v145 = (uint64_t)v142;
          v1 = (unint64_t)v49;
          swift_bridgeObjectRelease();
          sub_235DD8B10(v143, &qword_25429B2E8);
        }
      }
      sub_235DD38D0(v145);
      v39 = (uint64_t)&qword_25429B360;
      continue;
    }
    break;
  }
  v296 = (char *)v40;
  swift_release();
  v185 = *(char **)v264;
  v186 = *(_QWORD *)(*(_QWORD *)v264 + 64);
  v265 = *(_QWORD *)v264 + 64;
  v40 = 1 << v185[32];
  if (v40 < 64)
    v187 = ~(-1 << v40);
  else
    v187 = -1;
  v281 = v187 & v186;
  v188 = (_BYTE *)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  v276 = v185;
  swift_bridgeObjectRetain();
  v269 = v188;
  swift_beginAccess();
  v279 = 0;
  v268 = ((unint64_t)(v40 + 63) >> 6);
  v263 = (char *)&v268[-1].isa + 7;
  v15 = (char *)v49;
  v47 = (uint64_t)v270;
  v291 = v39;
  while (2)
  {
    if (v281)
    {
      v189 = __clz(__rbit64(v281));
      v281 &= v281 - 1;
      v190 = v189 | (v279 << 6);
      goto LABEL_126;
    }
    v195 = v279 + 1;
    if (__OFADD__(v279, 1))
      goto LABEL_221;
    if (v195 >= (uint64_t)v268)
      goto LABEL_144;
    v196 = *(_QWORD *)(v265 + 8 * v195);
    if (!v196)
    {
      v197 = v279 + 2;
      ++v279;
      if (v195 + 1 < (uint64_t)v268)
      {
        v196 = *(_QWORD *)(v265 + 8 * v197);
        if (v196)
        {
LABEL_133:
          v195 = v197;
          goto LABEL_130;
        }
        v279 = v195 + 1;
        if (v195 + 2 < (uint64_t)v268)
        {
          v196 = *(_QWORD *)(v265 + 8 * (v195 + 2));
          if (v196)
          {
            v195 += 2;
            goto LABEL_130;
          }
          v197 = v195 + 3;
          v279 = v195 + 2;
          if (v195 + 3 < (uint64_t)v268)
          {
            v196 = *(_QWORD *)(v265 + 8 * v197);
            if (v196)
              goto LABEL_133;
            while (1)
            {
              v195 = v197 + 1;
              if (__OFADD__(v197, 1))
                goto LABEL_227;
              if (v195 >= (uint64_t)v268)
                break;
              v196 = *(_QWORD *)(v265 + 8 * v195);
              ++v197;
              if (v196)
                goto LABEL_130;
            }
            v279 = (uint64_t)v263;
          }
        }
      }
LABEL_144:
      v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B350);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v198 - 8) + 56))(v47, 1, 1, v198);
      v281 = 0;
      goto LABEL_145;
    }
LABEL_130:
    v281 = (v196 - 1) & v196;
    v190 = __clz(__rbit64(v196)) + (v195 << 6);
    v279 = v195;
LABEL_126:
    v191 = *((_QWORD *)v276 + 7);
    v192 = (_QWORD *)(*((_QWORD *)v276 + 6) + 16 * v190);
    v40 = v192[1];
    *(_QWORD *)v47 = *v192;
    *(_QWORD *)(v47 + 8) = v40;
    v193 = v191 + *(_QWORD *)(v20 + 72) * v190;
    v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B350);
    (*(void (**)(uint64_t, uint64_t, char *))(v20 + 16))(v47 + *(int *)(v194 + 48), v193, v6);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v194 - 8) + 56))(v47, 0, 1, v194);
    swift_bridgeObjectRetain();
LABEL_145:
    sub_235DD8CB4(v47, v22, &qword_25429B358);
    v199 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B350);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v199 - 8) + 48))(v22, 1, v199) != 1)
    {
      v290 = *(char **)v22;
      v297 = *(uint64_t **)(v22 + 8);
      v200 = v22 + *(int *)(v199 + 48);
      v49 = v280;
      (*(void (**)(char *, uint64_t, char *))(v20 + 32))(v280, v200, v6);
      sub_235DE0048();
      v202 = fabs(v201);
      v203 = *(void **)&v284[v1];
      if (!v203)
        goto LABEL_152;
      v40 = qword_25429B318;
      v49 = v203;
      if (v40 != -1)
        swift_once();
      v204 = (void *)sub_235DE01EC();
      -[NSObject doubleForKey:](v49, sel_doubleForKey_, v204);
      v206 = v205;

      v20 = v283;
      if (v206 > 0.0)
      {
        if (v206 >= v202)
          goto LABEL_123;
      }
      else
      {
LABEL_152:
        if (v202 <= 7776000.0)
        {
LABEL_123:
          (*(void (**)(char *, char *))(v20 + 8))(v280, v6);
          swift_bridgeObjectRelease();
          continue;
        }
      }
      v207 = v274;
      v271((uint64_t)v277, v272, v274);
      v49 = sub_235DE00B4();
      v208 = sub_235DE0294();
      v20 = v208;
      if (os_log_type_enabled(v49, v208))
      {
        v209 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v209 = 0;
        _os_log_impl(&dword_235DC5000, v49, (os_log_type_t)v20, "device too old, removing it from all suggestions and the device list", v209, 2u);
        MEMORY[0x23B7E1B3C](v209, -1, -1);
      }

      v273(v277, v207);
      v210 = *v275;
      v211 = *(_QWORD *)(*v275 + 64);
      v286 = *v275 + 64;
      v212 = 1 << *(_BYTE *)(v210 + 32);
      if (v212 < 64)
        v213 = ~(-1 << v212);
      else
        v213 = -1;
      v1 = v213 & v211;
      v289 = (unint64_t)(v212 + 63) >> 6;
      v267 = v289 - 1;
      v295 = (char *)v210;
      swift_bridgeObjectRetain();
      v299 = 0;
      v40 = (uint64_t)v294;
      v214 = (uint64_t)v293;
      v22 = (uint64_t)v292;
      v6 = v290;
LABEL_162:
      if (v1)
      {
        v220 = __clz(__rbit64(v1));
        v1 &= v1 - 1;
        v221 = v220 | (v299 << 6);
        goto LABEL_164;
      }
      v224 = v299 + 1;
      if (__OFADD__(v299, 1))
      {
        __break(1u);
        goto LABEL_219;
      }
      if (v224 < v289)
      {
        v225 = *(_QWORD *)(v286 + 8 * v224);
        if (v225)
        {
LABEL_168:
          v1 = (v225 - 1) & v225;
          v221 = __clz(__rbit64(v225)) + (v224 << 6);
          v299 = v224;
LABEL_164:
          v222 = *((_QWORD *)v295 + 7);
          v223 = (_QWORD *)(*((_QWORD *)v295 + 6) + 16 * v221);
          v49 = v223[1];
          *(_QWORD *)v40 = *v223;
          *(_QWORD *)(v40 + 8) = v49;
          sub_235DCE1E0(v222 + *(_QWORD *)(v298 + 72) * v221, v40 + *(int *)(v39 + 48));
          (*((void (**)(uint64_t, _QWORD, uint64_t, uint64_t))v296 + 7))(v40, 0, 1, v39);
          swift_bridgeObjectRetain();
LABEL_183:
          sub_235DD8CB4(v40, v214, &qword_25429B368);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v15)(v214, 1, v39) == 1)
          {
            swift_bridgeObjectRelease();
            swift_release();
            if ((*v269 & 1) != 0)
            {
              v20 = v283;
              v6 = (char *)v282;
              (*(void (**)(char *, uint64_t))(v283 + 8))(v280, v282);
              v1 = (unint64_t)v288;
              v47 = (uint64_t)v270;
LABEL_212:
              v22 = (uint64_t)v278;
              continue;
            }
            v1 = (unint64_t)v288;
            v244 = *(Class *)((char *)&v288->isa + v266);
            v47 = (uint64_t)v270;
            v22 = (uint64_t)v278;
            v20 = v283;
            if (v244)
            {
              v245 = qword_25429B300;
              v40 = v244;
              if (v245 != -1)
                swift_once();
              v247 = qword_25429B408;
              v246 = unk_25429B410;
              sub_235DC7F5C();
              v303 = (char *)v247;
              v304 = v246;
              swift_bridgeObjectRetain();
              sub_235DE0234();
              swift_bridgeObjectRelease();
              v49 = v304;
              v248 = (void *)sub_235DE01EC();
              swift_bridgeObjectRelease();
              objc_msgSend((id)v40, sel_removeObjectForKey_, v248);

              v20 = v283;
              v6 = (char *)v282;
              (*(void (**)(char *, uint64_t))(v283 + 8))(v280, v282);
              goto LABEL_212;
            }
            v6 = (char *)v282;
            (*(void (**)(char *, uint64_t))(v283 + 8))(v280, v282);
            continue;
          }
          v47 = (uint64_t)v15;
          swift_bridgeObjectRelease();
          sub_235DCE300(v214 + *(int *)(v39 + 48), v22);
          v20 = v22 + *(int *)(v300 + 40);
          v227 = *(_QWORD *)v20;
          if (*(_QWORD *)(*(_QWORD *)v20 + 16))
          {
            sub_235DE0420();
            swift_bridgeObjectRetain();
            v228 = (uint64_t)v6;
            v229 = (uint64_t)v297;
            sub_235DE0210();
            v230 = sub_235DE0438();
            v231 = -1 << *(_BYTE *)(v227 + 32);
            v232 = v230 & ~v231;
            v49 = (v227 + 56);
            if (((*(_QWORD *)(v227 + 56 + ((v232 >> 3) & 0xFFFFFFFFFFFFF8)) >> v232) & 1) == 0)
              goto LABEL_205;
            v233 = *(_QWORD *)(v227 + 48);
            v234 = (_QWORD *)(v233 + 16 * v232);
            v235 = *v234 == v228 && v234[1] == v229;
            if (v235 || (sub_235DE03E4() & 1) != 0)
              goto LABEL_159;
            v285 = ~v231;
            v236 = (v232 + 1) & ~v231;
            v237 = (uint64_t)v297;
            v228 = (uint64_t)v290;
            if (((*(unint64_t *)((char *)&v49->isa + ((v236 >> 3) & 0xFFFFFFFFFFFFF8)) >> v236) & 1) == 0)
              goto LABEL_205;
            v238 = (char **)(v233 + 16 * v236);
            v239 = *v238 == v290 && v238[1] == (char *)v297;
            if (v239 || (sub_235DE03E4() & 1) != 0)
            {
LABEL_159:
              swift_bridgeObjectRelease();
              v40 = (uint64_t)v294;
              v214 = (uint64_t)v293;
              v6 = v290;
              sub_235DD46D8((uint64_t)v290, (uint64_t)v297);
              swift_bridgeObjectRelease();
              v215 = v292;
              v216 = v287;
              sub_235DCE1E0((uint64_t)v292, v287);
              (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v298 + 56))(v216, 0, 1, v300);
              v217 = *v215;
              v20 = v215[1];
              swift_bridgeObjectRetain();
              v218 = v217;
              v49 = v288;
              sub_235DCE558(v216, v218, v20, 0, 0);
              swift_bridgeObjectRelease();
              v219 = v216;
              v22 = (uint64_t)v215;
              sub_235DD8B10(v219, &qword_25429B2E8);
            }
            else
            {
              for (i = v236 + 1; ; i = v241 + 1)
              {
                v241 = i & v285;
                if (((*(unint64_t *)((char *)&v49->isa + (((i & v285) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v285)) & 1) == 0)
                  break;
                v242 = (_QWORD *)(v233 + 16 * v241);
                v243 = *v242 == v228 && v242[1] == v237;
                if (v243 || (sub_235DE03E4() & 1) != 0)
                  goto LABEL_159;
              }
LABEL_205:
              swift_bridgeObjectRelease();
              v40 = (uint64_t)v294;
              v214 = (uint64_t)v293;
              v22 = (uint64_t)v292;
              v6 = (char *)v228;
            }
            v39 = v291;
          }
          sub_235DD38D0(v22);
          v15 = (char *)v47;
          goto LABEL_162;
        }
        v226 = v299 + 2;
        ++v299;
        if (v224 + 1 < v289)
        {
          v225 = *(_QWORD *)(v286 + 8 * v226);
          if (v225)
          {
LABEL_171:
            v224 = v226;
            goto LABEL_168;
          }
          v299 = v224 + 1;
          if (v224 + 2 < v289)
          {
            v225 = *(_QWORD *)(v286 + 8 * (v224 + 2));
            if (v225)
            {
              v224 += 2;
              goto LABEL_168;
            }
            v226 = v224 + 3;
            v299 = v224 + 2;
            if (v224 + 3 < v289)
            {
              v225 = *(_QWORD *)(v286 + 8 * v226);
              if (!v225)
              {
                while (1)
                {
                  v224 = v226 + 1;
                  if (__OFADD__(v226, 1))
                    goto LABEL_222;
                  if (v224 >= v289)
                  {
                    v299 = v267;
                    goto LABEL_182;
                  }
                  v225 = *(_QWORD *)(v286 + 8 * v224);
                  ++v226;
                  if (v225)
                    goto LABEL_168;
                }
              }
              goto LABEL_171;
            }
          }
        }
      }
LABEL_182:
      (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v296 + 7))(v40, 1, 1, v39);
      v1 = 0;
      goto LABEL_183;
    }
    break;
  }
  swift_release();
  sub_235DCD2BC();
  v249 = v258;
  v250 = v274;
  v271((uint64_t)v258, v272, v274);
  swift_retain();
  v251 = sub_235DE00B4();
  v252 = sub_235DE0294();
  if (os_log_type_enabled(v251, v252))
  {
    v253 = swift_slowAlloc();
    *(_DWORD *)v253 = 134218240;
    v303 = *(char **)(*v275 + 16);
    sub_235DE02E8();
    *(_WORD *)(v253 + 12) = 2048;
    v303 = *(char **)(*(_QWORD *)v264 + 16);
    sub_235DE02E8();
    swift_release();
    _os_log_impl(&dword_235DC5000, v251, v252, "reloading account suggestions finished, loaded %ld suggestions, loaded %ld devices", (uint8_t *)v253, 0x16u);
    MEMORY[0x23B7E1B3C](v253, -1, -1);

  }
  else
  {

    swift_release();
  }
  return ((uint64_t (*)(char *, uint64_t))v273)(v249, v250);
}

uint64_t sub_235DCCEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AccountSuggestion();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_235DD8B10(a1, &qword_25429B2E8);
    sub_235DDC18C(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_235DD8B10((uint64_t)v10, &qword_25429B2E8);
  }
  else
  {
    sub_235DCE300(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_235DDD7C8((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_235DCD014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2D0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235DE0078();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_235DD8B10(a1, &qword_25429B2D0);
    sub_235DDC2C0(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_235DD8B10((uint64_t)v10, &qword_25429B2D0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_235DDD8FC((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_235DCD188(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_235DE0420();
    sub_235DE0210();
    v6 = sub_235DE0438();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_235DE03E4() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_235DE03E4() & 1) != 0)
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

uint64_t sub_235DCD2BC()
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
  size_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD *aBlock[7];

  v1 = v0;
  v2 = sub_235DE0144();
  v19 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235DE0168();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_235DDE420(v9);
  swift_bridgeObjectRelease();
  swift_retain();
  v11 = swift_bridgeObjectRetain();
  v12 = (_QWORD *)sub_235DD7FCC(v11, v0);
  swift_release();
  aBlock[0] = v12;
  swift_bridgeObjectRetain();
  sub_235DD4A28(aBlock, sub_235DD4AB4);
  swift_bridgeObjectRelease();
  v13 = aBlock[0];
  sub_235DD8B90(0, &qword_25429B3B8);
  v14 = (void *)sub_235DE02C4();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v1;
  v15[3] = v10;
  v15[4] = v13;
  aBlock[4] = sub_235DD8BCC;
  aBlock[5] = v15;
  aBlock[0] = (_QWORD *)MEMORY[0x24BDAC760];
  aBlock[1] = (_QWORD *)1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = &block_descriptor_61;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_235DE0150();
  aBlock[0] = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v8, v4, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_235DCD56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  void (**v7)(uint64_t (*)(), _QWORD *);
  void (*v8)(uint64_t (*)(), _QWORD *);

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v7 = (void (**)(uint64_t (*)(), _QWORD *))(a1
                                                     + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock);
  swift_beginAccess();
  v8 = *v7;
  if (*v7)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_235DC832C((uint64_t)v8);
    v8(sub_235DD8C10, v6);
    sub_235DC8398((uint64_t)v8);
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_bridgeObjectRetain();
    sub_235DE012C();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_235DE012C();
  }
  return swift_release();
}

uint64_t sub_235DCD6E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235DE012C();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_235DE012C();
}

uint64_t sub_235DCD7B0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_235DE03E4();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_235DE03E4() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_235DCD874()
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
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  char *v17;
  uint64_t v18;
  uint8_t *v19;
  uint8_t *v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t, uint64_t);

  v1 = v0;
  v2 = sub_235DE00CC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - v7;
  v9 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults;
  v10 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults);
  if (!v10
    || (v11 = v10,
        v12 = (void *)sub_235DE01EC(),
        v13 = objc_msgSend(v11, sel_BOOLForKey_, v12),
        v11,
        v12,
        (v13 & 1) == 0))
  {
    if (qword_25429B310 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_25429B2B8);
    swift_beginAccess();
    v28 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v28(v8, v14, v2);
    v15 = sub_235DE00B4();
    v16 = sub_235DE0294();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = v6;
      v18 = v1;
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_235DC5000, v15, v16, "Not locally migrated! Running now", v19, 2u);
      v20 = v19;
      v1 = v18;
      v6 = v17;
      MEMORY[0x23B7E1B3C](v20, -1, -1);
    }

    v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v8, v2);
    v22 = *(void **)(v1 + v9);
    if (v22)
    {
      v23 = v22;
      v24 = (void *)sub_235DE01EC();
      objc_msgSend(v23, sel_setBool_forKey_, 1, v24);

    }
    sub_235DCE388();
    v28(v6, v14, v2);
    v25 = sub_235DE00B4();
    v26 = sub_235DE0294();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_235DC5000, v25, v26, "Local migration is now complete, you are free to get up and move about the cabin", v27, 2u);
      MEMORY[0x23B7E1B3C](v27, -1, -1);
    }

    v21(v6, v2);
  }
}

void sub_235DCDB40(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;

  v3 = *(_QWORD **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_supportedAccountTypes);
  swift_bridgeObjectRetain();
  v4 = objc_msgSend(a1, sel_accountType);
  if (!v4)
  {
    __break(1u);
    goto LABEL_23;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_identifier);

  if (!v6)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = sub_235DE01F8();
  v9 = v8;

  LOBYTE(v7) = sub_235DCD7B0(v7, v9, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
    return;

  v10 = objc_msgSend(a1, sel_personaIdentifier);
  if (v10)

  else
    objc_msgSend(a1, sel_isDataSeparatedAccount);
  if (objc_msgSend(a1, sel_accountPropertyForKey_, *MEMORY[0x24BDB3EE8]))
  {
    sub_235DE030C();
    swift_unknownObjectRelease();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }
  sub_235DD8B10((uint64_t)&v20, &qword_256381278);
  v11 = objc_msgSend(a1, sel_accountType);
  if (!v11)
  {
LABEL_24:
    __break(1u);
    return;
  }
  v12 = v11;
  v13 = objc_msgSend(v11, sel_identifier);

  if (!v13)
  {
    sub_235DE01F8();
    goto LABEL_18;
  }
  v14 = sub_235DE01F8();
  v16 = v15;

  v17 = sub_235DE01F8();
  if (!v16)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  if (v14 == v17 && v16 == v18)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    objc_msgSend(a1, sel_aa_isAccountClass_, *MEMORY[0x24BE047F0], v20, v21);
    return;
  }
  v19 = sub_235DE03E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
    goto LABEL_21;
}

id sub_235DCDE04(void *a1)
{
  uint64_t v1;
  char v3;
  _QWORD *v4;
  id result;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  sub_235DCDB40(a1);
  if ((v3 & 1) == 0)
    return 0;
  v4 = *(_QWORD **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_accountTypesThatNeedProperties);
  swift_bridgeObjectRetain();
  result = objc_msgSend(a1, sel_accountType);
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend(result, sel_identifier);

    if (v7)
    {
      v8 = sub_235DE01F8();
      v10 = v9;

    }
    else
    {
      v8 = 0;
      v10 = 0xE000000000000000;
    }
    v11 = sub_235DCD7B0(v8, v10, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)(v11 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t AccountSuggestionManager.supportedAccountTypes.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *sub_235DCDEE8()
{
  uint64_t inited;
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
  _QWORD *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235DE08F0;
  *(_QWORD *)(inited + 32) = sub_235DE01F8();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = sub_235DE01F8();
  *(_QWORD *)(inited + 56) = v2;
  *(_QWORD *)(inited + 64) = sub_235DE01F8();
  *(_QWORD *)(inited + 72) = v3;
  *(_QWORD *)(inited + 80) = sub_235DE01F8();
  *(_QWORD *)(inited + 88) = v4;
  *(_QWORD *)(inited + 96) = sub_235DE01F8();
  *(_QWORD *)(inited + 104) = v5;
  *(_QWORD *)(inited + 112) = sub_235DE01F8();
  *(_QWORD *)(inited + 120) = v6;
  *(_QWORD *)(inited + 128) = sub_235DE01F8();
  *(_QWORD *)(inited + 136) = v7;
  *(_QWORD *)(inited + 144) = sub_235DE01F8();
  *(_QWORD *)(inited + 152) = v8;
  *(_QWORD *)(inited + 160) = sub_235DE01F8();
  *(_QWORD *)(inited + 168) = v9;
  *(_QWORD *)(inited + 176) = sub_235DE01F8();
  *(_QWORD *)(inited + 184) = v10;
  *(_QWORD *)(inited + 192) = sub_235DE01F8();
  *(_QWORD *)(inited + 200) = v11;
  *(_QWORD *)(inited + 208) = sub_235DE01F8();
  *(_QWORD *)(inited + 216) = v12;
  *(_QWORD *)(inited + 224) = sub_235DE01F8();
  *(_QWORD *)(inited + 232) = v13;
  *(_QWORD *)(inited + 240) = sub_235DE01F8();
  *(_QWORD *)(inited + 248) = v14;
  v15 = sub_235DE01F8();
  v17 = v16;
  result = sub_235DD390C((_QWORD *)1, 15, 1, (_QWORD *)inited);
  result[2] = 15;
  result[32] = v15;
  result[33] = v17;
  return result;
}

uint64_t sub_235DCE0B8()
{
  return swift_deallocObject();
}

uint64_t sub_235DCE0C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

void sub_235DCE100()
{
  uint64_t v0;

  sub_235DC9258(v0);
}

uint64_t sub_235DCE108(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7E1AA0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235DCE148(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E1AA0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235DCE188()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235DCE1CC()
{
  uint64_t *v0;

  return sub_235DC9928(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8]);
}

uint64_t sub_235DCE1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235DCE224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AccountSuggestion();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3 + *(int *)(v1 + 32);
  v5 = sub_235DE0078();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235DCE300(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235DCE344()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccountSuggestion() - 8) + 80);
  return sub_235DCA314(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t AccountSuggestionManager.locallySupportedAccountTypes.getter()
{
  return swift_bridgeObjectRetain();
}

void sub_235DCE388()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (!v0)
    goto LABEL_16;
  v1 = v0;
  v2 = (void *)sub_235DE0264();
  v13[0] = 0;
  v3 = objc_msgSend(v1, sel_accountsWithAccountTypeIdentifiers_error_, v2, v13);

  v4 = v13[0];
  if (!v3)
  {
    v11 = v13[0];
    v12 = (void *)sub_235DE0030();

    swift_willThrow();
    return;
  }
  sub_235DD8B90(0, &qword_2563812A0);
  v5 = sub_235DE0270();
  v6 = v4;

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235DE0390();
    swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_5;
  }
  else
  {
    v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_5:
      if (v7 >= 1)
      {
        for (i = 0; i != v7; ++i)
        {
          if ((v5 & 0xC000000000000001) != 0)
            v9 = (id)MEMORY[0x23B7E16BC](i, v5);
          else
            v9 = *(id *)(v5 + 8 * i + 32);
          v10 = v9;
          sub_235DD0DB8(v9);

        }
        goto LABEL_13;
      }
      __break(1u);
LABEL_16:
      __break(1u);
    }
  }
LABEL_13:
  swift_bridgeObjectRelease();
}

void sub_235DCE558(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _BYTE *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;

  v6 = v5;
  v57 = a4;
  v61 = a2;
  v62 = a3;
  v58 = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v56 = (uint64_t)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v54 - v11;
  v60 = type metadata accessor for AccountSuggestion();
  v13 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v59 = (uint64_t *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = sub_235DE00CC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25429B310 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v15, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v19, v15);
  v20 = sub_235DE00B4();
  v21 = sub_235DE0294();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_235DC5000, v20, v21, "updating KVS with latest local!", v22, 2u);
    MEMORY[0x23B7E1B3C](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v23 = v6;
  v24 = (_BYTE *)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  swift_beginAccess();
  if (*v24 != 1 || (a5 & 1) != 0)
  {
    v63 = 0xD000000000000013;
    v64 = 0x8000000235DE1410;
    sub_235DE0234();
    v25 = v63;
    v26 = v64;
    v27 = *(void **)(v6 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
    v55 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs;
    if (v27)
    {
      v28 = v27;
      v29 = (void *)sub_235DE01EC();
      v30 = objc_msgSend(v28, sel_dictionaryForKey_, v29);

      v31 = v59;
      if (v30)
      {
        v32 = sub_235DE01D4();

      }
      else
      {
        v32 = 0;
      }
    }
    else
    {
      v32 = 0;
      v31 = v59;
    }
    v33 = v60;
    sub_235DD8E9C(v58, (uint64_t)v12, &qword_25429B2E8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v33) == 1)
    {
      sub_235DD8B10((uint64_t)v12, &qword_25429B2E8);
      if (v32)
      {
        swift_bridgeObjectRelease();
        v34 = v56;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v56, 1, 1, v33);
        swift_beginAccess();
        v35 = v62;
        swift_bridgeObjectRetain();
        sub_235DCCEB4(v34, v61, v35);
        swift_endAccess();
        v36 = *(void **)(v23 + v55);
        if (v36)
        {
          v37 = v36;
          v38 = (void *)sub_235DE01EC();
          swift_bridgeObjectRelease();
          objc_msgSend(v37, sel_removeObjectForKey_, v38);

          goto LABEL_25;
        }
      }
      goto LABEL_24;
    }
    v62 = v25;
    sub_235DCE300((uint64_t)v12, (uint64_t)v31);
    if (v32)
    {
      v61 = v26;
      v39 = AccountSuggestion.dictionaryRepresentation()();
      sub_235DCEC60(v32);
      swift_bridgeObjectRelease();
      v40 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
      v41 = (void *)sub_235DE01BC();
      swift_bridgeObjectRelease();
      v42 = objc_msgSend(v40, sel_initWithDictionary_, v41);

      sub_235DCEC60(v39);
      swift_bridgeObjectRelease();
      v43 = (void *)sub_235DE01BC();
      swift_bridgeObjectRelease();
      LOBYTE(v40) = objc_msgSend(v42, sel_isEqualToDictionary_, v43);

      if ((v40 & 1) == 0)
      {
        v48 = *v31;
        v49 = v31[1];
        v50 = v56;
        sub_235DCE1E0((uint64_t)v31, v56);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v50, 0, 1, v60);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        sub_235DCCEB4(v50, v48, v49);
        swift_endAccess();
        v47 = *(void **)(v23 + v55);
        if (v47)
          goto LABEL_22;
      }
    }
    else
    {
      v44 = *v31;
      v45 = v31[1];
      v46 = v56;
      sub_235DCE1E0((uint64_t)v31, v56);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v46, 0, 1, v33);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_235DCCEB4(v46, v44, v45);
      swift_endAccess();
      v47 = *(void **)(v23 + v55);
      if (v47)
      {
LABEL_22:
        v51 = v47;
        AccountSuggestion.dictionaryRepresentation()();
        v52 = (void *)sub_235DE01BC();
        swift_bridgeObjectRelease();
        v53 = (void *)sub_235DE01EC();
        swift_bridgeObjectRelease();
        objc_msgSend(v51, sel_setDictionary_forKey_, v52, v53);

        sub_235DD38D0((uint64_t)v31);
        goto LABEL_25;
      }
    }
    sub_235DD38D0((uint64_t)v31);
LABEL_24:
    swift_bridgeObjectRelease();
LABEL_25:
    if ((v57 & 1) == 0)
      return;
  }
  sub_235DCD2BC();
}

uint64_t sub_235DCEC60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381288);
    v2 = sub_235DE03B4();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_235DD8AF8(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_235DD8AF8(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_235DD8AF8(v36, v37);
    sub_235DD8AF8(v37, &v33);
    result = sub_235DE0330();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_235DD8AF8(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_235DD8B08();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_235DCF024(uint64_t a1, char a2)
{
  uint64_t v2;
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
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_235DE0144();
  v23 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235DE0168();
  v21 = *(_QWORD *)(v9 - 8);
  v22 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for AccountSuggestion();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = *(void **)(v3 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  sub_235DCE1E0(a1, (uint64_t)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v3;
  sub_235DCE300((uint64_t)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  *(_BYTE *)(v17 + v16 + v14) = a2;
  aBlock[4] = sub_235DCF424;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = &block_descriptor_30;
  v18 = _Block_copy(aBlock);
  v19 = v15;
  swift_retain();
  sub_235DE0150();
  v24 = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v11, v8, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
  return swift_release();
}

uint64_t sub_235DCF288(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AccountSuggestion();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_235DCE558((uint64_t)v7, *a2, a2[1], 1, a3);
  return sub_235DD8B10((uint64_t)v7, &qword_25429B2E8);
}

uint64_t sub_235DCF344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AccountSuggestion();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3 + *(int *)(v1 + 32);
  v5 = sub_235DE0078();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235DCF424()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_235DCF288(*(_QWORD *)(v0 + 16), (uint64_t *)(v0 + v2), *(_BYTE *)(v0 + v2 + *(_QWORD *)(v1 + 64)));
}

uint64_t sub_235DCF460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t result;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_235DE00CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25429B310 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_235DE00B4();
  v8 = sub_235DE0294();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_235DC5000, v7, v8, "Deduplicating all", v9, 2u);
    MEMORY[0x23B7E1B3C](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_235DCFE34;
  *(_QWORD *)(v11 + 24) = v1;
  aBlock[4] = sub_235DD8F20;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC8CC4;
  aBlock[3] = &block_descriptor_37;
  v12 = _Block_copy(aBlock);
  v13 = v10;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v13, v12);

  _Block_release(v12);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v12 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_235DCF69C(uint64_t a1)
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
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unint64_t *v32;
  void (*v33)(_QWORD *);
  unint64_t *v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  char v42;
  unint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int64_t v60;
  char v61;
  int64_t v62;
  unint64_t v63;
  unint64_t i;
  int64_t v65;
  unint64_t v66;
  int64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t result;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD *v91;

  v2 = sub_235DE00CC();
  v79 = *(_QWORD *)(v2 - 8);
  v80 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v78 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AccountSuggestion();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v82 = (uint64_t)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v77 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v87 = (uint64_t)&v77 - v11;
  v91 = (_QWORD *)MEMORY[0x24BEE4B00];
  v81 = a1;
  v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
  swift_beginAccess();
  v13 = *v12;
  v14 = *(_QWORD *)(*v12 + 64);
  v83 = *v12 + 64;
  v15 = 1 << *(_BYTE *)(v13 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v84 = (unint64_t)(v15 + 63) >> 6;
  v88 = v13;
  swift_bridgeObjectRetain();
  v18 = 0;
  v85 = xmmword_235DE08E0;
  v86 = v5;
  while (1)
  {
    if (v17)
    {
      v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_25;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
      goto LABEL_74;
    if (v22 >= v84)
      break;
    v23 = *(_QWORD *)(v83 + 8 * v22);
    ++v18;
    if (!v23)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v84)
        break;
      v23 = *(_QWORD *)(v83 + 8 * v18);
      if (!v23)
      {
        v18 = v22 + 2;
        if (v22 + 2 >= v84)
          break;
        v23 = *(_QWORD *)(v83 + 8 * v18);
        if (!v23)
        {
          v18 = v22 + 3;
          if (v22 + 3 >= v84)
            break;
          v23 = *(_QWORD *)(v83 + 8 * v18);
          if (!v23)
          {
            v24 = v22 + 4;
            if (v24 >= v84)
              break;
            v23 = *(_QWORD *)(v83 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                v18 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_78;
                if (v18 >= v84)
                  goto LABEL_45;
                v23 = *(_QWORD *)(v83 + 8 * v18);
                ++v24;
                if (v23)
                  goto LABEL_24;
              }
            }
            v18 = v24;
          }
        }
      }
    }
LABEL_24:
    v17 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v18 << 6);
LABEL_25:
    v25 = v87;
    v26 = *(_QWORD *)(v5 + 72);
    sub_235DCE1E0(*(_QWORD *)(v88 + 56) + v26 * v21, v87);
    sub_235DCE300(v25, (uint64_t)v10);
    v27 = *((_QWORD *)v10 + 3);
    v89 = (_QWORD *)*((_QWORD *)v10 + 2);
    v90 = v27;
    swift_bridgeObjectRetain();
    sub_235DE0234();
    swift_bridgeObjectRetain();
    sub_235DE0234();
    swift_bridgeObjectRelease();
    v28 = (uint64_t)v89;
    v29 = v90;
    v30 = (uint64_t)v91;
    if (!v91[2] || (sub_235DDBF18((uint64_t)v89, v90), (v31 & 1) == 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256381280);
      v39 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v85;
      sub_235DCE1E0((uint64_t)v10, v40 + v39);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v89 = (_QWORD *)v30;
      v43 = sub_235DDBF18(v28, v29);
      v44 = *(_QWORD *)(v30 + 16);
      v45 = (v42 & 1) == 0;
      v46 = v44 + v45;
      if (!__OFADD__(v44, v45))
      {
        v47 = v42;
        if (*(_QWORD *)(v30 + 24) < v46)
        {
          sub_235DDCDC8(v46, isUniquelyReferenced_nonNull_native);
          v48 = sub_235DDBF18(v28, v29);
          if ((v47 & 1) != (v49 & 1))
          {
            result = sub_235DE0414();
            __break(1u);
            return result;
          }
          v43 = v48;
          v50 = v89;
          if ((v47 & 1) == 0)
            goto LABEL_41;
LABEL_4:
          v19 = v50[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v19 + 8 * v43) = v40;
LABEL_5:
          v91 = v50;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v5 = v86;
          goto LABEL_6;
        }
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v50 = v89;
          if ((v42 & 1) != 0)
            goto LABEL_4;
        }
        else
        {
          sub_235DDE26C();
          v50 = v89;
          if ((v47 & 1) != 0)
            goto LABEL_4;
        }
LABEL_41:
        v50[(v43 >> 6) + 8] |= 1 << v43;
        v51 = (uint64_t *)(v50[6] + 16 * v43);
        *v51 = v28;
        v51[1] = v29;
        *(_QWORD *)(v50[7] + 8 * v43) = v40;
        v52 = v50[2];
        v53 = __OFADD__(v52, 1);
        v54 = v52 + 1;
        if (v53)
          goto LABEL_76;
        v50[2] = v54;
        swift_bridgeObjectRetain();
        goto LABEL_5;
      }
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      swift_once();
      goto LABEL_69;
    }
    v33 = sub_235DCFE4C(&v89, v28, v29);
    if (*v32)
    {
      v34 = v32;
      sub_235DCE1E0((uint64_t)v10, v82);
      v35 = *v34;
      v36 = swift_isUniquelyReferenced_nonNull_native();
      *v34 = v35;
      if ((v36 & 1) == 0)
      {
        v35 = sub_235DD3A18(0, *(_QWORD *)(v35 + 16) + 1, 1, v35);
        *v34 = v35;
      }
      v38 = *(_QWORD *)(v35 + 16);
      v37 = *(_QWORD *)(v35 + 24);
      if (v38 >= v37 >> 1)
      {
        v35 = sub_235DD3A18(v37 > 1, v38 + 1, 1, v35);
        *v34 = v35;
      }
      *(_QWORD *)(v35 + 16) = v38 + 1;
      v5 = v86;
      sub_235DCE300(v82, v35 + ((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80)) + v38 * v26);
    }
    ((void (*)(_QWORD **, _QWORD))v33)(&v89, 0);
    swift_bridgeObjectRelease();
LABEL_6:
    sub_235DD38D0((uint64_t)v10);
  }
LABEL_45:
  swift_release();
  v55 = v91;
  v56 = v91 + 8;
  v57 = 1 << *((_BYTE *)v91 + 32);
  v58 = -1;
  if (v57 < 64)
    v58 = ~(-1 << v57);
  v59 = v58 & v91[8];
  v60 = (unint64_t)(v57 + 63) >> 6;
  swift_bridgeObjectRetain();
  v61 = 0;
  v62 = 0;
  if (!v59)
    goto LABEL_51;
LABEL_48:
  v63 = __clz(__rbit64(v59));
  v59 &= v59 - 1;
  for (i = v63 | (v62 << 6); ; i = __clz(__rbit64(v66)) + (v62 << 6))
  {
    if (*(_QWORD *)(*(_QWORD *)(v55[7] + 8 * i) + 16) > 1uLL)
    {
      v68 = (_QWORD *)swift_bridgeObjectRetain();
      v61 = 1;
      sub_235DCFEF0(v68, 0, 0, 0, 1);
      swift_bridgeObjectRelease();
      if (v59)
        goto LABEL_48;
    }
    else if (v59)
    {
      goto LABEL_48;
    }
LABEL_51:
    v65 = v62 + 1;
    if (__OFADD__(v62, 1))
      goto LABEL_75;
    if (v65 >= v60)
      break;
    v66 = v56[v65];
    ++v62;
    if (!v66)
    {
      v62 = v65 + 1;
      if (v65 + 1 >= v60)
        break;
      v66 = v56[v62];
      if (!v66)
      {
        v62 = v65 + 2;
        if (v65 + 2 >= v60)
          break;
        v66 = v56[v62];
        if (!v66)
        {
          v67 = v65 + 3;
          if (v67 >= v60)
            break;
          v66 = v56[v67];
          if (!v66)
          {
            while (1)
            {
              v62 = v67 + 1;
              if (__OFADD__(v67, 1))
                goto LABEL_77;
              if (v62 >= v60)
                goto LABEL_67;
              v66 = v56[v62];
              ++v67;
              if (v66)
                goto LABEL_64;
            }
          }
          v62 = v67;
        }
      }
    }
LABEL_64:
    v59 = (v66 - 1) & v66;
  }
LABEL_67:
  swift_release();
  if ((v61 & 1) == 0)
    goto LABEL_72;
  if (qword_25429B310 != -1)
    goto LABEL_79;
LABEL_69:
  v69 = v80;
  v70 = __swift_project_value_buffer(v80, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  v72 = v78;
  v71 = v79;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v70, v69);
  v73 = sub_235DE00B4();
  v74 = sub_235DE0294();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_235DC5000, v73, v74, "Duplicates found and removed", v75, 2u);
    MEMORY[0x23B7E1B3C](v75, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v69);
LABEL_72:
  sub_235DCD2BC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235DCFE34()
{
  uint64_t v0;

  return sub_235DCF69C(v0);
}

uint64_t sub_235DCFE3C()
{
  return swift_deallocObject();
}

void (*sub_235DCFE4C(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_235DD7B08(v6, a2, a3);
  return sub_235DCFEB8;
}

void sub_235DCFEB8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_235DCFEF0(_QWORD *a1, int a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;

  v6 = v5;
  v51 = a2;
  v52 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v58 = (uint64_t)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v53 = (uint64_t)&v49 - v13;
  v14 = type metadata accessor for AccountSuggestion();
  v55 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (uint64_t *)((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  v19 = (uint64_t *)((char *)&v49 - v18);
  v20 = sub_235DE00CC();
  v21 = *(_QWORD *)(v20 - 8);
  result = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = a1;
  v25 = a1[2];
  if (v25 >= 2)
  {
    v49 = a3;
    v50 = a4;
    if (qword_25429B310 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v20, (uint64_t)qword_25429B2B8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v24, v26, v20);
    v27 = sub_235DE00B4();
    v28 = sub_235DE0294();
    v29 = os_log_type_enabled(v27, v28);
    v57 = v6;
    if (v29)
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_235DC5000, v27, v28, "We have duplicates, lets merge everything together", v30, 2u);
      MEMORY[0x23B7E1B3C](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
    v59 = v54;
    swift_bridgeObjectRetain();
    sub_235DD4A28(&v59, sub_235DD56D4);
    v31 = v55;
    v32 = v53;
    if (v59[2])
    {
      sub_235DCE1E0((uint64_t)v59 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80)), v53);
      v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56);
      v34 = v32;
      v35 = 0;
    }
    else
    {
      v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56);
      v34 = v53;
      v35 = 1;
    }
    v56 = v33;
    v33(v34, v35, 1, v14);
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v32, 1, v14) == 1)
    {
      return sub_235DD8B10(v32, &qword_25429B2E8);
    }
    else
    {
      sub_235DCE300(v32, (uint64_t)v19);
      if ((v51 & 1) != 0)
      {
        v36 = sub_235DC7F5C();
        v38 = v37;
        swift_bridgeObjectRetain();
        sub_235DD3C5C((uint64_t *)&v59, v36, v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v39 = (uint64_t)v54 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
      v40 = *(_QWORD *)(v31 + 72);
      swift_bridgeObjectRetain();
      LODWORD(v55) = v52 & 1;
      v41 = v58;
      do
      {
        sub_235DCE1E0(v39, (uint64_t)v17);
        v42 = swift_bridgeObjectRetain();
        sub_235DD03C4(v42);
        v43 = *v17;
        v44 = v17[1];
        v45 = *v17 == *v19 && v44 == v19[1];
        if (!v45 && (sub_235DE03E4() & 1) == 0)
        {
          v56(v41, 1, 1, v14);
          sub_235DCE558(v41, v43, v44, 0, v55);
          sub_235DD8B10(v41, &qword_25429B2E8);
        }
        sub_235DD38D0((uint64_t)v17);
        v39 += v40;
        --v25;
      }
      while (v25);
      swift_bridgeObjectRelease();
      if ((v49 & 1) != 0)
      {
        v46 = sub_235DC7F5C();
        sub_235DD46D8(v46, v47);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v48 = v58;
      sub_235DCE1E0((uint64_t)v19, v58);
      v56(v48, 0, 1, v14);
      sub_235DCE558(v48, *v19, v19[1], 0, 0);
      sub_235DD8B10(v48, &qword_25429B2E8);
      if ((v50 & 1) != 0)
        sub_235DCD2BC();
      return sub_235DD38D0((uint64_t)v19);
    }
  }
  return result;
}

uint64_t sub_235DD03C4(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_235DD3C5C(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_235DD0530(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  double v42;
  char *v43;
  double v44;
  char *v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint8_t *v56;
  uint64_t v57;
  _BYTE *v58;
  void *v59;
  uint64_t v60;
  id v61;
  unint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  char *v79;
  uint64_t (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;

  v85 = a1;
  v81 = sub_235DE00CC();
  v4 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v6 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235DE0078();
  v82 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v79 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2D0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v78 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v78 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v78 - v17;
  v84 = v2;
  v78 = v19;
  if (a2)
  {
    v20 = a2;
  }
  else
  {
    v21 = sub_235DC7F5C();
    v2 = v84;
    v85 = v21;
    v20 = v22;
  }
  v23 = (uint64_t *)(v2 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_deviceLastUsedDates);
  swift_beginAccess();
  v24 = *v23;
  if (*(_QWORD *)(*v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25 = sub_235DDBF18(v85, v20);
    v27 = v82;
    if ((v26 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v82 + 16))(v18, *(_QWORD *)(v24 + 56) + *(_QWORD *)(v82 + 72) * v25, v7);
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
      v29 = v18;
      v30 = 0;
    }
    else
    {
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56);
      v29 = v18;
      v30 = 1;
    }
    v83 = v28;
    v28(v29, v30, 1, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = v82;
    v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56);
    v83(v18, 1, 1, v7);
    v27 = v31;
    swift_bridgeObjectRetain();
  }
  v80 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v32 = v80(v18, 1, v7);
  sub_235DD8B10((uint64_t)v18, &qword_25429B2D0);
  v33 = v4;
  v34 = v81;
  if (v32 != 1)
  {
    v35 = *v23;
    if (*(_QWORD *)(*v23 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v36 = sub_235DDBF18(v85, v20);
      if ((v37 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v16, *(_QWORD *)(v35 + 56) + *(_QWORD *)(v27 + 72) * v36, v7);
        v38 = v16;
        v39 = 0;
      }
      else
      {
        v38 = v16;
        v39 = 1;
      }
      v83(v38, v39, 1, v7);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v83(v16, 1, 1, v7);
    }
    v40 = v80(v16, 1, v7);
    v41 = v84;
    if (v40)
    {
      sub_235DD8B10((uint64_t)v16, &qword_25429B2D0);
      v42 = 0.0;
    }
    else
    {
      v43 = v79;
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v79, v16, v7);
      sub_235DD8B10((uint64_t)v16, &qword_25429B2D0);
      sub_235DE0048();
      v42 = v44;
      v45 = v43;
      v41 = v84;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v45, v7);
    }
    v46 = *(void **)(v41 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_defaults);
    if (v46
      && (v47 = v46,
          v48 = (void *)sub_235DE01EC(),
          objc_msgSend(v47, sel_doubleForKey_, v48),
          v50 = v49,
          v47,
          v48,
          v50 > 0.0))
    {
      if (v50 >= -v42)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    else if (v42 >= -604800.0)
    {
      goto LABEL_23;
    }
  }
  if (qword_25429B310 != -1)
    swift_once();
  v52 = __swift_project_value_buffer(v34, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v6, v52, v34);
  v53 = sub_235DE00B4();
  v54 = sub_235DE0294();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_235DC5000, v53, v54, "Updating device with date now", v55, 2u);
    v56 = v55;
    v27 = v82;
    MEMORY[0x23B7E1B3C](v56, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v34);
  swift_bridgeObjectRetain();
  sub_235DE006C();
  v83(v13, 0, 1, v7);
  swift_beginAccess();
  sub_235DCD014((uint64_t)v13, v85, v20);
  swift_endAccess();
  v57 = v84;
  v58 = (_BYTE *)(v84 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_nonUpdatingMode);
  swift_beginAccess();
  if ((*v58 & 1) == 0)
  {
    v59 = *(void **)(v57 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_kvs);
    if (v59)
    {
      v60 = *v23;
      if (*(_QWORD *)(*v23 + 16))
      {
        swift_bridgeObjectRetain();
        v61 = v59;
        swift_bridgeObjectRetain();
        v62 = sub_235DDBF18(v85, v20);
        v63 = v78;
        if ((v64 & 1) != 0)
        {
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v27 + 16))(v78, *(_QWORD *)(v60 + 56) + *(_QWORD *)(v27 + 72) * v62, v7);
          v65 = v63;
          v66 = 0;
        }
        else
        {
          v65 = v78;
          v66 = 1;
        }
        v83((char *)v65, v66, 1, v7);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v63 = v78;
        v83((char *)v78, 1, 1, v7);
        v67 = v59;
      }
      if (v80((char *)v63, 1, v7))
      {
        sub_235DD8B10(v63, &qword_25429B2D0);
        v68 = MEMORY[0x24BEE1768];
        v89 = MEMORY[0x24BEE1768];
        *(_QWORD *)&v88 = 0;
      }
      else
      {
        v69 = v79;
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v79, v63, v7);
        sub_235DD8B10(v63, &qword_25429B2D0);
        sub_235DE0060();
        v71 = v70;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v69, v7);
        v87 = MEMORY[0x24BEE13C8];
        *(_QWORD *)&v86 = v71;
        sub_235DD8AF8(&v86, &v88);
        v68 = v89;
        if (!v89)
        {
          v76 = 0;
          goto LABEL_42;
        }
      }
      v72 = __swift_project_boxed_opaque_existential_0(&v88, v68);
      v73 = *(_QWORD *)(v68 - 8);
      MEMORY[0x24BDAC7A8](v72);
      v75 = (char *)&v78 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v73 + 16))(v75);
      v76 = sub_235DE03D8();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v68);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v88);
LABEL_42:
      if (qword_25429B300 != -1)
        swift_once();
      v88 = xmmword_25429B408;
      swift_bridgeObjectRetain();
      sub_235DE0234();
      swift_bridgeObjectRelease();
      v77 = (void *)sub_235DE01EC();
      swift_bridgeObjectRelease();
      objc_msgSend(v59, sel_setObject_forKey_, v76, v77);

      swift_unknownObjectRelease();
      return 1;
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

void sub_235DD0DB8(void *a1)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(char *, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  char *v70;
  uint64_t *v71;
  uint64_t v72;
  unsigned __int8 v73[24];

  v2 = sub_235DE00CC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v70 = (char *)&v63 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v63 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v63 - v15;
  v17 = type metadata accessor for AccountSuggestion();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v69 = (uint64_t *)((char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v19);
  v71 = (uint64_t *)((char *)&v63 - v21);
  sub_235DCDB40(a1);
  if ((v22 & 1) == 0)
    return;
  v67 = v2;
  v23 = objc_msgSend(a1, sel_accountType);
  if (!v23)
  {
    __break(1u);
    goto LABEL_28;
  }
  v24 = v23;
  v64 = v6;
  v66 = v17;
  v25 = objc_msgSend(v23, sel_identifier);

  if (!v25)
  {
LABEL_28:
    __break(1u);
    return;
  }
  v68 = v3;
  v65 = v14;
  v26 = sub_235DE01F8();
  v28 = v27;

  v29 = objc_msgSend(a1, sel_username);
  if (v29)
  {
    v30 = v29;
    v31 = sub_235DE01F8();
    v33 = v32;

    swift_beginAccess();
    v34 = swift_bridgeObjectRetain();
    v35 = (_QWORD *)sub_235DD8754(v34, v26, v28, v31, v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v36 = v35[2];
  if (v36 >= 2)
  {
    sub_235DCFEF0(v35, 1, 0, 1, 0);
    swift_bridgeObjectRelease();
    return;
  }
  if (v36)
  {
    sub_235DCE1E0((uint64_t)v35 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), (uint64_t)v16);
    v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v38 = v16;
    v39 = 0;
  }
  else
  {
    v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v38 = v16;
    v39 = 1;
  }
  v40 = v66;
  v37(v38, v39, 1, v66);
  swift_bridgeObjectRelease();
  v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v41(v16, 1, v40) == 1)
  {
    sub_235DD8B10((uint64_t)v16, &qword_25429B2E8);
    v42 = a1;
    v43 = sub_235DC7F5C();
    v73[0] = 0;
    AccountSuggestion.init(with:computerID:source:)(v42, v43, v44, v73, (uint64_t)v11);
    if (v41(v11, 1, v40) == 1)
    {
      sub_235DD8B10((uint64_t)v11, &qword_25429B2E8);
      return;
    }
    v45 = v69;
    sub_235DCE300((uint64_t)v11, (uint64_t)v69);
    if (qword_25429B310 != -1)
      swift_once();
    v56 = v67;
    v57 = __swift_project_value_buffer(v67, (uint64_t)qword_25429B2B8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v64, v57, v56);
    v58 = sub_235DE00B4();
    v59 = sub_235DE0294();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_235DC5000, v58, v59, "Existing suggestion not found, creating a new one", v60, 2u);
      v61 = v60;
      v56 = v67;
      MEMORY[0x23B7E1B3C](v61, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v68 + 8))(v64, v56);
  }
  else
  {
    v45 = v71;
    sub_235DCE300((uint64_t)v16, (uint64_t)v71);
    if (qword_25429B310 != -1)
      swift_once();
    v46 = v67;
    v47 = __swift_project_value_buffer(v67, (uint64_t)qword_25429B2B8);
    swift_beginAccess();
    v48 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v70, v47, v46);
    v49 = sub_235DE00B4();
    v50 = sub_235DE0294();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_235DC5000, v49, v50, "Existing suggestion found, adding the computer", v51, 2u);
      v52 = v51;
      v46 = v67;
      MEMORY[0x23B7E1B3C](v52, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v68 + 8))(v48, v46);
    v53 = sub_235DC7F5C();
    v55 = v54;
    swift_bridgeObjectRetain();
    sub_235DD3C5C(&v72, v53, v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v62 = (uint64_t)v65;
  sub_235DCE1E0((uint64_t)v45, (uint64_t)v65);
  v37((char *)v62, 0, 1, v40);
  sub_235DCE558(v62, *v45, v45[1], 1, 0);
  sub_235DD8B10(v62, &qword_25429B2E8);
  sub_235DD38D0((uint64_t)v45);
}

void sub_235DD13EC(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  SEL *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  id v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  id v80;
  char v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  SEL **v92;
  SEL v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  int v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  unint64_t v122;
  void (*v123)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v124;
  uint64_t v125;
  char v126;
  id v127;
  void *v128;
  unint64_t v129;
  _QWORD v130[2];
  int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t *v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  _OWORD v143[2];
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  __int128 v147;

  v3 = 0;
  v4 = sub_235DE00CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t)v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v133 = (uint64_t)v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t)v130 - v11;
  v13 = type metadata accessor for AccountSuggestion();
  v141 = *(_QWORD *)(v13 - 8);
  v142 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (_QWORD *)((char *)v130 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x24BDAC7A8](v14);
  v140 = (uint64_t)v130 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (_QWORD *)((char *)v130 - v19);
  v134 = v1;
  if ((sub_235DCDE04((void *)a1) & 1) != 0)
  {
    v21 = objc_msgSend((id)a1, sel_accountType);
    if (!v21)
      goto LABEL_127;
    v22 = v21;
    v137 = v4;
    v138 = v20;
    v23 = objc_msgSend(v21, sel_identifier);

    if (v23)
    {
      v24 = sub_235DE01F8();
      v26 = v25;

      v139 = (id)a1;
      v27 = objc_msgSend((id)a1, sel_username);
      if (v27)
      {
        v28 = v27;
        v29 = sub_235DE01F8();
        v31 = v30;

        swift_beginAccess();
        v32 = swift_bridgeObjectRetain();
        v33 = sub_235DD8754(v32, v24, v26, v29, v31);
        v4 = 0;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = 0;
        swift_bridgeObjectRelease();
        v33 = MEMORY[0x24BEE4AF8];
      }
      if (*(_QWORD *)(v33 + 16) != 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
      v34 = v141;
      sub_235DCE1E0(v33 + ((*(unsigned __int8 *)(v141 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80)), v12);
      v35 = *(_QWORD **)(v34 + 56);
      v36 = v142;
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v35)(v12, 0, 1, v142);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v12, 1, v36) == 1)
      {
        sub_235DD8B10(v12, &qword_25429B2E8);
LABEL_11:
        a1 = (uint64_t)v139;
        v3 = 0;
        goto LABEL_51;
      }
      v136 = v35;
      sub_235DCE300(v12, (uint64_t)v138);
      a1 = *(int *)(v36 + 44);
      v37 = swift_bridgeObjectRetain();
      sub_235DCEC60(v37);
      swift_bridgeObjectRelease();
      v38 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
      v39 = (void *)sub_235DE01BC();
      swift_bridgeObjectRelease();
      v40 = objc_msgSend(v38, sel_initWithDictionary_, v39);

      v41 = (SEL *)&property descriptor for AccountSuggestionManager.allSuggestions;
      v42 = objc_msgSend(v139, sel_accountProperties);
      LOBYTE(v12) = objc_msgSend(v40, sel_isEqual_, v42);

      if ((v12 & 1) == 0)
      {
        if (qword_25429B310 != -1)
LABEL_124:
          swift_once();
        v43 = v137;
        v44 = __swift_project_value_buffer(v137, (uint64_t)qword_25429B2B8);
        swift_beginAccess();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v7, v44, v43);
        v45 = sub_235DE00B4();
        v46 = sub_235DE0294();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_235DC5000, v45, v46, "Existing suggestion found, account properties dictionary differs, saving off local account properties", v47, 2u);
          MEMORY[0x23B7E1B3C](v47, -1, -1);
        }

        (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v137);
        v48 = objc_msgSend(v139, v41[243]);
        if (!v48 || (v49 = v48, *(_QWORD *)&v146 = 0, sub_235DE01C8(), v49, (v50 = v146) == 0))
        {
          v50 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
          swift_bridgeObjectRelease();
        }
        v51 = (uint64_t)v138;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v51 + a1) = v50;
      }
      v52 = objc_msgSend(v139, sel_accountType);
      if (v52)
      {
        v53 = v52;
        v54 = objc_msgSend(v52, sel_identifier);

        if (v54)
        {
          v55 = sub_235DE01F8();
          v57 = v56;

          v58 = sub_235DE01F8();
          if (v57)
          {
            if (v55 == v58 && v57 == v59)
              goto LABEL_34;
            v60 = sub_235DE03E4();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v60 & 1) != 0)
              goto LABEL_35;
LABEL_29:
            v61 = objc_msgSend(v139, sel_accountType);
            if (v61)
            {
              v62 = v61;
              v63 = objc_msgSend(v61, sel_identifier);

              if (v63)
              {
                v64 = sub_235DE01F8();
                v66 = v65;

                v67 = sub_235DE01F8();
                if (v66)
                {
                  if (v64 != v67 || v66 != v68)
                  {
                    v81 = sub_235DE03E4();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if ((v81 & 1) == 0)
                      goto LABEL_48;
LABEL_35:
                    *(_QWORD *)&v143[0] = sub_235DE01F8();
                    *((_QWORD *)&v143[0] + 1) = v69;
                    v70 = objc_msgSend(v139, sel_objectForKeyedSubscript_, sub_235DE03FC());
                    swift_unknownObjectRelease();
                    if (v70)
                    {
                      sub_235DE030C();
                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      memset(v143, 0, sizeof(v143));
                    }
                    sub_235DD8CB4((uint64_t)v143, (uint64_t)&v146, &qword_256381278);
                    if (!*((_QWORD *)&v147 + 1))
                    {
                      sub_235DD8B10((uint64_t)&v146, &qword_256381278);
                      goto LABEL_48;
                    }
                    if ((swift_dynamicCast() & 1) == 0)
                      goto LABEL_48;
                    v71 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
                    if (v71)
                    {
                      v72 = v71;
                      v73 = (void *)sub_235DE01EC();
                      swift_bridgeObjectRelease();
                      v74 = objc_msgSend(v72, sel_accountWithIdentifier_, v73);

                      if (v74)
                      {
                        v75 = *(int *)(v142 + 48);
                        v76 = swift_bridgeObjectRetain();
                        sub_235DCEC60(v76);
                        swift_bridgeObjectRelease();
                        v77 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
                        v78 = sub_235DE01BC();
                        swift_bridgeObjectRelease();
                        v79 = objc_msgSend(v77, sel_initWithDictionary_, v78);

                        v80 = objc_msgSend(v74, v41[243]);
                        LOBYTE(v78) = objc_msgSend(v79, sel_isEqual_, v80);

                        if ((v78 & 1) == 0)
                        {
                          v127 = objc_msgSend(v74, v41[243]);
                          if (!v127
                            || (v128 = v127,
                                *(_QWORD *)&v146 = 0,
                                sub_235DE01C8(),
                                v128,
                                (v129 = v146) == 0))
                          {
                            v129 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
                            swift_bridgeObjectRelease();
                          }
                          swift_bridgeObjectRelease();

                          v82 = v138;
                          *(uint64_t *)((char *)v138 + v75) = v129;
                          a1 = (uint64_t)v139;
                          v3 = v4;
                          goto LABEL_49;
                        }

                      }
LABEL_48:
                      a1 = (uint64_t)v139;
                      v3 = v4;
                      v82 = v138;
                      if ((v12 & 1) != 0)
                      {
LABEL_50:
                        sub_235DD38D0((uint64_t)v82);
                        goto LABEL_51;
                      }
LABEL_49:
                      v4 = v133;
                      sub_235DCE1E0((uint64_t)v82, v133);
                      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v136)(v4, 0, 1, v142);
                      v83 = *v82;
                      v84 = v82[1];
                      swift_bridgeObjectRetain();
                      sub_235DCE558(v4, v83, v84, 1, 0);
                      swift_bridgeObjectRelease();
                      sub_235DD8B10(v4, &qword_25429B2E8);
                      goto LABEL_50;
                    }
LABEL_131:
                    __break(1u);
                    return;
                  }
LABEL_34:
                  swift_bridgeObjectRelease_n();
                  goto LABEL_35;
                }
              }
              else
              {
                sub_235DE01F8();
              }
              swift_bridgeObjectRelease();
              goto LABEL_48;
            }
LABEL_130:
            __break(1u);
            goto LABEL_131;
          }
        }
        else
        {
          sub_235DE01F8();
        }
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
    }
    else
    {
LABEL_128:
      __break(1u);
    }
    __break(1u);
    goto LABEL_130;
  }
LABEL_51:
  v85 = objc_msgSend((id)a1, sel_accountType);
  if (!v85)
    goto LABEL_126;
  v86 = v85;
  v87 = objc_msgSend(v85, sel_identifier);

  if (!v87)
  {
    sub_235DE01F8();
    goto LABEL_58;
  }
  v7 = sub_235DE01F8();
  v89 = v88;

  v90 = sub_235DE01F8();
  if (!v89)
  {
LABEL_58:
    swift_bridgeObjectRelease();
    return;
  }
  if (v7 == v90 && v89 == v91)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v7 = sub_235DE03E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
      return;
  }
  v130[1] = v3;
  v12 = a1;
  v92 = (SEL **)(v134 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_suggestionsByID);
  swift_beginAccess();
  v41 = *v92;
  v93 = (*v92)[8];
  v136 = *v92 + 8;
  v94 = 1 << *((_BYTE *)v41 + 32);
  v95 = -1;
  if (v94 < 64)
    v95 = ~(-1 << v94);
  v96 = v95 & (unint64_t)v93;
  v137 = (unint64_t)(v94 + 63) >> 6;
  v139 = (id)*MEMORY[0x24BDB4088];
  v132 = *MEMORY[0x24BDB40F8];
  v138 = (uint64_t *)*MEMORY[0x24BDB3F98];
  swift_bridgeObjectRetain();
  v131 = 0;
  v5 = 0;
  v135 = MEMORY[0x24BEE4AD8] + 8;
  while (v96)
  {
    v97 = __clz(__rbit64(v96));
    v96 &= v96 - 1;
    v98 = v97 | (v5 << 6);
LABEL_81:
    v102 = v140;
    sub_235DCE1E0((uint64_t)&v41[7][*(_QWORD *)(v141 + 72) * v98], v140);
    sub_235DCE300(v102, (uint64_t)v16);
    v7 = v16[2];
    v103 = v16[3];
    if (v7 != sub_235DE01F8() || v103 != v104)
    {
      a1 = sub_235DE03E4();
      swift_bridgeObjectRelease();
      if ((a1 & 1) != 0)
        goto LABEL_87;
      if (v7 != sub_235DE01F8() || v103 != v105)
      {
        v126 = sub_235DE03E4();
        swift_bridgeObjectRelease();
        if ((v126 & 1) == 0)
          goto LABEL_65;
        goto LABEL_87;
      }
    }
    swift_bridgeObjectRelease();
LABEL_87:
    v106 = sub_235DE01F8();
    v108 = *(uint64_t *)((char *)v16 + *(int *)(v142 + 44));
    if (*(_QWORD *)(v108 + 16) && (v109 = sub_235DDBF18(v106, v107), (v110 & 1) != 0))
    {
      sub_235DD3C20(*(_QWORD *)(v108 + 56) + 32 * v109, (uint64_t)&v146);
    }
    else
    {
      v146 = 0u;
      v147 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v147 + 1))
    {
      v111 = swift_dynamicCast();
      if (v111)
        v7 = v144;
      else
        v7 = 0;
      if (v111)
        v112 = v145;
      else
        v112 = 0;
    }
    else
    {
      sub_235DD8B10((uint64_t)&v146, &qword_256381278);
      v7 = 0;
      v112 = 0;
    }
    v113 = objc_msgSend((id)v12, sel_identifier);
    if (!v113)
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
      goto LABEL_128;
    }
    a1 = (uint64_t)v113;
    v4 = sub_235DE01F8();
    v115 = v114;

    if (!v112)
    {
      swift_bridgeObjectRelease();
      goto LABEL_65;
    }
    if (v7 == v4 && v112 == v115)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      a1 = sub_235DE03E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((a1 & 1) == 0)
        goto LABEL_65;
    }
    v4 = *(int *)(v142 + 48);
    v116 = swift_bridgeObjectRetain();
    sub_235DCEC60(v116);
    swift_bridgeObjectRelease();
    v117 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
    v118 = (void *)sub_235DE01BC();
    swift_bridgeObjectRelease();
    v119 = objc_msgSend(v117, sel_initWithDictionary_, v118);

    a1 = (uint64_t)objc_msgSend((id)v12, sel_accountProperties);
    v7 = (uint64_t)objc_msgSend(v119, sel_isEqual_, a1);

    if ((v7 & 1) == 0)
    {
      v120 = objc_msgSend((id)v12, sel_accountProperties);
      if (!v120 || (v121 = v120, *(_QWORD *)&v146 = 0, sub_235DE01C8(), v121, (v122 = v146) == 0))
      {
        v122 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      *(uint64_t *)((char *)v16 + v4) = v122;
      a1 = v133;
      sub_235DCE1E0((uint64_t)v16, v133);
      v123 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v141 + 56);
      v131 = 1;
      v123(a1, 0, 1, v142);
      v124 = *v16;
      v125 = v16[1];
      swift_bridgeObjectRetain();
      sub_235DCE558(a1, v124, v125, 0, 0);
      swift_bridgeObjectRelease();
      sub_235DD8B10(a1, &qword_25429B2E8);
    }
LABEL_65:
    sub_235DD38D0((uint64_t)v16);
  }
  if (__OFADD__(v5++, 1))
  {
    __break(1u);
LABEL_123:
    __break(1u);
    goto LABEL_124;
  }
  if (v5 >= v137)
    goto LABEL_116;
  v100 = v136[v5];
  if (v100)
  {
LABEL_80:
    v96 = (v100 - 1) & v100;
    v98 = __clz(__rbit64(v100)) + (v5 << 6);
    goto LABEL_81;
  }
  v101 = v5 + 1;
  if (v5 + 1 >= v137)
    goto LABEL_116;
  v100 = v136[v101];
  if (v100)
    goto LABEL_79;
  v101 = v5 + 2;
  if (v5 + 2 >= v137)
    goto LABEL_116;
  v100 = v136[v101];
  if (v100)
    goto LABEL_79;
  v101 = v5 + 3;
  if (v5 + 3 >= v137)
    goto LABEL_116;
  v100 = v136[v101];
  if (v100)
  {
LABEL_79:
    v5 = v101;
    goto LABEL_80;
  }
  v101 = v5 + 4;
  if (v5 + 4 < v137)
  {
    v100 = v136[v101];
    if (!v100)
    {
      while (1)
      {
        v5 = v101 + 1;
        if (__OFADD__(v101, 1))
          goto LABEL_123;
        if (v5 >= v137)
          goto LABEL_116;
        v100 = v136[v5];
        ++v101;
        if (v100)
          goto LABEL_80;
      }
    }
    goto LABEL_79;
  }
LABEL_116:
  swift_release();
  if ((v131 & 1) != 0)
    sub_235DCD2BC();
}

uint64_t sub_235DD2518(void *a1)
{
  return sub_235DD2794(a1, (uint64_t)&unk_250732F20, (uint64_t)sub_235DD3418, (uint64_t)&block_descriptor_43);
}

uint64_t sub_235DD2534(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t *v18;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;

  v4 = sub_235DE00CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235DCD874();
  sub_235DD0530(0, 0);
  if (qword_25429B310 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a2;
  v10 = sub_235DE00B4();
  v11 = sub_235DE0294();
  if (os_log_type_enabled(v10, v11))
  {
    v23 = a1;
    v12 = swift_slowAlloc();
    v21 = v7;
    v13 = (uint8_t *)v12;
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v24 = v9;
    v15 = v9;
    v22 = v5;
    v16 = v4;
    v17 = v15;
    sub_235DE02E8();
    *v14 = v9;

    v4 = v16;
    v5 = v22;
    _os_log_impl(&dword_235DC5000, v10, v11, "added: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B8);
    swift_arrayDestroy();
    MEMORY[0x23B7E1B3C](v14, -1, -1);
    v18 = v13;
    v7 = v21;
    MEMORY[0x23B7E1B3C](v18, -1, -1);
  }
  else
  {

    v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_235DD0DB8(v9);
  return sub_235DCA8CC();
}

uint64_t sub_235DD2778(void *a1)
{
  return sub_235DD2794(a1, (uint64_t)&unk_250732F70, (uint64_t)sub_235DD3424, (uint64_t)&block_descriptor_49);
}

uint64_t sub_235DD2794(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v7 = v4;
  v9 = sub_235DE0144();
  v23 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_235DE0168();
  v12 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)(v4 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v7;
  *(_QWORD *)(v16 + 24) = a1;
  aBlock[4] = a3;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = a4;
  v17 = _Block_copy(aBlock);
  v18 = v15;
  swift_retain();
  v19 = a1;
  sub_235DE0150();
  v24 = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v22);
  return swift_release();
}

void sub_235DD298C(uint64_t a1, void *a2)
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
  char *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  _QWORD *v24;
  NSObject *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  void (*v66)(char *, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t *v72;
  NSObject *v73;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B2E8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v68 = (uint64_t)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v70 = (uint64_t)&v61 - v7;
  v8 = type metadata accessor for AccountSuggestion();
  v69 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v72 = (uint64_t *)((char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_235DE00CC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v71 = (char *)&v61 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v61 - v16;
  sub_235DCD874();
  sub_235DD0530(0, 0);
  if (qword_25429B310 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v10, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  v66 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v67 = v18;
  v66(v17, v18, v10);
  v19 = a2;
  v20 = sub_235DE00B4();
  v21 = sub_235DE0294();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v63 = v8;
    v23 = (uint8_t *)v22;
    v24 = (_QWORD *)swift_slowAlloc();
    v61 = v23;
    v62 = v10;
    *(_DWORD *)v23 = 138412290;
    v73 = v19;
    v25 = v19;
    v64 = a1;
    v26 = v25;
    v10 = v62;
    sub_235DE02E8();
    *v24 = v19;

    v27 = v21;
    v28 = v61;
    _os_log_impl(&dword_235DC5000, v20, v27, "removed: %@", v61, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B8);
    swift_arrayDestroy();
    MEMORY[0x23B7E1B3C](v24, -1, -1);
    v8 = v63;
    MEMORY[0x23B7E1B3C](v28, -1, -1);
  }
  else
  {

    v20 = v19;
  }

  v29 = *(void (**)(char *, uint64_t))(v11 + 8);
  v30 = v17;
  v31 = v10;
  v29(v30, v10);
  v32 = -[NSObject accountType](v19, sel_accountType);
  if (!v32)
  {
    __break(1u);
    goto LABEL_28;
  }
  v33 = v32;
  v34 = objc_msgSend(v32, sel_identifier);

  if (!v34)
  {
LABEL_28:
    __break(1u);
    return;
  }
  v35 = sub_235DE01F8();
  v37 = v36;

  v38 = -[NSObject username](v19, sel_username);
  if (v38)
  {
    v39 = v38;
    v40 = sub_235DE01F8();
    v42 = v41;

    swift_beginAccess();
    v43 = swift_bridgeObjectRetain();
    v44 = (_QWORD *)sub_235DD8754(v43, v35, v37, v40, v42);
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v45 = v44[2];
  if (v45 < 2)
  {
    v47 = v69;
    v46 = v70;
    if (v45)
    {
      sub_235DCE1E0((uint64_t)v44 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80)), v70);
      v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56);
      v48(v46, 0, 1, v8);
    }
    else
    {
      v48 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56);
      v48(v70, 1, 1, v8);
    }
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v46, 1, v8) == 1)
    {
      sub_235DD8B10(v46, &qword_25429B2E8);
    }
    else
    {
      sub_235DCE300(v46, (uint64_t)v72);
      v66(v71, v67, v31);
      v49 = sub_235DE00B4();
      v50 = sub_235DE0294();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_235DC5000, v49, v50, "Existing suggestion found, removing this computer", v51, 2u);
        MEMORY[0x23B7E1B3C](v51, -1, -1);
      }

      v29(v71, v31);
      v52 = sub_235DC7F5C();
      v53 = (char *)v72 + *(int *)(v8 + 40);
      sub_235DD46D8(v52, v54);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(*(_QWORD *)v53 + 16))
      {
        sub_235DCE1E0((uint64_t)v72, v68);
        v55 = 0;
      }
      else
      {
        v66(v65, v67, v31);
        v56 = sub_235DE00B4();
        v57 = sub_235DE0294();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v58 = 0;
          _os_log_impl(&dword_235DC5000, v56, v57, "Existing suggestion has no remaining devices, removing it", v58, 2u);
          MEMORY[0x23B7E1B3C](v58, -1, -1);
        }

        v29(v65, v31);
        v55 = 1;
      }
      v59 = v68;
      v48(v68, v55, 1, v8);
      v60 = v72;
      sub_235DCE558(v59, *v72, v72[1], 1, 0);
      sub_235DD8B10(v59, &qword_25429B2E8);
      sub_235DD38D0((uint64_t)v60);
    }
  }
  else
  {
    sub_235DCFEF0(v44, 0, 1, 1, 0);
    swift_bridgeObjectRelease();
  }
  sub_235DCA8CC();
}

uint64_t sub_235DD3020(void *a1)
{
  return sub_235DD2794(a1, (uint64_t)&unk_250732FC0, (uint64_t)sub_235DD345C, (uint64_t)&block_descriptor_55);
}

void sub_235DD303C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;

  v4 = sub_235DE00CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235DCD874();
  if (qword_25429B310 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a2;
  v10 = sub_235DE00B4();
  v11 = sub_235DE0294();
  if (os_log_type_enabled(v10, v11))
  {
    v22 = a1;
    v12 = swift_slowAlloc();
    v20 = v7;
    v13 = (uint8_t *)v12;
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v23 = v9;
    v15 = v9;
    v21 = v5;
    v16 = v4;
    v17 = v15;
    sub_235DE02E8();
    *v14 = v9;

    v4 = v16;
    v5 = v21;
    _os_log_impl(&dword_235DC5000, v10, v11, "updated: %@ checking if we need to update this computer", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B8);
    swift_arrayDestroy();
    MEMORY[0x23B7E1B3C](v14, -1, -1);
    v18 = v13;
    v7 = v20;
    MEMORY[0x23B7E1B3C](v18, -1, -1);
  }
  else
  {

    v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_235DD0530(0, 0);
  sub_235DD13EC((uint64_t)v9);
}

uint64_t AccountSuggestionManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__allSuggestions;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25429B338);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager__filteredSuggestions, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  sub_235DC8398(*(_QWORD *)(v0 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_animationWrapperBlock));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AccountSuggestionManager.__deallocating_deinit()
{
  AccountSuggestionManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_235DD33BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AccountSuggestionManager();
  result = sub_235DE00E4();
  *a1 = result;
  return result;
}

_QWORD *sub_235DD33F8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_235DD3408(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_235DD3418()
{
  uint64_t v0;

  return sub_235DD2534(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_235DD3424()
{
  uint64_t v0;

  sub_235DD298C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t objectdestroy_39Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_235DD345C()
{
  uint64_t v0;

  sub_235DD303C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235DD3464()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_235DD3470()
{
  return type metadata accessor for AccountSuggestionManager();
}

uint64_t type metadata accessor for AccountSuggestionManager()
{
  uint64_t result;

  result = qword_25429B328;
  if (!qword_25429B328)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235DD34B4()
{
  unint64_t v0;

  sub_235DD3730();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AccountSuggestionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountSuggestionManager.allSuggestions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AccountSuggestionManager.allSuggestions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AccountSuggestionManager.allSuggestions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$allSuggestions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$allSuggestions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$allSuggestions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AccountSuggestionManager.filteredSuggestions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AccountSuggestionManager.filteredSuggestions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AccountSuggestionManager.filteredSuggestions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$filteredSuggestions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$filteredSuggestions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AccountSuggestionManager.$filteredSuggestions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of AccountSuggestionManager.suggestionsByID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of AccountSuggestionManager.suggestionsByID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AccountSuggestionManager.suggestionsByID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceLastUsedDates.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceLastUsedDates.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceLastUsedDates.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of AccountSuggestionManager.nonUpdatingMode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AccountSuggestionManager.nonUpdatingMode.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of AccountSuggestionManager.nonUpdatingMode.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deviceID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of AccountSuggestionManager.animationWrapperBlock.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of AccountSuggestionManager.animationWrapperBlock.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of AccountSuggestionManager.animationWrapperBlock.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of static AccountSuggestionManager.featureEnabled()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 528))();
}

uint64_t dispatch thunk of AccountSuggestionManager.__allocating_init(uiMode:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 536))();
}

uint64_t dispatch thunk of AccountSuggestionManager.startMonitoring()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of AccountSuggestionManager.stopMonitoring()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of AccountSuggestionManager._resetSyncInfo()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of AccountSuggestionManager._insertTestData(username:type:properties:outgoingProperties:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of AccountSuggestionManager._insertTestComputer(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of AccountSuggestionManager.reloadAccounts()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t dispatch thunk of AccountSuggestionManager.remove(_:forceFromUI:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 744))();
}

uint64_t dispatch thunk of AccountSuggestionManager.deduplicateAll()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 760))();
}

uint64_t dispatch thunk of AccountSuggestionManager.added(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 808))();
}

uint64_t dispatch thunk of AccountSuggestionManager.removed(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 816))();
}

uint64_t dispatch thunk of AccountSuggestionManager.updated(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 824))();
}

void sub_235DD3730()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25429B340)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25429B388);
    v0 = sub_235DE0138();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25429B340);
  }
}

uint64_t getEnumTagSinglePayload for AccountSuggestionManager.Flags(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AccountSuggestionManager.Flags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235DD3820 + 4 * byte_235DE0920[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235DD3840 + 4 * byte_235DE0925[v4]))();
}

_BYTE *sub_235DD3820(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235DD3840(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235DD3848(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235DD3850(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235DD3858(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235DD3860(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_235DD386C()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountSuggestionManager.Flags()
{
  return &type metadata for AccountSuggestionManager.Flags;
}

unint64_t sub_235DD388C()
{
  unint64_t result;

  result = qword_256381270;
  if (!qword_256381270)
  {
    result = MEMORY[0x23B7E1AA0](&unk_235DE0AE0, &type metadata for AccountSuggestionManager.Flags);
    atomic_store(result, (unint64_t *)&qword_256381270);
  }
  return result;
}

uint64_t sub_235DD38D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_235DD390C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_235DD7EDC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235DD3A18(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381280);
  v10 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_235DE0384();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_235DD8D80(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_235DD3C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235DD3C5C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_235DE0420();
  swift_bridgeObjectRetain();
  sub_235DE0210();
  v8 = sub_235DE0438();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_235DE03E4() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_235DE03E4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_235DD40E4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_235DD3E08()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
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
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381290);
  v3 = sub_235DE0348();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_235DE0420();
      sub_235DE0210();
      result = sub_235DE0438();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
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

uint64_t sub_235DD40E4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_235DD3E08();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_235DD427C();
      goto LABEL_22;
    }
    sub_235DD442C();
  }
  v11 = *v4;
  sub_235DE0420();
  sub_235DE0210();
  result = sub_235DE0438();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_235DE03E4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_235DE0408();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_235DE03E4();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_235DD427C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381290);
  v2 = *v0;
  v3 = sub_235DE033C();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_235DD442C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
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
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381290);
  v3 = sub_235DE0348();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_235DE0420();
    swift_bridgeObjectRetain();
    sub_235DE0210();
    result = sub_235DE0438();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_235DD46D8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_235DE0420();
  swift_bridgeObjectRetain();
  sub_235DE0210();
  v6 = sub_235DE0438();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_235DE03E4() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_235DE03E4() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_235DD427C();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_235DD4864(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_235DD4864(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_235DE0324();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_235DE0420();
        swift_bridgeObjectRetain();
        sub_235DE0210();
        v10 = sub_235DE0438();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_235DD4A28(_QWORD **a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v4 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
  v5 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = (_QWORD *)sub_235DD7E18(v5);
  v6 = v5[2];
  v8[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  result = a2(v8);
  *a1 = v5;
  return result;
}

uint64_t sub_235DD4AB4(uint64_t *a1)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
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
  _BOOL4 v43;
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
  int v54;
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
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  unint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  BOOL v111;
  uint64_t v112;
  char v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  BOOL v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  unint64_t v142;
  _QWORD v143[2];
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _QWORD *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t *v169;

  v2 = v1;
  v157 = type metadata accessor for AccountSuggestion();
  v4 = *(_QWORD *)(v157 - 8);
  v5 = MEMORY[0x24BDAC7A8](v157);
  v151 = (uint64_t)v143 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v164 = (uint64_t)v143 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v143 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v143 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v156 = (uint64_t)v143 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v155 = (uint64_t)v143 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v149 = (uint64_t)v143 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v148 = (uint64_t)v143 - v21;
  v169 = a1;
  v22 = a1[1];
  result = sub_235DE03CC();
  if (result >= v22)
  {
    if (v22 < 0)
      goto LABEL_157;
    if (v22)
      return sub_235DD6070(0, v22, 1, v169);
    return result;
  }
  if (v22 >= 0)
    v24 = v22;
  else
    v24 = v22 + 1;
  if (v22 < -1)
    goto LABEL_169;
  v163 = v11;
  v147 = result;
  v154 = v4;
  if (v22 < 2)
  {
    v27 = *(unsigned __int8 *)(v4 + 80);
    v28 = MEMORY[0x24BEE4AF8];
    v153 = MEMORY[0x24BEE4AF8] + ((v27 + 32) & ~v27);
    v146 = MEMORY[0x24BEE4AF8];
    if (v22 != 1)
    {
      v30 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_123:
      if (v30 >= 2)
      {
        v136 = *v169;
        do
        {
          v137 = v30 - 2;
          if (v30 < 2)
            goto LABEL_152;
          if (!v136)
            goto LABEL_164;
          v138 = v28;
          v139 = *(_QWORD *)(v28 + 32 + 16 * v137);
          v140 = *(_QWORD *)(v28 + 32 + 16 * (v30 - 1) + 8);
          result = sub_235DD6550(v136 + *(_QWORD *)(v154 + 72) * v139, v136 + *(_QWORD *)(v154 + 72) * *(_QWORD *)(v28 + 32 + 16 * (v30 - 1)), v136 + *(_QWORD *)(v154 + 72) * v140, v153);
          if (v2)
            break;
          if (v140 < v139)
            goto LABEL_153;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_235DD721C(v28);
            v138 = result;
          }
          if (v137 >= *(_QWORD *)(v138 + 16))
            goto LABEL_154;
          v141 = (_QWORD *)(v138 + 32 + 16 * v137);
          *v141 = v139;
          v141[1] = v140;
          v142 = *(_QWORD *)(v138 + 16);
          if (v30 > v142)
            goto LABEL_155;
          result = (uint64_t)memmove((void *)(v138 + 32 + 16 * (v30 - 1)), (const void *)(v138 + 32 + 16 * v30), 16 * (v142 - v30));
          *(_QWORD *)(v138 + 16) = v142 - 1;
          v30 = v142 - 1;
          v28 = v138;
        }
        while (v142 > 2);
      }
LABEL_134:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v146 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v25 = v24 >> 1;
    result = sub_235DE027C();
    *(_QWORD *)(result + 16) = v25;
    v26 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v146 = result;
    v153 = result + v26;
  }
  v29 = 0;
  v28 = MEMORY[0x24BEE4AF8];
  v158 = v14;
LABEL_15:
  v31 = v29;
  v32 = v29 + 1;
  if (v29 + 1 >= v22)
  {
    v44 = v29 + 1;
    goto LABEL_75;
  }
  v162 = v22;
  v33 = *v169;
  v34 = *(_QWORD *)(v154 + 72);
  v35 = v29;
  v36 = v148;
  sub_235DCE1E0(*v169 + v34 * v32, v148);
  v152 = v35;
  v37 = v33 + v34 * v35;
  v38 = v149;
  sub_235DCE1E0(v37, v149);
  v39 = *(_QWORD *)(v36 + 24);
  v167 = *(_QWORD *)(v36 + 16);
  v168 = v39;
  v40 = *(_QWORD *)(v38 + 24);
  v165 = *(_QWORD *)(v38 + 16);
  v166 = v40;
  sub_235DD8C70();
  v41 = sub_235DE0300();
  type metadata accessor for ComparisonResult();
  v150 = v42;
  if (v41 == -1)
  {
    LODWORD(v161) = 0;
  }
  else
  {
    if (v41 == 1)
    {
      v43 = 1;
    }
    else
    {
      if (v41)
      {
        v167 = v41;
        goto LABEL_168;
      }
      v45 = *(_QWORD *)(v148 + 40);
      v167 = *(_QWORD *)(v148 + 32);
      v168 = v45;
      v46 = *(_QWORD *)(v149 + 40);
      v165 = *(_QWORD *)(v149 + 32);
      v166 = v46;
      v43 = sub_235DE0300() == 1;
    }
    LODWORD(v161) = v43;
  }
  sub_235DD38D0(v149);
  result = sub_235DD38D0(v148);
  v31 = v152;
  v44 = v152 + 2;
  v159 = v33;
  if (v152 + 2 < v162)
  {
    v160 = v34 * v32;
    v47 = v33;
    v48 = v34 * v44;
    while (1)
    {
      v49 = v44;
      v50 = v155;
      sub_235DCE1E0(v47 + v48, v155);
      v51 = v156;
      sub_235DCE1E0(v47 + v160, v156);
      v52 = *(_QWORD *)(v50 + 24);
      v167 = *(_QWORD *)(v50 + 16);
      v168 = v52;
      v53 = *(_QWORD *)(v51 + 24);
      v165 = *(_QWORD *)(v51 + 16);
      v166 = v53;
      result = sub_235DE0300();
      if (result == -1)
      {
        v54 = 0;
      }
      else if (result == 1)
      {
        v54 = 1;
      }
      else
      {
        if (result)
          goto LABEL_165;
        v55 = *(_QWORD *)(v155 + 40);
        v167 = *(_QWORD *)(v155 + 32);
        v168 = v55;
        v56 = *(_QWORD *)(v156 + 40);
        v165 = *(_QWORD *)(v156 + 32);
        v166 = v56;
        v54 = sub_235DE0300() == 1;
      }
      sub_235DD38D0(v156);
      result = sub_235DD38D0(v155);
      if ((_DWORD)v161 != v54)
        break;
      v44 = v49 + 1;
      v47 += v34;
      if (v162 == v49 + 1)
      {
        v44 = v162;
        goto LABEL_36;
      }
    }
    v44 = v49;
LABEL_36:
    v31 = v152;
    v33 = v159;
  }
  if (!(_DWORD)v161)
    goto LABEL_50;
  if (v44 < v31)
    goto LABEL_158;
  if (v31 < v44)
  {
    v144 = v28;
    v145 = v2;
    v57 = 0;
    v58 = v34 * (v44 - 1);
    v59 = v31;
    v60 = v44 * v34;
    v61 = v59;
    v62 = v59 * v34;
    do
    {
      if (v61 != v44 + v57 - 1)
      {
        if (!v33)
          goto LABEL_163;
        v161 = v33 + v58;
        sub_235DCE300(v33 + v62, v151);
        if (v62 < v58 || v33 + v62 >= (unint64_t)(v33 + v60))
        {
          v63 = v161;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v63 = v161;
          if (v62 != v58)
            swift_arrayInitWithTakeBackToFront();
        }
        result = sub_235DCE300(v151, v63);
        v33 = v159;
      }
      ++v61;
      --v57;
      v58 -= v34;
      v60 -= v34;
      v62 += v34;
    }
    while (v61 < v44 + v57);
    v2 = v145;
    v28 = v144;
    v64 = (uint64_t)v158;
    v31 = v152;
  }
  else
  {
LABEL_50:
    v64 = (uint64_t)v158;
  }
  if (v44 >= v162)
    goto LABEL_75;
  if (__OFSUB__(v44, v31))
    goto LABEL_156;
  if (v44 - v31 >= v147)
    goto LABEL_75;
  if (__OFADD__(v31, v147))
    goto LABEL_159;
  if (v31 + v147 >= v162)
    v65 = v162;
  else
    v65 = v31 + v147;
  if (v65 >= v31)
  {
    if (v44 == v65)
      goto LABEL_75;
    v152 = v31;
    v144 = v28;
    v145 = v2;
    type metadata accessor for ComparisonResult();
    v143[1] = v66;
    v67 = *(_QWORD *)(v154 + 72);
    v68 = v67 * (v44 - 1);
    v159 = v67;
    v69 = v44 * v67;
    v150 = v65;
LABEL_64:
    v71 = 0;
    v72 = v152;
    v161 = v68;
    v162 = v44;
    v160 = v69;
    while (1)
    {
      v73 = *v169;
      sub_235DCE1E0(v69 + v71 + *v169, v64);
      v74 = v68 + v71 + v73;
      v75 = (_QWORD *)v64;
      v76 = v163;
      sub_235DCE1E0(v74, (uint64_t)v163);
      v77 = v75[3];
      v167 = v75[2];
      v168 = v77;
      v78 = v76[3];
      v165 = v76[2];
      v166 = v78;
      sub_235DD8C70();
      v79 = sub_235DE0300();
      if (v79)
      {
        if (v79 != 1)
        {
          v64 = (uint64_t)v158;
          v68 = v161;
          v70 = v162;
          v69 = v160;
          if (v79 != -1)
          {
            v167 = v79;
            goto LABEL_168;
          }
          sub_235DD38D0((uint64_t)v163);
          result = sub_235DD38D0(v64);
LABEL_63:
          v44 = v70 + 1;
          v68 += v159;
          v69 += v159;
          if (v44 != v150)
            goto LABEL_64;
          v44 = v150;
          v2 = v145;
          v28 = v144;
          v31 = v152;
LABEL_75:
          if (v44 < v31)
            goto LABEL_151;
          result = swift_isUniquelyReferenced_nonNull_native();
          v162 = v44;
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_235DD6F70(0, *(_QWORD *)(v28 + 16) + 1, 1, (char *)v28);
            v28 = result;
          }
          v86 = *(_QWORD *)(v28 + 16);
          v85 = *(_QWORD *)(v28 + 24);
          v30 = v86 + 1;
          if (v86 >= v85 >> 1)
          {
            result = (uint64_t)sub_235DD6F70((char *)(v85 > 1), v86 + 1, 1, (char *)v28);
            v28 = result;
          }
          *(_QWORD *)(v28 + 16) = v30;
          v87 = v28 + 32;
          v88 = (uint64_t *)(v28 + 32 + 16 * v86);
          v89 = v162;
          *v88 = v31;
          v88[1] = v89;
          if (v86)
          {
LABEL_81:
            v90 = v30 - 1;
            if (v30 >= 4)
            {
              v95 = v87 + 16 * v30;
              v96 = *(_QWORD *)(v95 - 64);
              v97 = *(_QWORD *)(v95 - 56);
              v101 = __OFSUB__(v97, v96);
              v98 = v97 - v96;
              if (v101)
                goto LABEL_140;
              v100 = *(_QWORD *)(v95 - 48);
              v99 = *(_QWORD *)(v95 - 40);
              v101 = __OFSUB__(v99, v100);
              v93 = v99 - v100;
              v94 = v101;
              if (v101)
                goto LABEL_141;
              v102 = v30 - 2;
              v103 = (uint64_t *)(v87 + 16 * (v30 - 2));
              v105 = *v103;
              v104 = v103[1];
              v101 = __OFSUB__(v104, v105);
              v106 = v104 - v105;
              if (v101)
                goto LABEL_143;
              v101 = __OFADD__(v93, v106);
              v107 = v93 + v106;
              if (v101)
                goto LABEL_146;
              if (v107 >= v98)
              {
                v125 = (uint64_t *)(v87 + 16 * v90);
                v127 = *v125;
                v126 = v125[1];
                v101 = __OFSUB__(v126, v127);
                v128 = v126 - v127;
                if (v101)
                  goto LABEL_150;
                v118 = v93 < v128;
              }
              else
              {
LABEL_94:
                if ((v94 & 1) != 0)
                  goto LABEL_142;
                v102 = v30 - 2;
                v108 = (uint64_t *)(v87 + 16 * (v30 - 2));
                v110 = *v108;
                v109 = v108[1];
                v111 = __OFSUB__(v109, v110);
                v112 = v109 - v110;
                v113 = v111;
                if (v111)
                  goto LABEL_145;
                v114 = (uint64_t *)(v87 + 16 * v90);
                v116 = *v114;
                v115 = v114[1];
                v101 = __OFSUB__(v115, v116);
                v117 = v115 - v116;
                if (v101)
                  goto LABEL_148;
                if (__OFADD__(v112, v117))
                  goto LABEL_149;
                if (v112 + v117 < v93)
                  goto LABEL_106;
                v118 = v93 < v117;
              }
              if (v118)
                v90 = v102;
            }
            else
            {
              if (v30 == 3)
              {
                v92 = *(_QWORD *)(v28 + 32);
                v91 = *(_QWORD *)(v28 + 40);
                v101 = __OFSUB__(v91, v92);
                v93 = v91 - v92;
                v94 = v101;
                goto LABEL_94;
              }
              v119 = *(_QWORD *)(v28 + 32);
              v120 = *(_QWORD *)(v28 + 40);
              v101 = __OFSUB__(v120, v119);
              v112 = v120 - v119;
              v113 = v101;
LABEL_106:
              if ((v113 & 1) != 0)
                goto LABEL_144;
              v121 = (uint64_t *)(v87 + 16 * v90);
              v123 = *v121;
              v122 = v121[1];
              v101 = __OFSUB__(v122, v123);
              v124 = v122 - v123;
              if (v101)
                goto LABEL_147;
              if (v124 < v112)
                goto LABEL_14;
            }
            v129 = v90 - 1;
            if (v90 - 1 >= v30)
            {
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
              break;
            }
            if (!*v169)
              goto LABEL_162;
            v130 = v28;
            v131 = (uint64_t *)(v87 + 16 * v129);
            v132 = *v131;
            v133 = (_QWORD *)(v87 + 16 * v90);
            v134 = v133[1];
            result = sub_235DD6550(*v169 + *(_QWORD *)(v154 + 72) * *v131, *v169 + *(_QWORD *)(v154 + 72) * *v133, *v169 + *(_QWORD *)(v154 + 72) * v134, v153);
            if (v2)
              goto LABEL_134;
            if (v134 < v132)
              goto LABEL_137;
            if (v90 > *(_QWORD *)(v130 + 16))
              goto LABEL_138;
            *v131 = v132;
            *(_QWORD *)(v87 + 16 * v129 + 8) = v134;
            v135 = *(_QWORD *)(v130 + 16);
            if (v90 >= v135)
              goto LABEL_139;
            v28 = v130;
            v30 = v135 - 1;
            result = (uint64_t)memmove((void *)(v87 + 16 * v90), v133 + 2, 16 * (v135 - 1 - v90));
            *(_QWORD *)(v130 + 16) = v135 - 1;
            if (v135 <= 2)
              goto LABEL_14;
            goto LABEL_81;
          }
          v30 = 1;
LABEL_14:
          v22 = v169[1];
          v29 = v162;
          if (v162 >= v22)
            goto LABEL_123;
          goto LABEL_15;
        }
        sub_235DD38D0((uint64_t)v163);
        v64 = (uint64_t)v158;
        result = sub_235DD38D0((uint64_t)v158);
        v69 = v160;
        v68 = v161;
      }
      else
      {
        v80 = v75[5];
        v167 = v75[4];
        v168 = v80;
        v81 = v76[5];
        v165 = v76[4];
        v166 = v81;
        v82 = sub_235DE0300();
        sub_235DD38D0((uint64_t)v76);
        result = sub_235DD38D0((uint64_t)v75);
        v64 = (uint64_t)v75;
        v69 = v160;
        v68 = v161;
        if (v82 != 1)
        {
          v70 = v162;
          goto LABEL_63;
        }
      }
      v83 = *v169;
      if (!*v169)
        goto LABEL_161;
      v84 = v83 + v68 + v71;
      sub_235DCE300(v83 + v69 + v71, v164);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_235DCE300(v164, v84);
      v71 -= v159;
      ++v72;
      v70 = v162;
      if (v162 == v72)
        goto LABEL_63;
    }
  }
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  v167 = result;
LABEL_168:
  sub_235DE03F0();
  __break(1u);
LABEL_169:
  result = sub_235DE0384();
  __break(1u);
  return result;
}

uint64_t sub_235DD56D4(uint64_t *a1)
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
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
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
  int v36;
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
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  char v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v2 = v1;
  v137 = type metadata accessor for AccountSuggestion();
  v131 = *(_QWORD *)(v137 - 8);
  v4 = MEMORY[0x24BDAC7A8](v137);
  v128 = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v138 = (uint64_t)&v123 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v134 = (uint64_t)&v123 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v133 = (uint64_t)&v123 - v10;
  v11 = a1[1];
  result = sub_235DE03CC();
  if (result >= v11)
  {
    if (v11 < 0)
      goto LABEL_140;
    if (v11)
      return sub_235DD6344(0, v11, 1, a1);
    return result;
  }
  if (v11 >= 0)
    v13 = v11;
  else
    v13 = v11 + 1;
  if (v11 < -1)
    goto LABEL_148;
  v125 = result;
  if (v11 < 2)
  {
    v17 = (char *)MEMORY[0x24BEE4AF8];
    v130 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    v124 = MEMORY[0x24BEE4AF8];
    if (v11 != 1)
    {
      v19 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_106:
      if (v19 >= 2)
      {
        v116 = *a1;
        do
        {
          v117 = v19 - 2;
          if (v19 < 2)
            goto LABEL_135;
          if (!v116)
            goto LABEL_147;
          v118 = v17;
          v119 = *(_QWORD *)&v17[16 * v117 + 32];
          v120 = *(_QWORD *)&v17[16 * v19 + 24];
          sub_235DD6B20(v116 + *(_QWORD *)(v131 + 72) * v119, v116 + *(_QWORD *)(v131 + 72) * *(_QWORD *)&v17[16 * v19 + 16], v116 + *(_QWORD *)(v131 + 72) * v120, v130);
          if (v2)
            break;
          if (v120 < v119)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v118 = sub_235DD721C((uint64_t)v17);
          if (v117 >= *((_QWORD *)v118 + 2))
            goto LABEL_137;
          v121 = &v118[16 * v117 + 32];
          *(_QWORD *)v121 = v119;
          *((_QWORD *)v121 + 1) = v120;
          v122 = *((_QWORD *)v118 + 2);
          if (v19 > v122)
            goto LABEL_138;
          memmove(&v118[16 * v19 + 16], &v118[16 * v19 + 32], 16 * (v122 - v19));
          *((_QWORD *)v118 + 2) = v122 - 1;
          v19 = v122 - 1;
          v17 = v118;
        }
        while (v122 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v14 = v13 >> 1;
    v15 = sub_235DE027C();
    *(_QWORD *)(v15 + 16) = v14;
    v16 = *(unsigned __int8 *)(v131 + 80);
    v124 = v15;
    v130 = v15 + ((v16 + 32) & ~v16);
  }
  v18 = 0;
  v17 = (char *)MEMORY[0x24BEE4AF8];
  v136 = a1;
  while (1)
  {
    v20 = v18;
    v21 = v18 + 1;
    if (v18 + 1 >= v11)
    {
      v38 = v18 + 1;
      goto LABEL_58;
    }
    v126 = v2;
    v22 = *a1;
    v23 = *(_QWORD *)(v131 + 72);
    v24 = v133;
    sub_235DCE1E0(*a1 + v23 * v21, v133);
    v25 = v22 + v23 * v20;
    v129 = v20;
    v26 = v134;
    sub_235DCE1E0(v25, v134);
    LODWORD(v135) = sub_235DE003C();
    v27 = v26;
    v20 = v129;
    sub_235DD38D0(v27);
    sub_235DD38D0(v24);
    v28 = v20 + 2;
    v139 = v23;
    v132 = v22;
    if (v20 + 2 >= v11)
    {
      v31 = v20 + 2;
      v37 = v23;
      if ((v135 & 1) == 0)
        goto LABEL_37;
    }
    else
    {
      v29 = v23 * v21;
      v30 = v22;
      v31 = v28;
      v32 = v23 * v28;
      do
      {
        v33 = v11;
        v34 = v133;
        sub_235DCE1E0(v30 + v32, v133);
        v35 = v134;
        sub_235DCE1E0(v30 + v29, v134);
        v36 = sub_235DE003C();
        sub_235DD38D0(v35);
        sub_235DD38D0(v34);
        if (((v135 ^ v36) & 1) != 0)
        {
          a1 = v136;
          v20 = v129;
          v11 = v33;
          v37 = v139;
          if ((v135 & 1) == 0)
            goto LABEL_37;
          goto LABEL_24;
        }
        v37 = v139;
        v30 += v139;
        ++v31;
        v11 = v33;
      }
      while (v33 != v31);
      v31 = v33;
      a1 = v136;
      v20 = v129;
      if ((v135 & 1) == 0)
      {
LABEL_37:
        v38 = v31;
        break;
      }
    }
LABEL_24:
    if (v31 < v20)
      goto LABEL_141;
    v38 = v31;
    if (v20 >= v31)
      break;
    v135 = v11;
    v123 = v17;
    v39 = 0;
    v40 = v20;
    v41 = v37 * (v31 - 1);
    v42 = v31 * v37;
    v43 = v40;
    v44 = v40 * v37;
    v45 = v132;
    do
    {
      if (v43 != v38 + v39 - 1)
      {
        if (!v45)
          goto LABEL_146;
        sub_235DCE300(v45 + v44, v128);
        if (v44 < v41 || v45 + v44 >= (unint64_t)(v45 + v42))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v44 != v41)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_235DCE300(v128, v45 + v41);
        a1 = v136;
        v38 = v31;
        v37 = v139;
      }
      ++v43;
      --v39;
      v41 -= v37;
      v42 -= v37;
      v44 += v37;
    }
    while (v43 < v38 + v39);
    v17 = v123;
    v2 = v126;
    v20 = v129;
    v11 = v135;
    if (v38 < v135)
      goto LABEL_41;
LABEL_58:
    if (v38 < v20)
      goto LABEL_134;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v135 = v38;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_235DD6F70(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v65 = *((_QWORD *)v17 + 2);
    v64 = *((_QWORD *)v17 + 3);
    v19 = v65 + 1;
    if (v65 >= v64 >> 1)
      v17 = sub_235DD6F70((char *)(v64 > 1), v65 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v19;
    v66 = v17 + 32;
    v67 = &v17[16 * v65 + 32];
    v68 = v135;
    *(_QWORD *)v67 = v20;
    *((_QWORD *)v67 + 1) = v68;
    if (v65)
    {
      while (1)
      {
        v69 = v19 - 1;
        if (v19 >= 4)
        {
          v74 = &v66[16 * v19];
          v75 = *((_QWORD *)v74 - 8);
          v76 = *((_QWORD *)v74 - 7);
          v80 = __OFSUB__(v76, v75);
          v77 = v76 - v75;
          if (v80)
            goto LABEL_123;
          v79 = *((_QWORD *)v74 - 6);
          v78 = *((_QWORD *)v74 - 5);
          v80 = __OFSUB__(v78, v79);
          v72 = v78 - v79;
          v73 = v80;
          if (v80)
            goto LABEL_124;
          v81 = v19 - 2;
          v82 = &v66[16 * v19 - 32];
          v84 = *(_QWORD *)v82;
          v83 = *((_QWORD *)v82 + 1);
          v80 = __OFSUB__(v83, v84);
          v85 = v83 - v84;
          if (v80)
            goto LABEL_126;
          v80 = __OFADD__(v72, v85);
          v86 = v72 + v85;
          if (v80)
            goto LABEL_129;
          if (v86 >= v77)
          {
            v104 = &v66[16 * v69];
            v106 = *(_QWORD *)v104;
            v105 = *((_QWORD *)v104 + 1);
            v80 = __OFSUB__(v105, v106);
            v107 = v105 - v106;
            if (v80)
              goto LABEL_133;
            v97 = v72 < v107;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            v98 = *((_QWORD *)v17 + 4);
            v99 = *((_QWORD *)v17 + 5);
            v80 = __OFSUB__(v99, v98);
            v91 = v99 - v98;
            v92 = v80;
            goto LABEL_89;
          }
          v71 = *((_QWORD *)v17 + 4);
          v70 = *((_QWORD *)v17 + 5);
          v80 = __OFSUB__(v70, v71);
          v72 = v70 - v71;
          v73 = v80;
        }
        if ((v73 & 1) != 0)
          goto LABEL_125;
        v81 = v19 - 2;
        v87 = &v66[16 * v19 - 32];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v90 = __OFSUB__(v88, v89);
        v91 = v88 - v89;
        v92 = v90;
        if (v90)
          goto LABEL_128;
        v93 = &v66[16 * v69];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v80 = __OFSUB__(v94, v95);
        v96 = v94 - v95;
        if (v80)
          goto LABEL_131;
        if (__OFADD__(v91, v96))
          goto LABEL_132;
        if (v91 + v96 >= v72)
        {
          v97 = v72 < v96;
LABEL_95:
          if (v97)
            v69 = v81;
          goto LABEL_97;
        }
LABEL_89:
        if ((v92 & 1) != 0)
          goto LABEL_127;
        v100 = &v66[16 * v69];
        v102 = *(_QWORD *)v100;
        v101 = *((_QWORD *)v100 + 1);
        v80 = __OFSUB__(v101, v102);
        v103 = v101 - v102;
        if (v80)
          goto LABEL_130;
        if (v103 < v91)
          goto LABEL_14;
LABEL_97:
        v108 = v69 - 1;
        if (v69 - 1 >= v19)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        v109 = *a1;
        if (!*a1)
          goto LABEL_145;
        v110 = v17;
        v111 = &v66[16 * v108];
        v112 = *(_QWORD *)v111;
        v113 = &v66[16 * v69];
        v114 = *((_QWORD *)v113 + 1);
        sub_235DD6B20(v109 + *(_QWORD *)(v131 + 72) * *(_QWORD *)v111, v109 + *(_QWORD *)(v131 + 72) * *(_QWORD *)v113, v109 + *(_QWORD *)(v131 + 72) * v114, v130);
        if (v2)
          goto LABEL_117;
        if (v114 < v112)
          goto LABEL_120;
        if (v69 > *((_QWORD *)v110 + 2))
          goto LABEL_121;
        *(_QWORD *)v111 = v112;
        *(_QWORD *)&v66[16 * v108 + 8] = v114;
        v115 = *((_QWORD *)v110 + 2);
        if (v69 >= v115)
          goto LABEL_122;
        v17 = v110;
        v19 = v115 - 1;
        memmove(&v66[16 * v69], v113 + 16, 16 * (v115 - 1 - v69));
        *((_QWORD *)v110 + 2) = v115 - 1;
        a1 = v136;
        if (v115 <= 2)
          goto LABEL_14;
      }
    }
    v19 = 1;
LABEL_14:
    v11 = a1[1];
    v18 = v135;
    if (v135 >= v11)
      goto LABEL_106;
  }
  v2 = v126;
  if (v38 >= v11)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v38, v20))
    goto LABEL_139;
  if (v38 - v20 >= v125)
    goto LABEL_58;
  if (__OFADD__(v20, v125))
    goto LABEL_142;
  if (v20 + v125 >= v11)
    v46 = v11;
  else
    v46 = v20 + v125;
  if (v46 >= v20)
  {
    if (v38 != v46)
    {
      v129 = v20;
      v123 = v17;
      v126 = v2;
      v127 = v46;
      v47 = *(_QWORD *)(v131 + 72);
      v48 = v47 * (v38 - 1);
      v132 = v47;
      v49 = v38 * v47;
      do
      {
        v51 = 0;
        v52 = v129;
        v135 = v38;
        while (1)
        {
          v139 = v52;
          v53 = *a1;
          v54 = v49;
          v55 = v49 + v51 + *a1;
          v56 = a1;
          v57 = v133;
          sub_235DCE1E0(v55, v133);
          v58 = v48;
          v59 = v48 + v51 + v53;
          v60 = v134;
          sub_235DCE1E0(v59, v134);
          LOBYTE(v53) = sub_235DE003C();
          sub_235DD38D0(v60);
          sub_235DD38D0(v57);
          if ((v53 & 1) == 0)
            break;
          v61 = *v56;
          if (!*v56)
            goto LABEL_144;
          v49 = v54;
          v48 = v58;
          v62 = v61 + v58 + v51;
          sub_235DCE300(v61 + v54 + v51, v138);
          swift_arrayInitWithTakeFrontToBack();
          sub_235DCE300(v138, v62);
          v51 -= v132;
          v52 = v139 + 1;
          v50 = v135;
          a1 = v136;
          if (v135 == v139 + 1)
            goto LABEL_51;
        }
        v50 = v135;
        a1 = v56;
        v48 = v58;
        v49 = v54;
LABEL_51:
        v38 = v50 + 1;
        v48 += v132;
        v49 += v132;
      }
      while (v38 != v127);
      v38 = v127;
      v2 = v126;
      v17 = v123;
      v20 = v129;
    }
    goto LABEL_58;
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  result = sub_235DE0384();
  __break(1u);
  return result;
}

uint64_t sub_235DD6070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
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
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v36 = a4;
  v30 = a1;
  v31 = type metadata accessor for AccountSuggestion();
  v6 = *(_QWORD *)(v31 - 8);
  v7 = MEMORY[0x24BDAC7A8](v31);
  v35 = (uint64_t)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v28 - v10);
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (uint64_t *)((char *)&v28 - v13);
  v34 = a3;
  v29 = a2;
  if (a3 != a2)
  {
    type metadata accessor for ComparisonResult();
    v28 = v15;
    v16 = *(_QWORD *)(v6 + 72);
    v41 = v16 * (v34 - 1);
    v32 = v16;
    v17 = v16 * v34;
LABEL_5:
    v18 = 0;
    v19 = v30;
    v33 = v17;
    while (1)
    {
      v20 = *v36;
      sub_235DCE1E0(v17 + v18 + *v36, (uint64_t)v14);
      sub_235DCE1E0(v41 + v18 + v20, (uint64_t)v11);
      v21 = v14[3];
      v39 = v14[2];
      v40 = v21;
      v22 = v11[3];
      v37 = v11[2];
      v38 = v22;
      sub_235DD8C70();
      result = sub_235DE0300();
      if (result)
      {
        if (result != 1)
        {
          v17 = v33;
          if (result != -1)
            goto LABEL_16;
          sub_235DD38D0((uint64_t)v11);
          result = sub_235DD38D0((uint64_t)v14);
LABEL_4:
          v41 += v32;
          v17 += v32;
          if (++v34 == v29)
            return result;
          goto LABEL_5;
        }
        sub_235DD38D0((uint64_t)v11);
        result = sub_235DD38D0((uint64_t)v14);
        v17 = v33;
      }
      else
      {
        v23 = v14[5];
        v39 = v14[4];
        v40 = v23;
        v24 = v11[5];
        v37 = v11[4];
        v38 = v24;
        v25 = sub_235DE0300();
        sub_235DD38D0((uint64_t)v11);
        result = sub_235DD38D0((uint64_t)v14);
        v17 = v33;
        if (v25 != 1)
          goto LABEL_4;
      }
      v26 = *v36;
      if (!*v36)
        break;
      v27 = v26 + v41 + v18;
      sub_235DCE300(v26 + v17 + v18, v35);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_235DCE300(v35, v27);
      v18 -= v32;
      if (v34 == ++v19)
        goto LABEL_4;
    }
    __break(1u);
LABEL_16:
    v39 = result;
    result = sub_235DE03F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_235DD6344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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

  v24 = a1;
  v27 = type metadata accessor for AccountSuggestion();
  v7 = MEMORY[0x24BDAC7A8](v27);
  v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v22 - v14;
  v26 = a3;
  v23 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v30 = v16 * (v26 - 1);
    v25 = v16;
    v29 = v16 * v26;
LABEL_5:
    v17 = 0;
    v18 = v24;
    while (1)
    {
      v19 = *a4;
      sub_235DCE1E0(v29 + v17 + *a4, (uint64_t)v15);
      sub_235DCE1E0(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_235DE003C();
      sub_235DD38D0((uint64_t)v11);
      result = sub_235DD38D0((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v25;
        v29 += v25;
        if (++v26 == v23)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = v20 + v30 + v17;
      sub_235DCE300(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_235DCE300(v28, v21);
      v17 -= v25;
      if (v26 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_235DD6550(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t result;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;

  v54 = type metadata accessor for AccountSuggestion();
  v8 = MEMORY[0x24BDAC7A8](v54);
  v10 = (uint64_t *)((char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (uint64_t *)((char *)&v52 - v12);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (uint64_t *)((char *)&v52 - v15);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (uint64_t *)((char *)&v52 - v18);
  v21 = *(_QWORD *)(v20 + 72);
  if (!v21)
  {
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v22 = a1;
  if (a2 - a1 == 0x8000000000000000 && v21 == -1)
    goto LABEL_73;
  v23 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v21 == -1)
  {
LABEL_74:
    __break(1u);
LABEL_75:
    v57 = v17;
    sub_235DE03F0();
    __break(1u);
    goto LABEL_76;
  }
  v24 = (uint64_t)(a2 - a1) / v21;
  v61 = a1;
  v60 = a4;
  v25 = v23 / v21;
  if (v24 >= v23 / v21)
  {
    if ((v25 & 0x8000000000000000) == 0)
    {
      v53 = a1;
      v27 = v25 * v21;
      if (a4 < a2 || a2 + v27 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v39 = a4 + v27;
      v59 = a4 + v27;
      v61 = a2;
      if (v27 >= 1 && v53 < a2)
      {
        type metadata accessor for ComparisonResult();
        v52 = v41;
        v42 = -v21;
        do
        {
          sub_235DCE1E0(v39 + v42, (uint64_t)v13);
          v43 = a2 + v42;
          sub_235DCE1E0(a2 + v42, (uint64_t)v10);
          v44 = v13[3];
          v57 = v13[2];
          v58 = v44;
          v45 = v10[3];
          v55 = v10[2];
          v56 = v45;
          sub_235DD8C70();
          v17 = sub_235DE0300();
          if (v17 == -1)
          {
            v46 = 0;
          }
          else if (v17 == 1)
          {
            v46 = 1;
          }
          else
          {
            if (v17)
              goto LABEL_75;
            v47 = v13[5];
            v57 = v13[4];
            v58 = v47;
            v48 = v10[5];
            v55 = v10[4];
            v56 = v48;
            v46 = sub_235DE0300() == 1;
          }
          v49 = a3 + v42;
          sub_235DD38D0((uint64_t)v10);
          sub_235DD38D0((uint64_t)v13);
          if (v46)
          {
            if (a3 < a2 || v49 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v61 += v42;
          }
          else
          {
            v50 = v59;
            v59 += v42;
            if (a3 < v50 || v49 >= v50)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v50)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v43 = a2;
          }
          v39 = v59;
          if (v59 <= a4)
            break;
          a2 = v43;
          a3 += v42;
        }
        while (v43 > v53);
      }
LABEL_71:
      sub_235DD7068(&v61, &v60, (uint64_t *)&v59);
      return 1;
    }
  }
  else if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24 * v21;
    if (a4 < v22 || v22 + v26 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v22)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v28 = a4 + v26;
    v59 = a4 + v26;
    v53 = a3;
    if (v26 >= 1 && a2 < a3)
    {
      type metadata accessor for ComparisonResult();
      v52 = v30;
      while (1)
      {
        sub_235DCE1E0(a2, (uint64_t)v19);
        sub_235DCE1E0(a4, (uint64_t)v16);
        v31 = v19[3];
        v57 = v19[2];
        v58 = v31;
        v32 = v16[3];
        v55 = v16[2];
        v56 = v32;
        sub_235DD8C70();
        v17 = sub_235DE0300();
        if (v17 == -1)
          break;
        if (v17 == 1)
        {
          sub_235DD38D0((uint64_t)v16);
          sub_235DD38D0((uint64_t)v19);
        }
        else
        {
          if (v17)
            goto LABEL_75;
          v33 = v19[5];
          v57 = v19[4];
          v58 = v33;
          v34 = v16[5];
          v55 = v16[4];
          v56 = v34;
          v35 = sub_235DE0300();
          sub_235DD38D0((uint64_t)v16);
          sub_235DD38D0((uint64_t)v19);
          if (v35 != 1)
            goto LABEL_33;
        }
        v36 = v61;
        v37 = a2 + v21;
        if (v61 < a2 || v61 >= v37)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v61 == a2)
        {
          v36 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_40:
        v61 = v36 + v21;
        a4 = v60;
        if (v60 < v28)
        {
          a2 = v37;
          if (v37 < v53)
            continue;
        }
        goto LABEL_71;
      }
      sub_235DD38D0((uint64_t)v16);
      sub_235DD38D0((uint64_t)v19);
LABEL_33:
      v36 = v61;
      v38 = v60 + v21;
      if (v61 < v60 || v61 >= v38)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v61 != v60)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v60 = v38;
      v37 = a2;
      goto LABEL_40;
    }
    goto LABEL_71;
  }
LABEL_76:
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

uint64_t sub_235DD6B20(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t result;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v36 = type metadata accessor for AccountSuggestion();
  v8 = MEMORY[0x24BDAC7A8](v36);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_61;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_62;
  v16 = (uint64_t)(a2 - a1) / v14;
  v39 = a1;
  v38 = a4;
  v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v26 = a4 + v19;
      v37 = a4 + v19;
      v39 = a2;
      v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        v28 = -v14;
        do
        {
          v29 = a3 + v28;
          sub_235DCE1E0(v26 + v28, (uint64_t)v12);
          v30 = a2 + v28;
          sub_235DCE1E0(a2 + v28, (uint64_t)v10);
          v31 = sub_235DE003C();
          sub_235DD38D0((uint64_t)v10);
          sub_235DD38D0((uint64_t)v12);
          if ((v31 & 1) != 0)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v30 = a2;
          }
          v26 = v37;
          if (v37 <= a4)
            break;
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v20 = a4 + v18;
    v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_235DCE1E0(a2, (uint64_t)v12);
        sub_235DCE1E0(a4, (uint64_t)v10);
        v22 = sub_235DE003C();
        sub_235DD38D0((uint64_t)v10);
        sub_235DD38D0((uint64_t)v12);
        v23 = v39;
        if ((v22 & 1) != 0)
        {
          v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 = v25;
          v24 = a2;
        }
        v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20)
          break;
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_235DD7068(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

char *sub_235DD6F70(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256381298);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_235DD7068(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for AccountSuggestion();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_235DE03C0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_235DD7174(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_235DE03C0();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_235DD721C(uint64_t a1)
{
  return sub_235DD6F70(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235DD7230(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235DD724C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_235DD724C(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381280);
  v10 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
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
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

uint64_t sub_235DD742C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
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
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

uint64_t sub_235DD7594(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_235DD76F0((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_235DD76F0((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x23B7E1B3C](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_235DD76F0(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v5 = (unint64_t *)result;
  v6 = 0;
  v7 = 0;
  v8 = a3 + 56;
  v9 = 1 << *(_BYTE *)(a3 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a3 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v14 = v13 | (v7 << 6);
LABEL_5:
    v15 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v14);
    v17 = *v15;
    v16 = v15[1];
    v18 = v17 & 0xFFFFFFFFFFFFLL;
    if ((v16 & 0x2000000000000000) != 0)
      v19 = HIBYTE(v16) & 0xF;
    else
      v19 = v18;
    if (v19)
    {
      *(_QWORD *)(result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v6++, 1))
      {
        __break(1u);
LABEL_27:
        swift_retain();
        return sub_235DD7874(v5, a2, v6, a3);
      }
    }
  }
  v20 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v20 >= v12)
    goto LABEL_27;
  v21 = *(_QWORD *)(v8 + 8 * v20);
  ++v7;
  if (v21)
    goto LABEL_23;
  v7 = v20 + 1;
  if (v20 + 1 >= v12)
    goto LABEL_27;
  v21 = *(_QWORD *)(v8 + 8 * v7);
  if (v21)
    goto LABEL_23;
  v7 = v20 + 2;
  if (v20 + 2 >= v12)
    goto LABEL_27;
  v21 = *(_QWORD *)(v8 + 8 * v7);
  if (v21)
  {
LABEL_23:
    v11 = (v21 - 1) & v21;
    v14 = __clz(__rbit64(v21)) + (v7 << 6);
    goto LABEL_5;
  }
  v22 = v20 + 3;
  if (v22 >= v12)
    goto LABEL_27;
  v21 = *(_QWORD *)(v8 + 8 * v22);
  if (v21)
  {
    v7 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    v7 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v7 >= v12)
      goto LABEL_27;
    v21 = *(_QWORD *)(v8 + 8 * v7);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_235DD7874(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381290);
  result = sub_235DE0354();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_235DE0420();
    swift_bridgeObjectRetain();
    sub_235DE0210();
    result = sub_235DE0438();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void (*sub_235DD7B08(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_235DD7D50(v6);
  v6[10] = sub_235DD7BE8(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_235DD7B98;
}

void sub_235DD7B98(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_235DD7BE8(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_235DDBF18(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_235DD7D14;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_235DDE26C();
      goto LABEL_7;
    }
    sub_235DDCDC8(v16, a4 & 1);
    v20 = sub_235DDBF18(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_235DE0414();
  __break(1u);
  return result;
}

void sub_235DD7D14(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_235DD7D7C(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_235DD7D50(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_235DD7D70;
}

uint64_t sub_235DD7D70(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_235DD7D7C(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;

  v8 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v8;
    }
    else
    {
      sub_235DDDBB8(a4, a5, a6, v8, (_QWORD *)*a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    sub_235DDD4C4(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_235DD7E18(_QWORD *a1)
{
  return sub_235DD724C(0, a1[2], 0, a1);
}

uint64_t sub_235DD7E2C(uint64_t a1)
{
  return sub_235DD742C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_235DD7E40(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_235DE0228();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_235DE0258();
  }
  __break(1u);
  return result;
}

uint64_t sub_235DD7EDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

uint64_t sub_235DD7FCC(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;

  v51 = a2;
  v3 = type metadata accessor for AccountSuggestion();
  v60 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v47 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v47 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v59 = (char *)&v47 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v57 = (uint64_t)&v47 - v12;
  result = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v47 - v14;
  v16 = 0;
  v17 = *(_QWORD *)(a1 + 64);
  v54 = a1 + 64;
  v18 = 1 << *(_BYTE *)(a1 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v48 = MEMORY[0x24BEE4AF8];
  v49 = a1;
  v61 = MEMORY[0x24BEE4AF8];
  v20 = v19 & v17;
  v50 = OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_locallySupportedAccountTypes;
  v55 = (unint64_t)(v18 + 63) >> 6;
  v56 = result;
  v53 = v8;
  if ((v19 & v17) == 0)
    goto LABEL_5;
LABEL_4:
  v21 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  v22 = v21 | (v16 << 6);
  v23 = (uint64_t)v59;
  while (1)
  {
    v27 = *(_QWORD *)(v60 + 72);
    v28 = v57;
    sub_235DCE1E0(*(_QWORD *)(a1 + 56) + v27 * v22, v57);
    sub_235DCE300(v28, (uint64_t)v15);
    LOBYTE(v28) = v15[*(int *)(v3 + 56)];
    sub_235DCE1E0((uint64_t)v15, v23);
    if ((v28 & 1) != 0)
    {
      sub_235DD38D0(v23);
      sub_235DCE1E0((uint64_t)v15, (uint64_t)v8);
      goto LABEL_34;
    }
    v29 = swift_bridgeObjectRetain();
    v30 = v58;
    v31 = *(_QWORD *)(sub_235DD7594(v29) + 16);
    swift_release();
    sub_235DD38D0(v23);
    sub_235DCE1E0((uint64_t)v15, (uint64_t)v8);
    v58 = v30;
    if (!v31)
      goto LABEL_34;
    v52 = v27;
    v32 = *(_QWORD **)(v51 + v50);
    v33 = v32[2];
    if (!v33)
    {
LABEL_33:
      v8 = v53;
LABEL_34:
      sub_235DD38D0((uint64_t)v8);
      result = sub_235DD38D0((uint64_t)v15);
      v3 = v56;
      if (v20)
        goto LABEL_4;
      goto LABEL_5;
    }
    v35 = *((_QWORD *)v53 + 2);
    v34 = *((_QWORD *)v53 + 3);
    if (v32[4] != v35 || v32[5] != v34)
    {
      result = sub_235DE03E4();
      if ((result & 1) == 0)
        break;
    }
LABEL_36:
    v8 = v53;
    sub_235DD38D0((uint64_t)v53);
    sub_235DCE300((uint64_t)v15, v47);
    v40 = v48;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_235DD7230(0, *(_QWORD *)(v40 + 16) + 1, 1);
    v41 = v61;
    v43 = *(_QWORD *)(v61 + 16);
    v42 = *(_QWORD *)(v61 + 24);
    a1 = v49;
    v44 = v52;
    if (v43 >= v42 >> 1)
    {
      sub_235DD7230(v42 > 1, v43 + 1, 1);
      v41 = v61;
    }
    *(_QWORD *)(v41 + 16) = v43 + 1;
    v45 = *(unsigned __int8 *)(v60 + 80);
    v48 = v41;
    result = sub_235DCE300(v47, v41 + ((v45 + 32) & ~v45) + v43 * v44);
    v3 = v56;
    if (v20)
      goto LABEL_4;
LABEL_5:
    v24 = __OFADD__(v16++, 1);
    v23 = (uint64_t)v59;
    if (v24)
      goto LABEL_50;
    if (v16 >= v55)
    {
LABEL_48:
      swift_release();
      return v48;
    }
    v25 = *(_QWORD *)(v54 + 8 * v16);
    if (!v25)
    {
      v26 = v16 + 1;
      if (v16 + 1 >= v55)
        goto LABEL_48;
      v25 = *(_QWORD *)(v54 + 8 * v26);
      if (v25)
        goto LABEL_14;
      v26 = v16 + 2;
      if (v16 + 2 >= v55)
        goto LABEL_48;
      v25 = *(_QWORD *)(v54 + 8 * v26);
      if (v25)
        goto LABEL_14;
      v26 = v16 + 3;
      if (v16 + 3 >= v55)
        goto LABEL_48;
      v25 = *(_QWORD *)(v54 + 8 * v26);
      if (v25)
      {
LABEL_14:
        v16 = v26;
      }
      else
      {
        v46 = v16 + 4;
        if (v16 + 4 >= v55)
          goto LABEL_48;
        v25 = *(_QWORD *)(v54 + 8 * v46);
        for (v16 += 4; !v25; ++v46)
        {
          v16 = v46 + 1;
          if (__OFADD__(v46, 1))
            goto LABEL_51;
          if (v16 >= v55)
            goto LABEL_48;
          v25 = *(_QWORD *)(v54 + 8 * v16);
        }
      }
    }
    v20 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
  }
  a1 = v49;
  v8 = v53;
  if (v33 == 1)
    goto LABEL_34;
  v36 = v32 + 7;
  v37 = 1;
  while (1)
  {
    v38 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (*(v36 - 1) == v35 && *v36 == v34)
      goto LABEL_36;
    result = sub_235DE03E4();
    if ((result & 1) != 0)
      goto LABEL_36;
    v36 += 2;
    ++v37;
    if (v38 == v33)
    {
      a1 = v49;
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_235DD8440()
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
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint8_t *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_235DE0144();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235DE0168();
  v29 = *(_QWORD *)(v6 - 8);
  v30 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235DE00CC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25429B310 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v9, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  v14 = sub_235DE00B4();
  v15 = sub_235DE0294();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v28 = v8;
    v17 = v5;
    v18 = v1;
    v19 = v2;
    v20 = v3;
    v21 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_235DC5000, v14, v15, "reload delay", v16, 2u);
    v22 = v21;
    v3 = v20;
    v2 = v19;
    v1 = v18;
    v5 = v17;
    v8 = v28;
    MEMORY[0x23B7E1B3C](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v23 = *(void **)(v1 + OBJC_IVAR____TtC18AccountSuggestions24AccountSuggestionManager_workQueue);
  aBlock[4] = sub_235DD8CF8;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235DC91DC;
  aBlock[3] = &block_descriptor_67;
  v24 = _Block_copy(aBlock);
  v25 = v23;
  swift_retain();
  sub_235DE0150();
  v31 = MEMORY[0x24BEE4AF8];
  sub_235DCE108(&qword_25429B348, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B390);
  sub_235DCE148(&qword_25429B398, &qword_25429B390);
  sub_235DE0318();
  MEMORY[0x23B7E1620](0, v8, v5, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v30);
  return swift_release();
}

uint64_t sub_235DD8754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t i;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  char v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v47 = a5;
  v48 = a4;
  v8 = type metadata accessor for AccountSuggestion();
  v46 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v41 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v40 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v40 - v15;
  result = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v40 - v18;
  v20 = 0;
  v45 = a1;
  v21 = *(_QWORD *)(a1 + 64);
  v43 = a1 + 64;
  v22 = 1 << *(_BYTE *)(a1 + 32);
  v23 = -1;
  if (v22 < 64)
    v23 = ~(-1 << v22);
  v42 = MEMORY[0x24BEE4AF8];
  v49 = MEMORY[0x24BEE4AF8];
  v24 = v23 & v21;
  v44 = (unint64_t)(v22 + 63) >> 6;
  if ((v23 & v21) != 0)
    goto LABEL_7;
LABEL_8:
  v28 = v20 + 1;
  if (!__OFADD__(v20, 1))
  {
    if (v28 < v44)
    {
      v29 = *(_QWORD *)(v43 + 8 * v28);
      ++v20;
      if (v29)
        goto LABEL_23;
      v20 = v28 + 1;
      if (v28 + 1 >= v44)
        goto LABEL_40;
      v29 = *(_QWORD *)(v43 + 8 * v20);
      if (v29)
        goto LABEL_23;
      v20 = v28 + 2;
      if (v28 + 2 >= v44)
        goto LABEL_40;
      v29 = *(_QWORD *)(v43 + 8 * v20);
      if (v29)
        goto LABEL_23;
      v20 = v28 + 3;
      if (v28 + 3 >= v44)
        goto LABEL_40;
      v29 = *(_QWORD *)(v43 + 8 * v20);
      if (v29)
      {
LABEL_23:
        v24 = (v29 - 1) & v29;
        for (i = __clz(__rbit64(v29)) + (v20 << 6); ; i = v26 | (v20 << 6))
        {
          v31 = *(_QWORD *)(v46 + 72);
          sub_235DCE1E0(*(_QWORD *)(v45 + 56) + v31 * i, (uint64_t)v16);
          sub_235DCE300((uint64_t)v16, (uint64_t)v19);
          if (*((_QWORD *)v19 + 2) == a2 && *((_QWORD *)v19 + 3) == a3)
          {
            sub_235DCE1E0((uint64_t)v19, (uint64_t)v13);
          }
          else
          {
            v33 = sub_235DE03E4();
            sub_235DCE1E0((uint64_t)v19, (uint64_t)v13);
            if ((v33 & 1) == 0)
            {
              sub_235DD38D0((uint64_t)v13);
LABEL_6:
              result = sub_235DD38D0((uint64_t)v19);
              if (!v24)
                goto LABEL_8;
              goto LABEL_7;
            }
          }
          if (*((_QWORD *)v13 + 4) == v48 && *((_QWORD *)v13 + 5) == v47)
          {
            sub_235DD38D0((uint64_t)v13);
          }
          else
          {
            v25 = sub_235DE03E4();
            sub_235DD38D0((uint64_t)v13);
            if ((v25 & 1) == 0)
              goto LABEL_6;
          }
          sub_235DCE300((uint64_t)v19, v41);
          v34 = v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_235DD7230(0, *(_QWORD *)(v34 + 16) + 1, 1);
          v35 = v49;
          v37 = *(_QWORD *)(v49 + 16);
          v36 = *(_QWORD *)(v49 + 24);
          v38 = v37 + 1;
          if (v37 >= v36 >> 1)
          {
            v42 = v37 + 1;
            v40 = v37;
            sub_235DD7230(v36 > 1, v37 + 1, 1);
            v38 = v42;
            v37 = v40;
            v35 = v49;
          }
          *(_QWORD *)(v35 + 16) = v38;
          v39 = *(unsigned __int8 *)(v46 + 80);
          v42 = v35;
          result = sub_235DCE300(v41, v35 + ((v39 + 32) & ~v39) + v37 * v31);
          if (!v24)
            goto LABEL_8;
LABEL_7:
          v26 = __clz(__rbit64(v24));
          v24 &= v24 - 1;
        }
      }
      v30 = v28 + 4;
      if (v30 < v44)
      {
        v29 = *(_QWORD *)(v43 + 8 * v30);
        if (v29)
        {
          v20 = v30;
          goto LABEL_23;
        }
        while (1)
        {
          v20 = v30 + 1;
          if (__OFADD__(v30, 1))
            goto LABEL_42;
          if (v20 >= v44)
            break;
          v29 = *(_QWORD *)(v43 + 8 * v20);
          ++v30;
          if (v29)
            goto LABEL_23;
        }
      }
    }
LABEL_40:
    swift_release();
    return v42;
  }
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

_OWORD *sub_235DD8AF8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_235DD8B08()
{
  return swift_release();
}

uint64_t sub_235DD8B10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_235DD8B90(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235DD8BCC()
{
  uint64_t *v0;

  return sub_235DCD56C(v0[2], v0[3], v0[4]);
}

uint64_t objectdestroy_57Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235DD8C10()
{
  return sub_235DCD6E4();
}

void type metadata accessor for ComparisonResult()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2563812E8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2563812E8);
  }
}

unint64_t sub_235DD8C70()
{
  unint64_t result;

  result = qword_2563812A8;
  if (!qword_2563812A8)
  {
    result = MEMORY[0x23B7E1AA0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2563812A8);
  }
  return result;
}

uint64_t sub_235DD8CB4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_235DD8CF8()
{
  uint64_t v0;

  return sub_235DC8E00(v0);
}

uint64_t sub_235DD8D00()
{
  uint64_t v0;

  return sub_235DC9070(v0);
}

uint64_t sub_235DD8D08()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235DD8D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_235DC8260(a1, a2, *(void (**)(_QWORD *))(v2 + 16));
}

uint64_t sub_235DD8D34()
{
  return swift_deallocObject();
}

uint64_t sub_235DD8D44(_OWORD *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t (*)(), _OWORD *);
  _OWORD v4[2];

  v2 = *(uint64_t (**)(uint64_t (*)(), _OWORD *))(v1 + 16);
  v4[1] = *a1;
  return v2(sub_235DCE0C8, v4);
}

uint64_t sub_235DD8D80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
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
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

uint64_t sub_235DD8E9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t AccountSuggestion.Source.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t AccountSuggestion.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t v11;
  unint64_t *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  int *v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  uint64_t v79;
  unint64_t v80;
  int *v81;
  unint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;

  v85 = a2;
  v3 = sub_235DE00CC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AccountSuggestion();
  v84 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (_QWORD *)((char *)v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(int *)(v8 + 52);
  *(unint64_t *)((char *)v10 + v11) = sub_235DC783C(MEMORY[0x24BEE4AF8]);
  v12 = (unint64_t *)*(int *)(v7 + 56);
  *((_BYTE *)v12 + (_QWORD)v10) = 0;
  if (qword_256381230 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_3;
LABEL_29:
    v89 = 0u;
    v90 = 0u;
    goto LABEL_30;
  }
  swift_once();
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_29;
LABEL_3:
  v13 = v6;
  v82 = v12;
  v14 = qword_2563817B8;
  v15 = qword_2563817B0;
  swift_bridgeObjectRetain();
  v16 = sub_235DDBF18(v15, v14);
  if ((v17 & 1) == 0)
  {
    v89 = 0u;
    v90 = 0u;
    swift_bridgeObjectRelease();
    v6 = v13;
    goto LABEL_30;
  }
  sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v16, (uint64_t)&v89);
  swift_bridgeObjectRelease();
  v6 = v13;
  if (!*((_QWORD *)&v90 + 1))
  {
LABEL_30:
    sub_235DDBF7C((uint64_t)&v89);
    goto LABEL_31;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = v3;
    v83 = v11;
    v19 = v87;
    if (*(_QWORD *)(a1 + 16))
    {
      v20 = v86;
      v21 = sub_235DDBF18(0xD000000000000015, 0x8000000235DE14F0);
      if ((v22 & 1) != 0)
      {
        sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v21, (uint64_t)&v89);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v81 = (int *)v7;
          v23 = v86;
          v24 = v87;
          if (qword_256381238 == -1)
          {
            if (*(_QWORD *)(a1 + 16))
              goto LABEL_11;
          }
          else
          {
            swift_once();
            if (*(_QWORD *)(a1 + 16))
            {
LABEL_11:
              v79 = v23;
              v80 = v24;
              v25 = qword_2563817C8;
              v26 = qword_2563817C0;
              swift_bridgeObjectRetain();
              v27 = sub_235DDBF18(v26, v25);
              if ((v28 & 1) != 0)
              {
                sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v27, (uint64_t)&v89);
              }
              else
              {
                v89 = 0u;
                v90 = 0u;
              }
              v6 = v13;
              v29 = v80;
              swift_bridgeObjectRelease();
              if (*((_QWORD *)&v90 + 1))
              {
                if ((swift_dynamicCast() & 1) != 0)
                {
                  v30 = v86;
                  v31 = v87;
                  *v10 = v20;
                  v10[1] = v19;
                  v32 = (uint64_t)v10;
                  v10[2] = v79;
                  v10[3] = v29;
                  v10[4] = v30;
                  v10[5] = v31;
                  if (qword_256381240 == -1)
                  {
                    if (*(_QWORD *)(a1 + 16))
                      goto LABEL_21;
                  }
                  else
                  {
                    swift_once();
                    if (*(_QWORD *)(a1 + 16))
                    {
LABEL_21:
                      v33 = qword_2563817D8;
                      v34 = qword_2563817D0;
                      swift_bridgeObjectRetain();
                      v35 = sub_235DDBF18(v34, v33);
                      if ((v36 & 1) != 0)
                      {
                        sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v35, (uint64_t)&v89);
                      }
                      else
                      {
                        v89 = 0u;
                        v90 = 0u;
                      }
                      v37 = v81;
                      swift_bridgeObjectRelease();
                      if (*((_QWORD *)&v90 + 1))
                      {
                        v38 = swift_dynamicCast();
                        v39 = v86;
                        v40 = v87;
                        if (!v38)
                        {
                          v39 = 0;
                          v40 = 0;
                        }
LABEL_44:
                        *(_QWORD *)(v32 + 48) = v39;
                        *(_QWORD *)(v32 + 56) = v40;
                        if (qword_256381248 == -1)
                        {
                          if (*(_QWORD *)(a1 + 16))
                            goto LABEL_46;
                        }
                        else
                        {
                          swift_once();
                          if (*(_QWORD *)(a1 + 16))
                          {
LABEL_46:
                            v53 = qword_2563817E8;
                            v54 = qword_2563817E0;
                            swift_bridgeObjectRetain();
                            v55 = sub_235DDBF18(v54, v53);
                            if ((v56 & 1) != 0)
                            {
                              sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v55, (uint64_t)&v89);
                            }
                            else
                            {
                              v89 = 0u;
                              v90 = 0u;
                            }
                            swift_bridgeObjectRelease();
                            if (*((_QWORD *)&v90 + 1))
                            {
                              if ((swift_dynamicCast() & 1) != 0)
                              {
                                sub_235DE0054();
                                goto LABEL_56;
                              }
LABEL_55:
                              sub_235DE006C();
LABEL_56:
                              if (qword_256381250 == -1)
                              {
                                if (*(_QWORD *)(a1 + 16))
                                  goto LABEL_58;
                              }
                              else
                              {
                                swift_once();
                                if (*(_QWORD *)(a1 + 16))
                                {
LABEL_58:
                                  v57 = qword_2563817F8;
                                  v58 = qword_2563817F0;
                                  swift_bridgeObjectRetain();
                                  v59 = sub_235DDBF18(v58, v57);
                                  if ((v60 & 1) != 0)
                                  {
                                    sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v59, (uint64_t)&v89);
                                  }
                                  else
                                  {
                                    v89 = 0u;
                                    v90 = 0u;
                                  }
                                  swift_bridgeObjectRelease();
                                  if (*((_QWORD *)&v90 + 1))
                                  {
                                    if ((swift_dynamicCast() & 1) != 0)
                                    {
                                      v61 = v86;
                                      if (v86 >= 3)
                                        v61 = 2;
LABEL_69:
                                      *(_BYTE *)(v32 + v37[9]) = v61;
                                      if (*(_QWORD *)(a1 + 16)
                                        && (v62 = sub_235DDBF18(0xD000000000000014, 0x8000000235DE1510),
                                            (v63 & 1) != 0)
                                        && (sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v62, (uint64_t)&v89),
                                            __swift_instantiateConcreteTypeFromMangledName(&qword_2563812D8),
                                            swift_dynamicCast()))
                                      {
                                        v64 = v86;
                                      }
                                      else
                                      {
                                        v64 = MEMORY[0x24BEE4AF8];
                                      }
                                      v65 = sub_235DDF554(v64);
                                      swift_bridgeObjectRelease();
                                      *(_QWORD *)(v32 + v37[10]) = v65;
                                      if (qword_256381258 == -1)
                                      {
                                        if (*(_QWORD *)(a1 + 16))
                                          goto LABEL_76;
                                      }
                                      else
                                      {
                                        swift_once();
                                        if (*(_QWORD *)(a1 + 16))
                                        {
LABEL_76:
                                          v66 = qword_256381808;
                                          v67 = qword_256381800;
                                          swift_bridgeObjectRetain();
                                          v68 = sub_235DDBF18(v67, v66);
                                          if ((v69 & 1) != 0)
                                          {
                                            sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v68, (uint64_t)&v89);
                                          }
                                          else
                                          {
                                            v89 = 0u;
                                            v90 = 0u;
                                          }
                                          swift_bridgeObjectRelease();
                                          if (*((_QWORD *)&v90 + 1))
                                          {
                                            __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B0);
                                            if (swift_dynamicCast())
                                            {
                                              v70 = v86;
                                              goto LABEL_86;
                                            }
LABEL_85:
                                            v70 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
LABEL_86:
                                            *(_QWORD *)(v32 + v37[11]) = v70;
                                            if (qword_256381260 == -1)
                                            {
                                              if (*(_QWORD *)(a1 + 16))
                                                goto LABEL_88;
                                            }
                                            else
                                            {
                                              swift_once();
                                              if (*(_QWORD *)(a1 + 16))
                                              {
LABEL_88:
                                                v71 = qword_256381818;
                                                v72 = qword_256381810;
                                                swift_bridgeObjectRetain();
                                                v73 = sub_235DDBF18(v72, v71);
                                                if ((v74 & 1) != 0)
                                                {
                                                  sub_235DD3C20(*(_QWORD *)(a1 + 56) + 32 * v73, (uint64_t)&v89);
                                                }
                                                else
                                                {
                                                  v89 = 0u;
                                                  v90 = 0u;
                                                }
                                                swift_bridgeObjectRelease();
                                                if (*((_QWORD *)&v90 + 1))
                                                {
                                                  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B0);
                                                  if (swift_dynamicCast())
                                                  {
                                                    v75 = v86;
LABEL_98:
                                                    *(_QWORD *)(v32 + v37[12]) = v75;
                                                    v76 = v83;
                                                    swift_bridgeObjectRelease();
                                                    *(_QWORD *)(v32 + v76) = a1;
                                                    *((_BYTE *)v82 + v32) = sub_235DDB124() & 1;
                                                    v77 = v85;
                                                    sub_235DCE1E0(v32, v85);
                                                    (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v84 + 56))(v77, 0, 1, v37);
                                                    return sub_235DD38D0(v32);
                                                  }
LABEL_97:
                                                  v75 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
                                                  goto LABEL_98;
                                                }
LABEL_96:
                                                sub_235DDBF7C((uint64_t)&v89);
                                                goto LABEL_97;
                                              }
                                            }
                                            v89 = 0u;
                                            v90 = 0u;
                                            goto LABEL_96;
                                          }
LABEL_84:
                                          sub_235DDBF7C((uint64_t)&v89);
                                          goto LABEL_85;
                                        }
                                      }
                                      v89 = 0u;
                                      v90 = 0u;
                                      goto LABEL_84;
                                    }
LABEL_68:
                                    v61 = 2;
                                    goto LABEL_69;
                                  }
LABEL_67:
                                  sub_235DDBF7C((uint64_t)&v89);
                                  goto LABEL_68;
                                }
                              }
                              v89 = 0u;
                              v90 = 0u;
                              goto LABEL_67;
                            }
LABEL_54:
                            sub_235DDBF7C((uint64_t)&v89);
                            goto LABEL_55;
                          }
                        }
                        v89 = 0u;
                        v90 = 0u;
                        goto LABEL_54;
                      }
LABEL_43:
                      sub_235DDBF7C((uint64_t)&v89);
                      v39 = 0;
                      v40 = 0;
                      goto LABEL_44;
                    }
                  }
                  v89 = 0u;
                  v90 = 0u;
                  v37 = v81;
                  goto LABEL_43;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_40;
              }
LABEL_39:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_235DDBF7C((uint64_t)&v89);
LABEL_40:
              v7 = (uint64_t)v81;
              v11 = v83;
              v3 = v18;
              goto LABEL_31;
            }
          }
          v89 = 0u;
          v90 = 0u;
          v6 = v13;
          goto LABEL_39;
        }
      }
    }
    swift_bridgeObjectRelease();
    v11 = v83;
    v3 = v18;
    v6 = v13;
  }
LABEL_31:
  if (qword_25429B310 != -1)
    swift_once();
  v41 = __swift_project_value_buffer(v3, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v41, v3);
  swift_bridgeObjectRetain();
  v42 = v6;
  v43 = sub_235DE00B4();
  v44 = sub_235DE0294();
  if (os_log_type_enabled(v43, v44))
  {
    v81 = (int *)v3;
    v45 = swift_slowAlloc();
    v80 = v4;
    v46 = (uint8_t *)v45;
    v47 = swift_slowAlloc();
    v86 = v47;
    v82 = v10;
    v83 = v11;
    *(_DWORD *)v46 = 136315138;
    v78[1] = v46 + 4;
    swift_bridgeObjectRetain();
    v79 = MEMORY[0x24BEE4AD8] + 8;
    v48 = sub_235DE01E0();
    v49 = v7;
    v51 = v50;
    swift_bridgeObjectRelease();
    v88 = sub_235DDB818(v48, v51, (uint64_t *)&v86);
    sub_235DE02E8();
    swift_bridgeObjectRelease_n();
    v7 = v49;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235DC5000, v43, v44, "unable to initialize with dictionary: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7E1B3C](v47, -1, -1);
    MEMORY[0x23B7E1B3C](v46, -1, -1);

    (*(void (**)(char *, int *))(v80 + 8))(v42, v81);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v42, v3);
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(v85, 1, 1, v7);
}

uint64_t AccountSuggestion.dictionaryRepresentation()()
{
  uint64_t *v0;
  uint64_t *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  _OWORD v47[2];
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  v1 = v0;
  v2 = (int *)type metadata accessor for AccountSuggestion();
  v3 = *(uint64_t *)((char *)v0 + v2[13]);
  v4 = qword_256381230;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v5 = qword_2563817B0;
  v6 = qword_2563817B8;
  v7 = *v1;
  v8 = v1[1];
  v9 = MEMORY[0x24BEE0D00];
  v49 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v48 = v7;
  *((_QWORD *)&v48 + 1) = v8;
  sub_235DD8AF8(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, v5, v6, isUniquelyReferenced_nonNull_native);
  v50 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = v1[2];
  v12 = v1[3];
  v49 = v9;
  *(_QWORD *)&v48 = v11;
  *((_QWORD *)&v48 + 1) = v12;
  sub_235DD8AF8(&v48, v47);
  swift_bridgeObjectRetain();
  v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, 0xD000000000000015, 0x8000000235DE14F0, v13);
  swift_bridgeObjectRelease();
  if (qword_256381238 != -1)
    swift_once();
  v14 = qword_2563817C0;
  v15 = qword_2563817C8;
  v16 = v1[4];
  v17 = v1[5];
  v49 = v9;
  *(_QWORD *)&v48 = v16;
  *((_QWORD *)&v48 + 1) = v17;
  sub_235DD8AF8(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, v14, v15, v18);
  v50 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_256381240 != -1)
    swift_once();
  v20 = qword_2563817D0;
  v19 = qword_2563817D8;
  v21 = v1[7];
  if (v21)
  {
    v22 = v1[6];
    v49 = v9;
    *(_QWORD *)&v48 = v22;
    *((_QWORD *)&v48 + 1) = v21;
    sub_235DD8AF8(&v48, v47);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = swift_isUniquelyReferenced_nonNull_native();
    sub_235DDD698(v47, v20, v19, v23);
    v50 = v3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_235DDC09C(v20, v19, &v48);
    swift_bridgeObjectRelease();
    sub_235DDBF7C((uint64_t)&v48);
  }
  if (qword_256381248 != -1)
    swift_once();
  v24 = qword_2563817E0;
  v25 = qword_2563817E8;
  swift_bridgeObjectRetain();
  sub_235DE0060();
  v49 = MEMORY[0x24BEE13C8];
  *(_QWORD *)&v48 = v26;
  sub_235DD8AF8(&v48, v47);
  v27 = v50;
  v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, v24, v25, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_256381250 != -1)
    swift_once();
  v29 = qword_2563817F0;
  v30 = qword_2563817F8;
  v31 = *((unsigned __int8 *)v1 + v2[9]);
  v49 = MEMORY[0x24BEE1768];
  *(_QWORD *)&v48 = v31;
  sub_235DD8AF8(&v48, v47);
  swift_bridgeObjectRetain();
  v32 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, v29, v30, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v33 = *(uint64_t *)((char *)v1 + v2[10]);
  swift_bridgeObjectRetain_n();
  v34 = sub_235DDE538(v33);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v48 = v34;
  sub_235DDE61C((uint64_t *)&v48);
  swift_bridgeObjectRelease();
  v35 = sub_235DE0264();
  swift_release();
  v49 = sub_235DD8B90(0, &qword_2563812F0);
  *(_QWORD *)&v48 = v35;
  sub_235DD8AF8(&v48, v47);
  v36 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, 0xD000000000000014, 0x8000000235DE1510, v36);
  swift_bridgeObjectRelease();
  if (qword_256381258 != -1)
    swift_once();
  v37 = qword_256381800;
  v38 = qword_256381808;
  v39 = *(uint64_t *)((char *)v1 + v2[11]);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B0);
  v49 = v40;
  *(_QWORD *)&v48 = v39;
  sub_235DD8AF8(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v41 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, v37, v38, v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_256381260 != -1)
    swift_once();
  v42 = qword_256381810;
  v43 = qword_256381818;
  v44 = *(uint64_t *)((char *)v1 + v2[12]);
  v49 = v40;
  *(_QWORD *)&v48 = v44;
  sub_235DD8AF8(&v48, v47);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v45 = swift_isUniquelyReferenced_nonNull_native();
  sub_235DDD698(v47, v42, v43, v45);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v27;
}

id AccountSuggestion.init(with:computerID:source:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id result;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t inited;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  NSObject *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  NSObject *v62;
  uint8_t *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  _OWORD v86[2];
  _QWORD v87[4];

  v84 = a3;
  v79 = a2;
  v82 = (_QWORD *)sub_235DE00CC();
  v81 = *(v82 - 1);
  MEMORY[0x24BDAC7A8](v82);
  v80 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235DE009C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AccountSuggestion();
  v83 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (uint64_t *)((char *)&v74 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v78 = *a4;
  v17 = *(int *)(v14 + 52);
  *(uint64_t *)((char *)v16 + v17) = sub_235DC783C(MEMORY[0x24BEE4AF8]);
  v18 = *(int *)(v13 + 56);
  v85 = v16;
  v77 = v18;
  *((_BYTE *)v16 + v18) = 0;
  v19 = a1;
  result = objc_msgSend(a1, sel_accountType);
  if (!result)
  {
    __break(1u);
LABEL_38:
    __break(1u);
    return result;
  }
  v21 = result;
  v22 = objc_msgSend(result, sel_identifier);

  if (v22)
  {
    v23 = sub_235DE01F8();
    v25 = v24;

    v26 = objc_msgSend(v19, sel_username);
    if (v26)
    {
      v27 = v26;
      v75 = v17;
      v76 = a5;
      v28 = sub_235DE01F8();
      v29 = v23;
      v82 = v19;
      v30 = (int *)v13;
      v32 = v31;

      sub_235DE0090();
      v33 = sub_235DE0084();
      v34 = v25;
      v36 = v35;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      v37 = v85;
      *v85 = v33;
      v37[1] = v36;
      v38 = v29;
      v37[2] = v29;
      v37[3] = v34;
      v37[4] = v28;
      v37[5] = v32;
      v39 = (uint64_t)v37;
      *((_BYTE *)v37 + v30[9]) = v78;
      *((_OWORD *)v37 + 3) = xmmword_235DE0BC0;
      swift_bridgeObjectRetain();
      sub_235DE006C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_235DE08E0;
      *(_QWORD *)(inited + 32) = v79;
      *(_QWORD *)(inited + 40) = v84;
      v41 = sub_235DDF554(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      *(_QWORD *)(v39 + v30[10]) = v41;
      v42 = v82;
      v43 = objc_msgSend(v82, sel_accountProperties);
      if (!v43 || (v44 = v43, v87[0] = 0, sub_235DE01C8(), v44, (v45 = v87[0]) == 0))
      {
        v45 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
        swift_bridgeObjectRelease();
      }
      *(_QWORD *)(v39 + v30[11]) = v45;
      if (v38 != sub_235DE01F8() || v34 != v46)
      {
        v47 = sub_235DE03E4();
        swift_bridgeObjectRelease();
        if ((v47 & 1) != 0)
        {
LABEL_13:
          swift_bridgeObjectRelease();
LABEL_14:
          *(_QWORD *)&v86[0] = sub_235DE01F8();
          *((_QWORD *)&v86[0] + 1) = v49;
          v50 = objc_msgSend(v42, sel_objectForKeyedSubscript_, sub_235DE03FC());
          swift_unknownObjectRelease();
          if (v50)
          {
            sub_235DE030C();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v86, 0, sizeof(v86));
          }
          sub_235DD8CB4((uint64_t)v86, (uint64_t)v87, &qword_256381278);
          if (!v87[3])
          {
            sub_235DDBF7C((uint64_t)v87);
            goto LABEL_33;
          }
          if ((swift_dynamicCast() & 1) == 0)
          {
LABEL_33:
            v69 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
LABEL_34:
            *(_QWORD *)(v39 + v30[12]) = v69;
            v70 = AccountSuggestion.dictionaryRepresentation()();

            v71 = v75;
            swift_bridgeObjectRelease();
            *(_QWORD *)(v39 + v71) = v70;
            *(_BYTE *)(v39 + v77) = 1;
            v72 = v76;
            sub_235DCE1E0(v39, v76);
            (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v83 + 56))(v72, 0, 1, v30);
            return (id)sub_235DD38D0(v39);
          }
          result = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
          if (result)
          {
            v64 = result;
            v65 = (void *)sub_235DE01EC();
            swift_bridgeObjectRelease();
            v66 = objc_msgSend(v64, sel_accountWithIdentifier_, v65);

            if (v66)
            {
              v67 = objc_msgSend(v66, (SEL)0x250733B4ALL);
              if (!v67 || (v68 = v67, v87[0] = 0, sub_235DE01C8(), v68, (v69 = v87[0]) == 0))
              {
                v69 = sub_235DC783C(MEMORY[0x24BEE4AF8]);
                swift_bridgeObjectRelease();
              }

              goto LABEL_34;
            }
            goto LABEL_33;
          }
          goto LABEL_38;
        }
        if (v38 != sub_235DE01F8() || v34 != v48)
        {
          v73 = sub_235DE03E4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v73 & 1) == 0)
            goto LABEL_33;
          goto LABEL_14;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_25429B310 != -1)
    swift_once();
  v51 = v82;
  v52 = __swift_project_value_buffer((uint64_t)v82, (uint64_t)qword_25429B2B8);
  swift_beginAccess();
  v53 = v81;
  v54 = v80;
  (*(void (**)(char *, uint64_t, _QWORD *))(v81 + 16))(v80, v52, v51);
  v55 = v19;
  v56 = sub_235DE00B4();
  v57 = sub_235DE0294();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    v59 = swift_slowAlloc();
    v76 = a5;
    v75 = v17;
    v60 = (_QWORD *)v59;
    *(_DWORD *)v58 = 138412290;
    *(_QWORD *)&v86[0] = v55;
    v61 = v13;
    v62 = v55;
    v54 = v80;
    sub_235DE02E8();
    *v60 = v55;

    v13 = v61;
    _os_log_impl(&dword_235DC5000, v56, v57, "unable to initialize with the acount: %@", v58, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563812B8);
    swift_arrayDestroy();
    a5 = v76;
    MEMORY[0x23B7E1B3C](v60, -1, -1);
    v63 = v58;
    v53 = v81;
    v51 = v82;
    MEMORY[0x23B7E1B3C](v63, -1, -1);
  }
  else
  {

    v56 = v55;
  }

  (*(void (**)(char *, _QWORD *))(v53 + 8))(v54, v51);
  swift_bridgeObjectRelease();
  return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v83 + 56))(a5, 1, 1, v13);
}

void ACAccount.init(accountType:suggestion:)(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v23;
  int64_t v24;
  __int128 v25;
  _OWORD v26[2];
  _QWORD v27[2];
  __int128 v28;

  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAccountType_, a1);
  if (!v3)
    goto LABEL_31;
  v4 = v3;
  v5 = (void *)sub_235DE01EC();
  objc_msgSend(v4, sel_setUsername_, v5);

  v21 = a2;
  v6 = *(_QWORD *)(a2 + *(int *)(type metadata accessor for AccountSuggestion() + 44));
  v23 = v6 + 64;
  v7 = 1 << *(_BYTE *)(v6 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v6 + 64);
  v24 = (unint64_t)(v7 + 63) >> 6;
  swift_bridgeObjectRetain();
  v10 = 0;
  if (!v9)
    goto LABEL_9;
LABEL_7:
  v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v14 = v13 | (v10 << 6);
  while (2)
  {
    v15 = *(_QWORD *)(v6 + 56);
    v16 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    v17 = v16[1];
    *(_QWORD *)&v25 = *v16;
    *((_QWORD *)&v25 + 1) = v17;
    sub_235DD3C20(v15 + 32 * v14, (uint64_t)v26);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_235DD8CB4((uint64_t)&v25, (uint64_t)v27, &qword_25429B370);
      if (!v27[1])
      {
        swift_release();

        sub_235DD38D0(v21);
        return;
      }
      sub_235DD8AF8(&v28, &v25);
      __swift_project_boxed_opaque_existential_0(&v25, *((uint64_t *)&v26[0] + 1));
      v11 = sub_235DE03D8();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v25);
      v12 = (void *)sub_235DE01EC();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setAccountProperty_forKey_, v11, v12);
      swift_unknownObjectRelease();

      if (v9)
        goto LABEL_7;
LABEL_9:
      v18 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
        goto LABEL_30;
      }
      if (v18 < v24)
      {
        v19 = *(_QWORD *)(v23 + 8 * v18);
        if (v19)
          goto LABEL_12;
        v20 = v10 + 2;
        ++v10;
        if (v18 + 1 < v24)
        {
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
            goto LABEL_15;
          v10 = v18 + 1;
          if (v18 + 2 < v24)
          {
            v19 = *(_QWORD *)(v23 + 8 * (v18 + 2));
            if (v19)
            {
              v18 += 2;
              goto LABEL_12;
            }
            v20 = v18 + 3;
            v10 = v18 + 2;
            if (v18 + 3 < v24)
              break;
          }
        }
      }
LABEL_26:
      v9 = 0;
      memset(v26, 0, sizeof(v26));
      v25 = 0u;
    }
    v19 = *(_QWORD *)(v23 + 8 * v20);
    if (v19)
    {
LABEL_15:
      v18 = v20;
LABEL_12:
      v9 = (v19 - 1) & v19;
      v14 = __clz(__rbit64(v19)) + (v18 << 6);
      v10 = v18;
      continue;
    }
    break;
  }
  while (1)
  {
    v18 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v18 >= v24)
    {
      v10 = v24 - 1;
      goto LABEL_26;
    }
    v19 = *(_QWORD *)(v23 + 8 * v18);
    ++v20;
    if (v19)
      goto LABEL_12;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
}

uint64_t static AccountSuggestion.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_235DE03E4();
}

AccountSuggestions::AccountSuggestion::Source_optional __swiftcall AccountSuggestion.Source.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (AccountSuggestions::AccountSuggestion::Source_optional)rawValue;
}

uint64_t type metadata accessor for AccountSuggestion()
{
  uint64_t result;

  result = qword_25429B2D8;
  if (!qword_25429B2D8)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_235DDAC6C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235DDAC80()
{
  sub_235DE0420();
  sub_235DE042C();
  return sub_235DE0438();
}

uint64_t sub_235DDACC4()
{
  return sub_235DE042C();
}

uint64_t sub_235DDACEC()
{
  sub_235DE0420();
  sub_235DE042C();
  return sub_235DE0438();
}

AccountSuggestions::AccountSuggestion::Source_optional sub_235DDAD2C(Swift::Int *a1)
{
  return AccountSuggestion.Source.init(rawValue:)(*a1);
}

void sub_235DDAD34(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_235DDAD40()
{
  qword_2563817B0 = 0x4449657571696E75;
  qword_2563817B8 = 0xE800000000000000;
}

void sub_235DDAD64()
{
  qword_2563817C0 = 0x656D616E72657375;
  qword_2563817C8 = 0xE800000000000000;
}

void sub_235DDAD88()
{
  qword_2563817D0 = 0x4E79616C70736964;
  qword_2563817D8 = 0xEB00000000656D61;
}

void sub_235DDADB4()
{
  strcpy((char *)&qword_2563817E0, "creationDate");
  BYTE5(qword_2563817E8) = 0;
  HIWORD(qword_2563817E8) = -5120;
}

void sub_235DDADE0()
{
  qword_2563817F0 = 0x656372756F73;
  qword_2563817F8 = 0xE600000000000000;
}

void sub_235DDAE00()
{
  qword_256381800 = 0x69747265706F7270;
  qword_256381808 = 0xEA00000000007365;
}

void sub_235DDAE28()
{
  qword_256381810 = 0x676E696F6774756FLL;
  qword_256381818 = 0xEF746E756F636341;
}

uint64_t AccountSuggestion.accountTypeIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.username.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AccountSuggestion() + 32);
  v4 = sub_235DE0078();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AccountSuggestion.computersWithAccount.getter()
{
  type metadata accessor for AccountSuggestion();
  return swift_bridgeObjectRetain();
}

uint64_t AccountSuggestion.computersWithAccount.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for AccountSuggestion() + 40);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AccountSuggestion.computersWithAccount.modify())()
{
  type metadata accessor for AccountSuggestion();
  return nullsub_1;
}

uint64_t AccountSuggestion.propertiesDictionary.getter()
{
  type metadata accessor for AccountSuggestion();
  return swift_bridgeObjectRetain();
}

uint64_t AccountSuggestion.propertiesDictionary.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for AccountSuggestion() + 44);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AccountSuggestion.propertiesDictionary.modify())()
{
  type metadata accessor for AccountSuggestion();
  return nullsub_1;
}

uint64_t AccountSuggestion.outgoingAccountProperties.getter()
{
  type metadata accessor for AccountSuggestion();
  return swift_bridgeObjectRetain();
}

uint64_t AccountSuggestion.outgoingAccountProperties.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for AccountSuggestion() + 48);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AccountSuggestion.outgoingAccountProperties.modify())()
{
  type metadata accessor for AccountSuggestion();
  return nullsub_1;
}

uint64_t AccountSuggestion.hasAccountLocally.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AccountSuggestion() + 56));
}

uint64_t AccountSuggestion.hasAccountLocally.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for AccountSuggestion();
  *(_BYTE *)(v1 + *(int *)(result + 56)) = a1;
  return result;
}

uint64_t (*AccountSuggestion.hasAccountLocally.modify())()
{
  type metadata accessor for AccountSuggestion();
  return nullsub_1;
}

uint64_t sub_235DDB124()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v13;
  void *v14;
  _QWORD v15[6];
  id v16[2];

  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (!v1)
    __break(1u);
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_235DE08E0;
  v4 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v3 + 40) = v4;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_235DE0264();
  swift_bridgeObjectRelease();
  v16[0] = 0;
  v6 = objc_msgSend(v2, sel_accountsWithAccountTypeIdentifiers_error_, v5, v16);

  v7 = v16[0];
  if (v6)
  {
    sub_235DD8B90(0, &qword_2563812A0);
    v8 = sub_235DE0270();
    v9 = v7;

    MEMORY[0x24BDAC7A8](v10);
    v15[2] = v0;
    v11 = sub_235DDB38C(sub_235DE0014, (uint64_t)v15, v8);
    swift_bridgeObjectRelease();
    if (v11)
    {

      return 1;
    }
  }
  else
  {
    v13 = v16[0];
    v14 = (void *)sub_235DE0030();

    swift_willThrow();
  }
  return 0;
}

uint64_t sub_235DDB2E8(id *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v3 = objc_msgSend(*a1, sel_username);
  if (v3)
  {
    v4 = v3;
    v5 = sub_235DE01F8();
    v7 = v6;

    if (v5 == *(_QWORD *)(a2 + 32) && v7 == *(_QWORD *)(a2 + 40))
      v9 = 1;
    else
      v9 = sub_235DE03E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

void *sub_235DDB38C(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_235DE0390())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E16BC](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

NSArray __swiftcall AccountSuggestion.sortedComputers()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AccountSuggestion() + 40));
  swift_bridgeObjectRetain_n();
  v2 = sub_235DDE538(v1);
  swift_bridgeObjectRelease();
  v5 = v2;
  sub_235DDE61C((uint64_t *)&v5);
  swift_bridgeObjectRelease();
  v3 = sub_235DE0264();
  swift_release();
  return (NSArray)v3;
}

uint64_t AccountSuggestion.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AccountSuggestion.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_235DE0210();
  return swift_bridgeObjectRelease();
}

uint64_t AccountSuggestion.hashValue.getter()
{
  sub_235DE0420();
  swift_bridgeObjectRetain();
  sub_235DE0210();
  swift_bridgeObjectRelease();
  return sub_235DE0438();
}

uint64_t sub_235DDB618@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_235DDB624()
{
  sub_235DE0420();
  swift_bridgeObjectRetain();
  sub_235DE0210();
  swift_bridgeObjectRelease();
  return sub_235DE0438();
}

uint64_t sub_235DDB67C()
{
  swift_bridgeObjectRetain();
  sub_235DE0210();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235DDB6C0()
{
  sub_235DE0420();
  swift_bridgeObjectRetain();
  sub_235DE0210();
  swift_bridgeObjectRelease();
  return sub_235DE0438();
}

uint64_t sub_235DDB714(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_235DE03E4();
}

uint64_t sub_235DDB744(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_235DDB754(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_235DDB788(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_235DDB7A8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_235DDB818(v6, v7, a3);
  v8 = *a1 + 8;
  sub_235DE02E8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_235DDB818(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235DDB8E8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235DD3C20((uint64_t)v12, *a3);
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
      sub_235DD3C20((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_235DDB8E8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235DE02F4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235DDBAA0(a5, a6);
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
  v8 = sub_235DE0378();
  if (!v8)
  {
    sub_235DE0384();
    __break(1u);
LABEL_17:
    result = sub_235DE03C0();
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

uint64_t sub_235DDBAA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235DDBB34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235DDBD0C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235DDBD0C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235DDBB34(uint64_t a1, unint64_t a2)
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
      v3 = sub_235DDBCA8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235DE0360();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235DE0384();
      __break(1u);
LABEL_10:
      v2 = sub_235DE0240();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235DE03C0();
    __break(1u);
LABEL_14:
    result = sub_235DE0384();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235DDBCA8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235DDBD0C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3D0);
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
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

_BYTE **sub_235DDBE58(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_235DDBE68(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_235DE02E8();
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

unint64_t sub_235DDBF18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235DE0420();
  sub_235DE0210();
  v4 = sub_235DE0438();
  return sub_235DDBFBC(a1, a2, v4);
}

uint64_t sub_235DDBF7C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256381278);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_235DDBFBC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235DE03E4() & 1) == 0)
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
      while (!v14 && (sub_235DE03E4() & 1) == 0);
    }
  }
  return v6;
}

double sub_235DDC09C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_235DDBF18(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_235DDDC00();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_235DD8AF8((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_235DDD0DC(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_235DDC18C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_235DDBF18(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_235DDDDE4();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for AccountSuggestion();
    v14 = *(_QWORD *)(v13 - 8);
    sub_235DCE300(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_235DDD2BC(v8, v11, (uint64_t (*)(_QWORD))type metadata accessor for AccountSuggestion);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for AccountSuggestion();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_235DDC2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_235DDBF18(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v18 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_235DDE010();
      v11 = v18;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_235DE0078();
    v14 = MEMORY[0x24BDCE900];
    v15 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v12 + *(_QWORD *)(v15 + 72) * v8, v13);
    sub_235DDD2BC(v8, v11, (uint64_t (*)(_QWORD))v14);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v17 = sub_235DE0078();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a3, 1, 1, v17);
  }
}

uint64_t sub_235DDC3FC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812C0);
  v6 = sub_235DE03A8();
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
        sub_235DD8AF8(v24, v35);
      }
      else
      {
        sub_235DD3C20((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_235DE0420();
      sub_235DE0210();
      result = sub_235DE0438();
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
      result = (uint64_t)sub_235DD8AF8(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235DDC6F8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for AccountSuggestion();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812E0);
  v43 = a2;
  v9 = sub_235DE03A8();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
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
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_235DCE300(v30, (uint64_t)v7);
    }
    else
    {
      sub_235DCE1E0(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_235DE0420();
    sub_235DE0210();
    result = sub_235DE0438();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_235DCE300((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_235DDCA60(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_235DE0078();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C0);
  v43 = a2;
  v8 = sub_235DE03A8();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_235DE0420();
      sub_235DE0210();
      result = sub_235DE0438();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_235DDCDC8(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381308);
  v36 = a2;
  v6 = sub_235DE03A8();
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
      swift_bridgeObjectRetain();
    }
    sub_235DE0420();
    sub_235DE0210();
    result = sub_235DE0438();
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

unint64_t sub_235DDD0DC(unint64_t result, uint64_t a2)
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
    result = sub_235DE0324();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_235DE0420();
        swift_bridgeObjectRetain();
        sub_235DE0210();
        v10 = sub_235DE0438();
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

unint64_t sub_235DDD2B0(unint64_t a1, uint64_t a2)
{
  return sub_235DDD2BC(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

unint64_t sub_235DDD2BC(unint64_t result, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v9 = ~v6;
    result = sub_235DE0324();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (result + 1) & v9;
      while (1)
      {
        sub_235DE0420();
        swift_bridgeObjectRetain();
        sub_235DE0210();
        v11 = sub_235DE0438();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v9;
        if (v4 >= (uint64_t)v10)
          break;
        if (v12 < v10)
          goto LABEL_11;
LABEL_12:
        v13 = *(_QWORD *)(a2 + 48);
        v14 = (_OWORD *)(v13 + 16 * v4);
        v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1)
          *v14 = *v15;
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(a3(0) - 8) + 72);
        v18 = v17 * v4;
        result = v16 + v17 * v4;
        v19 = v17 * v7;
        v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v18 == v19)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v9;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v12 < v10)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v12)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v23 = *v22;
    v24 = (-1 << v4) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_235DDD4C4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_235DE0324();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_235DE0420();
        swift_bridgeObjectRetain();
        sub_235DE0210();
        v9 = sub_235DE0438();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_235DDD698(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_235DDBF18(a2, a3);
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
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        return sub_235DD8AF8(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_235DDDC00();
      goto LABEL_7;
    }
    sub_235DDC3FC(v15, a4 & 1);
    v21 = sub_235DDBF18(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_235DDDA38(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_235DE0414();
  __break(1u);
  return result;
}

uint64_t sub_235DDD7C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_235DDBF18(a2, a3);
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
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for AccountSuggestion() - 8) + 72) * v12;
        return sub_235DDFFD0(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_235DDDDE4();
      goto LABEL_7;
    }
    sub_235DDC6F8(v15, a4 & 1);
    v22 = sub_235DDBF18(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_235DDDAA0(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_235DE0414();
  __break(1u);
  return result;
}

uint64_t sub_235DDD8FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_235DDBF18(a2, a3);
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
        v20 = sub_235DE0078();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_235DDE010();
      goto LABEL_7;
    }
    sub_235DDCA60(v15, a4 & 1);
    v22 = sub_235DDBF18(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_235DDDB28(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_235DE0414();
  __break(1u);
  return result;
}

_OWORD *sub_235DDDA38(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_235DD8AF8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_235DDDAA0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for AccountSuggestion();
  result = sub_235DCE300(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_235DDDB28(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = sub_235DE0078();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

unint64_t sub_235DDDBB8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void *sub_235DDDC00()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812C0);
  v2 = *v0;
  v3 = sub_235DE039C();
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
    sub_235DD3C20(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_235DD8AF8(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

void *sub_235DDDDE4()
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
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for AccountSuggestion();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563812E0);
  v5 = *v0;
  v6 = sub_235DE039C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_235DCE1E0(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_235DCE300((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_235DDE010()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_235DE0078();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C0);
  v31 = v0;
  v4 = *v0;
  v5 = sub_235DE039C();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_235DDE26C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381308);
  v2 = *v0;
  v3 = sub_235DE039C();
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

size_t sub_235DDE420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256381280);
  v3 = *(_QWORD *)(type metadata accessor for AccountSuggestion() - 8);
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
      v9 = sub_235DDF0D0(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_235DD8B08();
      if (v9 == v1)
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

_QWORD *sub_235DDE538(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25429B3C8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_235DDF358((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_235DD8B08();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_235DDE61C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235DD7E2C(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_235DDE684(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_235DDE684(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_235DE03CC();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_235DDED6C(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_235DDEE38((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_235DD721C((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_235DE027C();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_235DE03E4();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_235DE03E4()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_235DD6F70(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_235DD6F70((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_235DDEE38((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_235DE03E4() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_235DE0384();
  __break(1u);
  return result;
}

uint64_t sub_235DDED6C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_235DE03E4(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_235DDEE38(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_235DE03E4() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_235DE03E4() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_235DD7174((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_235DE03C0();
  __break(1u);
  return result;
}

uint64_t sub_235DDF0D0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD *v33;
  int64_t v34;
  uint64_t v35;

  v8 = type metadata accessor for AccountSuggestion();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v30 - v14;
  v35 = a4;
  v18 = *(_QWORD *)(a4 + 64);
  v17 = a4 + 64;
  v16 = v18;
  v19 = -1 << *(_BYTE *)(v17 - 32);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v32 = -1 << *(_BYTE *)(v17 - 32);
  v33 = a1;
  v22 = 0;
  v23 = 0;
  v34 = (unint64_t)(63 - v19) >> 6;
  v31 = v34 - 1;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    sub_235DCE1E0(*(_QWORD *)(v35 + 56) + v29 * v25, (uint64_t)v12);
    sub_235DCE300((uint64_t)v12, (uint64_t)v15);
    result = sub_235DCE300((uint64_t)v15, a2);
    if (v23 == a3)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34)
      goto LABEL_32;
    v27 = *(_QWORD *)(v17 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v17 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v34)
    goto LABEL_32;
  v27 = *(_QWORD *)(v17 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v34)
    {
      v21 = 0;
      v22 = v31;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v17 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_235DDF358(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_235DDF554(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_235DE0288();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_235DD3C5C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_235DDF5EC()
{
  unint64_t result;

  result = qword_2563812F8;
  if (!qword_2563812F8)
  {
    result = MEMORY[0x23B7E1AA0](&protocol conformance descriptor for AccountSuggestion.Source, &type metadata for AccountSuggestion.Source);
    atomic_store(result, (unint64_t *)&qword_2563812F8);
  }
  return result;
}

uint64_t sub_235DDF630()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_235DDF640()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256381300;
  if (!qword_256381300)
  {
    v1 = type metadata accessor for AccountSuggestion();
    result = MEMORY[0x23B7E1AA0](&protocol conformance descriptor for AccountSuggestion, v1);
    atomic_store(result, (unint64_t *)&qword_256381300);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AccountSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a2[7];
    v11 = a3[8];
    v20 = (char *)a1 + v11;
    v12 = (char *)a2 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    v13 = sub_235DE0078();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v20, v12, v13);
    v15 = a3[10];
    *((_BYTE *)v4 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *(_QWORD *)((char *)v4 + v15) = *(_QWORD *)((char *)a2 + v15);
    v16 = a3[12];
    *(_QWORD *)((char *)v4 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    *(_QWORD *)((char *)v4 + v16) = *(_QWORD *)((char *)a2 + v16);
    v17 = a3[14];
    *(_QWORD *)((char *)v4 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
    *((_BYTE *)v4 + v17) = *((_BYTE *)a2 + v17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AccountSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_235DE0078();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AccountSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = a2[7];
  v10 = a3[8];
  v18 = (char *)a1 + v10;
  v11 = (char *)a2 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  v12 = sub_235DE0078();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v18, v11, v12);
  v14 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  v15 = a3[12];
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  v16 = a3[14];
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  *((_BYTE *)a1 + v16) = *((_BYTE *)a2 + v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AccountSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
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
  v6 = a3[8];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_235DE0078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  return a1;
}

_OWORD *initializeWithTake for AccountSuggestion(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[8];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_235DE0078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[12];
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  v14 = a3[14];
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
  return a1;
}

_QWORD *assignWithTake for AccountSuggestion(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

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
  v10 = a3[8];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_235DE0078();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountSuggestion()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235DDFCB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_235DE0078();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AccountSuggestion()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235DDFD3C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_235DE0078();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_235DDFDB0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235DE0078();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccountSuggestion.Source(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AccountSuggestion.Source(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235DDFF40 + 4 * byte_235DE0BD5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235DDFF74 + 4 * byte_235DE0BD0[v4]))();
}

uint64_t sub_235DDFF74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235DDFF7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235DDFF84);
  return result;
}

uint64_t sub_235DDFF90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235DDFF98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235DDFF9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235DDFFA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235DDFFB0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235DDFFB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountSuggestion.Source()
{
  return &type metadata for AccountSuggestion.Source;
}

uint64_t sub_235DDFFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235DE0014(id *a1)
{
  uint64_t v1;

  return sub_235DDB2E8(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_235DE0030()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235DE003C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_235DE0048()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_235DE0054()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_235DE0060()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_235DE006C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_235DE0078()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_235DE0084()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_235DE0090()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_235DE009C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235DE00A8()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_235DE00B4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235DE00C0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235DE00CC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235DE00D8()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_235DE00E4()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_235DE00F0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_235DE00FC()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_235DE0108()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_235DE0114()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_235DE0120()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_235DE012C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_235DE0138()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_235DE0144()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235DE0150()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235DE015C()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_235DE0168()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235DE0174()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_235DE0180()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_235DE018C()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_235DE0198()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_235DE01A4()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_235DE01B0()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_235DE01BC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235DE01C8()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_235DE01D4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235DE01E0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_235DE01EC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235DE01F8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235DE0204()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_235DE0210()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235DE021C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_235DE0228()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_235DE0234()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235DE0240()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235DE024C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_235DE0258()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_235DE0264()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235DE0270()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235DE027C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_235DE0288()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_235DE0294()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235DE02A0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_235DE02AC()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_235DE02B8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_235DE02C4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235DE02D0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235DE02DC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_235DE02E8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235DE02F4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235DE0300()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_235DE030C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235DE0318()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235DE0324()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_235DE0330()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235DE033C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_235DE0348()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_235DE0354()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_235DE0360()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235DE036C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235DE0378()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235DE0384()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235DE0390()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235DE039C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235DE03A8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235DE03B4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235DE03C0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235DE03CC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_235DE03D8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_235DE03E4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235DE03F0()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_235DE03FC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_235DE0408()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_235DE0414()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235DE0420()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235DE042C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235DE0438()
{
  return MEMORY[0x24BEE4328]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

