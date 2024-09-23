uint64_t sub_19AB24584(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v19;
  unint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  __int16 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[7];
  __int16 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v1 = swift_allocObject();
  v2 = sub_19AB221F4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0x69746E45656C6946;
  *(_QWORD *)(v3 + 24) = 0xEA00000000007974;
  *(_QWORD *)(v3 + 32) = 1701603654;
  *(_QWORD *)(v3 + 40) = 0xE400000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 0;
  *(_BYTE *)(v1 + 56) = 1;
  v37 = 258;
  v36[0] = 0x7365697469746E65;
  v36[1] = 0xE800000000000000;
  v36[2] = v1;
  v38 = 0x736D657449;
  v39 = 0xE500000000000000;
  v40 = 0xD00000000000001CLL;
  v41 = 0x800000019ABB3BC0;
  v4 = sub_19AB221F4();
  v30[5] = &type metadata for EntitySchema;
  v30[6] = &off_1E39811C0;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = 0x69746E45656C6946;
  *(_QWORD *)(v5 + 24) = 0xEA00000000007974;
  *(_QWORD *)(v5 + 32) = 1701603654;
  *(_QWORD *)(v5 + 40) = 0xE400000000000000;
  *(_QWORD *)(v5 + 48) = v4;
  *(_BYTE *)(v5 + 56) = 0;
  v31 = 257;
  v30[0] = 0xD000000000000011;
  v30[1] = 0x800000019ABAF440;
  v30[2] = v5;
  v32 = 0x7265646C6F46;
  v33 = 0xE600000000000000;
  v34 = 0xD000000000000024;
  v35 = 0x800000019ABB3BE0;
  v19 = 0;
  v20 = 0xE000000000000000;
  MEMORY[0x19AECE804](13);
  sub_19AA463C8();
  v29 = v6;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  sub_19A9EE838((uint64_t)v36, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v8;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v30, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v27 = 0;
  v28 = 0xE000000000000000;
  v25 = 37;
  v26 = 0xE100000000000000;
  v23 = 9509;
  v24 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v12 = v19;
  v13 = v20;
  v21 = &type metadata for Summary;
  v22 = &off_1E399A1E0;
  v14 = (_QWORD *)swift_allocObject();
  v19 = v14;
  v14[2] = v29;
  v14[3] = v12;
  v14[4] = v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v14[5] = MEMORY[0x1E0DEE9D8];
  v16 = sub_19AAFE518(a1, &v19, v15);
  sub_19A9FEB08((uint64_t)v30, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v36, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v19);
  return v16;
}

uint64_t sub_19AB24A58()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CF0;
  *(_QWORD *)(inited + 32) = &unk_1E397FA88;
  *(_QWORD *)(inited + 40) = &unk_1E397F908;
  *(_QWORD *)(inited + 48) = &unk_1E397F938;
  *(_QWORD *)(inited + 56) = &unk_1E397F968;
  *(_QWORD *)(inited + 64) = &unk_1E397F998;
  *(_QWORD *)(inited + 72) = &unk_1E397F9C8;
  *(_QWORD *)(inited + 80) = &unk_1E397F9F8;
  *(_QWORD *)(inited + 88) = &unk_1E397FA28;
  *(_QWORD *)(inited + 96) = &unk_1E397FA58;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 104)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB24C50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB221F4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0x69746E45656C6946;
  *(_QWORD *)(v3 + 24) = 0xEA00000000007974;
  *(_QWORD *)(v3 + 32) = 1701603654;
  *(_QWORD *)(v3 + 40) = 0xE400000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 0;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x7365697469746E65;
  v25[1] = 0xE800000000000000;
  v25[2] = v1;
  v27 = 0x736D657449;
  v28 = 0xE500000000000000;
  v29 = 0xD000000000000045;
  v30 = 0x800000019ABB3B70;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB24F84()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E397FBA8;
  *(_QWORD *)(inited + 40) = &unk_1E397FAB8;
  *(_QWORD *)(inited + 48) = &unk_1E397FAE8;
  *(_QWORD *)(inited + 56) = &unk_1E397FB18;
  *(_QWORD *)(inited + 64) = &unk_1E397FB48;
  *(_QWORD *)(inited + 72) = &unk_1E397FB78;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB25160()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB2518C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 96))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) >= 5uLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 120);
  switch(*(_BYTE *)(v0 + 200))
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 160);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB25234()
{
  uint64_t v0;

  switch(*(_BYTE *)(v0 + 56))
  {
    case 0:
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_3();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

uint64_t sub_19AB25290()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  switch(*(_BYTE *)(v0 + 72))
  {
    case 0:
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB25304()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for WordProcessorDomain()
{
  return &type metadata for WordProcessorDomain;
}

uint64_t sub_19AB25348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v0 + 32) = 1701667182;
  *(_QWORD *)(v0 + 40) = 0xE400000000000000;
  *(_QWORD *)(v0 + 48) = 3;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_BYTE *)(v0 + 88) = 4;
  *(_QWORD *)(v0 + 96) = 1701667150;
  *(_QWORD *)(v0 + 104) = 0xE400000000000000;
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 6;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_BYTE *)(v1 + 56) = 4;
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  strcpy((char *)(v2 + 32), "creationDate");
  *(_BYTE *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 88) = 3;
  strcpy((char *)(v2 + 96), "Creation Date");
  *(_WORD *)(v2 + 110) = -4864;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 6;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v4 + 32) = 0xD000000000000010;
  *(_QWORD *)(v4 + 40) = 0x800000019ABAF480;
  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 88) = 3;
  *(_QWORD *)(v4 + 96) = 0xD000000000000011;
  *(_QWORD *)(v4 + 104) = 0x800000019ABB0DB0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C30;
  *(_QWORD *)(inited + 32) = v0;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v4;
  v6 = MEMORY[0x1E0DEE9D8];
  v7 = 32;
  while (1)
  {
    v8 = *(_QWORD *)(inited + v7);
    v9 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v6 + 16);
    v11 = v10 + v9;
    if (__OFADD__(v10, v9))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v11 > *(_QWORD *)(v6 + 24) >> 1)
    {
      if (v10 <= v11)
        v13 = v10 + v9;
      else
        v13 = v10;
      sub_19AA462CC(isUniquelyReferenced_nonNull_native, v13, 1, v6);
      v6 = v14;
    }
    if (*(_QWORD *)(v8 + 16))
    {
      v15 = *(_QWORD *)(v6 + 16);
      if ((*(_QWORD *)(v6 + 24) >> 1) - v15 < v9)
        goto LABEL_24;
      v16 = v6 + 80 * v15 + 32;
      if (v8 + 32 < v16 + 80 * v9 && v16 < v8 + 32 + 80 * v9)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v9)
      {
        v18 = *(_QWORD *)(v6 + 16);
        v19 = __OFADD__(v18, v9);
        v20 = v18 + v9;
        if (v19)
          goto LABEL_25;
        *(_QWORD *)(v6 + 16) = v20;
      }
    }
    else if (v9)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v7 += 8;
    if (v7 == 56)
    {
      swift_setDeallocating();
      sub_19AB2DAA8();
      return v6;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB25670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v6;

  v0 = sub_19AB25348();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0xD00000000000001BLL;
  *(_QWORD *)(v1 + 24) = 0x800000019ABAED50;
  *(_QWORD *)(v1 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v1 + 40) = 0xE800000000000000;
  *(_QWORD *)(v1 + 48) = v0;
  *(_BYTE *)(v1 + 56) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 32) = 0x746E656D75636F64;
  *(_QWORD *)(v2 + 40) = 0xE800000000000000;
  *(_QWORD *)(v2 + 72) = &type metadata for EntitySchema;
  *(_QWORD *)(v2 + 80) = &off_1E39811C0;
  *(_BYTE *)(v2 + 88) = 1;
  *(_QWORD *)(v2 + 96) = 0x746E656D75636F44;
  *(_QWORD *)(v2 + 104) = 0xE800000000000000;
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v3 + 32) = 0x65646E4965676170;
  *(_QWORD *)(v3 + 40) = 0xE900000000000078;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_QWORD *)(v3 + 80) = 0;
  *(_BYTE *)(v3 + 88) = 4;
  *(_QWORD *)(v3 + 96) = 0x646E492065676150;
  *(_QWORD *)(v3 + 104) = 0xEA00000000007865;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88CA0;
  *(_QWORD *)(inited + 32) = v2;
  *(_QWORD *)(inited + 40) = v3;
  v6 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47F58();
  swift_bridgeObjectRetain();
  sub_19AA47F58();
  swift_setDeallocating();
  sub_19AB2DAA8();
  return v6;
}

uint64_t sub_19AB25828@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[4];

  v4[3] = &type metadata for AssistantSchema.IntentSchema;
  v4[0] = 0xD000000000000017;
  v4[1] = 0x800000019ABB3D40;
  sub_19A9FEF48((uint64_t)v4, a1);
  v2 = sub_19AB2589C();
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_19AB2589C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
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
  unint64_t v49;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t result;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[24];
  uint64_t v62;
  _BYTE v63[24];
  uint64_t v64;
  _BYTE v65[48];
  _BYTE v66[40];
  _BYTE v67[40];
  _BYTE v68[40];
  __int128 v69;
  __int128 v70;
  _UNKNOWN **v71;
  char v72;
  __int128 v73;
  _QWORD v74[3];
  unint64_t v75;
  unint64_t v76;
  _QWORD v77[2];
  unint64_t v78;
  unint64_t v79;
  char v80;
  _BYTE v81[40];
  uint64_t v82;
  _BYTE v83[40];
  _BYTE v84[48];
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char v90;
  __int128 v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  char v95;
  __int128 v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  char v100;

  *(_QWORD *)&v96 = 0xD00000000000001BLL;
  *((_QWORD *)&v96 + 1) = 0x800000019ABAED50;
  v97 = 0x746E656D75636F44;
  v98 = 0xE800000000000000;
  v99 = sub_19AB25348();
  v100 = 1;
  v0 = sub_19AB4D534(&v96);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v91 = 0xD000000000000023;
  *((_QWORD *)&v91 + 1) = 0x800000019ABAEDD0;
  v92 = 0x6574616C706D6554;
  v93 = 0xE800000000000000;
  v94 = sub_19AA115FC();
  v95 = 1;
  v1 = sub_19AB4D534(&v91);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v86 = 0xD000000000000017;
  *((_QWORD *)&v86 + 1) = 0x800000019ABAED90;
  v87 = 1701273936;
  v88 = 0xE400000000000000;
  v89 = sub_19AB25670();
  v90 = 1;
  v2 = sub_19AB4D534(&v86);
  swift_bridgeObjectRelease();
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v3 = sub_19AB26DB4((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v4 = sub_19AB26F1C();
  v75 = 0xD00000000000001BLL;
  v76 = 0x800000019ABB3D60;
  v77[0] = 0x4420657461657243;
  v77[1] = 0xEF746E656D75636FLL;
  v78 = 0xD00000000000002FLL;
  v79 = 0x800000019ABB3D80;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v5 = 1;
      goto LABEL_7;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v5 = 0;
LABEL_7:
  v80 = v5;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v3;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v4;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v69, v6 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0u;
  memset(v74, 0, sizeof(v74));
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v7 = sub_19AB270F4((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v8 = sub_19AB273F4();
  v75 = 0xD000000000000019;
  v76 = 0x800000019ABB3DB0;
  strcpy((char *)v77, "Open Document");
  HIWORD(v77[1]) = -4864;
  v78 = 0xD000000000000019;
  v79 = 0x800000019ABB3DD0;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  v60 = v1;
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v9 = 1;
      goto LABEL_13;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v9 = 0;
LABEL_13:
  v80 = v9;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v7;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v8;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  v58 = v10;
  sub_19AA19678(&v69, v10 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v11 = sub_19AB275D8((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v12 = sub_19AB278E4();
  v75 = 0xD000000000000017;
  v76 = 0x800000019ABB3DF0;
  strcpy((char *)v77, "Create Page");
  HIDWORD(v77[1]) = -352321536;
  v78 = 0xD000000000000027;
  v79 = 0x800000019ABB3E10;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v13 = 1;
      goto LABEL_19;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v13 = 0;
LABEL_19:
  v80 = v13;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v11;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v12;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_19AB88C20;
  v57 = v14;
  sub_19AA19678(&v69, v14 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0u;
  memset(v74, 0, sizeof(v74));
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v15 = sub_19AB27AD0((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v16 = sub_19AB27DCC();
  v75 = 0xD000000000000015;
  v76 = 0x800000019ABB3E40;
  strcpy((char *)v77, "Open Page");
  WORD1(v77[1]) = 0;
  HIDWORD(v77[1]) = -385875968;
  v78 = 0xD00000000000001CLL;
  v79 = 0x800000019ABB3E60;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v17 = 1;
      goto LABEL_25;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v17 = 0;
LABEL_25:
  v80 = v17;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v15;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v16;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_19AB88C20;
  v56 = v18;
  sub_19AA19678(&v69, v18 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v19 = sub_19AB27FB8((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v20 = sub_19AB283FC();
  v75 = 0xD00000000000001DLL;
  v76 = 0x800000019ABB3E80;
  v77[0] = 0xD000000000000014;
  v77[1] = 0x800000019ABB3EA0;
  v78 = 0xD000000000000017;
  v79 = 0x800000019ABB3EC0;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v21 = 1;
      goto LABEL_31;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v21 = 0;
LABEL_31:
  v80 = v21;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v19;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v20;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_19AB88C20;
  v55 = v22;
  sub_19AA19678(&v69, v22 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v23 = sub_19AB285D4((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v24 = sub_19AB28A20();
  v75 = 0xD00000000000001BLL;
  v76 = 0x800000019ABB3EE0;
  v77[0] = 0xD000000000000011;
  v77[1] = 0x800000019ABB3F00;
  v78 = 0xD000000000000015;
  v79 = 0x800000019ABB3F20;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  v59 = v6;
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v25 = 1;
      goto LABEL_37;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v25 = 0;
LABEL_37:
  v80 = v25;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v23;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v24;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v69, v26 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v27 = sub_19AB28BF8((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v28 = sub_19AB29044();
  v75 = 0xD00000000000001BLL;
  v76 = 0x800000019ABB3F40;
  v77[0] = 0xD000000000000011;
  v77[1] = 0x800000019ABB3F60;
  v78 = 0xD000000000000015;
  v79 = 0x800000019ABB3F80;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v29 = 1;
      goto LABEL_43;
    }
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
  }
  v29 = 0;
LABEL_43:
  v80 = v29;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v27;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v28;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v69, v30 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v31 = sub_19AB29230((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v32 = sub_19AB2967C();
  v75 = 0xD00000000000001BLL;
  v76 = 0x800000019ABB3FA0;
  v77[0] = 0xD000000000000011;
  v77[1] = 0x800000019ABB3FC0;
  v78 = 0xD000000000000015;
  v79 = 0x800000019ABB3FE0;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
LABEL_48:
    v33 = 0;
    goto LABEL_49;
  }
  sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
  if ((v62 | 2) != 2)
  {
    sub_19AA19700((uint64_t)v61);
    sub_19AA19700((uint64_t)v63);
    goto LABEL_48;
  }
  sub_19AA19700((uint64_t)v63);
  v33 = 1;
LABEL_49:
  v80 = v33;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v31;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v32;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v69, v34 + 32);
  sub_19AA19690((uint64_t)&v75);
  v73 = 0uLL;
  v74[0] = 0;
  *(_OWORD *)&v74[1] = xmmword_19AB88C40;
  v71 = 0;
  v69 = 0u;
  v70 = 0u;
  v72 = -1;
  v35 = sub_19AB29860((uint64_t)v68);
  sub_19A9EE838((uint64_t)v68, (uint64_t)v67, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v66, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v69, (uint64_t)v65, (uint64_t *)&unk_1EE3B9EB0);
  v36 = sub_19AB29CB8();
  v75 = 0xD00000000000001ELL;
  v76 = 0x800000019ABB4000;
  v77[0] = 0xD000000000000015;
  v77[1] = 0x800000019ABB4020;
  v78 = 0xD000000000000019;
  v79 = 0x800000019ABB4040;
  sub_19A9EE838((uint64_t)v66, (uint64_t)v63, &qword_1EE3B9EA8);
  if (v64 == 4)
  {
    sub_19A9FEB08((uint64_t)v63, &qword_1EE3B9EA8);
    v37 = 0;
    v39 = v57;
    v38 = v58;
  }
  else
  {
    sub_19AA196C4((uint64_t)v63, (uint64_t)v61);
    v39 = v57;
    v38 = v58;
    if ((v62 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v63);
      v37 = 1;
    }
    else
    {
      sub_19AA19700((uint64_t)v61);
      sub_19AA19700((uint64_t)v63);
      v37 = 0;
    }
  }
  v80 = v37;
  sub_19AA19568((uint64_t)v67, (uint64_t)v81, &qword_1EE3B9EA0);
  v82 = v35;
  sub_19AA19568((uint64_t)v66, (uint64_t)v83, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v65, (uint64_t)v84, (uint64_t *)&unk_1EE3B9EB0);
  v85 = v36;
  sub_19A9FEB08((uint64_t)&v69, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)&v73, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v68, &qword_1EE3B9EA0);
  *((_QWORD *)&v70 + 1) = &type metadata for IntentSchema;
  v71 = &off_1E3981258;
  *(_QWORD *)&v69 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v75, v69 + 16);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v69, v40 + 32);
  sub_19AA19690((uint64_t)&v75);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_19AB95C70;
  *(_QWORD *)(v41 + 32) = v0;
  *(_QWORD *)(v41 + 40) = v60;
  *(_QWORD *)(v41 + 48) = v2;
  *(_QWORD *)(v41 + 56) = v59;
  *(_QWORD *)(v41 + 64) = v38;
  *(_QWORD *)(v41 + 72) = v39;
  *(_QWORD *)(v41 + 80) = v56;
  *(_QWORD *)(v41 + 88) = v55;
  *(_QWORD *)(v41 + 96) = v26;
  *(_QWORD *)(v41 + 104) = v30;
  v42 = 32;
  *(_QWORD *)(v41 + 112) = v34;
  *(_QWORD *)(v41 + 120) = v40;
  v43 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v44 = *(_QWORD *)(v41 + v42);
    v45 = *(_QWORD *)(v44 + 16);
    v46 = *(_QWORD *)(v43 + 16);
    if (__OFADD__(v46, v45))
      break;
    swift_bridgeObjectRetain();
    if (!swift_isUniquelyReferenced_nonNull_native() || v46 + v45 > *(_QWORD *)(v43 + 24) >> 1)
    {
      sub_19AA46398();
      v43 = v47;
    }
    if (*(_QWORD *)(v44 + 16))
    {
      v48 = *(_QWORD *)(v43 + 16);
      if ((*(_QWORD *)(v43 + 24) >> 1) - v48 < v45)
        goto LABEL_74;
      v49 = v43 + 40 * v48 + 32;
      if (v44 + 32 < v49 + 40 * v45 && v49 < v44 + 32 + 40 * v45)
        goto LABEL_76;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC8);
      swift_arrayInitWithCopy();
      if (v45)
      {
        v51 = *(_QWORD *)(v43 + 16);
        v52 = __OFADD__(v51, v45);
        v53 = v51 + v45;
        if (v52)
          goto LABEL_75;
        *(_QWORD *)(v43 + 16) = v53;
      }
    }
    else if (v45)
    {
      goto LABEL_73;
    }
    swift_bridgeObjectRelease();
    v42 += 8;
    if (v42 == 128)
    {
      swift_setDeallocating();
      sub_19AB2DAC0();
      return v43;
    }
  }
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB26DB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = swift_allocObject();
  v3 = sub_19AA115FC();
  *(_QWORD *)(v2 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v2 + 48) = &off_1E39811C0;
  v4 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)(v4 + 16) = 0xD000000000000023;
  *(_QWORD *)(v4 + 24) = 0x800000019ABAEDD0;
  *(_QWORD *)(v4 + 32) = 0x6574616C706D6554;
  *(_QWORD *)(v4 + 40) = 0xE800000000000000;
  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 56) = 1;
  *(_BYTE *)(v2 + 56) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v5 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v6 + 16) = 0x6574616C706D6574;
  *(_QWORD *)(v6 + 24) = 0xE800000000000000;
  *(_QWORD *)(v6 + 32) = v2;
  *(_BYTE *)(v6 + 72) = 3;
  *(_BYTE *)(v6 + 73) = 1;
  *(_QWORD *)(v6 + 80) = 0x6574616C706D6554;
  *(_QWORD *)(v6 + 88) = 0xE800000000000000;
  *(_QWORD *)(v6 + 96) = 0xD00000000000002ALL;
  *(_QWORD *)(v6 + 104) = 0x800000019ABB4150;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v5;
}

uint64_t sub_19AB26F1C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E3993CA0;
  *(_QWORD *)(inited + 40) = &unk_1E3993BB0;
  *(_QWORD *)(inited + 48) = &unk_1E3993BE0;
  *(_QWORD *)(inited + 56) = &unk_1E3993C10;
  *(_QWORD *)(inited + 64) = &unk_1E3993C40;
  *(_QWORD *)(inited + 72) = &unk_1E3993C70;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB270F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB25348();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD00000000000001BLL;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED50;
  *(_QWORD *)(v2 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v2 + 40) = 0xE800000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x746E656D75636F44;
  v27 = 0xE800000000000000;
  v28 = 0xD000000000000010;
  v29 = 0x800000019ABB4130;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB273F4()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C80;
  *(_QWORD *)(inited + 32) = &unk_1E3994300;
  *(_QWORD *)(inited + 40) = &unk_1E39941E0;
  *(_QWORD *)(inited + 48) = &unk_1E3994210;
  *(_QWORD *)(inited + 56) = &unk_1E3994240;
  *(_QWORD *)(inited + 64) = &unk_1E3994270;
  *(_QWORD *)(inited + 72) = &unk_1E39942A0;
  *(_QWORD *)(inited + 80) = &unk_1E39942D0;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 88)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB275D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB25348();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD00000000000001BLL;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED50;
  *(_QWORD *)(v2 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v2 + 40) = 0xE800000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x746E656D75636F44;
  v27 = 0xE800000000000000;
  v28 = 0xD000000000000022;
  v29 = 0x800000019ABB4100;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](17);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB278E4()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C70;
  *(_QWORD *)(inited + 32) = &unk_1E3994480;
  *(_QWORD *)(inited + 40) = &unk_1E3994330;
  *(_QWORD *)(inited + 48) = &unk_1E3994360;
  *(_QWORD *)(inited + 56) = &unk_1E3994390;
  *(_QWORD *)(inited + 64) = &unk_1E39943C0;
  *(_QWORD *)(inited + 72) = &unk_1E39943F0;
  *(_QWORD *)(inited + 80) = &unk_1E3994420;
  *(_QWORD *)(inited + 88) = &unk_1E3994450;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 96)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB27AD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB25670();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000017;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED90;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 1701273936;
  v27 = 0xE400000000000000;
  strcpy((char *)v28, "Page to open");
  HIBYTE(v28[6]) = 0;
  v28[7] = -5120;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB27DCC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C70;
  *(_QWORD *)(inited + 32) = &unk_1E3994600;
  *(_QWORD *)(inited + 40) = &unk_1E39944B0;
  *(_QWORD *)(inited + 48) = &unk_1E39944E0;
  *(_QWORD *)(inited + 56) = &unk_1E3994510;
  *(_QWORD *)(inited + 64) = &unk_1E3994540;
  *(_QWORD *)(inited + 72) = &unk_1E3994570;
  *(_QWORD *)(inited + 80) = &unk_1E39945A0;
  *(_QWORD *)(inited + 88) = &unk_1E39945D0;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 96)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB27FB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v1 = sub_19AB25670();
  v35[5] = &type metadata for EntitySchema;
  v35[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v35[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000017;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED90;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v36 = 257;
  v35[0] = 0x746567726174;
  v35[1] = 0xE600000000000000;
  v37 = 1701273936;
  v38 = 0xE400000000000000;
  v39 = 0xD00000000000001ALL;
  v40 = 0x800000019ABB40E0;
  v27[1] = 0xE400000000000000;
  v27[2] = 3;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 1954047348;
  v31 = 1954047316;
  v32 = 0xE400000000000000;
  v33 = 0x206F742074786554;
  v34 = 0xEB00000000646461;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v27, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v35, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB283FC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E3994720;
  *(_QWORD *)(inited + 40) = &unk_1E3994630;
  *(_QWORD *)(inited + 48) = &unk_1E3994660;
  *(_QWORD *)(inited + 56) = &unk_1E3994690;
  *(_QWORD *)(inited + 64) = &unk_1E39946C0;
  *(_QWORD *)(inited + 72) = &unk_1E39946F0;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB285D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  _WORD v33[8];
  _QWORD v34[7];
  __int16 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v1 = sub_19AB25670();
  v34[5] = &type metadata for EntitySchema;
  v34[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v34[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000017;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED90;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v35 = 257;
  v34[0] = 0x746567726174;
  v34[1] = 0xE600000000000000;
  v36 = 1701273936;
  v37 = 0xE400000000000000;
  v38 = 0xD000000000000018;
  v39 = 0x800000019ABB40C0;
  v27[2] = 8;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 0x6F65646976;
  v27[1] = 0xE500000000000000;
  v31 = 0x6F65646956;
  v32 = 0xE500000000000000;
  strcpy((char *)v33, "Video to add");
  HIBYTE(v33[6]) = 0;
  v33[7] = -5120;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v27, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v34, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v34, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB28A20()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E3993DC0;
  *(_QWORD *)(inited + 40) = &unk_1E3993CD0;
  *(_QWORD *)(inited + 48) = &unk_1E3993D00;
  *(_QWORD *)(inited + 56) = &unk_1E3993D30;
  *(_QWORD *)(inited + 64) = &unk_1E3993D60;
  *(_QWORD *)(inited + 72) = &unk_1E3993D90;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB28BF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  _WORD v33[8];
  _QWORD v34[7];
  __int16 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v1 = sub_19AB25670();
  v34[5] = &type metadata for EntitySchema;
  v34[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v34[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000017;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED90;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v35 = 257;
  v34[0] = 0x746567726174;
  v34[1] = 0xE600000000000000;
  v36 = 1701273936;
  v37 = 0xE400000000000000;
  v38 = 0xD000000000000018;
  v39 = 0x800000019ABB40A0;
  v27[2] = 8;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 0x6567616D69;
  v27[1] = 0xE500000000000000;
  v31 = 0x6567616D49;
  v32 = 0xE500000000000000;
  strcpy((char *)v33, "Image to add");
  HIBYTE(v33[6]) = 0;
  v33[7] = -5120;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v27, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v34, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v34, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB29044()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C70;
  *(_QWORD *)(inited + 32) = &unk_1E3993F40;
  *(_QWORD *)(inited + 40) = &unk_1E3993DF0;
  *(_QWORD *)(inited + 48) = &unk_1E3993E20;
  *(_QWORD *)(inited + 56) = &unk_1E3993E50;
  *(_QWORD *)(inited + 64) = &unk_1E3993E80;
  *(_QWORD *)(inited + 72) = &unk_1E3993EB0;
  *(_QWORD *)(inited + 80) = &unk_1E3993EE0;
  *(_QWORD *)(inited + 88) = &unk_1E3993F10;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 96)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB29230(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  _WORD v33[8];
  _QWORD v34[7];
  __int16 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v1 = sub_19AB25670();
  v34[5] = &type metadata for EntitySchema;
  v34[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v34[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000017;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED90;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v35 = 257;
  v34[0] = 0x746567726174;
  v34[1] = 0xE600000000000000;
  v36 = 1701273936;
  v37 = 0xE400000000000000;
  v38 = 0xD000000000000018;
  v39 = 0x800000019ABB4080;
  v27[2] = 8;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 0x6F69647561;
  v27[1] = 0xE500000000000000;
  v31 = 0x6F69647541;
  v32 = 0xE500000000000000;
  strcpy((char *)v33, "Audio to add");
  HIBYTE(v33[6]) = 0;
  v33[7] = -5120;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v27, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v34, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v34, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB2967C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C80;
  *(_QWORD *)(inited + 32) = &unk_1E3994090;
  *(_QWORD *)(inited + 40) = &unk_1E3993F70;
  *(_QWORD *)(inited + 48) = &unk_1E3993FA0;
  *(_QWORD *)(inited + 56) = &unk_1E3993FD0;
  *(_QWORD *)(inited + 64) = &unk_1E3994000;
  *(_QWORD *)(inited + 72) = &unk_1E3994030;
  *(_QWORD *)(inited + 80) = &unk_1E3994060;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 88)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB29860(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v1 = sub_19AB25670();
  v35[5] = &type metadata for EntitySchema;
  v35[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v35[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000017;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAED90;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v36 = 257;
  v35[0] = 0x746567726174;
  v35[1] = 0xE600000000000000;
  v37 = 1701273936;
  v38 = 0xE400000000000000;
  v39 = 0xD00000000000001CLL;
  v40 = 0x800000019ABB4060;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 7107189;
  v27[1] = 0xE300000000000000;
  v27[2] = 7;
  v31 = 5001813;
  v32 = 0xE300000000000000;
  v33 = 0xD000000000000010;
  v34 = 0x800000019ABAF970;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](23);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v27, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v35, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB29CB8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E39941B0;
  *(_QWORD *)(inited + 40) = &unk_1E39940C0;
  *(_QWORD *)(inited + 48) = &unk_1E39940F0;
  *(_QWORD *)(inited + 56) = &unk_1E3994120;
  *(_QWORD *)(inited + 64) = &unk_1E3994150;
  *(_QWORD *)(inited + 72) = &unk_1E3994180;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB29E94()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 96))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) >= 5uLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 120);
  switch(*(_BYTE *)(v0 + 200))
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 160);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB29F3C()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB29F68()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  switch(*(_BYTE *)(v0 + 72))
  {
    case 0:
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB29FDC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

uint64_t sub_19AB2A010()
{
  uint64_t v0;

  switch(*(_BYTE *)(v0 + 56))
  {
    case 0:
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_3();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

void sub_19AB2A06C()
{
  sub_19AB2A48C();
}

void sub_19AB2A078()
{
  OUTLINED_FUNCTION_317();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A09C()
{
  sub_19AB2A610();
}

void sub_19AB2A0A8()
{
  OUTLINED_FUNCTION_317();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A0D0(uint64_t a1)
{
  sub_19AB2A0F4(a1, (void (*)(uint64_t))sub_19AB040E4);
}

void sub_19AB2A0DC()
{
  sub_19AB2A560();
}

void sub_19AB2A0E8(uint64_t a1)
{
  sub_19AB2A0F4(a1, (void (*)(uint64_t))sub_19AB0E4B8);
}

void sub_19AB2A0F4(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_317();
  a2(a1);
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A13C()
{
  OUTLINED_FUNCTION_317();
  OUTLINED_FUNCTION_456();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

uint64_t sub_19AB2A164()
{
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_12_6();
  OUTLINED_FUNCTION_29_2();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19AB2A188()
{
  return sub_19AB82C98();
}

uint64_t sub_19AB2A1AC()
{
  return sub_19AB826EC();
}

uint64_t sub_19AB2A1CC()
{
  OUTLINED_FUNCTION_5_10();
  return OUTLINED_FUNCTION_295();
}

void sub_19AB2A220()
{
  OUTLINED_FUNCTION_17_5();
  __asm { BR              X10 }
}

uint64_t sub_19AB2A248()
{
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_5_10();
  return OUTLINED_FUNCTION_295();
}

void sub_19AB2A2B4()
{
  OUTLINED_FUNCTION_17_5();
  __asm { BR              X10 }
}

uint64_t sub_19AB2A2DC()
{
  OUTLINED_FUNCTION_24_3();
  OUTLINED_FUNCTION_5_10();
  return OUTLINED_FUNCTION_295();
}

void sub_19AB2A324(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_19AB2A35C()
{
  sub_19AB826EC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19AB2A3D8(uint64_t a1, char a2)
{
  if (!a2)
    OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_5_10();
  return OUTLINED_FUNCTION_295();
}

uint64_t sub_19AB2A43C()
{
  sub_19AB826EC();
  return swift_bridgeObjectRelease();
}

void sub_19AB2A468()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A48C()
{
  char v0;

  OUTLINED_FUNCTION_7_9();
  if (!v0)
    OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A500(uint64_t a1, uint64_t a2)
{
  sub_19AB2A518(a1, a2, (void (*)(uint64_t))sub_19AB040E4);
}

void sub_19AB2A50C(uint64_t a1, uint64_t a2)
{
  sub_19AB2A518(a1, a2, (void (*)(uint64_t))sub_19AB0E4B8);
}

void sub_19AB2A518(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_316();
  a3(a2);
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A560()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A5C4()
{
  OUTLINED_FUNCTION_316();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A5E8()
{
  OUTLINED_FUNCTION_316();
  OUTLINED_FUNCTION_456();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

void sub_19AB2A610()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_16_3();
  OUTLINED_FUNCTION_12_6();
  OUTLINED_FUNCTION_29_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_132();
}

uint64_t sub_19AB2A64C(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  char v8;

  v3 = type metadata accessor for LNEnumMetadata.CodableWrapper(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2;
  LNEnumMetadata.wrapper.getter();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BB430);
  sub_19AB04820(&qword_1EE3BB450, &qword_1EE3BB430);
  sub_19AB2B3B0(&qword_1EE3BA4B8);
  sub_19AB82BFC();
  return sub_19AB2B374((uint64_t)v5);
}

char *sub_19AB2A750(char a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  uint64_t vars0;
  uint64_t vars8;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LNEnumMetadata.CodableWrapper(0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v20 - v10;
  HIBYTE(v21) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BB420);
  sub_19AB04820(&qword_1EE3BB458, &qword_1EE3BB420);
  sub_19AB2B3B0((uint64_t *)&unk_1EDBA2858);
  sub_19AB82BF0();
  if (!v1)
  {
    sub_19AB2B3E8();
    sub_19AB2B424((uint64_t)v11, (uint64_t)v9);
    v12 = sub_19AB824B8();
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v12);
    LNEnumMetadata.init(from:bundleURL:effectiveBundleIdentifier:)((uint64_t)v9, (uint64_t)v5, 0, v13, v14, v15, v16, v17, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, vars0,
      vars8);
    v5 = v18;
    sub_19AB2B374((uint64_t)v11);
  }
  return v5;
}

uint64_t AssistantPrebuiltEnum.init(kind:domain:version:metadata:conformanceType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  char v9;

  v9 = *a8;
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 56) = v9;
  return result;
}

void AssistantPrebuiltEnum.kind.getter()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_0();
}

void AssistantPrebuiltEnum.domain.getter()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_0();
}

void AssistantPrebuiltEnum.domain.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_12();
}

uint64_t (*AssistantPrebuiltEnum.domain.modify())(_QWORD)
{
  return nullsub_1;
}

void AssistantPrebuiltEnum.version.getter()
{
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_0();
}

void AssistantPrebuiltEnum.version.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  OUTLINED_FUNCTION_12();
}

uint64_t (*AssistantPrebuiltEnum.version.modify())(_QWORD)
{
  return nullsub_1;
}

id AssistantPrebuiltEnum.metadata.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 48);
}

void AssistantPrebuiltEnum.conformanceType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 56);
}

void AssistantPrebuiltEnum.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BB420);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_19AB2ACA4();
  sub_19AB82CE0();
  if (v2)
  {
    OUTLINED_FUNCTION_263();
    OUTLINED_FUNCTION_115();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_3_8();
    v8 = v7;
    v18 = v6;
    swift_bridgeObjectRetain();
    v9 = sub_19AB82A94();
    v11 = v10;
    v17 = v9;
    swift_bridgeObjectRetain();
    v16 = OUTLINED_FUNCTION_3_8();
    v19 = v12;
    swift_bridgeObjectRetain();
    v13 = sub_19AB2A750(3);
    v15 = v8;
    sub_19AB03E70();
    v14 = v13;
    sub_19AB82AB8();
    OUTLINED_FUNCTION_78();
    *(_QWORD *)a2 = v18;
    *(_QWORD *)(a2 + 8) = v15;
    *(_QWORD *)(a2 + 16) = v17;
    *(_QWORD *)(a2 + 24) = v11;
    *(_QWORD *)(a2 + 32) = v16;
    *(_QWORD *)(a2 + 40) = v19;
    *(_QWORD *)(a2 + 48) = v14;
    *(_BYTE *)(a2 + 56) = (v20 == 2) | v20 & 1;
    OUTLINED_FUNCTION_263();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_115();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1();
}

unint64_t sub_19AB2ACA4()
{
  unint64_t result;

  result = qword_1EE3BB428;
  if (!qword_1EE3BB428)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB975C4, &type metadata for AssistantPrebuiltEnum.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3BB428);
  }
  return result;
}

void AssistantPrebuiltEnum.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD v13[2];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BB430);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v18 = *(_QWORD *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v16 = v7;
  v17 = v8;
  v15 = *(_QWORD *)(v1 + 48);
  v14 = *(unsigned __int8 *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_19AB2ACA4();
  sub_19AB82CEC();
  v24 = 0;
  v9 = v19;
  sub_19AB82B60();
  if (!v9)
  {
    v10 = v15;
    v11 = v16;
    v12 = v14;
    v23 = 2;
    OUTLINED_FUNCTION_4_8();
    sub_19AB2A64C(v10, 3);
    v22 = v12;
    v21 = 4;
    sub_19AB0405C();
    sub_19AB82B9C();
    if (v11)
    {
      v20 = 1;
      OUTLINED_FUNCTION_4_8();
    }
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_19AB2AE90()
{
  unint64_t v0;

  v0 = sub_19AB82A70();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_19AB2AEDC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_19AB2AF08 + 4 * byte_19AB97432[a1]))(1684957547, 0xE400000000000000);
}

uint64_t sub_19AB2AF08()
{
  return 0x6E69616D6F64;
}

uint64_t sub_19AB2AF1C()
{
  return 0x6E6F6973726576;
}

uint64_t sub_19AB2AF34()
{
  return 0x617461646174656DLL;
}

uint64_t sub_19AB2AF4C()
{
  return 0x616D726F666E6F63;
}

uint64_t sub_19AB2AF70(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_19AB2AF9C + 4 * byte_19AB97437[a1]))(1684957547, 0xE400000000000000);
}

uint64_t sub_19AB2AF9C()
{
  return 0x6E69616D6F64;
}

uint64_t sub_19AB2AFB0()
{
  return 0x6E6F6973726576;
}

uint64_t sub_19AB2AFC8()
{
  return 0x617461646174656DLL;
}

uint64_t sub_19AB2AFE0()
{
  return 0x616D726F666E6F63;
}

void sub_19AB2B004()
{
  sub_19AB4DBEC();
}

void sub_19AB2B010()
{
  unsigned __int8 *v0;

  sub_19AB2A0F4(*v0, (void (*)(uint64_t))sub_19AB2AEDC);
}

void sub_19AB2B030(uint64_t a1)
{
  char *v1;

  sub_19AB2A324(a1, *v1);
}

void sub_19AB2B038(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_19AB2A518(a1, *v1, (void (*)(uint64_t))sub_19AB2AEDC);
}

uint64_t sub_19AB2B058@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_19AB2AE90();
  *a1 = result;
  return result;
}

uint64_t sub_19AB2B084@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_19AB2AEDC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_19AB2B0AC()
{
  unsigned __int8 *v0;

  return sub_19AB2AF70(*v0);
}

uint64_t sub_19AB2B0B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_19AB2AED8();
  *a1 = result;
  return result;
}

uint64_t sub_19AB2B0D8()
{
  sub_19AB2ACA4();
  return sub_19AB82CF8();
}

uint64_t sub_19AB2B100()
{
  sub_19AB2ACA4();
  return sub_19AB82D04();
}

void sub_19AB2B128(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  AssistantPrebuiltEnum.init(from:)(a1, a2);
}

void sub_19AB2B13C(_QWORD *a1)
{
  AssistantPrebuiltEnum.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for AssistantPrebuiltEnum()
{
  return &type metadata for AssistantPrebuiltEnum;
}

uint64_t getEnumTagSinglePayload for AssistantPrebuiltEnum.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AssistantPrebuiltEnum.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19AB2B234 + 4 * byte_19AB97441[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_19AB2B268 + 4 * byte_19AB9743C[v4]))();
}

uint64_t sub_19AB2B268(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19AB2B270(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19AB2B278);
  return result;
}

uint64_t sub_19AB2B284(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19AB2B28CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_19AB2B290(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19AB2B298(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AssistantPrebuiltEnum.CodingKeys()
{
  return &type metadata for AssistantPrebuiltEnum.CodingKeys;
}

unint64_t sub_19AB2B2B8()
{
  unint64_t result;

  result = qword_1EE3BB438;
  if (!qword_1EE3BB438)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB9759C, &type metadata for AssistantPrebuiltEnum.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3BB438);
  }
  return result;
}

unint64_t sub_19AB2B2F8()
{
  unint64_t result;

  result = qword_1EE3BB440;
  if (!qword_1EE3BB440)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB974D4, &type metadata for AssistantPrebuiltEnum.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3BB440);
  }
  return result;
}

unint64_t sub_19AB2B338()
{
  unint64_t result;

  result = qword_1EE3BB448;
  if (!qword_1EE3BB448)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB974FC, &type metadata for AssistantPrebuiltEnum.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE3BB448);
  }
  return result;
}

uint64_t sub_19AB2B374(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LNEnumMetadata.CodableWrapper(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19AB2B3B0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    type metadata accessor for LNEnumMetadata.CodableWrapper(255);
    OUTLINED_FUNCTION_7_0();
  }
  return result;
}

unint64_t sub_19AB2B3E8()
{
  unint64_t result;

  result = qword_1EDBA3308;
  if (!qword_1EDBA3308)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDBA3308);
  }
  return result;
}

uint64_t sub_19AB2B424(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LNEnumMetadata.CodableWrapper(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return sub_19AB2A43C();
}

uint64_t AssistantSchema.EntitySchema.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t AssistantSchema.init<A>(_:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_dynamicCast();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_dynamicCast();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_dynamicCast();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

ValueMetadata *type metadata accessor for AssistantSchema.EntitySchema()
{
  return &type metadata for AssistantSchema.EntitySchema;
}

uint64_t AssistantSchema.EnumSchema.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssistantSchema.EnumSchema()
{
  return &type metadata for AssistantSchema.EnumSchema;
}

uint64_t AssistantSchema.IntentSchema.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

ValueMetadata *type metadata accessor for AssistantSchema.IntentSchema()
{
  return &type metadata for AssistantSchema.IntentSchema;
}

id sub_19AB2B5AC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_19AB82548();
  v1 = (void *)sub_19AB827D0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSupportedContentTypes_, v1);

  return v2;
}

uint64_t sub_19AB2B620()
{
  uint64_t inited;
  __CFString *v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BB460);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = CFSTR("com.apple.appintents.entity.PersistentFileIdentifiable");
  sub_19AB2B6D0();
  v1 = CFSTR("com.apple.appintents.entity.PersistentFileIdentifiable");
  *(_QWORD *)(inited + 40) = sub_19AB2B5AC();
  type metadata accessor for LNSystemEntityProtocolIdentifier(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA3870);
  sub_19AB2B70C();
  return sub_19AB82590();
}

unint64_t sub_19AB2B6D0()
{
  unint64_t result;

  result = qword_1EE3B98F0;
  if (!qword_1EE3B98F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE3B98F0);
  }
  return result;
}

unint64_t sub_19AB2B70C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDBA2DC0;
  if (!qword_1EDBA2DC0)
  {
    type metadata accessor for LNSystemEntityProtocolIdentifier(255);
    result = MEMORY[0x19AECF4B8](&unk_19AB89CF8, v1);
    atomic_store(result, (unint64_t *)&qword_1EDBA2DC0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EntitySystemProtocol(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_19AB2B78C + 4 * asc_19AB97680[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_19AB2B7AC + 4 * byte_19AB97685[v4]))();
}

_BYTE *sub_19AB2B78C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_19AB2B7AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_19AB2B7B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_19AB2B7BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_19AB2B7C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_19AB2B7CC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for EntitySystemProtocol()
{
  return &type metadata for EntitySystemProtocol;
}

unint64_t sub_19AB2B7EC()
{
  unint64_t result;

  result = qword_1EE3BB470;
  if (!qword_1EE3BB470)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB976F8, &type metadata for EntitySystemProtocol);
    atomic_store(result, (unint64_t *)&qword_1EE3BB470);
  }
  return result;
}

uint64_t sub_19AB2B828()
{
  sub_19AB82C8C();
  sub_19AB82C98();
  return sub_19AB82CBC();
}

uint64_t LNActionMetadata._mangledTypeNameForAppIntentsOnly.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;

  v1 = v0;
  v2 = objc_msgSend(v1, sel_mangledTypeName);
  v3 = sub_19AB82674();

  return v3;
}

void sub_19AB2B8C8()
{
  sub_19AB2A13C();
}

uint64_t sub_19AB2B8D0()
{
  return sub_19AB2A188();
}

void sub_19AB2B8D8()
{
  sub_19AB2A5E8();
}

uint64_t LNActionMetadata._iconSystemImageNameForAppIntentsOnly.getter()
{
  void *v0;

  return sub_19AB2B8E8(v0);
}

uint64_t sub_19AB2B8E8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_iconSystemImageName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_19AB82674();

  return v3;
}

unint64_t sub_19AB2B94C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE3B9E10;
  if (!qword_1EE3B9E10)
  {
    type metadata accessor for LNQueryCapabilities(255);
    result = MEMORY[0x19AECF4B8](&unk_19AB8A0E0, v1);
    atomic_store(result, (unint64_t *)&qword_1EE3B9E10);
  }
  return result;
}

uint64_t LNStaticDeferredLocalizedString._dictionaryRepresentation()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t result;
  id v14;
  void *v15;
  uint64_t v16;

  v2 = OUTLINED_FUNCTION_20_4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_13();
  v4 = objc_msgSend(v0, sel_localizedStringResource);
  if (v4)
  {
    v5 = v4;
    OUTLINED_FUNCTION_21_2();
    v6 = v5;
    sub_19AB823EC();
    sub_19AB82344();
    OUTLINED_FUNCTION_29_0();
    sub_19AB82338();
    sub_19A9E6BE8(&qword_1EE3B9318, MEMORY[0x1E0CAFA08]);
    v7 = sub_19AB8232C();
    v9 = v8;
    swift_release();
    objc_opt_self();
    sub_19AA4BB04(v7, v9);
    v10 = (void *)sub_19AB824D0();
    v11 = OUTLINED_FUNCTION_12_7((uint64_t)v10, sel_JSONObjectWithData_options_error_);

    if (v11)
    {
      v12 = 0;
      sub_19AB828E4();
      OUTLINED_FUNCTION_6_10();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA1838);
      if ((OUTLINED_FUNCTION_16_4() & 1) != 0)
      {
        OUTLINED_FUNCTION_6_10();

        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
        return v16;
      }
    }
    else
    {
      v14 = 0;
      v15 = (void *)sub_19AB823E0();

      swift_willThrow();
      OUTLINED_FUNCTION_6_10();

    }
  }
  OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_17_6();
  result = OUTLINED_FUNCTION_0_15();
  __break(1u);
  return result;
}

void __swiftcall LNStaticDeferredLocalizedString.init(localizedStringResourceJSON:)(LNStaticDeferredLocalizedString *__return_ptr retstr, Swift::String localizedStringResourceJSON)
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
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA36A0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_2_2();
  v6 = v5 - v4;
  v17 = OUTLINED_FUNCTION_20_4();
  v7 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_322();
  v8 = sub_19AB826A4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_2_2();
  v12 = v11 - v10;
  sub_19AB82698();
  sub_19AB82680();
  v14 = v13;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  if (v14 >> 60 == 15)
    goto LABEL_5;
  sub_19AB822FC();
  OUTLINED_FUNCTION_29_0();
  sub_19AB822F0();
  sub_19A9E6BE8(&qword_1EDBA36B0, MEMORY[0x1E0CAFA18]);
  sub_19AB822E4();
  OUTLINED_FUNCTION_299();
  OUTLINED_FUNCTION_14_1(v6, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, v6, v17);
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_21_2();
  if ((OUTLINED_FUNCTION_16_4() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_11();
    OUTLINED_FUNCTION_10_8();
LABEL_5:
    v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v16 = (void *)sub_19AB82650();
    objc_msgSend(v15, sel_initWithKey_defaultValue_table_bundleURL_, v16, 0, 0, 0);

    goto LABEL_6;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithLocalizedStringResource_, v18);
  OUTLINED_FUNCTION_3_11();

  OUTLINED_FUNCTION_10_8();
LABEL_6:
  OUTLINED_FUNCTION_38();
}

void __swiftcall LNStaticDeferredLocalizedString.init(dictionary:)(LNStaticDeferredLocalizedString *__return_ptr retstr, Swift::OpaquePointer dictionary)
{
  id v2;
  void *v3;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_19AB82578();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel__initWithDictionary_, v3);

}

void LNStaticDeferredLocalizedString.init(dictionary:)()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;

  v1 = v0;
  v20 = *MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA36A0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_2_2();
  v5 = v4 - v3;
  v6 = OUTLINED_FUNCTION_20_4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_opt_self();
  v10 = (void *)sub_19AB82578();
  v11 = swift_bridgeObjectRelease();
  v19 = 0;
  v12 = OUTLINED_FUNCTION_12_7(v11, sel_dataWithJSONObject_options_error_);

  v13 = v19;
  if (v12)
  {
    sub_19AB824DC();

    sub_19AB822FC();
    OUTLINED_FUNCTION_29_0();
    sub_19AB822F0();
    sub_19A9E6BE8(&qword_1EDBA36B0, MEMORY[0x1E0CAFA18]);
    sub_19AB822E4();
    OUTLINED_FUNCTION_299();
    OUTLINED_FUNCTION_19_1(v5, 0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v9, v5, v6);
    OUTLINED_FUNCTION_23_3();
    OUTLINED_FUNCTION_21_2();
    if ((OUTLINED_FUNCTION_16_4() & 1) != 0)
    {
      v14 = v18;
      objc_msgSend(v1, sel_initWithLocalizedStringResource_, v18);
      OUTLINED_FUNCTION_4_11();

      OUTLINED_FUNCTION_14_5();
      OUTLINED_FUNCTION_38();
      return;
    }
    OUTLINED_FUNCTION_4_11();
    OUTLINED_FUNCTION_14_5();
  }
  else
  {
    v15 = v13;
    v16 = (void *)sub_19AB823E0();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_11_7();
  v17 = 58;
  OUTLINED_FUNCTION_17_6();
  OUTLINED_FUNCTION_0_15();
  __break(1u);
}

uint64_t sub_19AB2C1F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA36A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return swift_dynamicCast();
}

unint64_t OUTLINED_FUNCTION_21_2()
{
  return sub_19A9E6BAC();
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return sub_19AB823F8();
}

uint64_t sub_19AB2C250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  char *v17;
  char *v19;
  _QWORD v20[5];

  sub_19A9F0E18(a1, v20);
  v5 = v20[0];
  v6 = v20[1];
  v7 = v20[3];
  v8 = v20[4];
  v9 = (unint64_t)(v20[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  while (1)
  {
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v7 << 6);
      goto LABEL_20;
    }
    v13 = v7 + 1;
    if (__OFADD__(v7, 1))
      break;
    if (v13 >= v9)
      goto LABEL_26;
    v14 = *(_QWORD *)(v6 + 8 * v13);
    v15 = v7 + 1;
    if (!v14)
    {
      v15 = v7 + 2;
      if (v7 + 2 >= v9)
        goto LABEL_26;
      v14 = *(_QWORD *)(v6 + 8 * v15);
      if (!v14)
      {
        v15 = v7 + 3;
        if (v7 + 3 >= v9)
          goto LABEL_26;
        v14 = *(_QWORD *)(v6 + 8 * v15);
        if (!v14)
        {
          v15 = v7 + 4;
          if (v7 + 4 >= v9)
            goto LABEL_26;
          v14 = *(_QWORD *)(v6 + 8 * v15);
          if (!v14)
          {
            v15 = v7 + 5;
            if (v7 + 5 >= v9)
              goto LABEL_26;
            v14 = *(_QWORD *)(v6 + 8 * v15);
            if (!v14)
            {
              v16 = v7 + 6;
              while (v16 < v9)
              {
                v14 = *(_QWORD *)(v6 + 8 * v16++);
                if (v14)
                {
                  v15 = v16 - 1;
                  goto LABEL_19;
                }
              }
LABEL_26:
              swift_bridgeObjectRelease();
              swift_release();
              return 0;
            }
          }
        }
      }
    }
LABEL_19:
    v8 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v7 = v15;
LABEL_20:
    v17 = *(char **)(*(_QWORD *)(v5 + 56) + 8 * v12);
    if (*(_QWORD *)&v17[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier] != a2
      || *(_QWORD *)&v17[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier + 8] != a3)
    {
      result = sub_19AB82BE4();
      if ((result & 1) == 0)
        continue;
    }
    v19 = v17;
    swift_bridgeObjectRelease();
    swift_release();
    return (uint64_t)v17;
  }
  __break(1u);
  return result;
}

uint64_t FrameworkRecord.bundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FrameworkRecord.frameworkURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19AB2C444(&OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_frameworkURL, a1);
}

uint64_t FrameworkRecord.bundleURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19AB2C444(&OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleURL, a1);
}

uint64_t FrameworkRecord.metadataURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19AB2C444(&OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_metadataURL, a1);
}

uint64_t sub_19AB2C444@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *a1;
  v5 = OUTLINED_FUNCTION_134();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

void FrameworkRecord.effectiveBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier + 8);
  v6 = v0 + OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleURL;
  v7 = OUTLINED_FUNCTION_134();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v3, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 0, 1, v7);
  v8 = objc_allocWithZone((Class)LNEffectiveBundleIdentifier);
  swift_bridgeObjectRetain();
  sub_19AB036B0(3, v4, v5, (uint64_t)v3);
}

uint64_t static FrameworkRecord.from(bundleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if (qword_1EE3B92A8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_19AB2C250(v4, a1, a2);
  swift_bridgeObjectRelease();
  return v5;
}

void *static FrameworkRecord.from(frameworkURL:)(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  char v4;
  void *v5;
  id v6;

  if (qword_1EE3B92A8 != -1)
    swift_once();
  v2 = off_1EE3B9338;
  if (!*((_QWORD *)off_1EE3B9338 + 2))
    return 0;
  v3 = sub_19AA4A90C(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(void **)(v2[7] + 8 * v3);
  v6 = v5;
  return v5;
}

void *sub_19AB2C668()
{
  void *result;

  result = (void *)sub_19AB2C684();
  off_1EE3B9338 = result;
  return result;
}

uint64_t sub_19AB2C684()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t p_align;
  void *v20;
  id v21;
  void *v22;
  void (*v23)(char *, uint64_t);
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  char *v40;
  char v41;
  char *v42;
  uint64_t v43;
  BOOL v44;
  char *v45;
  char v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v50;
  void *v51;
  void *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  void (*v57)(uint64_t, char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  unint64_t v77;
  char v78;
  char v79;
  unint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t result;
  char *v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void (*v92)(char *, char *, uint64_t);
  char *v93;
  void (*v94)(char *, uint64_t);
  uint64_t v95;
  char *v96;
  char *v97;
  id v98[2];

  v98[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  v1 = MEMORY[0x1E0C80A78](v0);
  v91 = (uint64_t)&v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v87 - v3;
  v5 = sub_19AB824B8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v97 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v96 = (char *)&v87 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v87 = (char *)&v87 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v90 = (char *)&v87 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v93 = (char *)&v87 - v16;
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v87 - v17;
  p_align = (unint64_t)&stru_1E39B1FE8.align;
  v20 = (void *)objc_opt_self();
  v21 = objc_msgSend(v20, sel_defaultManager);
  sub_19AB8244C();
  v22 = (void *)sub_19AB82464();
  v95 = v6;
  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v18, v5);
  v98[0] = 0;
  v24 = objc_msgSend(v21, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v22, 0, 0, v98);

  v25 = v98[0];
  if (!v24)
  {
    v51 = v25;
    v52 = (void *)sub_19AB823E0();

LABEL_39:
    swift_willThrow();

    type metadata accessor for FrameworkRecord();
    sub_19AB2D864();
    return sub_19AB82590();
  }
  v26 = (void *)sub_19AB827DC();

  v27 = objc_msgSend(v20, sel_defaultManager);
  sub_19AB8244C();
  v28 = (void *)sub_19AB82464();
  v94 = v23;
  v23(v18, v5);
  v98[0] = 0;
  v29 = objc_msgSend(v27, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v28, 0, 0, v98);

  v30 = v98[0];
  if (!v29)
  {
    v67 = v30;
    swift_bridgeObjectRelease();
    v52 = (void *)sub_19AB823E0();

    goto LABEL_39;
  }
  sub_19AB827DC();

  v98[0] = v26;
  sub_19A9FE7C8();
  v31 = v98[0];
  v98[0] = (id)MEMORY[0x1E0DEE9D8];
  v33 = v94;
  v32 = v95;
  v89 = v31[2];
  if (v89)
  {
    v34 = 0;
    v88 = v31;
    do
    {
      if (v34 >= v31[2])
      {
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      v35 = v33;
      p_align = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      v36 = *(_QWORD *)(v32 + 72);
      v37 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
      v37(v4, (char *)v31 + p_align + v36 * v34, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v5);
      if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
        goto LABEL_26;
      v38 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
      v39 = v93;
      v40 = v4;
      v92 = v38;
      v38(v93, v4, v5);
      v41 = sub_19AB82458();
      v42 = v90;
      v37(v90, v39, v5);
      if ((v41 & 1) != 0)
      {
        v44 = sub_19AB82434() == 0x726F77656D617266 && v43 == 0xE90000000000006BLL;
        v33 = v35;
        if (v44)
        {
          swift_bridgeObjectRelease();
          v35(v42, v5);
          v4 = v40;
          v47 = v92;
LABEL_17:
          v47(v87, v93, v5);
          v48 = (char *)v98[0];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v31 = v88;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_19AA48704();
            v48 = (char *)v98[0];
          }
          v50 = *((_QWORD *)v48 + 2);
          if (v50 >= *((_QWORD *)v48 + 3) >> 1)
          {
            sub_19AA48704();
            v48 = (char *)v98[0];
          }
          *((_QWORD *)v48 + 2) = v50 + 1;
          v47(&v48[p_align + v50 * v36], v87, v5);
          v98[0] = v48;
          v33 = v94;
          goto LABEL_22;
        }
        v45 = v42;
        v46 = sub_19AB82BE4();
        swift_bridgeObjectRelease();
        v35(v45, v5);
        v4 = v40;
        v47 = v92;
        if ((v46 & 1) != 0)
          goto LABEL_17;
      }
      else
      {
        v33 = v35;
        v35(v42, v5);
        v4 = v40;
      }
      v33(v93, v5);
      v31 = v88;
LABEL_22:
      ++v34;
      v32 = v95;
    }
    while (v89 != v34);
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
LABEL_26:
  swift_bridgeObjectRelease();
  sub_19A9FEB40((uint64_t)v4, (uint64_t *)&unk_1EDBA3F50);
  v53 = (char *)v98[0];
  v98[0] = (id)MEMORY[0x1E0DEE9D8];
  v54 = *((_QWORD *)v53 + 2);
  v93 = v53;
  if (v54)
  {
    v55 = &v53[(*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80)];
    v56 = *(_QWORD *)(v32 + 72);
    v57 = *(void (**)(uint64_t, char *, uint64_t))(v32 + 16);
    swift_retain();
    while (1)
    {
      v58 = v91;
      v57(v91, v55, v5);
      __swift_storeEnumTagSinglePayload(v58, 0, 1, v5);
      if (__swift_getEnumTagSinglePayload(v58, 1, v5) == 1)
        break;
      v59 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v95 + 32))(v96, v58, v5);
      v60 = (void *)MEMORY[0x19AECEED0](v59);
      v61 = (void *)objc_opt_self();
      v62 = (void *)sub_19AB82464();
      v63 = objc_msgSend(v61, sel_ln_uniqueBundleWithURL_, v62);

      if (v63)
      {
        v64 = objc_allocWithZone((Class)type metadata accessor for FrameworkRecord());
        v65 = FrameworkRecord.init(_:appIntentsSupportedOnly:)(v63, 1);
      }
      else
      {
        v65 = 0;
      }
      objc_autoreleasePoolPop(v60);
      v66 = ((uint64_t (*)(char *, uint64_t))v94)(v96, v5);
      if (v65)
      {
        MEMORY[0x19AECE8F4](v66);
        if (*(_QWORD *)(((unint64_t)v98[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v98[0] & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
          sub_19AB8280C();
        sub_19AB82830();
        sub_19AB827F4();
      }
      v55 += v56;
      if (!--v54)
        goto LABEL_41;
    }
  }
  else
  {
    swift_retain();
LABEL_41:
    __swift_storeEnumTagSinglePayload(v91, 1, 1, v5);
  }
  swift_release();
  p_align = (unint64_t)v98[0];
  swift_release();
  if (p_align >> 62)
  {
LABEL_67:
    swift_bridgeObjectRetain_n();
    v69 = sub_19AB82A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v69 = *(_QWORD *)((p_align & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v70 = v95;
  if (!v69)
  {
    v68 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_61:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v68;
  }
  v96 = (char *)v5;
  v68 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v92 = (void (*)(char *, char *, uint64_t))p_align;
  v93 = (char *)(p_align & 0xC000000000000001);
  v71 = 4;
  while (1)
  {
    if (v93)
      v72 = (char *)MEMORY[0x19AECEAB0](v71 - 4, p_align);
    else
      v72 = (char *)*(id *)(p_align + 8 * v71);
    v5 = v71 - 3;
    if (__OFADD__(v71 - 4, 1))
    {
      __break(1u);
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    v73 = v72;
    p_align = *(_QWORD *)(v70 + 16);
    v74 = (uint64_t)v97;
    ((void (*)(char *, char *, char *))p_align)(v97, &v72[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_frameworkURL], v96);
    swift_isUniquelyReferenced_nonNull_native();
    v98[0] = v68;
    v75 = sub_19AA4A90C(v74);
    if (__OFADD__(v68[2], (v76 & 1) == 0))
      goto LABEL_64;
    v77 = v75;
    v78 = v76;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B92C8);
    v79 = sub_19AB829F8();
    v70 = v95;
    if ((v79 & 1) != 0)
      break;
LABEL_54:
    v68 = v98[0];
    if ((v78 & 1) != 0)
    {
      v82 = *((_QWORD *)v98[0] + 7);

      *(_QWORD *)(v82 + 8 * v77) = v73;
    }
    else
    {
      *((_QWORD *)v98[0] + (v77 >> 6) + 8) |= 1 << v77;
      ((void (*)(unint64_t, char *, char *))p_align)(v68[6] + *(_QWORD *)(v70 + 72) * v77, v97, v96);
      *(_QWORD *)(v68[7] + 8 * v77) = v73;
      v83 = v68[2];
      v84 = __OFADD__(v83, 1);
      v85 = v83 + 1;
      if (v84)
        goto LABEL_66;
      v68[2] = v85;
    }
    swift_bridgeObjectRelease();
    v94(v97, (uint64_t)v96);
    ++v71;
    p_align = (unint64_t)v92;
    if (v5 == v69)
      goto LABEL_61;
  }
  v80 = sub_19AA4A90C((uint64_t)v97);
  if ((v78 & 1) == (v81 & 1))
  {
    v77 = v80;
    goto LABEL_54;
  }
  result = sub_19AB82C2C();
  __break(1u);
  return result;
}

id FrameworkRecord.__allocating_init(_:appIntentsSupportedOnly:)(void *a1, char a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return FrameworkRecord.init(_:appIntentsSupportedOnly:)(a1, a2);
}

uint64_t static FrameworkRecord.enumerated.getter()
{
  if (qword_1EE3B92A8 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

id FrameworkRecord.init(_:appIntentsSupportedOnly:)(void *a1, char a2)
{
  void *v2;
  void *v3;
  void *ObjectType;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  objc_super v37;
  unint64_t v38;
  unint64_t v39;

  v3 = v2;
  ObjectType = (void *)swift_getObjectType();
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_134();
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v36 = (uint64_t)&v32 - v14;
  v15 = v3;
  v16 = (void *)MEMORY[0x19AECEED0]();
  sub_19AB2D490(a1, &v38);
  objc_autoreleasePoolPop(v16);
  if ((v38 == 2 || (v38 & 1) == 0) && (a2 & 1) != 0)
    goto LABEL_8;
  v17 = sub_19A9FE698(a1);
  if (!v18)
    goto LABEL_8;
  v19 = v18;
  v34 = v17;
  v20 = (void *)MEMORY[0x19AECEED0]();
  sub_19AB2D588(a1, &v38);
  objc_autoreleasePoolPop(v20);
  if (v39)
  {
    v35 = ObjectType;
    v33 = (id)objc_opt_self();
    v38 = 0;
    v39 = 0xE000000000000000;
    sub_19AB8295C();
    swift_bridgeObjectRelease();
    v38 = 0xD000000000000022;
    v39 = 0x800000019ABB4240;
    sub_19AB826F8();
    swift_bridgeObjectRelease();
    sub_19AB826F8();
    v21 = (void *)sub_19AB82650();
    ObjectType = v35;
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v33, sel_ln_uniqueBundleWithPath_, v21);

    if (!v22)
    {
      swift_bridgeObjectRelease();
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
    v22 = a1;
  }
  v25 = v22;
  v26 = sub_19AA0AD38(0x74636172747865, 0xE700000000000000, 0x64736E6F69746361, 0xEB00000000617461, 0xD000000000000013, 0x800000019ABB4220, v25);
  if (v26)
  {
    v27 = v26;
    sub_19AB82488();

    OUTLINED_FUNCTION_0_16((uint64_t)v9, (uint64_t)v13);
    OUTLINED_FUNCTION_3_12((uint64_t)v9, 0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) != 1)
    {
      v28 = v36;
      OUTLINED_FUNCTION_0_16(v36, (uint64_t)v9);
      v29 = (uint64_t *)&v15[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier];
      *v29 = v34;
      v29[1] = v19;
      v30 = objc_msgSend(v25, sel_bundleURL);
      OUTLINED_FUNCTION_4_12();

      OUTLINED_FUNCTION_0_16((uint64_t)&v15[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleURL], (uint64_t)v13);
      v31 = objc_msgSend(a1, sel_bundleURL);
      OUTLINED_FUNCTION_4_12();

      OUTLINED_FUNCTION_0_16((uint64_t)&v15[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_frameworkURL], (uint64_t)v13);
      OUTLINED_FUNCTION_0_16((uint64_t)&v15[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_metadataURL], v28);

      v37.receiver = v15;
      v37.super_class = (Class)ObjectType;
      v23 = objc_msgSendSuper2(&v37, sel_init);

      return v23;
    }
  }
  else
  {
    OUTLINED_FUNCTION_3_12((uint64_t)v9, 1);
  }

  swift_bridgeObjectRelease();
  sub_19A9FEB40((uint64_t)v9, (uint64_t *)&unk_1EDBA3F50);
LABEL_9:
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_19AB2D490@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  void *v4;
  id v5;
  uint64_t result;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v4 = (void *)sub_19AB82650();
  v5 = objc_msgSend(a1, sel_objectForInfoDictionaryKey_, v4);

  if (v5)
  {
    sub_19AB828E4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_19A9FEB7C((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    result = sub_19A9FEB40((uint64_t)v8, (uint64_t *)&unk_1EDBA32C0);
    goto LABEL_8;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
LABEL_8:
    *a2 = 2;
  return result;
}

uint64_t sub_19AB2D588@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  id v5;
  uint64_t result;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v4 = (void *)sub_19AB82650();
  v5 = objc_msgSend(a1, sel_objectForInfoDictionaryKey_, v4);

  if (v5)
  {
    sub_19AB828E4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_19A9FEB7C((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    result = sub_19A9FEB40((uint64_t)v8, (uint64_t *)&unk_1EDBA32C0);
    goto LABEL_8;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_8:
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

id FrameworkRecord.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FrameworkRecord.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FrameworkRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19AB2D794()
{
  return type metadata accessor for FrameworkRecord();
}

uint64_t type metadata accessor for FrameworkRecord()
{
  uint64_t result;

  result = qword_1EE3B9970;
  if (!qword_1EE3B9970)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_19AB2D7D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_19AB824B8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FrameworkRecord()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FrameworkRecord.__allocating_init(_:appIntentsSupportedOnly:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

unint64_t sub_19AB2D864()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDBA2680;
  if (!qword_1EDBA2680)
  {
    v1 = sub_19AB824B8();
    result = MEMORY[0x19AECF4B8](MEMORY[0x1E0CB0018], v1);
    atomic_store(result, (unint64_t *)&qword_1EDBA2680);
  }
  return result;
}

uint64_t static LNEnumMetadata.enumIdentifierIsSystem(enumIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA18E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = 0xD00000000000001DLL;
  *(_QWORD *)(inited + 40) = 0x800000019ABB22A0;
  *(_QWORD *)(inited + 48) = 0x704F65676E616843;
  *(_QWORD *)(inited + 56) = 0xEF6E6F6974617265;
  *(_QWORD *)(inited + 64) = 0xD000000000000011;
  *(_QWORD *)(inited + 72) = 0x800000019ABB21D0;
  *(_QWORD *)(inited + 80) = 0xD000000000000011;
  *(_QWORD *)(inited + 88) = 0x800000019ABB2210;
  *(_QWORD *)(inited + 96) = 0xD000000000000011;
  *(_QWORD *)(inited + 104) = 0x800000019ABB2250;
  strcpy((char *)(inited + 112), "UndoOperation");
  *(_WORD *)(inited + 126) = -4864;
  LOBYTE(a2) = sub_19AB2D9C4(a1, a2, (_QWORD *)inited);
  swift_setDeallocating();
  sub_19AB2DACC();
  return a2 & 1;
}

uint64_t sub_19AB2D9C4(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = OUTLINED_FUNCTION_18();
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
    if (v12 || (OUTLINED_FUNCTION_18() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_19AB2DAA8()
{
  return sub_19AB2DB08(&qword_1EE3BB4A0);
}

uint64_t sub_19AB2DAB4()
{
  return sub_19AB2DB08(&qword_1EE3BB498);
}

uint64_t sub_19AB2DAC0()
{
  return sub_19AB2DB08(&qword_1EE3BB490);
}

uint64_t sub_19AB2DACC()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_19AB2DAFC()
{
  return sub_19AB2DB08(&qword_1EE3BB488);
}

uint64_t sub_19AB2DB08(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

void sub_19AB2DB50(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t v3;

  if (a2 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = __OFADD__(a1, 2 * a2);
    v3 = a1 + 2 * a2;
    if (!v2)
    {
      MEMORY[0x19AECE804](v3);
      sub_19AA463C8();
      return;
    }
  }
  __break(1u);
}

uint64_t sub_19AB2DBBC()
{
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_19AB2DC50()
{
  return MEMORY[0x1E0DEE9D8];
}

id sub_19AB2DC64(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v18 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_19AA486CC(0, v1, 0);
    v3 = a1 + 32;
    v4 = v18;
    do
    {
      sub_19AAF8CD0(v3, (uint64_t)v15);
      v5 = v16;
      v6 = v17;
      __swift_project_boxed_opaque_existential_1Tm(v15, v16);
      v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      v9 = v8;
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19AA486CC(0, *(_QWORD *)(v4 + 16) + 1, 1);
        v4 = v18;
      }
      v11 = *(_QWORD *)(v4 + 16);
      v10 = *(_QWORD *)(v4 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_19AA486CC((char *)(v10 > 1), v11 + 1, 1);
        v4 = v18;
      }
      *(_QWORD *)(v4 + 16) = v11 + 1;
      v12 = v4 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v3 += 40;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v13 = objc_allocWithZone((Class)LNActionSummaryString);
  return sub_19AB2DE8C();
}

void sub_19AB2DDE8(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_19AB2DB50(a1, a2);
  *a3 = v4;
  a3[1] = v5;
  a3[2] = v6;
}

uint64_t sub_19AB2DE10()
{
  return sub_19AB2DBBC();
}

uint64_t sub_19AB2DE1C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = nullsub_1(*a1);
  *a2 = result;
  a2[1] = v4;
  a2[2] = v5;
  return result;
}

uint64_t sub_19AB2DE54@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_19AB2DC50();
  *a1 = MEMORY[0x1E0DEE9D8];
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

id sub_19AB2DE8C()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)sub_19AB82650();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_19AB827D0();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_initWithFormatString_parameterIdentifiers_, v1, v2);

  return v3;
}

ValueMetadata *type metadata accessor for SummaryString()
{
  return &type metadata for SummaryString;
}

unint64_t sub_19AB2DF30()
{
  unint64_t result;

  result = qword_1EE3BB4A8;
  if (!qword_1EE3BB4A8)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB9781C, &type metadata for SummaryString);
    atomic_store(result, (unint64_t *)&qword_1EE3BB4A8);
  }
  return result;
}

unint64_t sub_19AB2DF70()
{
  unint64_t result;

  result = qword_1EE3BB4B0;
  if (!qword_1EE3BB4B0)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB97854, &type metadata for SummaryString);
    atomic_store(result, (unint64_t *)&qword_1EE3BB4B0);
  }
  return result;
}

unint64_t sub_19AB2DFB0()
{
  unint64_t result;

  result = qword_1EE3BB4B8;
  if (!qword_1EE3BB4B8)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB97894, &type metadata for SummaryString);
    atomic_store(result, (unint64_t *)&qword_1EE3BB4B8);
  }
  return result;
}

unint64_t sub_19AB2DFF0()
{
  unint64_t result;

  result = qword_1EE3BB4C0;
  if (!qword_1EE3BB4C0)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB97914, &type metadata for SummaryString.StringInterpolation);
    atomic_store(result, (unint64_t *)&qword_1EE3BB4C0);
  }
  return result;
}

uint64_t destroy for SummaryString.StringInterpolation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s12LinkMetadata13SummaryStringVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s12LinkMetadata13SummaryStringVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *_s12LinkMetadata13SummaryStringVwta_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s12LinkMetadata13SummaryStringVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19AB2E180(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SummaryString.StringInterpolation()
{
  return &type metadata for SummaryString.StringInterpolation;
}

ValueMetadata *type metadata accessor for SystemDomain()
{
  return &type metadata for SystemDomain;
}

uint64_t sub_19AB2E1E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[48];
  _BYTE v6[40];
  _BYTE v7[40];
  _BYTE v8[40];
  _BYTE v9[32];
  uint64_t v10;
  char v11;
  _QWORD v12[3];
  __int128 v13;

  memset(v12, 0, sizeof(v12));
  v13 = xmmword_19AB971A0;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v11 = -1;
  v2 = sub_19AB2E334((uint64_t)v8);
  sub_19AB2EB58((uint64_t)v8, (uint64_t)v7, &qword_1EE3B9EA0);
  sub_19AB2EB58((uint64_t)v12, (uint64_t)v6, &qword_1EE3B9EA8);
  sub_19AB2EB58((uint64_t)v9, (uint64_t)v5, (uint64_t *)&unk_1EE3B9EB0);
  v3 = sub_19AB2E600();
  sub_19AAFB8AC(0xD000000000000016, 0x800000019ABB43B0, 0x686372616553, 0xE600000000000000, 0xD000000000000040, 0x800000019ABB43D0, (uint64_t)v7, v2, a1, 1, (uint64_t)v6, (uint64_t)v5, v3);
  sub_19A9FEB40((uint64_t)v9, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB40((uint64_t)v12, &qword_1EE3B9EA8);
  return sub_19A9FEB40((uint64_t)v8, &qword_1EE3B9EA0);
}

uint64_t sub_19AB2E334(uint64_t a1)
{
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v11;
  unint64_t v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v22[2] = 4;
  v23 = 0u;
  v24 = 0u;
  v25 = 260;
  v22[0] = 0x6169726574697263;
  v22[1] = 0xE800000000000000;
  v26 = 1954047316;
  v27 = 0xE400000000000000;
  v28 = 0xD00000000000002ALL;
  v29 = 0x800000019ABB4420;
  v11 = 0;
  v12 = 0xE000000000000000;
  MEMORY[0x19AECE804](16);
  sub_19AA463C8();
  v21 = v1;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v3;
  sub_19AB2EB58((uint64_t)v22, v3 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v19 = 0x707041206E6920;
  v20 = 0xE700000000000000;
  v17 = 37;
  v18 = 0xE100000000000000;
  v15 = 9509;
  v16 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v4 = v11;
  v5 = v12;
  v13 = &type metadata for Summary;
  v14 = &off_1E399A1E0;
  v6 = (_QWORD *)swift_allocObject();
  v11 = v6;
  v6[2] = v21;
  v6[3] = v4;
  v6[4] = v5;
  v7 = MEMORY[0x1E0DEE9D8];
  v6[5] = MEMORY[0x1E0DEE9D8];
  v8 = sub_19AAFE518(a1, &v11, v7);
  sub_19A9FEB40((uint64_t)v22, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v11);
  return v8;
}

uint64_t sub_19AB2E600()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97980;
  *(_QWORD *)(inited + 32) = &unk_1E3989118;
  *(_QWORD *)(inited + 40) = &unk_1E3988C08;
  *(_QWORD *)(inited + 48) = &unk_1E3988E18;
  *(_QWORD *)(inited + 56) = &unk_1E3988F98;
  *(_QWORD *)(inited + 64) = &unk_1E3988FC8;
  *(_QWORD *)(inited + 72) = &unk_1E3988FF8;
  *(_QWORD *)(inited + 80) = &unk_1E3989028;
  *(_QWORD *)(inited + 88) = &unk_1E3989058;
  *(_QWORD *)(inited + 96) = &unk_1E3989088;
  *(_QWORD *)(inited + 104) = &unk_1E39890B8;
  *(_QWORD *)(inited + 112) = &unk_1E39890E8;
  *(_QWORD *)(inited + 120) = &unk_1E3988C38;
  *(_QWORD *)(inited + 128) = &unk_1E3988C68;
  *(_QWORD *)(inited + 136) = &unk_1E3988C98;
  *(_QWORD *)(inited + 144) = &unk_1E3988CC8;
  *(_QWORD *)(inited + 152) = &unk_1E3988CF8;
  *(_QWORD *)(inited + 160) = &unk_1E3988D28;
  *(_QWORD *)(inited + 168) = &unk_1E3988D58;
  *(_QWORD *)(inited + 176) = &unk_1E3988D88;
  *(_QWORD *)(inited + 184) = &unk_1E3988DB8;
  *(_QWORD *)(inited + 192) = &unk_1E3988DE8;
  *(_QWORD *)(inited + 200) = &unk_1E3988E48;
  *(_QWORD *)(inited + 208) = &unk_1E3988E78;
  *(_QWORD *)(inited + 216) = &unk_1E3988EA8;
  *(_QWORD *)(inited + 224) = &unk_1E3988ED8;
  *(_QWORD *)(inited + 232) = &unk_1E3988F08;
  *(_QWORD *)(inited + 240) = &unk_1E3988F38;
  *(_QWORD *)(inited + 248) = &unk_1E3988F68;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 256)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB2E8BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[4];

  v4[3] = &type metadata for AssistantSchema.IntentSchema;
  v4[0] = 0xD000000000000010;
  v4[1] = 0x800000019ABB4390;
  sub_19A9FEF48((uint64_t)v4, a1);
  v2 = sub_19AB2E92C();
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_19AB2E92C()
{
  uint64_t v0;
  uint64_t inited;
  __int128 v3;
  ValueMetadata *v4;
  _UNKNOWN **v5;
  _QWORD v6[25];

  sub_19AB2E1E4((uint64_t)v6);
  v4 = &type metadata for IntentSchema;
  v5 = &off_1E3981258;
  *(_QWORD *)&v3 = swift_allocObject();
  sub_19AA1963C((uint64_t)v6, v3 + 16);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v3, v0 + 32);
  sub_19AA19690((uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = v0;
  v6[0] = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v6[0];
}

uint64_t sub_19AB2EA2C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 96))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) >= 5uLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 120);
  switch(*(_BYTE *)(v0 + 200))
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 160);
      break;
    case 2:
    case 3:
      swift_release();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB2EADC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  switch(*(_BYTE *)(v0 + 72))
  {
    case 0:
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
      break;
    case 2:
    case 3:
      swift_release();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB2EB58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_19AB2EB9C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

uint64_t sub_19AB2EBD0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    sub_19AA486CC(0, v1, 0);
    v2 = v14;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      v5 = v4[3];
      v6 = v4[4];
      __swift_project_boxed_opaque_existential_1Tm(v4, v5);
      v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
      v9 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_19AA486CC(0, *(_QWORD *)(v14 + 16) + 1, 1);
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_19AA486CC((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_19AB2ECEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _BYTE v10[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
    v5 = sub_19AB2DC64(a1);
  else
    v5 = 0;
  v6 = sub_19AB824B8();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v6);
  v7 = swift_bridgeObjectRetain();
  sub_19AB2EBD0(v7);
  swift_bridgeObjectRelease();
  v8 = objc_allocWithZone((Class)LNActionSummary);
  return sub_19AA01DD0(v5, (uint64_t)v4, 0, 0);
}

uint64_t destroy for Summary(_QWORD *a1)
{
  if (*a1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Summary(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (*a2)
  {
    v4 = a2[1];
    v5 = a2[2];
    *a1 = *a2;
    a1[1] = v4;
    a1[2] = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
  }
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for Summary(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v4 = *a1;
  v5 = *a2;
  if (v4)
  {
    if (v5)
    {
      *a1 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_19AB2EF68((uint64_t)a1);
      v6 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v6;
    }
  }
  else if (v5)
  {
    *a1 = v5;
    a1[1] = a2[1];
    a1[2] = a2[2];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v7 = *(_OWORD *)a2;
    a1[2] = a2[2];
    *(_OWORD *)a1 = v7;
  }
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_19AB2EF68(uint64_t a1)
{
  destroy for SummaryString();
  return a1;
}

_QWORD *assignWithTake for Summary(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
    goto LABEL_5;
  if (!*(_QWORD *)a2)
  {
    sub_19AB2EF68((uint64_t)a1);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = *(_QWORD *)(a2 + 16);
    goto LABEL_6;
  }
  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  a1[1] = *(_QWORD *)(a2 + 8);
  a1[2] = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  a1[3] = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Summary()
{
  return &type metadata for Summary;
}

LNContentType __swiftcall LNContentType.init(stringLiteral:)(Swift::String stringLiteral)
{
  id v1;
  void *v2;
  objc_class *v3;
  NSString *v4;
  objc_class *v5;
  LNContentType result;

  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v2 = (void *)sub_19AB82650();
  swift_bridgeObjectRelease();
  v3 = (objc_class *)objc_msgSend(v1, sel_initWithContentType_, v2);

  v5 = v3;
  result._contentType = v4;
  result.super.isa = v5;
  return result;
}

uint64_t sub_19AB2F094()
{
  return sub_19AB2F144(&qword_1EE3BB4C8, (uint64_t)&protocol conformance descriptor for LNContentType);
}

unint64_t sub_19AB2F0B8()
{
  unint64_t result;

  result = qword_1EDBA1F68;
  if (!qword_1EDBA1F68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDBA1F68);
  }
  return result;
}

Class sub_19AB2F0F4@<X0>(Swift::String *a1@<X0>, Class *a2@<X8>)
{
  Class result;

  result = LNContentType.init(stringLiteral:)(*a1).super.isa;
  *a2 = result;
  return result;
}

uint64_t sub_19AB2F120()
{
  return sub_19AB2F144(&qword_1EE3BB4D0, (uint64_t)&protocol conformance descriptor for LNContentType);
}

uint64_t sub_19AB2F144(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_19AB2F0B8();
    result = MEMORY[0x19AECF4B8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosDomain()
{
  return &type metadata for PhotosDomain;
}

uint64_t sub_19AB2F198()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t inited;
  __int128 v4;
  ValueMetadata *v5;
  _UNKNOWN **v6;

  v5 = &type metadata for EnumSchema;
  v6 = &off_1E397AEF8;
  v0 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v4 = v0;
  v0[2] = 0xD000000000000015;
  v0[3] = 0x800000019ABAF340;
  v0[4] = 0x54207265746C6946;
  v0[5] = 0xEB00000000657079;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v4, v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)&v4 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v4;
}

uint64_t sub_19AB2F2B4()
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
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 6;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19AB88C20;
  strcpy((char *)(v1 + 32), "creationDate");
  *(_BYTE *)(v1 + 45) = 0;
  *(_WORD *)(v1 + 46) = -5120;
  *(_QWORD *)(v1 + 48) = v0;
  *(_BYTE *)(v1 + 88) = 3;
  strcpy((char *)(v1 + 96), "Date Created");
  *(_BYTE *)(v1 + 109) = 0;
  *(_WORD *)(v1 + 110) = -5120;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 10;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_BYTE *)(v2 + 56) = 4;
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v3 + 32) = 0x6E6F697461636F6CLL;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 88) = 3;
  *(_QWORD *)(v3 + 96) = 0x6E6F697461636F4CLL;
  *(_QWORD *)(v3 + 104) = 0xE800000000000000;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 40) = &type metadata for EnumSchema;
  *(_QWORD *)(v4 + 48) = &off_1E397AEF8;
  v5 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v5;
  strcpy((char *)(v5 + 16), "PhotoAssetType");
  *(_BYTE *)(v5 + 31) = -18;
  *(_QWORD *)(v5 + 32) = 0x7954206F746F6850;
  *(_QWORD *)(v5 + 40) = 0xEA00000000006570;
  *(_BYTE *)(v4 + 56) = 1;
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v6 + 32) = 0x7079547465737361;
  *(_QWORD *)(v6 + 40) = 0xE900000000000065;
  *(_QWORD *)(v6 + 48) = v4;
  *(_BYTE *)(v6 + 88) = 3;
  *(_QWORD *)(v6 + 96) = 0x7954206F746F6850;
  *(_QWORD *)(v6 + 104) = 0xEA00000000006570;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 32) = 0x69726F7661467369;
  *(_QWORD *)(v7 + 40) = 0xEA00000000006574;
  *(_QWORD *)(v7 + 48) = 2;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_BYTE *)(v7 + 88) = 4;
  *(_QWORD *)(v7 + 96) = 0x657469726F766146;
  *(_QWORD *)(v7 + 104) = 0xE800000000000000;
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 32) = 0x6E65646469487369;
  *(_QWORD *)(v8 + 40) = 0xE800000000000000;
  *(_QWORD *)(v8 + 48) = 2;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_BYTE *)(v8 + 88) = 4;
  *(_QWORD *)(v8 + 96) = 0x6E6564646948;
  *(_QWORD *)(v8 + 104) = 0xE600000000000000;
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v9 + 32) = 0xD000000000000011;
  *(_QWORD *)(v9 + 40) = 0x800000019ABAF4C0;
  *(_QWORD *)(v9 + 48) = 2;
  *(_OWORD *)(v9 + 56) = 0u;
  *(_OWORD *)(v9 + 72) = 0u;
  *(_BYTE *)(v9 + 88) = 4;
  *(_QWORD *)(v9 + 96) = 0x6574736567677553;
  *(_QWORD *)(v9 + 104) = 0xEF73746964452064;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 64) = v8;
  *(_QWORD *)(inited + 72) = v9;
  v11 = MEMORY[0x1E0DEE9D8];
  v12 = 32;
  while (1)
  {
    v13 = *(_QWORD *)(inited + v12);
    v14 = *(_QWORD *)(v13 + 16);
    v15 = *(_QWORD *)(v11 + 16);
    v16 = v15 + v14;
    if (__OFADD__(v15, v14))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v16 > *(_QWORD *)(v11 + 24) >> 1)
    {
      if (v15 <= v16)
        v18 = v15 + v14;
      else
        v18 = v15;
      sub_19AA462CC(isUniquelyReferenced_nonNull_native, v18, 1, v11);
      v11 = v19;
    }
    if (*(_QWORD *)(v13 + 16))
    {
      v20 = *(_QWORD *)(v11 + 16);
      if ((*(_QWORD *)(v11 + 24) >> 1) - v20 < v14)
        goto LABEL_24;
      v21 = v11 + 80 * v20 + 32;
      if (v13 + 32 < v21 + 80 * v14 && v21 < v13 + 32 + 80 * v14)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v14)
      {
        v23 = *(_QWORD *)(v11 + 16);
        v24 = __OFADD__(v23, v14);
        v25 = v23 + v14;
        if (v24)
          goto LABEL_25;
        *(_QWORD *)(v11 + 16) = v25;
      }
    }
    else if (v14)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v12 += 8;
    if (v12 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAA8();
      return v11;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB2F784()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;

  *(_QWORD *)&v4 = 0x746E456F746F6850;
  *((_QWORD *)&v4 + 1) = 0xEB00000000797469;
  v5 = 0x6F746F6850;
  v6 = 0xE500000000000000;
  v7 = sub_19AB2FEC4();
  v8 = 1;
  v0 = sub_19AB4D534(&v4);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = v0;
  v3 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v3;
}

uint64_t sub_19AB2F860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v0 + 32) = 1701667182;
  *(_QWORD *)(v0 + 40) = 0xE400000000000000;
  *(_QWORD *)(v0 + 48) = 3;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_BYTE *)(v0 + 88) = 4;
  *(_QWORD *)(v0 + 96) = 1701667150;
  *(_QWORD *)(v0 + 104) = 0xE400000000000000;
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 6;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_BYTE *)(v1 + 56) = 4;
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  strcpy((char *)(v2 + 32), "creationDate");
  *(_BYTE *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 88) = 3;
  strcpy((char *)(v2 + 96), "Date Created");
  *(_BYTE *)(v2 + 109) = 0;
  *(_WORD *)(v2 + 110) = -5120;
  v3 = swift_allocObject();
  strcpy((char *)(v3 + 16), "PhotoAlbumType");
  *(_BYTE *)(v3 + 31) = -18;
  *(_QWORD *)(v3 + 32) = 0x7954206D75626C41;
  *(_QWORD *)(v3 + 40) = 0xEA00000000006570;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v4 + 32) = 0x7079546D75626C61;
  *(_QWORD *)(v4 + 40) = 0xE900000000000065;
  *(_QWORD *)(v4 + 48) = v3;
  *(_QWORD *)(v4 + 72) = &type metadata for EnumSchema;
  *(_QWORD *)(v4 + 80) = &off_1E397AEF8;
  *(_BYTE *)(v4 + 88) = 1;
  *(_QWORD *)(v4 + 96) = 1701869908;
  *(_QWORD *)(v4 + 104) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C30;
  *(_QWORD *)(inited + 32) = v0;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v4;
  v6 = MEMORY[0x1E0DEE9D8];
  v7 = 32;
  while (1)
  {
    v8 = *(_QWORD *)(inited + v7);
    v9 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v6 + 16);
    v11 = v10 + v9;
    if (__OFADD__(v10, v9))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v11 > *(_QWORD *)(v6 + 24) >> 1)
    {
      if (v10 <= v11)
        v13 = v10 + v9;
      else
        v13 = v10;
      sub_19AA462CC(isUniquelyReferenced_nonNull_native, v13, 1, v6);
      v6 = v14;
    }
    if (*(_QWORD *)(v8 + 16))
    {
      v15 = *(_QWORD *)(v6 + 16);
      if ((*(_QWORD *)(v6 + 24) >> 1) - v15 < v9)
        goto LABEL_24;
      v16 = v6 + 80 * v15 + 32;
      if (v8 + 32 < v16 + 80 * v9 && v16 < v8 + 32 + 80 * v9)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v9)
      {
        v18 = *(_QWORD *)(v6 + 16);
        v19 = __OFADD__(v18, v9);
        v20 = v18 + v9;
        if (v19)
          goto LABEL_25;
        *(_QWORD *)(v6 + 16) = v20;
      }
    }
    else if (v9)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v7 += 8;
    if (v7 == 56)
    {
      swift_setDeallocating();
      sub_19AB2DAA8();
      return v6;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB2FBC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;

  *(_QWORD *)&v4 = 0xD000000000000010;
  *((_QWORD *)&v4 + 1) = 0x800000019ABAEE40;
  v5 = 0x6D75626C41;
  v6 = 0xE500000000000000;
  v0 = MEMORY[0x1E0DEE9D8];
  v7 = MEMORY[0x1E0DEE9D8];
  v8 = 1;
  v1 = sub_19AB4D534(&v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = v1;
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v0;
}

uint64_t sub_19AB2FC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v0 + 32) = 1701667182;
  *(_QWORD *)(v0 + 40) = 0xE400000000000000;
  *(_QWORD *)(v0 + 48) = 3;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_BYTE *)(v0 + 88) = 4;
  *(_QWORD *)(v0 + 96) = 1701667150;
  *(_QWORD *)(v0 + 104) = 0xE400000000000000;
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v1 + 32) = 0x69726F7661467369;
  *(_QWORD *)(v1 + 40) = 0xEA00000000006574;
  *(_QWORD *)(v1 + 48) = 2;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_BYTE *)(v1 + 88) = 4;
  *(_QWORD *)(v1 + 96) = 0x657469726F766146;
  *(_QWORD *)(v1 + 104) = 0xE800000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88CA0;
  *(_QWORD *)(inited + 32) = v0;
  *(_QWORD *)(inited + 40) = v1;
  v4 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47F58();
  swift_bridgeObjectRetain();
  sub_19AA47F58();
  swift_setDeallocating();
  sub_19AB2DAA8();
  return v4;
}

uint64_t sub_19AB2FDEC()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char v8;

  *(_QWORD *)&v4 = 0xD000000000000011;
  *((_QWORD *)&v4 + 1) = 0x800000019ABAEE80;
  v5 = 0x6E6F73726550;
  v6 = 0xE600000000000000;
  v7 = sub_19AB2FEC4();
  v8 = 1;
  v0 = sub_19AB4D534(&v4);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = v0;
  v3 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v3;
}

uint64_t sub_19AB2FEC4()
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
  uint64_t v9;
  uint64_t inited;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v0 = OUTLINED_FUNCTION_194();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  OUTLINED_FUNCTION_86_0();
  *(_QWORD *)(v2 + 32) = v1 | 0x20;
  *(_QWORD *)(v2 + 40) = 0xE800000000000000;
  OUTLINED_FUNCTION_84_0(v2);
  *(_BYTE *)(v3 + 88) = 4;
  *(_QWORD *)(v3 + 96) = v4;
  *(_QWORD *)(v3 + 104) = v5;
  v6 = OUTLINED_FUNCTION_194();
  *(_OWORD *)(v6 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v6 + 32) = 0x6E6564646968;
  *(_QWORD *)(v6 + 40) = 0xE600000000000000;
  OUTLINED_FUNCTION_84_0(v6);
  *(_BYTE *)(v7 + 88) = 4;
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88CA0;
  *(_QWORD *)(inited + 32) = v0;
  *(_QWORD *)(inited + 40) = v6;
  v12 = MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_74();
  sub_19AA47F58();
  swift_bridgeObjectRetain();
  sub_19AA47F58();
  swift_setDeallocating();
  sub_19AB2DAA8();
  return v12;
}

void sub_19AB2FFDC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[48];
  _BYTE v15[40];
  _BYTE v16[40];
  _BYTE v17[40];
  _QWORD v18[5];
  char v19;
  _BYTE v20[24];
  __int128 v21;

  OUTLINED_FUNCTION_64_0();
  v21 = xmmword_19AB88C40;
  sub_19AB2F860();
  v18[3] = &type metadata for EntitySchema;
  v18[4] = &off_1E39811C0;
  v18[0] = OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_52_1();
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 24) = 0x800000019ABAEE40;
  OUTLINED_FUNCTION_41_1(v0, 0x6D75626C41);
  v19 = v2;
  sub_19AB30108((uint64_t)v17);
  OUTLINED_FUNCTION_17_7((uint64_t)v17, (uint64_t)v16);
  OUTLINED_FUNCTION_16_5((uint64_t)v20, (uint64_t)v15);
  OUTLINED_FUNCTION_12_0((uint64_t)v18, (uint64_t)v14);
  sub_19AB303BC();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_90_0(16);
  OUTLINED_FUNCTION_89_0();
  OUTLINED_FUNCTION_14_0(v3, v4, v5, v6, 0xD000000000000010, v7, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_13_0((uint64_t)v18);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_18_5((uint64_t)v17);
  OUTLINED_FUNCTION_32_2();
}

uint64_t sub_19AB30108(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v11;
  unint64_t v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v22[2] = 3;
  v23 = 0u;
  v24 = 0u;
  v25 = 260;
  v22[0] = 1701667182;
  v22[1] = 0xE400000000000000;
  v26 = 0x64656C7469746E55;
  v27 = 0xE800000000000000;
  v28 = 0xD00000000000001BLL;
  v29 = 0x800000019ABB5160;
  v11 = 0;
  v12 = 0xE000000000000000;
  MEMORY[0x19AECE804](21);
  v1 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v21 = v2;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v4 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v4;
  sub_19A9EE838((uint64_t)v22, v4 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v19 = 0;
  v20 = 0xE000000000000000;
  v17 = 37;
  v18 = 0xE100000000000000;
  v15 = 9509;
  v16 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v5 = v11;
  v6 = v12;
  v13 = &type metadata for Summary;
  v14 = &off_1E399A1E0;
  v7 = (_QWORD *)swift_allocObject();
  v11 = v7;
  v7[2] = v21;
  v7[3] = v5;
  v7[4] = v6;
  v7[5] = v1;
  v8 = sub_19AAFE518(a1, &v11, v1);
  sub_19A9FEB08((uint64_t)v22, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v11);
  return v8;
}

uint64_t sub_19AB303BC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C30;
  *(_QWORD *)(inited + 32) = &unk_1E3981BD8;
  *(_QWORD *)(inited + 40) = &unk_1E3981B78;
  *(_QWORD *)(inited + 48) = &unk_1E3981BA8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 56)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB30578()
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
  char v37;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
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
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  ValueMetadata *v239;
  _UNKNOWN **v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;

  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_54_0();
  sub_19AB2FFDC();
  sub_19AB30754((uint64_t)&v231);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_48_1(v3, v4, &qword_1EE3B9EA0, v5, v6, v7, v8, v9, v89, v98, v107, v116, v124, v132, v140, v148, v156, v164, v172,
    v180,
    v187,
    v194,
    v201,
    v208,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231);
  OUTLINED_FUNCTION_53_0(v1 + 104, (uint64_t)&v221);
  OUTLINED_FUNCTION_58_0(v1 + 144, v10, (uint64_t *)&unk_1EE3B9EB0, v11, v12, v13, v14, v15, v90, v99, v108, v117, v125, v133, v141, v149, v157, v165, v173);
  OUTLINED_FUNCTION_26_3(v16, v17, v18, v19, v20, v21, v22, v23, v91, v100, v109, v118, v126, v134, v142, v150, v158, v166, v174,
    v181,
    v188,
    v195,
    v202,
    v209,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236,
    v237,
    v238,
    (uint64_t)v239,
    (uint64_t)v240,
    v241,
    v242,
    v243,
    v244,
    v245,
    v246,
    v247,
    v248,
    v249,
    v250,
    v251,
    v252,
    v253);
  OUTLINED_FUNCTION_79();
  if (v37)
  {
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_307();
    v30 = OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_65_0(v30, &qword_1EE3B9EA8, v31, v32, v33, v34, v35, v36, v92, v101, v110, v119, v127);
  }
  else
  {
    OUTLINED_FUNCTION_46_0(v24, v25, v26, v27, v28, v29);
    OUTLINED_FUNCTION_37_0();
    if (v37)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v44 = OUTLINED_FUNCTION_120();
    }
    else
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v38 = OUTLINED_FUNCTION_120();
      v44 = OUTLINED_FUNCTION_63_0(v38, v39, v40, v41, v42, v43);
    }
    OUTLINED_FUNCTION_42_0(v44, v45, v46, v47, v48, v49, v50, v51, v92, v101, v110);
  }
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_45_0(v52, v53, v54, v55, v56, v57, v58, v59, v93, v102, v111, v119, v127, v135, v143, v151, v159, v167, v175,
    v182,
    v189,
    v196,
    v203,
    v210,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226);
  v254 = v0;
  OUTLINED_FUNCTION_75_0((uint64_t)&v221, v60, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)&v215, (uint64_t)&OBJC_PROTOCOL___NSObject.inst_props, (uint64_t *)&unk_1EE3B9EB0);
  v255 = v1;
  OUTLINED_FUNCTION_13_0((uint64_t)&v231);
  OUTLINED_FUNCTION_61_0(v61, v62, v63, v64, v65, v66, v67, v68, v94, v103, v112, v120, v128, v136, v144, v152, v160, v168, v176,
    v183,
    v190,
    v197,
    v204,
    v211,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236);
  v69 = sub_19AB2FBC8();
  v239 = &type metadata for VersionedSchema;
  v240 = &off_1E398E380;
  v70 = OUTLINED_FUNCTION_194();
  v236 = v70;
  *(_QWORD *)(v70 + 16) = 0;
  *(_QWORD *)(v70 + 24) = 0;
  *(_BYTE *)(v70 + 32) = 0;
  *(_QWORD *)(v70 + 40) = v69;
  LOBYTE(v241) = 1;
  OUTLINED_FUNCTION_12_0(v2, (uint64_t)&v231);
  v71 = OUTLINED_FUNCTION_73_0();
  sub_19A9EE838(v71, v72, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v236, (uint64_t)&v215, (uint64_t *)&unk_1EE3B9EB0);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_307();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_22_4((uint64_t)&v231, (uint64_t)&v215, v95, v104, v113, v121, v129, v137, v145, v153, v161, v169, v177, v184, v191, v198, v205, v212, v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226);
  OUTLINED_FUNCTION_74_0(v73, v74, v75, v76, v77, v78, v79, v80, v96, v105, v114, v122, v130, v138, v146, v154, v162, v170, v178,
    v185,
    v192,
    v199,
    v206,
    v213,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236);
  OUTLINED_FUNCTION_70_0(v81, v82, v83, v84, v85, v86, v87, v88, v97, v106, v115, v123, v131, v139, v147, v155, v163, v171, v179,
    v186,
    v193,
    v200,
    v207,
    v214,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236,
    v237,
    v238,
    (uint64_t)v239,
    (uint64_t)v240,
    v241,
    v242,
    v243,
    v244,
    v245,
    v246,
    v247,
    v248,
    v249,
    v250,
    v251,
    v252,
    v253);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_19AB30754(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x656C746974;
  *(_QWORD *)(v3 + 24) = 0xE500000000000000;
  *(_QWORD *)(v3 + 32) = 3;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 1701667150;
  *(_QWORD *)(v3 + 88) = 0xE400000000000000;
  *(_QWORD *)(v3 + 96) = 0xD00000000000001BLL;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB5160;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB30888: call analysis failed (funcsize=39)"

uint64_t sub_19AB30908(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB2F860();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000010;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEE40;
  *(_QWORD *)(v2 + 32) = 0x6D75626C41;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6D75626C41;
  v27 = 0xE500000000000000;
  strcpy((char *)v28, "Album to open");
  v28[7] = -4864;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB30C08()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E3985E98;
  *(_QWORD *)(inited + 40) = &unk_1E3985DA8;
  *(_QWORD *)(inited + 48) = &unk_1E3985DD8;
  *(_QWORD *)(inited + 56) = &unk_1E3985E08;
  *(_QWORD *)(inited + 64) = &unk_1E3985E38;
  *(_QWORD *)(inited + 72) = &unk_1E3985E68;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB30DE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB2FBC8();
  v24[5] = &type metadata for VersionedSchema;
  v24[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v24[2] = v2;
  v26 = 0x6D75626C41;
  v27 = 0xE500000000000000;
  strcpy((char *)v28, "Album to open");
  v28[7] = -4864;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

void sub_19AB310C0()
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
  char v69;
  _BYTE v70[56];
  uint64_t v71[5];

  sub_19AB2F860();
  v71[3] = (uint64_t)&type metadata for EntitySchema;
  v71[4] = (uint64_t)&off_1E39811C0;
  v71[0] = OUTLINED_FUNCTION_194();
  v0 = OUTLINED_FUNCTION_77_0(v71[0], (uint64_t)"PhotoAlbumEntity");
  OUTLINED_FUNCTION_36_1(v0, 0x6D75626C41);
  v2 = sub_19AB311D8(v1);
  OUTLINED_FUNCTION_2_1(v2, v3, v4, v5, v6, v7, v8, v9, v38, v41, v44, v47, v51, v53, v54, v55, v56, v57, v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    v65,
    v66,
    v67,
    v68,
    v69);
  OUTLINED_FUNCTION_7_2((uint64_t)v71, v10, v11, v12, v13, v14, v15, v16, v39, v42, v45, v48);
  OUTLINED_FUNCTION_8_8((uint64_t)v70, v17, v18, v19, v20, v21);
  v49 = sub_19AB31638();
  OUTLINED_FUNCTION_27_2();
  OUTLINED_FUNCTION_89_0();
  OUTLINED_FUNCTION_14_0(v22, v23, v24, v25, v26, v27, v28, v29, 0, (uint64_t)&v59, (uint64_t)&v53, v49);
  OUTLINED_FUNCTION_13_0((uint64_t)v70);
  OUTLINED_FUNCTION_19_2((uint64_t)v71);
  OUTLINED_FUNCTION_8_1(v30, v31, v32, v33, v34, v35, v36, v37, v40, v43, v46, v50, v52, v53, v54, v55, v56, v57, v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    v65,
    v66,
    v67,
    v68,
    v69);
  OUTLINED_FUNCTION_43();
}

uint64_t sub_19AB311D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v1 = sub_19AB2F860();
  v35[5] = &type metadata for EntitySchema;
  v35[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v35[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000010;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEE40;
  *(_QWORD *)(v2 + 32) = 0x6D75626C41;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v36 = 257;
  v35[0] = 0x746567726174;
  v35[1] = 0xE600000000000000;
  v37 = 0x6D75626C41;
  v38 = 0xE500000000000000;
  v39 = 0x6F74206D75626C41;
  v40 = 0xEF65746164707520;
  v27[2] = 3;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 1701667182;
  v27[1] = 0xE400000000000000;
  v31 = 1701667150;
  v32 = 0xE400000000000000;
  v33 = 0xD00000000000001BLL;
  v34 = 0x800000019ABB50E0;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](15);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v35, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v27, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB31638()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C00;
  *(_QWORD *)(inited + 32) = &unk_1E3982C88;
  *(_QWORD *)(inited + 40) = &unk_1E3982838;
  *(_QWORD *)(inited + 48) = &unk_1E3982A48;
  *(_QWORD *)(inited + 56) = &unk_1E3982B08;
  *(_QWORD *)(inited + 64) = &unk_1E3982B38;
  *(_QWORD *)(inited + 72) = &unk_1E3982B68;
  *(_QWORD *)(inited + 80) = &unk_1E3982B98;
  *(_QWORD *)(inited + 88) = &unk_1E3982BC8;
  *(_QWORD *)(inited + 96) = &unk_1E3982BF8;
  *(_QWORD *)(inited + 104) = &unk_1E3982C28;
  *(_QWORD *)(inited + 112) = &unk_1E3982C58;
  *(_QWORD *)(inited + 120) = &unk_1E3982868;
  *(_QWORD *)(inited + 128) = &unk_1E3982898;
  *(_QWORD *)(inited + 136) = &unk_1E39828C8;
  *(_QWORD *)(inited + 144) = &unk_1E39828F8;
  *(_QWORD *)(inited + 152) = &unk_1E3982928;
  *(_QWORD *)(inited + 160) = &unk_1E3982958;
  *(_QWORD *)(inited + 168) = &unk_1E3982988;
  *(_QWORD *)(inited + 176) = &unk_1E39829B8;
  *(_QWORD *)(inited + 184) = &unk_1E39829E8;
  *(_QWORD *)(inited + 192) = &unk_1E3982A18;
  *(_QWORD *)(inited + 200) = &unk_1E3982A78;
  *(_QWORD *)(inited + 208) = &unk_1E3982AA8;
  *(_QWORD *)(inited + 216) = &unk_1E3982AD8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 224)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB318CC()
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
  char v37;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
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
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  ValueMetadata *v192;
  _UNKNOWN **v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;

  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_54_0();
  sub_19AB310C0();
  sub_19AB31AB4((uint64_t)&v205);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_48_1(v3, v4, &qword_1EE3B9EA0, v5, v6, v7, v8, v9, v79, v87, v95, v103, v110, v117, v124, v131, v138, v145, v152,
    v159,
    v165,
    v171,
    v177,
    v183,
    v189,
    v190,
    v191,
    (uint64_t)v192,
    (uint64_t)v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205);
  OUTLINED_FUNCTION_53_0(v1 + 104, (uint64_t)&v195);
  OUTLINED_FUNCTION_58_0(v1 + 144, v10, (uint64_t *)&unk_1EE3B9EB0, v11, v12, v13, v14, v15, v80, v88, v96, v104, v111, v118, v125, v132, v139, v146, v153);
  OUTLINED_FUNCTION_26_3(v16, v17, v18, v19, v20, v21, v22, v23, v81, v89, v97, v105, v112, v119, v126, v133, v140, v147, v154,
    v160,
    v166,
    v172,
    v178,
    v184,
    v189,
    v190,
    v191,
    (uint64_t)v192,
    (uint64_t)v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210,
    v211,
    v212,
    v213,
    v214,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227);
  OUTLINED_FUNCTION_79();
  if (v37)
  {
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_307();
    v30 = OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_65_0(v30, &qword_1EE3B9EA8, v31, v32, v33, v34, v35, v36, v82, v90, v98, v106, v113);
  }
  else
  {
    OUTLINED_FUNCTION_46_0(v24, v25, v26, v27, v28, v29);
    OUTLINED_FUNCTION_37_0();
    if (v37)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v44 = OUTLINED_FUNCTION_120();
    }
    else
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v38 = OUTLINED_FUNCTION_120();
      v44 = OUTLINED_FUNCTION_63_0(v38, v39, v40, v41, v42, v43);
    }
    OUTLINED_FUNCTION_42_0(v44, v45, v46, v47, v48, v49, v50, v51, v82, v90, v98);
  }
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_45_0(v52, v53, v54, v55, v56, v57, v58, v59, v83, v91, v99, v106, v113, v120, v127, v134, v141, v148, v155,
    v161,
    v167,
    v173,
    v179,
    v185,
    v189,
    v190,
    v191,
    (uint64_t)v192,
    (uint64_t)v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200);
  v228 = v0;
  sub_19AA19568((uint64_t)&v195, (uint64_t)&OBJC_PROTOCOL___NSObject.prots, &qword_1EE3B9EA8);
  OUTLINED_FUNCTION_75_0((uint64_t)&v189, v60, (uint64_t *)&unk_1EE3B9EB0);
  v229 = v1;
  OUTLINED_FUNCTION_13_0((uint64_t)&v205);
  OUTLINED_FUNCTION_61_0(v61, v62, v63, v64, v65, v66, v67, v68, v84, v92, v100, v107, v114, v121, v128, v135, v142, v149, v156,
    v162,
    v168,
    v174,
    v180,
    v186,
    v189,
    v190,
    v191,
    (uint64_t)v192,
    (uint64_t)v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210);
  v69 = sub_19AB2FBC8();
  v192 = &type metadata for VersionedSchema;
  v193 = &off_1E398E380;
  v70 = OUTLINED_FUNCTION_194();
  v189 = v70;
  *(_QWORD *)(v70 + 16) = 0;
  *(_QWORD *)(v70 + 24) = 0;
  *(_BYTE *)(v70 + 32) = 0;
  *(_QWORD *)(v70 + 40) = v69;
  OUTLINED_FUNCTION_12_0(v2, (uint64_t)&v205);
  sub_19A9EE838((uint64_t)&v189, (uint64_t)&v200, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&OBJC_PROTOCOL___NSObject.inst_props, (uint64_t)&v210, (uint64_t *)&unk_1EE3B9EB0);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_307();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_22_4((uint64_t)&v205, (uint64_t)&v210, v85, v93, v101, v108, v115, v122, v129, v136, v143, v150, v157, v163, v169, v175, v181, v187, v189,
    v190,
    v191,
    (uint64_t)v192,
    (uint64_t)v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200);
  sub_19A9FEB08((uint64_t)&v189, &qword_1EE3B9EA8);
  OUTLINED_FUNCTION_70_0(v71, v72, v73, v74, v75, v76, v77, v78, v86, v94, v102, v109, v116, v123, v130, v137, v144, v151, v158,
    v164,
    v170,
    v176,
    v182,
    v188,
    v189,
    v190,
    v191,
    (uint64_t)v192,
    (uint64_t)v193,
    v194,
    v195,
    v196,
    v197,
    v198,
    v199,
    v200,
    v201,
    v202,
    v203,
    v204,
    v205,
    v206,
    v207,
    v208,
    v209,
    v210,
    v211,
    v212,
    v213,
    v214,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_19AB31AB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v1 = sub_19AB2FBC8();
  v25[5] = &type metadata for VersionedSchema;
  v25[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v26 = 257;
  v25[0] = 0x6D75626C61;
  v25[1] = 0xE500000000000000;
  v25[2] = v2;
  v27 = 0x6D75626C41;
  v28 = 0xE500000000000000;
  v29 = 0x6F74206D75626C41;
  v30 = 0xEF65746164707520;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  sub_19AA463C8();
  v24 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v25, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v24;
  v7 = v14;
  v8 = v15;
  v9 = sub_19AB31DA4((uint64_t)&v14);
  sub_19A9FEB08((uint64_t)&v14, &qword_1EE3B9EA0);
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = v9;
  v11 = sub_19AAFE518(a1, &v14, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB31DA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x656C746974;
  *(_QWORD *)(v3 + 24) = 0xE500000000000000;
  *(_QWORD *)(v3 + 32) = 3;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 1701667150;
  *(_QWORD *)(v3 + 88) = 0xE400000000000000;
  *(_QWORD *)(v3 + 96) = 0xD00000000000001BLL;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB50E0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB31ECC: call analysis failed (funcsize=34)"

uint64_t sub_19AB31F50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2F860();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000010;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEE40;
  *(_QWORD *)(v3 + 32) = 0x6D75626C41;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x7365697469746E65;
  v25[1] = 0xE800000000000000;
  v25[2] = v1;
  v27 = 0x736D75626C41;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000014;
  v30 = 0x800000019ABB5080;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB32284()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C00;
  *(_QWORD *)(inited + 32) = &unk_1E3982418;
  *(_QWORD *)(inited + 40) = &unk_1E3981FC8;
  *(_QWORD *)(inited + 48) = &unk_1E39821D8;
  *(_QWORD *)(inited + 56) = &unk_1E3982298;
  *(_QWORD *)(inited + 64) = &unk_1E39822C8;
  *(_QWORD *)(inited + 72) = &unk_1E39822F8;
  *(_QWORD *)(inited + 80) = &unk_1E3982328;
  *(_QWORD *)(inited + 88) = &unk_1E3982358;
  *(_QWORD *)(inited + 96) = &unk_1E3982388;
  *(_QWORD *)(inited + 104) = &unk_1E39823B8;
  *(_QWORD *)(inited + 112) = &unk_1E39823E8;
  *(_QWORD *)(inited + 120) = &unk_1E3981FF8;
  *(_QWORD *)(inited + 128) = &unk_1E3982028;
  *(_QWORD *)(inited + 136) = &unk_1E3982058;
  *(_QWORD *)(inited + 144) = &unk_1E3982088;
  *(_QWORD *)(inited + 152) = &unk_1E39820B8;
  *(_QWORD *)(inited + 160) = &unk_1E39820E8;
  *(_QWORD *)(inited + 168) = &unk_1E3982118;
  *(_QWORD *)(inited + 176) = &unk_1E3982148;
  *(_QWORD *)(inited + 184) = &unk_1E3982178;
  *(_QWORD *)(inited + 192) = &unk_1E39821A8;
  *(_QWORD *)(inited + 200) = &unk_1E3982208;
  *(_QWORD *)(inited + 208) = &unk_1E3982238;
  *(_QWORD *)(inited + 216) = &unk_1E3982268;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 224)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB32518(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2FBC8();
  *(_QWORD *)(v1 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v1 + 48) = &off_1E398E380;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = v2;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x736D75626C61;
  v25[1] = 0xE600000000000000;
  v25[2] = v1;
  v27 = 0x736D75626C41;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000014;
  v30 = 0x800000019ABB5080;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

void sub_19AB32810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[48];
  _BYTE v15[40];
  _BYTE v16[40];
  _BYTE v17[40];
  _BYTE v18[48];
  _BYTE v19[24];
  __int128 v20;

  OUTLINED_FUNCTION_64_0();
  v20 = xmmword_19AB88C40;
  v0 = OUTLINED_FUNCTION_194();
  sub_19AB2F2B4();
  *(_QWORD *)(v0 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v0 + 48) = &off_1E39811C0;
  v1 = OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_24_4(v1);
  sub_19AB32934(v2);
  OUTLINED_FUNCTION_17_7((uint64_t)v17, (uint64_t)v16);
  OUTLINED_FUNCTION_16_5((uint64_t)v19, (uint64_t)v15);
  OUTLINED_FUNCTION_12_0((uint64_t)v18, (uint64_t)v14);
  sub_19AB32BF8();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_59();
  v3 = OUTLINED_FUNCTION_90_0(17);
  OUTLINED_FUNCTION_14_0(v3, v5, v4 & 0xFFFFFFFFFFFFLL | 0x5020000000000000, 0xED0000736F746F68, v6, v7, v8, v9, v10, v11, v12, v13);
  OUTLINED_FUNCTION_13_0((uint64_t)v18);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_18_5((uint64_t)v17);
  OUTLINED_FUNCTION_32_2();
}

uint64_t sub_19AB32934(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v12;
  unint64_t v13;
  ValueMetadata *v14;
  _UNKNOWN **v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[7];
  __int16 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 8;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_BYTE *)(v1 + 56) = 4;
  v24 = 258;
  v23[0] = 0x73656C6966;
  v23[1] = 0xE500000000000000;
  v23[2] = v1;
  v25 = 0x73656C6946;
  v26 = 0xE500000000000000;
  v27 = 0xD00000000000001BLL;
  v28 = 0x800000019ABB5040;
  v12 = 0;
  v13 = 0xE000000000000000;
  MEMORY[0x19AECE804](21);
  v2 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v22 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v23, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v20 = 0;
  v21 = 0xE000000000000000;
  v18 = 37;
  v19 = 0xE100000000000000;
  v16 = 9509;
  v17 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v12;
  v7 = v13;
  v14 = &type metadata for Summary;
  v15 = &off_1E399A1E0;
  v8 = (_QWORD *)swift_allocObject();
  v12 = v8;
  v8[2] = v22;
  v8[3] = v6;
  v8[4] = v7;
  v8[5] = v2;
  v9 = sub_19AAFE518(a1, &v12, v2);
  sub_19A9FEB08((uint64_t)v23, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v12);
  return v9;
}

uint64_t sub_19AB32BF8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E3981F98;
  *(_QWORD *)(inited + 40) = &unk_1E3981C08;
  *(_QWORD *)(inited + 48) = &unk_1E3981DE8;
  *(_QWORD *)(inited + 56) = &unk_1E3981E18;
  *(_QWORD *)(inited + 64) = &unk_1E3981E48;
  *(_QWORD *)(inited + 72) = &unk_1E3981E78;
  *(_QWORD *)(inited + 80) = &unk_1E3981EA8;
  *(_QWORD *)(inited + 88) = &unk_1E3981ED8;
  *(_QWORD *)(inited + 96) = &unk_1E3981F08;
  *(_QWORD *)(inited + 104) = &unk_1E3981F38;
  *(_QWORD *)(inited + 112) = &unk_1E3981F68;
  *(_QWORD *)(inited + 120) = &unk_1E3981C38;
  *(_QWORD *)(inited + 128) = &unk_1E3981C68;
  *(_QWORD *)(inited + 136) = &unk_1E3981C98;
  *(_QWORD *)(inited + 144) = &unk_1E3981CC8;
  *(_QWORD *)(inited + 152) = &unk_1E3981CF8;
  *(_QWORD *)(inited + 160) = &unk_1E3981D28;
  *(_QWORD *)(inited + 168) = &unk_1E3981D58;
  *(_QWORD *)(inited + 176) = &unk_1E3981D88;
  *(_QWORD *)(inited + 184) = &unk_1E3981DB8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB32E64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[48];
  _BYTE v15[40];
  _BYTE v16[40];
  _QWORD v17[5];
  char v18;
  _QWORD v19[6];
  char v20;
  _QWORD v21[6];
  _QWORD v22[13];

  OUTLINED_FUNCTION_80();
  sub_19AB32810();
  v0 = OUTLINED_FUNCTION_194();
  v1 = sub_19AB2F784();
  *(_QWORD *)(v0 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v0 + 48) = &off_1E398E380;
  v2 = OUTLINED_FUNCTION_194();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  *(_BYTE *)(v0 + 56) = 1;
  v17[0] = v0;
  v18 = 2;
  v3 = v19[5];
  sub_19A9EE838((uint64_t)v21, (uint64_t)v16, &qword_1EE3B9EA0);
  v4 = v21[5];
  v5 = v20;
  sub_19A9EE838((uint64_t)v22, (uint64_t)v15, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)v17, (uint64_t)v14, (uint64_t *)&unk_1EE3B9EB0);
  v6 = v22[11];
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_124();
  v7 = OUTLINED_FUNCTION_66_0();
  sub_19AAFB8AC(v7, v8, v9, v10, v11, v3, v12, v4, v13, v5, (uint64_t)v15, (uint64_t)v14, v6);
  sub_19A9FEB08((uint64_t)v17, (uint64_t *)&unk_1EE3B9EB0);
  sub_19AA19690((uint64_t)v19);
  OUTLINED_FUNCTION_38();
}

#error "19AB32FE8: call analysis failed (funcsize=39)"

uint64_t sub_19AB3305C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB2F2B4();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6F746F6850;
  v27 = 0xE500000000000000;
  strcpy((char *)v28, "Photo to open");
  v28[7] = -4864;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB33360()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C60;
  *(_QWORD *)(inited + 32) = &unk_1E39860A8;
  *(_QWORD *)(inited + 40) = &unk_1E3985EC8;
  *(_QWORD *)(inited + 48) = &unk_1E3985EF8;
  *(_QWORD *)(inited + 56) = &unk_1E3985F28;
  *(_QWORD *)(inited + 64) = &unk_1E3985F58;
  *(_QWORD *)(inited + 72) = &unk_1E3985F88;
  *(_QWORD *)(inited + 80) = &unk_1E3985FB8;
  *(_QWORD *)(inited + 88) = &unk_1E3985FE8;
  *(_QWORD *)(inited + 96) = &unk_1E3986018;
  *(_QWORD *)(inited + 104) = &unk_1E3986048;
  *(_QWORD *)(inited + 112) = &unk_1E3986078;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 120)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB3356C()
{
  uint64_t (*v0)(_BYTE *);
  uint64_t (*v1)(_BYTE *);
  void (*v2)(_QWORD *__return_ptr);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
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
  uint64_t v25[6];
  _BYTE v26[40];
  _BYTE v27[40];
  _QWORD v28[6];
  char v29;
  uint64_t v30;
  _QWORD v31[8];

  OUTLINED_FUNCTION_80();
  v1 = v0;
  v2(v28);
  v3 = v1(v27);
  v4 = v28[4];
  v5 = v28[5];
  OUTLINED_FUNCTION_58_0((uint64_t)v27, v6, &qword_1EE3B9EA0, v7, v8, v9, v10, v11, v20, v21, v22, v23, v24, v25[0], v25[1], v25[2], v25[3], v25[4], v25[5]);
  v12 = v29;
  sub_19A9EE838((uint64_t)&v30, (uint64_t)v26, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)v31, (uint64_t)v25, (uint64_t *)&unk_1EE3B9EB0);
  v13 = v31[6];
  OUTLINED_FUNCTION_307();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_124();
  v14 = OUTLINED_FUNCTION_80_0();
  sub_19AAFB8AC(v14, v15, v16, v17, v4, v5, v18, v3, v19, v12, (uint64_t)v26, (uint64_t)v25, v13);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EA0);
  sub_19AA19690((uint64_t)v28);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_19AB33654(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB2F784();
  v24[5] = &type metadata for VersionedSchema;
  v24[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v24[2] = v2;
  v26 = 0x6F746F6850;
  v27 = 0xE500000000000000;
  strcpy((char *)v28, "Photo to open");
  v28[7] = -4864;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

#error "19AB339D8: call analysis failed (funcsize=51)"

uint64_t sub_19AB33A40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  unint64_t v16;
  ValueMetadata *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  __int16 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v1 = swift_allocObject();
  v2 = sub_19AB2F2B4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v3 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v3 + 32) = 0x6F746F6850;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v27 = 258;
  v26[0] = 0x746567726174;
  v26[1] = 0xE600000000000000;
  v26[2] = v1;
  v28 = 0x736F746F6850;
  v29 = 0xE600000000000000;
  v30 = 0xD000000000000010;
  v31 = 0x800000019ABB5230;
  v15 = 0;
  v16 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  sub_19AA463C8();
  v25 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v26, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v23 = 0;
  v24 = 0xE000000000000000;
  v21 = 37;
  v22 = 0xE100000000000000;
  v19 = 9509;
  v20 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v25;
  v8 = v15;
  v9 = v16;
  v10 = sub_19AB33D88((uint64_t)&v15);
  sub_19A9FEB08((uint64_t)&v15, &qword_1EE3B9EA0);
  v17 = &type metadata for Summary;
  v18 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v15 = v11;
  v11[2] = v7;
  v11[3] = v8;
  v11[4] = v9;
  v11[5] = v10;
  v12 = sub_19AAFE518(a1, &v15, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v26, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
  return v12;
}

uint64_t sub_19AB33D88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[7];
  __int16 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD v17[7];
  __int16 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 3;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_BYTE *)(v2 + 56) = 4;
  v18 = 259;
  v17[0] = 1701667182;
  v17[1] = 0xE400000000000000;
  v17[2] = v2;
  v19 = 1701667150;
  v20 = 0xE400000000000000;
  v21 = 0xD00000000000001ELL;
  v22 = 0x800000019ABB5250;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 2;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  v12 = 259;
  v11[0] = 0x6E65646469487369;
  v11[1] = 0xE800000000000000;
  v11[2] = v3;
  v13 = 0x6E6564646948;
  v14 = 0xE600000000000000;
  v15 = 0xD000000000000019;
  v16 = 0x800000019ABB4F60;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 2;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_BYTE *)(v4 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88C30;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v7;
  sub_19A9EE838((uint64_t)v17, v7 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 96) = v6;
  *(_QWORD *)(v5 + 104) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v5 + 72) = v8;
  sub_19A9EE838((uint64_t)v11, v8 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 136) = v6;
  *(_QWORD *)(v5 + 144) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v5 + 112) = v9;
  *(_QWORD *)(v9 + 16) = 0x69726F7661467369;
  *(_QWORD *)(v9 + 24) = 0xEA00000000006574;
  *(_QWORD *)(v9 + 32) = v4;
  *(_BYTE *)(v9 + 72) = 3;
  *(_BYTE *)(v9 + 73) = 1;
  *(_QWORD *)(v9 + 80) = 0x657469726F766146;
  *(_QWORD *)(v9 + 88) = 0xE800000000000000;
  *(_QWORD *)(v9 + 96) = 0xD000000000000025;
  *(_QWORD *)(v9 + 104) = 0x800000019ABB5270;
  sub_19A9FEB08((uint64_t)v11, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v17, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v5;
}

uint64_t sub_19AB3401C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97AB0;
  *(_QWORD *)(inited + 32) = &unk_1E3983198;
  *(_QWORD *)(inited + 40) = &unk_1E3982CB8;
  *(_QWORD *)(inited + 48) = &unk_1E3982EC8;
  *(_QWORD *)(inited + 56) = &unk_1E3983018;
  *(_QWORD *)(inited + 64) = &unk_1E3983048;
  *(_QWORD *)(inited + 72) = &unk_1E3983078;
  *(_QWORD *)(inited + 80) = &unk_1E39830A8;
  *(_QWORD *)(inited + 88) = &unk_1E39830D8;
  *(_QWORD *)(inited + 96) = &unk_1E3983108;
  *(_QWORD *)(inited + 104) = &unk_1E3983138;
  *(_QWORD *)(inited + 112) = &unk_1E3983168;
  *(_QWORD *)(inited + 120) = &unk_1E3982CE8;
  *(_QWORD *)(inited + 128) = &unk_1E3982D18;
  *(_QWORD *)(inited + 136) = &unk_1E3982D48;
  *(_QWORD *)(inited + 144) = &unk_1E3982D78;
  *(_QWORD *)(inited + 152) = &unk_1E3982DA8;
  *(_QWORD *)(inited + 160) = &unk_1E3982DD8;
  *(_QWORD *)(inited + 168) = &unk_1E3982E08;
  *(_QWORD *)(inited + 176) = &unk_1E3982E38;
  *(_QWORD *)(inited + 184) = &unk_1E3982E68;
  *(_QWORD *)(inited + 192) = &unk_1E3982E98;
  *(_QWORD *)(inited + 200) = &unk_1E3982EF8;
  *(_QWORD *)(inited + 208) = &unk_1E3982F28;
  *(_QWORD *)(inited + 216) = &unk_1E3982F58;
  *(_QWORD *)(inited + 224) = &unk_1E3982F88;
  *(_QWORD *)(inited + 232) = &unk_1E3982FB8;
  *(_QWORD *)(inited + 240) = &unk_1E3982FE8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 248)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB342D0()
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
  char v27;
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
  char v69;
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
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __n128 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  uint64_t v147;
  ValueMetadata *v148;
  _UNKNOWN **v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  _BYTE v164[48];
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;

  OUTLINED_FUNCTION_80();
  v166 = v0;
  v167 = v1;
  v151 = 0;
  v152 = 0;
  v153 = 0;
  OUTLINED_FUNCTION_50_1((__n128)xmmword_19AB88C40);
  v3 = sub_19AB346D0(v2);
  sub_19A9EE838((uint64_t)&v141, (uint64_t)&v136, &qword_1EE3B9EA0);
  OUTLINED_FUNCTION_60_0(v4, v5, v6, v7, v8, v9, v10, v11, v89, v95, 4, 0, v109, v115, v116, v117, v118, v119, v120,
    v121,
    v122,
    v123,
    v124,
    v125,
    v126,
    v127,
    v128,
    v129,
    v130,
    v131,
    v132,
    v133,
    v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    v144,
    v145,
    v146,
    *((uint64_t *)&v146 + 1),
    v147,
    (uint64_t)v148,
    (uint64_t)v149,
    v150,
    v151);
  sub_19A9EE838((uint64_t)&v146, (uint64_t)&v125, (uint64_t *)&unk_1EE3B9EB0);
  v12 = sub_19AB34ADC();
  v156 = 0xD000000000000012;
  v157 = 0x800000019ABB4F00;
  OUTLINED_FUNCTION_86_0();
  OUTLINED_FUNCTION_44_1(0xD00000000000001BLL, v90, v96, v100, v105, v110, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127,
    v128,
    v129,
    v130,
    v131,
    v132,
    v133,
    v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    v144,
    v145,
    v146,
    *((uint64_t *)&v146 + 1),
    v147,
    (uint64_t)v148,
    (uint64_t)v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155,
    v156,
    v157,
    v13,
    0xEE006F746F685020,
    v158,
    v159);
  if (v123 == 4)
  {
    sub_19A9FEB08((uint64_t)&v120, &qword_1EE3B9EA8);
  }
  else
  {
    v19 = OUTLINED_FUNCTION_88(v14, v15, v16, v17, v18);
    if ((v118 | 2) == 2)
    {
      OUTLINED_FUNCTION_69_0(v19, v20, v21, v22, v23, v24, v25, v26, v91, v97);
      v27 = 1;
      goto LABEL_7;
    }
    v28 = sub_19AA19700((uint64_t)&v115);
    OUTLINED_FUNCTION_69_0(v28, v29, v30, v31, v32, v33, v34, v35, v91, v97);
  }
  v27 = 0;
LABEL_7:
  v160 = v27;
  sub_19AA19568((uint64_t)&v136, (uint64_t)&v161, &qword_1EE3B9EA0);
  v162 = v3;
  sub_19AA19568((uint64_t)&v131, (uint64_t)&v163, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)&v125, (uint64_t)v164, (uint64_t *)&unk_1EE3B9EB0);
  v165 = v12;
  OUTLINED_FUNCTION_13_0((uint64_t)&v146);
  sub_19A9FEB08((uint64_t)&v151, &qword_1EE3B9EA8);
  OUTLINED_FUNCTION_19_2((uint64_t)&v141);
  v148 = &type metadata for IntentSchema;
  v149 = &off_1E3981258;
  v36 = OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_67(v36, v37, v38, v39, v40, v41, v42, v43, v91, v97, v101, v106, v111, v115, v116, v117, v118, v119, v120,
    v121,
    v122,
    v123,
    v124,
    v125,
    v126,
    v127,
    v128,
    v129,
    v130,
    v131,
    v132,
    v133,
    v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    v144,
    v145,
    v146,
    *((uint64_t *)&v146 + 1),
    v147,
    (uint64_t)v148,
    (uint64_t)v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155,
    v156);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v44 = OUTLINED_FUNCTION_194();
  *(_OWORD *)(v44 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v146, v44 + 32);
  sub_19AA19690((uint64_t)&v156);
  v151 = 0;
  v152 = 0;
  v153 = 0;
  OUTLINED_FUNCTION_50_1(v102);
  v46 = sub_19AB34CB4(v45);
  OUTLINED_FUNCTION_16_5((uint64_t)&v141, (uint64_t)&v136);
  OUTLINED_FUNCTION_60_0(v47, v48, v49, v50, v51, v52, v53, v54, 1, 2, v102.n128_i64[0], v102.n128_i64[1], v112, v115, v116, v117, v118, v119, v120,
    v121,
    v122,
    v123,
    v124,
    v125,
    v126,
    v127,
    v128,
    v129,
    v130,
    v131,
    v132,
    v133,
    v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    v144,
    v145,
    v146,
    *((uint64_t *)&v146 + 1),
    v147,
    (uint64_t)v148,
    (uint64_t)v149,
    v150,
    v151);
  OUTLINED_FUNCTION_12_0((uint64_t)&v146, (uint64_t)&v125);
  v55 = sub_19AB350BC();
  OUTLINED_FUNCTION_44_1(0xD000000000000017, v92, v98, v103, v107, v113, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127,
    v128,
    v129,
    v130,
    v131,
    v132,
    v133,
    v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    v144,
    v145,
    v146,
    *((uint64_t *)&v146 + 1),
    v147,
    (uint64_t)v148,
    (uint64_t)v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155,
    0x6964654D65646948,
    0xEE00746573734161,
    0x6F68502065646948,
    0xEA00000000006F74,
    v158,
    v159);
  if (v123 == 4)
  {
    sub_19A9FEB08((uint64_t)&v120, &qword_1EE3B9EA8);
LABEL_12:
    v69 = 0;
    goto LABEL_13;
  }
  v61 = OUTLINED_FUNCTION_88(v56, v57, v58, v59, v60);
  if ((v118 | 2) != 2)
  {
    v70 = sub_19AA19700((uint64_t)&v115);
    OUTLINED_FUNCTION_69_0(v70, v71, v72, v73, v74, v75, v76, v77, v93, v99);
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_69_0(v61, v62, v63, v64, v65, v66, v67, v68, v93, v99);
  v69 = 1;
LABEL_13:
  v160 = v69;
  sub_19AA19568((uint64_t)&v136, (uint64_t)&v161, &qword_1EE3B9EA0);
  v162 = v46;
  sub_19AA19568((uint64_t)&v131, (uint64_t)&v163, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)&v125, (uint64_t)v164, (uint64_t *)&unk_1EE3B9EB0);
  v165 = v55;
  sub_19A9FEB08((uint64_t)&v146, (uint64_t *)&unk_1EE3B9EB0);
  OUTLINED_FUNCTION_13_0((uint64_t)&v151);
  sub_19A9FEB08((uint64_t)&v141, &qword_1EE3B9EA0);
  v148 = &type metadata for IntentSchema;
  v149 = &off_1E3981258;
  v78 = OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_67(v78, v79, v80, v81, v82, v83, v84, v85, v93, v99, v104, v108, v114, v115, v116, v117, v118, v119, v120,
    v121,
    v122,
    v123,
    v124,
    v125,
    v126,
    v127,
    v128,
    v129,
    v130,
    v131,
    v132,
    v133,
    v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    v144,
    v145,
    v146,
    *((uint64_t *)&v146 + 1),
    v147,
    (uint64_t)v148,
    (uint64_t)v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155,
    v156);
  v86 = OUTLINED_FUNCTION_194();
  *(_OWORD *)(v86 + 16) = v94;
  sub_19AA19678(&v146, v86 + 32);
  sub_19AA19690((uint64_t)&v156);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  v87 = OUTLINED_FUNCTION_194();
  *(_OWORD *)(v87 + 16) = xmmword_19AB88CA0;
  *(_QWORD *)(v87 + 32) = v44;
  *(_QWORD *)(v87 + 40) = v86;
  v156 = MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_74();
  sub_19AA47FF0();
  OUTLINED_FUNCTION_120();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v156;
}

uint64_t sub_19AB346D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  unint64_t v16;
  ValueMetadata *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  __int16 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v1 = swift_allocObject();
  v2 = sub_19AB2F784();
  *(_QWORD *)(v1 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v1 + 48) = &off_1E398E380;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = v2;
  *(_BYTE *)(v1 + 56) = 1;
  v27 = 258;
  v26[0] = 0x737465737361;
  v26[1] = 0xE600000000000000;
  v26[2] = v1;
  v28 = 0x736F746F6850;
  v29 = 0xE600000000000000;
  v30 = 0xD000000000000011;
  v31 = 0x800000019ABB4F80;
  v15 = 0;
  v16 = 0xE000000000000000;
  MEMORY[0x19AECE804](11);
  sub_19AA463C8();
  v25 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v26, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v23 = 0;
  v24 = 0xE000000000000000;
  v21 = 37;
  v22 = 0xE100000000000000;
  v19 = 9509;
  v20 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v25;
  v8 = v15;
  v9 = v16;
  v10 = sub_19AB349EC((uint64_t)&v15);
  sub_19A9FEB08((uint64_t)&v15, &qword_1EE3B9EA0);
  v17 = &type metadata for Summary;
  v18 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v15 = v11;
  v11[2] = v7;
  v11[3] = v8;
  v11[4] = v9;
  v11[5] = v10;
  v12 = sub_19AAFE518(a1, &v15, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v26, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
  return v12;
}

uint64_t sub_19AB349EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x657469726F766166;
  *(_QWORD *)(v3 + 24) = 0xE800000000000000;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x657469726F766146;
  *(_QWORD *)(v3 + 88) = 0xE800000000000000;
  *(_QWORD *)(v3 + 96) = 0xD00000000000001DLL;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4FA0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

uint64_t sub_19AB34ADC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E3983D68;
  *(_QWORD *)(inited + 40) = &unk_1E3983C78;
  *(_QWORD *)(inited + 48) = &unk_1E3983CA8;
  *(_QWORD *)(inited + 56) = &unk_1E3983CD8;
  *(_QWORD *)(inited + 64) = &unk_1E3983D08;
  *(_QWORD *)(inited + 72) = &unk_1E3983D38;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB34CB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  unint64_t v16;
  ValueMetadata *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  __int16 v27;
  uint64_t v28;
  unint64_t v29;
  _WORD v30[8];

  v1 = swift_allocObject();
  v2 = sub_19AB2F784();
  *(_QWORD *)(v1 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v1 + 48) = &off_1E398E380;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = v2;
  *(_BYTE *)(v1 + 56) = 1;
  v27 = 258;
  v26[0] = 0x737465737361;
  v26[1] = 0xE600000000000000;
  v26[2] = v1;
  v28 = 0x736F746F6850;
  v29 = 0xE600000000000000;
  strcpy((char *)v30, "Photo to hide");
  v30[7] = -4864;
  v15 = 0;
  v16 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  sub_19AA463C8();
  v25 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v26, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v23 = 0;
  v24 = 0xE000000000000000;
  v21 = 37;
  v22 = 0xE100000000000000;
  v19 = 9509;
  v20 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v25;
  v8 = v15;
  v9 = v16;
  v10 = sub_19AB34FD0((uint64_t)&v15);
  sub_19A9FEB08((uint64_t)&v15, &qword_1EE3B9EA0);
  v17 = &type metadata for Summary;
  v18 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v15 = v11;
  v11[2] = v7;
  v11[3] = v8;
  v11[4] = v9;
  v11[5] = v10;
  v12 = sub_19AAFE518(a1, &v15, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v26, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
  return v12;
}

uint64_t sub_19AB34FD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x6E6564646968;
  *(_QWORD *)(v3 + 24) = 0xE600000000000000;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x6E6564646948;
  *(_QWORD *)(v3 + 88) = 0xE600000000000000;
  *(_QWORD *)(v3 + 96) = 0xD000000000000019;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4F60;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

uint64_t sub_19AB350BC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E3984128;
  *(_QWORD *)(inited + 40) = &unk_1E3983D98;
  *(_QWORD *)(inited + 48) = &unk_1E3983F78;
  *(_QWORD *)(inited + 56) = &unk_1E3983FA8;
  *(_QWORD *)(inited + 64) = &unk_1E3983FD8;
  *(_QWORD *)(inited + 72) = &unk_1E3984008;
  *(_QWORD *)(inited + 80) = &unk_1E3984038;
  *(_QWORD *)(inited + 88) = &unk_1E3984068;
  *(_QWORD *)(inited + 96) = &unk_1E3984098;
  *(_QWORD *)(inited + 104) = &unk_1E39840C8;
  *(_QWORD *)(inited + 112) = &unk_1E39840F8;
  *(_QWORD *)(inited + 120) = &unk_1E3983DC8;
  *(_QWORD *)(inited + 128) = &unk_1E3983DF8;
  *(_QWORD *)(inited + 136) = &unk_1E3983E28;
  *(_QWORD *)(inited + 144) = &unk_1E3983E58;
  *(_QWORD *)(inited + 152) = &unk_1E3983E88;
  *(_QWORD *)(inited + 160) = &unk_1E3983EB8;
  *(_QWORD *)(inited + 168) = &unk_1E3983EE8;
  *(_QWORD *)(inited + 176) = &unk_1E3983F18;
  *(_QWORD *)(inited + 184) = &unk_1E3983F48;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB3535C: call analysis failed (funcsize=35)"

uint64_t sub_19AB353E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2F2B4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v3 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v3 + 32) = 0x6F746F6850;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x7365697469746E65;
  v25[1] = 0xE800000000000000;
  v25[2] = v1;
  v27 = 0x736F746F6850;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000014;
  v30 = 0x800000019ABB4EA0;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB35720()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97250;
  *(_QWORD *)(inited + 32) = &unk_1E3983588;
  *(_QWORD *)(inited + 40) = &unk_1E39831C8;
  *(_QWORD *)(inited + 48) = &unk_1E39833D8;
  *(_QWORD *)(inited + 56) = &unk_1E3983408;
  *(_QWORD *)(inited + 64) = &unk_1E3983438;
  *(_QWORD *)(inited + 72) = &unk_1E3983468;
  *(_QWORD *)(inited + 80) = &unk_1E3983498;
  *(_QWORD *)(inited + 88) = &unk_1E39834C8;
  *(_QWORD *)(inited + 96) = &unk_1E39834F8;
  *(_QWORD *)(inited + 104) = &unk_1E3983528;
  *(_QWORD *)(inited + 112) = &unk_1E3983558;
  *(_QWORD *)(inited + 120) = &unk_1E39831F8;
  *(_QWORD *)(inited + 128) = &unk_1E3983228;
  *(_QWORD *)(inited + 136) = &unk_1E3983258;
  *(_QWORD *)(inited + 144) = &unk_1E3983288;
  *(_QWORD *)(inited + 152) = &unk_1E39832B8;
  *(_QWORD *)(inited + 160) = &unk_1E39832E8;
  *(_QWORD *)(inited + 168) = &unk_1E3983318;
  *(_QWORD *)(inited + 176) = &unk_1E3983348;
  *(_QWORD *)(inited + 184) = &unk_1E3983378;
  *(_QWORD *)(inited + 192) = &unk_1E39833A8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 200)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB35998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t *);
  void (*v8)(uint64_t *);
  void (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
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
  char v38;
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
  char v72;
  uint64_t v73;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160[6];
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char v180;
  _BYTE v181[40];
  void (*v182)(uint64_t *);
  uint64_t v183;
  _BYTE v184[48];
  uint64_t v185;

  OUTLINED_FUNCTION_80();
  v8 = v7;
  OUTLINED_FUNCTION_54_0();
  v9();
  v8(&v155);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_48_1(v10, v11, &qword_1EE3B9EA0, v12, v13, v14, v15, v16, v88, v93, v98, v103, v107, v111, v115, v119, v123, v127, v131,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    *((uint64_t *)&v143 + 1),
    v144,
    v145,
    v146,
    v147,
    v148,
    v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155);
  v17 = v161;
  sub_19A9EE838(v0 + 104, (uint64_t)&v145, &qword_1EE3B9EA8);
  OUTLINED_FUNCTION_58_0(v0 + 144, v18, (uint64_t *)&unk_1EE3B9EB0, v19, v20, v21, v22, v23, v89, v94, v99, v104, v108, v112, v116, v120, v124, v128, v132);
  v24 = v173;
  v174 = v4;
  v175 = v3;
  v176 = v5;
  v177 = v2;
  v178 = v6;
  v179 = v1;
  sub_19A9EE838((uint64_t)&v145, (uint64_t)&v135, &qword_1EE3B9EA8);
  OUTLINED_FUNCTION_79();
  if (v38)
  {
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_307();
    v31 = OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_65_0(v31, &qword_1EE3B9EA8, v32, v33, v34, v35, v36, v37, v90, v95, v100, v105, v109);
  }
  else
  {
    OUTLINED_FUNCTION_46_0(v25, v26, v27, v28, v29, v30);
    OUTLINED_FUNCTION_37_0();
    if (v38)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v39 = OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_42_0(v39, v40, v41, v42, v43, v44, v45, v46, v90, v95, v100);
      v17 = 1;
    }
    else
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v47 = OUTLINED_FUNCTION_120();
      v53 = OUTLINED_FUNCTION_63_0(v47, v48, v49, v50, v51, v52);
      OUTLINED_FUNCTION_42_0(v53, v54, v55, v56, v57, v58, v59, v60, v90, v95, v100);
    }
  }
  v180 = v17;
  sub_19AA19568((uint64_t)&v150, (uint64_t)v181, &qword_1EE3B9EA0);
  v182 = v8;
  sub_19AA19568((uint64_t)&v145, (uint64_t)&v183, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)&v140, (uint64_t)v184, (uint64_t *)&unk_1EE3B9EB0);
  v185 = v24;
  sub_19A9FEB08((uint64_t)&v155, &qword_1EE3B9EA0);
  OUTLINED_FUNCTION_61_0(v61, v62, v63, v64, v65, v66, v67, v68, v91, v96, v101, v105, v109, v113, v117, v121, v125, v129, v133,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    *((uint64_t *)&v143 + 1),
    v144,
    v145,
    v146,
    v147,
    v148,
    v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155,
    v156,
    v157,
    v158,
    v159,
    v160[0]);
  v140 = 0;
  v141 = 0;
  v142 = 0;
  v143 = xmmword_19AB88C40;
  v69 = v178;
  v70 = v179;
  sub_19A9EE838((uint64_t)v181, (uint64_t)&v155, &qword_1EE3B9EA0);
  v71 = (uint64_t)v182;
  v72 = v180;
  OUTLINED_FUNCTION_17_7((uint64_t)&v140, (uint64_t)&v150);
  sub_19A9EE838((uint64_t)v184, (uint64_t)v160, (uint64_t *)&unk_1EE3B9EB0);
  v73 = v185;
  OUTLINED_FUNCTION_307();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_74();
  v74 = OUTLINED_FUNCTION_80_0();
  sub_19AAFB8AC(v74, v75, v76, v77, v69, v70, v78, v71, v79, v72, (uint64_t)&v150, (uint64_t)v160, v73);
  OUTLINED_FUNCTION_18_5((uint64_t)&v140);
  OUTLINED_FUNCTION_70_0(v80, v81, v82, v83, v84, v85, v86, v87, v92, v97, v102, v106, v110, v114, v118, v122, v126, v130, v134,
    v135,
    v136,
    v137,
    v138,
    v139,
    v140,
    v141,
    v142,
    v143,
    *((uint64_t *)&v143 + 1),
    v144,
    v145,
    v146,
    v147,
    v148,
    v149,
    v150,
    v151,
    v152,
    v153,
    v154,
    v155,
    v156,
    v157,
    v158,
    v159,
    v160[0],
    v160[1],
    v160[2],
    v160[3],
    v160[4],
    v160[5],
    v161,
    v162,
    v163,
    v164,
    v165,
    v166,
    v167,
    v168,
    v169,
    v170,
    v171,
    v172);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_19AB35BBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2F784();
  *(_QWORD *)(v1 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v1 + 48) = &off_1E398E380;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = v2;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x737465737361;
  v25[1] = 0xE600000000000000;
  v25[2] = v1;
  v27 = 0x736F746F6850;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000014;
  v30 = 0x800000019ABB4EA0;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

void sub_19AB35EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[48];
  _BYTE v12[40];
  _BYTE v13[40];
  _BYTE v14[40];
  _BYTE v15[48];
  _BYTE v16[24];
  __int128 v17;

  OUTLINED_FUNCTION_64_0();
  v17 = xmmword_19AB88C40;
  v1 = OUTLINED_FUNCTION_194();
  sub_19AB2F2B4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v2 = OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_24_4(v2);
  sub_19AB35FEC(v3);
  OUTLINED_FUNCTION_17_7((uint64_t)v14, (uint64_t)v13);
  OUTLINED_FUNCTION_16_5((uint64_t)v16, (uint64_t)v12);
  OUTLINED_FUNCTION_12_0((uint64_t)v15, (uint64_t)v11);
  sub_19AB3632C();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_506();
  OUTLINED_FUNCTION_14_0(v6, v4, 0xD000000000000010, 0x800000019ABB4E60, v5, 0x800000019ABB4E80, (uint64_t)v13, v0, v7, v8, v9, v10);
  OUTLINED_FUNCTION_13_0((uint64_t)v15);
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_18_5((uint64_t)v14);
  OUTLINED_FUNCTION_32_2();
}

uint64_t sub_19AB35FEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2F2B4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v3 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v3 + 32) = 0x6F746F6850;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x7365697469746E65;
  v25[1] = 0xE800000000000000;
  v25[2] = v1;
  v27 = 0x736F746F6850;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000013;
  v30 = 0x800000019ABB4E20;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB3632C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E3984248;
  *(_QWORD *)(inited + 40) = &unk_1E3984158;
  *(_QWORD *)(inited + 48) = &unk_1E3984188;
  *(_QWORD *)(inited + 56) = &unk_1E39841B8;
  *(_QWORD *)(inited + 64) = &unk_1E39841E8;
  *(_QWORD *)(inited + 72) = &unk_1E3984218;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB36504()
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
  char v37;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
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
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  char v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;

  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_54_0();
  sub_19AB35EBC();
  sub_19AB36700((uint64_t)&v232);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_48_1(v3, v4, &qword_1EE3B9EA0, v5, v6, v7, v8, v9, v90, v99, v108, v117, v125, v133, v141, v149, v157, v165, v173,
    v181,
    v188,
    v195,
    v202,
    v209,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232);
  OUTLINED_FUNCTION_53_0(v1 + 104, (uint64_t)&v222);
  OUTLINED_FUNCTION_58_0(v1 + 144, v10, (uint64_t *)&unk_1EE3B9EB0, v11, v12, v13, v14, v15, v91, v100, v109, v118, v126, v134, v142, v150, v158, v166, v174);
  OUTLINED_FUNCTION_26_3(v16, v17, v18, v19, v20, v21, v22, v23, v92, v101, v110, v119, v127, v135, v143, v151, v159, v167, v175,
    v182,
    v189,
    v196,
    v203,
    v210,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236,
    v237,
    v238,
    v239,
    v240,
    v241,
    v242,
    v243,
    v244,
    v245,
    v246,
    v247,
    v248,
    v249,
    v250,
    v251,
    v252,
    v253,
    v254);
  OUTLINED_FUNCTION_79();
  if (v37)
  {
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_307();
    v30 = OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_65_0(v30, &qword_1EE3B9EA8, v31, v32, v33, v34, v35, v36, v93, v102, v111, v120, v128);
  }
  else
  {
    OUTLINED_FUNCTION_46_0(v24, v25, v26, v27, v28, v29);
    OUTLINED_FUNCTION_37_0();
    if (v37)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v44 = OUTLINED_FUNCTION_120();
    }
    else
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_307();
      v38 = OUTLINED_FUNCTION_120();
      v44 = OUTLINED_FUNCTION_63_0(v38, v39, v40, v41, v42, v43);
    }
    OUTLINED_FUNCTION_42_0(v44, v45, v46, v47, v48, v49, v50, v51, v93, v102, v111);
  }
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_45_0(v52, v53, v54, v55, v56, v57, v58, v59, v94, v103, v112, v120, v128, v136, v144, v152, v160, v168, v176,
    v183,
    v190,
    v197,
    v204,
    v211,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227);
  v255 = v0;
  OUTLINED_FUNCTION_75_0((uint64_t)&v222, v60, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)&v216, (uint64_t)&OBJC_PROTOCOL___NSObject.inst_props, (uint64_t *)&unk_1EE3B9EB0);
  v256 = v1;
  OUTLINED_FUNCTION_13_0((uint64_t)&v232);
  OUTLINED_FUNCTION_61_0(v61, v62, v63, v64, v65, v66, v67, v68, v95, v104, v113, v121, v129, v137, v145, v153, v161, v169, v177,
    v184,
    v191,
    v198,
    v205,
    v212,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236,
    v237);
  v69 = OUTLINED_FUNCTION_194();
  v70 = sub_19AB2F784();
  *(_QWORD *)(v69 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v69 + 48) = &off_1E398E380;
  v71 = OUTLINED_FUNCTION_194();
  *(_QWORD *)(v69 + 16) = v71;
  *(_QWORD *)(v71 + 16) = 0;
  *(_QWORD *)(v71 + 24) = 0;
  *(_BYTE *)(v71 + 32) = 0;
  *(_QWORD *)(v71 + 40) = v70;
  *(_BYTE *)(v69 + 56) = 1;
  v237 = v69;
  LOBYTE(v242) = 2;
  OUTLINED_FUNCTION_12_0(v2, (uint64_t)&v232);
  v72 = OUTLINED_FUNCTION_73_0();
  sub_19A9EE838(v72, v73, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v237, (uint64_t)&v216, (uint64_t *)&unk_1EE3B9EB0);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_307();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_22_4((uint64_t)&v232, (uint64_t)&v216, v96, v105, v114, v122, v130, v138, v146, v154, v162, v170, v178, v185, v192, v199, v206, v213, v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227);
  OUTLINED_FUNCTION_74_0(v74, v75, v76, v77, v78, v79, v80, v81, v97, v106, v115, v123, v131, v139, v147, v155, v163, v171, v179,
    v186,
    v193,
    v200,
    v207,
    v214,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236,
    v237);
  OUTLINED_FUNCTION_70_0(v82, v83, v84, v85, v86, v87, v88, v89, v98, v107, v116, v124, v132, v140, v148, v156, v164, v172, v180,
    v187,
    v194,
    v201,
    v208,
    v215,
    v216,
    v217,
    v218,
    v219,
    v220,
    v221,
    v222,
    v223,
    v224,
    v225,
    v226,
    v227,
    v228,
    v229,
    v230,
    v231,
    v232,
    v233,
    v234,
    v235,
    v236,
    v237,
    v238,
    v239,
    v240,
    v241,
    v242,
    v243,
    v244,
    v245,
    v246,
    v247,
    v248,
    v249,
    v250,
    v251,
    v252,
    v253,
    v254);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_19AB36700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2F784();
  *(_QWORD *)(v1 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v1 + 48) = &off_1E398E380;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_BYTE *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = v2;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x737465737361;
  v25[1] = 0xE600000000000000;
  v25[2] = v1;
  v27 = 0x736F746F6850;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000013;
  v30 = 0x800000019ABB4E20;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

#error "19AB36A38: call analysis failed (funcsize=35)"

uint64_t sub_19AB36AAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  _WORD v27[8];
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2F860();
  v25[5] = &type metadata for EntitySchema;
  v25[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v25[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000010;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEE40;
  *(_QWORD *)(v2 + 32) = 0x6D75626C41;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v26 = 257;
  v25[0] = 0x6C41646572616873;
  v25[1] = 0xEB000000006D7562;
  strcpy((char *)v27, "Shared Album");
  HIBYTE(v27[6]) = 0;
  v27[7] = -5120;
  v28 = 0xD000000000000017;
  v29 = 0x800000019ABB4D00;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](10);
  sub_19AA463C8();
  v24 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v25, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v24;
  v7 = v14;
  v8 = v15;
  v9 = sub_19AB36DF0((uint64_t)&v14);
  sub_19A9FEB08((uint64_t)&v14, &qword_1EE3B9EA0);
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = v9;
  v11 = sub_19AAFE518(a1, &v14, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB36DF0(uint64_t a1)
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
  _QWORD v15[7];
  __int16 v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[7];
  __int16 v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v2 = swift_allocObject();
  v3 = swift_allocObject();
  v4 = sub_19AB2F2B4();
  *(_QWORD *)(v3 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v3 + 48) = &off_1E39811C0;
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v5 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v5 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v5 + 32) = 0x6F746F6850;
  *(_QWORD *)(v5 + 40) = 0xE500000000000000;
  *(_QWORD *)(v5 + 48) = v4;
  *(_BYTE *)(v5 + 56) = 1;
  *(_BYTE *)(v3 + 56) = 1;
  *(_QWORD *)(v2 + 16) = v3;
  *(_BYTE *)(v2 + 56) = 2;
  v22 = 259;
  v21[0] = 0x737465737361;
  v21[1] = 0xE600000000000000;
  v21[2] = v2;
  v23 = 0x736F746F6850;
  v24 = 0xE600000000000000;
  v25 = 0xD000000000000013;
  v26 = 0x800000019ABB4D20;
  v6 = swift_allocObject();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 8;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_BYTE *)(v7 + 56) = 4;
  *(_QWORD *)(v6 + 16) = v7;
  *(_BYTE *)(v6 + 56) = 2;
  v15[1] = 0xE500000000000000;
  v15[2] = v6;
  v16 = 259;
  v15[0] = 0x73656C6966;
  v17 = 0x73656C6946;
  v18 = 0xE500000000000000;
  v19 = 0xD000000000000012;
  v20 = 0x800000019ABB4D40;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 3;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_BYTE *)(v8 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19AB88C30;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v9 + 56) = v10;
  *(_QWORD *)(v9 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v9 + 32) = v11;
  sub_19A9EE838((uint64_t)v21, v11 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = &off_1E398E1D8;
  v12 = swift_allocObject();
  *(_QWORD *)(v9 + 72) = v12;
  sub_19A9EE838((uint64_t)v15, v12 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v9 + 136) = v10;
  *(_QWORD *)(v9 + 144) = &off_1E398E1D8;
  v13 = swift_allocObject();
  *(_QWORD *)(v9 + 112) = v13;
  *(_QWORD *)(v13 + 16) = 0x746E656D6D6F63;
  *(_QWORD *)(v13 + 24) = 0xE700000000000000;
  *(_QWORD *)(v13 + 32) = v8;
  *(_BYTE *)(v13 + 72) = 3;
  *(_BYTE *)(v13 + 73) = 1;
  *(_QWORD *)(v13 + 80) = 0x746E656D6D6F43;
  *(_QWORD *)(v13 + 88) = 0xE700000000000000;
  *(_QWORD *)(v13 + 96) = 0xD000000000000014;
  *(_QWORD *)(v13 + 104) = 0x800000019ABB4D60;
  sub_19A9FEB08((uint64_t)v15, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v21, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v9;
}

uint64_t sub_19AB3710C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = &unk_1E39844E8;
  *(_QWORD *)(inited + 40) = &unk_1E39843F8;
  *(_QWORD *)(inited + 48) = &unk_1E3984428;
  *(_QWORD *)(inited + 56) = &unk_1E3984458;
  *(_QWORD *)(inited + 64) = &unk_1E3984488;
  *(_QWORD *)(inited + 72) = &unk_1E39844B8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB372E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  _WORD v27[8];
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2FBC8();
  v25[5] = &type metadata for VersionedSchema;
  v25[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v26 = 257;
  v25[0] = 0x6C41646572616873;
  v25[1] = 0xEB000000006D7562;
  v25[2] = v2;
  strcpy((char *)v27, "Shared Album");
  HIBYTE(v27[6]) = 0;
  v27[7] = -5120;
  v28 = 0xD000000000000017;
  v29 = 0x800000019ABB4D00;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](10);
  sub_19AA463C8();
  v24 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v25, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v24;
  v7 = v14;
  v8 = v15;
  v9 = sub_19AB375FC((uint64_t)&v14);
  sub_19A9FEB08((uint64_t)&v14, &qword_1EE3B9EA0);
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = v9;
  v11 = sub_19AAFE518(a1, &v14, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB375FC(uint64_t a1)
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
  _QWORD v15[7];
  __int16 v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[7];
  __int16 v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v2 = swift_allocObject();
  v3 = swift_allocObject();
  v4 = sub_19AB2F784();
  *(_QWORD *)(v3 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v3 + 48) = &off_1E398E380;
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v3 + 56) = 1;
  *(_QWORD *)(v2 + 16) = v3;
  *(_BYTE *)(v2 + 56) = 2;
  v22 = 259;
  v21[0] = 0x737465737361;
  v21[1] = 0xE600000000000000;
  v21[2] = v2;
  v23 = 0x736F746F6850;
  v24 = 0xE600000000000000;
  v25 = 0xD000000000000013;
  v26 = 0x800000019ABB4D20;
  v6 = swift_allocObject();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 8;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_BYTE *)(v7 + 56) = 4;
  *(_QWORD *)(v6 + 16) = v7;
  *(_BYTE *)(v6 + 56) = 2;
  v16 = 259;
  v15[0] = 0x73656C6966;
  v15[1] = 0xE500000000000000;
  v15[2] = v6;
  v17 = 0x73656C6946;
  v18 = 0xE500000000000000;
  v19 = 0xD000000000000012;
  v20 = 0x800000019ABB4D40;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 3;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_BYTE *)(v8 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19AB88C30;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v9 + 56) = v10;
  *(_QWORD *)(v9 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v9 + 32) = v11;
  sub_19A9EE838((uint64_t)v21, v11 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = &off_1E398E1D8;
  v12 = swift_allocObject();
  *(_QWORD *)(v9 + 72) = v12;
  sub_19A9EE838((uint64_t)v15, v12 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v9 + 136) = v10;
  *(_QWORD *)(v9 + 144) = &off_1E398E1D8;
  v13 = swift_allocObject();
  *(_QWORD *)(v9 + 112) = v13;
  *(_QWORD *)(v13 + 16) = 0x746E656D6D6F63;
  *(_QWORD *)(v13 + 24) = 0xE700000000000000;
  *(_QWORD *)(v13 + 32) = v8;
  *(_BYTE *)(v13 + 72) = 3;
  *(_BYTE *)(v13 + 73) = 1;
  *(_QWORD *)(v13 + 80) = 0x746E656D6D6F43;
  *(_QWORD *)(v13 + 88) = 0xE700000000000000;
  *(_QWORD *)(v13 + 96) = 0xD000000000000014;
  *(_QWORD *)(v13 + 104) = 0x800000019ABB4D60;
  sub_19A9FEB08((uint64_t)v15, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v21, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v9;
}

#error "19AB37920: call analysis failed (funcsize=35)"

uint64_t sub_19AB37998(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v19;
  unint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  __int16 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[7];
  __int16 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v1 = sub_19AB2F860();
  v36[5] = &type metadata for EntitySchema;
  v36[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v36[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000010;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEE40;
  *(_QWORD *)(v2 + 32) = 0x6D75626C41;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v37 = 257;
  v36[0] = 0x6D75626C61;
  v36[1] = 0xE500000000000000;
  v38 = 0x6D75626C41;
  v39 = 0xE500000000000000;
  v40 = 0xD000000000000016;
  v41 = 0x800000019ABB4C50;
  v3 = swift_allocObject();
  v4 = sub_19AB2F2B4();
  *(_QWORD *)(v3 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v3 + 48) = &off_1E39811C0;
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v5 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v5 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v5 + 32) = 0x6F746F6850;
  *(_QWORD *)(v5 + 40) = 0xE500000000000000;
  *(_QWORD *)(v5 + 48) = v4;
  *(_BYTE *)(v5 + 56) = 1;
  *(_BYTE *)(v3 + 56) = 1;
  v31 = 258;
  v30[0] = 0x737465737361;
  v30[1] = 0xE600000000000000;
  v30[2] = v3;
  v32 = 0x736F746F6850;
  v33 = 0xE600000000000000;
  v34 = 0xD000000000000012;
  v35 = 0x800000019ABB4C70;
  v19 = 0;
  v20 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  sub_19AA463C8();
  v29 = v6;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  sub_19A9EE838((uint64_t)v30, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v8;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v36, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v27 = 0;
  v28 = 0xE000000000000000;
  v25 = 37;
  v26 = 0xE100000000000000;
  v23 = 9509;
  v24 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v12 = v19;
  v13 = v20;
  v21 = &type metadata for Summary;
  v22 = &off_1E399A1E0;
  v14 = (_QWORD *)swift_allocObject();
  v19 = v14;
  v14[2] = v29;
  v14[3] = v12;
  v14[4] = v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v14[5] = MEMORY[0x1E0DEE9D8];
  v16 = sub_19AAFE518(a1, &v19, v15);
  sub_19A9FEB08((uint64_t)v30, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v36, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v19);
  return v16;
}

uint64_t sub_19AB37E44()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C70;
  *(_QWORD *)(inited + 32) = &unk_1E39843C8;
  *(_QWORD *)(inited + 40) = &unk_1E3984278;
  *(_QWORD *)(inited + 48) = &unk_1E39842A8;
  *(_QWORD *)(inited + 56) = &unk_1E39842D8;
  *(_QWORD *)(inited + 64) = &unk_1E3984308;
  *(_QWORD *)(inited + 72) = &unk_1E3984338;
  *(_QWORD *)(inited + 80) = &unk_1E3984368;
  *(_QWORD *)(inited + 88) = &unk_1E3984398;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 96)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB38030(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v19;
  unint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  __int16 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[7];
  __int16 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v1 = sub_19AB2FBC8();
  v36[5] = &type metadata for VersionedSchema;
  v36[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v37 = 257;
  v36[0] = 0x6D75626C61;
  v36[1] = 0xE500000000000000;
  v36[2] = v2;
  v38 = 0x6D75626C41;
  v39 = 0xE500000000000000;
  v40 = 0xD000000000000016;
  v41 = 0x800000019ABB4C50;
  v3 = swift_allocObject();
  v4 = sub_19AB2F784();
  *(_QWORD *)(v3 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v3 + 48) = &off_1E398E380;
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v3 + 56) = 1;
  v31 = 258;
  v30[0] = 0x737465737361;
  v30[1] = 0xE600000000000000;
  v30[2] = v3;
  v32 = 0x736F746F6850;
  v33 = 0xE600000000000000;
  v34 = 0xD000000000000012;
  v35 = 0x800000019ABB4C70;
  v19 = 0;
  v20 = 0xE000000000000000;
  MEMORY[0x19AECE804](12);
  sub_19AA463C8();
  v29 = v6;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  sub_19A9EE838((uint64_t)v30, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v8;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v36, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v27 = 0;
  v28 = 0xE000000000000000;
  v25 = 37;
  v26 = 0xE100000000000000;
  v23 = 9509;
  v24 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v12 = v19;
  v13 = v20;
  v21 = &type metadata for Summary;
  v22 = &off_1E399A1E0;
  v14 = (_QWORD *)swift_allocObject();
  v19 = v14;
  v14[2] = v29;
  v14[3] = v12;
  v14[4] = v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v14[5] = MEMORY[0x1E0DEE9D8];
  v16 = sub_19AAFE518(a1, &v19, v15);
  sub_19A9FEB08((uint64_t)v30, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v36, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v19);
  return v16;
}

#error "19AB384CC: call analysis failed (funcsize=35)"

uint64_t sub_19AB38544(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v19;
  unint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  __int16 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[7];
  __int16 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v1 = sub_19AB2F860();
  v36[5] = &type metadata for EntitySchema;
  v36[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v36[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000010;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEE40;
  *(_QWORD *)(v2 + 32) = 0x6D75626C41;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v37 = 257;
  v36[0] = 0x6D75626C61;
  v36[1] = 0xE500000000000000;
  v38 = 0x6D75626C41;
  v39 = 0xE500000000000000;
  v40 = 0xD00000000000001BLL;
  v41 = 0x800000019ABB4B90;
  v3 = swift_allocObject();
  v4 = sub_19AB2F2B4();
  *(_QWORD *)(v3 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v3 + 48) = &off_1E39811C0;
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v5 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v5 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v5 + 32) = 0x6F746F6850;
  *(_QWORD *)(v5 + 40) = 0xE500000000000000;
  *(_QWORD *)(v5 + 48) = v4;
  *(_BYTE *)(v5 + 56) = 1;
  *(_BYTE *)(v3 + 56) = 1;
  v31 = 258;
  v30[0] = 0x737465737361;
  v30[1] = 0xE600000000000000;
  v30[2] = v3;
  v32 = 0x736F746F6850;
  v33 = 0xE600000000000000;
  v34 = 0xD000000000000014;
  v35 = 0x800000019ABB4BB0;
  v19 = 0;
  v20 = 0xE000000000000000;
  MEMORY[0x19AECE804](17);
  sub_19AA463C8();
  v29 = v6;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  sub_19A9EE838((uint64_t)v30, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v8;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v36, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v27 = 0;
  v28 = 0xE000000000000000;
  v25 = 37;
  v26 = 0xE100000000000000;
  v23 = 9509;
  v24 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v12 = v19;
  v13 = v20;
  v21 = &type metadata for Summary;
  v22 = &off_1E399A1E0;
  v14 = (_QWORD *)swift_allocObject();
  v19 = v14;
  v14[2] = v29;
  v14[3] = v12;
  v14[4] = v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v14[5] = MEMORY[0x1E0DEE9D8];
  v16 = sub_19AAFE518(a1, &v19, v15);
  sub_19A9FEB08((uint64_t)v30, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v36, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v19);
  return v16;
}

uint64_t sub_19AB38A00()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C50;
  *(_QWORD *)(inited + 32) = &unk_1E3984998;
  *(_QWORD *)(inited + 40) = &unk_1E3984518;
  *(_QWORD *)(inited + 48) = &unk_1E3984728;
  *(_QWORD *)(inited + 56) = &unk_1E3984818;
  *(_QWORD *)(inited + 64) = &unk_1E3984848;
  *(_QWORD *)(inited + 72) = &unk_1E3984878;
  *(_QWORD *)(inited + 80) = &unk_1E39848A8;
  *(_QWORD *)(inited + 88) = &unk_1E39848D8;
  *(_QWORD *)(inited + 96) = &unk_1E3984908;
  *(_QWORD *)(inited + 104) = &unk_1E3984938;
  *(_QWORD *)(inited + 112) = &unk_1E3984968;
  *(_QWORD *)(inited + 120) = &unk_1E3984548;
  *(_QWORD *)(inited + 128) = &unk_1E3984578;
  *(_QWORD *)(inited + 136) = &unk_1E39845A8;
  *(_QWORD *)(inited + 144) = &unk_1E39845D8;
  *(_QWORD *)(inited + 152) = &unk_1E3984608;
  *(_QWORD *)(inited + 160) = &unk_1E3984638;
  *(_QWORD *)(inited + 168) = &unk_1E3984668;
  *(_QWORD *)(inited + 176) = &unk_1E3984698;
  *(_QWORD *)(inited + 184) = &unk_1E39846C8;
  *(_QWORD *)(inited + 192) = &unk_1E39846F8;
  *(_QWORD *)(inited + 200) = &unk_1E3984758;
  *(_QWORD *)(inited + 208) = &unk_1E3984788;
  *(_QWORD *)(inited + 216) = &unk_1E39847B8;
  *(_QWORD *)(inited + 224) = &unk_1E39847E8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 232)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB38CA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v19;
  unint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  __int16 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[7];
  __int16 v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v1 = sub_19AB2FBC8();
  v36[5] = &type metadata for VersionedSchema;
  v36[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v37 = 257;
  v36[0] = 0x6D75626C61;
  v36[1] = 0xE500000000000000;
  v36[2] = v2;
  v38 = 0x6D75626C41;
  v39 = 0xE500000000000000;
  v40 = 0xD00000000000001BLL;
  v41 = 0x800000019ABB4B90;
  v3 = swift_allocObject();
  v4 = sub_19AB2F784();
  *(_QWORD *)(v3 + 40) = &type metadata for VersionedSchema;
  *(_QWORD *)(v3 + 48) = &off_1E398E380;
  v5 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v3 + 56) = 1;
  v31 = 258;
  v30[0] = 0x737465737361;
  v30[1] = 0xE600000000000000;
  v30[2] = v3;
  v32 = 0x736F746F6850;
  v33 = 0xE600000000000000;
  v34 = 0xD000000000000014;
  v35 = 0x800000019ABB4BB0;
  v19 = 0;
  v20 = 0xE000000000000000;
  MEMORY[0x19AECE804](17);
  sub_19AA463C8();
  v29 = v6;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  sub_19A9EE838((uint64_t)v30, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v8;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v36, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v27 = 0;
  v28 = 0xE000000000000000;
  v25 = 37;
  v26 = 0xE100000000000000;
  v23 = 9509;
  v24 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v12 = v19;
  v13 = v20;
  v21 = &type metadata for Summary;
  v22 = &off_1E399A1E0;
  v14 = (_QWORD *)swift_allocObject();
  v19 = v14;
  v14[2] = v29;
  v14[3] = v12;
  v14[4] = v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v14[5] = MEMORY[0x1E0DEE9D8];
  v16 = sub_19AAFE518(a1, &v19, v15);
  sub_19A9FEB08((uint64_t)v30, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v36, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v19);
  return v16;
}

#error "19AB39148: call analysis failed (funcsize=36)"

uint64_t sub_19AB391D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v11;
  unint64_t v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v22[2] = 4;
  v23 = 0u;
  v24 = 0u;
  v25 = 260;
  v22[0] = 0x6169726574697263;
  v22[1] = 0xE800000000000000;
  v26 = 0x6169726574697243;
  v27 = 0xE800000000000000;
  v28 = 0xD000000000000017;
  v29 = 0x800000019ABB4B50;
  v11 = 0;
  v12 = 0xE000000000000000;
  MEMORY[0x19AECE804](20);
  v1 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v21 = v2;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v4 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v4;
  sub_19A9EE838((uint64_t)v22, v4 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v19 = 0;
  v20 = 0xE000000000000000;
  v17 = 37;
  v18 = 0xE100000000000000;
  v15 = 9509;
  v16 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v5 = v11;
  v6 = v12;
  v13 = &type metadata for Summary;
  v14 = &off_1E399A1E0;
  v7 = (_QWORD *)swift_allocObject();
  v11 = v7;
  v7[2] = v21;
  v7[3] = v5;
  v7[4] = v6;
  v7[5] = v1;
  v8 = sub_19AAFE518(a1, &v11, v1);
  sub_19A9FEB08((uint64_t)v22, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v11);
  return v8;
}

uint64_t sub_19AB39490()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C60;
  *(_QWORD *)(inited + 32) = &unk_1E3985508;
  *(_QWORD *)(inited + 40) = &unk_1E3985208;
  *(_QWORD *)(inited + 48) = &unk_1E3985358;
  *(_QWORD *)(inited + 56) = &unk_1E3985388;
  *(_QWORD *)(inited + 64) = &unk_1E39853B8;
  *(_QWORD *)(inited + 72) = &unk_1E39853E8;
  *(_QWORD *)(inited + 80) = &unk_1E3985418;
  *(_QWORD *)(inited + 88) = &unk_1E3985448;
  *(_QWORD *)(inited + 96) = &unk_1E3985478;
  *(_QWORD *)(inited + 104) = &unk_1E39854A8;
  *(_QWORD *)(inited + 112) = &unk_1E39854D8;
  *(_QWORD *)(inited + 120) = &unk_1E3985238;
  *(_QWORD *)(inited + 128) = &unk_1E3985268;
  *(_QWORD *)(inited + 136) = &unk_1E3985298;
  *(_QWORD *)(inited + 144) = &unk_1E39852C8;
  *(_QWORD *)(inited + 152) = &unk_1E39852F8;
  *(_QWORD *)(inited + 160) = &unk_1E3985328;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 168)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB396E0()
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
  unint64_t v22;
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
  char v67;
  _BYTE v68[56];
  uint64_t v69[5];

  sub_19AB2FC90();
  v69[3] = (uint64_t)&type metadata for EntitySchema;
  v69[4] = (uint64_t)&off_1E39811C0;
  v69[0] = OUTLINED_FUNCTION_194();
  v0 = OUTLINED_FUNCTION_77_0(v69[0], (uint64_t)"PhotoPersonEntity");
  OUTLINED_FUNCTION_36_1(v0, 0x6E6F73726550);
  v2 = sub_19AB39808(v1);
  OUTLINED_FUNCTION_2_1(v2, v3, v4, v5, v6, v7, v8, v9, v36, v39, v42, v45, v49, v51, v52, v53, v54, v55, v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    v65,
    v66,
    v67);
  OUTLINED_FUNCTION_7_2((uint64_t)v69, v10, v11, v12, v13, v14, v15, v16, v37, v40, v43, v46);
  OUTLINED_FUNCTION_8_8((uint64_t)v68, v17, v18, v19, v20, v21);
  v47 = sub_19AB39D08();
  v22 = OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_14_0(v22, v23, 0x5020657461647055, 0xED00006E6F737265, v24, v25, v26, v27, 0, (uint64_t)&v57, (uint64_t)&v51, v47);
  OUTLINED_FUNCTION_13_0((uint64_t)v68);
  OUTLINED_FUNCTION_19_2((uint64_t)v69);
  OUTLINED_FUNCTION_8_1(v28, v29, v30, v31, v32, v33, v34, v35, v38, v41, v44, v48, v50, v51, v52, v53, v54, v55, v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    v65,
    v66,
    v67);
  OUTLINED_FUNCTION_43();
}

uint64_t sub_19AB39808(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = sub_19AB2FC90();
  v25[5] = &type metadata for EntitySchema;
  v25[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v25[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000011;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEE80;
  *(_QWORD *)(v2 + 32) = 0x6E6F73726550;
  *(_QWORD *)(v2 + 40) = 0xE600000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v26 = 257;
  v25[0] = 0x746567726174;
  v25[1] = 0xE600000000000000;
  v27 = 0x6E6F73726550;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000010;
  v30 = 0x800000019ABB4A70;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  sub_19AA463C8();
  v24 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v25, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v24;
  v7 = v14;
  v8 = v15;
  v9 = sub_19AB39B18((uint64_t)&v14);
  sub_19A9FEB08((uint64_t)&v14, &qword_1EE3B9EA0);
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = v9;
  v11 = sub_19AAFE518(a1, &v14, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB39B18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[7];
  __int16 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 2;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_BYTE *)(v2 + 56) = 4;
  v10 = 259;
  v9[0] = 0x69726F7661467369;
  v9[1] = 0xEA00000000006574;
  v9[2] = v2;
  v11 = 0x657469726F766146;
  v12 = 0xE800000000000000;
  v13 = 0xD00000000000001ALL;
  v14 = 0x800000019ABB4B00;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 3;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19AB88CA0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(v4 + 32) = v6;
  sub_19A9EE838((uint64_t)v9, v6 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v4 + 96) = v5;
  *(_QWORD *)(v4 + 104) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(v4 + 72) = v7;
  *(_QWORD *)(v7 + 16) = 1701667182;
  *(_QWORD *)(v7 + 24) = 0xE400000000000000;
  *(_QWORD *)(v7 + 32) = v3;
  *(_BYTE *)(v7 + 72) = 3;
  *(_BYTE *)(v7 + 73) = 1;
  *(_QWORD *)(v7 + 80) = 1701667150;
  *(_QWORD *)(v7 + 88) = 0xE400000000000000;
  *(_QWORD *)(v7 + 96) = 0xD000000000000017;
  *(_QWORD *)(v7 + 104) = 0x800000019ABB4A90;
  sub_19A9FEB08((uint64_t)v9, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v4;
}

uint64_t sub_19AB39D08()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E3983948;
  *(_QWORD *)(inited + 40) = &unk_1E39835B8;
  *(_QWORD *)(inited + 48) = &unk_1E3983798;
  *(_QWORD *)(inited + 56) = &unk_1E39837C8;
  *(_QWORD *)(inited + 64) = &unk_1E39837F8;
  *(_QWORD *)(inited + 72) = &unk_1E3983828;
  *(_QWORD *)(inited + 80) = &unk_1E3983858;
  *(_QWORD *)(inited + 88) = &unk_1E3983888;
  *(_QWORD *)(inited + 96) = &unk_1E39838B8;
  *(_QWORD *)(inited + 104) = &unk_1E39838E8;
  *(_QWORD *)(inited + 112) = &unk_1E3983918;
  *(_QWORD *)(inited + 120) = &unk_1E39835E8;
  *(_QWORD *)(inited + 128) = &unk_1E3983618;
  *(_QWORD *)(inited + 136) = &unk_1E3983648;
  *(_QWORD *)(inited + 144) = &unk_1E3983678;
  *(_QWORD *)(inited + 152) = &unk_1E39836A8;
  *(_QWORD *)(inited + 160) = &unk_1E39836D8;
  *(_QWORD *)(inited + 168) = &unk_1E3983708;
  *(_QWORD *)(inited + 176) = &unk_1E3983738;
  *(_QWORD *)(inited + 184) = &unk_1E3983768;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB39F74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v1 = sub_19AB2FDEC();
  v35[5] = &type metadata for VersionedSchema;
  v35[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v36 = 257;
  v35[0] = 0x6E6F73726570;
  v35[1] = 0xE600000000000000;
  v35[2] = v2;
  v37 = 0x6E6F73726550;
  v38 = 0xE600000000000000;
  v39 = 0xD000000000000010;
  v40 = 0x800000019ABB4A70;
  v27[2] = 3;
  v28 = 0u;
  v29 = 0u;
  v30 = 260;
  v27[0] = 1701667182;
  v27[1] = 0xE400000000000000;
  v31 = 1701667150;
  v32 = 0xE400000000000000;
  v33 = 0xD000000000000017;
  v34 = 0x800000019ABB4A90;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](15);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v35, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v27, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

#error "19AB3A3D0: call analysis failed (funcsize=32)"

uint64_t sub_19AB3A458(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2F2B4();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6F746F6850;
  v27 = 0xE500000000000000;
  v28 = 0xD000000000000018;
  v29 = 0x800000019ABB4A30;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](18);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB3A75C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E3985D78;
  *(_QWORD *)(inited + 40) = &unk_1E39859E8;
  *(_QWORD *)(inited + 48) = &unk_1E3985BC8;
  *(_QWORD *)(inited + 56) = &unk_1E3985BF8;
  *(_QWORD *)(inited + 64) = &unk_1E3985C28;
  *(_QWORD *)(inited + 72) = &unk_1E3985C58;
  *(_QWORD *)(inited + 80) = &unk_1E3985C88;
  *(_QWORD *)(inited + 88) = &unk_1E3985CB8;
  *(_QWORD *)(inited + 96) = &unk_1E3985CE8;
  *(_QWORD *)(inited + 104) = &unk_1E3985D18;
  *(_QWORD *)(inited + 112) = &unk_1E3985D48;
  *(_QWORD *)(inited + 120) = &unk_1E3985A18;
  *(_QWORD *)(inited + 128) = &unk_1E3985A48;
  *(_QWORD *)(inited + 136) = &unk_1E3985A78;
  *(_QWORD *)(inited + 144) = &unk_1E3985AA8;
  *(_QWORD *)(inited + 152) = &unk_1E3985AD8;
  *(_QWORD *)(inited + 160) = &unk_1E3985B08;
  *(_QWORD *)(inited + 168) = &unk_1E3985B38;
  *(_QWORD *)(inited + 176) = &unk_1E3985B68;
  *(_QWORD *)(inited + 184) = &unk_1E3985B98;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB3A9FC: call analysis failed (funcsize=32)"

uint64_t sub_19AB3AA88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB2F2B4();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v3 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v3 + 32) = 0x6F746F6850;
  *(_QWORD *)(v3 + 40) = 0xE500000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x746567726174;
  v25[1] = 0xE600000000000000;
  v25[2] = v1;
  v27 = 0x736F746F6850;
  v28 = 0xE600000000000000;
  v29 = 0xD000000000000018;
  v30 = 0x800000019ABB49E0;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](17);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB3ADC4()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BB0;
  *(_QWORD *)(inited + 32) = &unk_1E39818A8;
  *(_QWORD *)(inited + 40) = &unk_1E39814B8;
  *(_QWORD *)(inited + 48) = &unk_1E3981698;
  *(_QWORD *)(inited + 56) = &unk_1E3981728;
  *(_QWORD *)(inited + 64) = &unk_1E3981758;
  *(_QWORD *)(inited + 72) = &unk_1E3981788;
  *(_QWORD *)(inited + 80) = &unk_1E39817B8;
  *(_QWORD *)(inited + 88) = &unk_1E39817E8;
  *(_QWORD *)(inited + 96) = &unk_1E3981818;
  *(_QWORD *)(inited + 104) = &unk_1E3981848;
  *(_QWORD *)(inited + 112) = &unk_1E3981878;
  *(_QWORD *)(inited + 120) = &unk_1E39814E8;
  *(_QWORD *)(inited + 128) = &unk_1E3981518;
  *(_QWORD *)(inited + 136) = &unk_1E3981548;
  *(_QWORD *)(inited + 144) = &unk_1E3981578;
  *(_QWORD *)(inited + 152) = &unk_1E39815A8;
  *(_QWORD *)(inited + 160) = &unk_1E39815D8;
  *(_QWORD *)(inited + 168) = &unk_1E3981608;
  *(_QWORD *)(inited + 176) = &unk_1E3981638;
  *(_QWORD *)(inited + 184) = &unk_1E399ED40;
  *(_QWORD *)(inited + 192) = &unk_1E3981668;
  *(_QWORD *)(inited + 200) = &unk_1E39816C8;
  *(_QWORD *)(inited + 208) = &unk_1E39816F8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 216)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

void sub_19AB3B050()
{
  void (*v0)(_QWORD *__return_ptr);
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[48];
  _BYTE v13[40];
  _BYTE v14[40];
  _OWORD v15[2];
  uint64_t v16;
  _QWORD v17[6];
  char v18;
  uint64_t v19;
  _QWORD v20[8];

  OUTLINED_FUNCTION_80();
  v0(v17);
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  v1 = v17[5];
  sub_19A9EE838((uint64_t)v15, (uint64_t)v14, &qword_1EE3B9EA0);
  v2 = v18;
  sub_19A9EE838((uint64_t)&v19, (uint64_t)v13, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)v20, (uint64_t)v12, (uint64_t *)&unk_1EE3B9EB0);
  v3 = v20[6];
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_148();
  v4 = OUTLINED_FUNCTION_66_0();
  sub_19AAFB8AC(v4, v5, v6, v7, v8, v1, v9, v10, v11, v2, (uint64_t)v13, (uint64_t)v12, v3);
  sub_19A9FEB08((uint64_t)v15, &qword_1EE3B9EA0);
  sub_19AA19690((uint64_t)v17);
  OUTLINED_FUNCTION_38();
}

#error "19AB3B16C: call analysis failed (funcsize=32)"

uint64_t sub_19AB3B1F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2F2B4();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6F746F6850;
  v27 = 0xE500000000000000;
  v28 = 0xD000000000000010;
  v29 = 0x800000019ABB4970;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](19);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB3B4FC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CF0;
  *(_QWORD *)(inited + 32) = &unk_1E3981488;
  *(_QWORD *)(inited + 40) = &unk_1E3981308;
  *(_QWORD *)(inited + 48) = &unk_1E3981338;
  *(_QWORD *)(inited + 56) = &unk_1E3981368;
  *(_QWORD *)(inited + 64) = &unk_1E3981398;
  *(_QWORD *)(inited + 72) = &unk_1E39813C8;
  *(_QWORD *)(inited + 80) = &unk_1E39813F8;
  *(_QWORD *)(inited + 88) = &unk_1E3981428;
  *(_QWORD *)(inited + 96) = &unk_1E3981458;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 104)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB3B728: call analysis failed (funcsize=34)"

uint64_t sub_19AB3B794(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v17;
  unint64_t v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[7];
  __int16 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD v33[7];
  __int16 v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v1 = sub_19AB2F2B4();
  v33[5] = &type metadata for EntitySchema;
  v33[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v33[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v34 = 257;
  v33[0] = 0x746567726174;
  v33[1] = 0xE600000000000000;
  v35 = 0x6F746F6850;
  v36 = 0xE500000000000000;
  v37 = 0xD000000000000019;
  v38 = 0x800000019ABB45F0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 1;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  v27[1] = 0xE500000000000000;
  v27[2] = v3;
  v28 = 259;
  v27[0] = 0x65756C6176;
  v29 = 0x65756C6156;
  v30 = 0xE500000000000000;
  v31 = 0xD000000000000012;
  v32 = 0x800000019ABB48F0;
  v17 = 0;
  v18 = 0xE000000000000000;
  MEMORY[0x19AECE804](21);
  sub_19AA463C8();
  strcpy((char *)v25, "Set depth of ");
  v26 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v33, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19A9EE838((uint64_t)v27, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v25[0] = 0;
  v25[1] = 0xE000000000000000;
  v23 = 37;
  v24 = 0xE100000000000000;
  v21 = 9509;
  v22 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v10 = v17;
  v11 = v18;
  v19 = &type metadata for Summary;
  v20 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v17 = v12;
  v12[2] = v26;
  v12[3] = v10;
  v12[4] = v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v12[5] = MEMORY[0x1E0DEE9D8];
  v14 = sub_19AAFE518(a1, &v17, v13);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v33, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v17);
  return v14;
}

uint64_t sub_19AB3BC1C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB971F0;
  *(_QWORD *)(inited + 32) = &unk_1E39825F8;
  *(_QWORD *)(inited + 40) = &unk_1E3982448;
  *(_QWORD *)(inited + 48) = &unk_1E3982478;
  *(_QWORD *)(inited + 56) = &unk_1E39824A8;
  *(_QWORD *)(inited + 64) = &unk_1E39824D8;
  *(_QWORD *)(inited + 72) = &unk_1E3982508;
  *(_QWORD *)(inited + 80) = &unk_1E3982538;
  *(_QWORD *)(inited + 88) = &unk_1E3982568;
  *(_QWORD *)(inited + 96) = &unk_1E3982598;
  *(_QWORD *)(inited + 104) = &unk_1E39825C8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 112)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB3BE1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x65756C6176;
  *(_QWORD *)(v3 + 24) = 0xE500000000000000;
  *(_QWORD *)(v3 + 32) = 1;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x65756C6156;
  *(_QWORD *)(v3 + 88) = 0xE500000000000000;
  *(_QWORD *)(v3 + 96) = 0xD000000000000012;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB48F0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB3BF40: call analysis failed (funcsize=34)"

uint64_t sub_19AB3BFB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v17;
  unint64_t v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[7];
  __int16 v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD v34[7];
  __int16 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v1 = sub_19AB2F2B4();
  v34[5] = &type metadata for EntitySchema;
  v34[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v34[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v35 = 257;
  v34[0] = 0x746567726174;
  v34[1] = 0xE600000000000000;
  v36 = 0x6F746F6850;
  v37 = 0xE500000000000000;
  v38 = 0xD00000000000001ALL;
  v39 = 0x800000019ABB48B0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 1;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  v28[1] = 0xE500000000000000;
  v28[2] = v3;
  v29 = 259;
  v28[0] = 0x65756C6176;
  v30 = 0x65756C6156;
  v31 = 0xE500000000000000;
  v32 = 0xD000000000000019;
  v33 = 0x800000019ABB4840;
  v17 = 0;
  v18 = 0xE000000000000000;
  MEMORY[0x19AECE804](24);
  sub_19AA463C8();
  v27 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v34, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19A9EE838((uint64_t)v28, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v25 = 0;
  v26 = 0xE000000000000000;
  v23 = 37;
  v24 = 0xE100000000000000;
  v21 = 9509;
  v22 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v10 = v17;
  v11 = v18;
  v19 = &type metadata for Summary;
  v20 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v17 = v12;
  v12[2] = v27;
  v12[3] = v10;
  v12[4] = v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v12[5] = MEMORY[0x1E0DEE9D8];
  v14 = sub_19AAFE518(a1, &v17, v13);
  sub_19A9FEB08((uint64_t)v28, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v34, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v17);
  return v14;
}

uint64_t sub_19AB3C434()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C60;
  *(_QWORD *)(inited + 32) = &unk_1E3982808;
  *(_QWORD *)(inited + 40) = &unk_1E3982628;
  *(_QWORD *)(inited + 48) = &unk_1E3982658;
  *(_QWORD *)(inited + 56) = &unk_1E3982688;
  *(_QWORD *)(inited + 64) = &unk_1E39826B8;
  *(_QWORD *)(inited + 72) = &unk_1E39826E8;
  *(_QWORD *)(inited + 80) = &unk_1E3982718;
  *(_QWORD *)(inited + 88) = &unk_1E3982748;
  *(_QWORD *)(inited + 96) = &unk_1E3982778;
  *(_QWORD *)(inited + 104) = &unk_1E39827A8;
  *(_QWORD *)(inited + 112) = &unk_1E39827D8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 120)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB3C640(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x65756C6176;
  *(_QWORD *)(v3 + 24) = 0xE500000000000000;
  *(_QWORD *)(v3 + 32) = 1;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x65756C6156;
  *(_QWORD *)(v3 + 88) = 0xE500000000000000;
  *(_QWORD *)(v3 + 96) = 0xD000000000000019;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4840;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB3C764: call analysis failed (funcsize=35)"

uint64_t sub_19AB3C7F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v17;
  unint64_t v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[7];
  __int16 v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD v34[7];
  __int16 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v1 = sub_19AB2F2B4();
  v34[5] = &type metadata for EntitySchema;
  v34[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v34[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v35 = 257;
  v34[0] = 0x746567726174;
  v34[1] = 0xE600000000000000;
  v36 = 0x6F746F6850;
  v37 = 0xE500000000000000;
  v38 = 0xD00000000000001CLL;
  v39 = 0x800000019ABB4800;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 1;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  v28[1] = 0xE500000000000000;
  v28[2] = v3;
  v29 = 259;
  v28[0] = 0x65756C6176;
  v30 = 0x65756C6156;
  v31 = 0xE500000000000000;
  v32 = 0xD00000000000001BLL;
  v33 = 0x800000019ABB4790;
  v17 = 0;
  v18 = 0xE000000000000000;
  MEMORY[0x19AECE804](26);
  sub_19AA463C8();
  v27 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v34, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19A9EE838((uint64_t)v28, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v25 = 0;
  v26 = 0xE000000000000000;
  v23 = 37;
  v24 = 0xE100000000000000;
  v21 = 9509;
  v22 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v10 = v17;
  v11 = v18;
  v19 = &type metadata for Summary;
  v20 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v17 = v12;
  v12[2] = v27;
  v12[3] = v10;
  v12[4] = v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v12[5] = MEMORY[0x1E0DEE9D8];
  v14 = sub_19AAFE518(a1, &v17, v13);
  sub_19A9FEB08((uint64_t)v28, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v34, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v17);
  return v14;
}

uint64_t sub_19AB3CC70()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB972C0;
  *(_QWORD *)(inited + 32) = &unk_1E3983C48;
  *(_QWORD *)(inited + 40) = &unk_1E3983978;
  *(_QWORD *)(inited + 48) = &unk_1E3983A98;
  *(_QWORD *)(inited + 56) = &unk_1E3983AC8;
  *(_QWORD *)(inited + 64) = &unk_1E3983AF8;
  *(_QWORD *)(inited + 72) = &unk_1E3983B28;
  *(_QWORD *)(inited + 80) = &unk_1E3983B58;
  *(_QWORD *)(inited + 88) = &unk_1E3983B88;
  *(_QWORD *)(inited + 96) = &unk_1E3983BB8;
  *(_QWORD *)(inited + 104) = &unk_1E3983BE8;
  *(_QWORD *)(inited + 112) = &unk_1E3983C18;
  *(_QWORD *)(inited + 120) = &unk_1E39839A8;
  *(_QWORD *)(inited + 128) = &unk_1E39839D8;
  *(_QWORD *)(inited + 136) = &unk_1E3983A08;
  *(_QWORD *)(inited + 144) = &unk_1E3983A38;
  *(_QWORD *)(inited + 152) = &unk_1E3983A68;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 160)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB3CEB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x65756C6176;
  *(_QWORD *)(v3 + 24) = 0xE500000000000000;
  *(_QWORD *)(v3 + 32) = 1;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x65756C6156;
  *(_QWORD *)(v3 + 88) = 0xE500000000000000;
  *(_QWORD *)(v3 + 96) = 0xD00000000000001BLL;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4790;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB3CFD8: call analysis failed (funcsize=31)"

uint64_t sub_19AB3D050(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v17;
  unint64_t v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[7];
  __int16 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD v33[7];
  __int16 v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v1 = sub_19AB2F2B4();
  v33[5] = &type metadata for EntitySchema;
  v33[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v33[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v34 = 257;
  v33[0] = 0x746567726174;
  v33[1] = 0xE600000000000000;
  v35 = 0x6F746F6850;
  v36 = 0xE500000000000000;
  v37 = 0xD000000000000018;
  v38 = 0x800000019ABB4770;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 1;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_BYTE *)(v3 + 56) = 4;
  v27[1] = 0xE500000000000000;
  v27[2] = v3;
  v28 = 259;
  v27[0] = 0x65756C6176;
  v29 = 0x65756C6156;
  v30 = 0xE500000000000000;
  v31 = 0xD000000000000017;
  v32 = 0x800000019ABB4720;
  v17 = 0;
  v18 = 0xE000000000000000;
  MEMORY[0x19AECE804](22);
  sub_19AA463C8();
  strcpy((char *)v25, "Set warmth of ");
  v26 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v33, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19A9EE838((uint64_t)v27, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v25[0] = 0;
  v25[1] = 0xE000000000000000;
  v23 = 37;
  v24 = 0xE100000000000000;
  v21 = 9509;
  v22 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v10 = v17;
  v11 = v18;
  v19 = &type metadata for Summary;
  v20 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v17 = v12;
  v12[2] = v26;
  v12[3] = v10;
  v12[4] = v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v12[5] = MEMORY[0x1E0DEE9D8];
  v14 = sub_19AAFE518(a1, &v17, v13);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v33, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v17);
  return v14;
}

uint64_t sub_19AB3D4D8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97AC0;
  *(_QWORD *)(inited + 32) = &unk_1E39865B8;
  *(_QWORD *)(inited + 40) = &unk_1E3986318;
  *(_QWORD *)(inited + 48) = &unk_1E3986408;
  *(_QWORD *)(inited + 56) = &unk_1E3986438;
  *(_QWORD *)(inited + 64) = &unk_1E3986468;
  *(_QWORD *)(inited + 72) = &unk_1E3986498;
  *(_QWORD *)(inited + 80) = &unk_1E39864C8;
  *(_QWORD *)(inited + 88) = &unk_1E39864F8;
  *(_QWORD *)(inited + 96) = &unk_1E3986528;
  *(_QWORD *)(inited + 104) = &unk_1E3986558;
  *(_QWORD *)(inited + 112) = &unk_1E3986588;
  *(_QWORD *)(inited + 120) = &unk_1E3986348;
  *(_QWORD *)(inited + 128) = &unk_1E3986378;
  *(_QWORD *)(inited + 136) = &unk_1E39863A8;
  *(_QWORD *)(inited + 144) = &unk_1E39863D8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 152)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB3D714(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x65756C6176;
  *(_QWORD *)(v3 + 24) = 0xE500000000000000;
  *(_QWORD *)(v3 + 32) = 1;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x65756C6156;
  *(_QWORD *)(v3 + 88) = 0xE500000000000000;
  *(_QWORD *)(v3 + 96) = 0xD000000000000017;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4720;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB3D838: call analysis failed (funcsize=32)"

uint64_t sub_19AB3D8C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = sub_19AB2F2B4();
  v25[5] = &type metadata for EntitySchema;
  v25[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v25[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v26 = 257;
  v25[0] = 0x746567726174;
  v25[1] = 0xE600000000000000;
  v27 = 0x6F746F6850;
  v28 = 0xE500000000000000;
  v29 = 0xD000000000000010;
  v30 = 0x800000019ABB46E0;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](10);
  sub_19AA463C8();
  v24 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v25, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v24;
  v7 = v14;
  v8 = v15;
  v9 = sub_19AB3DBE0((uint64_t)&v14);
  sub_19A9FEB08((uint64_t)&v14, &qword_1EE3B9EA0);
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = v9;
  v11 = sub_19AAFE518(a1, &v14, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB3DBE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BAFC8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x656C62616E457369;
  *(_QWORD *)(v3 + 24) = 0xE900000000000064;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_WORD *)(v3 + 72) = 260;
  *(_QWORD *)(v3 + 80) = 0x64656C62616E45;
  *(_QWORD *)(v3 + 88) = 0xE700000000000000;
  *(_QWORD *)(v3 + 96) = 0xD00000000000001ELL;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4700;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

uint64_t sub_19AB3DCCC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CE0;
  *(_QWORD *)(inited + 32) = &unk_1E39857A8;
  *(_QWORD *)(inited + 40) = &unk_1E3985538;
  *(_QWORD *)(inited + 48) = &unk_1E39855F8;
  *(_QWORD *)(inited + 56) = &unk_1E3985628;
  *(_QWORD *)(inited + 64) = &unk_1E3985658;
  *(_QWORD *)(inited + 72) = &unk_1E3985688;
  *(_QWORD *)(inited + 80) = &unk_1E39856B8;
  *(_QWORD *)(inited + 88) = &unk_1E39856E8;
  *(_QWORD *)(inited + 96) = &unk_1E3985718;
  *(_QWORD *)(inited + 104) = &unk_1E3985748;
  *(_QWORD *)(inited + 112) = &unk_1E3985778;
  *(_QWORD *)(inited + 120) = &unk_1E3985568;
  *(_QWORD *)(inited + 128) = &unk_1E3985598;
  *(_QWORD *)(inited + 136) = &unk_1E39855C8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 144)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB3DF30: call analysis failed (funcsize=33)"

uint64_t sub_19AB3DFA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v18;
  unint64_t v19;
  ValueMetadata *v20;
  _UNKNOWN **v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v29[7];
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v1 = sub_19AB2F2B4();
  v35[5] = &type metadata for EntitySchema;
  v35[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v35[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v36 = 257;
  v35[0] = 0x746567726174;
  v35[1] = 0xE600000000000000;
  v37 = 0x6F746F6850;
  v38 = 0xE500000000000000;
  v39 = 0xD000000000000018;
  v40 = 0x800000019ABB46A0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 40) = &type metadata for EnumSchema;
  *(_QWORD *)(v3 + 48) = &off_1E397AEF8;
  v4 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v3 + 16) = v4;
  v4[2] = 0xD000000000000015;
  v4[3] = 0x800000019ABAF340;
  v4[4] = 0x54207265746C6946;
  v4[5] = 0xEB00000000657079;
  *(_BYTE *)(v3 + 56) = 1;
  v30 = 259;
  v29[0] = 0x79547265746C6966;
  v29[1] = 0xEA00000000006570;
  v29[2] = v3;
  v31 = 0x7265746C6946;
  v32 = 0xE600000000000000;
  v33 = 0x74207265746C6946;
  v34 = 0xEF796C707061206FLL;
  v18 = 0;
  v19 = 0xE000000000000000;
  MEMORY[0x19AECE804](14);
  sub_19AA463C8();
  v28 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v8;
  sub_19A9EE838((uint64_t)v29, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v9 + 56) = v7;
  *(_QWORD *)(v9 + 64) = &off_1E398E1D8;
  v10 = swift_allocObject();
  *(_QWORD *)(v9 + 32) = v10;
  sub_19A9EE838((uint64_t)v35, v10 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v26 = 0;
  v27 = 0xE000000000000000;
  v24 = 37;
  v25 = 0xE100000000000000;
  v22 = 9509;
  v23 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v11 = v18;
  v12 = v19;
  v20 = &type metadata for Summary;
  v21 = &off_1E399A1E0;
  v13 = (_QWORD *)swift_allocObject();
  v18 = v13;
  v13[2] = v28;
  v13[3] = v11;
  v13[4] = v12;
  v14 = MEMORY[0x1E0DEE9D8];
  v13[5] = MEMORY[0x1E0DEE9D8];
  v15 = sub_19AAFE518(a1, &v18, v14);
  sub_19A9FEB08((uint64_t)v29, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v18);
  return v15;
}

uint64_t sub_19AB3E49C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C70;
  *(_QWORD *)(inited + 32) = &unk_1E39862E8;
  *(_QWORD *)(inited + 40) = &unk_1E39860D8;
  *(_QWORD *)(inited + 48) = &unk_1E3986138;
  *(_QWORD *)(inited + 56) = &unk_1E3986168;
  *(_QWORD *)(inited + 64) = &unk_1E3986198;
  *(_QWORD *)(inited + 72) = &unk_1E39861C8;
  *(_QWORD *)(inited + 80) = &unk_1E39861F8;
  *(_QWORD *)(inited + 88) = &unk_1E3986228;
  *(_QWORD *)(inited + 96) = &unk_1E3986258;
  *(_QWORD *)(inited + 104) = &unk_1E3986288;
  *(_QWORD *)(inited + 112) = &unk_1E39862B8;
  *(_QWORD *)(inited + 120) = &unk_1E3986108;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 128)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB3E6B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2F198();
  v24[5] = &type metadata for VersionedSchema;
  v24[6] = &off_1E398E380;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = v1;
  v25 = 257;
  v24[0] = 0x746365666665;
  v24[1] = 0xE600000000000000;
  v24[2] = v2;
  v26 = 0x7265746C6946;
  v27 = 0xE600000000000000;
  v28 = 0x74207265746C6946;
  v29 = 0xEF796C707061206FLL;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](8);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

#error "19AB3E9C0: call analysis failed (funcsize=31)"

uint64_t sub_19AB3EA3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v16;
  unint64_t v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  _BYTE v28[48];
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD v33[5];
  char v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v1 = sub_19AB2F2B4();
  v35[5] = &type metadata for EntitySchema;
  v35[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v35[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v36 = 257;
  v35[0] = 0x746567726174;
  v35[1] = 0xE600000000000000;
  v37 = 0x6F746F6850;
  v38 = 0xE500000000000000;
  v39 = 0xD000000000000019;
  v40 = 0x800000019ABB45F0;
  v33[0] = 28239;
  v33[1] = 0xE200000000000000;
  v33[2] = 6710863;
  v33[3] = 0xE300000000000000;
  v34 = 0;
  sub_19AAF9984((uint64_t)v33, (uint64_t)v28);
  v27[0] = 0x656C62616E457369;
  v27[1] = 0xE900000000000064;
  v28[41] = 1;
  v29 = 0x64656C62616E45;
  v30 = 0xE700000000000000;
  v31 = 0xD00000000000001FLL;
  v32 = 0x800000019ABB4610;
  v16 = 0;
  v17 = 0xE000000000000000;
  MEMORY[0x19AECE804](27);
  sub_19AA463C8();
  v26 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v27, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  sub_19A9EE838((uint64_t)v35, v8 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v24 = 0;
  v25 = 0xE000000000000000;
  v22 = 37;
  v23 = 0xE100000000000000;
  v20 = 9509;
  v21 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v9 = v16;
  v10 = v17;
  v18 = &type metadata for Summary;
  v19 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v16 = v11;
  v11[2] = v26;
  v11[3] = v9;
  v11[4] = v10;
  v12 = MEMORY[0x1E0DEE9D8];
  v11[5] = MEMORY[0x1E0DEE9D8];
  v13 = sub_19AAFE518(a1, &v16, v12);
  sub_19A9FEB08((uint64_t)v27, &qword_1EE3B9EE8);
  sub_19AAF7690((uint64_t)v33);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v16);
  return v13;
}

uint64_t sub_19AB3EEF4()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C60;
  *(_QWORD *)(inited + 32) = &unk_1E39859B8;
  *(_QWORD *)(inited + 40) = &unk_1E39857D8;
  *(_QWORD *)(inited + 48) = &unk_1E3985808;
  *(_QWORD *)(inited + 56) = &unk_1E3985838;
  *(_QWORD *)(inited + 64) = &unk_1E3985868;
  *(_QWORD *)(inited + 72) = &unk_1E3985898;
  *(_QWORD *)(inited + 80) = &unk_1E39858C8;
  *(_QWORD *)(inited + 88) = &unk_1E39858F8;
  *(_QWORD *)(inited + 96) = &unk_1E3985928;
  *(_QWORD *)(inited + 104) = &unk_1E3985958;
  *(_QWORD *)(inited + 112) = &unk_1E3985988;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 120)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB3F100(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x64656C62616E65;
  *(_QWORD *)(v3 + 24) = 0xE700000000000000;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x64656C62616E45;
  *(_QWORD *)(v3 + 88) = 0xE700000000000000;
  *(_QWORD *)(v3 + 96) = 0xD000000000000020;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4590;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

#error "19AB3F224: call analysis failed (funcsize=32)"

uint64_t sub_19AB3F298(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2F2B4();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6F746F6850;
  v27 = 0xE500000000000000;
  v28 = 0xD000000000000013;
  v29 = 0x800000019ABB4570;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB3F594()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C00;
  *(_QWORD *)(inited + 32) = &unk_1E3984E18;
  *(_QWORD *)(inited + 40) = &unk_1E39849C8;
  *(_QWORD *)(inited + 48) = &unk_1E3984BD8;
  *(_QWORD *)(inited + 56) = &unk_1E3984C98;
  *(_QWORD *)(inited + 64) = &unk_1E3984CC8;
  *(_QWORD *)(inited + 72) = &unk_1E3984CF8;
  *(_QWORD *)(inited + 80) = &unk_1E3984D28;
  *(_QWORD *)(inited + 88) = &unk_1E3984D58;
  *(_QWORD *)(inited + 96) = &unk_1E3984D88;
  *(_QWORD *)(inited + 104) = &unk_1E3984DB8;
  *(_QWORD *)(inited + 112) = &unk_1E3984DE8;
  *(_QWORD *)(inited + 120) = &unk_1E39849F8;
  *(_QWORD *)(inited + 128) = &unk_1E3984A28;
  *(_QWORD *)(inited + 136) = &unk_1E3984A58;
  *(_QWORD *)(inited + 144) = &unk_1E3984A88;
  *(_QWORD *)(inited + 152) = &unk_1E3984AB8;
  *(_QWORD *)(inited + 160) = &unk_1E3984AE8;
  *(_QWORD *)(inited + 168) = &unk_1E3984B18;
  *(_QWORD *)(inited + 176) = &unk_1E3984B48;
  *(_QWORD *)(inited + 184) = &unk_1E3984B78;
  *(_QWORD *)(inited + 192) = &unk_1E3984BA8;
  *(_QWORD *)(inited + 200) = &unk_1E3984C08;
  *(_QWORD *)(inited + 208) = &unk_1E3984C38;
  *(_QWORD *)(inited + 216) = &unk_1E3984C68;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 224)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB3F85C: call analysis failed (funcsize=36)"

uint64_t sub_19AB3F8EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB2F2B4();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6F746F6850;
  v27 = 0xE500000000000000;
  v28 = 0xD000000000000018;
  v29 = 0x800000019ABB4530;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](13);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB3FBF8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CE0;
  *(_QWORD *)(inited + 32) = &unk_1E3981B48;
  *(_QWORD *)(inited + 40) = &unk_1E39818D8;
  *(_QWORD *)(inited + 48) = &unk_1E3981998;
  *(_QWORD *)(inited + 56) = &unk_1E39819C8;
  *(_QWORD *)(inited + 64) = &unk_1E39819F8;
  *(_QWORD *)(inited + 72) = &unk_1E3981A28;
  *(_QWORD *)(inited + 80) = &unk_1E3981A58;
  *(_QWORD *)(inited + 88) = &unk_1E3981A88;
  *(_QWORD *)(inited + 96) = &unk_1E3981AB8;
  *(_QWORD *)(inited + 104) = &unk_1E3981AE8;
  *(_QWORD *)(inited + 112) = &unk_1E3981B18;
  *(_QWORD *)(inited + 120) = &unk_1E3981908;
  *(_QWORD *)(inited + 128) = &unk_1E3981938;
  *(_QWORD *)(inited + 136) = &unk_1E3981968;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 144)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB3FE5C: call analysis failed (funcsize=32)"

uint64_t sub_19AB3FEC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = sub_19AB2F2B4();
  v25[5] = &type metadata for EntitySchema;
  v25[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v25[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x746E456F746F6850;
  *(_QWORD *)(v2 + 24) = 0xEB00000000797469;
  *(_QWORD *)(v2 + 32) = 0x6F746F6850;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v26 = 257;
  v25[0] = 0x746567726174;
  v25[1] = 0xE600000000000000;
  v27 = 0x6F746F6850;
  v28 = 0xE500000000000000;
  v29 = 0xD000000000000013;
  v30 = 0x800000019ABB44B0;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  sub_19AA463C8();
  v24 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v25, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v24;
  v7 = v14;
  v8 = v15;
  v9 = sub_19AB401E4((uint64_t)&v14);
  sub_19A9FEB08((uint64_t)&v14, &qword_1EE3B9EA0);
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = v9;
  v11 = sub_19AAFE518(a1, &v14, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB401E4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (_QWORD *)swift_allocObject();
  v2[2] = 0xD000000000000016;
  v2[3] = 0x800000019ABAF380;
  v2[4] = 0xD000000000000012;
  v2[5] = 0x800000019ABB44D0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v3 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v3 + 64) = &off_1E398E1D8;
  v4 = swift_allocObject();
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v4 + 16) = 0x6F69746365726964;
  *(_QWORD *)(v4 + 24) = 0xE90000000000006ELL;
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(v4 + 56) = &type metadata for EnumSchema;
  *(_QWORD *)(v4 + 64) = &off_1E397AEF8;
  *(_BYTE *)(v4 + 72) = 1;
  *(_BYTE *)(v4 + 73) = 1;
  *(_QWORD *)(v4 + 80) = 0x6F69746365726944;
  *(_QWORD *)(v4 + 88) = 0xE90000000000006ELL;
  *(_QWORD *)(v4 + 96) = 0xD000000000000019;
  *(_QWORD *)(v4 + 104) = 0x800000019ABB4470;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v3;
}

uint64_t sub_19AB40334()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E39851D8;
  *(_QWORD *)(inited + 40) = &unk_1E3984E48;
  *(_QWORD *)(inited + 48) = &unk_1E3985028;
  *(_QWORD *)(inited + 56) = &unk_1E3985058;
  *(_QWORD *)(inited + 64) = &unk_1E3985088;
  *(_QWORD *)(inited + 72) = &unk_1E39850B8;
  *(_QWORD *)(inited + 80) = &unk_1E39850E8;
  *(_QWORD *)(inited + 88) = &unk_1E3985118;
  *(_QWORD *)(inited + 96) = &unk_1E3985148;
  *(_QWORD *)(inited + 104) = &unk_1E3985178;
  *(_QWORD *)(inited + 112) = &unk_1E39851A8;
  *(_QWORD *)(inited + 120) = &unk_1E3984E78;
  *(_QWORD *)(inited + 128) = &unk_1E3984EA8;
  *(_QWORD *)(inited + 136) = &unk_1E3984ED8;
  *(_QWORD *)(inited + 144) = &unk_1E3984F08;
  *(_QWORD *)(inited + 152) = &unk_1E3984F38;
  *(_QWORD *)(inited + 160) = &unk_1E3984F68;
  *(_QWORD *)(inited + 168) = &unk_1E3984F98;
  *(_QWORD *)(inited + 176) = &unk_1E3984FC8;
  *(_QWORD *)(inited + 184) = &unk_1E3984FF8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB405A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x7369776B636F6C63;
  *(_QWORD *)(v3 + 24) = 0xE900000000000065;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x6F69746365726944;
  *(_QWORD *)(v3 + 88) = 0xE90000000000006ELL;
  *(_QWORD *)(v3 + 96) = 0xD000000000000019;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB4470;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

uint64_t sub_19AB406A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[4];

  v5[3] = &type metadata for AssistantSchema.IntentSchema;
  OUTLINED_FUNCTION_52_1();
  v5[0] = v2;
  v5[1] = 0x800000019ABB4450;
  sub_19A9FEF48((uint64_t)v5, a1);
  v3 = sub_19AB40714();
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_19AB40714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  __int128 v8;
  ValueMetadata *v9;
  _UNKNOWN **v10;

  v0 = sub_19AB40884();
  v9 = &type metadata for VersionedSchema;
  v10 = &off_1E398E380;
  v1 = swift_allocObject();
  *(_QWORD *)&v8 = v1;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 1;
  *(_QWORD *)(v1 + 40) = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v8, v2 + 32);
  v3 = sub_19AB41834();
  v9 = &type metadata for VersionedSchema;
  v10 = &off_1E398E380;
  v4 = swift_allocObject();
  *(_QWORD *)&v8 = v4;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = v3;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v8, v5 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88CA0;
  *(_QWORD *)(inited + 32) = v2;
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)&v8 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_bridgeObjectRetain();
  sub_19AA47FF0();
  swift_setDeallocating();
  sub_19AB2DAC0();
  return v8;
}

uint64_t sub_19AB40884()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t result;
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
  uint64_t v78;
  __int128 v79;
  ValueMetadata *v80;
  _UNKNOWN **v81;
  __int128 v82;
  ValueMetadata *v83;
  _UNKNOWN **v84;
  __int128 v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  char v89;
  __int128 v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  char v94;
  __int128 v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  char v99;

  v83 = &type metadata for EnumSchema;
  v84 = &off_1E397AEF8;
  v0 = swift_allocObject();
  *(_QWORD *)&v82 = v0;
  strcpy((char *)(v0 + 16), "PhotoAssetType");
  *(_BYTE *)(v0 + 31) = -18;
  *(_QWORD *)(v0 + 32) = 0x7954206F746F6850;
  *(_QWORD *)(v0 + 40) = 0xEA00000000006570;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v78 = swift_allocObject();
  *(_OWORD *)(v78 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v82, v78 + 32);
  v83 = &type metadata for EnumSchema;
  v84 = &off_1E397AEF8;
  v1 = swift_allocObject();
  *(_QWORD *)&v82 = v1;
  strcpy((char *)(v1 + 16), "PhotoAlbumType");
  *(_BYTE *)(v1 + 31) = -18;
  *(_QWORD *)(v1 + 32) = 0x7954206D75626C41;
  *(_QWORD *)(v1 + 40) = 0xEA00000000006570;
  v77 = swift_allocObject();
  *(_OWORD *)(v77 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v82, v77 + 32);
  v83 = &type metadata for EnumSchema;
  v84 = &off_1E397AEF8;
  v2 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v82 = v2;
  v2[2] = 0xD000000000000015;
  v2[3] = 0x800000019ABAF340;
  v2[4] = 0x54207265746C6946;
  v2[5] = 0xEB00000000657079;
  v76 = swift_allocObject();
  *(_OWORD *)(v76 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v82, v76 + 32);
  v83 = &type metadata for EnumSchema;
  v84 = &off_1E397AEF8;
  v3 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v82 = v3;
  v3[2] = 0xD000000000000016;
  v3[3] = 0x800000019ABAF380;
  v3[4] = 0xD000000000000012;
  v3[5] = 0x800000019ABB44D0;
  v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v82, v75 + 32);
  v83 = &type metadata for EnumSchema;
  v84 = &off_1E397AEF8;
  v4 = swift_allocObject();
  *(_QWORD *)&v82 = v4;
  strcpy((char *)(v4 + 16), "PhotoStyleType");
  *(_BYTE *)(v4 + 31) = -18;
  *(_QWORD *)(v4 + 32) = 0x795420656C797453;
  *(_QWORD *)(v4 + 40) = 0xEA00000000006570;
  v74 = swift_allocObject();
  *(_OWORD *)(v74 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v82, v74 + 32);
  v5 = sub_19AB2F2B4();
  *(_QWORD *)&v95 = 0x746E456F746F6850;
  *((_QWORD *)&v95 + 1) = 0xEB00000000797469;
  v96 = 0x6F746F6850;
  v97 = 0xE500000000000000;
  v98 = v5;
  v99 = 1;
  v73 = sub_19AB4D534(&v95);
  swift_bridgeObjectRelease();
  v6 = sub_19AB2F860();
  *(_QWORD *)&v90 = 0xD000000000000010;
  *((_QWORD *)&v90 + 1) = 0x800000019ABAEE40;
  v91 = 0x6D75626C41;
  v92 = 0xE500000000000000;
  v93 = v6;
  v94 = 1;
  v72 = sub_19AB4D534(&v90);
  swift_bridgeObjectRelease();
  v7 = sub_19AB2FC90();
  *(_QWORD *)&v85 = 0xD000000000000011;
  *((_QWORD *)&v85 + 1) = 0x800000019ABAEE80;
  v86 = 0x6E6F73726550;
  v87 = 0xE600000000000000;
  v88 = v7;
  v89 = 1;
  v71 = sub_19AB4D534(&v85);
  swift_bridgeObjectRelease();
  sub_19AB2FFDC();
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v70 = swift_allocObject();
  *(_OWORD *)(v70 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v70 + 32);
  v8 = sub_19AA19690((uint64_t)&v82);
  sub_19AB30848(&v82, v8);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v69 + 32);
  sub_19AA19690((uint64_t)&v82);
  sub_19AB310C0();
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v68 = swift_allocObject();
  *(_OWORD *)(v68 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v68 + 32);
  v9 = sub_19AA19690((uint64_t)&v82);
  sub_19AB31E98(&v82, v9);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v67 + 32);
  sub_19AA19690((uint64_t)&v82);
  sub_19AB32810();
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v66 + 32);
  v10 = sub_19AA19690((uint64_t)&v82);
  sub_19AB32FA8(&v82, v10);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v65 + 32);
  v11 = sub_19AA19690((uint64_t)&v82);
  sub_19AB33934(&v82, v11);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v64 + 32);
  v12 = sub_19AA19690((uint64_t)&v82);
  sub_19AB35328(&v82, v12);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v63 + 32);
  sub_19AA19690((uint64_t)&v82);
  sub_19AB35EBC();
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v62 + 32);
  v13 = sub_19AA19690((uint64_t)&v82);
  sub_19AB36A04(&v82, v13);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v61 = swift_allocObject();
  *(_OWORD *)(v61 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v61 + 32);
  v14 = sub_19AA19690((uint64_t)&v82);
  sub_19AB378EC(&v82, v14);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v60 = swift_allocObject();
  *(_OWORD *)(v60 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v60 + 32);
  v15 = sub_19AA19690((uint64_t)&v82);
  sub_19AB38498(&v82, v15);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v59 + 32);
  v16 = sub_19AA19690((uint64_t)&v82);
  sub_19AB39114(&v82, v16);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v58 + 32);
  sub_19AA19690((uint64_t)&v82);
  sub_19AB396E0();
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v57 + 32);
  v17 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3A39C(&v82, v17);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v56 + 32);
  v18 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3A9C8(&v82, v18);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v55 + 32);
  v19 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3B138(&v82, v19);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v54 + 32);
  v20 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3B6F4(&v82, v20);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v53 + 32);
  v21 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3BF0C(&v82, v21);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v52 + 32);
  v22 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3C730(&v82, v22);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v51 + 32);
  v23 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3CFA4(&v82, v23);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v24 + 32);
  v25 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3D804(&v82, v25);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v26 + 32);
  v27 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3DEFC(&v82, v27);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v28 + 32);
  v29 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3E98C(&v82, v29);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v30 + 32);
  v31 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3F1F0(&v82, v31);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v32 + 32);
  v33 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3F828(&v82, v33);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v34 + 32);
  v35 = sub_19AA19690((uint64_t)&v82);
  sub_19AB3FE28(&v82, v35);
  v80 = &type metadata for IntentSchema;
  v81 = &off_1E3981258;
  *(_QWORD *)&v79 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v82, v79 + 16);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v79, v36 + 32);
  sub_19AA19690((uint64_t)&v82);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 32) = v78;
  *(_QWORD *)(v37 + 40) = v77;
  *(_QWORD *)(v37 + 48) = v76;
  *(_QWORD *)(v37 + 56) = v75;
  *(_QWORD *)(v37 + 64) = v74;
  *(_QWORD *)(v37 + 72) = v73;
  *(_OWORD *)(v37 + 16) = xmmword_19AB97AD0;
  *(_QWORD *)(v37 + 80) = v72;
  *(_QWORD *)(v37 + 88) = v71;
  *(_QWORD *)(v37 + 96) = v70;
  *(_QWORD *)(v37 + 104) = v69;
  *(_QWORD *)(v37 + 112) = v68;
  *(_QWORD *)(v37 + 120) = v67;
  *(_QWORD *)(v37 + 128) = v66;
  *(_QWORD *)(v37 + 136) = v65;
  *(_QWORD *)(v37 + 144) = v64;
  *(_QWORD *)(v37 + 152) = v63;
  *(_QWORD *)(v37 + 160) = v62;
  *(_QWORD *)(v37 + 168) = v61;
  *(_QWORD *)(v37 + 176) = v60;
  *(_QWORD *)(v37 + 184) = v59;
  *(_QWORD *)(v37 + 192) = v58;
  *(_QWORD *)(v37 + 200) = v57;
  *(_QWORD *)(v37 + 208) = v56;
  *(_QWORD *)(v37 + 216) = v55;
  *(_QWORD *)(v37 + 224) = v54;
  *(_QWORD *)(v37 + 232) = v53;
  *(_QWORD *)(v37 + 240) = v52;
  *(_QWORD *)(v37 + 248) = v51;
  *(_QWORD *)(v37 + 256) = v24;
  *(_QWORD *)(v37 + 264) = v26;
  *(_QWORD *)(v37 + 272) = v28;
  *(_QWORD *)(v37 + 280) = v30;
  *(_QWORD *)(v37 + 288) = v32;
  *(_QWORD *)(v37 + 296) = v34;
  v38 = 32;
  *(_QWORD *)(v37 + 304) = v36;
  v39 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v40 = *(_QWORD *)(v37 + v38);
    v41 = *(_QWORD *)(v40 + 16);
    v42 = *(_QWORD *)(v39 + 16);
    if (__OFADD__(v42, v41))
      break;
    swift_bridgeObjectRetain();
    if (!swift_isUniquelyReferenced_nonNull_native() || v42 + v41 > *(_QWORD *)(v39 + 24) >> 1)
    {
      sub_19AA46398();
      v39 = v43;
    }
    if (*(_QWORD *)(v40 + 16))
    {
      v44 = *(_QWORD *)(v39 + 16);
      if ((*(_QWORD *)(v39 + 24) >> 1) - v44 < v41)
        goto LABEL_21;
      v45 = v39 + 40 * v44 + 32;
      if (v40 + 32 < v45 + 40 * v41 && v45 < v40 + 32 + 40 * v41)
        goto LABEL_23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC8);
      swift_arrayInitWithCopy();
      if (v41)
      {
        v47 = *(_QWORD *)(v39 + 16);
        v48 = __OFADD__(v47, v41);
        v49 = v47 + v41;
        if (v48)
          goto LABEL_22;
        *(_QWORD *)(v39 + 16) = v49;
      }
    }
    else if (v41)
    {
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    v38 += 8;
    if (v38 == 312)
    {
      swift_setDeallocating();
      sub_19AB2DAC0();
      return v39;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB41834()
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
  unint64_t v25;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  ValueMetadata *v57;
  _UNKNOWN **v58;
  __int128 v59;
  ValueMetadata *v60;
  _UNKNOWN **v61;

  v0 = sub_19AB2F198();
  v60 = &type metadata for VersionedSchema;
  v61 = &off_1E398E380;
  v1 = swift_allocObject();
  *(_QWORD *)&v59 = v1;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v59, v55 + 32);
  v60 = &type metadata for EnumSchema;
  v61 = &off_1E397AEF8;
  v2 = swift_allocObject();
  *(_QWORD *)&v59 = v2;
  strcpy((char *)(v2 + 16), "PhotoStyleType");
  *(_BYTE *)(v2 + 31) = -18;
  *(_QWORD *)(v2 + 32) = 0x795420656C797453;
  *(_QWORD *)(v2 + 40) = 0xEA00000000006570;
  v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v59, v54 + 32);
  v3 = sub_19AB2F784();
  v60 = &type metadata for VersionedSchema;
  v61 = &off_1E398E380;
  v4 = swift_allocObject();
  *(_QWORD *)&v59 = v4;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = v3;
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v59, v53 + 32);
  v5 = sub_19AB2FBC8();
  v60 = &type metadata for VersionedSchema;
  v61 = &off_1E398E380;
  v6 = swift_allocObject();
  *(_QWORD *)&v59 = v6;
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  *(_BYTE *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 40) = v5;
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v59, v52 + 32);
  v7 = sub_19AB2FDEC();
  v60 = &type metadata for VersionedSchema;
  v61 = &off_1E398E380;
  v8 = swift_allocObject();
  *(_QWORD *)&v59 = v8;
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_BYTE *)(v8 + 32) = 0;
  *(_QWORD *)(v8 + 40) = v7;
  v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v59, v51 + 32);
  sub_19AB30578();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v50 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v49 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB318CC();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v48 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB35998();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v47 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB32E64();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v46 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v45 + 32);
  sub_19AA19690((uint64_t)&v59);
  v44 = sub_19AB342D0();
  sub_19AB35998();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v43 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB36504();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v42 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v41 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v40 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v39 + 32);
  v9 = sub_19AA19690((uint64_t)&v59);
  sub_19AB39114(&v59, v9);
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v38 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v37 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3B050();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v36 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3B050();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v35 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3B050();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v34 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v33 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v32 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v31 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v10 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3B050();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v11 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v12 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v13 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3B050();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v14 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3B050();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v15 + 32);
  sub_19AA19690((uint64_t)&v59);
  sub_19AB3356C();
  v57 = &type metadata for IntentSchema;
  v58 = &off_1E3981258;
  *(_QWORD *)&v56 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v59, v56 + 16);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v56, v16 + 32);
  sub_19AA19690((uint64_t)&v59);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 32) = v55;
  *(_QWORD *)(v17 + 40) = v54;
  *(_QWORD *)(v17 + 48) = v53;
  *(_QWORD *)(v17 + 56) = v52;
  *(_OWORD *)(v17 + 16) = xmmword_19AB97AE0;
  *(_QWORD *)(v17 + 64) = v51;
  *(_QWORD *)(v17 + 72) = v50;
  *(_QWORD *)(v17 + 80) = v49;
  *(_QWORD *)(v17 + 88) = v48;
  *(_QWORD *)(v17 + 96) = v47;
  *(_QWORD *)(v17 + 104) = v46;
  *(_QWORD *)(v17 + 112) = v45;
  *(_QWORD *)(v17 + 120) = v44;
  *(_QWORD *)(v17 + 128) = v43;
  *(_QWORD *)(v17 + 136) = v42;
  *(_QWORD *)(v17 + 144) = v41;
  *(_QWORD *)(v17 + 152) = v40;
  *(_QWORD *)(v17 + 160) = v39;
  *(_QWORD *)(v17 + 168) = v38;
  *(_QWORD *)(v17 + 176) = v37;
  *(_QWORD *)(v17 + 184) = v36;
  *(_QWORD *)(v17 + 192) = v35;
  *(_QWORD *)(v17 + 200) = v34;
  *(_QWORD *)(v17 + 208) = v33;
  *(_QWORD *)(v17 + 216) = v32;
  *(_QWORD *)(v17 + 224) = v31;
  *(_QWORD *)(v17 + 232) = v10;
  *(_QWORD *)(v17 + 240) = v11;
  *(_QWORD *)(v17 + 248) = v12;
  *(_QWORD *)(v17 + 256) = v13;
  *(_QWORD *)(v17 + 264) = v14;
  v18 = 32;
  *(_QWORD *)(v17 + 272) = v15;
  *(_QWORD *)(v17 + 280) = v16;
  v19 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v20 = *(_QWORD *)(v17 + v18);
    v21 = *(_QWORD *)(v20 + 16);
    v22 = *(_QWORD *)(v19 + 16);
    if (__OFADD__(v22, v21))
      break;
    swift_bridgeObjectRetain();
    if (!swift_isUniquelyReferenced_nonNull_native() || v22 + v21 > *(_QWORD *)(v19 + 24) >> 1)
    {
      sub_19AA46398();
      v19 = v23;
    }
    if (*(_QWORD *)(v20 + 16))
    {
      v24 = *(_QWORD *)(v19 + 16);
      if ((*(_QWORD *)(v19 + 24) >> 1) - v24 < v21)
        goto LABEL_21;
      v25 = v19 + 40 * v24 + 32;
      if (v20 + 32 < v25 + 40 * v21 && v25 < v20 + 32 + 40 * v21)
        goto LABEL_23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC8);
      swift_arrayInitWithCopy();
      if (v21)
      {
        v27 = *(_QWORD *)(v19 + 16);
        v28 = __OFADD__(v27, v21);
        v29 = v27 + v21;
        if (v28)
          goto LABEL_22;
        *(_QWORD *)(v19 + 16) = v29;
      }
    }
    else if (v21)
    {
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    v18 += 8;
    if (v18 == 288)
    {
      swift_setDeallocating();
      sub_19AB2DAC0();
      return v19;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB4274C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 96))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) >= 5uLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 120);
  switch(*(_BYTE *)(v0 + 200))
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 160);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB427F8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB42824()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

uint64_t sub_19AB42858()
{
  uint64_t v0;

  switch(*(_BYTE *)(v0 + 56))
  {
    case 0:
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_3();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

uint64_t objectdestroy_38Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  switch(*(_BYTE *)(v0 + 72))
  {
    case 0:
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_16_5(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_19A9EE838(a1, a2, v2);
}

void OUTLINED_FUNCTION_18_5(uint64_t a1)
{
  uint64_t *v1;

  sub_19A9FEB08(a1, v1);
}

void OUTLINED_FUNCTION_26_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a71;
  uint64_t a72;
  uint64_t *v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;

  a71 = v76;
  a72 = v75;
  STACK[0x200] = v77;
  STACK[0x208] = v74;
  STACK[0x210] = v78;
  STACK[0x218] = v73;
  sub_19A9EE838((uint64_t)&a31, (uint64_t)&a20, v72);
}

unint64_t OUTLINED_FUNCTION_27_2()
{
  return 0xD000000000000010;
}

unint64_t OUTLINED_FUNCTION_34_1()
{
  return 0xD000000000000011;
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_39_1()
{
  return 0xD000000000000010;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return 0x616964654D746553;
}

uint64_t OUTLINED_FUNCTION_42_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  return sub_19AA19700((uint64_t)va);
}

void OUTLINED_FUNCTION_44_1(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,unint64_t a54)
{
  uint64_t v54;
  uint64_t *v55;

  a53 = a1;
  a54 = (v54 - 32) | 0x8000000000000000;
  sub_19A9EE838((uint64_t)&a23, (uint64_t)&a12, v55);
}

void OUTLINED_FUNCTION_45_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;
  uint64_t *v37;

  sub_19AA19568((uint64_t)&a36, v36, v37);
}

void OUTLINED_FUNCTION_48_1(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  sub_19A9EE838((uint64_t)&a41, (uint64_t)&a36, a3);
}

double OUTLINED_FUNCTION_50_1(__n128 a1)
{
  uint64_t v1;
  double result;

  *(__n128 *)(v1 + 72) = a1;
  result = 0.0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

void OUTLINED_FUNCTION_58_0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, ...)
{
  va_list va;

  va_start(va, a19);
  sub_19A9EE838(a1, (uint64_t)va, a3);
}

void OUTLINED_FUNCTION_60_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t *v51;

  sub_19A9EE838((uint64_t)&a51, (uint64_t)&a30, v51);
}

void OUTLINED_FUNCTION_62_0()
{
  char v0;

  LOBYTE(STACK[0x220]) = v0;
}

uint64_t OUTLINED_FUNCTION_63_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_19AA19700((uint64_t)va);
}

void OUTLINED_FUNCTION_64_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = 0;
  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0;
}

uint64_t OUTLINED_FUNCTION_69_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_19AA19700((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_75_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_19AA19568(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_77_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(result + 16) = v2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  *(_QWORD *)(result + 24) = (a2 - 32) | 0x8000000000000000;
  return result;
}

double OUTLINED_FUNCTION_84_0(uint64_t a1)
{
  uint64_t v1;
  double result;

  *(_QWORD *)(a1 + 48) = v1;
  result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  return result;
}

ValueMetadata *type metadata accessor for ReaderDomain()
{
  return &type metadata for ReaderDomain;
}

uint64_t sub_19AB42B58()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v0 + 32) = 0x6C6562616CLL;
  *(_QWORD *)(v0 + 40) = 0xE500000000000000;
  *(_QWORD *)(v0 + 48) = 3;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_BYTE *)(v0 + 88) = 4;
  *(_QWORD *)(v0 + 96) = 0x6C6562614CLL;
  *(_QWORD *)(v0 + 104) = 0xE500000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 32) = v0;
  v3 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_19AA47F58();
  swift_setDeallocating();
  sub_19AB2DAA8();
  return v3;
}

uint64_t sub_19AB42C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v0 + 32) = 0x656C746974;
  *(_QWORD *)(v0 + 40) = 0xE500000000000000;
  *(_QWORD *)(v0 + 48) = 3;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_BYTE *)(v0 + 88) = 4;
  *(_QWORD *)(v0 + 96) = 0x656C746954;
  *(_QWORD *)(v0 + 104) = 0xE500000000000000;
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0xD000000000000012;
  *(_QWORD *)(v1 + 24) = 0x800000019ABAF3E0;
  strcpy((char *)(v1 + 32), "Document Kind");
  *(_WORD *)(v1 + 46) = -4864;
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 32) = 1684957547;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 72) = &type metadata for EnumSchema;
  *(_QWORD *)(v2 + 80) = &off_1E397AEF8;
  *(_BYTE *)(v2 + 88) = 1;
  *(_QWORD *)(v2 + 96) = 0x6C6562614CLL;
  *(_QWORD *)(v2 + 104) = 0xE500000000000000;
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_QWORD *)(v3 + 48) = 0;
  *(_BYTE *)(v3 + 56) = 4;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v4 + 32) = 0x6874646977;
  *(_QWORD *)(v4 + 40) = 0xE500000000000000;
  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 88) = 3;
  *(_QWORD *)(v4 + 96) = 0x6874646957;
  *(_QWORD *)(v4 + 104) = 0xE500000000000000;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_QWORD *)(v5 + 48) = 0;
  *(_BYTE *)(v5 + 56) = 4;
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v6 + 32) = 0x746867696568;
  *(_QWORD *)(v6 + 40) = 0xE600000000000000;
  *(_QWORD *)(v6 + 48) = v5;
  *(_BYTE *)(v6 + 88) = 3;
  *(_QWORD *)(v6 + 96) = 0x746867696548;
  *(_QWORD *)(v6 + 104) = 0xE600000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C30;
  *(_QWORD *)(inited + 32) = v0;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v6;
  v8 = MEMORY[0x1E0DEE9D8];
  v9 = 32;
  while (1)
  {
    v10 = *(_QWORD *)(inited + v9);
    v11 = *(_QWORD *)(v10 + 16);
    v12 = *(_QWORD *)(v8 + 16);
    v13 = v12 + v11;
    if (__OFADD__(v12, v11))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v13 > *(_QWORD *)(v8 + 24) >> 1)
    {
      if (v12 <= v13)
        v15 = v12 + v11;
      else
        v15 = v12;
      sub_19AA462CC(isUniquelyReferenced_nonNull_native, v15, 1, v8);
      v8 = v16;
    }
    if (*(_QWORD *)(v10 + 16))
    {
      v17 = *(_QWORD *)(v8 + 16);
      if ((*(_QWORD *)(v8 + 24) >> 1) - v17 < v11)
        goto LABEL_24;
      v18 = v8 + 80 * v17 + 32;
      if (v10 + 32 < v18 + 80 * v11 && v18 < v10 + 32 + 80 * v11)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v11)
      {
        v20 = *(_QWORD *)(v8 + 16);
        v21 = __OFADD__(v20, v11);
        v22 = v20 + v11;
        if (v21)
          goto LABEL_25;
        *(_QWORD *)(v8 + 16) = v22;
      }
    }
    else if (v11)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v9 += 8;
    if (v9 == 64)
    {
      swift_setDeallocating();
      sub_19AB2DAA8();
      return v8;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB42FD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[4];

  v4[3] = &type metadata for AssistantSchema.IntentSchema;
  v4[0] = 0xD000000000000010;
  v4[1] = 0x800000019ABB52A0;
  sub_19A9FEF48((uint64_t)v4, a1);
  v2 = sub_19AB43048();
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_19AB43048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
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
  unint64_t v52;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t result;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[24];
  uint64_t v66;
  _BYTE v67[24];
  uint64_t v68;
  _BYTE v69[48];
  _BYTE v70[40];
  _BYTE v71[40];
  _BYTE v72[40];
  __int128 v73;
  __int128 v74;
  _UNKNOWN **v75;
  char v76;
  _QWORD v77[5];
  __int128 v78;
  _QWORD v79[2];
  _UNKNOWN **v80;
  unint64_t v81;
  char v82;
  _BYTE v83[40];
  uint64_t v84;
  _BYTE v85[40];
  _BYTE v86[48];
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char v92;
  __int128 v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  char v97;

  v79[1] = &type metadata for EnumSchema;
  v80 = &off_1E397AEF8;
  v0 = swift_allocObject();
  *(_QWORD *)&v78 = v0;
  *(_QWORD *)(v0 + 16) = 0xD000000000000012;
  *(_QWORD *)(v0 + 24) = 0x800000019ABAF3E0;
  strcpy((char *)(v0 + 32), "Document Kind");
  *(_WORD *)(v0 + 46) = -4864;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v78, v1 + 32);
  v2 = sub_19AB42B58();
  *(_QWORD *)&v93 = 0xD000000000000010;
  *((_QWORD *)&v93 + 1) = 0x800000019ABAEF80;
  v94 = 1701273936;
  v95 = 0xE400000000000000;
  v96 = v2;
  v97 = 1;
  v3 = sub_19AB4D534(&v93);
  swift_bridgeObjectRelease();
  v4 = sub_19AB42C38();
  *(_QWORD *)&v88 = 0xD000000000000014;
  *((_QWORD *)&v88 + 1) = 0x800000019ABAEF60;
  v89 = 0x746E656D75636F44;
  v90 = 0xE800000000000000;
  v91 = v4;
  v92 = 1;
  v5 = sub_19AB4D534(&v88);
  swift_bridgeObjectRelease();
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v6 = sub_19AB445C4((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v7 = sub_19AB44A08();
  *(_QWORD *)&v78 = 0xD000000000000015;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB52C0;
  v79[0] = 0xD000000000000010;
  v79[1] = 0x800000019ABB52E0;
  v80 = (_UNKNOWN **)0xD000000000000030;
  v81 = 0x800000019ABB5300;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  v63 = v3;
  v64 = v1;
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v8 = 1;
      goto LABEL_7;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v8 = 0;
LABEL_7:
  v82 = v8;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v6;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v7;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v9 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v10 = sub_19AB44CBC((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v11 = sub_19AB452A4();
  *(_QWORD *)&v78 = 0xD000000000000015;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB5340;
  v79[0] = 0xD000000000000010;
  v79[1] = 0x800000019ABB5360;
  v80 = (_UNKNOWN **)0xD000000000000036;
  v81 = 0x800000019ABB5380;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v12 = 1;
      goto LABEL_13;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v12 = 0;
LABEL_13:
  v82 = v12;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v10;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v11;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v13 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, sizeof(v77));
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v14 = sub_19AB4551C((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v15 = sub_19AB4581C();
  strcpy((char *)&v78, "ReaderOpenPage");
  HIBYTE(v78) = -18;
  strcpy((char *)v79, "Open Page");
  WORD1(v79[1]) = 0;
  HIDWORD(v79[1]) = -385875968;
  v80 = (_UNKNOWN **)0xD00000000000002CLL;
  v81 = 0x800000019ABB53C0;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  v61 = v13;
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v16 = 1;
      goto LABEL_19;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v16 = 0;
LABEL_19:
  v82 = v16;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v14;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v15;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v17 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v18 = sub_19AB45AB0((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v19 = sub_19AB45DD0();
  *(_QWORD *)&v78 = 0xD000000000000016;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB53F0;
  v79[0] = 0xD000000000000011;
  v79[1] = 0x800000019ABB5410;
  v80 = (_UNKNOWN **)0xD000000000000016;
  v81 = 0x800000019ABB5430;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  v60 = v17;
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v20 = 1;
      goto LABEL_25;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v20 = 0;
LABEL_25:
  v82 = v20;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v18;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v19;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_19AB88C20;
  v59 = v21;
  sub_19AA19678(&v73, v21 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v22 = sub_19AB4603C((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v23 = sub_19AB464E0();
  *(_QWORD *)&v78 = 0xD000000000000015;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB5450;
  v79[0] = 0xD000000000000010;
  v79[1] = 0x800000019ABB5470;
  v80 = (_UNKNOWN **)0xD000000000000022;
  v81 = 0x800000019ABB5490;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v24 = 1;
      goto LABEL_31;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v24 = 0;
LABEL_31:
  v82 = v24;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v22;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v23;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_19AB88C20;
  v58 = v25;
  sub_19AA19678(&v73, v25 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v26 = sub_19AB46774((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v27 = sub_19AB46A44();
  *(_QWORD *)&v78 = 0xD000000000000013;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB54C0;
  strcpy((char *)v79, "Open Documents");
  HIBYTE(v79[1]) = -18;
  v80 = (_UNKNOWN **)0xD000000000000023;
  v81 = 0x800000019ABB54E0;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  v62 = v9;
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v28 = 1;
      goto LABEL_37;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v28 = 0;
LABEL_37:
  v82 = v28;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v26;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v27;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v29 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v30 = sub_19AB46CB0((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v31 = sub_19AB470FC();
  *(_QWORD *)&v78 = 0xD000000000000011;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB5510;
  strcpy((char *)v79, "Rotate Pages");
  BYTE5(v79[1]) = 0;
  HIWORD(v79[1]) = -5120;
  v80 = (_UNKNOWN **)0xD00000000000002CLL;
  v81 = 0x800000019ABB5530;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v32 = 1;
      goto LABEL_43;
    }
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
  }
  v32 = 0;
LABEL_43:
  v82 = v32;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v30;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v31;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v33 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C50;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v34 = sub_19AB473B0((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v35 = sub_19AB476EC();
  *(_QWORD *)&v78 = 0xD000000000000011;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB5560;
  strcpy((char *)v79, "Delete Pages");
  BYTE5(v79[1]) = 0;
  HIWORD(v79[1]) = -5120;
  v80 = (_UNKNOWN **)0xD00000000000001BLL;
  v81 = 0x800000019ABB5580;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
LABEL_48:
    v36 = 0;
    goto LABEL_49;
  }
  sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
  if ((v66 | 2) != 2)
  {
    sub_19AA19700((uint64_t)v65);
    sub_19AA19700((uint64_t)v67);
    goto LABEL_48;
  }
  sub_19AA19700((uint64_t)v67);
  v36 = 1;
LABEL_49:
  v82 = v36;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v34;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v35;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v37 + 32);
  sub_19AA19690((uint64_t)&v78);
  memset(v77, 0, 24);
  *(_OWORD *)&v77[3] = xmmword_19AB88C40;
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v76 = -1;
  v38 = sub_19AB47950((uint64_t)v72);
  sub_19A9EE838((uint64_t)v72, (uint64_t)v71, &qword_1EE3B9EA0);
  sub_19A9EE838((uint64_t)v77, (uint64_t)v70, &qword_1EE3B9EA8);
  sub_19A9EE838((uint64_t)&v73, (uint64_t)v69, (uint64_t *)&unk_1EE3B9EB0);
  v39 = sub_19AB47F40();
  *(_QWORD *)&v78 = 0xD000000000000011;
  *((_QWORD *)&v78 + 1) = 0x800000019ABB55A0;
  strcpy((char *)v79, "Insert Page");
  HIDWORD(v79[1]) = -352321536;
  v80 = (_UNKNOWN **)0xD000000000000026;
  v81 = 0x800000019ABB55C0;
  sub_19A9EE838((uint64_t)v70, (uint64_t)v67, &qword_1EE3B9EA8);
  if (v68 == 4)
  {
    sub_19A9FEB08((uint64_t)v67, &qword_1EE3B9EA8);
    v40 = 0;
    v42 = v58;
    v41 = v59;
  }
  else
  {
    sub_19AA196C4((uint64_t)v67, (uint64_t)v65);
    v42 = v58;
    v41 = v59;
    if ((v66 | 2) == 2)
    {
      sub_19AA19700((uint64_t)v67);
      v40 = 1;
    }
    else
    {
      sub_19AA19700((uint64_t)v65);
      sub_19AA19700((uint64_t)v67);
      v40 = 0;
    }
  }
  v82 = v40;
  sub_19AA19568((uint64_t)v71, (uint64_t)v83, &qword_1EE3B9EA0);
  v84 = v38;
  sub_19AA19568((uint64_t)v70, (uint64_t)v85, &qword_1EE3B9EA8);
  sub_19AA19568((uint64_t)v69, (uint64_t)v86, (uint64_t *)&unk_1EE3B9EB0);
  v87 = v39;
  sub_19A9FEB08((uint64_t)&v73, (uint64_t *)&unk_1EE3B9EB0);
  sub_19A9FEB08((uint64_t)v77, &qword_1EE3B9EA8);
  sub_19A9FEB08((uint64_t)v72, &qword_1EE3B9EA0);
  *((_QWORD *)&v74 + 1) = &type metadata for IntentSchema;
  v75 = &off_1E3981258;
  *(_QWORD *)&v73 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v78, v73 + 16);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v73, v43 + 32);
  sub_19AA19690((uint64_t)&v78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_19AB95C70;
  *(_QWORD *)(v44 + 32) = v64;
  *(_QWORD *)(v44 + 40) = v63;
  *(_QWORD *)(v44 + 48) = v5;
  *(_QWORD *)(v44 + 56) = v62;
  *(_QWORD *)(v44 + 64) = v61;
  *(_QWORD *)(v44 + 72) = v60;
  *(_QWORD *)(v44 + 80) = v41;
  *(_QWORD *)(v44 + 88) = v42;
  *(_QWORD *)(v44 + 96) = v29;
  *(_QWORD *)(v44 + 104) = v33;
  v45 = 32;
  *(_QWORD *)(v44 + 112) = v37;
  *(_QWORD *)(v44 + 120) = v43;
  v46 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v47 = *(_QWORD *)(v44 + v45);
    v48 = *(_QWORD *)(v47 + 16);
    v49 = *(_QWORD *)(v46 + 16);
    if (__OFADD__(v49, v48))
      break;
    swift_bridgeObjectRetain();
    if (!swift_isUniquelyReferenced_nonNull_native() || v49 + v48 > *(_QWORD *)(v46 + 24) >> 1)
    {
      sub_19AA46398();
      v46 = v50;
    }
    if (*(_QWORD *)(v47 + 16))
    {
      v51 = *(_QWORD *)(v46 + 16);
      if ((*(_QWORD *)(v46 + 24) >> 1) - v51 < v48)
        goto LABEL_74;
      v52 = v46 + 40 * v51 + 32;
      if (v47 + 32 < v52 + 40 * v48 && v52 < v47 + 32 + 40 * v48)
        goto LABEL_76;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC8);
      swift_arrayInitWithCopy();
      if (v48)
      {
        v54 = *(_QWORD *)(v46 + 16);
        v55 = __OFADD__(v54, v48);
        v56 = v54 + v48;
        if (v55)
          goto LABEL_75;
        *(_QWORD *)(v46 + 16) = v56;
      }
    }
    else if (v48)
    {
      goto LABEL_73;
    }
    swift_bridgeObjectRelease();
    v45 += 8;
    if (v45 == 128)
    {
      swift_setDeallocating();
      sub_19AB2DAC0();
      return v46;
    }
  }
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB445C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  unint64_t v16;
  ValueMetadata *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  __int16 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v1 = swift_allocObject();
  v2 = sub_19AB42C38();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000014;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEF60;
  *(_QWORD *)(v3 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v27 = 258;
  v26[0] = 0x746E656D75636F64;
  v26[1] = 0xE900000000000073;
  v26[2] = v1;
  v28 = 0x746E656D75636F44;
  v29 = 0xE900000000000073;
  v30 = 0xD000000000000013;
  v31 = 0x800000019ABB57B0;
  v15 = 0;
  v16 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  sub_19AA463C8();
  v25 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v26, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v23 = 0;
  v24 = 0xE000000000000000;
  v21 = 37;
  v22 = 0xE100000000000000;
  v19 = 9509;
  v20 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v25;
  v8 = v15;
  v9 = v16;
  v10 = sub_19AB448FC((uint64_t)&v15);
  sub_19A9FEB08((uint64_t)&v15, &qword_1EE3B9EA0);
  v17 = &type metadata for Summary;
  v18 = &off_1E399A1E0;
  v11 = (_QWORD *)swift_allocObject();
  v15 = v11;
  v11[2] = v7;
  v11[3] = v8;
  v11[4] = v9;
  v11[5] = v10;
  v12 = sub_19AAFE518(a1, &v15, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v26, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
  return v12;
}

uint64_t sub_19AB448FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x776B636F6C437369;
  *(_QWORD *)(v3 + 24) = 0xEB00000000657369;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x6F69746365726944;
  *(_QWORD *)(v3 + 88) = 0xE90000000000006ELL;
  *(_QWORD *)(v3 + 96) = 0xD00000000000002ALL;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB58B0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

uint64_t sub_19AB44A08()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97AB0;
  *(_QWORD *)(inited + 32) = &unk_1E3986BC8;
  *(_QWORD *)(inited + 40) = &unk_1E3986718;
  *(_QWORD *)(inited + 48) = &unk_1E39868F8;
  *(_QWORD *)(inited + 56) = &unk_1E3986A48;
  *(_QWORD *)(inited + 64) = &unk_1E3986A78;
  *(_QWORD *)(inited + 72) = &unk_1E3986AA8;
  *(_QWORD *)(inited + 80) = &unk_1E3986AD8;
  *(_QWORD *)(inited + 88) = &unk_1E3986B08;
  *(_QWORD *)(inited + 96) = &unk_1E3986B38;
  *(_QWORD *)(inited + 104) = &unk_1E3986B68;
  *(_QWORD *)(inited + 112) = &unk_1E3986B98;
  *(_QWORD *)(inited + 120) = &unk_1E3986748;
  *(_QWORD *)(inited + 128) = &unk_1E3986778;
  *(_QWORD *)(inited + 136) = &unk_1E39867A8;
  *(_QWORD *)(inited + 144) = &unk_1E39867D8;
  *(_QWORD *)(inited + 152) = &unk_1E399ED70;
  *(_QWORD *)(inited + 160) = &unk_1E3986808;
  *(_QWORD *)(inited + 168) = &unk_1E3986838;
  *(_QWORD *)(inited + 176) = &unk_1E3986868;
  *(_QWORD *)(inited + 184) = &unk_1E3986898;
  *(_QWORD *)(inited + 192) = &unk_1E39868C8;
  *(_QWORD *)(inited + 200) = &unk_1E3986928;
  *(_QWORD *)(inited + 208) = &unk_1E3986958;
  *(_QWORD *)(inited + 216) = &unk_1E3986988;
  *(_QWORD *)(inited + 224) = &unk_1E39869B8;
  *(_QWORD *)(inited + 232) = &unk_1E39869E8;
  *(_QWORD *)(inited + 240) = &unk_1E3986A18;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 248)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB44CBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v21;
  unint64_t v22;
  ValueMetadata *v23;
  _UNKNOWN **v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD v32[7];
  __int16 v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD v38[7];
  __int16 v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD v44[7];
  __int16 v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;

  v1 = swift_allocObject();
  v2 = sub_19AB42C38();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000014;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEF60;
  *(_QWORD *)(v3 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v45 = 258;
  v44[0] = 0x746E656D75636F64;
  v44[1] = 0xE900000000000073;
  v44[2] = v1;
  v46 = 0x746E656D75636F44;
  v47 = 0xE900000000000073;
  v48 = 0xD000000000000013;
  v49 = 0x800000019ABB57B0;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 1;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_OWORD *)(v4 + 40) = 0u;
  *(_BYTE *)(v4 + 56) = 4;
  v39 = 259;
  v38[0] = 0x6874646977;
  v38[1] = 0xE500000000000000;
  v38[2] = v4;
  v40 = 0x6874646957;
  v41 = 0xE500000000000000;
  v42 = 0xD000000000000063;
  v43 = 0x800000019ABB57D0;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = 1;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_BYTE *)(v5 + 56) = 4;
  v33 = 259;
  v32[0] = 0x746867696568;
  v32[1] = 0xE600000000000000;
  v32[2] = v5;
  v34 = 0x746867696548;
  v35 = 0xE600000000000000;
  v36 = 0xD000000000000063;
  v37 = 0x800000019ABB5840;
  v21 = 0;
  v22 = 0xE000000000000000;
  MEMORY[0x19AECE804](20);
  sub_19AA463C8();
  v31 = v6;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v9;
  sub_19A9EE838((uint64_t)v44, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v8;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v38, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v12 + 56) = v8;
  *(_QWORD *)(v12 + 64) = &off_1E398E1D8;
  v13 = swift_allocObject();
  *(_QWORD *)(v12 + 32) = v13;
  sub_19A9EE838((uint64_t)v32, v13 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v29 = 0;
  v30 = 0xE000000000000000;
  v27 = 37;
  v28 = 0xE100000000000000;
  v25 = 9509;
  v26 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v14 = v21;
  v15 = v22;
  v23 = &type metadata for Summary;
  v24 = &off_1E399A1E0;
  v16 = (_QWORD *)swift_allocObject();
  v21 = v16;
  v16[2] = v31;
  v16[3] = v14;
  v16[4] = v15;
  v17 = MEMORY[0x1E0DEE9D8];
  v16[5] = MEMORY[0x1E0DEE9D8];
  v18 = sub_19AAFE518(a1, &v21, v17);
  sub_19A9FEB08((uint64_t)v32, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v38, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v44, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v21);
  return v18;
}

uint64_t sub_19AB452A4()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97250;
  *(_QWORD *)(inited + 32) = &unk_1E3987EE8;
  *(_QWORD *)(inited + 40) = &unk_1E3987B58;
  *(_QWORD *)(inited + 48) = &unk_1E3987D38;
  *(_QWORD *)(inited + 56) = &unk_1E3987D68;
  *(_QWORD *)(inited + 64) = &unk_1E3987D98;
  *(_QWORD *)(inited + 72) = &unk_1E3987DC8;
  *(_QWORD *)(inited + 80) = &unk_1E3987DF8;
  *(_QWORD *)(inited + 88) = &unk_1E3987E28;
  *(_QWORD *)(inited + 96) = &unk_1E3987E58;
  *(_QWORD *)(inited + 104) = &unk_1E3987E88;
  *(_QWORD *)(inited + 112) = &unk_1E3987EB8;
  *(_QWORD *)(inited + 120) = &unk_1E3987B88;
  *(_QWORD *)(inited + 128) = &unk_1E3987BB8;
  *(_QWORD *)(inited + 136) = &unk_1E3987BE8;
  *(_QWORD *)(inited + 144) = &unk_1E3987C18;
  *(_QWORD *)(inited + 152) = &unk_1E3987C48;
  *(_QWORD *)(inited + 160) = &unk_1E3987C78;
  *(_QWORD *)(inited + 168) = &unk_1E399EDA0;
  *(_QWORD *)(inited + 176) = &unk_1E3987CA8;
  *(_QWORD *)(inited + 184) = &unk_1E3987CD8;
  *(_QWORD *)(inited + 192) = &unk_1E3987D08;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 200)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB4551C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB42B58();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000010;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAEF80;
  *(_QWORD *)(v2 + 32) = 1701273936;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 1701273936;
  v27 = 0xE400000000000000;
  strcpy((char *)v28, "Page to go to");
  v28[7] = -4864;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19A9EE838((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB08((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB4581C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C00;
  *(_QWORD *)(inited + 32) = &unk_1E3988368;
  *(_QWORD *)(inited + 40) = &unk_1E3987F18;
  *(_QWORD *)(inited + 48) = &unk_1E3988128;
  *(_QWORD *)(inited + 56) = &unk_1E39881E8;
  *(_QWORD *)(inited + 64) = &unk_1E3988218;
  *(_QWORD *)(inited + 72) = &unk_1E3988248;
  *(_QWORD *)(inited + 80) = &unk_1E3988278;
  *(_QWORD *)(inited + 88) = &unk_1E39882A8;
  *(_QWORD *)(inited + 96) = &unk_1E39882D8;
  *(_QWORD *)(inited + 104) = &unk_1E3988308;
  *(_QWORD *)(inited + 112) = &unk_1E3988338;
  *(_QWORD *)(inited + 120) = &unk_1E3987F48;
  *(_QWORD *)(inited + 128) = &unk_1E3987F78;
  *(_QWORD *)(inited + 136) = &unk_1E3987FA8;
  *(_QWORD *)(inited + 144) = &unk_1E3987FD8;
  *(_QWORD *)(inited + 152) = &unk_1E3988008;
  *(_QWORD *)(inited + 160) = &unk_1E3988038;
  *(_QWORD *)(inited + 168) = &unk_1E3988068;
  *(_QWORD *)(inited + 176) = &unk_1E3988098;
  *(_QWORD *)(inited + 184) = &unk_1E39880C8;
  *(_QWORD *)(inited + 192) = &unk_1E39880F8;
  *(_QWORD *)(inited + 200) = &unk_1E3988158;
  *(_QWORD *)(inited + 208) = &unk_1E3988188;
  *(_QWORD *)(inited + 216) = &unk_1E39881B8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 224)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB45AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB42C38();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000014;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEF60;
  *(_QWORD *)(v3 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x746567726174;
  v25[1] = 0xE600000000000000;
  v25[2] = v1;
  v27 = 0x746E656D75636F44;
  v28 = 0xE900000000000073;
  v29 = 0xD000000000000022;
  v30 = 0x800000019ABB5780;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](10);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB45DD0()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E3988728;
  *(_QWORD *)(inited + 40) = &unk_1E3988398;
  *(_QWORD *)(inited + 48) = &unk_1E3988578;
  *(_QWORD *)(inited + 56) = &unk_1E39885A8;
  *(_QWORD *)(inited + 64) = &unk_1E39885D8;
  *(_QWORD *)(inited + 72) = &unk_1E3988608;
  *(_QWORD *)(inited + 80) = &unk_1E3988638;
  *(_QWORD *)(inited + 88) = &unk_1E3988668;
  *(_QWORD *)(inited + 96) = &unk_1E3988698;
  *(_QWORD *)(inited + 104) = &unk_1E39886C8;
  *(_QWORD *)(inited + 112) = &unk_1E39886F8;
  *(_QWORD *)(inited + 120) = &unk_1E39883C8;
  *(_QWORD *)(inited + 128) = &unk_1E39883F8;
  *(_QWORD *)(inited + 136) = &unk_1E3988428;
  *(_QWORD *)(inited + 144) = &unk_1E3988458;
  *(_QWORD *)(inited + 152) = &unk_1E3988488;
  *(_QWORD *)(inited + 160) = &unk_1E39884B8;
  *(_QWORD *)(inited + 168) = &unk_1E39884E8;
  *(_QWORD *)(inited + 176) = &unk_1E3988518;
  *(_QWORD *)(inited + 184) = &unk_1E3988548;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB4603C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v17;
  unint64_t v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int16 v31;
  _WORD v32[8];
  unint64_t v33;
  unint64_t v34;
  _QWORD v35[7];
  __int16 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v1 = swift_allocObject();
  v2 = sub_19AB42C38();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000014;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEF60;
  *(_QWORD *)(v3 + 32) = 0x746E656D75636F44;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v36 = 258;
  v35[0] = 0x746E656D75636F64;
  v35[1] = 0xE900000000000073;
  v35[2] = v1;
  v37 = 0x746E656D75636F44;
  v38 = 0xE900000000000073;
  v39 = 0xD000000000000016;
  v40 = 0x800000019ABB5730;
  v28[1] = 0xE800000000000000;
  v28[2] = 3;
  v29 = 0u;
  v30 = 0u;
  v31 = 260;
  v28[0] = 0x6169726574697263;
  strcpy((char *)v32, "Search Terms");
  HIBYTE(v32[6]) = 0;
  v32[7] = -5120;
  v33 = 0xD000000000000029;
  v34 = 0x800000019ABB5750;
  v17 = 0;
  v18 = 0xE000000000000000;
  MEMORY[0x19AECE804](15);
  sub_19AA463C8();
  v27 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v28, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19A9EE838((uint64_t)v35, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v25 = 0;
  v26 = 0xE000000000000000;
  v23 = 37;
  v24 = 0xE100000000000000;
  v21 = 9509;
  v22 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v10 = v17;
  v11 = v18;
  v19 = &type metadata for Summary;
  v20 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v17 = v12;
  v12[2] = v27;
  v12[3] = v10;
  v12[4] = v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v12[5] = MEMORY[0x1E0DEE9D8];
  v14 = sub_19AAFE518(a1, &v17, v13);
  sub_19A9FEB08((uint64_t)v28, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v35, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v17);
  return v14;
}

uint64_t sub_19AB464E0()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95C00;
  *(_QWORD *)(inited + 32) = &unk_1E3988BA8;
  *(_QWORD *)(inited + 40) = &unk_1E3988758;
  *(_QWORD *)(inited + 48) = &unk_1E3988968;
  *(_QWORD *)(inited + 56) = &unk_1E3988A28;
  *(_QWORD *)(inited + 64) = &unk_1E3988A58;
  *(_QWORD *)(inited + 72) = &unk_1E3988A88;
  *(_QWORD *)(inited + 80) = &unk_1E3988AB8;
  *(_QWORD *)(inited + 88) = &unk_1E3988AE8;
  *(_QWORD *)(inited + 96) = &unk_1E3988B18;
  *(_QWORD *)(inited + 104) = &unk_1E3988B48;
  *(_QWORD *)(inited + 112) = &unk_1E3988B78;
  *(_QWORD *)(inited + 120) = &unk_1E3988788;
  *(_QWORD *)(inited + 128) = &unk_1E39887B8;
  *(_QWORD *)(inited + 136) = &unk_1E39887E8;
  *(_QWORD *)(inited + 144) = &unk_1E3988818;
  *(_QWORD *)(inited + 152) = &unk_1E3988848;
  *(_QWORD *)(inited + 160) = &unk_1E3988878;
  *(_QWORD *)(inited + 168) = &unk_1E39888A8;
  *(_QWORD *)(inited + 176) = &unk_1E39888D8;
  *(_QWORD *)(inited + 184) = &unk_1E3988908;
  *(_QWORD *)(inited + 192) = &unk_1E3988938;
  *(_QWORD *)(inited + 200) = &unk_1E3988998;
  *(_QWORD *)(inited + 208) = &unk_1E39889C8;
  *(_QWORD *)(inited + 216) = &unk_1E39889F8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 224)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB46774(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v12;
  unint64_t v13;
  ValueMetadata *v14;
  _UNKNOWN **v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[7];
  __int16 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 8;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_BYTE *)(v1 + 56) = 4;
  v24 = 258;
  v23[0] = 0x73656C6966;
  v23[1] = 0xE500000000000000;
  v23[2] = v1;
  v25 = 0x746E656D75636F44;
  v26 = 0xE900000000000073;
  v27 = 0xD000000000000028;
  v28 = 0x800000019ABB5700;
  v12 = 0;
  v13 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v2 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v22 = v3;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v5 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v5;
  sub_19A9EE838((uint64_t)v23, v5 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v20 = 0;
  v21 = 0xE000000000000000;
  v18 = 37;
  v19 = 0xE100000000000000;
  v16 = 9509;
  v17 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v6 = v12;
  v7 = v13;
  v14 = &type metadata for Summary;
  v15 = &off_1E399A1E0;
  v8 = (_QWORD *)swift_allocObject();
  v12 = v8;
  v8[2] = v22;
  v8[3] = v6;
  v8[4] = v7;
  v8[5] = v2;
  v9 = sub_19AAFE518(a1, &v12, v2);
  sub_19A9FEB08((uint64_t)v23, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v12);
  return v9;
}

uint64_t sub_19AB46A44()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BA0;
  *(_QWORD *)(inited + 32) = &unk_1E3986F58;
  *(_QWORD *)(inited + 40) = &unk_1E3986BF8;
  *(_QWORD *)(inited + 48) = &unk_1E3986DA8;
  *(_QWORD *)(inited + 56) = &unk_1E3986DD8;
  *(_QWORD *)(inited + 64) = &unk_1E3986E08;
  *(_QWORD *)(inited + 72) = &unk_1E3986E38;
  *(_QWORD *)(inited + 80) = &unk_1E3986E68;
  *(_QWORD *)(inited + 88) = &unk_1E3986E98;
  *(_QWORD *)(inited + 96) = &unk_1E3986EC8;
  *(_QWORD *)(inited + 104) = &unk_1E3986EF8;
  *(_QWORD *)(inited + 112) = &unk_1E3986F28;
  *(_QWORD *)(inited + 120) = &unk_1E3986C28;
  *(_QWORD *)(inited + 128) = &unk_1E3986C58;
  *(_QWORD *)(inited + 136) = &unk_1E3986C88;
  *(_QWORD *)(inited + 144) = &unk_1E3986CB8;
  *(_QWORD *)(inited + 152) = &unk_1E3986CE8;
  *(_QWORD *)(inited + 160) = &unk_1E3986D18;
  *(_QWORD *)(inited + 168) = &unk_1E3986D48;
  *(_QWORD *)(inited + 176) = &unk_1E399EDD0;
  *(_QWORD *)(inited + 184) = &unk_1E3986D78;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 192)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB46CB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v15;
  unint64_t v16;
  ValueMetadata *v17;
  _UNKNOWN **v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  __int16 v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v2 = swift_allocObject();
  v3 = sub_19AB42B58();
  *(_QWORD *)(v2 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v2 + 48) = &off_1E39811C0;
  v4 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)(v4 + 16) = 0xD000000000000010;
  *(_QWORD *)(v4 + 24) = 0x800000019ABAEF80;
  *(_QWORD *)(v4 + 32) = 1701273936;
  *(_QWORD *)(v4 + 40) = 0xE400000000000000;
  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 56) = 1;
  *(_BYTE *)(v2 + 56) = 1;
  v27 = 258;
  v26[0] = 0x7365676170;
  v26[1] = 0xE500000000000000;
  v26[2] = v2;
  v28 = 0x7365676150;
  v29 = 0xE500000000000000;
  v30 = 0x6F74207365676150;
  v31 = 0xEF657461746F7220;
  v15 = 0;
  v16 = 0xE000000000000000;
  MEMORY[0x19AECE804](10);
  sub_19AA463C8();
  v25 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v26, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v23 = 32;
  v24 = 0xE100000000000000;
  v21 = 37;
  v22 = 0xE100000000000000;
  v19 = 9509;
  v20 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v25;
  v9 = v15;
  v10 = v16;
  v11 = sub_19AB46FF0((uint64_t)&v15);
  sub_19A9FEB08((uint64_t)&v15, &qword_1EE3B9EA0);
  v17 = &type metadata for Summary;
  v18 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v15 = v12;
  v12[2] = v8;
  v12[3] = v9;
  v12[4] = v10;
  v12[5] = v11;
  v13 = sub_19AAFE518(a1, &v15, MEMORY[0x1E0DEE9D8]);
  sub_19A9FEB08((uint64_t)v26, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
  return v13;
}

uint64_t sub_19AB46FF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v2 + 64) = &off_1E398E1D8;
  v3 = swift_allocObject();
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v3 + 16) = 0x776B636F6C437369;
  *(_QWORD *)(v3 + 24) = 0xEB00000000657369;
  *(_QWORD *)(v3 + 32) = 2;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_BYTE *)(v3 + 72) = 4;
  *(_BYTE *)(v3 + 73) = 1;
  *(_QWORD *)(v3 + 80) = 0x7369776B636F6C43;
  *(_QWORD *)(v3 + 88) = 0xE900000000000065;
  *(_QWORD *)(v3 + 96) = 0xD000000000000026;
  *(_QWORD *)(v3 + 104) = 0x800000019ABB56D0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v2;
}

uint64_t sub_19AB470FC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97AB0;
  *(_QWORD *)(inited + 32) = &unk_1E3987468;
  *(_QWORD *)(inited + 40) = &unk_1E3986F88;
  *(_QWORD *)(inited + 48) = &unk_1E3987198;
  *(_QWORD *)(inited + 56) = &unk_1E39872E8;
  *(_QWORD *)(inited + 64) = &unk_1E3987318;
  *(_QWORD *)(inited + 72) = &unk_1E3987348;
  *(_QWORD *)(inited + 80) = &unk_1E3987378;
  *(_QWORD *)(inited + 88) = &unk_1E39873A8;
  *(_QWORD *)(inited + 96) = &unk_1E39873D8;
  *(_QWORD *)(inited + 104) = &unk_1E3987408;
  *(_QWORD *)(inited + 112) = &unk_1E3987438;
  *(_QWORD *)(inited + 120) = &unk_1E3986FB8;
  *(_QWORD *)(inited + 128) = &unk_1E3986FE8;
  *(_QWORD *)(inited + 136) = &unk_1E3987018;
  *(_QWORD *)(inited + 144) = &unk_1E3987048;
  *(_QWORD *)(inited + 152) = &unk_1E3987078;
  *(_QWORD *)(inited + 160) = &unk_1E39870A8;
  *(_QWORD *)(inited + 168) = &unk_1E39870D8;
  *(_QWORD *)(inited + 176) = &unk_1E3987108;
  *(_QWORD *)(inited + 184) = &unk_1E3987138;
  *(_QWORD *)(inited + 192) = &unk_1E3987168;
  *(_QWORD *)(inited + 200) = &unk_1E39871C8;
  *(_QWORD *)(inited + 208) = &unk_1E39871F8;
  *(_QWORD *)(inited + 216) = &unk_1E3987228;
  *(_QWORD *)(inited + 224) = &unk_1E3987258;
  *(_QWORD *)(inited + 232) = &unk_1E3987288;
  *(_QWORD *)(inited + 240) = &unk_1E39872B8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 248)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB473B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[7];
  __int16 v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v1 = swift_allocObject();
  v2 = sub_19AB42B58();
  *(_QWORD *)(v1 + 40) = &type metadata for EntitySchema;
  *(_QWORD *)(v1 + 48) = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000010;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEF80;
  *(_QWORD *)(v3 + 32) = 1701273936;
  *(_QWORD *)(v3 + 40) = 0xE400000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  *(_BYTE *)(v1 + 56) = 1;
  v26 = 258;
  v25[0] = 0x7365697469746E65;
  v25[1] = 0xE800000000000000;
  v25[2] = v1;
  v27 = 0x7365676150;
  v28 = 0xE500000000000000;
  v29 = 0x6F74207365676150;
  v30 = 0xEF6574656C656420;
  v14 = 0;
  v15 = 0xE000000000000000;
  MEMORY[0x19AECE804](9);
  v4 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v24 = v5;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v25, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v22 = 0;
  v23 = 0xE000000000000000;
  v20 = 37;
  v21 = 0xE100000000000000;
  v18 = 9509;
  v19 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v8 = v14;
  v9 = v15;
  v16 = &type metadata for Summary;
  v17 = &off_1E399A1E0;
  v10 = (_QWORD *)swift_allocObject();
  v14 = v10;
  v10[2] = v24;
  v10[3] = v8;
  v10[4] = v9;
  v10[5] = v4;
  v11 = sub_19AAFE518(a1, &v14, v4);
  sub_19A9FEB08((uint64_t)v25, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v14);
  return v11;
}

uint64_t sub_19AB476EC()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97B20;
  *(_QWORD *)(inited + 32) = &unk_1E39877F8;
  *(_QWORD *)(inited + 40) = &unk_1E3987498;
  *(_QWORD *)(inited + 48) = &unk_1E3987648;
  *(_QWORD *)(inited + 56) = &unk_1E3987678;
  *(_QWORD *)(inited + 64) = &unk_1E39876A8;
  *(_QWORD *)(inited + 72) = &unk_1E39876D8;
  *(_QWORD *)(inited + 80) = &unk_1E3987708;
  *(_QWORD *)(inited + 88) = &unk_1E3987738;
  *(_QWORD *)(inited + 96) = &unk_1E3987768;
  *(_QWORD *)(inited + 104) = &unk_1E3987798;
  *(_QWORD *)(inited + 112) = &unk_1E39877C8;
  *(_QWORD *)(inited + 120) = &unk_1E39874C8;
  *(_QWORD *)(inited + 128) = &unk_1E39874F8;
  *(_QWORD *)(inited + 136) = &unk_1E3987528;
  *(_QWORD *)(inited + 144) = &unk_1E3987558;
  *(_QWORD *)(inited + 152) = &unk_1E3987588;
  *(_QWORD *)(inited + 160) = &unk_1E39875B8;
  *(_QWORD *)(inited + 168) = &unk_1E39875E8;
  *(_QWORD *)(inited + 176) = &unk_1E3987618;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 184)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB47950(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v19;
  unint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  __int16 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD v36[2];
  _BYTE v37[48];
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD v42[5];
  char v43;
  _QWORD v44[7];
  __int16 v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 8;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_BYTE *)(v1 + 56) = 4;
  v45 = 258;
  v44[0] = 0x73656C6966;
  v44[1] = 0xE500000000000000;
  v44[2] = v1;
  v46 = 0x746E656D75636F44;
  v47 = 0xE900000000000073;
  v48 = 0xD000000000000025;
  v49 = 0x800000019ABB55F0;
  v42[0] = 0x7265746641;
  v42[1] = 0xE500000000000000;
  v42[2] = 0x65726F666542;
  v42[3] = 0xE600000000000000;
  v43 = 0;
  sub_19AAF9984((uint64_t)v42, (uint64_t)v37);
  v36[0] = 0x72657466417369;
  v36[1] = 0xE700000000000000;
  v37[41] = 1;
  v38 = 0xD000000000000012;
  v39 = 0x800000019ABB5620;
  v40 = 0xD000000000000045;
  v41 = 0x800000019ABB5640;
  v2 = sub_19AB42B58();
  v30[5] = &type metadata for EntitySchema;
  v30[6] = &off_1E39811C0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0xD000000000000010;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAEF80;
  *(_QWORD *)(v3 + 32) = 1701273936;
  *(_QWORD *)(v3 + 40) = 0xE400000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  v31 = 257;
  v30[0] = 1701273968;
  v30[1] = 0xE400000000000000;
  v30[2] = v3;
  v32 = 1701273936;
  v33 = 0xE400000000000000;
  v34 = 0xD000000000000031;
  v35 = 0x800000019ABB5690;
  v19 = 0;
  v20 = 0xE000000000000000;
  MEMORY[0x19AECE804](15);
  sub_19AA463C8();
  v29 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19A9EE838((uint64_t)v44, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19A9EE838((uint64_t)v36, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v10 + 56) = v6;
  *(_QWORD *)(v10 + 64) = &off_1E398E1D8;
  v11 = swift_allocObject();
  *(_QWORD *)(v10 + 32) = v11;
  sub_19A9EE838((uint64_t)v30, v11 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v27 = 0;
  v28 = 0xE000000000000000;
  v25 = 37;
  v26 = 0xE100000000000000;
  v23 = 9509;
  v24 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v12 = v19;
  v13 = v20;
  v21 = &type metadata for Summary;
  v22 = &off_1E399A1E0;
  v14 = (_QWORD *)swift_allocObject();
  v19 = v14;
  v14[2] = v29;
  v14[3] = v12;
  v14[4] = v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v14[5] = MEMORY[0x1E0DEE9D8];
  v16 = sub_19AAFE518(a1, &v19, v15);
  sub_19A9FEB08((uint64_t)v30, &qword_1EE3B9EE8);
  sub_19A9FEB08((uint64_t)v36, &qword_1EE3B9EE8);
  sub_19AAF7690((uint64_t)v42);
  sub_19A9FEB08((uint64_t)v44, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v19);
  return v16;
}

uint64_t sub_19AB47F40()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C60;
  *(_QWORD *)(inited + 32) = &unk_1E3987B28;
  *(_QWORD *)(inited + 40) = &unk_1E3987828;
  *(_QWORD *)(inited + 48) = &unk_1E3987978;
  *(_QWORD *)(inited + 56) = &unk_1E39879A8;
  *(_QWORD *)(inited + 64) = &unk_1E39879D8;
  *(_QWORD *)(inited + 72) = &unk_1E3987A08;
  *(_QWORD *)(inited + 80) = &unk_1E3987A38;
  *(_QWORD *)(inited + 88) = &unk_1E3987A68;
  *(_QWORD *)(inited + 96) = &unk_1E3987A98;
  *(_QWORD *)(inited + 104) = &unk_1E3987AC8;
  *(_QWORD *)(inited + 112) = &unk_1E3987AF8;
  *(_QWORD *)(inited + 120) = &unk_1E3987858;
  *(_QWORD *)(inited + 128) = &unk_1E3987888;
  *(_QWORD *)(inited + 136) = &unk_1E39878B8;
  *(_QWORD *)(inited + 144) = &unk_1E39878E8;
  *(_QWORD *)(inited + 152) = &unk_1E3987918;
  *(_QWORD *)(inited + 160) = &unk_1E3987948;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 168)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB48194()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

uint64_t sub_19AB481B8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 96))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) >= 5uLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 120);
  switch(*(_BYTE *)(v0 + 200))
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 160);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB48260()
{
  uint64_t v0;

  switch(*(_BYTE *)(v0 + 56))
  {
    case 0:
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_3();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

uint64_t sub_19AB482BC()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB482E8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  switch(*(_BYTE *)(v0 + 72))
  {
    case 0:
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB4835C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for BooksDomain()
{
  return &type metadata for BooksDomain;
}

uint64_t sub_19AB483A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  __n128 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  uint64_t v35;
  __n128 *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __n128 v44;
  uint64_t v45;
  uint64_t v46;
  __n128 *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __n128 v55;
  uint64_t v56;
  uint64_t inited;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t result;
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
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v0 = OUTLINED_FUNCTION_4_13();
  *(_QWORD *)(v0 + 16) = 3;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_BYTE *)(v0 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v1 + 32) = 0x656C746974;
  *(_QWORD *)(v1 + 40) = 0xE500000000000000;
  *(_QWORD *)(v1 + 48) = v0;
  *(_BYTE *)(v1 + 88) = 3;
  *(_QWORD *)(v1 + 96) = 0x656C746954;
  *(_QWORD *)(v1 + 104) = 0xE500000000000000;
  v2 = OUTLINED_FUNCTION_4_13();
  *(_QWORD *)(v2 + 16) = 3;
  v3 = (__n128 *)OUTLINED_FUNCTION_1_13(v2);
  OUTLINED_FUNCTION_22_5(v3, v4, v5, v6, v7, v8, v9, v10, v74, v79, v84, v89, v11);
  *(_QWORD *)(v12 + 32) = 0x6954736569726573;
  *(_QWORD *)(v12 + 40) = 0xEB00000000656C74;
  *(_QWORD *)(v12 + 48) = v2;
  *(_BYTE *)(v12 + 88) = 3;
  strcpy((char *)(v12 + 96), "Series Title");
  *(_BYTE *)(v12 + 109) = 0;
  *(_WORD *)(v12 + 110) = -5120;
  v13 = OUTLINED_FUNCTION_4_13();
  *(_QWORD *)(v13 + 16) = 3;
  v14 = (__n128 *)OUTLINED_FUNCTION_1_13(v13);
  OUTLINED_FUNCTION_22_5(v14, v15, v16, v17, v18, v19, v20, v21, v75, v80, v85, v90, v22);
  *(_QWORD *)(v23 + 32) = 0x726F68747561;
  *(_QWORD *)(v23 + 40) = 0xE600000000000000;
  *(_QWORD *)(v23 + 48) = v13;
  *(_BYTE *)(v23 + 88) = 3;
  *(_QWORD *)(v23 + 96) = 0x726F68747541;
  *(_QWORD *)(v23 + 104) = 0xE600000000000000;
  v24 = OUTLINED_FUNCTION_4_13();
  *(_QWORD *)(v24 + 16) = 3;
  v25 = (__n128 *)OUTLINED_FUNCTION_1_13(v24);
  OUTLINED_FUNCTION_22_5(v25, v26, v27, v28, v29, v30, v31, v32, v76, v81, v86, v91, v33);
  *(_QWORD *)(v34 + 32) = 0x65726E6567;
  *(_QWORD *)(v34 + 40) = 0xE500000000000000;
  *(_QWORD *)(v34 + 48) = v24;
  *(_BYTE *)(v34 + 88) = 3;
  *(_QWORD *)(v34 + 96) = 0x65726E6547;
  *(_QWORD *)(v34 + 104) = 0xE500000000000000;
  v35 = OUTLINED_FUNCTION_4_13();
  *(_QWORD *)(v35 + 16) = 6;
  v36 = (__n128 *)OUTLINED_FUNCTION_1_13(v35);
  OUTLINED_FUNCTION_22_5(v36, v37, v38, v39, v40, v41, v42, v43, v77, v82, v87, v92, v44);
  strcpy((char *)(v45 + 32), "purchaseDate");
  *(_BYTE *)(v45 + 45) = 0;
  *(_WORD *)(v45 + 46) = -5120;
  *(_QWORD *)(v45 + 48) = v35;
  *(_BYTE *)(v45 + 88) = 3;
  *(_QWORD *)(v45 + 96) = 0xD000000000000010;
  *(_QWORD *)(v45 + 104) = 0x800000019ABB5F40;
  v46 = OUTLINED_FUNCTION_4_13();
  *(_QWORD *)(v46 + 16) = 7;
  v47 = (__n128 *)OUTLINED_FUNCTION_1_13(v46);
  OUTLINED_FUNCTION_22_5(v47, v48, v49, v50, v51, v52, v53, v54, v78, v83, v88, v93, v55);
  *(_QWORD *)(v56 + 32) = 7107189;
  *(_QWORD *)(v56 + 40) = 0xE300000000000000;
  *(_QWORD *)(v56 + 48) = v46;
  *(_BYTE *)(v56 + 88) = 3;
  *(_QWORD *)(v56 + 96) = 5001813;
  *(_QWORD *)(v56 + 104) = 0xE300000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = v14;
  *(_QWORD *)(inited + 56) = v25;
  *(_QWORD *)(inited + 64) = v36;
  *(_QWORD *)(inited + 72) = v47;
  v58 = MEMORY[0x1E0DEE9D8];
  v59 = 32;
  while (1)
  {
    v60 = *(_QWORD *)(inited + v59);
    v61 = *(_QWORD *)(v60 + 16);
    v62 = *(_QWORD *)(v58 + 16);
    v63 = v62 + v61;
    if (__OFADD__(v62, v61))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v63 > *(_QWORD *)(v58 + 24) >> 1)
    {
      if (v62 <= v63)
        v65 = v62 + v61;
      else
        v65 = v62;
      sub_19AA462CC(isUniquelyReferenced_nonNull_native, v65, 1, v58);
      v58 = v66;
    }
    if (*(_QWORD *)(v60 + 16))
    {
      v67 = *(_QWORD *)(v58 + 16);
      if ((*(_QWORD *)(v58 + 24) >> 1) - v67 < v61)
        goto LABEL_24;
      v68 = v58 + 80 * v67 + 32;
      if (v60 + 32 < v68 + 80 * v61 && v68 < v60 + 32 + 80 * v61)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v61)
      {
        v70 = *(_QWORD *)(v58 + 16);
        v71 = __OFADD__(v70, v61);
        v72 = v70 + v61;
        if (v71)
          goto LABEL_25;
        *(_QWORD *)(v58 + 16) = v72;
      }
    }
    else if (v61)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v59 += 8;
    if (v59 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAA8();
      return v58;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB48764()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;

  v0 = (_QWORD *)swift_allocObject();
  v0[2] = 0x746E6F466B6F6F42;
  v0[3] = 0xE800000000000000;
  v0[4] = 0x6E6F46206B6F6F42;
  v0[5] = 0xE900000000000074;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v1 + 32) = 1953394534;
  *(_QWORD *)(v1 + 40) = 0xE400000000000000;
  *(_QWORD *)(v1 + 48) = v0;
  *(_QWORD *)(v1 + 72) = &type metadata for EnumSchema;
  *(_QWORD *)(v1 + 80) = &off_1E397AEF8;
  *(_BYTE *)(v1 + 88) = 1;
  *(_QWORD *)(v1 + 96) = 1953394502;
  *(_QWORD *)(v1 + 104) = 0xE400000000000000;
  v2 = swift_allocObject();
  strcpy((char *)(v2 + 16), "BookFontSize");
  *(_BYTE *)(v2 + 29) = 0;
  *(_WORD *)(v2 + 30) = -5120;
  strcpy((char *)(v2 + 32), "Book Font Size");
  *(_BYTE *)(v2 + 47) = -18;
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v3 + 32) = 0x657A6953746E6F66;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = v2;
  *(_QWORD *)(v3 + 72) = &type metadata for EnumSchema;
  *(_QWORD *)(v3 + 80) = &off_1E397AEF8;
  *(_BYTE *)(v3 + 88) = 1;
  *(_QWORD *)(v3 + 96) = 0x7A695320746E6F46;
  *(_QWORD *)(v3 + 104) = 0xE900000000000065;
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0x6D6568546B6F6F42;
  v4[3] = 0xE900000000000065;
  v4[4] = 0x656854206B6F6F42;
  v4[5] = 0xEA0000000000656DLL;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v5 + 32) = 0x656D656874;
  *(_QWORD *)(v5 + 40) = 0xE500000000000000;
  *(_QWORD *)(v5 + 48) = v4;
  *(_QWORD *)(v5 + 72) = &type metadata for EnumSchema;
  *(_QWORD *)(v5 + 80) = &off_1E397AEF8;
  *(_BYTE *)(v5 + 88) = 1;
  *(_QWORD *)(v5 + 96) = 0x656D656854;
  *(_QWORD *)(v5 + 104) = 0xE500000000000000;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0xD000000000000019;
  v6[3] = 0x800000019ABAF1E0;
  v6[4] = 0xD00000000000001CLL;
  v6[5] = 0x800000019ABB59D0;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v7 + 32) = 0xD000000000000015;
  *(_QWORD *)(v7 + 40) = 0x800000019ABAF400;
  *(_QWORD *)(v7 + 48) = v6;
  *(_QWORD *)(v7 + 72) = &type metadata for EnumSchema;
  *(_QWORD *)(v7 + 80) = &off_1E397AEF8;
  *(_BYTE *)(v7 + 88) = 1;
  *(_QWORD *)(v7 + 96) = 0xD000000000000017;
  *(_QWORD *)(v7 + 104) = 0x800000019ABB5EE0;
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 32) = 0x754A747865547369;
  *(_QWORD *)(v8 + 40) = 0xEF64656966697473;
  *(_QWORD *)(v8 + 48) = 2;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_BYTE *)(v8 + 88) = 4;
  *(_QWORD *)(v8 + 96) = 0xD000000000000011;
  *(_QWORD *)(v8 + 104) = 0x800000019ABB5F00;
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v9 + 32) = 0xD000000000000016;
  *(_QWORD *)(v9 + 40) = 0x800000019ABAF420;
  *(_QWORD *)(v9 + 48) = 2;
  *(_OWORD *)(v9 + 56) = 0u;
  *(_OWORD *)(v9 + 72) = 0u;
  *(_BYTE *)(v9 + 88) = 4;
  *(_QWORD *)(v9 + 96) = 0xD000000000000019;
  *(_QWORD *)(v9 + 104) = 0x800000019ABB5F20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C90;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = v7;
  *(_QWORD *)(inited + 64) = v8;
  *(_QWORD *)(inited + 72) = v9;
  v11 = MEMORY[0x1E0DEE9D8];
  v12 = 32;
  while (1)
  {
    v13 = *(_QWORD *)(inited + v12);
    v14 = *(_QWORD *)(v13 + 16);
    v15 = *(_QWORD *)(v11 + 16);
    v16 = v15 + v14;
    if (__OFADD__(v15, v14))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v16 > *(_QWORD *)(v11 + 24) >> 1)
    {
      if (v15 <= v16)
        v18 = v15 + v14;
      else
        v18 = v15;
      sub_19AA462CC(isUniquelyReferenced_nonNull_native, v18, 1, v11);
      v11 = v19;
    }
    if (*(_QWORD *)(v13 + 16))
    {
      v20 = *(_QWORD *)(v11 + 16);
      if ((*(_QWORD *)(v11 + 24) >> 1) - v20 < v14)
        goto LABEL_24;
      v21 = v11 + 80 * v20 + 32;
      if (v13 + 32 < v21 + 80 * v14 && v21 < v13 + 32 + 80 * v14)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v14)
      {
        v23 = *(_QWORD *)(v11 + 16);
        v24 = __OFADD__(v23, v14);
        v25 = v23 + v14;
        if (v24)
          goto LABEL_25;
        *(_QWORD *)(v11 + 16) = v25;
      }
    }
    else if (v14)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v12 += 8;
    if (v12 == 80)
    {
      swift_setDeallocating();
      sub_19AB2DAA8();
      return v11;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB48C9C: call analysis failed (funcsize=39)"

uint64_t sub_19AB48D44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v11;
  unint64_t v12;
  ValueMetadata *v13;
  _UNKNOWN **v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v22[2] = 4;
  v23 = 0u;
  v24 = 0u;
  v25 = 260;
  v22[0] = 0x6169726574697263;
  v22[1] = 0xE800000000000000;
  v26 = 1954047316;
  v27 = 0xE400000000000000;
  v28 = 0xD000000000000012;
  v29 = 0x800000019ABB2A80;
  v11 = 0;
  v12 = 0xE000000000000000;
  MEMORY[0x19AECE804](18);
  v1 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v21 = v2;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v4 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v4;
  sub_19AB2EB58((uint64_t)v22, v4 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v19 = 0x6B6F6F42206E6920;
  v20 = 0xE900000000000073;
  v17 = 37;
  v18 = 0xE100000000000000;
  v15 = 9509;
  v16 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v5 = v11;
  v6 = v12;
  v13 = &type metadata for Summary;
  v14 = &off_1E399A1E0;
  v7 = (_QWORD *)swift_allocObject();
  v11 = v7;
  v7[2] = v21;
  v7[3] = v5;
  v7[4] = v6;
  v7[5] = v1;
  v8 = sub_19AAFE518(a1, &v11, v1);
  sub_19A9FEB40((uint64_t)v22, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v11);
  return v8;
}

uint64_t sub_19AB49014()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97AD0;
  *(_QWORD *)(inited + 32) = &unk_1E397E528;
  *(_QWORD *)(inited + 40) = &unk_1E397DEC8;
  *(_QWORD *)(inited + 48) = &unk_1E397E0D8;
  *(_QWORD *)(inited + 56) = &unk_1E397E2E8;
  *(_QWORD *)(inited + 64) = &unk_1E397E3D8;
  *(_QWORD *)(inited + 72) = &unk_1E397E408;
  *(_QWORD *)(inited + 80) = &unk_1E397E438;
  *(_QWORD *)(inited + 88) = &unk_1E397E468;
  *(_QWORD *)(inited + 96) = &unk_1E397E498;
  *(_QWORD *)(inited + 104) = &unk_1E397E4C8;
  *(_QWORD *)(inited + 112) = &unk_1E397E4F8;
  *(_QWORD *)(inited + 120) = &unk_1E397DEF8;
  *(_QWORD *)(inited + 128) = &unk_1E397DF28;
  *(_QWORD *)(inited + 136) = &unk_1E397DF58;
  *(_QWORD *)(inited + 144) = &unk_1E397DF88;
  *(_QWORD *)(inited + 152) = &unk_1E397DFB8;
  *(_QWORD *)(inited + 160) = &unk_1E397DFE8;
  *(_QWORD *)(inited + 168) = &unk_1E397E018;
  *(_QWORD *)(inited + 176) = &unk_1E397E048;
  *(_QWORD *)(inited + 184) = &unk_1E397E078;
  *(_QWORD *)(inited + 192) = &unk_1E397E0A8;
  *(_QWORD *)(inited + 200) = &unk_1E397E108;
  *(_QWORD *)(inited + 208) = &unk_1E397E138;
  *(_QWORD *)(inited + 216) = &unk_1E397E168;
  *(_QWORD *)(inited + 224) = &unk_1E397E198;
  *(_QWORD *)(inited + 232) = &unk_1E397E1C8;
  *(_QWORD *)(inited + 240) = &unk_1E397E1F8;
  *(_QWORD *)(inited + 248) = &unk_1E397E228;
  *(_QWORD *)(inited + 256) = &unk_1E397E258;
  *(_QWORD *)(inited + 264) = &unk_1E397E288;
  *(_QWORD *)(inited + 272) = &unk_1E397E2B8;
  *(_QWORD *)(inited + 280) = &unk_1E397E318;
  *(_QWORD *)(inited + 288) = &unk_1E397E348;
  *(_QWORD *)(inited + 296) = &unk_1E397E378;
  *(_QWORD *)(inited + 304) = &unk_1E397E3A8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 312)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB49364: call analysis failed (funcsize=45)"

uint64_t sub_19AB493FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  _WORD v28[8];

  v1 = sub_19AB483A0();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x69746E456B6F6F42;
  *(_QWORD *)(v2 + 24) = 0xEA00000000007974;
  *(_QWORD *)(v2 + 32) = 1802465090;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 1802465090;
  v27 = 0xE400000000000000;
  strcpy((char *)v28, "Book to open");
  HIBYTE(v28[6]) = 0;
  v28[7] = -5120;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19AB2EB58((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB40((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB496F8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97B60;
  *(_QWORD *)(inited + 32) = &unk_1E397EC18;
  *(_QWORD *)(inited + 40) = &unk_1E397E558;
  *(_QWORD *)(inited + 48) = &unk_1E397E768;
  *(_QWORD *)(inited + 56) = &unk_1E397E978;
  *(_QWORD *)(inited + 64) = &unk_1E397EAC8;
  *(_QWORD *)(inited + 72) = &unk_1E397EAF8;
  *(_QWORD *)(inited + 80) = &unk_1E397EB28;
  *(_QWORD *)(inited + 88) = &unk_1E397EB58;
  *(_QWORD *)(inited + 96) = &unk_1E397EB88;
  *(_QWORD *)(inited + 104) = &unk_1E397EBB8;
  *(_QWORD *)(inited + 112) = &unk_1E397EBE8;
  *(_QWORD *)(inited + 120) = &unk_1E397E588;
  *(_QWORD *)(inited + 128) = &unk_1E397E5B8;
  *(_QWORD *)(inited + 136) = &unk_1E397E5E8;
  *(_QWORD *)(inited + 144) = &unk_1E397E618;
  *(_QWORD *)(inited + 152) = &unk_1E397E648;
  *(_QWORD *)(inited + 160) = &unk_1E397E678;
  *(_QWORD *)(inited + 168) = &unk_1E397E6A8;
  *(_QWORD *)(inited + 176) = &unk_1E397E6D8;
  *(_QWORD *)(inited + 184) = &unk_1E397E708;
  *(_QWORD *)(inited + 192) = &unk_1E397E738;
  *(_QWORD *)(inited + 200) = &unk_1E397E798;
  *(_QWORD *)(inited + 208) = &unk_1E397E7C8;
  *(_QWORD *)(inited + 216) = &unk_1E397E7F8;
  *(_QWORD *)(inited + 224) = &unk_1E397E828;
  *(_QWORD *)(inited + 232) = &unk_1E397E858;
  *(_QWORD *)(inited + 240) = &unk_1E397E888;
  *(_QWORD *)(inited + 248) = &unk_1E397E8B8;
  *(_QWORD *)(inited + 256) = &unk_1E397E8E8;
  *(_QWORD *)(inited + 264) = &unk_1E397E918;
  *(_QWORD *)(inited + 272) = &unk_1E397E948;
  *(_QWORD *)(inited + 280) = &unk_1E397E9A8;
  *(_QWORD *)(inited + 288) = &unk_1E397E9D8;
  *(_QWORD *)(inited + 296) = &unk_1E397EA08;
  *(_QWORD *)(inited + 304) = &unk_1E397EA38;
  *(_QWORD *)(inited + 312) = &unk_1E397EA68;
  *(_QWORD *)(inited + 320) = &unk_1E397EA98;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 328)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB49A44: call analysis failed (funcsize=39)"

uint64_t sub_19AB49AF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v13;
  unint64_t v14;
  ValueMetadata *v15;
  _UNKNOWN **v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  __int16 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v1 = sub_19AB483A0();
  v24[5] = &type metadata for EntitySchema;
  v24[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v24[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x6F6F626F69647541;
  *(_QWORD *)(v2 + 24) = 0xEF797469746E456BLL;
  *(_QWORD *)(v2 + 32) = 0x6F6F626F69647541;
  *(_QWORD *)(v2 + 40) = 0xE90000000000006BLL;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v25 = 257;
  v24[0] = 0x746567726174;
  v24[1] = 0xE600000000000000;
  v26 = 0x6F6F626F69647541;
  v27 = 0xE90000000000006BLL;
  v28 = 0xD000000000000011;
  v29 = 0x800000019ABB5E70;
  v13 = 0;
  v14 = 0xE000000000000000;
  MEMORY[0x19AECE804](7);
  v3 = MEMORY[0x1E0DEE9D8];
  sub_19AA463C8();
  v23 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v6 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v6;
  sub_19AB2EB58((uint64_t)v24, v6 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v21 = 0;
  v22 = 0xE000000000000000;
  v19 = 37;
  v20 = 0xE100000000000000;
  v17 = 9509;
  v18 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v7 = v13;
  v8 = v14;
  v15 = &type metadata for Summary;
  v16 = &off_1E399A1E0;
  v9 = (_QWORD *)swift_allocObject();
  v13 = v9;
  v9[2] = v23;
  v9[3] = v7;
  v9[4] = v8;
  v9[5] = v3;
  v10 = sub_19AAFE518(a1, &v13, v3);
  sub_19A9FEB40((uint64_t)v24, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v13);
  return v10;
}

uint64_t sub_19AB49DE8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97B70;
  *(_QWORD *)(inited + 32) = &unk_1E397D1D8;
  *(_QWORD *)(inited + 40) = &unk_1E397CA58;
  *(_QWORD *)(inited + 48) = &unk_1E397CC38;
  *(_QWORD *)(inited + 56) = &unk_1E397CE48;
  *(_QWORD *)(inited + 64) = &unk_1E397D058;
  *(_QWORD *)(inited + 72) = &unk_1E397D0B8;
  *(_QWORD *)(inited + 80) = &unk_1E397D0E8;
  *(_QWORD *)(inited + 88) = &unk_1E397D118;
  *(_QWORD *)(inited + 96) = &unk_1E397D148;
  *(_QWORD *)(inited + 104) = &unk_1E397D178;
  *(_QWORD *)(inited + 112) = &unk_1E397D1A8;
  *(_QWORD *)(inited + 120) = &unk_1E397CA88;
  *(_QWORD *)(inited + 128) = &unk_1E397CAB8;
  *(_QWORD *)(inited + 136) = &unk_1E397CAE8;
  *(_QWORD *)(inited + 144) = &unk_1E397CB18;
  *(_QWORD *)(inited + 152) = &unk_1E397CB48;
  *(_QWORD *)(inited + 160) = &unk_1E397CB78;
  *(_QWORD *)(inited + 168) = &unk_1E399ECE0;
  *(_QWORD *)(inited + 176) = &unk_1E397CBA8;
  *(_QWORD *)(inited + 184) = &unk_1E397CBD8;
  *(_QWORD *)(inited + 192) = &unk_1E397CC08;
  *(_QWORD *)(inited + 200) = &unk_1E397CC68;
  *(_QWORD *)(inited + 208) = &unk_1E397CC98;
  *(_QWORD *)(inited + 216) = &unk_1E397CCC8;
  *(_QWORD *)(inited + 224) = &unk_1E397CCF8;
  *(_QWORD *)(inited + 232) = &unk_1E397CD28;
  *(_QWORD *)(inited + 240) = &unk_1E397CD58;
  *(_QWORD *)(inited + 248) = &unk_1E397CD88;
  *(_QWORD *)(inited + 256) = &unk_1E397CDB8;
  *(_QWORD *)(inited + 264) = &unk_1E397CDE8;
  *(_QWORD *)(inited + 272) = &unk_1E397CE18;
  *(_QWORD *)(inited + 280) = &unk_1E397CE78;
  *(_QWORD *)(inited + 288) = &unk_1E397CEA8;
  *(_QWORD *)(inited + 296) = &unk_1E397CED8;
  *(_QWORD *)(inited + 304) = &unk_1E397CF08;
  *(_QWORD *)(inited + 312) = &unk_1E397CF38;
  *(_QWORD *)(inited + 320) = &unk_1E397CF68;
  *(_QWORD *)(inited + 328) = &unk_1E397CF98;
  *(_QWORD *)(inited + 336) = &unk_1E397CFC8;
  *(_QWORD *)(inited + 344) = &unk_1E397CFF8;
  *(_QWORD *)(inited + 352) = &unk_1E397D028;
  *(_QWORD *)(inited + 360) = &unk_1E397D088;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 368)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB4A164: call analysis failed (funcsize=42)"

uint64_t sub_19AB4A20C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v17;
  unint64_t v18;
  ValueMetadata *v19;
  _UNKNOWN **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[7];
  __int16 v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD v34[7];
  __int16 v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v1 = sub_19AB483A0();
  v34[5] = &type metadata for EntitySchema;
  v34[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v34[2] = v2;
  *(_QWORD *)(v2 + 16) = 0x69746E456B6F6F42;
  *(_QWORD *)(v2 + 24) = 0xEA00000000007974;
  *(_QWORD *)(v2 + 32) = 1802465090;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v35 = 257;
  v34[0] = 0x746567726174;
  v34[1] = 0xE600000000000000;
  v36 = 1802465090;
  v37 = 0xE400000000000000;
  v38 = 0xD000000000000013;
  v39 = 0x800000019ABB5E10;
  v28[5] = &type metadata for EnumSchema;
  v28[6] = &off_1E397AEF8;
  v3 = (_QWORD *)swift_allocObject();
  v28[2] = v3;
  v3[2] = 0xD000000000000017;
  v3[3] = 0x800000019ABAF080;
  v3[4] = 0xD000000000000019;
  v3[5] = 0x800000019ABB5900;
  v29 = 257;
  v28[0] = 0x6F69746365726964;
  v28[1] = 0xE90000000000006ELL;
  v30 = 0x6F69746365726944;
  v31 = 0xE90000000000006ELL;
  v32 = 0xD000000000000015;
  v33 = 0x800000019ABB5E30;
  v17 = 0;
  v18 = 0xE000000000000000;
  MEMORY[0x19AECE804](19);
  sub_19AA463C8();
  v27 = v4;
  sub_19A9E47A8();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB88C20;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(inited + 32) = v7;
  sub_19AB2EB58((uint64_t)v28, v7 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  sub_19AB826F8();
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_19AB88C20;
  *(_QWORD *)(v8 + 56) = v6;
  *(_QWORD *)(v8 + 64) = &off_1E398E1D8;
  v9 = swift_allocObject();
  *(_QWORD *)(v8 + 32) = v9;
  sub_19AB2EB58((uint64_t)v34, v9 + 16, &qword_1EE3B9EE8);
  sub_19AA48004();
  v25 = 0;
  v26 = 0xE000000000000000;
  v23 = 37;
  v24 = 0xE100000000000000;
  v21 = 9509;
  v22 = 0xE200000000000000;
  sub_19AB828D8();
  sub_19AB826F8();
  swift_bridgeObjectRelease();
  v10 = v17;
  v11 = v18;
  v19 = &type metadata for Summary;
  v20 = &off_1E399A1E0;
  v12 = (_QWORD *)swift_allocObject();
  v17 = v12;
  v12[2] = v27;
  v12[3] = v10;
  v12[4] = v11;
  v13 = MEMORY[0x1E0DEE9D8];
  v12[5] = MEMORY[0x1E0DEE9D8];
  v14 = sub_19AAFE518(a1, &v17, v13);
  sub_19A9FEB40((uint64_t)v28, &qword_1EE3B9EE8);
  sub_19A9FEB40((uint64_t)v34, &qword_1EE3B9EE8);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v17);
  return v14;
}

uint64_t sub_19AB4A6D0()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95BB0;
  *(_QWORD *)(inited + 32) = &unk_1E397CA28;
  *(_QWORD *)(inited + 40) = &unk_1E397C608;
  *(_QWORD *)(inited + 48) = &unk_1E397C818;
  *(_QWORD *)(inited + 56) = &unk_1E397C8A8;
  *(_QWORD *)(inited + 64) = &unk_1E397C8D8;
  *(_QWORD *)(inited + 72) = &unk_1E397C908;
  *(_QWORD *)(inited + 80) = &unk_1E397C938;
  *(_QWORD *)(inited + 88) = &unk_1E397C968;
  *(_QWORD *)(inited + 96) = &unk_1E397C998;
  *(_QWORD *)(inited + 104) = &unk_1E397C9C8;
  *(_QWORD *)(inited + 112) = &unk_1E397C9F8;
  *(_QWORD *)(inited + 120) = &unk_1E397C638;
  *(_QWORD *)(inited + 128) = &unk_1E397C668;
  *(_QWORD *)(inited + 136) = &unk_1E397C698;
  *(_QWORD *)(inited + 144) = &unk_1E397C6C8;
  *(_QWORD *)(inited + 152) = &unk_1E397C6F8;
  *(_QWORD *)(inited + 160) = &unk_1E397C728;
  *(_QWORD *)(inited + 168) = &unk_1E397C758;
  *(_QWORD *)(inited + 176) = &unk_1E397C788;
  *(_QWORD *)(inited + 184) = &unk_1E397C7B8;
  *(_QWORD *)(inited + 192) = &unk_1E397C7E8;
  *(_QWORD *)(inited + 200) = &unk_1E397C848;
  *(_QWORD *)(inited + 208) = &unk_1E397C878;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 216)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB4A9CC: call analysis failed (funcsize=54)"

uint64_t sub_19AB4AA64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v2 = sub_19AB48764();
  v10[5] = &type metadata for EntitySchema;
  v10[6] = &off_1E39811C0;
  v3 = swift_allocObject();
  v10[2] = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000012;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAECB0;
  strcpy((char *)(v3 + 32), "Book Settings");
  *(_WORD *)(v3 + 46) = -4864;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  v11 = 257;
  v10[0] = 0x746567726174;
  v10[1] = 0xE600000000000000;
  v12 = 0x73676E6974746553;
  v13 = 0xE800000000000000;
  v14 = 0xD00000000000001ELL;
  v15 = 0x800000019ABB5A50;
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0xD000000000000016;
  v4[3] = 0x800000019ABAF0C0;
  v4[4] = 0xD000000000000019;
  v4[5] = 0x800000019ABB5920;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88CA0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v7;
  sub_19AB2EB58((uint64_t)v10, v7 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 96) = v6;
  *(_QWORD *)(v5 + 104) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v5 + 72) = v8;
  *(_QWORD *)(v8 + 16) = 0x704F65676E616863;
  *(_QWORD *)(v8 + 24) = 0xEF6E6F6974617265;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 56) = &type metadata for EnumSchema;
  *(_QWORD *)(v8 + 64) = &off_1E397AEF8;
  *(_BYTE *)(v8 + 72) = 1;
  *(_BYTE *)(v8 + 73) = 1;
  *(_QWORD *)(v8 + 80) = 0x61684320746E6F46;
  *(_QWORD *)(v8 + 88) = 0xEB0000000065676ELL;
  *(_QWORD *)(v8 + 96) = 0xD000000000000016;
  *(_QWORD *)(v8 + 104) = 0x800000019ABB5DA0;
  sub_19A9FEB40((uint64_t)v10, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v5;
}

uint64_t sub_19AB4ACE4()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB97240;
  *(_QWORD *)(inited + 32) = &unk_1E397D6B8;
  *(_QWORD *)(inited + 40) = &unk_1E397D208;
  *(_QWORD *)(inited + 48) = &unk_1E397D418;
  *(_QWORD *)(inited + 56) = &unk_1E397D538;
  *(_QWORD *)(inited + 64) = &unk_1E397D568;
  *(_QWORD *)(inited + 72) = &unk_1E397D598;
  *(_QWORD *)(inited + 80) = &unk_1E397D5C8;
  *(_QWORD *)(inited + 88) = &unk_1E397D5F8;
  *(_QWORD *)(inited + 96) = &unk_1E397D628;
  *(_QWORD *)(inited + 104) = &unk_1E397D658;
  *(_QWORD *)(inited + 112) = &unk_1E397D688;
  *(_QWORD *)(inited + 120) = &unk_1E397D238;
  *(_QWORD *)(inited + 128) = &unk_1E397D268;
  *(_QWORD *)(inited + 136) = &unk_1E397D298;
  *(_QWORD *)(inited + 144) = &unk_1E397D2C8;
  *(_QWORD *)(inited + 152) = &unk_1E397D2F8;
  *(_QWORD *)(inited + 160) = &unk_1E397D328;
  *(_QWORD *)(inited + 168) = &unk_1E397D358;
  *(_QWORD *)(inited + 176) = &unk_1E397D388;
  *(_QWORD *)(inited + 184) = &unk_1E397D3B8;
  *(_QWORD *)(inited + 192) = &unk_1E397D3E8;
  *(_QWORD *)(inited + 200) = &unk_1E397D448;
  *(_QWORD *)(inited + 208) = &unk_1E397D478;
  *(_QWORD *)(inited + 216) = &unk_1E397D4A8;
  *(_QWORD *)(inited + 224) = &unk_1E397D4D8;
  *(_QWORD *)(inited + 232) = &unk_1E397D508;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 240)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB4AFFC: call analysis failed (funcsize=55)"

uint64_t sub_19AB4B094(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v2 = sub_19AB48764();
  v10[5] = &type metadata for EntitySchema;
  v10[6] = &off_1E39811C0;
  v3 = swift_allocObject();
  v10[2] = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000012;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAECB0;
  strcpy((char *)(v3 + 32), "Book Settings");
  *(_WORD *)(v3 + 46) = -4864;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  v11 = 257;
  v10[0] = 0x746567726174;
  v10[1] = 0xE600000000000000;
  v12 = 0x73676E6974746553;
  v13 = 0xE800000000000000;
  v14 = 0xD00000000000001ELL;
  v15 = 0x800000019ABB5A50;
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0xD00000000000001DLL;
  v4[3] = 0x800000019ABAF160;
  v4[4] = 0xD000000000000021;
  v4[5] = 0x800000019ABB5970;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88CA0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v7;
  sub_19AB2EB58((uint64_t)v10, v7 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 96) = v6;
  *(_QWORD *)(v5 + 104) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v5 + 72) = v8;
  *(_QWORD *)(v8 + 16) = 0x704F65676E616863;
  *(_QWORD *)(v8 + 24) = 0xEF6E6F6974617265;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 56) = &type metadata for EnumSchema;
  *(_QWORD *)(v8 + 64) = &off_1E397AEF8;
  *(_BYTE *)(v8 + 72) = 1;
  *(_BYTE *)(v8 + 73) = 1;
  strcpy((char *)(v8 + 80), "Line Spacing");
  *(_BYTE *)(v8 + 93) = 0;
  *(_WORD *)(v8 + 94) = -5120;
  *(_QWORD *)(v8 + 96) = 0xD000000000000019;
  *(_QWORD *)(v8 + 104) = 0x800000019ABB5D10;
  sub_19A9FEB40((uint64_t)v10, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v5;
}

uint64_t sub_19AB4B318()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CE0;
  *(_QWORD *)(inited + 32) = &unk_1E397D958;
  *(_QWORD *)(inited + 40) = &unk_1E397D6E8;
  *(_QWORD *)(inited + 48) = &unk_1E397D7A8;
  *(_QWORD *)(inited + 56) = &unk_1E397D7D8;
  *(_QWORD *)(inited + 64) = &unk_1E397D808;
  *(_QWORD *)(inited + 72) = &unk_1E397D838;
  *(_QWORD *)(inited + 80) = &unk_1E397D868;
  *(_QWORD *)(inited + 88) = &unk_1E397D898;
  *(_QWORD *)(inited + 96) = &unk_1E397D8C8;
  *(_QWORD *)(inited + 104) = &unk_1E397D8F8;
  *(_QWORD *)(inited + 112) = &unk_1E397D928;
  *(_QWORD *)(inited + 120) = &unk_1E397D718;
  *(_QWORD *)(inited + 128) = &unk_1E397D748;
  *(_QWORD *)(inited + 136) = &unk_1E397D778;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 144)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB4B5B8: call analysis failed (funcsize=55)"

uint64_t sub_19AB4B650(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v2 = sub_19AB48764();
  v10[5] = &type metadata for EntitySchema;
  v10[6] = &off_1E39811C0;
  v3 = swift_allocObject();
  v10[2] = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000012;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAECB0;
  strcpy((char *)(v3 + 32), "Book Settings");
  *(_WORD *)(v3 + 46) = -4864;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  v11 = 257;
  v10[0] = 0x746567726174;
  v10[1] = 0xE600000000000000;
  v12 = 0x73676E6974746553;
  v13 = 0xE800000000000000;
  v14 = 0xD00000000000001ELL;
  v15 = 0x800000019ABB5A50;
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0xD000000000000022;
  v4[3] = 0x800000019ABAF110;
  v4[4] = 0xD000000000000026;
  v4[5] = 0x800000019ABB5940;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88CA0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v7;
  sub_19AB2EB58((uint64_t)v10, v7 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 96) = v6;
  *(_QWORD *)(v5 + 104) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v5 + 72) = v8;
  *(_QWORD *)(v8 + 16) = 0x704F65676E616863;
  *(_QWORD *)(v8 + 24) = 0xEF6E6F6974617265;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 56) = &type metadata for EnumSchema;
  *(_QWORD *)(v8 + 64) = &off_1E397AEF8;
  *(_BYTE *)(v8 + 72) = 1;
  *(_BYTE *)(v8 + 73) = 1;
  *(_QWORD *)(v8 + 80) = 0xD000000000000011;
  *(_QWORD *)(v8 + 88) = 0x800000019ABB5C60;
  *(_QWORD *)(v8 + 96) = 0xD00000000000001ELL;
  *(_QWORD *)(v8 + 104) = 0x800000019ABB5C80;
  sub_19A9FEB40((uint64_t)v10, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v5;
}

uint64_t sub_19AB4B8C8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CE0;
  *(_QWORD *)(inited + 32) = &unk_1E397DE98;
  *(_QWORD *)(inited + 40) = &unk_1E397DC28;
  *(_QWORD *)(inited + 48) = &unk_1E397DCE8;
  *(_QWORD *)(inited + 56) = &unk_1E397DD18;
  *(_QWORD *)(inited + 64) = &unk_1E397DD48;
  *(_QWORD *)(inited + 72) = &unk_1E397DD78;
  *(_QWORD *)(inited + 80) = &unk_1E397DDA8;
  *(_QWORD *)(inited + 88) = &unk_1E397DDD8;
  *(_QWORD *)(inited + 96) = &unk_1E397DE08;
  *(_QWORD *)(inited + 104) = &unk_1E397DE38;
  *(_QWORD *)(inited + 112) = &unk_1E397DE68;
  *(_QWORD *)(inited + 120) = &unk_1E397DC58;
  *(_QWORD *)(inited + 128) = &unk_1E397DC88;
  *(_QWORD *)(inited + 136) = &unk_1E397DCB8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 144)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB4BB6C: call analysis failed (funcsize=52)"

uint64_t sub_19AB4BBF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v2 = sub_19AB48764();
  v10[5] = &type metadata for EntitySchema;
  v10[6] = &off_1E39811C0;
  v3 = swift_allocObject();
  v10[2] = v3;
  *(_QWORD *)(v3 + 16) = 0xD000000000000012;
  *(_QWORD *)(v3 + 24) = 0x800000019ABAECB0;
  strcpy((char *)(v3 + 32), "Book Settings");
  *(_WORD *)(v3 + 46) = -4864;
  *(_QWORD *)(v3 + 48) = v2;
  *(_BYTE *)(v3 + 56) = 1;
  v11 = 257;
  v10[0] = 0x746567726174;
  v10[1] = 0xE600000000000000;
  v12 = 0x73676E6974746553;
  v13 = 0xE800000000000000;
  v14 = 0xD00000000000001ELL;
  v15 = 0x800000019ABB5A50;
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = 0xD00000000000001DLL;
  v4[3] = 0x800000019ABAF1A0;
  v4[4] = 0xD000000000000021;
  v4[5] = 0x800000019ABB59A0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_19AB88CA0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = &off_1E398E1D8;
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v7;
  sub_19AB2EB58((uint64_t)v10, v7 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v5 + 96) = v6;
  *(_QWORD *)(v5 + 104) = &off_1E398E1D8;
  v8 = swift_allocObject();
  *(_QWORD *)(v5 + 72) = v8;
  *(_QWORD *)(v8 + 16) = 0x704F65676E616863;
  *(_QWORD *)(v8 + 24) = 0xEF6E6F6974617265;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 56) = &type metadata for EnumSchema;
  *(_QWORD *)(v8 + 64) = &off_1E397AEF8;
  *(_BYTE *)(v8 + 72) = 1;
  *(_BYTE *)(v8 + 73) = 1;
  strcpy((char *)(v8 + 80), "Word Spacing");
  *(_BYTE *)(v8 + 93) = 0;
  *(_WORD *)(v8 + 94) = -5120;
  *(_QWORD *)(v8 + 96) = 0xD000000000000019;
  *(_QWORD *)(v8 + 104) = 0x800000019ABB5BD0;
  sub_19A9FEB40((uint64_t)v10, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v5;
}

uint64_t sub_19AB4BE7C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95CE0;
  *(_QWORD *)(inited + 32) = &unk_1E397DBF8;
  *(_QWORD *)(inited + 40) = &unk_1E397D988;
  *(_QWORD *)(inited + 48) = &unk_1E397DA48;
  *(_QWORD *)(inited + 56) = &unk_1E397DA78;
  *(_QWORD *)(inited + 64) = &unk_1E397DAA8;
  *(_QWORD *)(inited + 72) = &unk_1E397DAD8;
  *(_QWORD *)(inited + 80) = &unk_1E397DB08;
  *(_QWORD *)(inited + 88) = &unk_1E397DB38;
  *(_QWORD *)(inited + 96) = &unk_1E397DB68;
  *(_QWORD *)(inited + 104) = &unk_1E397DB98;
  *(_QWORD *)(inited + 112) = &unk_1E397DBC8;
  *(_QWORD *)(inited + 120) = &unk_1E397D9B8;
  *(_QWORD *)(inited + 128) = &unk_1E397D9E8;
  *(_QWORD *)(inited + 136) = &unk_1E397DA18;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 144)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

#error "19AB4C11C: call analysis failed (funcsize=55)"

uint64_t sub_19AB4C1B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
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
  _QWORD v21[7];
  __int16 v22;
  _WORD v23[8];
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[7];
  __int16 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD v32[7];
  __int16 v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD v38[7];
  __int16 v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD v44[7];
  __int16 v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;

  v1 = sub_19AB48764();
  v44[5] = &type metadata for EntitySchema;
  v44[6] = &off_1E39811C0;
  v2 = swift_allocObject();
  v44[2] = v2;
  *(_QWORD *)(v2 + 16) = 0xD000000000000012;
  *(_QWORD *)(v2 + 24) = 0x800000019ABAECB0;
  strcpy((char *)(v2 + 32), "Book Settings");
  *(_WORD *)(v2 + 46) = -4864;
  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 56) = 1;
  v45 = 257;
  v44[0] = 0x746567726174;
  v44[1] = 0xE600000000000000;
  v46 = 0x73676E6974746553;
  v47 = 0xE800000000000000;
  v48 = 0xD00000000000001ELL;
  v49 = 0x800000019ABB5A50;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 40) = &type metadata for EnumSchema;
  *(_QWORD *)(v3 + 48) = &off_1E397AEF8;
  v4 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v3 + 16) = v4;
  v4[2] = 0x746E6F466B6F6F42;
  v4[3] = 0xE800000000000000;
  v4[4] = 0x6E6F46206B6F6F42;
  v4[5] = 0xE900000000000074;
  *(_BYTE *)(v3 + 56) = 1;
  v39 = 259;
  v38[0] = 1953394534;
  v38[1] = 0xE400000000000000;
  v38[2] = v3;
  v40 = 1953394502;
  v41 = 0xE400000000000000;
  v42 = 0xD000000000000011;
  v43 = 0x800000019ABB5A70;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 40) = &type metadata for EnumSchema;
  *(_QWORD *)(v5 + 48) = &off_1E397AEF8;
  v6 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v5 + 16) = v6;
  v6[2] = 0x6D6568546B6F6F42;
  v6[3] = 0xE900000000000065;
  v6[4] = 0x656854206B6F6F42;
  v6[5] = 0xEA0000000000656DLL;
  *(_BYTE *)(v5 + 56) = 1;
  v33 = 259;
  v32[0] = 0x656D656874;
  v32[1] = 0xE500000000000000;
  v32[2] = v5;
  v34 = 0x656D656854;
  v35 = 0xE500000000000000;
  v36 = 0xD000000000000012;
  v37 = 0x800000019ABB5A90;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 40) = &type metadata for EnumSchema;
  *(_QWORD *)(v7 + 48) = &off_1E397AEF8;
  v8 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v7 + 16) = v8;
  v8[2] = 0xD000000000000019;
  v8[3] = 0x800000019ABAF1E0;
  v8[4] = 0xD00000000000001CLL;
  v8[5] = 0x800000019ABB59D0;
  *(_BYTE *)(v7 + 56) = 1;
  v27 = 259;
  v26[0] = 0xD000000000000015;
  v26[1] = 0x800000019ABAF400;
  v26[2] = v7;
  v28 = 0xD000000000000013;
  v29 = 0x800000019ABB5AB0;
  v30 = 0xD00000000000001DLL;
  v31 = 0x800000019ABB5AD0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 2;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_BYTE *)(v9 + 56) = 4;
  v22 = 259;
  v21[0] = 0x754A747865547369;
  v21[1] = 0xEF64656966697473;
  v21[2] = v9;
  strcpy((char *)v23, "Justify Text");
  HIBYTE(v23[6]) = 0;
  v23[7] = -5120;
  v24 = 0xD00000000000001BLL;
  v25 = 0x800000019ABB5AF0;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 2;
  *(_OWORD *)(v10 + 24) = 0u;
  *(_OWORD *)(v10 + 40) = 0u;
  *(_BYTE *)(v10 + 56) = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_19AB88C90;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EE8);
  *(_QWORD *)(v11 + 56) = v12;
  *(_QWORD *)(v11 + 64) = &off_1E398E1D8;
  v13 = swift_allocObject();
  *(_QWORD *)(v11 + 32) = v13;
  sub_19AB2EB58((uint64_t)v44, v13 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v11 + 96) = v12;
  *(_QWORD *)(v11 + 104) = &off_1E398E1D8;
  v14 = swift_allocObject();
  *(_QWORD *)(v11 + 72) = v14;
  sub_19AB2EB58((uint64_t)v38, v14 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v11 + 136) = v12;
  *(_QWORD *)(v11 + 144) = &off_1E398E1D8;
  v15 = swift_allocObject();
  *(_QWORD *)(v11 + 112) = v15;
  sub_19AB2EB58((uint64_t)v32, v15 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v11 + 176) = v12;
  *(_QWORD *)(v11 + 184) = &off_1E398E1D8;
  v16 = swift_allocObject();
  *(_QWORD *)(v11 + 152) = v16;
  sub_19AB2EB58((uint64_t)v26, v16 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v11 + 216) = v12;
  *(_QWORD *)(v11 + 224) = &off_1E398E1D8;
  v17 = swift_allocObject();
  *(_QWORD *)(v11 + 192) = v17;
  sub_19AB2EB58((uint64_t)v21, v17 + 16, &qword_1EE3B9EE8);
  *(_QWORD *)(v11 + 256) = v12;
  *(_QWORD *)(v11 + 264) = &off_1E398E1D8;
  v18 = swift_allocObject();
  *(_QWORD *)(v11 + 232) = v18;
  *(_QWORD *)(v18 + 16) = 0xD000000000000016;
  *(_QWORD *)(v18 + 24) = 0x800000019ABAF420;
  *(_QWORD *)(v18 + 32) = v10;
  *(_BYTE *)(v18 + 72) = 3;
  *(_BYTE *)(v18 + 73) = 1;
  *(_QWORD *)(v18 + 80) = 0xD000000000000016;
  *(_QWORD *)(v18 + 88) = 0x800000019ABB5B10;
  *(_QWORD *)(v18 + 96) = 0xD000000000000021;
  *(_QWORD *)(v18 + 104) = 0x800000019ABB5B30;
  sub_19A9FEB40((uint64_t)v21, &qword_1EE3B9EE8);
  sub_19A9FEB40((uint64_t)v26, &qword_1EE3B9EE8);
  sub_19A9FEB40((uint64_t)v32, &qword_1EE3B9EE8);
  sub_19A9FEB40((uint64_t)v38, &qword_1EE3B9EE8);
  sub_19A9FEB40((uint64_t)v44, &qword_1EE3B9EE8);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return v11;
}

uint64_t sub_19AB4C768()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3B9ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB972B0;
  *(_QWORD *)(inited + 32) = &unk_1E397C5D8;
  *(_QWORD *)(inited + 40) = &unk_1E397C398;
  *(_QWORD *)(inited + 48) = &unk_1E397C428;
  *(_QWORD *)(inited + 56) = &unk_1E397C458;
  *(_QWORD *)(inited + 64) = &unk_1E397C488;
  *(_QWORD *)(inited + 72) = &unk_1E397C4B8;
  *(_QWORD *)(inited + 80) = &unk_1E397C4E8;
  *(_QWORD *)(inited + 88) = &unk_1E397C518;
  *(_QWORD *)(inited + 96) = &unk_1E397C548;
  *(_QWORD *)(inited + 104) = &unk_1E397C578;
  *(_QWORD *)(inited + 112) = &unk_1E397C5A8;
  *(_QWORD *)(inited + 120) = &unk_1E397C3C8;
  *(_QWORD *)(inited + 128) = &unk_1E397C3F8;
  v1 = MEMORY[0x1E0DEE9D8];
  v2 = 32;
  while (1)
  {
    v3 = *(_QWORD *)(inited + v2);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v1 + 16);
    v6 = v5 + v4;
    if (__OFADD__(v5, v4))
      break;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (!isUniquelyReferenced_nonNull_native || v6 > *(_QWORD *)(v1 + 24) >> 1)
    {
      if (v5 <= v6)
        v8 = v5 + v4;
      else
        v8 = v5;
      sub_19AA463AC(isUniquelyReferenced_nonNull_native, v8, 1, v1);
      v1 = v9;
    }
    if (*(_QWORD *)(v3 + 16))
    {
      v10 = *(_QWORD *)(v1 + 16);
      if ((*(_QWORD *)(v1 + 24) >> 1) - v10 < v4)
        goto LABEL_24;
      v11 = v1 + 16 * v10 + 32;
      if (v3 + 32 < v11 + 16 * v4 && v11 < v3 + 32 + 16 * v4)
        goto LABEL_26;
      swift_arrayInitWithCopy();
      if (v4)
      {
        v13 = *(_QWORD *)(v1 + 16);
        v14 = __OFADD__(v13, v4);
        v15 = v13 + v4;
        if (v14)
          goto LABEL_25;
        *(_QWORD *)(v1 + 16) = v15;
      }
    }
    else if (v4)
    {
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    v2 += 8;
    if (v2 == 136)
    {
      swift_setDeallocating();
      sub_19AB2DAB4();
      return v1;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB4C988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[4];

  v4[3] = &type metadata for AssistantSchema.IntentSchema;
  v4[0] = 0x6C7070612E6D6F63;
  v4[1] = 0xEF736B6F6F422E65;
  sub_19A9FEF48((uint64_t)v4, a1);
  v2 = sub_19AB4CA04();
  result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_19AB4CA04()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
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
  unint64_t v37;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t result;
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
  __int128 v58;
  ValueMetadata *v59;
  _UNKNOWN **v60;
  __int128 v61;
  ValueMetadata *v62;
  _UNKNOWN **v63;
  __int128 v64;
  _WORD v65[8];
  uint64_t v66;
  char v67;
  __int128 v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char v72;
  __int128 v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char v77;

  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v0 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v0;
  v0[2] = 0x746E6F436B6F6F42;
  v0[3] = 0xEF65707954746E65;
  v0[4] = 0xD000000000000011;
  v0[5] = 0x800000019ABB58E0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v57 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v1 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v1;
  v1[2] = 0x746E6F466B6F6F42;
  v1[3] = 0xE800000000000000;
  v1[4] = 0x6E6F46206B6F6F42;
  v1[5] = 0xE900000000000074;
  v56 = swift_allocObject();
  *(_OWORD *)(v56 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v56 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v2 = swift_allocObject();
  *(_QWORD *)&v61 = v2;
  strcpy((char *)(v2 + 16), "BookFontSize");
  *(_BYTE *)(v2 + 29) = 0;
  *(_WORD *)(v2 + 30) = -5120;
  strcpy((char *)(v2 + 32), "Book Font Size");
  *(_BYTE *)(v2 + 47) = -18;
  v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v55 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v3 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v3;
  v3[2] = 0xD000000000000017;
  v3[3] = 0x800000019ABAF080;
  v3[4] = 0xD000000000000019;
  v3[5] = 0x800000019ABB5900;
  v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v54 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v4 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v4;
  v4[2] = 0xD000000000000016;
  v4[3] = 0x800000019ABAF0C0;
  v4[4] = 0xD000000000000019;
  v4[5] = 0x800000019ABB5920;
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v53 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v5 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v5;
  v5[2] = 0xD000000000000022;
  v5[3] = 0x800000019ABAF110;
  v5[4] = 0xD000000000000026;
  v5[5] = 0x800000019ABB5940;
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v52 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v6 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v6;
  v6[2] = 0xD00000000000001DLL;
  v6[3] = 0x800000019ABAF160;
  v6[4] = 0xD000000000000021;
  v6[5] = 0x800000019ABB5970;
  v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v51 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v7 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v7;
  v7[2] = 0xD00000000000001DLL;
  v7[3] = 0x800000019ABAF1A0;
  v7[4] = 0xD000000000000021;
  v7[5] = 0x800000019ABB59A0;
  v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v50 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v8 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v8;
  v8[2] = 0x6D6568546B6F6F42;
  v8[3] = 0xE900000000000065;
  v8[4] = 0x656854206B6F6F42;
  v8[5] = 0xEA0000000000656DLL;
  v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v49 + 32);
  v62 = &type metadata for EnumSchema;
  v63 = &off_1E397AEF8;
  v9 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v61 = v9;
  v9[2] = 0xD000000000000019;
  v9[3] = 0x800000019ABAF1E0;
  v9[4] = 0xD00000000000001CLL;
  v9[5] = 0x800000019ABB59D0;
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v61, v48 + 32);
  v10 = sub_19AB483A0();
  *(_QWORD *)&v73 = 0x69746E456B6F6F42;
  *((_QWORD *)&v73 + 1) = 0xEA00000000007974;
  v74 = 1802465090;
  v75 = 0xE400000000000000;
  v76 = v10;
  v77 = 1;
  v47 = sub_19AB4D534(&v73);
  swift_bridgeObjectRelease();
  v11 = sub_19AB483A0();
  *(_QWORD *)&v68 = 0x6F6F626F69647541;
  *((_QWORD *)&v68 + 1) = 0xEF797469746E456BLL;
  v69 = 0x6F6F626F69647541;
  v70 = 0xE90000000000006BLL;
  v71 = v11;
  v72 = 1;
  v46 = sub_19AB4D534(&v68);
  swift_bridgeObjectRelease();
  v12 = sub_19AB48764();
  *(_QWORD *)&v64 = 0xD000000000000012;
  *((_QWORD *)&v64 + 1) = 0x800000019ABAECB0;
  strcpy((char *)v65, "Book Settings");
  v65[7] = -4864;
  v66 = v12;
  v67 = 1;
  v45 = sub_19AB4D534(&v64);
  v13 = swift_bridgeObjectRelease();
  sub_19AB48C68(&v61, v13);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v44 + 32);
  v14 = sub_19AA19690((uint64_t)&v61);
  sub_19AB49318(&v61, v14);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v43 + 32);
  v15 = sub_19AA19690((uint64_t)&v61);
  sub_19AB49A10(&v61, v15);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v16 + 32);
  v17 = sub_19AA19690((uint64_t)&v61);
  sub_19AB4A130(&v61, v17);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v18 + 32);
  v19 = sub_19AA19690((uint64_t)&v61);
  sub_19AB4A95C(&v61, v19);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v20 + 32);
  v21 = sub_19AA19690((uint64_t)&v61);
  sub_19AB4AF8C(&v61, v21);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v22 + 32);
  v23 = sub_19AA19690((uint64_t)&v61);
  sub_19AB4B548(&v61, v23);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v24 + 32);
  v25 = sub_19AA19690((uint64_t)&v61);
  sub_19AB4BAF8(&v61, v25);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v26 + 32);
  v27 = sub_19AA19690((uint64_t)&v61);
  sub_19AB4C0AC(&v61, v27);
  v59 = &type metadata for IntentSchema;
  v60 = &off_1E3981258;
  *(_QWORD *)&v58 = swift_allocObject();
  sub_19AA1963C((uint64_t)&v61, v58 + 16);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v58, v28 + 32);
  sub_19AA19690((uint64_t)&v61);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC0);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_19AB95C20;
  *(_QWORD *)(v29 + 32) = v57;
  *(_QWORD *)(v29 + 40) = v56;
  *(_QWORD *)(v29 + 48) = v55;
  *(_QWORD *)(v29 + 56) = v54;
  *(_QWORD *)(v29 + 64) = v53;
  *(_QWORD *)(v29 + 72) = v52;
  *(_QWORD *)(v29 + 80) = v51;
  *(_QWORD *)(v29 + 88) = v50;
  *(_QWORD *)(v29 + 96) = v49;
  *(_QWORD *)(v29 + 104) = v48;
  *(_QWORD *)(v29 + 112) = v47;
  *(_QWORD *)(v29 + 120) = v46;
  *(_QWORD *)(v29 + 128) = v45;
  *(_QWORD *)(v29 + 136) = v44;
  *(_QWORD *)(v29 + 144) = v43;
  *(_QWORD *)(v29 + 152) = v16;
  *(_QWORD *)(v29 + 160) = v18;
  *(_QWORD *)(v29 + 168) = v20;
  *(_QWORD *)(v29 + 176) = v22;
  *(_QWORD *)(v29 + 184) = v24;
  v30 = 32;
  *(_QWORD *)(v29 + 192) = v26;
  *(_QWORD *)(v29 + 200) = v28;
  v31 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v32 = *(_QWORD *)(v29 + v30);
    v33 = *(_QWORD *)(v32 + 16);
    v34 = *(_QWORD *)(v31 + 16);
    if (__OFADD__(v34, v33))
      break;
    swift_bridgeObjectRetain();
    if (!swift_isUniquelyReferenced_nonNull_native() || v34 + v33 > *(_QWORD *)(v31 + 24) >> 1)
    {
      sub_19AA46398();
      v31 = v35;
    }
    if (*(_QWORD *)(v32 + 16))
    {
      v36 = *(_QWORD *)(v31 + 16);
      if ((*(_QWORD *)(v31 + 24) >> 1) - v36 < v33)
        goto LABEL_21;
      v37 = v31 + 40 * v36 + 32;
      if (v32 + 32 < v37 + 40 * v33 && v37 < v32 + 32 + 40 * v33)
        goto LABEL_23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B9EC8);
      swift_arrayInitWithCopy();
      if (v33)
      {
        v39 = *(_QWORD *)(v31 + 16);
        v40 = __OFADD__(v39, v33);
        v41 = v39 + v33;
        if (v40)
          goto LABEL_22;
        *(_QWORD *)(v31 + 16) = v41;
      }
    }
    else if (v33)
    {
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    v30 += 8;
    if (v30 == 208)
    {
      swift_setDeallocating();
      sub_19AB2DAC0();
      return v31;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  result = sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB4D510()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

uint64_t sub_19AB4D534(__int128 *a1)
{
  _OWORD *v2;
  __int128 v3;
  uint64_t v4;
  __int128 v6;
  ValueMetadata *v7;
  _UNKNOWN **v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v7 = &type metadata for EntitySchema;
  v8 = &off_1E39811C0;
  v2 = (_OWORD *)OUTLINED_FUNCTION_4_13();
  *(_QWORD *)&v6 = v2;
  v3 = a1[1];
  v11 = *a1;
  v10 = v3;
  v9 = *((_QWORD *)a1 + 4);
  v2[1] = v11;
  v2[2] = v3;
  *(_OWORD *)((char *)v2 + 41) = *(__int128 *)((char *)a1 + 25);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE3BAE70);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_19AB88C20;
  sub_19AA19678(&v6, v4 + 32);
  sub_19A9EF07C((uint64_t)&v11);
  sub_19A9EF07C((uint64_t)&v10);
  sub_19AA95080((uint64_t)&v9);
  return v4;
}

uint64_t sub_19AB4D5EC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 96))
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 144) >= 5uLL)
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 120);
  switch(*(_BYTE *)(v0 + 200))
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 160);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB4D694()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB4D6C0()
{
  uint64_t v0;

  switch(*(_BYTE *)(v0 + 56))
  {
    case 0:
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_3();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      return swift_deallocObject();
  }
  return swift_deallocObject();
}

uint64_t sub_19AB4D71C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_0();
  switch(*(_BYTE *)(v0 + 72))
  {
    case 0:
      OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      break;
    case 1:
      __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);
      break;
    case 2:
    case 3:
      OUTLINED_FUNCTION_7();
      break;
    default:
      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_19AB4D790()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3();
  return swift_deallocObject();
}

void sub_19AB4D7D4(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (void *)sub_19AB82650();
  OUTLINED_FUNCTION_96();
  v8[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v8);

  if (v5)
  {
    v6 = v8[0];
  }
  else
  {
    v7 = v8[0];
    sub_19AB823E0();

    OUTLINED_FUNCTION_25_2();
  }
  OUTLINED_FUNCTION_22_6();
}

BOOL sub_19AB4D8A0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_19AB4D8B0(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x626174726F706D69;
  else
    v2 = 0x626174726F707865;
  if ((a2 & 1) != 0)
    v3 = 0x626174726F706D69;
  else
    v3 = 0x626174726F707865;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = OUTLINED_FUNCTION_47();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

void sub_19AB4D940(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x766972446C6F6F74;
  else
    v3 = 0x6C6F636F746F7270;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0xEA00000000006E65;
  if ((a2 & 1) != 0)
    v5 = 0x766972446C6F6F74;
  else
    v5 = 0x6C6F636F746F7270;
  if ((a2 & 1) != 0)
    v6 = 0xEA00000000006E65;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    OUTLINED_FUNCTION_26_4();
  else
    OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
}

void sub_19AB4D9C4()
{
  OUTLINED_FUNCTION_14_6();
  __asm { BR              X10 }
}

uint64_t sub_19AB4DA00()
{
  uint64_t v0;
  unsigned __int8 v1;

  v0 = OUTLINED_FUNCTION_13_8();
  return ((uint64_t (*)(uint64_t))((char *)sub_19AB4DA74 + 4 * byte_19AB97BB7[v1]))(v0);
}

void sub_19AB4DA74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_16_7();
  if (v2 == v3 && v0 == v1)
    OUTLINED_FUNCTION_26_4();
  else
    OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
}

void sub_19AB4DAF8()
{
  OUTLINED_FUNCTION_14_6();
  __asm { BR              X10 }
}

uint64_t sub_19AB4DB2C()
{
  uint64_t v0;
  unsigned __int8 v1;

  v0 = OUTLINED_FUNCTION_13_8();
  return ((uint64_t (*)(uint64_t))((char *)sub_19AB4DB84 + 4 * byte_19AB97BC4[v1]))(v0);
}

void sub_19AB4DB84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_16_7();
  if (v2 == v3 && v0 == v1)
    OUTLINED_FUNCTION_26_4();
  else
    OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
}

void sub_19AB4DBEC()
{
  OUTLINED_FUNCTION_14_6();
  __asm { BR              X10 }
}

uint64_t sub_19AB4DC20()
{
  uint64_t v0;
  unsigned __int8 v1;

  v0 = OUTLINED_FUNCTION_13_8();
  return ((uint64_t (*)(uint64_t))((char *)sub_19AB4DC5C + 4 * byte_19AB97BCF[v1]))(v0);
}

void sub_19AB4DC5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_16_7();
  if (v2 == v3 && v0 == v1)
    OUTLINED_FUNCTION_26_4();
  else
    OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
}

void sub_19AB4DCA8(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = 0xEB00000000746E65;
  v3 = 0x6D6572757361656DLL;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x6570795474696E75;
    else
      v5 = 0x626D795374696E75;
    if (v4 == 1)
      v6 = 0xE800000000000000;
    else
      v6 = 0xEA00000000006C6FLL;
  }
  else
  {
    v5 = 0x6D6572757361656DLL;
    v6 = 0xEB00000000746E65;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 0x6570795474696E75;
    else
      v3 = 0x626D795374696E75;
    if (a2 == 1)
      v2 = 0xE800000000000000;
    else
      v2 = 0xEA00000000006C6FLL;
  }
  if (v5 != v3 || v6 != v2)
    OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12();
}

uint64_t sub_19AB4DDB0(char a1, char a2)
{
  char v2;

  if (*(_QWORD *)&a010_2[8 * a1] == *(_QWORD *)&a010_2[8 * a2])
    v2 = 1;
  else
    v2 = OUTLINED_FUNCTION_47();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_19AB4DE10(uint64_t a1, void (*a2)(void))
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];

  sub_19A9F0DCC(a1, v18);
  v3 = v18[0];
  v4 = v18[1];
  v5 = v18[3];
  v6 = v18[4];
  v7 = (unint64_t)(v18[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_3;
LABEL_2:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v5 << 6);
  while (1)
  {
    v15 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    v16 = v15;
    a2();
    if (v17)
    {
      swift_release();

      OUTLINED_FUNCTION_96();
      swift_bridgeObjectRelease();
      return 1;
    }

    result = OUTLINED_FUNCTION_96();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v11 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v11 >= v7)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    v13 = v5 + 1;
    if (!v12)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v7)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v13);
      if (!v12)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v7)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v13);
        if (!v12)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v7)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v13);
          if (!v12)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v7)
              goto LABEL_23;
            v12 = *(_QWORD *)(v4 + 8 * v13);
            if (!v12)
            {
              v14 = v5 + 6;
              while (v14 < v7)
              {
                v12 = *(_QWORD *)(v4 + 8 * v14++);
                if (v12)
                {
                  v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
LABEL_23:
              swift_release();
              return 0;
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v5 = v13;
  }
  __break(1u);
  return result;
}

void sub_19AB4DFA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  unsigned int v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  void *v23;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_19AB82914();
    sub_19A9F04EC(0, (unint64_t *)&unk_1EDBA0FB0);
    sub_19AA0B4A0();
    sub_19AB82860();
    v1 = v18;
    v17 = v19;
    v2 = v20;
    v3 = v21;
    v4 = v22;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v17 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    v8 = v3;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!sub_19AB82920())
      goto LABEL_32;
    sub_19A9F04EC(0, (unint64_t *)&unk_1EDBA0FB0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v11 = v23;
    swift_unknownObjectRelease();
    if (!v23)
      goto LABEL_32;
LABEL_31:
    v15 = objc_msgSend(v11, sel_swift_isAppIntentsEnabled);

    if (v15)
      goto LABEL_32;
  }
  if (v4)
  {
    v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v10 = v9 | (v3 << 6);
LABEL_30:
    v11 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v11)
      goto LABEL_32;
    goto LABEL_31;
  }
  v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 >= v16)
      goto LABEL_32;
    v13 = *(_QWORD *)(v17 + 8 * v12);
    ++v3;
    if (!v13)
    {
      v3 = v8 + 2;
      if (v8 + 2 >= v16)
        goto LABEL_32;
      v13 = *(_QWORD *)(v17 + 8 * v3);
      if (!v13)
      {
        v3 = v8 + 3;
        if (v8 + 3 >= v16)
          goto LABEL_32;
        v13 = *(_QWORD *)(v17 + 8 * v3);
        if (!v13)
        {
          v3 = v8 + 4;
          if (v8 + 4 >= v16)
            goto LABEL_32;
          v13 = *(_QWORD *)(v17 + 8 * v3);
          if (!v13)
          {
            v3 = v8 + 5;
            if (v8 + 5 >= v16)
              goto LABEL_32;
            v13 = *(_QWORD *)(v17 + 8 * v3);
            if (!v13)
            {
              v14 = v8 + 6;
              while (v14 < v16)
              {
                v13 = *(_QWORD *)(v17 + 8 * v14++);
                if (v13)
                {
                  v3 = v14 - 1;
                  goto LABEL_29;
                }
              }
LABEL_32:
              sub_19AA94C00();
              return;
            }
          }
        }
      }
    }
LABEL_29:
    v4 = (v13 - 1) & v13;
    v10 = __clz(__rbit64(v13)) + (v3 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

void sub_19AB4E280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  char *v28;
  void *v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  _QWORD v39[5];
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v4 = sub_19AB824B8();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  MEMORY[0x1E0C80A78](v4);
  v44 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = a1;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_19AB82914();
    sub_19A9F04EC(0, (unint64_t *)&unk_1EDBA0FB0);
    sub_19AA0B4A0();
    sub_19AB82860();
    a2 = v49;
    v41 = v50;
    v6 = v51;
    v7 = v52;
    v8 = v53;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a2 + 32);
    v10 = *(_QWORD *)(a2 + 56);
    v41 = a2 + 56;
    v11 = ~v9;
    v12 = -v9;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v8 = v13 & v10;
    swift_bridgeObjectRetain();
    v6 = v11;
    v7 = 0;
  }
  v39[1] = v6;
  v39[4] = a2 & 0x7FFFFFFFFFFFFFFFLL;
  v40 = (unint64_t)(v6 + 64) >> 6;
  v43 = xmmword_19AB88C20;
  v39[3] = MEMORY[0x1E0DEE9B0] + 8;
  v42 = a2;
  if (a2 < 0)
    goto LABEL_10;
LABEL_8:
  if (v8)
  {
    v14 = (v8 - 1) & v8;
    v15 = __clz(__rbit64(v8)) | (v7 << 6);
    v16 = v7;
    goto LABEL_29;
  }
  v19 = v7 + 1;
  if (__OFADD__(v7, 1))
    goto LABEL_46;
  if (v19 >= v40)
    goto LABEL_44;
  v20 = *(_QWORD *)(v41 + 8 * v19);
  v16 = v7 + 1;
  if (!v20)
  {
    v16 = v7 + 2;
    if (v7 + 2 >= v40)
      goto LABEL_44;
    v20 = *(_QWORD *)(v41 + 8 * v16);
    if (!v20)
    {
      v16 = v7 + 3;
      if (v7 + 3 >= v40)
        goto LABEL_44;
      v20 = *(_QWORD *)(v41 + 8 * v16);
      if (!v20)
      {
        v16 = v7 + 4;
        if (v7 + 4 >= v40)
          goto LABEL_44;
        v20 = *(_QWORD *)(v41 + 8 * v16);
        if (!v20)
        {
          v16 = v7 + 5;
          if (v7 + 5 < v40)
          {
            v20 = *(_QWORD *)(v41 + 8 * v16);
            if (!v20)
            {
              v21 = v7 + 6;
              do
              {
                if (v21 >= v40)
                  goto LABEL_44;
                v20 = *(_QWORD *)(v41 + 8 * v21++);
              }
              while (!v20);
              v16 = v21 - 1;
            }
            goto LABEL_28;
          }
LABEL_44:
          sub_19AA94C00();
          return;
        }
      }
    }
  }
LABEL_28:
  v14 = (v20 - 1) & v20;
  v15 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_29:
  v18 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v15);
  if (!v18)
    goto LABEL_44;
  while (1)
  {
    LSBundleRecord.effectiveBundleIdentifier.getter();
    if (v22)
      break;
LABEL_40:

    v7 = v16;
    v8 = v14;
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_8;
LABEL_10:
    v17 = sub_19AB82920();
    if (v17)
    {
      v47 = v17;
      sub_19A9F04EC(0, (unint64_t *)&unk_1EDBA0FB0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v18 = v48;
      swift_unknownObjectRelease();
      v16 = v7;
      v14 = v8;
      if (v18)
        continue;
    }
    goto LABEL_44;
  }
  v23 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA30A8);
  v24 = v45;
  v25 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v43;
  v27 = objc_msgSend(v18, "URL");
  v28 = v44;
  sub_19AB82488();

  (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v26 + v25, v28, v46);
  sub_19AAF4254();
  v48 = (void *)v26;
  sub_19A9FE7C8();
  v29 = (void *)sub_19AB827D0();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v23, sel_bundleMetadataForURLs_, v29);

  sub_19A9F04EC(0, &qword_1EDBA2E40);
  v31 = sub_19AB827DC();

  if (!(v31 >> 62))
  {
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    v33 = v18;
    swift_bridgeObjectRetain();
    if (v32)
      goto LABEL_33;
    goto LABEL_39;
  }
  v38 = v18;
  swift_bridgeObjectRetain();
  v32 = sub_19AB82A34();
  if (!v32)
  {
LABEL_39:

    swift_bridgeObjectRelease();
    sub_19A9FEBC4();
    a2 = v42;
    goto LABEL_40;
  }
LABEL_33:
  v34 = 4;
  while (1)
  {
    v35 = (v31 & 0xC000000000000001) != 0
        ? (id)MEMORY[0x19AECEAB0](v34 - 4, v31)
        : *(id *)(v31 + 8 * v34);
    v36 = v35;
    v37 = v34 - 3;
    if (__OFADD__(v34 - 4, 1))
      break;
    sub_19A9DB090(v18);

    ++v34;
    if (v37 == v32)
      goto LABEL_39;
  }
  __break(1u);
LABEL_46:
  __break(1u);
}

uint64_t sub_19AB4E76C(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

BOOL sub_19AB4E77C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_19AB4E788(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_19AB4E794(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v18;

  v18 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_24;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v16 = a3;
      v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v7 = (id)MEMORY[0x19AECEAB0](v6, a1);
LABEL_7:
        v8 = v7;
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_23;
        v10 = LSApplicationExtensionRecord.attributionBundleIdentifier.getter();
        if (v11)
        {
          if (v10 == a2 && v11 == a3)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v13 = sub_19AB82BE4();
            swift_bridgeObjectRelease();
            if ((v13 & 1) == 0)
            {

LABEL_18:
              a3 = v16;
              goto LABEL_19;
            }
          }
          sub_19AB829BC();
          sub_19AB829E0();
          sub_19AB829EC();
          sub_19AB829C8();
          goto LABEL_18;
        }

LABEL_19:
        ++v6;
        if (v9 == v5)
        {
          v14 = v18;
          goto LABEL_26;
        }
      }
      if (v6 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      v5 = sub_19AB82A34();
      if (!v5)
        goto LABEL_25;
    }
    v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_7;
  }
LABEL_25:
  v14 = MEMORY[0x1E0DEE9D8];
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_19AB4E934()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_19AB4E984()
{
  sub_19AB4E934();
  return 0xD00000000000001CLL;
}

id static LSBundleRecord.currentBundleMetadata(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v5)
  {
    v6 = v5;
    v7 = v5;
    v8 = sub_19AB4ED8C();
    if (!v2)
    {
      OUTLINED_FUNCTION_24_1(v8, &qword_1EDBA2E40);
      v7 = sub_19AB4F2E0();
    }

  }
  else
  {
    type metadata accessor for DaemonRecord();
    v9 = static DaemonRecord.from(bundleIdentifier:)(a1, a2);
    v7 = v9;
    if (v9)
    {
      v10 = OUTLINED_FUNCTION_24_1((uint64_t)v9, &qword_1EDBA2E40);
      v11 = v7;
      v7 = (id)v10;
      v12 = sub_19AB4EABC(v11);
      if (!v2)
        return v12;
    }
  }
  return v7;
}

id sub_19AB4EABC(void *a1)
{
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v17[5];

  if (qword_1EDBA3090 != -1)
    swift_once();
  v2 = sub_19AB8256C();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EDBB1718);
  v3 = a1;
  v4 = sub_19AB82554();
  v5 = sub_19AB82884();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    v17[0] = v7;
    v8 = (uint64_t *)&v3[OBJC_IVAR___swift_DaemonRecord_bundleIdentifier];
    swift_beginAccess();
    v10 = *v8;
    v9 = v8[1];
    swift_bridgeObjectRetain();
    v17[4] = sub_19A9FEE78(v10, v9, v17);
    sub_19AB828C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19A9C7000, v4, v5, "Importing the daemon record for %s...", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19AECF56C](v7, -1, -1);
    MEMORY[0x19AECF56C](v6, -1, -1);

  }
  else
  {

  }
  DaemonRecord.effectiveBundleIdentifier.getter();
  v12 = v11;
  swift_beginAccess();
  sub_19AB824B8();
  swift_bridgeObjectRetain();
  v13 = (void *)sub_19AB827D0();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_bundleMetadataForURLs_, v13);

  if (!v14)
  {
    sub_19A9F04EC(0, &qword_1EDBA2E40);
    sub_19AB827DC();
    v14 = (id)sub_19AB827D0();
    swift_bridgeObjectRelease();
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithArray_, v14);

  return v15;
}

unint64_t sub_19AB4ED8C()
{
  void *v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _BYTE *v35;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v2 = v1;
  v3 = v0;
  v4 = sub_19AB824B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_19A9FE698(v0);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    if (qword_1EDBA3090 != -1)
      goto LABEL_26;
    while (1)
    {
      v12 = sub_19AB8256C();
      __swift_project_value_buffer(v12, (uint64_t)qword_1EDBB1718);
      swift_bridgeObjectRetain();
      v13 = sub_19AB82554();
      v14 = sub_19AB82884();
      v15 = os_log_type_enabled(v13, v14);
      v42 = v2;
      if (v15)
      {
        v41 = v4;
        v16 = swift_slowAlloc();
        v39 = v10;
        v17 = (uint8_t *)v16;
        v18 = swift_slowAlloc();
        v44 = v18;
        v40 = v5;
        *(_DWORD *)v17 = 136315138;
        swift_bridgeObjectRetain();
        v43 = sub_19A9FEE78(v39, (unint64_t)v11, &v44);
        v5 = v40;
        v4 = v41;
        sub_19AB828C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19A9C7000, v13, v14, "Processing bundle metadata for %s...", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AECF56C](v18, -1, -1);
        MEMORY[0x19AECF56C](v17, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      LSBundleRecord.effectiveBundleIdentifier.getter();
      if (v26)
      {
        v27 = v26;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA30A8);
        v28 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        v29 = swift_allocObject();
        *(_OWORD *)(v29 + 16) = xmmword_19AB88C20;
        v30 = objc_msgSend(v3, "URL");
        sub_19AB82488();

        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v29 + v28, v7, v4);
        sub_19AAF4254();
        v44 = v29;
        sub_19A9FE7C8();
        v31 = (void *)sub_19AB827D0();
        swift_bridgeObjectRelease();
        v32 = objc_msgSend(v27, sel_bundleMetadataForURLs_, v31);

        sub_19A9F04EC(0, &qword_1EDBA2E40);
        v10 = sub_19AB827DC();

      }
      else
      {
        v10 = MEMORY[0x1E0DEE9D8];
      }
      if (v10 >> 62)
      {
        v37 = v3;
        swift_bridgeObjectRetain();
        v4 = sub_19AB82A34();
        if (!v4)
        {
LABEL_21:

          swift_bridgeObjectRelease();
          return v10;
        }
      }
      else
      {
        v4 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
        v33 = v3;
        swift_bridgeObjectRetain();
        if (!v4)
          goto LABEL_21;
      }
      v2 = v10 & 0xC000000000000001;
      v5 = 4;
      while (1)
      {
        v34 = v2 ? (id)MEMORY[0x19AECEAB0](v5 - 4, v10) : *(id *)(v10 + 8 * v5);
        v11 = v34;
        v7 = (char *)(v5 - 3);
        if (__OFADD__(v5 - 4, 1))
          break;
        sub_19A9DB090(v3);

        ++v5;
        if (v7 == (char *)v4)
          goto LABEL_21;
      }
      __break(1u);
LABEL_26:
      swift_once();
    }
  }
  if (qword_1EDBA3090 != -1)
    swift_once();
  v19 = sub_19AB8256C();
  __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB1718);
  v20 = v0;
  v21 = sub_19AB82554();
  v22 = sub_19AB82878();
  v10 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412290;
    v44 = (uint64_t)v20;
    v25 = v20;
    sub_19AB828C0();
    *v24 = v20;

    _os_log_impl(&dword_19A9C7000, v21, (os_log_type_t)v10, "Undefined bundle identifier for %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA2E00);
    swift_arrayDestroy();
    MEMORY[0x19AECF56C](v24, -1, -1);
    MEMORY[0x19AECF56C](v23, -1, -1);

  }
  else
  {

  }
  sub_19AB51504();
  swift_allocError();
  *v35 = 0;
  swift_willThrow();
  return v10;
}

id sub_19AB4F2E0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_19A9F04EC(0, &qword_1EDBA2E40);
  v1 = (void *)sub_19AB827D0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

id LNBundleMetadata.init(frameworkRecord:)(void *a1)
{
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  if (qword_1EDBA3090 != -1)
    swift_once();
  v2 = sub_19AB8256C();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EDBB1718);
  v3 = a1;
  v4 = sub_19AB82554();
  v5 = sub_19AB82884();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_23_4();
    v20 = OUTLINED_FUNCTION_23_4();
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)&v3[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier];
    v7 = *(_QWORD *)&v3[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleIdentifier + 8];
    swift_bridgeObjectRetain();
    sub_19A9FEE78(v8, v7, &v20);
    OUTLINED_FUNCTION_34_2();
    sub_19AB828C0();

    OUTLINED_FUNCTION_14();
    _os_log_impl(&dword_19A9C7000, v4, v5, "Importing the framework record for %s...", v6, 0xCu);
    OUTLINED_FUNCTION_29_3();
    OUTLINED_FUNCTION_4_14();
  }

  FrameworkRecord.effectiveBundleIdentifier.getter();
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA30A8);
  v11 = OUTLINED_FUNCTION_134();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_19AB88C20;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 16))(v14 + v13, &v3[OBJC_IVAR____TtC12LinkMetadata15FrameworkRecord_bundleURL], v11);
  v15 = (void *)sub_19AB827D0();
  OUTLINED_FUNCTION_14();
  v16 = objc_msgSend(v10, sel_bundleMetadataForURLs_, v15);

  if (!v16)
  {
    OUTLINED_FUNCTION_24_1(v17, &qword_1EDBA2E40);
    sub_19AB827DC();
    v16 = (id)sub_19AB827D0();
    swift_bridgeObjectRelease();
  }
  v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithArray_, v16);

  return v18;
}

void static LSBundleRecord.with(bundleIdentifier:allowSystemAppPlaceholder:)(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  id v7;

  OUTLINED_FUNCTION_24_1(a1, &qword_1EE3B9380);
  OUTLINED_FUNCTION_36_2();
  sub_19AB4D7D4(a1, a2, 1);
  if (v3)
  {
    if ((a3 & 1) != 0)
    {
      v7 = objc_allocWithZone(MEMORY[0x1E0CA5870]);
      OUTLINED_FUNCTION_36_2();
      sub_19AB50EA8();

    }
    else
    {
      OUTLINED_FUNCTION_25_2();
    }
  }
  OUTLINED_FUNCTION_369();
}

unint64_t sub_19AB4F6D8()
{
  uint64_t v0;
  unint64_t result;
  unint64_t v2;

  result = sub_19AB4ED8C();
  if (!v0)
  {
    v2 = result;
    sub_19AB4FD64();
    sub_19A9FEBC4();
    sub_19AB5013C();
    sub_19A9FEBC4();
    sub_19AB5085C();
    sub_19A9FEBC4();
    return v2;
  }
  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LNBundleMetadata.init(bundle:using:)(LNBundleMetadata *__return_ptr retstr, NSBundle bundle, LNEffectiveBundleIdentifier using)
{
  Class isa;
  id v5;
  id v6;
  id v7;

  isa = using.super.isa;
  v7 = 0;
  if (objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_33_2()), sel_initWithBundle_usingEffectiveBundleIdentifier_error_, bundle.super.isa, using.super.isa, &v7))
  {
    v5 = v7;
  }
  else
  {
    v6 = v7;
    sub_19AB823E0();

    OUTLINED_FUNCTION_25_2();
  }

}

uint64_t sub_19AB4F85C@<X0>(char *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
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
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  _QWORD *v33;
  os_log_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v47 = a3;
  v5 = sub_19AB822CC();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x1E0C80A78](v5);
  v50 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  v8 = MEMORY[0x1E0C80A78](v7);
  v49 = (uint64_t)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v46 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v46 - v13;
  v15 = sub_19AB824B8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v46 - v21;
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v46 - v23;
  sub_19A9FDCDC((uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_19A9FEB08((uint64_t)v14, (uint64_t *)&unk_1EDBA3F50);
    if (qword_1EDBA3090 != -1)
      swift_once();
    v25 = sub_19AB8256C();
    __swift_project_value_buffer(v25, (uint64_t)qword_1EDBB1718);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v22, a1, v15);
    v26 = a2;
    v27 = sub_19AB82554();
    v28 = sub_19AB82884();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v47 = (_QWORD *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v54 = v48;
      *(_DWORD *)v29 = 136315394;
      sub_19AA11208();
      v46 = v27;
      v30 = sub_19AB82BA8();
      v53 = sub_19A9FEE78(v30, v31, &v54);
      sub_19AB828C0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
      *(_WORD *)(v29 + 12) = 2112;
      v53 = (uint64_t)v26;
      v32 = v26;
      sub_19AB828C0();
      v33 = v47;
      *v47 = v26;

      v34 = v46;
      _os_log_impl(&dword_19A9C7000, v46, v28, "No static metadata directories found in %s for %@", (uint8_t *)v29, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA2E00);
      swift_arrayDestroy();
      MEMORY[0x19AECF56C](v33, -1, -1);
      v35 = v48;
      swift_arrayDestroy();
      MEMORY[0x19AECF56C](v35, -1, -1);
      MEMORY[0x19AECF56C](v29, -1, -1);

    }
    else
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);

    }
    v41 = v50;
    sub_19AB822C0();
    v42 = v49;
    __swift_storeEnumTagSinglePayload(v49, 1, 1, v15);
    v43 = sub_19AB822D8();
    sub_19A9FEB08(v42, (uint64_t *)&unk_1EDBA3F50);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v41, v52);
    sub_19A9FDE70();
    swift_allocError();
    *(_QWORD *)v44 = v43;
    *(_BYTE *)(v44 + 8) = 0;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v14, v15);
    sub_19A9F04EC(0, &qword_1EDBA2E40);
    v36 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v36(v19, v24, v15);
    v36(v12, a1, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v15);
    v37 = a2;
    v38 = v48;
    LNBundleMetadata.init(metadataFileURL:bundleURL:effectiveBundleIdentifier:)((uint64_t)v19, (uint64_t)v12, v37);
    if (v38)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v24, v15);
    }
    else
    {
      v45 = v39;
      result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v24, v15);
      *v47 = v45;
    }
  }
  return result;
}

uint8_t *sub_19AB4FD64()
{
  void *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t *v21;
  _BYTE *v22;
  uint64_t v24;

  v1 = v0;
  v2 = sub_19A9FE698(v0);
  if (v3)
  {
    v4 = v2;
    v5 = v3;
    if (qword_1EDBA3090 != -1)
      swift_once();
    v6 = sub_19AB8256C();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EDBB1718);
    swift_bridgeObjectRetain();
    v7 = sub_19AB82554();
    v8 = sub_19AB82884();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v24 = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_19A9FEE78(v4, v5, &v24);
      sub_19AB828C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A9C7000, v7, v8, "Processing embedded extension records for %s...", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AECF56C](v10, -1, -1);
      MEMORY[0x19AECF56C](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    objc_opt_self();
    v18 = (void *)swift_dynamicCastObjCClass();
    if (v18)
    {
      v19 = objc_msgSend(v18, sel_applicationExtensionRecords);
      sub_19A9F04EC(0, (unint64_t *)&unk_1EDBA0FB0);
      sub_19AA0B4A0();
      v20 = sub_19AB82854();

      sub_19AB4E280(MEMORY[0x1E0DEE9D8], v20);
      v12 = v21;
      swift_bridgeObjectRelease();
    }
    else
    {
      return (uint8_t *)MEMORY[0x1E0DEE9D8];
    }
  }
  else
  {
    if (qword_1EDBA3090 != -1)
      swift_once();
    v11 = sub_19AB8256C();
    v12 = (uint8_t *)__swift_project_value_buffer(v11, (uint64_t)qword_1EDBB1718);
    v13 = v1;
    v14 = sub_19AB82554();
    v15 = sub_19AB82878();
    if (os_log_type_enabled(v14, v15))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v16 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412290;
      v24 = (uint64_t)v13;
      v17 = v13;
      sub_19AB828C0();
      *v16 = v13;

      _os_log_impl(&dword_19A9C7000, v14, v15, "Undefined bundle identifier for %@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA2E00);
      swift_arrayDestroy();
      MEMORY[0x19AECF56C](v16, -1, -1);
      MEMORY[0x19AECF56C](v12, -1, -1);

    }
    else
    {

    }
    sub_19AB51504();
    swift_allocError();
    *v22 = 0;
    swift_willThrow();
  }
  return v12;
}

uint64_t sub_19AB5013C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  char *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  _BYTE *v56;
  _QWORD v57[2];
  __int128 v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;

  v2 = sub_19AB824B8();
  v62 = *(_QWORD *)(v2 - 8);
  v63 = v2;
  MEMORY[0x1E0C80A78](v2);
  v61 = (char *)v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v4);
  v60 = (char *)v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19A9FE698(v0);
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    if (qword_1EDBA3090 != -1)
      swift_once();
    v10 = sub_19AB8256C();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EDBB1718);
    swift_bridgeObjectRetain_n();
    v11 = sub_19AB82554();
    v12 = sub_19AB82884();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v68 = v14;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      v67 = sub_19A9FEE78(v8, v9, &v68);
      sub_19AB828C0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19A9C7000, v11, v12, "Processing associated standalone extension records for %s...", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x19AECF56C](v14, -1, -1);
      MEMORY[0x19AECF56C](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_1EE3B9828 != -1)
      swift_once();
    v22 = swift_bridgeObjectRetain();
    v23 = sub_19AB4E794(v22, v8, v9);
    v24 = v23;
    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_19AB82A34();
      v25 = result;
    }
    else
    {
      v25 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
    }
    v27 = MEMORY[0x1E0DEE9D8];
    v57[1] = v1;
    if (v25)
    {
      if (v25 < 1)
      {
        __break(1u);
        return result;
      }
      v28 = 0;
      v65 = v24 & 0xC000000000000001;
      v58 = xmmword_19AB88C20;
      v64 = v24;
      v59 = v25;
      do
      {
        if (v65)
          v29 = (id)MEMORY[0x19AECEAB0](v28, v24);
        else
          v29 = *(id *)(v24 + 8 * v28 + 32);
        v30 = v29;
        v31 = sub_19A9FE698(v29);
        if (v32)
        {
          v33 = v31;
          v34 = v32;
          v35 = objc_msgSend(v30, "URL");
          v36 = (uint64_t)v60;
          sub_19AB82488();

          v37 = v63;
          __swift_storeEnumTagSinglePayload(v36, 0, 1, v63);
          v38 = objc_allocWithZone((Class)LNEffectiveBundleIdentifier);
          sub_19AB036B0(1, v33, v34, v36);
          v66 = v39;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA30A8);
          v40 = v62;
          v41 = (*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
          v42 = swift_allocObject();
          *(_OWORD *)(v42 + 16) = v58;
          v43 = v42 + v41;
          v44 = objc_msgSend(v30, "URL");
          v45 = v61;
          sub_19AB82488();

          (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))(v43, v45, v37);
          sub_19AAF4254();
          v68 = v42;
          sub_19A9FE7C8();
          v25 = v59;
          v46 = (void *)sub_19AB827D0();
          swift_bridgeObjectRelease();
          v47 = v66;
          v48 = objc_msgSend(v66, sel_bundleMetadataForURLs_, v46);

          sub_19A9F04EC(0, &qword_1EDBA2E40);
          v49 = sub_19AB827DC();

          v30 = v48;
        }
        else
        {
          v49 = MEMORY[0x1E0DEE9D8];
        }

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_19AA46758(0, *(_QWORD *)(v27 + 16) + 1, 1, v27);
          v27 = v52;
        }
        v24 = v64;
        v51 = *(_QWORD *)(v27 + 16);
        v50 = *(_QWORD *)(v27 + 24);
        if (v51 >= v50 >> 1)
        {
          sub_19AA46758(v50 > 1, v51 + 1, 1, v27);
          v27 = v53;
        }
        ++v28;
        *(_QWORD *)(v27 + 16) = v51 + 1;
        *(_QWORD *)(v27 + 8 * v51 + 32) = v49;
      }
      while (v25 != v28);
    }
    swift_bridgeObjectRelease_n();
    v68 = MEMORY[0x1E0DEE9D8];
    v54 = *(_QWORD *)(v27 + 16);
    if (v54)
    {
      swift_bridgeObjectRetain();
      for (i = 0; i != v54; ++i)
      {
        swift_bridgeObjectRetain();
        sub_19A9FEBC4();
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return v68;
  }
  else
  {
    if (qword_1EDBA3090 != -1)
      swift_once();
    v15 = sub_19AB8256C();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EDBB1718);
    v16 = v0;
    v17 = sub_19AB82554();
    v18 = sub_19AB82878();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v19 = 138412290;
      v68 = (uint64_t)v16;
      v21 = v16;
      sub_19AB828C0();
      *v20 = v16;

      _os_log_impl(&dword_19A9C7000, v17, v18, "Undefined bundle identifier for %@", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA2E00);
      swift_arrayDestroy();
      MEMORY[0x19AECF56C](v20, -1, -1);
      MEMORY[0x19AECF56C](v19, -1, -1);

    }
    else
    {

    }
    sub_19AB51504();
    swift_allocError();
    *v56 = 0;
    return swift_willThrow();
  }
}

uint64_t sub_19AB5085C()
{
  void *v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  void *v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _BYTE *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39[3];
  uint64_t v40;

  v37 = sub_19A9FE698(v0);
  if (v1)
  {
    v2 = v1;
    if (qword_1EDBA3090 != -1)
      goto LABEL_46;
    while (1)
    {
      v3 = sub_19AB8256C();
      __swift_project_value_buffer(v3, (uint64_t)qword_1EDBB1718);
      swift_bridgeObjectRetain_n();
      v4 = sub_19AB82554();
      v5 = sub_19AB82884();
      v36 = v2;
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        v7 = swift_slowAlloc();
        v39[0] = (id)v7;
        *(_DWORD *)v6 = 136315138;
        swift_bridgeObjectRetain();
        sub_19A9FEE78(v37, v2, (uint64_t *)v39);
        sub_19AB828C0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19A9C7000, v4, v5, "Processing associated daemon records for %s...", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x19AECF56C](v7, -1, -1);
        MEMORY[0x19AECF56C](v6, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      if (qword_1EDBA1890 != -1)
        swift_once();
      swift_beginAccess();
      v15 = qword_1EDBA1840;
      v38 = MEMORY[0x1E0DEE9D8];
      if ((unint64_t)qword_1EDBA1840 >> 62)
      {
        swift_bridgeObjectRetain();
        v16 = sub_19AB82A34();
      }
      else
      {
        v16 = *(_QWORD *)((qword_1EDBA1840 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
      }
      v17 = MEMORY[0x1E0DEE9D8];
      if (!v16)
      {
        v25 = MEMORY[0x1E0DEE9D8];
LABEL_32:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v40 = v17;
        if (v25 < 0 || (v25 & 0x4000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          result = sub_19AB82A34();
          v26 = result;
          if (result)
            goto LABEL_35;
        }
        else
        {
          v26 = *(_QWORD *)(v25 + 16);
          result = swift_bridgeObjectRetain();
          if (v26)
          {
LABEL_35:
            if (v26 < 1)
            {
              __break(1u);
            }
            else
            {
              v28 = 0;
              do
              {
                if ((v25 & 0xC000000000000001) != 0)
                  v29 = (id)MEMORY[0x19AECEAB0](v28, v25);
                else
                  v29 = *(id *)(v25 + 8 * v28 + 32);
                v30 = v29;
                ++v28;
                DaemonRecord.effectiveBundleIdentifier.getter();
                v32 = v31;
                swift_beginAccess();
                sub_19AB824B8();
                swift_bridgeObjectRetain();
                v33 = (void *)sub_19AB827D0();
                swift_bridgeObjectRelease();
                v34 = objc_msgSend(v32, sel_bundleMetadataForURLs_, v33);

                sub_19A9F04EC(0, &qword_1EDBA2E40);
                sub_19AB827DC();

                sub_19A9FEBC4();
              }
              while (v26 != v28);
              swift_release_n();
              return v40;
            }
            return result;
          }
        }
        swift_release_n();
        return MEMORY[0x1E0DEE9D8];
      }
      v18 = 0;
      while ((v15 & 0xC000000000000001) != 0)
      {
        v19 = (char *)MEMORY[0x19AECEAB0](v18, v15);
LABEL_19:
        v20 = v19;
        v21 = v18 + 1;
        if (__OFADD__(v18, 1))
          goto LABEL_45;
        v22 = &v19[OBJC_IVAR___swift_DaemonRecord_attributionBundleIdentifier];
        swift_beginAccess();
        v23 = *((_QWORD *)v22 + 1);
        if (v23 && (*(_QWORD *)v22 == v37 ? (v24 = v23 == v2) : (v24 = 0), v24 || (sub_19AB82BE4() & 1) != 0))
        {
          sub_19AB829BC();
          sub_19AB829E0();
          v2 = v36;
          sub_19AB829EC();
          sub_19AB829C8();
        }
        else
        {

        }
        ++v18;
        if (v21 == v16)
        {
          v25 = v38;
          v17 = MEMORY[0x1E0DEE9D8];
          goto LABEL_32;
        }
      }
      if (v18 < *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      swift_once();
    }
    v19 = (char *)*(id *)(v15 + 8 * v18 + 32);
    goto LABEL_19;
  }
  if (qword_1EDBA3090 != -1)
    swift_once();
  v8 = sub_19AB8256C();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EDBB1718);
  v9 = v0;
  v10 = sub_19AB82554();
  v11 = sub_19AB82878();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v39[0] = v9;
    v14 = v9;
    sub_19AB828C0();
    *v13 = v9;

    _os_log_impl(&dword_19A9C7000, v10, v11, "Undefined bundle identifier for %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA2E00);
    swift_arrayDestroy();
    MEMORY[0x19AECF56C](v13, -1, -1);
    MEMORY[0x19AECF56C](v12, -1, -1);

  }
  else
  {

  }
  sub_19AB51504();
  swift_allocError();
  *v35 = 0;
  return swift_willThrow();
}

id sub_19AB50EA8()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = (void *)sub_19AB82650();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifierOfSystemPlaceholder_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_19AB823E0();

    swift_willThrow();
  }
  return v2;
}

void *sub_19AB50F70(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_19AB82A58();
  __break(1u);
  return result;
}

uint64_t sub_19AB51034(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_19AB510C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_19AB512EC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_19AB512EC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19AB510C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_19AB82710();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  sub_19AB51238(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_19AB82968();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return v4;
  }
  sub_19AB82A58();
  __break(1u);
LABEL_14:
  result = sub_19AB82A1C();
  __break(1u);
  return result;
}

void sub_19AB51238(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B92E8);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a1;
    v4[3] = 2 * v5 - 64;
  }
  OUTLINED_FUNCTION_0();
}

void sub_19AB51298(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v4 = sub_19AB8274C();
    OUTLINED_FUNCTION_27_3(v4);
  }
  else
  {
    v3 = MEMORY[0x19AECE858](15, a1 >> 16);
    OUTLINED_FUNCTION_27_3(v3);
  }
  OUTLINED_FUNCTION_0();
}

char *sub_19AB512EC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3B92E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_19AB51484(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_19AB513C0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_19AB513C0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_19AB82A58();
  __break(1u);
  return result;
}

char *sub_19AB51484(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_19AB82A58();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_19AB51504()
{
  unint64_t result;

  result = qword_1EE3B9558;
  if (!qword_1EE3B9558)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB97CF0, &type metadata for BundleMetadataExtractionError);
    atomic_store(result, (unint64_t *)&qword_1EE3B9558);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BundleMetadataExtractionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19AB5158C + 4 * byte_19AB97BD9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_19AB515C0 + 4 * byte_19AB97BD4[v4]))();
}

uint64_t sub_19AB515C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19AB515C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x19AB515D0);
  return result;
}

uint64_t sub_19AB515DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19AB515E4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_19AB515E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19AB515F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BundleMetadataExtractionError()
{
  return &type metadata for BundleMetadataExtractionError;
}

unint64_t sub_19AB51614()
{
  unint64_t result;

  result = qword_1EE3BB4D8;
  if (!qword_1EE3BB4D8)
  {
    result = MEMORY[0x19AECF4B8](&unk_19AB97CC8, &type metadata for BundleMetadataExtractionError);
    atomic_store(result, (unint64_t *)&qword_1EE3BB4D8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v3 - 168) = v4;
  return v4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return swift_willThrow();
}

unint64_t OUTLINED_FUNCTION_27_3(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_19AB516D8()
{
  uint64_t result;

  result = sub_19AB516F4();
  qword_1EE3BB4E0 = result;
  return result;
}

uint64_t sub_19AB516F4()
{
  return sub_19AB82590();
}

uint64_t static AssistantPrebuiltMapping.intentIdentifierByMacroArgument.getter()
{
  return sub_19AB01DC4(&qword_1EE3B9C48);
}

uint64_t sub_19AB51730()
{
  uint64_t result;

  result = sub_19AB5174C();
  qword_1EE3BB4E8 = result;
  return result;
}

uint64_t sub_19AB5174C()
{
  return sub_19AB82590();
}

uint64_t static AssistantPrebuiltMapping.entityIdentifierByMacroArgument.getter()
{
  return sub_19AB01DC4(&qword_1EE3B9C50);
}

uint64_t sub_19AB51788()
{
  uint64_t result;

  result = sub_19AB517A4();
  qword_1EE3BB4F0 = result;
  return result;
}

uint64_t sub_19AB517A4()
{
  return sub_19AB82590();
}

uint64_t static AssistantPrebuiltMapping.enumIdentifierByMacroArgument.getter()
{
  return sub_19AB01DC4(&qword_1EE3B9C58);
}

uint64_t sub_19AB517E0()
{
  uint64_t result;

  result = sub_19AB517FC();
  qword_1EE3BB4F8 = result;
  return result;
}

uint64_t sub_19AB517FC()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BB508);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_19AB97D70;
  strcpy((char *)(v0 + 32), "books.openBook");
  *(_BYTE *)(v0 + 47) = -18;
  *(_QWORD *)(v0 + 48) = &unk_1E3999C18;
  *(_QWORD *)(v0 + 56) = 0xD000000000000013;
  *(_QWORD *)(v0 + 64) = 0x800000019ABACF00;
  *(_QWORD *)(v0 + 72) = &unk_1E3997D38;
  *(_QWORD *)(v0 + 80) = 0xD000000000000012;
  *(_QWORD *)(v0 + 88) = 0x800000019ABACF40;
  *(_QWORD *)(v0 + 96) = &unk_1E3998538;
  *(_QWORD *)(v0 + 104) = 0xD000000000000014;
  *(_QWORD *)(v0 + 112) = 0x800000019ABACF80;
  *(_QWORD *)(v0 + 120) = &unk_1E39987C8;
  *(_QWORD *)(v0 + 128) = 0xD000000000000017;
  *(_QWORD *)(v0 + 136) = 0x800000019ABACFC0;
  *(_QWORD *)(v0 + 144) = &unk_1E3998A58;
  *(_QWORD *)(v0 + 152) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 160) = 0x800000019ABAD000;
  *(_QWORD *)(v0 + 168) = &unk_1E3998D98;
  *(_QWORD *)(v0 + 176) = 0xD000000000000017;
  *(_QWORD *)(v0 + 184) = 0x800000019ABAD040;
  *(_QWORD *)(v0 + 192) = &unk_1E3999158;
  *(_QWORD *)(v0 + 200) = 0xD000000000000014;
  *(_QWORD *)(v0 + 208) = 0x800000019ABAD080;
  *(_QWORD *)(v0 + 216) = &unk_1E39993F8;
  strcpy((char *)(v0 + 224), "books.search");
  *(_BYTE *)(v0 + 237) = 0;
  *(_WORD *)(v0 + 238) = -5120;
  *(_QWORD *)(v0 + 240) = &unk_1E39996C8;
  *(_QWORD *)(v0 + 248) = 0xD000000000000013;
  *(_QWORD *)(v0 + 256) = 0x800000019ABAD0E0;
  *(_QWORD *)(v0 + 264) = &unk_1E3999928;
  *(_QWORD *)(v0 + 272) = 0xD000000000000013;
  *(_QWORD *)(v0 + 280) = 0x800000019ABAD120;
  *(_QWORD *)(v0 + 288) = &unk_1E3999BD8;
  *(_QWORD *)(v0 + 296) = 0xD000000000000014;
  *(_QWORD *)(v0 + 304) = 0x800000019ABAD160;
  *(_QWORD *)(v0 + 312) = &unk_1E3997FB8;
  *(_QWORD *)(v0 + 320) = 0xD000000000000017;
  *(_QWORD *)(v0 + 328) = 0x800000019ABAD1A0;
  *(_QWORD *)(v0 + 336) = &unk_1E3998238;
  *(_QWORD *)(v0 + 344) = 0xD000000000000014;
  *(_QWORD *)(v0 + 352) = 0x800000019ABAD1E0;
  *(_QWORD *)(v0 + 360) = &unk_1E3998388;
  *(_QWORD *)(v0 + 368) = 0xD000000000000011;
  *(_QWORD *)(v0 + 376) = 0x800000019ABAD220;
  *(_QWORD *)(v0 + 384) = &unk_1E39983B8;
  *(_QWORD *)(v0 + 392) = 0xD000000000000011;
  *(_QWORD *)(v0 + 400) = 0x800000019ABAD240;
  *(_QWORD *)(v0 + 408) = &unk_1E39983E8;
  *(_QWORD *)(v0 + 416) = 0xD000000000000014;
  *(_QWORD *)(v0 + 424) = 0x800000019ABAD260;
  *(_QWORD *)(v0 + 432) = &unk_1E3998428;
  *(_QWORD *)(v0 + 440) = 0xD000000000000011;
  *(_QWORD *)(v0 + 448) = 0x800000019ABAD2A0;
  *(_QWORD *)(v0 + 456) = &unk_1E3998468;
  *(_QWORD *)(v0 + 464) = 0xD000000000000012;
  *(_QWORD *)(v0 + 472) = 0x800000019ABAD2E0;
  *(_QWORD *)(v0 + 480) = &unk_1E3998498;
  strcpy((char *)(v0 + 488), "browser.search");
  *(_BYTE *)(v0 + 503) = -18;
  *(_QWORD *)(v0 + 504) = &unk_1E39984D8;
  *(_QWORD *)(v0 + 512) = 0xD000000000000014;
  *(_QWORD *)(v0 + 520) = 0x800000019ABAD320;
  *(_QWORD *)(v0 + 528) = &unk_1E3998508;
  *(_QWORD *)(v0 + 536) = 0xD000000000000014;
  *(_QWORD *)(v0 + 544) = 0x800000019ABAD360;
  *(_QWORD *)(v0 + 552) = &unk_1E3998578;
  *(_QWORD *)(v0 + 560) = 0xD000000000000016;
  *(_QWORD *)(v0 + 568) = 0x800000019ABAD3A0;
  *(_QWORD *)(v0 + 576) = &unk_1E39985A8;
  *(_QWORD *)(v0 + 584) = 0xD000000000000014;
  *(_QWORD *)(v0 + 592) = 0x800000019ABAD3E0;
  *(_QWORD *)(v0 + 600) = &unk_1E39985D8;
  *(_QWORD *)(v0 + 608) = 0xD000000000000016;
  *(_QWORD *)(v0 + 616) = 0x800000019ABAD420;
  *(_QWORD *)(v0 + 624) = &unk_1E3998608;
  *(_QWORD *)(v0 + 632) = 0xD000000000000016;
  *(_QWORD *)(v0 + 640) = 0x800000019ABAD460;
  *(_QWORD *)(v0 + 648) = &unk_1E3998648;
  *(_QWORD *)(v0 + 656) = 0xD000000000000015;
  *(_QWORD *)(v0 + 664) = 0x800000019ABAD4A0;
  *(_QWORD *)(v0 + 672) = &unk_1E3998678;
  *(_QWORD *)(v0 + 680) = 0xD000000000000015;
  *(_QWORD *)(v0 + 688) = 0x800000019ABAD4E0;
  *(_QWORD *)(v0 + 696) = &unk_1E39986E8;
  *(_QWORD *)(v0 + 704) = 0xD000000000000015;
  *(_QWORD *)(v0 + 712) = 0x800000019ABAD520;
  *(_QWORD *)(v0 + 720) = &unk_1E3998738;
  *(_QWORD *)(v0 + 728) = 0xD000000000000018;
  *(_QWORD *)(v0 + 736) = 0x800000019ABAD560;
  *(_QWORD *)(v0 + 744) = &unk_1E3998768;
  *(_QWORD *)(v0 + 752) = 0xD000000000000013;
  *(_QWORD *)(v0 + 760) = 0x800000019ABAD5A0;
  v1 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 768) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 776) = 0xD000000000000010;
  *(_QWORD *)(v0 + 784) = 0x800000019ABAD5E0;
  *(_QWORD *)(v0 + 792) = &unk_1E3998798;
  *(_QWORD *)(v0 + 800) = 0xD000000000000013;
  *(_QWORD *)(v0 + 808) = 0x800000019ABAD620;
  *(_QWORD *)(v0 + 816) = &unk_1E3998808;
  *(_QWORD *)(v0 + 824) = 0xD000000000000012;
  *(_QWORD *)(v0 + 832) = 0x800000019ABAD660;
  *(_QWORD *)(v0 + 840) = v1;
  *(_QWORD *)(v0 + 848) = 0xD000000000000014;
  *(_QWORD *)(v0 + 856) = 0x800000019ABAD6A0;
  *(_QWORD *)(v0 + 864) = &unk_1E3998858;
  *(_QWORD *)(v0 + 872) = 0xD000000000000012;
  *(_QWORD *)(v0 + 880) = 0x800000019ABAD6F0;
  *(_QWORD *)(v0 + 888) = &unk_1E3998888;
  *(_QWORD *)(v0 + 896) = 0xD000000000000018;
  *(_QWORD *)(v0 + 904) = 0x800000019ABAD730;
  *(_QWORD *)(v0 + 912) = &unk_1E39988B8;
  *(_QWORD *)(v0 + 920) = 0xD000000000000016;
  *(_QWORD *)(v0 + 928) = 0x800000019ABAD770;
  *(_QWORD *)(v0 + 936) = &unk_1E39988E8;
  *(_QWORD *)(v0 + 944) = 0xD00000000000001ELL;
  *(_QWORD *)(v0 + 952) = 0x800000019ABAD7B0;
  *(_QWORD *)(v0 + 960) = &unk_1E3998918;
  *(_QWORD *)(v0 + 968) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 976) = 0x800000019ABAD800;
  *(_QWORD *)(v0 + 984) = &unk_1E3998958;
  *(_QWORD *)(v0 + 992) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 1000) = 0x800000019ABAD850;
  *(_QWORD *)(v0 + 1008) = &unk_1E3998998;
  *(_QWORD *)(v0 + 1016) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 1024) = 0x800000019ABAD8A0;
  *(_QWORD *)(v0 + 1032) = &unk_1E39989D8;
  *(_QWORD *)(v0 + 1040) = 0xD00000000000001FLL;
  *(_QWORD *)(v0 + 1048) = 0x800000019ABAD8F0;
  *(_QWORD *)(v0 + 1056) = &unk_1E3998A18;
  *(_QWORD *)(v0 + 1064) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1072) = 0x800000019ABAD940;
  *(_QWORD *)(v0 + 1080) = &unk_1E3998A98;
  strcpy((char *)(v0 + 1088), "files.openFile");
  *(_BYTE *)(v0 + 1103) = -18;
  *(_QWORD *)(v0 + 1104) = &unk_1E3998AD8;
  *(_QWORD *)(v0 + 1112) = 0xD000000000000011;
  *(_QWORD *)(v0 + 1120) = 0x800000019ABAD980;
  *(_QWORD *)(v0 + 1128) = &unk_1E3998B08;
  *(_QWORD *)(v0 + 1136) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1144) = 0x800000019ABAD9C0;
  *(_QWORD *)(v0 + 1152) = &unk_1E3998B38;
  *(_QWORD *)(v0 + 1160) = 0x6F6D2E73656C6966;
  *(_QWORD *)(v0 + 1168) = 0xEF73656C69466576;
  *(_QWORD *)(v0 + 1176) = &unk_1E3998B78;
  *(_QWORD *)(v0 + 1184) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1192) = 0x800000019ABADA00;
  *(_QWORD *)(v0 + 1200) = &unk_1E3998BB8;
  *(_QWORD *)(v0 + 1208) = 0xD000000000000018;
  *(_QWORD *)(v0 + 1216) = 0x800000019ABADA40;
  *(_QWORD *)(v0 + 1224) = v1;
  strcpy((char *)(v0 + 1232), "journal.search");
  *(_BYTE *)(v0 + 1247) = -18;
  *(_QWORD *)(v0 + 1248) = &unk_1E3998C28;
  *(_QWORD *)(v0 + 1256) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1264) = 0x800000019ABADAA0;
  *(_QWORD *)(v0 + 1272) = &unk_1E3998C58;
  *(_QWORD *)(v0 + 1280) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1288) = 0x800000019ABADAE0;
  *(_QWORD *)(v0 + 1296) = &unk_1E3998CD8;
  *(_QWORD *)(v0 + 1304) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1312) = 0x800000019ABADB20;
  *(_QWORD *)(v0 + 1320) = &unk_1E3998D08;
  *(_QWORD *)(v0 + 1328) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1336) = 0x800000019ABADB60;
  *(_QWORD *)(v0 + 1344) = &unk_1E3998DD8;
  strcpy((char *)(v0 + 1352), "mail.saveDraft");
  *(_BYTE *)(v0 + 1367) = -18;
  *(_QWORD *)(v0 + 1368) = &unk_1E3998E78;
  *(_QWORD *)(v0 + 1376) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1384) = 0x800000019ABADBA0;
  *(_QWORD *)(v0 + 1392) = &unk_1E3998EA8;
  strcpy((char *)(v0 + 1400), "mail.sendDraft");
  *(_BYTE *)(v0 + 1415) = -18;
  *(_QWORD *)(v0 + 1416) = &unk_1E3998ED8;
  *(_QWORD *)(v0 + 1424) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1432) = 0x800000019ABADBE0;
  *(_QWORD *)(v0 + 1440) = &unk_1E3998F18;
  strcpy((char *)(v0 + 1448), "mail.replyMail");
  *(_BYTE *)(v0 + 1463) = -18;
  *(_QWORD *)(v0 + 1464) = &unk_1E3998FB8;
  *(_QWORD *)(v0 + 1472) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1480) = 0x800000019ABADC20;
  *(_QWORD *)(v0 + 1488) = &unk_1E3999068;
  *(_QWORD *)(v0 + 1496) = 0x6C65642E6C69616DLL;
  *(_QWORD *)(v0 + 1504) = 0xEF6C69614D657465;
  *(_QWORD *)(v0 + 1512) = &unk_1E3999098;
  *(_QWORD *)(v0 + 1520) = 0x6470752E6C69616DLL;
  *(_QWORD *)(v0 + 1528) = 0xEF6C69614D657461;
  *(_QWORD *)(v0 + 1536) = &unk_1E39990C8;
  *(_QWORD *)(v0 + 1544) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1552) = 0x800000019ABADCA0;
  *(_QWORD *)(v0 + 1560) = &unk_1E3999128;
  *(_QWORD *)(v0 + 1568) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1576) = 0x800000019ABADCE0;
  *(_QWORD *)(v0 + 1584) = &unk_1E3999198;
  *(_QWORD *)(v0 + 1592) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1600) = 0x800000019ABADD20;
  *(_QWORD *)(v0 + 1608) = &unk_1E39991C8;
  *(_QWORD *)(v0 + 1616) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1624) = 0x800000019ABADD60;
  *(_QWORD *)(v0 + 1632) = &unk_1E3999208;
  *(_QWORD *)(v0 + 1640) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1648) = 0x800000019ABADDA0;
  *(_QWORD *)(v0 + 1656) = &unk_1E3999238;
  *(_QWORD *)(v0 + 1664) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1672) = 0x800000019ABADDE0;
  *(_QWORD *)(v0 + 1680) = &unk_1E3999268;
  *(_QWORD *)(v0 + 1688) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1696) = 0x800000019ABADE20;
  *(_QWORD *)(v0 + 1704) = &unk_1E3999298;
  *(_QWORD *)(v0 + 1712) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1720) = 0x800000019ABADE60;
  *(_QWORD *)(v0 + 1728) = &unk_1E39992F8;
  *(_QWORD *)(v0 + 1736) = 0xD000000000000016;
  *(_QWORD *)(v0 + 1744) = 0x800000019ABADEA0;
  *(_QWORD *)(v0 + 1752) = &unk_1E3999328;
  *(_QWORD *)(v0 + 1760) = 0xD000000000000018;
  *(_QWORD *)(v0 + 1768) = 0x800000019ABADEE0;
  *(_QWORD *)(v0 + 1776) = &unk_1E3999358;
  *(_QWORD *)(v0 + 1784) = 0xD000000000000017;
  *(_QWORD *)(v0 + 1792) = 0x800000019ABADF20;
  *(_QWORD *)(v0 + 1800) = &unk_1E39993B8;
  *(_QWORD *)(v0 + 1808) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 1816) = 0x800000019ABADF60;
  *(_QWORD *)(v0 + 1824) = &unk_1E3999478;
  strcpy((char *)(v0 + 1832), "photos.search");
  *(_WORD *)(v0 + 1846) = -4864;
  *(_QWORD *)(v0 + 1848) = &unk_1E39994B8;
  *(_QWORD *)(v0 + 1856) = 0xD00000000000001DLL;
  *(_QWORD *)(v0 + 1864) = 0x800000019ABADFD0;
  *(_QWORD *)(v0 + 1872) = &unk_1E39994E8;
  *(_QWORD *)(v0 + 1880) = 0xD000000000000010;
  *(_QWORD *)(v0 + 1888) = 0x800000019ABAE010;
  *(_QWORD *)(v0 + 1896) = &unk_1E3999538;
  *(_QWORD *)(v0 + 1904) = 0xD000000000000011;
  *(_QWORD *)(v0 + 1912) = 0x800000019ABAE050;
  *(_QWORD *)(v0 + 1920) = &unk_1E3999568;
  *(_QWORD *)(v0 + 1928) = 0xD000000000000013;
  *(_QWORD *)(v0 + 1936) = 0x800000019ABAE090;
  *(_QWORD *)(v0 + 1944) = &unk_1E3999598;
  *(_QWORD *)(v0 + 1952) = 0xD000000000000012;
  *(_QWORD *)(v0 + 1960) = 0x800000019ABAE0D0;
  *(_QWORD *)(v0 + 1968) = &unk_1E39995C8;
  *(_QWORD *)(v0 + 1976) = 0xD000000000000014;
  *(_QWORD *)(v0 + 1984) = 0x800000019ABAE110;
  *(_QWORD *)(v0 + 1992) = &unk_1E3999608;
  *(_QWORD *)(v0 + 2000) = 0xD000000000000010;
  *(_QWORD *)(v0 + 2008) = 0x800000019ABAE150;
  *(_QWORD *)(v0 + 2016) = &unk_1E3999648;
  *(_QWORD *)(v0 + 2032) = 0x800000019ABAE190;
  *(_QWORD *)(v0 + 2040) = &unk_1E3999688;
  *(_QWORD *)(v0 + 2024) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 2056) = 0x800000019ABAE1D0;
  *(_QWORD *)(v0 + 2048) = 0xD000000000000010;
  *(_QWORD *)(v0 + 2064) = &unk_1E39996F8;
  *(_QWORD *)(v0 + 2072) = 0x732E736F746F6870;
  *(_QWORD *)(v0 + 2080) = 0xEF68747065447465;
  *(_QWORD *)(v0 + 2088) = &unk_1E3999738;
  *(_QWORD *)(v0 + 2096) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2104) = 0x800000019ABAE230;
  *(_QWORD *)(v0 + 2112) = &unk_1E3999778;
  *(_QWORD *)(v0 + 2120) = 0x632E736F746F6870;
  *(_QWORD *)(v0 + 2128) = 0xEB00000000706F72;
  *(_QWORD *)(v0 + 2136) = &unk_1E39997B8;
  *(_QWORD *)(v0 + 2144) = 0xD000000000000011;
  *(_QWORD *)(v0 + 2152) = 0x800000019ABAE270;
  *(_QWORD *)(v0 + 2160) = &unk_1E39997E8;
  *(_QWORD *)(v0 + 2168) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2176) = 0x800000019ABAE2B0;
  *(_QWORD *)(v0 + 2184) = &unk_1E3999818;
  *(_QWORD *)(v0 + 2192) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2200) = 0x800000019ABAE2F0;
  *(_QWORD *)(v0 + 2208) = &unk_1E3999858;
  *(_QWORD *)(v0 + 2216) = 0xD000000000000011;
  *(_QWORD *)(v0 + 2224) = 0x800000019ABAE330;
  *(_QWORD *)(v0 + 2232) = &unk_1E3999888;
  *(_QWORD *)(v0 + 2240) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 2248) = 0x800000019ABAE370;
  *(_QWORD *)(v0 + 2256) = &unk_1E39998B8;
  *(_QWORD *)(v0 + 2264) = 0xD000000000000019;
  *(_QWORD *)(v0 + 2272) = 0x800000019ABAE3B0;
  *(_QWORD *)(v0 + 2280) = &unk_1E39998F8;
  *(_QWORD *)(v0 + 2288) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2296) = 0x800000019ABAE3F0;
  *(_QWORD *)(v0 + 2304) = &unk_1E3999968;
  *(_QWORD *)(v0 + 2312) = 0xD000000000000018;
  *(_QWORD *)(v0 + 2320) = 0x800000019ABAE430;
  *(_QWORD *)(v0 + 2328) = &unk_1E39999A8;
  *(_QWORD *)(v0 + 2336) = 0xD000000000000016;
  *(_QWORD *)(v0 + 2344) = 0x800000019ABAE470;
  *(_QWORD *)(v0 + 2352) = &unk_1E39999E8;
  *(_QWORD *)(v0 + 2360) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 2368) = 0x800000019ABAE4B0;
  *(_QWORD *)(v0 + 2376) = &unk_1E3999A18;
  *(_QWORD *)(v0 + 2384) = 0xD00000000000001ELL;
  *(_QWORD *)(v0 + 2392) = 0x800000019ABAE4F0;
  *(_QWORD *)(v0 + 2400) = &unk_1E3999A58;
  *(_QWORD *)(v0 + 2408) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 2416) = 0x800000019ABAE540;
  *(_QWORD *)(v0 + 2424) = &unk_1E3999A98;
  *(_QWORD *)(v0 + 2432) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 2440) = 0x800000019ABAE590;
  *(_QWORD *)(v0 + 2448) = &unk_1E3999AD8;
  *(_QWORD *)(v0 + 2456) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 2464) = 0x800000019ABAE5E0;
  *(_QWORD *)(v0 + 2472) = &unk_1E3999B18;
  *(_QWORD *)(v0 + 2480) = 0xD00000000000001FLL;
  *(_QWORD *)(v0 + 2488) = 0x800000019ABAE630;
  *(_QWORD *)(v0 + 2496) = &unk_1E3999B58;
  *(_QWORD *)(v0 + 2504) = 0xD00000000000001ELL;
  *(_QWORD *)(v0 + 2512) = 0x800000019ABAE680;
  *(_QWORD *)(v0 + 2520) = &unk_1E3999B98;
  *(_QWORD *)(v0 + 2528) = 0xD000000000000018;
  *(_QWORD *)(v0 + 2536) = 0x800000019ABAE6D0;
  *(_QWORD *)(v0 + 2544) = &unk_1E3997D68;
  *(_QWORD *)(v0 + 2552) = 0xD000000000000016;
  *(_QWORD *)(v0 + 2560) = 0x800000019ABAE710;
  *(_QWORD *)(v0 + 2568) = &unk_1E3997D98;
  *(_QWORD *)(v0 + 2576) = 0xD000000000000016;
  *(_QWORD *)(v0 + 2584) = 0x800000019ABAE750;
  *(_QWORD *)(v0 + 2592) = &unk_1E3997DD8;
  *(_QWORD *)(v0 + 2600) = 0x6F2E726564616572;
  *(_QWORD *)(v0 + 2608) = 0xEF656761506E6570;
  *(_QWORD *)(v0 + 2616) = &unk_1E3997E28;
  *(_QWORD *)(v0 + 2624) = 0xD000000000000017;
  *(_QWORD *)(v0 + 2632) = 0x800000019ABAE7B0;
  *(_QWORD *)(v0 + 2640) = &unk_1E3997E58;
  *(_QWORD *)(v0 + 2648) = 0xD000000000000016;
  *(_QWORD *)(v0 + 2656) = 0x800000019ABAE7F0;
  *(_QWORD *)(v0 + 2664) = &unk_1E3997E88;
  *(_QWORD *)(v0 + 2672) = 0xD000000000000013;
  *(_QWORD *)(v0 + 2680) = 0x800000019ABAE830;
  *(_QWORD *)(v0 + 2688) = &unk_1E3997EC8;
  *(_QWORD *)(v0 + 2696) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2704) = 0x800000019ABAE870;
  *(_QWORD *)(v0 + 2712) = &unk_1E3997EF8;
  *(_QWORD *)(v0 + 2720) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2728) = 0x800000019ABAE8B0;
  *(_QWORD *)(v0 + 2736) = &unk_1E3997F38;
  *(_QWORD *)(v0 + 2744) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2752) = 0x800000019ABAE8F0;
  *(_QWORD *)(v0 + 2760) = &unk_1E3997F68;
  *(_QWORD *)(v0 + 2768) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2776) = 0x800000019ABAE930;
  *(_QWORD *)(v0 + 2784) = &unk_1E3997FF8;
  *(_QWORD *)(v0 + 2792) = 0xD000000000000010;
  *(_QWORD *)(v0 + 2800) = 0x800000019ABAE970;
  *(_QWORD *)(v0 + 2808) = &unk_1E3998028;
  *(_QWORD *)(v0 + 2816) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2824) = 0x800000019ABAE9B0;
  *(_QWORD *)(v0 + 2832) = &unk_1E3998058;
  *(_QWORD *)(v0 + 2840) = 0xD000000000000012;
  *(_QWORD *)(v0 + 2848) = 0x800000019ABAE9F0;
  *(_QWORD *)(v0 + 2856) = &unk_1E3998098;
  *(_QWORD *)(v0 + 2864) = 0xD000000000000017;
  *(_QWORD *)(v0 + 2872) = 0x800000019ABAEA30;
  *(_QWORD *)(v0 + 2880) = &unk_1E39980C8;
  *(_QWORD *)(v0 + 2888) = 0xD000000000000015;
  *(_QWORD *)(v0 + 2896) = 0x800000019ABAEA70;
  *(_QWORD *)(v0 + 2904) = &unk_1E39980F8;
  *(_QWORD *)(v0 + 2912) = 0xD000000000000017;
  *(_QWORD *)(v0 + 2920) = 0x800000019ABAEA90;
  *(_QWORD *)(v0 + 2928) = &unk_1E3998128;
  *(_QWORD *)(v0 + 2936) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 2944) = 0x800000019ABAEAD0;
  *(_QWORD *)(v0 + 2952) = &unk_1E3998178;
  *(_QWORD *)(v0 + 2960) = 0xD00000000000001DLL;
  *(_QWORD *)(v0 + 2968) = 0x800000019ABAEB10;
  *(_QWORD *)(v0 + 2976) = &unk_1E39981B8;
  *(_QWORD *)(v0 + 2984) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 2992) = 0x800000019ABAEB50;
  *(_QWORD *)(v0 + 3000) = &unk_1E39981F8;
  *(_QWORD *)(v0 + 3008) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 3016) = 0x800000019ABAEB90;
  *(_QWORD *)(v0 + 3024) = &unk_1E3998268;
  *(_QWORD *)(v0 + 3032) = 0xD00000000000001ELL;
  *(_QWORD *)(v0 + 3040) = 0x800000019ABAEBD0;
  *(_QWORD *)(v0 + 3048) = &unk_1E39982A8;
  *(_QWORD *)(v0 + 3056) = 0xD00000000000001DLL;
  *(_QWORD *)(v0 + 3064) = 0x800000019ABAEC10;
  *(_QWORD *)(v0 + 3072) = &unk_1E39982E8;
  *(_QWORD *)(v0 + 3080) = 0xD000000000000017;
  *(_QWORD *)(v0 + 3088) = 0x800000019ABAEC50;
  *(_QWORD *)(v0 + 3096) = &unk_1E3998328;
  strcpy((char *)(v0 + 3104), "system.search");
  *(_WORD *)(v0 + 3118) = -4864;
  *(_QWORD *)(v0 + 3120) = &unk_1E3998358;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA1910);
  return sub_19AB82590();
}

uint64_t static AssistantPrebuiltMapping.intentParametersByMacroArguments.getter()
{
  return sub_19AB01DC4(&qword_1EE3B9C60);
}

uint64_t sub_19AB52B18()
{
  uint64_t result;

  result = sub_19AB52B34();
  qword_1EE3BB500 = result;
  return result;
}

uint64_t sub_19AB52B34()
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE3BB508);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19AB95B90;
  *(_QWORD *)(inited + 32) = 0x6F622E736B6F6F62;
  *(_QWORD *)(inited + 40) = 0xEA00000000006B6FLL;
  *(_QWORD *)(inited + 48) = &unk_1E3997CB8;
  *(_QWORD *)(inited + 56) = 0x75612E736B6F6F62;
  *(_QWORD *)(inited + 64) = 0xEF6B6F6F626F6964;
  *(_QWORD *)(inited + 72) = &unk_1E3997358;
  strcpy((char *)(inited + 80), "books.settings");
  *(_BYTE *)(inited + 95) = -18;
  *(_QWORD *)(inited + 96) = &unk_1E39977D8;
  *(_QWORD *)(inited + 104) = 0xD000000000000010;
  *(_QWORD *)(inited + 112) = 0x800000019ABAECD0;
  *(_QWORD *)(inited + 120) = &unk_1E3997A48;
  *(_QWORD *)(inited + 128) = 0x2E726573776F7262;
  *(_QWORD *)(inited + 136) = 0xEF79726F74736968;
  *(_QWORD *)(inited + 144) = &unk_1E3997A88;
  *(_QWORD *)(inited + 152) = 0x2E726573776F7262;
  *(_QWORD *)(inited + 160) = 0xEB00000000626174;
  *(_QWORD *)(inited + 168) = &unk_1E3997AC8;
  strcpy((char *)(inited + 176), "browser.window");
  *(_BYTE *)(inited + 191) = -18;
  *(_QWORD *)(inited + 192) = &unk_1E3997B18;
  *(_QWORD *)(inited + 200) = 0xD000000000000010;
  *(_QWORD *)(inited + 208) = 0x800000019ABAECF0;
  *(_QWORD *)(inited + 216) = &unk_1E3997B58;
  *(_QWORD *)(inited + 224) = 0x616F626574696877;
  *(_QWORD *)(inited + 232) = 0xEF6D6574692E6472;
  *(_QWORD *)(inited + 240) = &unk_1E3997BA8;
  *(_QWORD *)(inited + 248) = 0xD000000000000016;
  *(_QWORD *)(inited + 256) = 0x800000019ABAED30;
  *(_QWORD *)(inited + 264) = &unk_1E3997C28;
  *(_QWORD *)(inited + 272) = 0xD000000000000012;
  *(_QWORD *)(inited + 280) = 0x800000019ABAED70;
  *(_QWORD *)(inited + 288) = &unk_1E3997C78;
  *(_QWORD *)(inited + 296) = 0xD000000000000016;
  *(_QWORD *)(inited + 304) = 0x800000019ABAEDB0;
  *(_QWORD *)(inited + 312) = &unk_1E39973D8;
  *(_QWORD *)(inited + 320) = 0x69662E73656C6966;
  *(_QWORD *)(inited + 328) = 0xEA0000000000656CLL;
  *(_QWORD *)(inited + 336) = &unk_1E3997408;
  strcpy((char *)(inited + 344), "journal.entry");
  *(_WORD *)(inited + 358) = -4864;
  *(_QWORD *)(inited + 360) = &unk_1E3997448;
  strcpy((char *)(inited + 368), "mail.account");
  *(_BYTE *)(inited + 381) = 0;
  *(_WORD *)(inited + 382) = -5120;
  *(_QWORD *)(inited + 384) = &unk_1E39974B8;
  strcpy((char *)(inited + 392), "mail.mailbox");
  *(_BYTE *)(inited + 405) = 0;
  *(_WORD *)(inited + 406) = -5120;
  *(_QWORD *)(inited + 408) = &unk_1E39974F8;
  strcpy((char *)(inited + 416), "mail.message");
  *(_BYTE *)(inited + 429) = 0;
  *(_WORD *)(inited + 430) = -5120;
  *(_QWORD *)(inited + 432) = &unk_1E3997538;
  *(_QWORD *)(inited + 440) = 0x6172642E6C69616DLL;
  *(_QWORD *)(inited + 448) = 0xEA00000000007466;
  *(_QWORD *)(inited + 456) = &unk_1E3997638;
  strcpy((char *)(inited + 464), "photos.asset");
  *(_BYTE *)(inited + 477) = 0;
  *(_WORD *)(inited + 478) = -5120;
  *(_QWORD *)(inited + 480) = &unk_1E39976C8;
  strcpy((char *)(inited + 488), "photos.album");
  *(_BYTE *)(inited + 501) = 0;
  *(_WORD *)(inited + 502) = -5120;
  *(_QWORD *)(inited + 504) = &unk_1E3997748;
  *(_QWORD *)(inited + 512) = 0xD000000000000017;
  *(_QWORD *)(inited + 520) = 0x800000019ABAEE60;
  *(_QWORD *)(inited + 528) = &unk_1E3997798;
  *(_QWORD *)(inited + 536) = 0xD000000000000012;
  *(_QWORD *)(inited + 544) = 0x800000019ABAEEA0;
  *(_QWORD *)(inited + 552) = &unk_1E3997858;
  *(_QWORD *)(inited + 560) = 0xD000000000000015;
  *(_QWORD *)(inited + 568) = 0x800000019ABAEEE0;
  *(_QWORD *)(inited + 576) = &unk_1E39978A8;
  *(_QWORD *)(inited + 584) = 0xD000000000000015;
  *(_QWORD *)(inited + 592) = 0x800000019ABAEF20;
  *(_QWORD *)(inited + 600) = &unk_1E39978D8;
  *(_QWORD *)(inited + 608) = 0x642E726564616572;
  *(_QWORD *)(inited + 616) = 0xEF746E656D75636FLL;
  *(_QWORD *)(inited + 624) = &unk_1E3997908;
  *(_QWORD *)(inited + 632) = 0x702E726564616572;
  *(_QWORD *)(inited + 640) = 0xEB00000000656761;
  *(_QWORD *)(inited + 648) = &unk_1E3997968;
  *(_QWORD *)(inited + 656) = 0xD000000000000011;
  *(_QWORD *)(inited + 664) = 0x800000019ABAEFA0;
  *(_QWORD *)(inited + 672) = &unk_1E3997998;
  *(_QWORD *)(inited + 680) = 0xD000000000000014;
  *(_QWORD *)(inited + 688) = 0x800000019ABAEFC0;
  *(_QWORD *)(inited + 696) = &unk_1E39979E8;
  *(_QWORD *)(inited + 704) = 0xD000000000000014;
  *(_QWORD *)(inited + 712) = 0x800000019ABAF000;
  *(_QWORD *)(inited + 720) = &unk_1E3997A18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBA1910);
  return sub_19AB82590();
}

uint64_t static AssistantPrebuiltMapping.entityPropertiesByMacroArguments.getter()
{
  return sub_19AB01DC4(&qword_1EE3B9C68);
}

ValueMetadata *type metadata accessor for AssistantPrebuiltMapping()
{
  return &type metadata for AssistantPrebuiltMapping;
}

const __CFString *LNSearchCriteriaValueTypeIdentifierAsString()
{
  return CFSTR("String");
}

const __CFString *LNShortcutTileColorAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("red");
  else
    return off_1E39A0B50[a1 - 1];
}

const __CFString *LNPrimitiveValueTypeIdentifierAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xB)
    return CFSTR("String");
  else
    return off_1E39A0C60[a1 - 1];
}

const __CFString *LNIntentsValueTypeIdentifierAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("Application");
  else
    return off_1E39A0E80[a1 - 1];
}

id getLNLogCategoryGeneral()
{
  if (getLNLogCategoryGeneral_onceToken[0] != -1)
    dispatch_once(getLNLogCategoryGeneral_onceToken, &__block_literal_global_2861);
  return (id)getLNLogCategoryGeneral_logger;
}

void __getLNLogCategoryGeneral_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "General");
  v1 = (void *)getLNLogCategoryGeneral_logger;
  getLNLogCategoryGeneral_logger = (uint64_t)v0;

}

id getLNLogCategoryConnection()
{
  if (getLNLogCategoryConnection_onceToken != -1)
    dispatch_once(&getLNLogCategoryConnection_onceToken, &__block_literal_global_4_2862);
  return (id)getLNLogCategoryConnection_logger;
}

void __getLNLogCategoryConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "Connection");
  v1 = (void *)getLNLogCategoryConnection_logger;
  getLNLogCategoryConnection_logger = (uint64_t)v0;

}

id getLNLogCategoryQuery()
{
  if (getLNLogCategoryQuery_onceToken != -1)
    dispatch_once(&getLNLogCategoryQuery_onceToken, &__block_literal_global_8_2866);
  return (id)getLNLogCategoryQuery_logger;
}

void __getLNLogCategoryQuery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "Query");
  v1 = (void *)getLNLogCategoryQuery_logger;
  getLNLogCategoryQuery_logger = (uint64_t)v0;

}

id getLNLogCategoryView()
{
  if (getLNLogCategoryView_onceToken != -1)
    dispatch_once(&getLNLogCategoryView_onceToken, &__block_literal_global_10_2867);
  return (id)getLNLogCategoryView_logger;
}

void __getLNLogCategoryView_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "View");
  v1 = (void *)getLNLogCategoryView_logger;
  getLNLogCategoryView_logger = (uint64_t)v0;

}

id getLNLogCategorySecurity()
{
  if (getLNLogCategorySecurity_onceToken != -1)
    dispatch_once(&getLNLogCategorySecurity_onceToken, &__block_literal_global_14_2871);
  return (id)getLNLogCategorySecurity_logger;
}

void __getLNLogCategorySecurity_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "Security");
  v1 = (void *)getLNLogCategorySecurity_logger;
  getLNLogCategorySecurity_logger = (uint64_t)v0;

}

id getLNLogCategoryVocabulary()
{
  if (getLNLogCategoryVocabulary_onceToken != -1)
    dispatch_once(&getLNLogCategoryVocabulary_onceToken, &__block_literal_global_16);
  return (id)getLNLogCategoryVocabulary_logger;
}

void __getLNLogCategoryVocabulary_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "Vocabulary");
  v1 = (void *)getLNLogCategoryVocabulary_logger;
  getLNLogCategoryVocabulary_logger = (uint64_t)v0;

}

id getLNLogCategorySandbox()
{
  if (getLNLogCategorySandbox_onceToken != -1)
    dispatch_once(&getLNLogCategorySandbox_onceToken, &__block_literal_global_18);
  return (id)getLNLogCategorySandbox_logger;
}

void __getLNLogCategorySandbox_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "Sandbox");
  v1 = (void *)getLNLogCategorySandbox_logger;
  getLNLogCategorySandbox_logger = (uint64_t)v0;

}

void __getLNLogCategoryExtensionMediator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "ExtensionMediator");
  v1 = (void *)getLNLogCategoryExtensionMediator_logger;
  getLNLogCategoryExtensionMediator_logger = (uint64_t)v0;

}

id getLNLogCategoryDaemonMediator()
{
  if (getLNLogCategoryDaemonMediator_onceToken != -1)
    dispatch_once(&getLNLogCategoryDaemonMediator_onceToken, &__block_literal_global_24);
  return (id)getLNLogCategoryDaemonMediator_logger;
}

void __getLNLogCategoryDaemonMediator_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "DaemonMediator");
  v1 = (void *)getLNLogCategoryDaemonMediator_logger;
  getLNLogCategoryDaemonMediator_logger = (uint64_t)v0;

}

id getLNLogCategoryScenes()
{
  if (getLNLogCategoryScenes_onceToken != -1)
    dispatch_once(&getLNLogCategoryScenes_onceToken, &__block_literal_global_26);
  return (id)getLNLogCategoryScenes_logger;
}

void __getLNLogCategoryScenes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(LNLogSubsystem, "Scenes");
  v1 = (void *)getLNLogCategoryScenes_logger;
  getLNLogCategoryScenes_logger = (uint64_t)v0;

}

void sub_19AB68884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

const __CFString *LNIdentifierScopeAsString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Undefined");
  if (a1 == 1)
    v1 = CFSTR("Ephemeral");
  if (a1 == 2)
    return CFSTR("Local");
  else
    return v1;
}

Class __getLNExportedContentClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!LinkServicesLibraryCore_frameworkLibrary)
    LinkServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!LinkServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *LinkServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("LNValue.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("LNExportedContent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getLNExportedContentClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("LNValue.m"), 19, CFSTR("Unable to find class %s"), "LNExportedContent");

LABEL_8:
    __break(1u);
  }
  getLNExportedContentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t LNMeasurementUnitTypeOfUnit(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = 2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v2 = 3;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v2 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v2 = 6;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v2 = 7;
              else
                v2 = 0;
            }
          }
        }
      }
    }
  }

  return v2;
}

id LNMeasurementUnitTypeToUnit(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  unitsOfUnitType(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __LNMeasurementUnitTypeToUnit_block_invoke;
  v10[3] = &unk_1E39A18B8;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "if_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A50]), "initWithSymbol:", v5);
  v8 = v7;

  return v8;
}

id unitsOfUnitType(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id result;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void **v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[31];
  _QWORD v107[3];
  _QWORD v108[4];
  _QWORD v109[10];
  _QWORD v110[11];
  _QWORD v111[16];
  _QWORD v112[22];
  _QWORD v113[35];
  void *v114;
  _QWORD v115[3];
  _QWORD v116[9];
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD v119[5];
  _QWORD v120[5];
  _QWORD v121[6];
  _QWORD v122[7];
  void *v123;
  _QWORD v124[2];
  _QWORD v125[14];
  _QWORD v126[6];
  _QWORD v127[4];

  v127[2] = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3AD8], "megameters");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v112[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v112[1] = v104;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "hectometers");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v112[2] = v102;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "decameters");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v112[3] = v101;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v112[4] = v100;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "decimeters");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v112[5] = v99;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v112[6] = v98;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "millimeters");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v112[7] = v97;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "micrometers");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v112[8] = v96;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "nanometers");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v112[9] = v95;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "picometers");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v112[10] = v94;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v112[11] = v93;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v112[12] = v92;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v112[13] = v91;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v112[14] = v2;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "scandinavianMiles");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v112[15] = v3;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "lightyears");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v112[16] = v4;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "nauticalMiles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v112[17] = v5;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "fathoms");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v112[18] = v6;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "furlongs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v112[19] = v7;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "astronomicalUnits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v112[20] = v8;
      objc_msgSend(MEMORY[0x1E0CB3AD8], "parsecs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v112[21] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_35;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v111[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v111[1] = v104;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "decigrams");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v111[2] = v102;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "centigrams");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v111[3] = v101;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v111[4] = v100;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v111[5] = v99;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "nanograms");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v111[6] = v98;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "picograms");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v111[7] = v97;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v111[8] = v12;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v111[9] = v13;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v111[10] = v14;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "metricTons");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v111[11] = v15;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "shortTons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v111[12] = v16;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "carats");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v111[13] = v17;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "ouncesTroy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v111[14] = v18;
      objc_msgSend(MEMORY[0x1E0CB3AE0], "slugs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v111[15] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3B00], "kelvin");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v107[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v107[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v107[2] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v107;
      goto LABEL_30;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3B08], "megaliters");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v106[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3B08], "kiloliters");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v106[1] = v104;
      objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v106[2] = v102;
      objc_msgSend(MEMORY[0x1E0CB3B08], "deciliters");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v106[3] = v101;
      objc_msgSend(MEMORY[0x1E0CB3B08], "centiliters");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v106[4] = v100;
      objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v106[5] = v99;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicKilometers");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v106[6] = v98;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMeters");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v106[7] = v97;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicDecimeters");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v106[8] = v96;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicCentimeters");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v106[9] = v95;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMillimeters");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v106[10] = v94;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicInches");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v106[11] = v93;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicFeet");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v106[12] = v92;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicYards");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v106[13] = v91;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMiles");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v106[14] = v90;
      objc_msgSend(MEMORY[0x1E0CB3B08], "acreFeet");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v106[15] = v89;
      objc_msgSend(MEMORY[0x1E0CB3B08], "bushels");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v106[16] = v88;
      objc_msgSend(MEMORY[0x1E0CB3B08], "teaspoons");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v106[17] = v87;
      objc_msgSend(MEMORY[0x1E0CB3B08], "tablespoons");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v106[18] = v86;
      objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v106[19] = v85;
      objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v106[20] = v84;
      objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v106[21] = v83;
      objc_msgSend(MEMORY[0x1E0CB3B08], "quarts");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v106[22] = v82;
      objc_msgSend(MEMORY[0x1E0CB3B08], "gallons");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v106[23] = v24;
      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTeaspoons");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v106[24] = v25;
      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTablespoons");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v106[25] = v26;
      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialFluidOunces");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v106[26] = v27;
      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialPints");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v106[27] = v28;
      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialQuarts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v106[28] = v29;
      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialGallons");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v106[29] = v30;
      objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v106[30] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB3AF8], "metersPerSecond");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v108[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v108[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3AF8], "knots");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v108[3] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilojoules");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v117[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v117[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v117[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v117[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v117[4] = v33;
      v34 = (void *)MEMORY[0x1E0C99D20];
      v35 = v117;
      goto LABEL_21;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v122[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v122[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3A88], "milliseconds");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v122[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3A88], "microseconds");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v122[4] = v33;
      objc_msgSend(MEMORY[0x1E0CB3A88], "nanoseconds");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v122[5] = v36;
      objc_msgSend(MEMORY[0x1E0CB3A88], "picoseconds");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v122[6] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3A58], "metersPerSecondSquared");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v127[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A58], "gravity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v127[1] = v20;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v127;
      goto LABEL_14;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A60], "arcMinutes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v126[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3A60], "arcSeconds");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v126[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3A60], "radians");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v126[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3A60], "gradians");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v126[4] = v33;
      objc_msgSend(MEMORY[0x1E0CB3A60], "revolutions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v126[5] = v36;
      v40 = (void *)MEMORY[0x1E0C99D20];
      v41 = v126;
      goto LABEL_17;
    case 10:
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareMegameters");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareKilometers");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v104;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareMeters");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v125[2] = v102;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareCentimeters");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v125[3] = v101;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareMillimeters");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v125[4] = v100;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareMicrometers");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v125[5] = v99;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareNanometers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v125[6] = v42;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareInches");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v125[7] = v43;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareFeet");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v125[8] = v44;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareYards");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v125[9] = v45;
      objc_msgSend(MEMORY[0x1E0CB3A68], "squareMiles");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v125[10] = v46;
      objc_msgSend(MEMORY[0x1E0CB3A68], "acres");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v125[11] = v47;
      objc_msgSend(MEMORY[0x1E0CB3A68], "ares");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v125[12] = v48;
      objc_msgSend(MEMORY[0x1E0CB3A68], "hectares");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v125[13] = v49;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_37;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB3A70], "gramsPerLiter");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v124[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A70], "milligramsPerDeciliter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v124[1] = v20;
      v38 = (void *)MEMORY[0x1E0C99D20];
      v39 = v124;
LABEL_14:
      objc_msgSend(v38, "arrayWithObjects:count:", v39, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB3A80], "partsPerMillion");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v1;
      v50 = (void *)MEMORY[0x1E0C99D20];
      v51 = &v123;
      goto LABEL_32;
    case 13:
      objc_msgSend(MEMORY[0x1E0CB3A90], "coulombs");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v121[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A90], "megaampereHours");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v121[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3A90], "kiloampereHours");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v121[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3A90], "ampereHours");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v121[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3A90], "milliampereHours");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v121[4] = v33;
      objc_msgSend(MEMORY[0x1E0CB3A90], "microampereHours");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v121[5] = v36;
      v40 = (void *)MEMORY[0x1E0C99D20];
      v41 = v121;
LABEL_17:
      objc_msgSend(v40, "arrayWithObjects:count:", v41, 6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 14:
      objc_msgSend(MEMORY[0x1E0CB3A98], "megaamperes");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v120[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3A98], "kiloamperes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v120[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3A98], "amperes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v120[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3A98], "milliamperes");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v120[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3A98], "microamperes");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v120[4] = v33;
      v34 = (void *)MEMORY[0x1E0C99D20];
      v35 = v120;
      goto LABEL_21;
    case 15:
      objc_msgSend(MEMORY[0x1E0CB3AA0], "megavolts");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v119[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "kilovolts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v119[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "volts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v119[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "millivolts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v119[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3AA0], "microvolts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v119[4] = v33;
      v34 = (void *)MEMORY[0x1E0C99D20];
      v35 = v119;
      goto LABEL_21;
    case 16:
      objc_msgSend(MEMORY[0x1E0CB3AA8], "megaohms");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "kiloohms");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v118[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "ohms");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v118[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "milliohms");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v118[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3AA8], "microohms");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v118[4] = v33;
      v34 = (void *)MEMORY[0x1E0C99D20];
      v35 = v118;
LABEL_21:
      objc_msgSend(v34, "arrayWithObjects:count:", v35, 5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 17:
      objc_msgSend(MEMORY[0x1E0CB3AB8], "terahertz");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "gigahertz");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "megahertz");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v21;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "kilohertz");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v116[3] = v32;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "hertz");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v116[4] = v33;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "millihertz");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v116[5] = v36;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "microhertz");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v116[6] = v37;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "nanohertz");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v116[7] = v52;
      objc_msgSend(MEMORY[0x1E0CB3AB8], "framesPerSecond");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v116[8] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
LABEL_24:

LABEL_25:
LABEL_26:

      goto LABEL_27;
    case 18:
      objc_msgSend(MEMORY[0x1E0CB3AC0], "litersPer100Kilometers");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v115[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AC0], "milesPerImperialGallon");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v115[1] = v20;
      objc_msgSend(MEMORY[0x1E0CB3AC0], "milesPerGallon");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v115[2] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v115;
LABEL_30:
      objc_msgSend(v22, "arrayWithObjects:count:", v23, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
      goto LABEL_40;
    case 19:
      objc_msgSend(MEMORY[0x1E0CB3AC8], "lux");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v1;
      v50 = (void *)MEMORY[0x1E0C99D20];
      v51 = &v114;
LABEL_32:
      objc_msgSend(v50, "arrayWithObjects:count:", v51, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    case 20:
      objc_msgSend(MEMORY[0x1E0CB3AD0], "bytes");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "bits");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v104;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "nibbles");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v113[2] = v102;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "yottabytes");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v113[3] = v101;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "zettabytes");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v113[4] = v100;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "exabytes");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v113[5] = v99;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "petabytes");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v113[6] = v98;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "terabytes");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v113[7] = v97;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "gigabytes");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v113[8] = v96;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "megabytes");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v113[9] = v95;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobytes");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v113[10] = v94;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "yottabits");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v113[11] = v93;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "zettabits");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v113[12] = v92;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "exabits");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v113[13] = v91;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "petabits");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v113[14] = v90;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "terabits");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v113[15] = v89;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "gigabits");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v113[16] = v88;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "megabits");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v113[17] = v87;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "kilobits");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v113[18] = v86;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "yobibytes");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v113[19] = v85;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "zebibytes");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v113[20] = v84;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "exbibytes");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v113[21] = v83;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "pebibytes");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v113[22] = v82;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "tebibytes");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v113[23] = v81;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "gibibytes");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v113[24] = v80;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "mebibytes");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v113[25] = v79;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "kibibytes");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v113[26] = v78;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "yobibits");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v113[27] = v54;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "zebibits");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v113[28] = v55;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "exbibits");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v113[29] = v56;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "pebibits");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v113[30] = v57;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "tebibits");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v113[31] = v58;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "gibibits");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v113[32] = v59;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "mebibits");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v113[33] = v60;
      objc_msgSend(MEMORY[0x1E0CB3AD0], "kibibits");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v113[34] = v61;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 35);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
LABEL_35:

LABEL_36:
LABEL_37:

      goto LABEL_39;
    case 21:
      objc_msgSend(MEMORY[0x1E0CB3AE8], "terawatts");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v110[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "gigawatts");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v110[1] = v104;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "megawatts");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2] = v103;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "kilowatts");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v110[3] = v62;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "watts");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v110[4] = v63;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "milliwatts");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v110[5] = v64;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "microwatts");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v110[6] = v65;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "nanowatts");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v110[7] = v66;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "picowatts");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v110[8] = v67;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "femtowatts");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v110[9] = v68;
      objc_msgSend(MEMORY[0x1E0CB3AE8], "horsepower");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v110[10] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v110, 11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
      goto LABEL_40;
    case 22:
      objc_msgSend(MEMORY[0x1E0CB3AF0], "newtonsPerMetersSquared");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v109[0] = v1;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "gigapascals");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v109[1] = v105;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "megapascals");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v109[2] = v70;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "kilopascals");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v109[3] = v71;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "hectopascals");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v109[4] = v72;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "inchesOfMercury");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v109[5] = v73;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "bars");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v109[6] = v74;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "millibars");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v109[7] = v75;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "millimetersOfMercury");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v109[8] = v76;
      objc_msgSend(MEMORY[0x1E0CB3AF0], "poundsForcePerSquareInch");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v109[9] = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v109, 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
      result = v10;
      break;
    default:
      result = MEMORY[0x1E0C9AA60];
      break;
  }
  return result;
}

__CFString *LNChangeEffectAsString(uint64_t a1)
{
  __int16 v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  if (a1 == -1)
  {
    v7 = CFSTR("Unknown");
  }
  else
  {
    v1 = a1;
    v2 = (void *)objc_opt_new();
    v3 = v2;
    if ((v1 & 0x301) != 0)
      v4 = CFSTR("Non Idempotent");
    else
      v4 = CFSTR("Idempotent");
    objc_msgSend(v2, "addObject:", v4);
    if ((v1 & 0x100) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("Destructive"));
    if ((v1 & 0x200) != 0)
      objc_msgSend(v3, "addObject:", CFSTR("Irrevocable"));
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("[ %@ ]"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

const __CFString *LNSideEffectAsString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (!a1)
    v1 = CFSTR("None");
  if (a1 == 1)
    return CFSTR("Change");
  else
    return v1;
}

uint64_t __Block_byref_object_copy__6391(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6392(uint64_t a1)
{

}

void sub_19AB7A948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t macho_good_enough_slice(const char *a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  int v14;
  int v15;
  _QWORD callback[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  v4 = open(a1, 0);
  if (v4 < 0)
  {
    v8 = *__error();
  }
  else
  {
    v5 = v4;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = -1;
    v6 = MEMORY[0x1E0C809B0];
    callback[0] = MEMORY[0x1E0C809B0];
    callback[1] = 3221225472;
    callback[2] = __macho_good_enough_slice_block_invoke;
    callback[3] = &unk_1E39A1B28;
    v20 = 16777228;
    v21 = 0;
    v7 = v3;
    v17 = v7;
    v18 = &v26;
    v19 = &v22;
    v8 = macho_for_each_slice(a1, callback);
    if (!(_DWORD)v8)
    {
      if (*((_BYTE *)v27 + 24) || *((_DWORD *)v23 + 6) == -1)
      {
        v8 = 0;
      }
      else
      {
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __macho_good_enough_slice_block_invoke_69;
        v10[3] = &unk_1E39A1B28;
        v12 = &v22;
        v14 = 16777228;
        v15 = 0;
        v11 = v7;
        v13 = &v26;
        v8 = macho_for_each_slice(a1, v10);

      }
    }
    close(v5);
    if (!(_DWORD)v8)
    {
      if (*((_BYTE *)v27 + 24))
        v8 = 0;
      else
        v8 = 86;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v8;
}

void sub_19AB7AB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

id _URLFromLibraryName(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t i;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  if (!strncmp(v12, "@executable_path/", 0x11uLL))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E98];
    v16 = v12 + 17;
LABEL_8:
    objc_msgSend(v15, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v16, a2, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (!strncmp(v12, "@loader_path/", 0xDuLL))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E98];
    v16 = v12 + 13;
    goto LABEL_8;
  }
  if ((a2 & 1) == 0 && !strncmp(v12, "@rpath/", 7uLL))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v20)
    {
      v21 = v20;
      v27 = v11;
      v22 = *(_QWORD *)v29;
      v23 = v12 + 7;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          _URLFromLibraryName(*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 1, v9, v10, v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v23, 0, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "checkResourceIsReachableAndReturnError:", 0))
          {
            objc_msgSend(v26, "absoluteURL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_20;
          }

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v21)
          continue;
        break;
      }
      v13 = 0;
LABEL_20:
      v11 = v27;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v13;
}

uint64_t __macho_good_enough_slice_block_invoke(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  int v6;
  NSObject *v8;
  int v9;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*a2 == -17958193)
  {
    v5 = result;
    if (a2[1] == *(_DWORD *)(result + 56))
    {
      v6 = a2[2];
      if (v6 == *(_DWORD *)(result + 60))
      {
        getLNLogCategoryMetadata();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v9 = *(_DWORD *)(v5 + 56);
          v10 = *(_DWORD *)(v5 + 60);
          v11[0] = 67109376;
          v11[1] = v9;
          v12 = 1024;
          v13 = v10;
          _os_log_impl(&dword_19A9C7000, v8, OS_LOG_TYPE_DEBUG, "found exact slice for architecture (%#x/%#x)", (uint8_t *)v11, 0xEu);
        }

        result = (*(uint64_t (**)(void))(*(_QWORD *)(v5 + 32) + 16))();
        *a5 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = 1;
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = v6;
      }
    }
  }
  return result;
}

uint64_t __macho_good_enough_slice_block_invoke_69(uint64_t result, _DWORD *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v6;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*a2 == -17958193)
  {
    v6 = result;
    if (a2[1] == *(_DWORD *)(result + 56) && a2[2] == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    {
      getLNLogCategoryMetadata();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = a2[1];
        v10 = a2[2];
        v11 = *(_DWORD *)(v6 + 56);
        v12 = *(_DWORD *)(v6 + 60);
        v13[0] = 67109888;
        v13[1] = v9;
        v14 = 1024;
        v15 = v10;
        v16 = 1024;
        v17 = v11;
        v18 = 1024;
        v19 = v12;
        _os_log_impl(&dword_19A9C7000, v8, OS_LOG_TYPE_DEBUG, "found good-enough slice (%#x/%#x) for architecture (%#x/%#x)", (uint8_t *)v13, 0x1Au);
      }

      result = (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16))();
      *a5 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t mh_validate(int *a1, uint64_t a2)
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  int v7;
  uint64_t v8;
  unint64_t v10;
  const char *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*a1 == -17958193)
  {
    if ((a1[6] & 0x80) == 0)
    {
      getLNLogCategoryMetadata();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15[0]) = 0;
        v4 = "non-two-level images not supported.";
        v5 = v3;
        v6 = 2;
LABEL_7:
        _os_log_impl(&dword_19A9C7000, v5, OS_LOG_TYPE_FAULT, v4, (uint8_t *)v15, v6);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    v10 = a1[5];
    if (a2 - 28 >= v10)
    {
      v12 = a1[4];
      if (!v12)
        return 0;
      v13 = (unint64_t)(a1 + 8);
      v14 = (unint64_t)a1 + v10 + 32;
      while (v13 <= v14)
      {
        v13 += *(unsigned int *)(v13 + 4);
        if (v13 > v14)
          break;
        v8 = 0;
        if (!--v12)
          return v8;
      }
      getLNLogCategoryMetadata();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      LOWORD(v15[0]) = 0;
      v11 = "load command extends past declared end of commands.";
    }
    else
    {
      getLNLogCategoryMetadata();
      v3 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        v8 = 88;
        goto LABEL_9;
      }
      LOWORD(v15[0]) = 0;
      v11 = "load commands extend past end of slice.";
    }
    _os_log_impl(&dword_19A9C7000, v3, OS_LOG_TYPE_ERROR, v11, (uint8_t *)v15, 2u);
    goto LABEL_23;
  }
  getLNLogCategoryMetadata();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v7 = *a1;
    v15[0] = 67109120;
    v15[1] = v7;
    v4 = "unsupported file magic %08x in package resolution";
    v5 = v3;
    v6 = 8;
    goto LABEL_7;
  }
LABEL_8:
  v8 = 45;
LABEL_9:

  return v8;
}

void __mh_symlibnames_block_invoke(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a1[5];
  if (v5)
  {
    v10 = 0;
    v11 = a1[6];
    while (1)
    {
      if (!*(_QWORD *)(v11 + 8 * v10))
      {
        v12 = strlen(*(const char **)(a1[7] + 8 * v10));
        if (!strncmp(*(const char **)(a1[7] + 8 * v10), a2, v12))
          break;
      }
      if (v5 == ++v10)
        return;
    }
    getLNLogCategoryMetadata();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a1[7] + 8 * v10);
      v17 = 136315650;
      v18 = v14;
      v19 = 2080;
      v20 = a2;
      v21 = 2080;
      v22 = a3;
      _os_log_impl(&dword_19A9C7000, v13, OS_LOG_TYPE_DEBUG, "%s -> %s from %s", (uint8_t *)&v17, 0x20u);
    }

    *(_QWORD *)(a1[6] + 8 * v10) = a3;
    v15 = *(_QWORD *)(a1[4] + 8);
    v16 = *(_QWORD *)(v15 + 24) + 1;
    *(_QWORD *)(v15 + 24) = v16;
    if (v16 == a1[5])
      *a5 = 1;
  }
}

uint64_t mh_cmdstr(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int *v3;
  uint64_t result;
  uint8_t v5[16];

  v1 = *(unsigned int *)(a1 + 8);
  if (v1 <= *(_DWORD *)(a1 + 4))
    return a1 + v1;
  getLNLogCategoryMetadata();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A9C7000, v2, OS_LOG_TYPE_ERROR, "load command string extends past end of load command.", v5, 2u);
  }

  v3 = __error();
  result = 0;
  *v3 = 88;
  return result;
}

id strlist_to_array(uint64_t *a1, uint64_t a2)
{
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = a2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = 8 * a2;
    do
    {
      v7 = *a1++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      v6 -= 8;
    }
    while (v6);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id LNLinkedFrameworksAtPath(void *a1)
{
  id v1;
  id v2;
  const char *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6391;
  v11 = __Block_byref_object_dispose__6392;
  v12 = (id)MEMORY[0x1E0C9AA60];
  v2 = objc_retainAutorelease(v1);
  v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __LNLinkedFrameworksAtPath_block_invoke;
  v6[3] = &unk_1E39A1B98;
  v6[4] = &v7;
  macho_good_enough_slice(v3, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_19AB7B6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_19AB822C0()
{
  return MEMORY[0x1E0CADDC0]();
}

uint64_t sub_19AB822CC()
{
  return MEMORY[0x1E0CADE20]();
}

uint64_t sub_19AB822D8()
{
  return MEMORY[0x1E0CADE38]();
}

uint64_t sub_19AB822E4()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_19AB822F0()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_19AB822FC()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_19AB82308()
{
  return MEMORY[0x1E0CAE0D0]();
}

uint64_t sub_19AB82314()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_19AB82320()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_19AB8232C()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_19AB82338()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_19AB82344()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_19AB82350()
{
  return MEMORY[0x1E0CAE240]();
}

uint64_t sub_19AB8235C()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_19AB82368()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_19AB82374()
{
  return MEMORY[0x1E0CAE328]();
}

uint64_t sub_19AB82380()
{
  return MEMORY[0x1E0CAE6E0]();
}

uint64_t sub_19AB8238C()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_19AB82398()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_19AB823A4()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_19AB823B0()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_19AB823BC()
{
  return MEMORY[0x1E0CAF3C0]();
}

uint64_t sub_19AB823C8()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_19AB823D4()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_19AB823E0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_19AB823EC()
{
  return MEMORY[0x1E0CAF9A0]();
}

uint64_t sub_19AB823F8()
{
  return MEMORY[0x1E0CAF9A8]();
}

uint64_t sub_19AB82404()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_19AB82410()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_19AB8241C()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_19AB82428()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_19AB82434()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t sub_19AB82440()
{
  return MEMORY[0x1E0CAFDC0]();
}

uint64_t sub_19AB8244C()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_19AB82458()
{
  return MEMORY[0x1E0CAFDF8]();
}

uint64_t sub_19AB82464()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_19AB82470()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_19AB8247C()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_19AB82488()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_19AB82494()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_19AB824A0()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_19AB824AC()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_19AB824B8()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_19AB824C4()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_19AB824D0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_19AB824DC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_19AB824E8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_19AB824F4()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_19AB82500()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_19AB8250C()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_19AB82518()
{
  return MEMORY[0x1E0DF1EB8]();
}

uint64_t sub_19AB82524()
{
  return MEMORY[0x1E0DF1F20]();
}

uint64_t sub_19AB82530()
{
  return MEMORY[0x1E0DF0190]();
}

uint64_t sub_19AB8253C()
{
  return MEMORY[0x1E0DF0258]();
}

uint64_t sub_19AB82548()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_19AB82554()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_19AB82560()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_19AB8256C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_19AB82578()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_19AB82584()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_19AB82590()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_19AB8259C()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_19AB825A8()
{
  return MEMORY[0x1E0DEA0F0]();
}

uint64_t sub_19AB825B4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_19AB825C0()
{
  return MEMORY[0x1E0DF1FA8]();
}

uint64_t sub_19AB825CC()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_19AB825D8()
{
  return MEMORY[0x1E0CB1898]();
}

uint64_t sub_19AB825E4()
{
  return MEMORY[0x1E0CB18A8]();
}

uint64_t sub_19AB825F0()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_19AB825FC()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_19AB82608()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_19AB82614()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_19AB82620()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_19AB8262C()
{
  return MEMORY[0x1E0CB1918]();
}

uint64_t sub_19AB82638()
{
  return MEMORY[0x1E0CB1928]();
}

uint64_t sub_19AB82644()
{
  return MEMORY[0x1E0CB1930]();
}

uint64_t sub_19AB82650()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_19AB8265C()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_19AB82668()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_19AB82674()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_19AB82680()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_19AB8268C()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_19AB82698()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_19AB826A4()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_19AB826B0()
{
  return MEMORY[0x1E0CB1A48]();
}

uint64_t sub_19AB826BC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_19AB826C8()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_19AB826D4()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_19AB826E0()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_19AB826EC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_19AB826F8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_19AB82704()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_19AB82710()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_19AB8271C()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_19AB82728()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_19AB82734()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_19AB82740()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_19AB8274C()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_19AB82758()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_19AB82764()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_19AB82770()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_19AB8277C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_19AB82788()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_19AB82794()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_19AB827A0()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_19AB827AC()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_19AB827B8()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_19AB827C4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_19AB827D0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_19AB827DC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_19AB827E8()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_19AB827F4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_19AB82800()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_19AB8280C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_19AB82818()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_19AB82824()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_19AB82830()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_19AB8283C()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_19AB82848()
{
  return MEMORY[0x1E0DEAEA8]();
}

uint64_t sub_19AB82854()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_19AB82860()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_19AB8286C()
{
  return MEMORY[0x1E0CB1D18]();
}

uint64_t sub_19AB82878()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_19AB82884()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_19AB82890()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_19AB8289C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_19AB828A8()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_19AB828B4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_19AB828C0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_19AB828CC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_19AB828D8()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_19AB828E4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_19AB828F0()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_19AB828FC()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_19AB82908()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_19AB82914()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_19AB82920()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_19AB8292C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_19AB82938()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_19AB82944()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_19AB82950()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_19AB8295C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_19AB82968()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_19AB82974()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_19AB82980()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_19AB8298C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_19AB82998()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_19AB829A4()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_19AB829B0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_19AB829BC()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_19AB829C8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_19AB829D4()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_19AB829E0()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_19AB829EC()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_19AB829F8()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_19AB82A04()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_19AB82A10()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_19AB82A1C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_19AB82A28()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_19AB82A34()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_19AB82A40()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_19AB82A4C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_19AB82A58()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_19AB82A64()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_19AB82A70()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_19AB82A7C()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_19AB82A88()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_19AB82A94()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_19AB82AA0()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_19AB82AAC()
{
  return MEMORY[0x1E0DECF80]();
}

uint64_t sub_19AB82AB8()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_19AB82AC4()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_19AB82AD0()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_19AB82ADC()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_19AB82AE8()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_19AB82AF4()
{
  return MEMORY[0x1E0DECFE8]();
}

uint64_t sub_19AB82B00()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_19AB82B0C()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_19AB82B18()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_19AB82B24()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_19AB82B30()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_19AB82B3C()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_19AB82B48()
{
  return MEMORY[0x1E0DED0B8]();
}

uint64_t sub_19AB82B54()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_19AB82B60()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_19AB82B6C()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_19AB82B78()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_19AB82B84()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_19AB82B90()
{
  return MEMORY[0x1E0DED118]();
}

uint64_t sub_19AB82B9C()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_19AB82BA8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_19AB82BB4()
{
  return MEMORY[0x1E0DED258]();
}

uint64_t sub_19AB82BC0()
{
  return MEMORY[0x1E0DED290]();
}

uint64_t sub_19AB82BCC()
{
  return MEMORY[0x1E0DED2B8]();
}

uint64_t sub_19AB82BD8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_19AB82BE4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_19AB82BF0()
{
  return MEMORY[0x1E0DED7C0]();
}

uint64_t sub_19AB82BFC()
{
  return MEMORY[0x1E0DED8C0]();
}

uint64_t sub_19AB82C08()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_19AB82C14()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_19AB82C20()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_19AB82C2C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_19AB82C38()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_19AB82C44()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_19AB82C50()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_19AB82C5C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_19AB82C68()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_19AB82C74()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_19AB82C80()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_19AB82C8C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_19AB82C98()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_19AB82CA4()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_19AB82CB0()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_19AB82CBC()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_19AB82CC8()
{
  return MEMORY[0x1E0DEE220]();
}

uint64_t sub_19AB82CD4()
{
  return MEMORY[0x1E0DEE228]();
}

uint64_t sub_19AB82CE0()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_19AB82CEC()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_19AB82CF8()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_19AB82D04()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_19AB82D10()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1E0D01620]();
}

uint64_t INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler()
{
  return MEMORY[0x1E0CBD428]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t macho_for_each_imported_symbol()
{
  return MEMORY[0x1E0C83E50]();
}

int macho_for_each_slice(const char *path, void *callback)
{
  return MEMORY[0x1E0C83E58](path, callback);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1E0DEEB48]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1E0DEEB70]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1E0DEED00]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

