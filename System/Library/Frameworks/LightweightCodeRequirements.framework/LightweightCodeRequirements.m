uint64_t sub_233A96A98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  _BYTE v12[40];
  __int128 v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v14 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_233AA2914(0, v3, 0);
    v7 = a2 + 32;
    v4 = v14;
    do
    {
      sub_233AA71E0(v7, (uint64_t)v12);
      sub_233AA71E0((uint64_t)v12, (uint64_t)&v11);
      __swift_instantiateConcreteTypeFromMangledName(a3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
      swift_dynamicCast();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_233AA2914(0, *(_QWORD *)(v4 + 16) + 1, 1);
        v4 = v14;
      }
      v9 = *(_QWORD *)(v4 + 16);
      v8 = *(_QWORD *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_233AA2914((_QWORD *)(v8 > 1), v9 + 1, 1);
        v4 = v14;
      }
      *(_QWORD *)(v4 + 16) = v9 + 1;
      sub_233AA4660(&v13, v4 + 40 * v9 + 32);
      v7 += 40;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  return v4;
}

_QWORD *sub_233A96BF8(void (*a1)(uint64_t *__return_ptr, uint64_t *, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  if (a3 >> 62)
    goto LABEL_18;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    if (!v6)
      return (_QWORD *)v7;
    v18 = MEMORY[0x24BEE4AF8];
    result = sub_233AA2940(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
      break;
    v9 = 0;
    v7 = v18;
    while (v6 != v9)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v10 = MEMORY[0x23493B0B8](v9, a3);
      }
      else
      {
        v10 = *(_QWORD *)(a3 + 8 * v9 + 32);
        swift_retain();
      }
      v16 = v10;
      a1(&v17, &v16, &v15);
      if (v4)
      {
        swift_release();
        swift_release();
        return (_QWORD *)v7;
      }
      v4 = 0;
      swift_release();
      v11 = v17;
      v18 = v7;
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_233AA2940((_QWORD *)(v12 > 1), v13 + 1, 1);
        v7 = v18;
      }
      ++v9;
      *(_QWORD *)(v7 + 16) = v13 + 1;
      *(_QWORD *)(v7 + 8 * v13 + 32) = v11;
      if (v6 == v9)
        return (_QWORD *)v7;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v6 = sub_233AC36BC();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_233A96D90(void (*a1)(uint64_t *__return_ptr, __int16 *, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  __int16 *i;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_233AA2940(0, v5, 0);
    v6 = v19;
    for (i = (__int16 *)(a3 + 32); ; i += 8)
    {
      v10 = *((_QWORD *)i + 1);
      v16 = *i;
      v17 = v10;
      swift_bridgeObjectRetain();
      a1(&v18, &v16, &v15);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease();
      v11 = v18;
      v19 = v6;
      v13 = *(_QWORD *)(v6 + 16);
      v12 = *(_QWORD *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_233AA2940((_QWORD *)(v12 > 1), v13 + 1, 1);
        v6 = v19;
      }
      *(_QWORD *)(v6 + 16) = v13 + 1;
      *(_QWORD *)(v6 + 8 * v13 + 32) = v11;
      if (!--v5)
        return v6;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v6;
}

_QWORD *sub_233A96EC0(char *a1, char **a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];

  v10 = (_QWORD *)a4;
  sub_233AA71E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    v14 = swift_retain();
    MEMORY[0x23493B040](v14);
    if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_233AC3644();
    sub_233AC3650();
    sub_233AC362C();
    return (_QWORD *)swift_release();
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = sub_233A96A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_2560FE180);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        v18 = v16 + 32;
        while (1)
        {
          sub_233AA71E0(v18, (uint64_t)v28);
          sub_233A96EC0(a1, a2, a3, v28, a5, a6);
          if (v6)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17)
            goto LABEL_26;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_bridgeObjectRelease();
    }
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (v7 = *((_QWORD *)&v26 + 1)) == 0)
  {
    v20 = v10[3];
    v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6)
      return result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(_QWORD *)a1;
      *(_QWORD *)a1 = 0x8000000000000000;
      sub_233AA2D18((uint64_t)a2, (uint64_t)sub_233AA2CD8, 0, isUniquelyReferenced_nonNull_native, v28);
      *(_QWORD *)a1 = v28[0];
      return (_QWORD *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  v19 = sub_233A96A98(v26, *((uint64_t *)&v26 + 1), &qword_2560FE180);
  if (*(_QWORD *)(v19 + 16) == 1)
  {
    sub_233AA71E0(v19 + 32, (uint64_t)&v26);
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_233AA4660(&v26, (uint64_t)v28);
    sub_233A96EC0(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_30:
    a1 = sub_233ABC1AC(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
  v24 = *((_QWORD *)a1 + 2);
  v23 = *((_QWORD *)a1 + 3);
  if (v24 >= v23 >> 1)
    a1 = sub_233ABC1AC((char *)(v23 > 1), v24 + 1, 1, a1);
  *((_QWORD *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((_QWORD *)v25 + 5) = v7;
  result = (_QWORD *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

_QWORD *sub_233A972AC(char *a1, char **a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];

  v10 = (_QWORD *)a4;
  sub_233AA71E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    v14 = swift_retain();
    MEMORY[0x23493B040](v14);
    if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_233AC3644();
    sub_233AC3650();
    sub_233AC362C();
    return (_QWORD *)swift_release();
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = sub_233A96A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_2560FE180);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        v18 = v16 + 32;
        while (1)
        {
          sub_233AA71E0(v18, (uint64_t)v28);
          sub_233A972AC(a1, a2, a3, v28, a5, a6);
          if (v6)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17)
            goto LABEL_26;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_bridgeObjectRelease();
    }
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (v7 = *((_QWORD *)&v26 + 1)) == 0)
  {
    v20 = v10[3];
    v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6)
      return result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(_QWORD *)a1;
      *(_QWORD *)a1 = 0x8000000000000000;
      sub_233AA2D18((uint64_t)a2, (uint64_t)sub_233AA2CD8, 0, isUniquelyReferenced_nonNull_native, v28);
      *(_QWORD *)a1 = v28[0];
      return (_QWORD *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  v19 = sub_233A96A98(v26, *((uint64_t *)&v26 + 1), &qword_2560FE180);
  if (*(_QWORD *)(v19 + 16) == 1)
  {
    sub_233AA71E0(v19 + 32, (uint64_t)&v26);
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_233AA4660(&v26, (uint64_t)v28);
    sub_233A972AC(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_30:
    a1 = sub_233ABC198(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
  v24 = *((_QWORD *)a1 + 2);
  v23 = *((_QWORD *)a1 + 3);
  if (v24 >= v23 >> 1)
    a1 = sub_233ABC198((char *)(v23 > 1), v24 + 1, 1, a1);
  *((_QWORD *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((_QWORD *)v25 + 5) = v7;
  result = (_QWORD *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

_QWORD *sub_233A97698(char *a1, char **a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];

  v10 = (_QWORD *)a4;
  sub_233AA71E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    v14 = swift_retain();
    MEMORY[0x23493B040](v14);
    if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_233AC3644();
    sub_233AC3650();
    sub_233AC362C();
    return (_QWORD *)swift_release();
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = sub_233A96A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_2560FE198);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        v18 = v16 + 32;
        while (1)
        {
          sub_233AA71E0(v18, (uint64_t)v28);
          sub_233A97698(a1, a2, a3, v28, a5, a6);
          if (v6)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17)
            goto LABEL_26;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_bridgeObjectRelease();
    }
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (v7 = *((_QWORD *)&v26 + 1)) == 0)
  {
    v20 = v10[3];
    v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6)
      return result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(_QWORD *)a1;
      *(_QWORD *)a1 = 0x8000000000000000;
      sub_233AA2D18((uint64_t)a2, (uint64_t)sub_233AA2CD8, 0, isUniquelyReferenced_nonNull_native, v28);
      *(_QWORD *)a1 = v28[0];
      return (_QWORD *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  v19 = sub_233A96A98(v26, *((uint64_t *)&v26 + 1), &qword_2560FE198);
  if (*(_QWORD *)(v19 + 16) == 1)
  {
    sub_233AA71E0(v19 + 32, (uint64_t)&v26);
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_233AA4660(&v26, (uint64_t)v28);
    sub_233A97698(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_30:
    a1 = sub_233ABC1D4(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
  v24 = *((_QWORD *)a1 + 2);
  v23 = *((_QWORD *)a1 + 3);
  if (v24 >= v23 >> 1)
    a1 = sub_233ABC1D4((char *)(v23 > 1), v24 + 1, 1, a1);
  *((_QWORD *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((_QWORD *)v25 + 5) = v7;
  result = (_QWORD *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

_QWORD *sub_233A97A84(char *a1, char **a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];

  v10 = (_QWORD *)a4;
  sub_233AA71E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    v14 = swift_retain();
    MEMORY[0x23493B040](v14);
    if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_233AC3644();
    sub_233AC3650();
    sub_233AC362C();
    return (_QWORD *)swift_release();
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = sub_233A96A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_2560FE198);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        v18 = v16 + 32;
        while (1)
        {
          sub_233AA71E0(v18, (uint64_t)v28);
          sub_233A97A84(a1, a2, a3, v28, a5, a6);
          if (v6)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17)
            goto LABEL_26;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_bridgeObjectRelease();
    }
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (v7 = *((_QWORD *)&v26 + 1)) == 0)
  {
    v20 = v10[3];
    v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6)
      return result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(_QWORD *)a1;
      *(_QWORD *)a1 = 0x8000000000000000;
      sub_233AA2D18((uint64_t)a2, (uint64_t)sub_233AA2CD8, 0, isUniquelyReferenced_nonNull_native, v28);
      *(_QWORD *)a1 = v28[0];
      return (_QWORD *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  v19 = sub_233A96A98(v26, *((uint64_t *)&v26 + 1), &qword_2560FE198);
  if (*(_QWORD *)(v19 + 16) == 1)
  {
    sub_233AA71E0(v19 + 32, (uint64_t)&v26);
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_233AA4660(&v26, (uint64_t)v28);
    sub_233A97A84(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_30:
    a1 = sub_233ABC1C0(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
  v24 = *((_QWORD *)a1 + 2);
  v23 = *((_QWORD *)a1 + 3);
  if (v24 >= v23 >> 1)
    a1 = sub_233ABC1C0((char *)(v23 > 1), v24 + 1, 1, a1);
  *((_QWORD *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((_QWORD *)v25 + 5) = v7;
  result = (_QWORD *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

_QWORD *sub_233A97E70(char *a1, char **a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];

  v10 = (_QWORD *)a4;
  sub_233AA71E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    v14 = swift_retain();
    MEMORY[0x23493B040](v14);
    if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_233AC3644();
    sub_233AC3650();
    sub_233AC362C();
    return (_QWORD *)swift_release();
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = sub_233A96A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_2560FE190);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        v18 = v16 + 32;
        while (1)
        {
          sub_233AA71E0(v18, (uint64_t)v28);
          sub_233A97E70(a1, a2, a3, v28, a5, a6);
          if (v6)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17)
            goto LABEL_26;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_bridgeObjectRelease();
    }
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (v7 = *((_QWORD *)&v26 + 1)) == 0)
  {
    v20 = v10[3];
    v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6)
      return result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(_QWORD *)a1;
      *(_QWORD *)a1 = 0x8000000000000000;
      sub_233AA2D18((uint64_t)a2, (uint64_t)sub_233AA2CD8, 0, isUniquelyReferenced_nonNull_native, v28);
      *(_QWORD *)a1 = v28[0];
      return (_QWORD *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  v19 = sub_233A96A98(v26, *((uint64_t *)&v26 + 1), &qword_2560FE190);
  if (*(_QWORD *)(v19 + 16) == 1)
  {
    sub_233AA71E0(v19 + 32, (uint64_t)&v26);
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_233AA4660(&v26, (uint64_t)v28);
    sub_233A97E70(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_30:
    a1 = sub_233ABC1FC(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
  v24 = *((_QWORD *)a1 + 2);
  v23 = *((_QWORD *)a1 + 3);
  if (v24 >= v23 >> 1)
    a1 = sub_233ABC1FC((char *)(v23 > 1), v24 + 1, 1, a1);
  *((_QWORD *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((_QWORD *)v25 + 5) = v7;
  result = (_QWORD *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

_QWORD *sub_233A9825C(char *a1, char **a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[7];

  v10 = (_QWORD *)a4;
  sub_233AA71E0(a4, (uint64_t)v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE178);
  type metadata accessor for EntitlementsQuery();
  if (swift_dynamicCast())
  {
    v14 = swift_retain();
    MEMORY[0x23493B040](v14);
    if (*(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_233AC3644();
    sub_233AC3650();
    sub_233AC362C();
    return (_QWORD *)swift_release();
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = *((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v16 = sub_233A96A98((unsigned __int16)v26, *((uint64_t *)&v26 + 1), &qword_2560FE190);
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v28[6] = v16;
        v18 = v16 + 32;
        while (1)
        {
          sub_233AA71E0(v18, (uint64_t)v28);
          sub_233A9825C(a1, a2, a3, v28, a5, a6);
          if (v6)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          v18 += 40;
          if (!--v17)
            goto LABEL_26;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      return (_QWORD *)swift_bridgeObjectRelease();
    }
  }
  sub_233AA71E0((uint64_t)v10, (uint64_t)v28);
  if ((swift_dynamicCast() & 1) == 0 || (v7 = *((_QWORD *)&v26 + 1)) == 0)
  {
    v20 = v10[3];
    v21 = v10[4];
    __swift_project_boxed_opaque_existential_1(v10, v20);
    result = (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v21 + 32))(v28, v20, v21);
    if (v6)
      return result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    swift_dynamicCast();
    a2 = (char **)v26;
    if (*(_QWORD *)(v26 + 16) == 1)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28[0] = *(_QWORD *)a1;
      *(_QWORD *)a1 = 0x8000000000000000;
      sub_233AA2D18((uint64_t)a2, (uint64_t)sub_233AA2CD8, 0, isUniquelyReferenced_nonNull_native, v28);
      *(_QWORD *)a1 = v28[0];
      return (_QWORD *)swift_bridgeObjectRelease();
    }
    __break(1u);
    goto LABEL_30;
  }
  LOWORD(v10) = v26;
  v19 = sub_233A96A98(v26, *((uint64_t *)&v26 + 1), &qword_2560FE190);
  if (*(_QWORD *)(v19 + 16) == 1)
  {
    sub_233AA71E0(v19 + 32, (uint64_t)&v26);
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (!v27)
    {
      __break(1u);
      return result;
    }
    sub_233AA4660(&v26, (uint64_t)v28);
    sub_233A9825C(a1, a2, a3, v28, a5, a6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    return (_QWORD *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  a1 = *a2;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_30:
    a1 = sub_233ABC1E8(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
  v24 = *((_QWORD *)a1 + 2);
  v23 = *((_QWORD *)a1 + 3);
  if (v24 >= v23 >> 1)
    a1 = sub_233ABC1E8((char *)(v23 > 1), v24 + 1, 1, a1);
  *((_QWORD *)a1 + 2) = v24 + 1;
  v25 = &a1[16 * v24];
  *((_WORD *)v25 + 16) = (_WORD)v10;
  *((_QWORD *)v25 + 5) = v7;
  result = (_QWORD *)swift_bridgeObjectRelease();
  *a2 = a1;
  return result;
}

uint64_t sub_233A98648@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_233A99290(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_233A96EC0, (uint64_t)sub_233AA7164, &qword_2560FE180, (void (*)(_QWORD *__return_ptr))sub_233A98698, (uint64_t)sub_233AA71C4, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA71C4);
}

uint64_t sub_233A98698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  int64_t v62;
  unint64_t v63;
  int64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  _BOOL8 v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  uint64_t *v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE v82[16];
  unint64_t *v83;
  int64_t v84;
  uint64_t v85;
  int64_t v86;
  _BYTE *v87;
  uint64_t v88;
  __int128 v89;
  int64_t v90;
  _QWORD *v91;
  __int128 v92;
  _BYTE v93[32];
  uint64_t v94;
  unint64_t v95;
  _QWORD *v96;
  _QWORD v97[5];
  char *v98;
  char *v99;
  unint64_t v100;
  __int16 v101;
  _QWORD *v102;
  _QWORD *v103;

  v5 = a3;
  v6 = a2;
  v103 = a4;
  v101 = a2;
  LODWORD(v8) = a2 >> 8;
  v102 = a3;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v10 = sub_233A99D78(MEMORY[0x24BEE4AF8]);
  v99 = v9;
  v100 = v10;
  v98 = v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_233A972AC((char *)&v100, &v99, &v98, v12, v6, (uint64_t)v5);
      if (v4)
        break;
      v12 += 40;
      if (!--v11)
      {
        v10 = swift_bridgeObjectRelease();
        v13 = (unint64_t)v98;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v13 = (unint64_t)v9;
LABEL_7:
  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v80 = sub_233AC36BC();
    v10 = swift_bridgeObjectRelease();
    if (v80 > 1)
    {
LABEL_9:
      MEMORY[0x24BDAC7A8](v10);
      v83 = (unint64_t *)&v101;
      v5 = sub_233A96BF8((void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))sub_233AA7164, (uint64_t)v82, v13);
      swift_bridgeObjectRelease();
      if (v4)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      *(_QWORD *)&v92 = v5;
      v26 = v100;
      if (!*(_QWORD *)(v100 + 16))
      {
        isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_233AC3C30;
      v27 = sub_233AC1BB4(HIBYTE(v101));
      *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v6 + 64) = &off_2504D5278;
      *(_QWORD *)(v6 + 32) = v27;
      *(_QWORD *)(v6 + 40) = v28;
      *(_QWORD *)(v6 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
      *(_QWORD *)(v6 + 104) = &off_2504D5320;
      *(_QWORD *)(v6 + 72) = v26;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_22:
        v31 = v5[2];
        v30 = v5[3];
        if (v31 >= v30 >> 1)
        {
          isUniquelyReferenced_nonNull_native = (uint64_t)sub_233ABC184((_QWORD *)(v30 > 1), v31 + 1, 1, v5);
          v5 = (_QWORD *)isUniquelyReferenced_nonNull_native;
        }
        v5[2] = v31 + 1;
        v5[v31 + 4] = v6;
        *(_QWORD *)&v92 = v5;
LABEL_36:
        v43 = v99;
        LOWORD(v95) = v101;
        v96 = v102;
        MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
        v83 = &v95;
        v44 = sub_233A96D90((void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA7148, (uint64_t)v82, (uint64_t)v43);
        if (!v4)
        {
          v45 = (_QWORD *)v44;
          swift_bridgeObjectRelease();
          v46 = v45;
LABEL_43:
          sub_233A9A47C(v46);
          v49 = v92;
          result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE100);
          v50 = v103;
          v103[3] = result;
          v50[4] = &off_2504D5328;
          *v50 = v49;
          return result;
        }
LABEL_40:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
LABEL_93:
      isUniquelyReferenced_nonNull_native = (uint64_t)sub_233ABC184(0, v5[2] + 1, 1, v5);
      v5 = (_QWORD *)isUniquelyReferenced_nonNull_native;
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    v81 = sub_233AC36BC();
    swift_bridgeObjectRelease();
    if (v81 != 1)
      goto LABEL_26;
    swift_bridgeObjectRetain();
    if (!sub_233AC36BC())
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
      goto LABEL_90;
    }
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14 > 1)
      goto LABEL_9;
    if (v14 != 1)
      goto LABEL_26;
    swift_bridgeObjectRetain();
  }
  LODWORD(v90) = v8;
  if ((v13 & 0xC000000000000001) != 0)
  {
LABEL_90:
    v16 = MEMORY[0x23493B0B8](0, v13);
    goto LABEL_16;
  }
  if (!*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v16 = *(_QWORD *)(v13 + 32);
  swift_retain();
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE130);
  inited = swift_initStackObject();
  v89 = xmmword_233AC3C20;
  *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
  *(_QWORD *)(inited + 32) = sub_233AC1BB4(*(_BYTE *)(v16 + 16));
  *(_QWORD *)(inited + 40) = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE138);
  v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = v89;
  *(_QWORD *)(v19 + 32) = sub_233AC1BB4(*(_BYTE *)(v16 + 17));
  *(_QWORD *)(v19 + 40) = v20;
  *(_QWORD *)(v19 + 48) = *(_QWORD *)(v16 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_233A9A368(v19, &qword_2560FE170);
  v21 = sub_233A9A368(inited, &qword_2560FE168);
  v97[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE140);
  v97[2] = &off_2504D5320;
  v95 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  swift_dynamicCast();
  v22 = v92;
  v23 = *(_QWORD *)(v92 + 16);
  swift_release();
  if (v23 != 1)
  {
    __break(1u);
    goto LABEL_92;
  }
  v24 = v100;
  v25 = swift_isUniquelyReferenced_nonNull_native();
  v95 = v24;
  sub_233AA2D18(v22, (uint64_t)sub_233AA2CD8, 0, v25, &v95);
  LODWORD(v8) = v90;
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_34:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v100 = v95;
  swift_bridgeObjectRelease();
LABEL_26:
  v32 = v99;
  v33 = *((_QWORD *)v99 + 2);
  if (v33 > 1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v92 = v9;
    v34 = v100;
    if (*(_QWORD *)(v100 + 16))
    {
      LODWORD(v90) = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
      v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_233AC3C30;
      v36 = sub_233AC1BB4(BYTE1(v6));
      *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v35 + 64) = &off_2504D5278;
      *(_QWORD *)(v35 + 32) = v36;
      *(_QWORD *)(v35 + 40) = v37;
      *(_QWORD *)(v35 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
      *(_QWORD *)(v35 + 104) = &off_2504D5320;
      *(_QWORD *)(v35 + 72) = v34;
      v38 = sub_233ABC184(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v39 = v38;
      v8 = v38[2];
      v40 = v38[3];
      if (v8 >= v40 >> 1)
      {
        v38 = sub_233ABC184((_QWORD *)(v40 > 1), v8 + 1, 1, v38);
        v39 = v38;
      }
      v39[2] = v8 + 1;
      v39[v8 + 4] = v35;
      *(_QWORD *)&v92 = v39;
      LOBYTE(v8) = v90;
    }
    else
    {
      v38 = (_QWORD *)swift_bridgeObjectRelease();
    }
    LOBYTE(v95) = v6;
    BYTE1(v95) = v8;
    v96 = v5;
    MEMORY[0x24BDAC7A8](v38);
    v83 = &v95;
    v47 = sub_233A96D90((void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA7148, (uint64_t)v82, (uint64_t)v32);
    if (!v4)
    {
      v48 = (_QWORD *)v47;
      swift_bridgeObjectRelease();
      v46 = v48;
      goto LABEL_43;
    }
    goto LABEL_40;
  }
  if (v33 == 1)
  {
    v41 = *((_QWORD *)v99 + 5);
    v42 = *((unsigned __int16 *)v99 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_233A9A5BC(v42, v41, &qword_2560FE180, (void (*)(_QWORD *__return_ptr))sub_233A98648, &v95);
    if (v4)
      goto LABEL_34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    v13 = (unint64_t)&v92;
    v9 = (char *)&v95;
    swift_dynamicCast();
    v51 = v92;
    v52 = *(_QWORD *)(v92 + 16);
    swift_bridgeObjectRelease();
    if (v52 != 1)
    {
LABEL_95:
      __break(1u);
LABEL_96:
      result = sub_233AC3854();
      __break(1u);
      return result;
    }
    v90 = 0;
    v88 = v51;
    v53 = *(_QWORD *)(v51 + 64);
    v85 = v51 + 64;
    v54 = 1 << *(_BYTE *)(v51 + 32);
    v55 = -1;
    if (v54 < 64)
      v55 = ~(-1 << v54);
    v6 = v55 & v53;
    v5 = (_QWORD *)v100;
    v86 = (unint64_t)(v54 + 63) >> 6;
    v87 = v93;
    *(_QWORD *)&v89 = v97;
    v84 = v86 - 1;
    while (!v6)
    {
      v62 = v90 + 1;
      if (__OFADD__(v90, 1))
        goto LABEL_89;
      if (v62 < v86)
      {
        v63 = *(_QWORD *)(v85 + 8 * v62);
        if (v63)
          goto LABEL_56;
        v64 = v90 + 2;
        ++v90;
        if (v62 + 1 < v86)
        {
          v63 = *(_QWORD *)(v85 + 8 * v64);
          if (v63)
          {
            ++v62;
            goto LABEL_56;
          }
          v65 = v62 + 2;
          v90 = v62 + 1;
          if (v62 + 2 < v86)
          {
            v63 = *(_QWORD *)(v85 + 8 * v65);
            if (!v63)
            {
              while (1)
              {
                v62 = v65 + 1;
                if (__OFADD__(v65, 1))
                  break;
                if (v62 >= v86)
                {
                  v90 = v84;
                  goto LABEL_68;
                }
                v63 = *(_QWORD *)(v85 + 8 * v62);
                ++v65;
                if (v63)
                  goto LABEL_56;
              }
              __break(1u);
              goto LABEL_95;
            }
            v62 += 2;
LABEL_56:
            v6 = (v63 - 1) & v63;
            v58 = __clz(__rbit64(v63)) + (v62 << 6);
            v90 = v62;
LABEL_52:
            v59 = *(_QWORD *)(v88 + 56);
            v60 = (_QWORD *)(*(_QWORD *)(v88 + 48) + 16 * v58);
            v61 = v60[1];
            *(_QWORD *)&v92 = *v60;
            *((_QWORD *)&v92 + 1) = v61;
            sub_233AA71E0(v59 + 40 * v58, (uint64_t)v87);
            swift_bridgeObjectRetain();
            goto LABEL_69;
          }
        }
      }
LABEL_68:
      v6 = 0;
      v94 = 0;
      memset(v93, 0, sizeof(v93));
      v92 = 0u;
LABEL_69:
      sub_233AA7100((uint64_t)&v92, (uint64_t)&v95);
      v66 = (uint64_t)v96;
      if (!v96)
      {
        swift_release();
        goto LABEL_82;
      }
      v67 = v95;
      sub_233AA4660((__int128 *)v89, (uint64_t)&v92);
      v13 = swift_isUniquelyReferenced_nonNull_native();
      v91 = v5;
      v69 = sub_233AA346C(v67, v66);
      v70 = v5[2];
      v71 = (v68 & 1) == 0;
      v72 = v70 + v71;
      if (__OFADD__(v70, v71))
        goto LABEL_87;
      v9 = v68;
      if (v5[3] >= v72)
      {
        if ((v13 & 1) != 0)
        {
          v5 = v91;
          if ((v68 & 1) != 0)
            goto LABEL_48;
        }
        else
        {
          sub_233AA34D0();
          v5 = v91;
          if ((v9 & 1) != 0)
            goto LABEL_48;
        }
      }
      else
      {
        sub_233AA3148(v72, v13);
        v73 = sub_233AA346C(v67, v66);
        if ((v9 & 1) != (v74 & 1))
          goto LABEL_96;
        v69 = v73;
        v5 = v91;
        if ((v9 & 1) != 0)
        {
LABEL_48:
          v56 = v5[7] + 40 * v69;
          __swift_destroy_boxed_opaque_existential_1(v56);
          sub_233AA4660(&v92, v56);
          goto LABEL_49;
        }
      }
      v5[(v69 >> 6) + 8] |= 1 << v69;
      v75 = (uint64_t *)(v5[6] + 16 * v69);
      *v75 = v67;
      v75[1] = v66;
      sub_233AA4660(&v92, v5[7] + 40 * v69);
      v76 = v5[2];
      v77 = __OFADD__(v76, 1);
      v78 = v76 + 1;
      if (v77)
        goto LABEL_88;
      v5[2] = v78;
      swift_bridgeObjectRetain();
LABEL_49:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v57 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v58 = v57 | (v90 << 6);
    goto LABEL_52;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)v100;
LABEL_82:
  v79 = v103;
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  v79[3] = result;
  v79[4] = &off_2504D5320;
  *v79 = v5;
  return result;
}

uint64_t sub_233A99150@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_233A99290(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_233A97698, (uint64_t)sub_233AA7164, &qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A991A0, (uint64_t)sub_233AA7278, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA7278);
}

uint64_t sub_233A991A0@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_233A99290(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_233A97A84, (uint64_t)sub_233AA7164, &qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A99150, (uint64_t)sub_233AA725C, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA725C);
}

uint64_t sub_233A991F0@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_233A99290(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_233A97E70, (uint64_t)sub_233AA7164, &qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A99240, (uint64_t)sub_233AA7240, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA7240);
}

uint64_t sub_233A99240@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_233A99290(a1, a2, a3, (void (*)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t))sub_233A9825C, (uint64_t)sub_233AA7164, &qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A991F0, (uint64_t)sub_233AA7224, a4, (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))sub_233AA7224);
}

uint64_t sub_233A99290@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, unint64_t a3@<X2>, void (*a4)(unint64_t *, uint64_t *, unint64_t *, uint64_t, unint64_t *, unint64_t)@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, void (*a7)(_QWORD *__return_ptr)@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, void (*a10)(uint64_t *__return_ptr, __int16 *, uint64_t *))
{
  uint64_t v10;
  unint64_t v13;
  unint64_t *v14;
  void (*v16)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  unint64_t v17;
  void (*v18)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  void (*v55)(uint64_t *__return_ptr, __int16 *, uint64_t *);
  uint64_t v56;
  _QWORD *v57;
  _UNKNOWN **v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  _BOOL8 v77;
  uint64_t v78;
  char v79;
  unint64_t v80;
  char v81;
  uint64_t *v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  _BYTE v88[16];
  unint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  uint64_t *v93;
  void (*v94)(_QWORD *__return_ptr);
  __int128 *v95;
  uint64_t v96;
  _QWORD *v97;
  __int128 v98;
  _BYTE v99[32];
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  _QWORD v103[5];
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  __int16 v107;
  unint64_t v108;
  _QWORD *v109;

  v96 = a8;
  v93 = a6;
  v94 = a7;
  v13 = a3;
  v14 = a2;
  v109 = a9;
  v107 = (__int16)a2;
  LODWORD(v95) = a2 >> 8;
  v108 = a3;
  v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x24BEE4AF8];
  v17 = sub_233A99D78(MEMORY[0x24BEE4AF8]);
  v105 = (uint64_t)v16;
  v106 = v17;
  v104 = (unint64_t)v16;
  v18 = *(void (**)(uint64_t *__return_ptr, __int16 *, uint64_t *))(a1 + 16);
  if (v18)
  {
    v19 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      a4(&v106, &v105, &v104, v19, v14, v13);
      if (v10)
        break;
      v19 += 40;
      v18 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))((char *)v18 - 1);
      if (!v18)
      {
        v17 = swift_bridgeObjectRelease();
        v20 = v104;
        v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x24BEE4AF8];
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v20 = (unint64_t)v16;
LABEL_7:
  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = v16;
    v87 = sub_233AC36BC();
    v17 = swift_bridgeObjectRelease();
    if (v87 > 1)
    {
LABEL_9:
      MEMORY[0x24BDAC7A8](v17);
      v89 = (unint64_t *)&v107;
      a5 = (uint64_t)sub_233A96BF8((void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))a5, (uint64_t)v88, v20);
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      v18 = a10;
      *(_QWORD *)&v98 = a5;
      v31 = v106;
      if (!*(_QWORD *)(v106 + 16))
      {
        isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        goto LABEL_36;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_233AC3C30;
      v32 = sub_233AC1BB4(HIBYTE(v107));
      *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v13 + 64) = &off_2504D5278;
      *(_QWORD *)(v13 + 32) = v32;
      *(_QWORD *)(v13 + 40) = v33;
      *(_QWORD *)(v13 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
      *(_QWORD *)(v13 + 104) = &off_2504D5320;
      *(_QWORD *)(v13 + 72) = v31;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_22:
        v36 = *(_QWORD *)(a5 + 16);
        v35 = *(_QWORD *)(a5 + 24);
        if (v36 >= v35 >> 1)
        {
          isUniquelyReferenced_nonNull_native = (uint64_t)sub_233ABC184((_QWORD *)(v35 > 1), v36 + 1, 1, (_QWORD *)a5);
          a5 = isUniquelyReferenced_nonNull_native;
        }
        *(_QWORD *)(a5 + 16) = v36 + 1;
        *(_QWORD *)(a5 + 8 * v36 + 32) = v13;
        *(_QWORD *)&v98 = a5;
LABEL_36:
        v51 = v105;
        LOWORD(v101) = v107;
        v102 = v108;
        MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
        v89 = &v101;
        v52 = sub_233A96D90(v18, (uint64_t)v88, v51);
        if (!v10)
        {
          v53 = (_QWORD *)v52;
          swift_bridgeObjectRelease();
          v54 = v53;
LABEL_43:
          sub_233A9A47C(v54);
          v50 = (_QWORD *)v98;
          result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE100);
          v58 = &off_2504D5328;
LABEL_85:
          v86 = v109;
          v109[3] = result;
          v86[4] = v58;
          *v86 = v50;
          return result;
        }
LABEL_40:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
LABEL_96:
      isUniquelyReferenced_nonNull_native = (uint64_t)sub_233ABC184(0, *(_QWORD *)(a5 + 16) + 1, 1, (_QWORD *)a5);
      a5 = isUniquelyReferenced_nonNull_native;
      goto LABEL_22;
    }
    v16 = v18;
    swift_bridgeObjectRetain();
    a5 = sub_233AC36BC();
    swift_bridgeObjectRelease();
    if (a5 != 1)
      goto LABEL_26;
    swift_bridgeObjectRetain();
    if (!sub_233AC36BC())
    {
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
  }
  else
  {
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v21 > 1)
      goto LABEL_9;
    if (v21 != 1)
      goto LABEL_26;
    swift_bridgeObjectRetain();
  }
  if ((v20 & 0xC000000000000001) != 0)
  {
LABEL_93:
    a5 = MEMORY[0x23493B0B8](0, v20);
    goto LABEL_16;
  }
  if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  a5 = *(_QWORD *)(v20 + 32);
  swift_retain();
LABEL_16:
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE130);
  inited = swift_initStackObject();
  v92 = xmmword_233AC3C20;
  *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
  *(_QWORD *)(inited + 32) = sub_233AC1BB4(*(_BYTE *)(a5 + 16));
  *(_QWORD *)(inited + 40) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE138);
  v25 = swift_initStackObject();
  *(_OWORD *)(v25 + 16) = v92;
  *(_QWORD *)(v25 + 32) = sub_233AC1BB4(*(_BYTE *)(a5 + 17));
  *(_QWORD *)(v25 + 40) = v26;
  *(_QWORD *)(v25 + 48) = *(_QWORD *)(a5 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_233A9A368(v25, &qword_2560FE170);
  v27 = sub_233A9A368(inited, &qword_2560FE168);
  v103[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE140);
  v103[2] = &off_2504D5320;
  v101 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  swift_dynamicCast();
  v28 = v98;
  v18 = *(void (**)(uint64_t *__return_ptr, __int16 *, uint64_t *))(v98 + 16);
  swift_release();
  if (v18 != (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))1)
  {
    __break(1u);
    goto LABEL_95;
  }
  v29 = v106;
  v30 = swift_isUniquelyReferenced_nonNull_native();
  v101 = v29;
  sub_233AA2D18(v28, (uint64_t)sub_233AA2CD8, 0, v30, &v101);
  v16 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x24BEE4AF8];
  if (v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v106 = v101;
  swift_bridgeObjectRelease();
LABEL_26:
  v37 = v105;
  v38 = *(_QWORD *)(v105 + 16);
  if (v38 > 1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v98 = v16;
    v39 = v106;
    if (*(_QWORD *)(v106 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
      v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = xmmword_233AC3C30;
      v41 = sub_233AC1BB4(BYTE1(v14));
      *(_QWORD *)(v40 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v40 + 64) = &off_2504D5278;
      *(_QWORD *)(v40 + 32) = v41;
      *(_QWORD *)(v40 + 40) = v42;
      *(_QWORD *)(v40 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
      *(_QWORD *)(v40 + 104) = &off_2504D5320;
      *(_QWORD *)(v40 + 72) = v39;
      v43 = sub_233ABC184(0, 1, 1, MEMORY[0x24BEE4AF8]);
      v45 = v43[2];
      v44 = v43[3];
      if (v45 >= v44 >> 1)
        v43 = sub_233ABC184((_QWORD *)(v44 > 1), v45 + 1, 1, v43);
      v46 = v96;
      v47 = (char)v95;
      v43[2] = v45 + 1;
      v43[v45 + 4] = v40;
      *(_QWORD *)&v98 = v43;
    }
    else
    {
      swift_bridgeObjectRelease();
      v46 = v96;
      v47 = (char)v95;
    }
    LOBYTE(v101) = (_BYTE)v14;
    BYTE1(v101) = v47;
    v102 = v13;
    v55 = (void (*)(uint64_t *__return_ptr, __int16 *, uint64_t *))MEMORY[0x24BDAC7A8](v46);
    v89 = &v101;
    v56 = sub_233A96D90(v55, (uint64_t)v88, v37);
    if (!v10)
    {
      v57 = (_QWORD *)v56;
      swift_bridgeObjectRelease();
      v54 = v57;
      goto LABEL_43;
    }
    goto LABEL_40;
  }
  if (v38 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = (_QWORD *)v106;
LABEL_84:
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    v58 = &off_2504D5320;
    goto LABEL_85;
  }
  v48 = *(_QWORD *)(v105 + 40);
  v49 = *(unsigned __int16 *)(v105 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_233A9A5BC(v49, v48, v93, v94, &v101);
  if (v10)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  v14 = &v101;
  swift_dynamicCast();
  v59 = v98;
  v60 = *(_QWORD *)(v98 + 16);
  swift_bridgeObjectRelease();
  if (v60 == 1)
  {
    v94 = (void (*)(_QWORD *__return_ptr))v59;
    v61 = *(_QWORD *)(v59 + 64);
    v91 = v59 + 64;
    v62 = 1 << *(_BYTE *)(v59 + 32);
    v63 = -1;
    if (v62 < 64)
      v63 = ~(-1 << v62);
    v13 = v63 & v61;
    v50 = (_QWORD *)v106;
    v93 = (uint64_t *)v99;
    v95 = (__int128 *)v103;
    v96 = 0;
    *(_QWORD *)&v92 = (unint64_t)(v62 + 63) >> 6;
    v90 = v92 - 1;
    while (!v13)
    {
      v70 = v96 + 1;
      if (__OFADD__(v96, 1))
        goto LABEL_92;
      if (v70 < (uint64_t)v92)
      {
        v71 = *(_QWORD *)(v91 + 8 * v70);
        if (v71)
          goto LABEL_56;
        v72 = v96 + 2;
        ++v96;
        if (v70 + 1 < (uint64_t)v92)
        {
          v71 = *(_QWORD *)(v91 + 8 * v72);
          if (v71)
            goto LABEL_59;
          v96 = v70 + 1;
          if (v70 + 2 < (uint64_t)v92)
          {
            v71 = *(_QWORD *)(v91 + 8 * (v70 + 2));
            if (v71)
            {
              v70 += 2;
              goto LABEL_56;
            }
            v72 = v70 + 3;
            v96 = v70 + 2;
            if (v70 + 3 < (uint64_t)v92)
            {
              v71 = *(_QWORD *)(v91 + 8 * v72);
              if (!v71)
              {
                while (1)
                {
                  v70 = v72 + 1;
                  if (__OFADD__(v72, 1))
                    goto LABEL_98;
                  if (v70 >= (uint64_t)v92)
                  {
                    v96 = v90;
                    goto LABEL_70;
                  }
                  v71 = *(_QWORD *)(v91 + 8 * v70);
                  ++v72;
                  if (v71)
                    goto LABEL_56;
                }
              }
LABEL_59:
              v70 = v72;
LABEL_56:
              v13 = (v71 - 1) & v71;
              v66 = __clz(__rbit64(v71)) + (v70 << 6);
              v96 = v70;
LABEL_52:
              v67 = *((_QWORD *)v94 + 7);
              v68 = (_QWORD *)(*((_QWORD *)v94 + 6) + 16 * v66);
              v69 = v68[1];
              *(_QWORD *)&v98 = *v68;
              *((_QWORD *)&v98 + 1) = v69;
              sub_233AA71E0(v67 + 40 * v66, (uint64_t)v93);
              swift_bridgeObjectRetain();
              goto LABEL_71;
            }
          }
        }
      }
LABEL_70:
      v13 = 0;
      v100 = 0;
      memset(v99, 0, sizeof(v99));
      v98 = 0u;
LABEL_71:
      sub_233AA7100((uint64_t)&v98, (uint64_t)&v101);
      v73 = v102;
      if (!v102)
      {
        swift_release();
        goto LABEL_84;
      }
      v74 = v101;
      sub_233AA4660(v95, (uint64_t)&v98);
      LOWORD(v14) = swift_isUniquelyReferenced_nonNull_native();
      v97 = v50;
      v20 = sub_233AA346C(v74, v73);
      v76 = v50[2];
      v77 = (v75 & 1) == 0;
      v78 = v76 + v77;
      if (__OFADD__(v76, v77))
        goto LABEL_90;
      v79 = v75;
      if (v50[3] >= v78)
      {
        if ((v14 & 1) != 0)
        {
          v50 = v97;
          if ((v75 & 1) != 0)
            goto LABEL_48;
        }
        else
        {
          sub_233AA34D0();
          v50 = v97;
          if ((v79 & 1) != 0)
            goto LABEL_48;
        }
      }
      else
      {
        sub_233AA3148(v78, (char)v14);
        v80 = sub_233AA346C(v74, v73);
        if ((v79 & 1) != (v81 & 1))
          goto LABEL_99;
        v20 = v80;
        v50 = v97;
        if ((v79 & 1) != 0)
        {
LABEL_48:
          v64 = v50[7] + 40 * v20;
          __swift_destroy_boxed_opaque_existential_1(v64);
          sub_233AA4660(&v98, v64);
          goto LABEL_49;
        }
      }
      v50[(v20 >> 6) + 8] |= 1 << v20;
      v82 = (uint64_t *)(v50[6] + 16 * v20);
      *v82 = v74;
      v82[1] = v73;
      sub_233AA4660(&v98, v50[7] + 40 * v20);
      v83 = v50[2];
      v84 = __OFADD__(v83, 1);
      v85 = v83 + 1;
      if (v84)
        goto LABEL_91;
      v50[2] = v85;
      swift_bridgeObjectRetain();
LABEL_49:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v65 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    v66 = v65 | (v96 << 6);
    goto LABEL_52;
  }
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  result = sub_233AC3854();
  __break(1u);
  return result;
}

unint64_t sub_233A99D78(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE110);
  v2 = sub_233AC36E0();
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
    sub_233AA70B8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_233AA346C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_233AA4660(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
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

unint64_t sub_233A99EA4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE1A0);
  v2 = (_QWORD *)sub_233AC36E0();
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
    result = sub_233AA346C(v5, v6);
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
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_233A99FB4(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE1A8);
}

unint64_t sub_233A99FC0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE1D0);
  v2 = (_QWORD *)sub_233AC36E0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_233AA72D8(v7, v8);
    result = sub_233AA346C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_233A9A0E4(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE1D8);
}

unint64_t sub_233A9A0F0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE1B8);
  v2 = (_QWORD *)sub_233AC36E0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_233AA346C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
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

unint64_t sub_233A9A200(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE1C0);
  v2 = (_QWORD *)sub_233AC36E0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_233AA346C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

unint64_t sub_233A9A320(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE1C8);
}

unint64_t sub_233A9A32C(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE170);
}

unint64_t sub_233A9A338(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE168);
}

unint64_t sub_233A9A344(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE1E0);
}

unint64_t sub_233A9A350(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE1E8);
}

unint64_t sub_233A9A35C(uint64_t a1)
{
  return sub_233A9A368(a1, &qword_2560FE1F8);
}

unint64_t sub_233A9A368(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_233AC36E0();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_233AA346C(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
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

_QWORD *sub_233A9A47C(_QWORD *result)
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
  result = sub_233ABC184(result, v10, 1, v3);
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE150);
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

uint64_t sub_233A9A574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_233A9A5BC(a1, a2, &qword_2560FE180, (void (*)(_QWORD *__return_ptr))sub_233A98648, a3);
}

uint64_t sub_233A9A598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_233A9A5BC(a1, a2, &qword_2560FE180, (void (*)(_QWORD *__return_ptr))sub_233A98698, a3);
}

uint64_t sub_233A9A5BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void (*a4)(_QWORD *__return_ptr)@<X3>, unint64_t *a5@<X8>)
{
  uint64_t v5;
  __int16 v7;
  uint64_t result;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  unint64_t v13;
  _BYTE v14[40];
  _QWORD v15[5];

  v7 = a1;
  sub_233A96A98(a1, a2, a3);
  a4(v15);
  result = swift_bridgeObjectRelease();
  if (!v5)
  {
    sub_233AA71E0((uint64_t)v15, (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      LOBYTE(v7) = HIBYTE(v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_233AA71E0((uint64_t)v15, (uint64_t)v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE100);
      result = swift_dynamicCast();
      if ((result & 1) == 0)
      {
        __break(1u);
        return result;
      }
      swift_bridgeObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE108);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(v7);
    *(_QWORD *)(inited + 40) = v12;
    sub_233AA71E0((uint64_t)v15, inited + 48);
    v13 = sub_233A99D78(inited);
    a5[3] = v10;
    a5[4] = (unint64_t)&off_2504D5320;
    *a5 = v13;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  return result;
}

uint64_t sub_233A9A738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_233A9A5BC(a1, a2, &qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A99150, a3);
}

uint64_t sub_233A9A75C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_233A9A5BC(a1, a2, &qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A991A0, a3);
}

uint64_t sub_233A9A780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_233A9A5BC(a1, a2, &qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A991F0, a3);
}

uint64_t sub_233A9A7A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_233A9A5BC(a1, a2, &qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A99240, a3);
}

_OWORD *sub_233A9A7C8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _OWORD *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  sub_233AA4678();
  sub_233AC37DC();
  if (v2)
  {
    MEMORY[0x23493B4FC](v2);
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    sub_233AA731C((uint64_t)&v7, &qword_2560FDDB0);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_233AA46BC();
    sub_233AC37DC();
    v10 = v7;
    v11 = v8;
    v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_233AA4F1C();
  }
  else
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_233AA4F60();
  }
  result = (_OWORD *)swift_allocObject();
  *a2 = result;
  v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

_OWORD *sub_233A9B3C0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _OWORD *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  sub_233AA4678();
  sub_233AC37DC();
  if (v2)
  {
    MEMORY[0x23493B4FC](v2);
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    sub_233AA731C((uint64_t)&v7, &qword_2560FDDB0);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_233AA46BC();
    sub_233AC37DC();
    v10 = v7;
    v11 = v8;
    v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_233AA6180();
  }
  else
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_233AA61C4();
  }
  result = (_OWORD *)swift_allocObject();
  *a2 = result;
  v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

_OWORD *sub_233A9BFB8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _OWORD *result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  sub_233AA4678();
  sub_233AC37DC();
  if (v2)
  {
    MEMORY[0x23493B4FC](v2);
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    sub_233AA731C((uint64_t)&v7, &qword_2560FDDB0);
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_233AA46BC();
    sub_233AC37DC();
    v10 = v7;
    v11 = v8;
    v12 = v9;
    a2[3] = &type metadata for CodeDirectoryHash;
    a2[4] = sub_233AA6B90();
  }
  else
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    a2[3] = &type metadata for AppleInternal;
    a2[4] = sub_233AA6BD4();
  }
  result = (_OWORD *)swift_allocObject();
  *a2 = result;
  v6 = v11;
  result[1] = v10;
  result[2] = v6;
  result[3] = v12;
  return result;
}

uint64_t sub_233A9CB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _BYTE *v48;
  _QWORD v49[2];
  __int128 v50[2];
  uint64_t v51;
  _BYTE v52[8];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  ValueMetadata *v59;
  unint64_t v60;
  _BYTE v61[48];
  _QWORD *v62;

  v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v49[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v61);
      sub_233AA71E0((uint64_t)v61, (uint64_t)&v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v61, (uint64_t)&v56);
      v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        v24 = sub_233A9D028(v23, v53);
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v26 = v24;
        v27 = v25;
        v28 = v24 >> 8;
        v59 = &type metadata for ProcessConstraintDisjunction;
        v29 = sub_233AA1D00();
        v56 = v26;
        v57 = v28;
        v60 = v29;
        v58 = v27;
        v30 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v30 = sub_233ABC314(0, v30[2] + 1, 1, v30);
          v62 = v30;
        }
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v62 = sub_233ABC314((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        v33 = v59;
        v5 = v60;
        v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
        MEMORY[0x24BDAC7A8](v34);
        v36 = (char *)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        v11 = v32;
        v12 = (uint64_t)v36;
        v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v61, (uint64_t)v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v51 = 0;
        memset(v50, 0, sizeof(v50));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_233AA731C((uint64_t)v50, &qword_2560FE208);
        sub_233AA45E0();
        swift_allocError();
        *v48 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      }
      sub_233AA4660(v50, (uint64_t)&v56);
      sub_233AA71E0((uint64_t)&v56, (uint64_t)v52);
      v38 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v38 = sub_233ABC314(0, v38[2] + 1, 1, v38);
        v62 = v38;
      }
      v40 = v38[2];
      v39 = v38[3];
      if (v40 >= v39 >> 1)
        v62 = sub_233ABC314((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
      v41 = v54;
      v42 = v55;
      v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v54);
      MEMORY[0x24BDAC7A8](v43);
      v45 = (char *)v49 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v46 + 16))(v45);
      sub_233AA3998(v40, (uint64_t)v45, (uint64_t *)&v62, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    v14 = sub_233A9CB1C();
    if (v2)
      goto LABEL_28;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v59 = &type metadata for ProcessConstraintConjunction;
    v19 = sub_233AA1BE0();
    v56 = v16;
    v57 = v18;
    v60 = v19;
    v58 = v17;
    v20 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC314(0, v20[2] + 1, 1, v20);
      v62 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v62 = sub_233ABC314((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v59;
    v5 = v60;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v62, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_233A9D028(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  ValueMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  _BYTE *v47;
  _QWORD v48[2];
  __int128 v49[2];
  uint64_t v50;
  _BYTE v51[8];
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  ValueMetadata *v57;
  unint64_t v58;
  _BYTE v59[48];
  _QWORD *v60;

  v60 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v48[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v59);
      sub_233AA71E0((uint64_t)v59, (uint64_t)&v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v59, (uint64_t)&v54);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = sub_233A9D028();
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v25 = v23;
        v26 = v24;
        v27 = v23 >> 8;
        v57 = &type metadata for ProcessConstraintDisjunction;
        v28 = sub_233AA1D00();
        v54 = v25;
        v55 = v27;
        v58 = v28;
        v56 = v26;
        v29 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v29 = sub_233ABC314(0, v29[2] + 1, 1, v29);
          v60 = v29;
        }
        v31 = v29[2];
        v30 = v29[3];
        if (v31 >= v30 >> 1)
          v60 = sub_233ABC314((_QWORD *)(v30 > 1), v31 + 1, 1, v29);
        v32 = v57;
        v5 = v58;
        v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v11 = v31;
        v12 = (uint64_t)v35;
        v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v59, (uint64_t)v51);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v50 = 0;
        memset(v49, 0, sizeof(v49));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_233AA731C((uint64_t)v49, &qword_2560FE208);
        sub_233AA45E0();
        swift_allocError();
        *v47 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      }
      sub_233AA4660(v49, (uint64_t)&v54);
      sub_233AA71E0((uint64_t)&v54, (uint64_t)v51);
      v37 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v37 = sub_233ABC314(0, v37[2] + 1, 1, v37);
        v60 = v37;
      }
      v39 = v37[2];
      v38 = v37[3];
      if (v39 >= v38 >> 1)
        v60 = sub_233ABC314((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
      v40 = v52;
      v41 = v53;
      v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
      MEMORY[0x24BDAC7A8](v42);
      v44 = (char *)v48 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v45 + 16))(v44);
      sub_233AA3998(v39, (uint64_t)v44, (uint64_t *)&v60, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    v14 = sub_233A9CB1C();
    if (v2)
      goto LABEL_28;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v57 = &type metadata for ProcessConstraintConjunction;
    v19 = sub_233AA1BE0();
    v54 = v16;
    v55 = v18;
    v58 = v19;
    v56 = v17;
    v20 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC314(0, v20[2] + 1, 1, v20);
      v60 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v60 = sub_233ABC314((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v57;
    v5 = v58;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v60, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_233A9D534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  _QWORD v54[2];
  __int128 v55[2];
  uint64_t v56;
  _BYTE v57[8];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  ValueMetadata *v63;
  unint64_t v64;
  _BYTE v65[48];
  _QWORD *v66;

  v66 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v65);
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        v24 = sub_233A9DB4C(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v26 = v24;
        v27 = v25;
        v28 = v24 >> 8;
        v63 = &type metadata for ProcessConstraintDisjunction;
        v29 = sub_233AA1D00();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        v64 = v29;
        *((_QWORD *)&v62 + 1) = v27;
        v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v30 = sub_233ABC314(0, v30[2] + 1, 1, v30);
          v66 = v30;
        }
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v66 = sub_233ABC314((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        v33 = v63;
        v5 = v64;
        v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x24BDAC7A8](v34);
        v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        v11 = v32;
        v12 = (uint64_t)v36;
        v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v55, (uint64_t)&v62);
        sub_233AA71E0((uint64_t)&v62, (uint64_t)v57);
        v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v38 = sub_233ABC314(0, v38[2] + 1, 1, v38);
          v66 = v38;
        }
        v40 = v38[2];
        v39 = v38[3];
        if (v40 >= v39 >> 1)
          v66 = sub_233ABC314((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
        v41 = v60;
        v42 = v61;
        v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x24BDAC7A8](v43);
        v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_233AA3998(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_233AA731C((uint64_t)v55, &qword_2560FE208);
        sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v48 = v59;
        swift_bridgeObjectRelease();
        v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v49 = sub_233ABC314(0, v49[2] + 1, 1, v49);
        v51 = v49[2];
        v50 = v49[3];
        if (v51 >= v50 >> 1)
          v49 = sub_233ABC314((_QWORD *)(v50 > 1), v51 + 1, 1, v49);
        v63 = &type metadata for ProcessCodeSigningFlags;
        v64 = sub_233AA4ED8();
        v52 = swift_allocObject();
        *(_QWORD *)&v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(_QWORD *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(_QWORD *)(v52 + 48) = 0;
        v49[2] = v51 + 1;
        sub_233AA4660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    v14 = sub_233A9D534();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v63 = &type metadata for ProcessConstraintConjunction;
    v19 = sub_233AA1BE0();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    v64 = v19;
    *((_QWORD *)&v62 + 1) = v17;
    v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC314(0, v20[2] + 1, 1, v20);
      v66 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v66 = sub_233ABC314((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v63;
    v5 = v64;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_233A9DB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  ValueMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _QWORD v53[2];
  __int128 v54[2];
  uint64_t v55;
  _BYTE v56[8];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  ValueMetadata *v61;
  unint64_t v62;
  _BYTE v63[48];
  _QWORD *v64;

  v64 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v63);
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = sub_233A9DB4C();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v25 = v23;
        v26 = v24;
        v27 = v23 >> 8;
        v61 = &type metadata for ProcessConstraintDisjunction;
        v28 = sub_233AA1D00();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        v62 = v28;
        *((_QWORD *)&v60 + 1) = v26;
        v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v29 = sub_233ABC314(0, v29[2] + 1, 1, v29);
          v64 = v29;
        }
        v31 = v29[2];
        v30 = v29[3];
        if (v31 >= v30 >> 1)
          v64 = sub_233ABC314((_QWORD *)(v30 > 1), v31 + 1, 1, v29);
        v32 = v61;
        v5 = v62;
        v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v11 = v31;
        v12 = (uint64_t)v35;
        v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v54, (uint64_t)&v60);
        sub_233AA71E0((uint64_t)&v60, (uint64_t)v56);
        v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v37 = sub_233ABC314(0, v37[2] + 1, 1, v37);
          v64 = v37;
        }
        v39 = v37[2];
        v38 = v37[3];
        if (v39 >= v38 >> 1)
          v64 = sub_233ABC314((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
        v40 = v58;
        v41 = v59;
        v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x24BDAC7A8](v42);
        v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_233AA3998(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_233AA731C((uint64_t)v54, &qword_2560FE208);
        sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v47 = v57;
        swift_bridgeObjectRelease();
        v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v48 = sub_233ABC314(0, v48[2] + 1, 1, v48);
        v50 = v48[2];
        v49 = v48[3];
        if (v50 >= v49 >> 1)
          v48 = sub_233ABC314((_QWORD *)(v49 > 1), v50 + 1, 1, v48);
        v61 = &type metadata for ProcessCodeSigningFlags;
        v62 = sub_233AA4ED8();
        v51 = swift_allocObject();
        *(_QWORD *)&v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(_QWORD *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(_QWORD *)(v51 + 48) = 0;
        v48[2] = v50 + 1;
        sub_233AA4660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    v14 = sub_233A9D534();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v61 = &type metadata for ProcessConstraintConjunction;
    v19 = sub_233AA1BE0();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    v62 = v19;
    *((_QWORD *)&v60 + 1) = v17;
    v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC314(0, v20[2] + 1, 1, v20);
      v64 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v64 = sub_233ABC314((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v61;
    v5 = v62;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_233A9E164(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_233AAF8A0(*a1, *a2);
}

uint64_t sub_233A9E17C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233A9E1B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233A9E1DC()
{
  return 0;
}

void sub_233A9E1E8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_233A9E1F4()
{
  sub_233AA28B4();
  return sub_233AC38D8();
}

uint64_t sub_233A9E21C()
{
  sub_233AA28B4();
  return sub_233AC38E4();
}

uint64_t sub_233A9E244@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AA1B2C(&qword_2560FE180, (void (*)(_QWORD *__return_ptr))sub_233A98698, a1);
}

uint64_t sub_233A9E268@<X0>(uint64_t a1@<X8>)
{
  return sub_233AA1B64((uint64_t (*)(void))sub_233AA4140, a1);
}

uint64_t sub_233A9E284(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233A9FAB8(a1, a2, a3, &qword_2560FDD80, (void (*)(void))sub_233AA28B4);
}

uint64_t sub_233A9E2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _BYTE *v48;
  _QWORD v49[2];
  __int128 v50[2];
  uint64_t v51;
  _BYTE v52[8];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  ValueMetadata *v59;
  unint64_t v60;
  _BYTE v61[48];
  _QWORD *v62;

  v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v49[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v61);
      sub_233AA71E0((uint64_t)v61, (uint64_t)&v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v61, (uint64_t)&v56);
      v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        v24 = sub_233A9E7BC(v23, v53);
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v26 = v24;
        v27 = v25;
        v28 = v24 >> 8;
        v59 = &type metadata for LaunchConstraintDisjunction;
        v29 = sub_233AA1D60();
        v56 = v26;
        v57 = v28;
        v60 = v29;
        v58 = v27;
        v30 = v62;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v30 = sub_233ABC41C(0, v30[2] + 1, 1, v30);
          v62 = v30;
        }
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v62 = sub_233ABC41C((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        v33 = v59;
        v5 = v60;
        v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
        MEMORY[0x24BDAC7A8](v34);
        v36 = (char *)v49 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        v11 = v32;
        v12 = (uint64_t)v36;
        v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v61, (uint64_t)v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v51 = 0;
        memset(v50, 0, sizeof(v50));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_233AA731C((uint64_t)v50, &qword_2560FE200);
        sub_233AA45E0();
        swift_allocError();
        *v48 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      }
      sub_233AA4660(v50, (uint64_t)&v56);
      sub_233AA71E0((uint64_t)&v56, (uint64_t)v52);
      v38 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v38 = sub_233ABC41C(0, v38[2] + 1, 1, v38);
        v62 = v38;
      }
      v40 = v38[2];
      v39 = v38[3];
      if (v40 >= v39 >> 1)
        v62 = sub_233ABC41C((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
      v41 = v54;
      v42 = v55;
      v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v54);
      MEMORY[0x24BDAC7A8](v43);
      v45 = (char *)v49 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v46 + 16))(v45);
      sub_233AA3998(v40, (uint64_t)v45, (uint64_t *)&v62, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    v14 = sub_233A9E2B0();
    if (v2)
      goto LABEL_28;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v59 = &type metadata for LaunchConstraintConjunction;
    v19 = sub_233AA1C40();
    v56 = v16;
    v57 = v18;
    v60 = v19;
    v58 = v17;
    v20 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC41C(0, v20[2] + 1, 1, v20);
      v62 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v62 = sub_233ABC41C((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v59;
    v5 = v60;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v56, (uint64_t)v59);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v62, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v56);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_233A9E7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  ValueMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  _BYTE *v47;
  _QWORD v48[2];
  __int128 v49[2];
  uint64_t v50;
  _BYTE v51[8];
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  ValueMetadata *v57;
  unint64_t v58;
  _BYTE v59[48];
  _QWORD *v60;

  v60 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v48[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v59);
      sub_233AA71E0((uint64_t)v59, (uint64_t)&v54);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v59, (uint64_t)&v54);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = sub_233A9E7BC();
        if (v2)
        {
LABEL_28:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v25 = v23;
        v26 = v24;
        v27 = v23 >> 8;
        v57 = &type metadata for LaunchConstraintDisjunction;
        v28 = sub_233AA1D60();
        v54 = v25;
        v55 = v27;
        v58 = v28;
        v56 = v26;
        v29 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v29 = sub_233ABC41C(0, v29[2] + 1, 1, v29);
          v60 = v29;
        }
        v31 = v29[2];
        v30 = v29[3];
        if (v31 >= v30 >> 1)
          v60 = sub_233ABC41C((_QWORD *)(v30 > 1), v31 + 1, 1, v29);
        v32 = v57;
        v5 = v58;
        v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)v48 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v11 = v31;
        v12 = (uint64_t)v35;
        v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v59, (uint64_t)v51);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v50 = 0;
        memset(v49, 0, sizeof(v49));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_233AA731C((uint64_t)v49, &qword_2560FE200);
        sub_233AA45E0();
        swift_allocError();
        *v47 = 3;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      }
      sub_233AA4660(v49, (uint64_t)&v54);
      sub_233AA71E0((uint64_t)&v54, (uint64_t)v51);
      v37 = v60;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v37 = sub_233ABC41C(0, v37[2] + 1, 1, v37);
        v60 = v37;
      }
      v39 = v37[2];
      v38 = v37[3];
      if (v39 >= v38 >> 1)
        v60 = sub_233ABC41C((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
      v40 = v52;
      v41 = v53;
      v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
      MEMORY[0x24BDAC7A8](v42);
      v44 = (char *)v48 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v45 + 16))(v44);
      sub_233AA3998(v39, (uint64_t)v44, (uint64_t *)&v60, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    v14 = sub_233A9E2B0();
    if (v2)
      goto LABEL_28;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v57 = &type metadata for LaunchConstraintConjunction;
    v19 = sub_233AA1C40();
    v54 = v16;
    v55 = v18;
    v58 = v19;
    v56 = v17;
    v20 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC41C(0, v20[2] + 1, 1, v20);
      v60 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v60 = sub_233ABC41C((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v57;
    v5 = v58;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v54, (uint64_t)v57);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v60, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v54);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_233A9ECC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  _QWORD v54[2];
  __int128 v55[2];
  uint64_t v56;
  _BYTE v57[8];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  ValueMetadata *v63;
  unint64_t v64;
  _BYTE v65[48];
  _QWORD *v66;

  v66 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v65);
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        v24 = sub_233A9F2E0(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v26 = v24;
        v27 = v25;
        v28 = v24 >> 8;
        v63 = &type metadata for LaunchConstraintDisjunction;
        v29 = sub_233AA1D60();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        v64 = v29;
        *((_QWORD *)&v62 + 1) = v27;
        v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v30 = sub_233ABC41C(0, v30[2] + 1, 1, v30);
          v66 = v30;
        }
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v66 = sub_233ABC41C((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        v33 = v63;
        v5 = v64;
        v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x24BDAC7A8](v34);
        v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        v11 = v32;
        v12 = (uint64_t)v36;
        v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v55, (uint64_t)&v62);
        sub_233AA71E0((uint64_t)&v62, (uint64_t)v57);
        v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v38 = sub_233ABC41C(0, v38[2] + 1, 1, v38);
          v66 = v38;
        }
        v40 = v38[2];
        v39 = v38[3];
        if (v40 >= v39 >> 1)
          v66 = sub_233ABC41C((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
        v41 = v60;
        v42 = v61;
        v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x24BDAC7A8](v43);
        v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_233AA3998(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_233AA731C((uint64_t)v55, &qword_2560FE200);
        sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v48 = v59;
        swift_bridgeObjectRelease();
        v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v49 = sub_233ABC41C(0, v49[2] + 1, 1, v49);
        v51 = v49[2];
        v50 = v49[3];
        if (v51 >= v50 >> 1)
          v49 = sub_233ABC41C((_QWORD *)(v50 > 1), v51 + 1, 1, v49);
        v63 = &type metadata for ProcessCodeSigningFlags;
        v64 = sub_233AA613C();
        v52 = swift_allocObject();
        *(_QWORD *)&v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(_QWORD *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(_QWORD *)(v52 + 48) = 0;
        v49[2] = v51 + 1;
        sub_233AA4660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    v14 = sub_233A9ECC8();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v63 = &type metadata for LaunchConstraintConjunction;
    v19 = sub_233AA1C40();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    v64 = v19;
    *((_QWORD *)&v62 + 1) = v17;
    v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC41C(0, v20[2] + 1, 1, v20);
      v66 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v66 = sub_233ABC41C((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v63;
    v5 = v64;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_233A9F2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  ValueMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _QWORD v53[2];
  __int128 v54[2];
  uint64_t v55;
  _BYTE v56[8];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  ValueMetadata *v61;
  unint64_t v62;
  _BYTE v63[48];
  _QWORD *v64;

  v64 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v63);
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = sub_233A9F2E0();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v25 = v23;
        v26 = v24;
        v27 = v23 >> 8;
        v61 = &type metadata for LaunchConstraintDisjunction;
        v28 = sub_233AA1D60();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        v62 = v28;
        *((_QWORD *)&v60 + 1) = v26;
        v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v29 = sub_233ABC41C(0, v29[2] + 1, 1, v29);
          v64 = v29;
        }
        v31 = v29[2];
        v30 = v29[3];
        if (v31 >= v30 >> 1)
          v64 = sub_233ABC41C((_QWORD *)(v30 > 1), v31 + 1, 1, v29);
        v32 = v61;
        v5 = v62;
        v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v11 = v31;
        v12 = (uint64_t)v35;
        v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v54, (uint64_t)&v60);
        sub_233AA71E0((uint64_t)&v60, (uint64_t)v56);
        v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v37 = sub_233ABC41C(0, v37[2] + 1, 1, v37);
          v64 = v37;
        }
        v39 = v37[2];
        v38 = v37[3];
        if (v39 >= v38 >> 1)
          v64 = sub_233ABC41C((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
        v40 = v58;
        v41 = v59;
        v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x24BDAC7A8](v42);
        v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_233AA3998(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_233AA731C((uint64_t)v54, &qword_2560FE200);
        sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v47 = v57;
        swift_bridgeObjectRelease();
        v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v48 = sub_233ABC41C(0, v48[2] + 1, 1, v48);
        v50 = v48[2];
        v49 = v48[3];
        if (v50 >= v49 >> 1)
          v48 = sub_233ABC41C((_QWORD *)(v49 > 1), v50 + 1, 1, v48);
        v61 = &type metadata for ProcessCodeSigningFlags;
        v62 = sub_233AA613C();
        v51 = swift_allocObject();
        *(_QWORD *)&v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(_QWORD *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(_QWORD *)(v51 + 48) = 0;
        v48[2] = v50 + 1;
        sub_233AA4660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    v14 = sub_233A9ECC8();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v61 = &type metadata for LaunchConstraintConjunction;
    v19 = sub_233AA1C40();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    v62 = v19;
    *((_QWORD *)&v60 + 1) = v17;
    v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC41C(0, v20[2] + 1, 1, v20);
      v64 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v64 = sub_233ABC41C((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v61;
    v5 = v62;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_233A9F8F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

void sub_233A9F92C(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE300000000000000;
  v4 = 0xE800000000000000;
  v5 = 0x79654B7961727261;
  if (v2 != 1)
  {
    v5 = 0x65756C6176;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 7955819;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_233A9F980()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x79654B7961727261;
  if (*v0 != 1)
    v1 = 0x65756C6176;
  if (*v0)
    return v1;
  else
    return 7955819;
}

uint64_t sub_233A9F9D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233A9F9FC()
{
  sub_233AA5CFC();
  return sub_233AC38D8();
}

uint64_t sub_233A9FA24()
{
  sub_233AA5CFC();
  return sub_233AC38E4();
}

uint64_t sub_233A9FA4C@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AA1B2C(&qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A99240, a1);
}

uint64_t sub_233A9FA70@<X0>(uint64_t a1@<X8>)
{
  return sub_233AA1B64((uint64_t (*)(void))sub_233AA4FA4, a1);
}

uint64_t sub_233A9FA8C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233A9FAB8(a1, a2, a3, &qword_2560FDF60, (void (*)(void))sub_233AA5CFC);
}

uint64_t sub_233A9FAB8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  unsigned __int16 *v5;

  return sub_233AA18CC(a1, *v5, *((_QWORD *)v5 + 1), a4, a5);
}

uint64_t sub_233A9FAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  _QWORD v54[2];
  __int128 v55[2];
  uint64_t v56;
  _BYTE v57[8];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  ValueMetadata *v63;
  unint64_t v64;
  _BYTE v65[48];
  _QWORD *v66;

  v66 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v65);
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        v24 = sub_233AA00EC(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v26 = v24;
        v27 = v25;
        v28 = v24 >> 8;
        v63 = &type metadata for OnDiskConstraintDisjunction;
        v29 = sub_233AA1E20();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        v64 = v29;
        *((_QWORD *)&v62 + 1) = v27;
        v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v30 = sub_233ABC430(0, v30[2] + 1, 1, v30);
          v66 = v30;
        }
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v66 = sub_233ABC430((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        v33 = v63;
        v5 = v64;
        v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x24BDAC7A8](v34);
        v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        v11 = v32;
        v12 = (uint64_t)v36;
        v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v55, (uint64_t)&v62);
        sub_233AA71E0((uint64_t)&v62, (uint64_t)v57);
        v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v38 = sub_233ABC430(0, v38[2] + 1, 1, v38);
          v66 = v38;
        }
        v40 = v38[2];
        v39 = v38[3];
        if (v40 >= v39 >> 1)
          v66 = sub_233ABC430((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
        v41 = v60;
        v42 = v61;
        v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x24BDAC7A8](v43);
        v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_233AA3998(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_233AA731C((uint64_t)v55, &qword_2560FE1F0);
        sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v48 = v59;
        swift_bridgeObjectRelease();
        v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v49 = sub_233ABC430(0, v49[2] + 1, 1, v49);
        v51 = v49[2];
        v50 = v49[3];
        if (v51 >= v50 >> 1)
          v49 = sub_233ABC430((_QWORD *)(v50 > 1), v51 + 1, 1, v49);
        v63 = &type metadata for OnDiskCodeSigningFlags;
        v64 = sub_233AA6B28();
        v52 = swift_allocObject();
        *(_QWORD *)&v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(_QWORD *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(_QWORD *)(v52 + 48) = 0;
        v49[2] = v51 + 1;
        sub_233AA4660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    v14 = sub_233A9FAD4();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v63 = &type metadata for OnDiskConstraintConjunction;
    v19 = sub_233AA1CA0();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    v64 = v19;
    *((_QWORD *)&v62 + 1) = v17;
    v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC430(0, v20[2] + 1, 1, v20);
      v66 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v66 = sub_233ABC430((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v63;
    v5 = v64;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_233AA00EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  ValueMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _QWORD v53[2];
  __int128 v54[2];
  uint64_t v55;
  _BYTE v56[8];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  ValueMetadata *v61;
  unint64_t v62;
  _BYTE v63[48];
  _QWORD *v64;

  v64 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v63);
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = sub_233AA00EC();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v25 = v23;
        v26 = v24;
        v27 = v23 >> 8;
        v61 = &type metadata for OnDiskConstraintDisjunction;
        v28 = sub_233AA1E20();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        v62 = v28;
        *((_QWORD *)&v60 + 1) = v26;
        v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v29 = sub_233ABC430(0, v29[2] + 1, 1, v29);
          v64 = v29;
        }
        v31 = v29[2];
        v30 = v29[3];
        if (v31 >= v30 >> 1)
          v64 = sub_233ABC430((_QWORD *)(v30 > 1), v31 + 1, 1, v29);
        v32 = v61;
        v5 = v62;
        v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v11 = v31;
        v12 = (uint64_t)v35;
        v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v54, (uint64_t)&v60);
        sub_233AA71E0((uint64_t)&v60, (uint64_t)v56);
        v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v37 = sub_233ABC430(0, v37[2] + 1, 1, v37);
          v64 = v37;
        }
        v39 = v37[2];
        v38 = v37[3];
        if (v39 >= v38 >> 1)
          v64 = sub_233ABC430((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
        v40 = v58;
        v41 = v59;
        v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x24BDAC7A8](v42);
        v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_233AA3998(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_233AA731C((uint64_t)v54, &qword_2560FE1F0);
        sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v47 = v57;
        swift_bridgeObjectRelease();
        v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v48 = sub_233ABC430(0, v48[2] + 1, 1, v48);
        v50 = v48[2];
        v49 = v48[3];
        if (v50 >= v49 >> 1)
          v48 = sub_233ABC430((_QWORD *)(v49 > 1), v50 + 1, 1, v48);
        v61 = &type metadata for OnDiskCodeSigningFlags;
        v62 = sub_233AA6B28();
        v51 = swift_allocObject();
        *(_QWORD *)&v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(_QWORD *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(_QWORD *)(v51 + 48) = 0;
        v48[2] = v50 + 1;
        sub_233AA4660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    v14 = sub_233A9FAD4();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v61 = &type metadata for OnDiskConstraintConjunction;
    v19 = sub_233AA1CA0();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    v62 = v19;
    *((_QWORD *)&v60 + 1) = v17;
    v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC430(0, v20[2] + 1, 1, v20);
      v64 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v64 = sub_233ABC430((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v61;
    v5 = v62;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_233AA0704(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  ValueMetadata *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  _QWORD v54[2];
  __int128 v55[2];
  uint64_t v56;
  _BYTE v57[8];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  ValueMetadata *v63;
  unint64_t v64;
  _BYTE v65[48];
  _QWORD *v66;

  v66 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v54[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v65);
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
      v23 = swift_dynamicCast();
      if ((v23 & 1) != 0)
      {
        v24 = sub_233AA0D1C(v23, v58);
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v26 = v24;
        v27 = v25;
        v28 = v24 >> 8;
        v63 = &type metadata for OnDiskConstraintDisjunction;
        v29 = sub_233AA1E20();
        LOBYTE(v62) = v26;
        BYTE1(v62) = v28;
        v64 = v29;
        *((_QWORD *)&v62 + 1) = v27;
        v30 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v30 = sub_233ABC430(0, v30[2] + 1, 1, v30);
          v66 = v30;
        }
        v32 = v30[2];
        v31 = v30[3];
        if (v32 >= v31 >> 1)
          v66 = sub_233ABC430((_QWORD *)(v31 > 1), v32 + 1, 1, v30);
        v33 = v63;
        v5 = v64;
        v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
        MEMORY[0x24BDAC7A8](v34);
        v36 = (char *)v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v37 + 16))(v36);
        v11 = v32;
        v12 = (uint64_t)v36;
        v13 = (uint64_t)v33;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v65, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v55, (uint64_t)&v62);
        sub_233AA71E0((uint64_t)&v62, (uint64_t)v57);
        v38 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v38 = sub_233ABC430(0, v38[2] + 1, 1, v38);
          v66 = v38;
        }
        v40 = v38[2];
        v39 = v38[3];
        if (v40 >= v39 >> 1)
          v66 = sub_233ABC430((_QWORD *)(v39 > 1), v40 + 1, 1, v38);
        v41 = v60;
        v42 = v61;
        v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v60);
        MEMORY[0x24BDAC7A8](v43);
        v45 = (char *)v54 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v46 + 16))(v45);
        sub_233AA3998(v40, (uint64_t)v45, (uint64_t *)&v66, v41, v42, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      }
      else
      {
        v56 = 0;
        memset(v55, 0, sizeof(v55));
        sub_233AA731C((uint64_t)v55, &qword_2560FE1F0);
        sub_233AA71E0((uint64_t)v65, (uint64_t)&v62);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v53 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
        }
        if ((v60 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v48 = v59;
        swift_bridgeObjectRelease();
        v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v49 = sub_233ABC430(0, v49[2] + 1, 1, v49);
        v51 = v49[2];
        v50 = v49[3];
        if (v51 >= v50 >> 1)
          v49 = sub_233ABC430((_QWORD *)(v50 > 1), v51 + 1, 1, v49);
        v63 = &type metadata for OnDiskCodeSigningFlags;
        v64 = sub_233AA6B28();
        v52 = swift_allocObject();
        *(_QWORD *)&v62 = v52;
        *(_BYTE *)(v52 + 16) = 2;
        *(_BYTE *)(v52 + 24) = 23;
        *(_QWORD *)(v52 + 32) = v48;
        *(_BYTE *)(v52 + 40) = 0;
        *(_QWORD *)(v52 + 48) = 0;
        v49[2] = v51 + 1;
        sub_233AA4660(&v62, (uint64_t)&v49[5 * v51 + 4]);
        v66 = v49;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 5141;
      }
    }
    v14 = sub_233AA0704();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v63 = &type metadata for OnDiskConstraintConjunction;
    v19 = sub_233AA1CA0();
    LOBYTE(v62) = v16;
    BYTE1(v62) = v18;
    v64 = v19;
    *((_QWORD *)&v62 + 1) = v17;
    v20 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC430(0, v20[2] + 1, 1, v20);
      v66 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v66 = sub_233ABC430((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v63;
    v5 = v64;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v62, (uint64_t)v63);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v66, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 5141;
}

uint64_t sub_233AA0D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  ValueMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  ValueMetadata *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _QWORD v53[2];
  __int128 v54[2];
  uint64_t v55;
  _BYTE v56[8];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  ValueMetadata *v61;
  unint64_t v62;
  _BYTE v63[48];
  _QWORD *v64;

  v64 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
  {
    v53[1] = a2;
    for (i = a2 + 32; ; i += 40)
    {
      sub_233AA71E0(i, (uint64_t)v63);
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
      if ((swift_dynamicCast() & 1) != 0)
        break;
      sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v23 = sub_233AA0D1C();
        if (v2)
        {
LABEL_35:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        v25 = v23;
        v26 = v24;
        v27 = v23 >> 8;
        v61 = &type metadata for OnDiskConstraintDisjunction;
        v28 = sub_233AA1E20();
        LOBYTE(v60) = v25;
        BYTE1(v60) = v27;
        v62 = v28;
        *((_QWORD *)&v60 + 1) = v26;
        v29 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v29 = sub_233ABC430(0, v29[2] + 1, 1, v29);
          v64 = v29;
        }
        v31 = v29[2];
        v30 = v29[3];
        if (v31 >= v30 >> 1)
          v64 = sub_233ABC430((_QWORD *)(v30 > 1), v31 + 1, 1, v29);
        v32 = v61;
        v5 = v62;
        v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
        MEMORY[0x24BDAC7A8](v33);
        v35 = (char *)v53 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v36 + 16))(v35);
        v11 = v31;
        v12 = (uint64_t)v35;
        v13 = (uint64_t)v32;
        goto LABEL_4;
      }
      sub_233AA71E0((uint64_t)v63, (uint64_t)v56);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_233AA4660(v54, (uint64_t)&v60);
        sub_233AA71E0((uint64_t)&v60, (uint64_t)v56);
        v37 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v37 = sub_233ABC430(0, v37[2] + 1, 1, v37);
          v64 = v37;
        }
        v39 = v37[2];
        v38 = v37[3];
        if (v39 >= v38 >> 1)
          v64 = sub_233ABC430((_QWORD *)(v38 > 1), v39 + 1, 1, v37);
        v40 = v58;
        v41 = v59;
        v42 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v56, v58);
        MEMORY[0x24BDAC7A8](v42);
        v44 = (char *)v53 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v45 + 16))(v44);
        sub_233AA3998(v39, (uint64_t)v44, (uint64_t *)&v64, v40, v41, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      }
      else
      {
        v55 = 0;
        memset(v54, 0, sizeof(v54));
        sub_233AA731C((uint64_t)v54, &qword_2560FE1F0);
        sub_233AA71E0((uint64_t)v63, (uint64_t)&v60);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v52 = 3;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        }
        if ((v58 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v47 = v57;
        swift_bridgeObjectRelease();
        v48 = v64;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v48 = sub_233ABC430(0, v48[2] + 1, 1, v48);
        v50 = v48[2];
        v49 = v48[3];
        if (v50 >= v49 >> 1)
          v48 = sub_233ABC430((_QWORD *)(v49 > 1), v50 + 1, 1, v48);
        v61 = &type metadata for OnDiskCodeSigningFlags;
        v62 = sub_233AA6B28();
        v51 = swift_allocObject();
        *(_QWORD *)&v60 = v51;
        *(_BYTE *)(v51 + 16) = 2;
        *(_BYTE *)(v51 + 24) = 23;
        *(_QWORD *)(v51 + 32) = v47;
        *(_BYTE *)(v51 + 40) = 0;
        *(_QWORD *)(v51 + 48) = 0;
        v48[2] = v50 + 1;
        sub_233AA4660(&v60, (uint64_t)&v48[5 * v50 + 4]);
        v64 = v48;
      }
LABEL_5:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return 7197;
      }
    }
    v14 = sub_233AA0704();
    if (v2)
      goto LABEL_35;
    v16 = v14;
    v17 = v15;
    v18 = v14 >> 8;
    v61 = &type metadata for OnDiskConstraintConjunction;
    v19 = sub_233AA1CA0();
    LOBYTE(v60) = v16;
    BYTE1(v60) = v18;
    v62 = v19;
    *((_QWORD *)&v60 + 1) = v17;
    v20 = v64;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v20 = sub_233ABC430(0, v20[2] + 1, 1, v20);
      v64 = v20;
    }
    v22 = v20[2];
    v21 = v20[3];
    if (v22 >= v21 >> 1)
      v64 = sub_233ABC430((_QWORD *)(v21 > 1), v22 + 1, 1, v20);
    v6 = v61;
    v5 = v62;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v60, (uint64_t)v61);
    MEMORY[0x24BDAC7A8](v7);
    v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v9);
    v11 = v22;
    v12 = (uint64_t)v9;
    v13 = (uint64_t)v6;
LABEL_4:
    sub_233AA3998(v11, v12, (uint64_t *)&v64, v13, v5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  return 7197;
}

uint64_t sub_233AA1334@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA1368@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA1394()
{
  sub_233AA66A8();
  return sub_233AC38D8();
}

uint64_t sub_233AA13BC()
{
  sub_233AA66A8();
  return sub_233AC38E4();
}

uint64_t sub_233AA13E4@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AA1B2C(&qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A991A0, a1);
}

uint64_t sub_233AA1408@<X0>(uint64_t a1@<X8>)
{
  return sub_233AA1B64((uint64_t (*)(void))sub_233AA5400, a1);
}

uint64_t sub_233AA1424(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233A9FAB8(a1, a2, a3, &qword_2560FE030, (void (*)(void))sub_233AA66A8);
}

uint64_t sub_233AA1450@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA1484@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA14B0()
{
  sub_233AA27E4();
  return sub_233AC38D8();
}

uint64_t sub_233AA14D8()
{
  sub_233AA27E4();
  return sub_233AC38E4();
}

uint64_t sub_233AA1500@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AA1B2C(&qword_2560FE180, (void (*)(_QWORD *__return_ptr))sub_233A98648, a1);
}

uint64_t sub_233AA1524@<X0>(uint64_t a1@<X8>)
{
  return sub_233AA1B64((uint64_t (*)(void))sub_233AA585C, a1);
}

uint64_t sub_233AA1540(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233A9FAB8(a1, a2, a3, &qword_2560FDD68, (void (*)(void))sub_233AA27E4);
}

uint64_t sub_233AA156C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA15A0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA15CC()
{
  sub_233AA5CB8();
  return sub_233AC38D8();
}

uint64_t sub_233AA15F4()
{
  sub_233AA5CB8();
  return sub_233AC38E4();
}

uint64_t sub_233AA161C@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AA1B2C(&qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A991F0, a1);
}

uint64_t sub_233AA1640@<X0>(uint64_t a1@<X8>)
{
  return sub_233AA1B64((uint64_t (*)(void))sub_233AA6208, a1);
}

uint64_t sub_233AA165C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233A9FAB8(a1, a2, a3, &qword_2560FDF50, (void (*)(void))sub_233AA5CB8);
}

uint64_t sub_233AA1688()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AA171C()
{
  sub_233AC35D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AA178C()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AA181C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA1850@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AA6C18();
  *a1 = result;
  return result;
}

uint64_t sub_233AA187C()
{
  sub_233AA6664();
  return sub_233AC38D8();
}

uint64_t sub_233AA18A4()
{
  sub_233AA6664();
  return sub_233AC38E4();
}

uint64_t sub_233AA18CC(_QWORD *a1, unsigned int a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  uint64_t v20;
  char v21;

  v16 = a3;
  LODWORD(v17) = a2;
  v7 = a2 >> 8;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a5();
  sub_233AC38CC();
  v19[0] = v7;
  v21 = 0;
  sub_233AA2828();
  v12 = v18;
  sub_233AC377C();
  if (v12)
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = v9;
  v19[0] = v17;
  v21 = 1;
  sub_233AC377C();
  v21 = 2;
  sub_233AC374C();
  v14 = *(_QWORD *)(v16 + 16);
  if (v14)
  {
    v17 = v8;
    v15 = (_QWORD *)(v16 + 32);
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v15, v15[3]);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
      sub_233AC3824();
      v15 += 5;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    v8 = v17;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_233AA1B08@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AA1B2C(&qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A99150, a1);
}

uint64_t sub_233AA1B2C@<X0>(uint64_t *a1@<X2>, void (*a2)(_QWORD *__return_ptr)@<X3>, unint64_t *a3@<X8>)
{
  unsigned __int16 *v3;

  return sub_233A9A5BC(*v3, *((_QWORD *)v3 + 1), a1, a2, a3);
}

uint64_t sub_233AA1B48@<X0>(uint64_t a1@<X8>)
{
  return sub_233AA1B64((uint64_t (*)(void))sub_233AA6C5C, a1);
}

uint64_t sub_233AA1B64@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = a1();
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_233AA1B98(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233A9FAB8(a1, a2, a3, &qword_2560FE020, (void (*)(void))sub_233AA6664);
}

uint64_t allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  return sub_233AA1DC0(a1, (uint64_t)&type metadata for ProcessConstraintConjunction, (uint64_t (*)(void))sub_233AA1BE0, 21, 20, a2);
}

{
  return sub_233AA1DC0(a1, (uint64_t)&type metadata for LaunchConstraintConjunction, (uint64_t (*)(void))sub_233AA1C40, 21, 20, a2);
}

{
  return sub_233AA1DC0(a1, (uint64_t)&type metadata for OnDiskConstraintConjunction, (uint64_t (*)(void))sub_233AA1CA0, 21, 20, a2);
}

unint64_t sub_233AA1BE0()
{
  unint64_t result;

  result = qword_2560FDA20;
  if (!qword_2560FDA20)
  {
    result = MEMORY[0x23493B550](&unk_233AC4208, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA20);
  }
  return result;
}

unint64_t sub_233AA1C40()
{
  unint64_t result;

  result = qword_2560FDA28;
  if (!qword_2560FDA28)
  {
    result = MEMORY[0x23493B550](&unk_233AC41EC, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA28);
  }
  return result;
}

unint64_t sub_233AA1CA0()
{
  unint64_t result;

  result = qword_2560FDA30;
  if (!qword_2560FDA30)
  {
    result = MEMORY[0x23493B550](&unk_233AC41D0, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA30);
  }
  return result;
}

uint64_t anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  return sub_233AA1DC0(a1, (uint64_t)&type metadata for ProcessConstraintDisjunction, (uint64_t (*)(void))sub_233AA1D00, 29, 28, a2);
}

{
  return sub_233AA1DC0(a1, (uint64_t)&type metadata for LaunchConstraintDisjunction, (uint64_t (*)(void))sub_233AA1D60, 29, 28, a2);
}

{
  return sub_233AA1DC0(a1, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (uint64_t (*)(void))sub_233AA1E20, 29, 28, a2);
}

unint64_t sub_233AA1D00()
{
  unint64_t result;

  result = qword_2560FDA38;
  if (!qword_2560FDA38)
  {
    result = MEMORY[0x23493B550](&unk_233AC41B4, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA38);
  }
  return result;
}

unint64_t sub_233AA1D60()
{
  unint64_t result;

  result = qword_2560FDA40;
  if (!qword_2560FDA40)
  {
    result = MEMORY[0x23493B550](&unk_233AC4198, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA40);
  }
  return result;
}

uint64_t sub_233AA1DC0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(void)@<X3>, char a4@<W4>, char a5@<W5>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t result;

  v11 = a1();
  *(_QWORD *)(a6 + 24) = a2;
  result = a3();
  *(_QWORD *)(a6 + 32) = result;
  *(_BYTE *)a6 = a4;
  *(_BYTE *)(a6 + 1) = a5;
  *(_QWORD *)(a6 + 8) = v11;
  return result;
}

unint64_t sub_233AA1E20()
{
  unint64_t result;

  result = qword_2560FDA48;
  if (!qword_2560FDA48)
  {
    result = MEMORY[0x23493B550](&unk_233AC417C, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA48);
  }
  return result;
}

void type metadata accessor for CFString()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2560FDA50)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2560FDA50);
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for OnDiskConstraintDisjunction()
{
  return &type metadata for OnDiskConstraintDisjunction;
}

ValueMetadata *type metadata accessor for LaunchConstraintDisjunction()
{
  return &type metadata for LaunchConstraintDisjunction;
}

ValueMetadata *type metadata accessor for ProcessConstraintDisjunction()
{
  return &type metadata for ProcessConstraintDisjunction;
}

ValueMetadata *type metadata accessor for OnDiskConstraintConjunction()
{
  return &type metadata for OnDiskConstraintConjunction;
}

uint64_t destroy for LaunchConstraintConjunction()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for LaunchConstraintConjunction()
{
  return &type metadata for LaunchConstraintConjunction;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwca_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwta_0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintDisjunctionVwet_0(uint64_t a1, int a2)
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

uint64_t sub_233AA202C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ProcessConstraintConjunction()
{
  return &type metadata for ProcessConstraintConjunction;
}

unint64_t sub_233AA207C()
{
  unint64_t result;

  result = qword_2560FDA58;
  if (!qword_2560FDA58)
  {
    result = MEMORY[0x23493B550](&unk_233AC3DA0, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA58);
  }
  return result;
}

unint64_t sub_233AA20C4()
{
  unint64_t result;

  result = qword_2560FDA60;
  if (!qword_2560FDA60)
  {
    result = MEMORY[0x23493B550](&unk_233AC3DF4, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDA60);
  }
  return result;
}

uint64_t sub_233AA2108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA211C, (uint64_t (*)(void))sub_233AA2160);
}

unint64_t sub_233AA211C()
{
  unint64_t result;

  result = qword_2560FDAD0;
  if (!qword_2560FDAD0)
  {
    result = MEMORY[0x23493B550](&unk_233AC4104, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDAD0);
  }
  return result;
}

unint64_t sub_233AA2160()
{
  unint64_t result;

  result = qword_2560FDAD8;
  if (!qword_2560FDAD8)
  {
    result = MEMORY[0x23493B550](&unk_233AC412C, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDAD8);
  }
  return result;
}

unint64_t sub_233AA21A8()
{
  unint64_t result;

  result = qword_2560FDAE0;
  if (!qword_2560FDAE0)
  {
    result = MEMORY[0x23493B550](&unk_233AC3DBC, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDAE0);
  }
  return result;
}

unint64_t sub_233AA21F0()
{
  unint64_t result;

  result = qword_2560FDAE8;
  if (!qword_2560FDAE8)
  {
    result = MEMORY[0x23493B550](&unk_233AC3E10, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDAE8);
  }
  return result;
}

uint64_t sub_233AA2234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA2248, (uint64_t (*)(void))sub_233AA228C);
}

unint64_t sub_233AA2248()
{
  unint64_t result;

  result = qword_2560FDB58;
  if (!qword_2560FDB58)
  {
    result = MEMORY[0x23493B550](&unk_233AC4064, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDB58);
  }
  return result;
}

unint64_t sub_233AA228C()
{
  unint64_t result;

  result = qword_2560FDB60;
  if (!qword_2560FDB60)
  {
    result = MEMORY[0x23493B550](&unk_233AC408C, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDB60);
  }
  return result;
}

unint64_t sub_233AA22D4()
{
  unint64_t result;

  result = qword_2560FDB68;
  if (!qword_2560FDB68)
  {
    result = MEMORY[0x23493B550](&unk_233AC3DD8, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDB68);
  }
  return result;
}

unint64_t sub_233AA231C()
{
  unint64_t result;

  result = qword_2560FDB70;
  if (!qword_2560FDB70)
  {
    result = MEMORY[0x23493B550](&unk_233AC3E2C, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDB70);
  }
  return result;
}

uint64_t sub_233AA2360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA2374, (uint64_t (*)(void))sub_233AA23B8);
}

unint64_t sub_233AA2374()
{
  unint64_t result;

  result = qword_2560FDBE0;
  if (!qword_2560FDBE0)
  {
    result = MEMORY[0x23493B550](&unk_233AC3FC4, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDBE0);
  }
  return result;
}

unint64_t sub_233AA23B8()
{
  unint64_t result;

  result = qword_2560FDBE8;
  if (!qword_2560FDBE8)
  {
    result = MEMORY[0x23493B550](&unk_233AC3FEC, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDBE8);
  }
  return result;
}

uint64_t sub_233AA23FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA2410, (uint64_t (*)(void))sub_233AA2454);
}

unint64_t sub_233AA2410()
{
  unint64_t result;

  result = qword_2560FDC58;
  if (!qword_2560FDC58)
  {
    result = MEMORY[0x23493B550](&unk_233AC40DC, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDC58);
  }
  return result;
}

unint64_t sub_233AA2454()
{
  unint64_t result;

  result = qword_2560FDC60;
  if (!qword_2560FDC60)
  {
    result = MEMORY[0x23493B550](&unk_233AC4154, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDC60);
  }
  return result;
}

uint64_t sub_233AA2498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA24AC, (uint64_t (*)(void))sub_233AA24F0);
}

unint64_t sub_233AA24AC()
{
  unint64_t result;

  result = qword_2560FDCD0;
  if (!qword_2560FDCD0)
  {
    result = MEMORY[0x23493B550](&unk_233AC403C, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDCD0);
  }
  return result;
}

unint64_t sub_233AA24F0()
{
  unint64_t result;

  result = qword_2560FDCD8;
  if (!qword_2560FDCD8)
  {
    result = MEMORY[0x23493B550](&unk_233AC40B4, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDCD8);
  }
  return result;
}

uint64_t sub_233AA2534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA2548, (uint64_t (*)(void))sub_233AA258C);
}

unint64_t sub_233AA2548()
{
  unint64_t result;

  result = qword_2560FDD48;
  if (!qword_2560FDD48)
  {
    result = MEMORY[0x23493B550](&unk_233AC3F9C, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDD48);
  }
  return result;
}

unint64_t sub_233AA258C()
{
  unint64_t result;

  result = qword_2560FDD50;
  if (!qword_2560FDD50)
  {
    result = MEMORY[0x23493B550](&unk_233AC4014, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FDD50);
  }
  return result;
}

uint64_t sub_233AA25D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x23493B550](&unk_233AC3F70, a3);
  return sub_233AC3578();
}

uint64_t sub_233AA261C()
{
  return sub_233AA6AA4(&qword_2560FDD58, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_233AC3E58);
}

uint64_t sub_233AA2648(uint64_t a1)
{
  MEMORY[0x23493B550](&unk_233AC3F70, a1);
  return sub_233AC3590();
}

uint64_t sub_233AA2684()
{
  MEMORY[0x23493B550](&unk_233AC3F70);
  return sub_233AC3584();
}

uint64_t sub_233AA26CC(uint64_t a1, uint64_t a2)
{
  sub_233AC3890();
  MEMORY[0x23493B550](&unk_233AC3F70, a2);
  sub_233AC3584();
  return sub_233AC38B4();
}

uint64_t sub_233AA2724()
{
  return sub_233AA6AA4(&qword_2560FDD60, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_233AC3E84);
}

uint64_t sub_233AA2750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493B538]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_233AA27E4()
{
  unint64_t result;

  result = qword_2560FDD70;
  if (!qword_2560FDD70)
  {
    result = MEMORY[0x23493B550](&unk_233AC4960, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FDD70);
  }
  return result;
}

unint64_t sub_233AA2828()
{
  unint64_t result;

  result = qword_2560FDD78;
  if (!qword_2560FDD78)
  {
    result = MEMORY[0x23493B550](&unk_233AC9118, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_2560FDD78);
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_233AA28B4()
{
  unint64_t result;

  result = qword_2560FDD88;
  if (!qword_2560FDD88)
  {
    result = MEMORY[0x23493B550](&unk_233AC4910, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FDD88);
  }
  return result;
}

char *sub_233AA28F8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_233AA2988(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_233AA2914(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_233AA2BA0(a1, a2, a3, *v3, &qword_2560FE188, &qword_2560FE178);
  *v3 = result;
  return result;
}

_QWORD *sub_233AA2940(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_233AA2A80(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_233AA295C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_233AA2BA0(a1, a2, a3, *v3, &qword_2560FE128, &qword_2560FE0F0);
  *v3 = result;
  return result;
}

char *sub_233AA2988(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE1B0);
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

_QWORD *sub_233AA2A80(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE148);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE150);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_233AA2BA0(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4])
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_233AA2CD8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_233AA71E0((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AA2D18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
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
  uint64_t v23;
  _BYTE *v24;
  uint64_t result;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50[2];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v51 = a1;
  v52 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v53 = v8;
  v54 = 0;
  v55 = v11 & v9;
  v56 = a2;
  v57 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_233AA3798((uint64_t)&v48);
  v12 = v49;
  if (!v49)
    goto LABEL_23;
  v13 = v48;
  v46 = v48;
  v47 = v49;
  sub_233AA4660(v50, (uint64_t)v45);
  v14 = (_QWORD *)*a5;
  v16 = sub_233AA346C(v13, v12);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v20 = v15;
  if (v14[3] >= v19)
  {
    if ((a4 & 1) != 0)
    {
      if ((v15 & 1) == 0)
        goto LABEL_15;
    }
    else
    {
      sub_233AA34D0();
      if ((v20 & 1) == 0)
        goto LABEL_15;
    }
LABEL_12:
    sub_233AA45E0();
    v23 = swift_allocError();
    *v24 = 0;
    swift_willThrow();
    v58 = v23;
    MEMORY[0x23493B508](v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE158);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      swift_bridgeObjectRelease();
      sub_233AA71BC();
      swift_release();
      return MEMORY[0x23493B4FC](v58);
    }
    goto LABEL_28;
  }
  sub_233AA3148(v19, a4 & 1);
  v21 = sub_233AA346C(v13, v12);
  if ((v20 & 1) != (v22 & 1))
  {
LABEL_27:
    sub_233AC3854();
    __break(1u);
LABEL_28:
    sub_233AC368C();
    sub_233AC35E4();
    sub_233AC36A4();
    sub_233AC35E4();
    result = sub_233AC36B0();
    __break(1u);
    return result;
  }
  v16 = v21;
  if ((v20 & 1) != 0)
    goto LABEL_12;
LABEL_15:
  v26 = (_QWORD *)*a5;
  *(_QWORD *)(*a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
  v27 = (uint64_t *)(v26[6] + 16 * v16);
  *v27 = v13;
  v27[1] = v12;
  sub_233AA4660(v45, v26[7] + 40 * v16);
  v28 = v26[2];
  v29 = __OFADD__(v28, 1);
  v30 = v28 + 1;
  if (v29)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v26[2] = v30;
  sub_233AA3798((uint64_t)&v48);
  for (i = v49; v49; i = v49)
  {
    v32 = v48;
    v46 = v48;
    v47 = i;
    sub_233AA4660(v50, (uint64_t)v45);
    v33 = (_QWORD *)*a5;
    v34 = sub_233AA346C(v32, i);
    v36 = v33[2];
    v37 = (v35 & 1) == 0;
    v29 = __OFADD__(v36, v37);
    v38 = v36 + v37;
    if (v29)
      goto LABEL_25;
    v39 = v35;
    if (v33[3] < v38)
    {
      sub_233AA3148(v38, 1);
      v34 = sub_233AA346C(v32, i);
      if ((v39 & 1) != (v40 & 1))
        goto LABEL_27;
    }
    if ((v39 & 1) != 0)
      goto LABEL_12;
    v41 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
    v42 = (uint64_t *)(v41[6] + 16 * v34);
    *v42 = v32;
    v42[1] = i;
    sub_233AA4660(v45, v41[7] + 40 * v34);
    v43 = v41[2];
    v29 = __OFADD__(v43, 1);
    v44 = v43 + 1;
    if (v29)
      goto LABEL_26;
    v41[2] = v44;
    sub_233AA3798((uint64_t)&v48);
  }
LABEL_23:
  swift_release();
  swift_bridgeObjectRelease();
  sub_233AA71BC();
  return swift_release();
}

uint64_t sub_233AA3148(uint64_t a1, char a2)
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
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE110);
  v37 = a2;
  v6 = sub_233AC36D4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_233AA4660(v25, (uint64_t)v38);
    }
    else
    {
      sub_233AA71E0((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_233AC3890();
    sub_233AC35D8();
    result = sub_233AC38B4();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_233AA4660(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_233AA346C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_233AC3890();
  sub_233AC35D8();
  v4 = sub_233AC38B4();
  return sub_233AA36B8(a1, a2, v4);
}

void *sub_233AA34D0()
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
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE110);
  v2 = *v0;
  v3 = sub_233AC36C8();
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
    v20 = 40 * v15;
    sub_233AA71E0(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_233AA4660(v26, *(_QWORD *)(v4 + 56) + v20);
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

unint64_t sub_233AA36B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_233AC383C() & 1) == 0)
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
      while (!v14 && (sub_233AC383C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_233AA3798@<X0>(uint64_t a1@<X8>)
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
  uint64_t v22;
  _OWORD v23[3];
  uint64_t v24;
  __int128 v25;
  _OWORD v26[2];
  uint64_t v27;

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
    sub_233AA71E0(*(_QWORD *)(v3 + 56) + 40 * v10, (uint64_t)v26);
    *(_QWORD *)&v25 = v13;
    *((_QWORD *)&v25 + 1) = v12;
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
  v27 = 0;
  memset(v26, 0, sizeof(v26));
  v25 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_233AA7100((uint64_t)&v25, (uint64_t)v23);
  if (*((_QWORD *)&v23[0] + 1))
  {
    v21[0] = v23[0];
    v21[1] = v23[1];
    v21[2] = v23[2];
    v22 = v24;
    v19(v21);
    return sub_233AA731C((uint64_t)v21, &qword_2560FE160);
  }
  else
  {
    *(_QWORD *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t sub_233AA398C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  return sub_233AA3998(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
}

uint64_t sub_233AA3998(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *, uint64_t))
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v14[5];

  v14[3] = a4;
  v14[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v12 = *a3;
  *(_QWORD *)(v12 + 16) = a1 + 1;
  return a6(v14, v12 + 40 * a1 + 32);
}

uint64_t sub_233AA3A1C(uint64_t a1, uint64_t a2)
{
  return sub_233AA3A54(a1, a2, (void (*)(_QWORD *__return_ptr))sub_233A98698);
}

uint64_t sub_233AA3A38(uint64_t a1, uint64_t a2)
{
  return sub_233AA3A54(a1, a2, (void (*)(_QWORD *__return_ptr))sub_233A98648);
}

uint64_t sub_233AA3A54(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *__return_ptr))
{
  uint64_t v3;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t result;
  __int128 v27;
  _OWORD v28[2];
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;

  swift_bridgeObjectRetain();
  sub_233A9A5BC(a1, a2, &qword_2560FE180, a3, &v30);
  if (v3)
  {
    swift_bridgeObjectRelease();
    return a2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  swift_dynamicCast();
  v7 = *(_QWORD *)(v27 + 16);
  swift_bridgeObjectRelease();
  if (v7 != 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  v8 = *(_BYTE *)(v27 + 32);
  v9 = 1 << v8;
  v10 = -1;
  if (1 << v8 < 64)
    v10 = ~(-1 << (1 << v8));
  v11 = v10 & *(_QWORD *)(v27 + 64);
  if (v11)
  {
    v12 = __clz(__rbit64(v11));
LABEL_8:
    v13 = *(_QWORD *)(v27 + 56);
    v14 = (_QWORD *)(*(_QWORD *)(v27 + 48) + 16 * v12);
    v15 = v14[1];
    *(_QWORD *)&v27 = *v14;
    *((_QWORD *)&v27 + 1) = v15;
    sub_233AA71E0(v13 + 40 * v12, (uint64_t)v28);
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
  v16 = v8 & 0x3F;
  if (v16 > 6)
  {
    v17 = *(_QWORD *)(v27 + 72);
    if (v17)
    {
      v18 = 64;
LABEL_12:
      v12 = __clz(__rbit64(v17)) + v18;
      goto LABEL_8;
    }
    if (v16 >= 8)
    {
      v17 = *(_QWORD *)(v27 + 80);
      if (v17)
      {
        v18 = 128;
        goto LABEL_12;
      }
      v17 = *(_QWORD *)(v27 + 88);
      if (v17)
      {
        v18 = 192;
        goto LABEL_12;
      }
      v19 = (unint64_t)(v9 + 63) >> 6;
      if (v19 <= 4)
        v19 = 4;
      v20 = v19 - 4;
      v21 = (unint64_t *)(v27 + 96);
      v18 = 192;
      while (v20)
      {
        v22 = *v21++;
        v17 = v22;
        --v20;
        v18 += 64;
        if (v22)
          goto LABEL_12;
      }
    }
  }
  v29 = 0;
  memset(v28, 0, sizeof(v28));
  v27 = 0u;
LABEL_25:
  sub_233AA7100((uint64_t)&v27, (uint64_t)&v30);
  v23 = v31;
  if (v31)
  {
    v24 = v30;
    sub_233AA4660(&v32, (uint64_t)&v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
    a2 = swift_allocObject();
    v25 = MEMORY[0x24BEE0D00];
    *(_OWORD *)(a2 + 16) = xmmword_233AC3C30;
    *(_QWORD *)(a2 + 56) = v25;
    *(_QWORD *)(a2 + 64) = &off_2504D5278;
    *(_QWORD *)(a2 + 32) = v24;
    *(_QWORD *)(a2 + 40) = v23;
    sub_233AA4660(&v27, a2 + 72);
    swift_bridgeObjectRelease();
    return a2;
  }
LABEL_29:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_233AA3CA0(uint64_t a1, uint64_t a2)
{
  return sub_233AA3D30(a1, a2, &qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A991A0);
}

uint64_t sub_233AA3CC4(uint64_t a1, uint64_t a2)
{
  return sub_233AA3D30(a1, a2, &qword_2560FE198, (void (*)(_QWORD *__return_ptr))sub_233A99150);
}

uint64_t sub_233AA3CE8(uint64_t a1, uint64_t a2)
{
  return sub_233AA3D30(a1, a2, &qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A99240);
}

uint64_t sub_233AA3D0C(uint64_t a1, uint64_t a2)
{
  return sub_233AA3D30(a1, a2, &qword_2560FE190, (void (*)(_QWORD *__return_ptr))sub_233A991F0);
}

uint64_t sub_233AA3D30(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(_QWORD *__return_ptr))
{
  uint64_t v4;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t result;
  __int128 v29;
  _OWORD v30[2];
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __int128 v34;

  swift_bridgeObjectRetain();
  sub_233A9A5BC(a1, a2, a3, a4, &v32);
  if (v4)
  {
    swift_bridgeObjectRelease();
    return a2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  swift_dynamicCast();
  v9 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v9 != 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  v10 = *(_BYTE *)(v29 + 32);
  v11 = 1 << v10;
  v12 = -1;
  if (1 << v10 < 64)
    v12 = ~(-1 << (1 << v10));
  v13 = v12 & *(_QWORD *)(v29 + 64);
  if (v13)
  {
    v14 = __clz(__rbit64(v13));
LABEL_8:
    v15 = *(_QWORD *)(v29 + 56);
    v16 = (_QWORD *)(*(_QWORD *)(v29 + 48) + 16 * v14);
    v17 = v16[1];
    *(_QWORD *)&v29 = *v16;
    *((_QWORD *)&v29 + 1) = v17;
    sub_233AA71E0(v15 + 40 * v14, (uint64_t)v30);
    swift_bridgeObjectRetain();
    goto LABEL_28;
  }
  v18 = v10 & 0x3F;
  if (v18 > 6)
  {
    v19 = *(_QWORD *)(v29 + 72);
    if (v19)
    {
      v20 = 64;
LABEL_12:
      v14 = __clz(__rbit64(v19)) + v20;
      goto LABEL_8;
    }
    if (v18 >= 8)
    {
      v19 = *(_QWORD *)(v29 + 80);
      if (v19)
      {
        v20 = 128;
        goto LABEL_12;
      }
      v19 = *(_QWORD *)(v29 + 88);
      if (v19)
      {
        v20 = 192;
        goto LABEL_12;
      }
      if (v18 >= 9)
      {
        v19 = *(_QWORD *)(v29 + 96);
        if (v19)
        {
          v20 = 256;
          goto LABEL_12;
        }
        v21 = (unint64_t)(v11 + 63) >> 6;
        if (v21 <= 5)
          v21 = 5;
        v22 = v21 - 5;
        v23 = (unint64_t *)(v29 + 104);
        v20 = 256;
        while (v22)
        {
          v24 = *v23++;
          v19 = v24;
          --v22;
          v20 += 64;
          if (v24)
            goto LABEL_12;
        }
      }
    }
  }
  v31 = 0;
  memset(v30, 0, sizeof(v30));
  v29 = 0u;
LABEL_28:
  sub_233AA7100((uint64_t)&v29, (uint64_t)&v32);
  v25 = v33;
  if (v33)
  {
    v26 = v32;
    sub_233AA4660(&v34, (uint64_t)&v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
    a2 = swift_allocObject();
    v27 = MEMORY[0x24BEE0D00];
    *(_OWORD *)(a2 + 16) = xmmword_233AC3C30;
    *(_QWORD *)(a2 + 56) = v27;
    *(_QWORD *)(a2 + 64) = &off_2504D5278;
    *(_QWORD *)(a2 + 32) = v26;
    *(_QWORD *)(a2 + 40) = v25;
    sub_233AA4660(&v29, a2 + 72);
    swift_bridgeObjectRelease();
    return a2;
  }
LABEL_32:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_233AA3F94(uint64_t a1, unsigned __int8 a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE130);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
  *(_QWORD *)(inited + 32) = sub_233AC1BB4(*(_BYTE *)(a1 + 16));
  *(_QWORD *)(inited + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE138);
  v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_233AC3C20;
  *(_QWORD *)(v6 + 32) = sub_233AC1BB4(*(_BYTE *)(a1 + 17));
  *(_QWORD *)(v6 + 40) = v7;
  *(_QWORD *)(v6 + 48) = *(_QWORD *)(a1 + 24);
  swift_retain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_233A9A368(v6, &qword_2560FE170);
  sub_233A9A368(inited, &qword_2560FE168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE140);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  swift_dynamicCast();
  v9 = *(_QWORD *)(v14 + 16);
  result = swift_release();
  if (v9 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE128);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_233AC3C30;
    v12 = sub_233AC1BB4(a2);
    *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v11 + 64) = &off_2504D5278;
    *(_QWORD *)(v11 + 32) = v12;
    *(_QWORD *)(v11 + 40) = v13;
    *(_QWORD *)(v11 + 96) = v8;
    *(_QWORD *)(v11 + 104) = &off_2504D5320;
    *(_QWORD *)(v11 + 72) = v14;
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_233AA4140(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FDD90);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA28B4();
  sub_233AC38C0();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v24 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) == 1684955428 && v7 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_233AA45E0();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_233AC3728();
  v23 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) != 0x7272612D646E6124 || v9 != 0xEA00000000007961)
  {
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  LOBYTE(v29[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_233AC37F4() & 1) == 0)
  {
    sub_233A9A7C8((uint64_t)v30, v29);
    sub_233AA71E0((uint64_t)v29, (uint64_t)v26);
    v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v11 = sub_233ABC314(0, v11[2] + 1, 1, v11);
      v32 = v11;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v32 = sub_233ABC314((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v15 = v27;
    v14 = v28;
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    v25 = &v22;
    MEMORY[0x24BDAC7A8](v16);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_233AA3998(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_233AA459C()
{
  unint64_t result;

  result = qword_2560FDD98;
  if (!qword_2560FDD98)
  {
    result = MEMORY[0x23493B550](&unk_233AC9140, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_2560FDD98);
  }
  return result;
}

unint64_t sub_233AA45E0()
{
  unint64_t result;

  result = qword_2560FDDA0;
  if (!qword_2560FDDA0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintError, &type metadata for ConstraintError);
    atomic_store(result, (unint64_t *)&qword_2560FDDA0);
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

uint64_t sub_233AA4660(__int128 *a1, uint64_t a2)
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

unint64_t sub_233AA4678()
{
  unint64_t result;

  result = qword_2560FDDA8;
  if (!qword_2560FDDA8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_2560FDDA8);
  }
  return result;
}

unint64_t sub_233AA46BC()
{
  unint64_t result;

  result = qword_2560FDDB8;
  if (!qword_2560FDDB8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for CodeDirectoryHash, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FDDB8);
  }
  return result;
}

unint64_t sub_233AA4700()
{
  unint64_t result;

  result = qword_2560FDDC8;
  if (!qword_2560FDDC8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FDDC8);
  }
  return result;
}

unint64_t sub_233AA4744()
{
  unint64_t result;

  result = qword_2560FDDD0;
  if (!qword_2560FDDD0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_2560FDDD0);
  }
  return result;
}

unint64_t sub_233AA4788()
{
  unint64_t result;

  result = qword_2560FDDE8;
  if (!qword_2560FDDE8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FDDE8);
  }
  return result;
}

unint64_t sub_233AA47CC()
{
  unint64_t result;

  result = qword_2560FDDF8;
  if (!qword_2560FDDF8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InTrustCacheWithConstraintCategory, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FDDF8);
  }
  return result;
}

unint64_t sub_233AA4810()
{
  unint64_t result;

  result = qword_2560FDE08;
  if (!qword_2560FDE08)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_2560FDE08);
  }
  return result;
}

unint64_t sub_233AA4854()
{
  unint64_t result;

  result = qword_2560FDE18;
  if (!qword_2560FDE18)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_2560FDE18);
  }
  return result;
}

unint64_t sub_233AA4898()
{
  unint64_t result;

  result = qword_2560FDE28;
  if (!qword_2560FDE28)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnAuthorizedAuthAPFSVolume, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_2560FDE28);
  }
  return result;
}

unint64_t sub_233AA48DC()
{
  unint64_t result;

  result = qword_2560FDE38;
  if (!qword_2560FDE38)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_2560FDE38);
  }
  return result;
}

unint64_t sub_233AA4920()
{
  unint64_t result;

  result = qword_2560FDE48;
  if (!qword_2560FDE48)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FDE48);
  }
  return result;
}

unint64_t sub_233AA4964()
{
  unint64_t result;

  result = qword_2560FDE58;
  if (!qword_2560FDE58)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FDE58);
  }
  return result;
}

unint64_t sub_233AA49A8()
{
  unint64_t result;

  result = qword_2560FDE68;
  if (!qword_2560FDE68)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformIdentifier, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDE68);
  }
  return result;
}

unint64_t sub_233AA49EC()
{
  unint64_t result;

  result = qword_2560FDE78;
  if (!qword_2560FDE78)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for SigningIdentifier, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDE78);
  }
  return result;
}

unint64_t sub_233AA4A30()
{
  unint64_t result;

  result = qword_2560FDE88;
  if (!qword_2560FDE88)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDE88);
  }
  return result;
}

unint64_t sub_233AA4A74()
{
  unint64_t result;

  result = qword_2560FDE98;
  if (!qword_2560FDE98)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifierMatchesCurrentProcess, &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_2560FDE98);
  }
  return result;
}

unint64_t sub_233AA4AB8()
{
  unint64_t result;

  result = qword_2560FDEA8;
  if (!qword_2560FDEA8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FDEA8);
  }
  return result;
}

unint64_t sub_233AA4AFC()
{
  unint64_t result;

  result = qword_2560FDEB8;
  if (!qword_2560FDEB8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FDEB8);
  }
  return result;
}

uint64_t sub_233AA4B40()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

unint64_t sub_233AA4B64()
{
  unint64_t result;

  result = qword_2560FDEC0;
  if (!qword_2560FDEC0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifierMatchesCurrentProcess, &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_2560FDEC0);
  }
  return result;
}

unint64_t sub_233AA4BA8()
{
  unint64_t result;

  result = qword_2560FDEC8;
  if (!qword_2560FDEC8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDEC8);
  }
  return result;
}

unint64_t sub_233AA4BEC()
{
  unint64_t result;

  result = qword_2560FDED0;
  if (!qword_2560FDED0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for SigningIdentifier, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDED0);
  }
  return result;
}

unint64_t sub_233AA4C30()
{
  unint64_t result;

  result = qword_2560FDED8;
  if (!qword_2560FDED8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformIdentifier, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDED8);
  }
  return result;
}

unint64_t sub_233AA4C74()
{
  unint64_t result;

  result = qword_2560FDEE0;
  if (!qword_2560FDEE0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FDEE0);
  }
  return result;
}

unint64_t sub_233AA4CB8()
{
  unint64_t result;

  result = qword_2560FDEE8;
  if (!qword_2560FDEE8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FDEE8);
  }
  return result;
}

unint64_t sub_233AA4CFC()
{
  unint64_t result;

  result = qword_2560FDEF0;
  if (!qword_2560FDEF0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_2560FDEF0);
  }
  return result;
}

unint64_t sub_233AA4D40()
{
  unint64_t result;

  result = qword_2560FDEF8;
  if (!qword_2560FDEF8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnAuthorizedAuthAPFSVolume, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_2560FDEF8);
  }
  return result;
}

unint64_t sub_233AA4D84()
{
  unint64_t result;

  result = qword_2560FDF00;
  if (!qword_2560FDF00)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_2560FDF00);
  }
  return result;
}

unint64_t sub_233AA4DC8()
{
  unint64_t result;

  result = qword_2560FDF08;
  if (!qword_2560FDF08)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_2560FDF08);
  }
  return result;
}

unint64_t sub_233AA4E0C()
{
  unint64_t result;

  result = qword_2560FDF10;
  if (!qword_2560FDF10)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InTrustCacheWithConstraintCategory, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FDF10);
  }
  return result;
}

unint64_t sub_233AA4E50()
{
  unint64_t result;

  result = qword_2560FDF18;
  if (!qword_2560FDF18)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FDF18);
  }
  return result;
}

unint64_t sub_233AA4E94()
{
  unint64_t result;

  result = qword_2560FDF28;
  if (!qword_2560FDF28)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_2560FDF28);
  }
  return result;
}

unint64_t sub_233AA4ED8()
{
  unint64_t result;

  result = qword_2560FDF30;
  if (!qword_2560FDF30)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FDF30);
  }
  return result;
}

unint64_t sub_233AA4F1C()
{
  unint64_t result;

  result = qword_2560FDF38;
  if (!qword_2560FDF38)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for CodeDirectoryHash, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FDF38);
  }
  return result;
}

unint64_t sub_233AA4F60()
{
  unint64_t result;

  result = qword_2560FDF40;
  if (!qword_2560FDF40)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_2560FDF40);
  }
  return result;
}

uint64_t sub_233AA4FA4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FDF70);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA5CFC();
  sub_233AC38C0();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v24 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) == 1684955428 && v7 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_233AA45E0();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_233AC3728();
  v23 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) != 0x7272612D646E6124 || v9 != 0xEA00000000007961)
  {
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  LOBYTE(v29[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_233AC37F4() & 1) == 0)
  {
    sub_233A9B3C0((uint64_t)v30, v29);
    sub_233AA71E0((uint64_t)v29, (uint64_t)v26);
    v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v11 = sub_233ABC41C(0, v11[2] + 1, 1, v11);
      v32 = v11;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v32 = sub_233ABC41C((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v15 = v27;
    v14 = v28;
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    v25 = &v22;
    MEMORY[0x24BDAC7A8](v16);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_233AA3998(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_233AA5400(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE040);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA66A8();
  sub_233AC38C0();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v24 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) == 1684955428 && v7 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_233AA45E0();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_233AC3728();
  v23 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) != 0x7272612D646E6124 || v9 != 0xEA00000000007961)
  {
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  LOBYTE(v29[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_233AC37F4() & 1) == 0)
  {
    sub_233A9BFB8((uint64_t)v30, v29);
    sub_233AA71E0((uint64_t)v29, (uint64_t)v26);
    v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v11 = sub_233ABC430(0, v11[2] + 1, 1, v11);
      v32 = v11;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v32 = sub_233ABC430((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v15 = v27;
    v14 = v28;
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    v25 = &v22;
    MEMORY[0x24BDAC7A8](v16);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_233AA3998(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_233AA585C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FDF48);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA27E4();
  sub_233AC38C0();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v24 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) == 7499556 && v7 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_233AA45E0();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_233AC3728();
  v23 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) != 0x617272612D726F24 || v9 != 0xE900000000000079)
  {
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  LOBYTE(v29[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_233AC37F4() & 1) == 0)
  {
    sub_233A9A7C8((uint64_t)v30, v29);
    sub_233AA71E0((uint64_t)v29, (uint64_t)v26);
    v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v11 = sub_233ABC314(0, v11[2] + 1, 1, v11);
      v32 = v11;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v32 = sub_233ABC314((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v15 = v27;
    v14 = v28;
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    v25 = &v22;
    MEMORY[0x24BDAC7A8](v16);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_233AA3998(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_233AA5CB8()
{
  unint64_t result;

  result = qword_2560FDF58;
  if (!qword_2560FDF58)
  {
    result = MEMORY[0x23493B550](&unk_233AC48C0, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FDF58);
  }
  return result;
}

unint64_t sub_233AA5CFC()
{
  unint64_t result;

  result = qword_2560FDF68;
  if (!qword_2560FDF68)
  {
    result = MEMORY[0x23493B550](&unk_233AC4870, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FDF68);
  }
  return result;
}

unint64_t sub_233AA5D40()
{
  unint64_t result;

  result = qword_2560FDF78;
  if (!qword_2560FDF78)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_2560FDF78);
  }
  return result;
}

unint64_t sub_233AA5D84()
{
  unint64_t result;

  result = qword_2560FDF88;
  if (!qword_2560FDF88)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FDF88);
  }
  return result;
}

unint64_t sub_233AA5DC8()
{
  unint64_t result;

  result = qword_2560FDF90;
  if (!qword_2560FDF90)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDF90);
  }
  return result;
}

unint64_t sub_233AA5E0C()
{
  unint64_t result;

  result = qword_2560FDF98;
  if (!qword_2560FDF98)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for SigningIdentifier, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDF98);
  }
  return result;
}

unint64_t sub_233AA5E50()
{
  unint64_t result;

  result = qword_2560FDFA0;
  if (!qword_2560FDFA0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformIdentifier, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FDFA0);
  }
  return result;
}

unint64_t sub_233AA5E94()
{
  unint64_t result;

  result = qword_2560FDFA8;
  if (!qword_2560FDFA8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FDFA8);
  }
  return result;
}

unint64_t sub_233AA5ED8()
{
  unint64_t result;

  result = qword_2560FDFB0;
  if (!qword_2560FDFB0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FDFB0);
  }
  return result;
}

unint64_t sub_233AA5F1C()
{
  unint64_t result;

  result = qword_2560FDFB8;
  if (!qword_2560FDFB8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_2560FDFB8);
  }
  return result;
}

unint64_t sub_233AA5F60()
{
  unint64_t result;

  result = qword_2560FDFC0;
  if (!qword_2560FDFC0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnAuthorizedAuthAPFSVolume, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_2560FDFC0);
  }
  return result;
}

unint64_t sub_233AA5FA4()
{
  unint64_t result;

  result = qword_2560FDFC8;
  if (!qword_2560FDFC8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_2560FDFC8);
  }
  return result;
}

unint64_t sub_233AA5FE8()
{
  unint64_t result;

  result = qword_2560FDFD0;
  if (!qword_2560FDFD0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_2560FDFD0);
  }
  return result;
}

unint64_t sub_233AA602C()
{
  unint64_t result;

  result = qword_2560FDFD8;
  if (!qword_2560FDFD8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_2560FDFD8);
  }
  return result;
}

unint64_t sub_233AA6070()
{
  unint64_t result;

  result = qword_2560FDFE0;
  if (!qword_2560FDFE0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InTrustCacheWithConstraintCategory, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FDFE0);
  }
  return result;
}

unint64_t sub_233AA60B4()
{
  unint64_t result;

  result = qword_2560FDFE8;
  if (!qword_2560FDFE8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FDFE8);
  }
  return result;
}

unint64_t sub_233AA60F8()
{
  unint64_t result;

  result = qword_2560FDFF8;
  if (!qword_2560FDFF8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_2560FDFF8);
  }
  return result;
}

unint64_t sub_233AA613C()
{
  unint64_t result;

  result = qword_2560FE000;
  if (!qword_2560FE000)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE000);
  }
  return result;
}

unint64_t sub_233AA6180()
{
  unint64_t result;

  result = qword_2560FE008;
  if (!qword_2560FE008)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for CodeDirectoryHash, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FE008);
  }
  return result;
}

unint64_t sub_233AA61C4()
{
  unint64_t result;

  result = qword_2560FE010;
  if (!qword_2560FE010)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_2560FE010);
  }
  return result;
}

uint64_t sub_233AA6208(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE018);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA5CB8();
  sub_233AC38C0();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v24 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) == 7499556 && v7 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_233AA45E0();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_233AC3728();
  v23 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) != 0x617272612D726F24 || v9 != 0xE900000000000079)
  {
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  LOBYTE(v29[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_233AC37F4() & 1) == 0)
  {
    sub_233A9B3C0((uint64_t)v30, v29);
    sub_233AA71E0((uint64_t)v29, (uint64_t)v26);
    v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v11 = sub_233ABC41C(0, v11[2] + 1, 1, v11);
      v32 = v11;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v32 = sub_233ABC41C((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v15 = v27;
    v14 = v28;
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    v25 = &v22;
    MEMORY[0x24BDAC7A8](v16);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_233AA3998(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

unint64_t sub_233AA6664()
{
  unint64_t result;

  result = qword_2560FE028;
  if (!qword_2560FE028)
  {
    result = MEMORY[0x23493B550](&unk_233AC4820, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE028);
  }
  return result;
}

unint64_t sub_233AA66A8()
{
  unint64_t result;

  result = qword_2560FE038;
  if (!qword_2560FE038)
  {
    result = MEMORY[0x23493B550](&unk_233AC47D0, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE038);
  }
  return result;
}

unint64_t sub_233AA66EC()
{
  unint64_t result;

  result = qword_2560FE048;
  if (!qword_2560FE048)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE048);
  }
  return result;
}

unint64_t sub_233AA6730()
{
  unint64_t result;

  result = qword_2560FE050;
  if (!qword_2560FE050)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsMainBinary, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_2560FE050);
  }
  return result;
}

unint64_t sub_233AA6774()
{
  unint64_t result;

  result = qword_2560FE060;
  if (!qword_2560FE060)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FE060);
  }
  return result;
}

unint64_t sub_233AA67B8()
{
  unint64_t result;

  result = qword_2560FE068;
  if (!qword_2560FE068)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FE068);
  }
  return result;
}

unint64_t sub_233AA67FC()
{
  unint64_t result;

  result = qword_2560FE070;
  if (!qword_2560FE070)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for SigningIdentifier, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FE070);
  }
  return result;
}

unint64_t sub_233AA6840()
{
  unint64_t result;

  result = qword_2560FE078;
  if (!qword_2560FE078)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformIdentifier, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FE078);
  }
  return result;
}

unint64_t sub_233AA6884()
{
  unint64_t result;

  result = qword_2560FE080;
  if (!qword_2560FE080)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FE080);
  }
  return result;
}

unint64_t sub_233AA68C8()
{
  unint64_t result;

  result = qword_2560FE088;
  if (!qword_2560FE088)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FE088);
  }
  return result;
}

unint64_t sub_233AA690C()
{
  unint64_t result;

  result = qword_2560FE090;
  if (!qword_2560FE090)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_2560FE090);
  }
  return result;
}

unint64_t sub_233AA6950()
{
  unint64_t result;

  result = qword_2560FE098;
  if (!qword_2560FE098)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnAuthorizedAuthAPFSVolume, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_2560FE098);
  }
  return result;
}

unint64_t sub_233AA6994()
{
  unint64_t result;

  result = qword_2560FE0A0;
  if (!qword_2560FE0A0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_2560FE0A0);
  }
  return result;
}

unint64_t sub_233AA69D8()
{
  unint64_t result;

  result = qword_2560FE0A8;
  if (!qword_2560FE0A8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsMainBinary, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_2560FE0A8);
  }
  return result;
}

unint64_t sub_233AA6A1C()
{
  unint64_t result;

  result = qword_2560FE0B0;
  if (!qword_2560FE0B0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InTrustCacheWithConstraintCategory, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FE0B0);
  }
  return result;
}

unint64_t sub_233AA6A60()
{
  unint64_t result;

  result = qword_2560FE0B8;
  if (!qword_2560FE0B8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FE0B8);
  }
  return result;
}

uint64_t sub_233AA6AA4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23493B550](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_233AA6AE4()
{
  unint64_t result;

  result = qword_2560FE0C8;
  if (!qword_2560FE0C8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_2560FE0C8);
  }
  return result;
}

unint64_t sub_233AA6B28()
{
  unint64_t result;

  result = qword_2560FE0D0;
  if (!qword_2560FE0D0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE0D0);
  }
  return result;
}

uint64_t sub_233AA6B6C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_233AA6B90()
{
  unint64_t result;

  result = qword_2560FE0D8;
  if (!qword_2560FE0D8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for CodeDirectoryHash, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FE0D8);
  }
  return result;
}

unint64_t sub_233AA6BD4()
{
  unint64_t result;

  result = qword_2560FE0E0;
  if (!qword_2560FE0E0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_2560FE0E0);
  }
  return result;
}

uint64_t sub_233AA6C18()
{
  unint64_t v0;

  v0 = sub_233AC36EC();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_233AA6C5C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t *v25;
  _BYTE v26[24];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  _QWORD *v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA6664();
  sub_233AC38C0();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v24 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) == 7499556 && v7 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
LABEL_17:
      sub_233AA45E0();
      swift_allocError();
      *v20 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  LOBYTE(v29[0]) = 1;
  sub_233AC3728();
  v23 = LOBYTE(v30[0]);
  if (sub_233AC1BB4(v30[0]) != 0x617272612D726F24 || v9 != 0xE900000000000079)
  {
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  LOBYTE(v29[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v30, v31);
  while ((sub_233AC37F4() & 1) == 0)
  {
    sub_233A9BFB8((uint64_t)v30, v29);
    sub_233AA71E0((uint64_t)v29, (uint64_t)v26);
    v11 = v32;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v11 = sub_233ABC430(0, v11[2] + 1, 1, v11);
      v32 = v11;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
      v32 = sub_233ABC430((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
    v15 = v27;
    v14 = v28;
    v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    v25 = &v22;
    MEMORY[0x24BDAC7A8](v16);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v18);
    sub_233AA3998(v13, (uint64_t)v18, (uint64_t *)&v32, v15, v14, (uint64_t (*)(uint64_t *, uint64_t))sub_233AA4660);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    __swift_project_boxed_opaque_existential_1(v30, v31);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23 | (v24 << 8);
}

uint64_t sub_233AA70B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233AA7100(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_233AA7148@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7178(a1, a2, sub_233AA3A38, a3);
}

uint64_t sub_233AA7164@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7294(a1, a2, a3);
}

uint64_t sub_233AA7178@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t (*a3)(_QWORD, _QWORD)@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;

  result = a3(*a1, *((_QWORD *)a1 + 1));
  if (v4)
    *a2 = v4;
  else
    *a4 = result;
  return result;
}

uint64_t sub_233AA71BC()
{
  return swift_release();
}

uint64_t sub_233AA71C4@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7178(a1, a2, sub_233AA3A1C, a3);
}

uint64_t sub_233AA71E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_233AA7224@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7178(a1, a2, sub_233AA3D0C, a3);
}

uint64_t sub_233AA7240@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7178(a1, a2, sub_233AA3CE8, a3);
}

uint64_t sub_233AA725C@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7178(a1, a2, sub_233AA3CC4, a3);
}

uint64_t sub_233AA7278@<X0>(unsigned __int16 *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_233AA7178(a1, a2, sub_233AA3CA0, a3);
}

uint64_t sub_233AA7294@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  result = sub_233AA3F94(*a1, *(_BYTE *)(*(_QWORD *)(v3 + 16) + 1));
  if (v4)
    *a2 = v4;
  else
    *a3 = result;
  return result;
}

uint64_t sub_233AA72D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_233AA731C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for OnDiskConstraintConjunction.CodingKeys()
{
  return &type metadata for OnDiskConstraintConjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for OnDiskConstraintDisjunction.CodingKeys()
{
  return &type metadata for OnDiskConstraintDisjunction.CodingKeys;
}

uint64_t sub_233AA7394(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_233AA739C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LaunchConstraintConjunction.CodingKeys()
{
  return &type metadata for LaunchConstraintConjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for LaunchConstraintDisjunction.CodingKeys()
{
  return &type metadata for LaunchConstraintDisjunction.CodingKeys;
}

ValueMetadata *type metadata accessor for ProcessConstraintConjunction.CodingKeys()
{
  return &type metadata for ProcessConstraintConjunction.CodingKeys;
}

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintConjunctionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s27LightweightCodeRequirements27OnDiskConstraintConjunctionV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AA74B0 + 4 * byte_233AC3C45[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233AA74E4 + 4 * byte_233AC3C40[v4]))();
}

uint64_t sub_233AA74E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AA74EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AA74F4);
  return result;
}

uint64_t sub_233AA7500(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AA7508);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233AA750C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AA7514(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ProcessConstraintDisjunction.CodingKeys()
{
  return &type metadata for ProcessConstraintDisjunction.CodingKeys;
}

unint64_t sub_233AA7534()
{
  unint64_t result;

  result = qword_2560FE210;
  if (!qword_2560FE210)
  {
    result = MEMORY[0x23493B550](&unk_233AC42F8, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE210);
  }
  return result;
}

unint64_t sub_233AA757C()
{
  unint64_t result;

  result = qword_2560FE218;
  if (!qword_2560FE218)
  {
    result = MEMORY[0x23493B550](&unk_233AC43E8, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE218);
  }
  return result;
}

unint64_t sub_233AA75C4()
{
  unint64_t result;

  result = qword_2560FE220;
  if (!qword_2560FE220)
  {
    result = MEMORY[0x23493B550](&unk_233AC44D8, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE220);
  }
  return result;
}

unint64_t sub_233AA760C()
{
  unint64_t result;

  result = qword_2560FE228;
  if (!qword_2560FE228)
  {
    result = MEMORY[0x23493B550](&unk_233AC45C8, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE228);
  }
  return result;
}

unint64_t sub_233AA7654()
{
  unint64_t result;

  result = qword_2560FE230;
  if (!qword_2560FE230)
  {
    result = MEMORY[0x23493B550](&unk_233AC46B8, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE230);
  }
  return result;
}

unint64_t sub_233AA769C()
{
  unint64_t result;

  result = qword_2560FE238;
  if (!qword_2560FE238)
  {
    result = MEMORY[0x23493B550](&unk_233AC47A8, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE238);
  }
  return result;
}

unint64_t sub_233AA76E4()
{
  unint64_t result;

  result = qword_2560FE240;
  if (!qword_2560FE240)
  {
    result = MEMORY[0x23493B550](&unk_233AC46E0, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE240);
  }
  return result;
}

unint64_t sub_233AA772C()
{
  unint64_t result;

  result = qword_2560FE248;
  if (!qword_2560FE248)
  {
    result = MEMORY[0x23493B550](&unk_233AC4708, &type metadata for OnDiskConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE248);
  }
  return result;
}

unint64_t sub_233AA7774()
{
  unint64_t result;

  result = qword_2560FE250;
  if (!qword_2560FE250)
  {
    result = MEMORY[0x23493B550](&unk_233AC45F0, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE250);
  }
  return result;
}

unint64_t sub_233AA77BC()
{
  unint64_t result;

  result = qword_2560FE258;
  if (!qword_2560FE258)
  {
    result = MEMORY[0x23493B550](&unk_233AC4618, &type metadata for OnDiskConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE258);
  }
  return result;
}

unint64_t sub_233AA7804()
{
  unint64_t result;

  result = qword_2560FE260;
  if (!qword_2560FE260)
  {
    result = MEMORY[0x23493B550](&unk_233AC4500, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE260);
  }
  return result;
}

unint64_t sub_233AA784C()
{
  unint64_t result;

  result = qword_2560FE268;
  if (!qword_2560FE268)
  {
    result = MEMORY[0x23493B550](&unk_233AC4528, &type metadata for LaunchConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE268);
  }
  return result;
}

unint64_t sub_233AA7894()
{
  unint64_t result;

  result = qword_2560FE270;
  if (!qword_2560FE270)
  {
    result = MEMORY[0x23493B550](&unk_233AC4410, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE270);
  }
  return result;
}

unint64_t sub_233AA78DC()
{
  unint64_t result;

  result = qword_2560FE278;
  if (!qword_2560FE278)
  {
    result = MEMORY[0x23493B550](&unk_233AC4438, &type metadata for LaunchConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE278);
  }
  return result;
}

unint64_t sub_233AA7924()
{
  unint64_t result;

  result = qword_2560FE280;
  if (!qword_2560FE280)
  {
    result = MEMORY[0x23493B550](&unk_233AC4320, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE280);
  }
  return result;
}

unint64_t sub_233AA796C()
{
  unint64_t result;

  result = qword_2560FE288;
  if (!qword_2560FE288)
  {
    result = MEMORY[0x23493B550](&unk_233AC4348, &type metadata for ProcessConstraintConjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE288);
  }
  return result;
}

unint64_t sub_233AA79B4()
{
  unint64_t result;

  result = qword_2560FE290;
  if (!qword_2560FE290)
  {
    result = MEMORY[0x23493B550](&unk_233AC4230, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE290);
  }
  return result;
}

unint64_t sub_233AA79FC()
{
  unint64_t result;

  result = qword_2560FE298;
  if (!qword_2560FE298)
  {
    result = MEMORY[0x23493B550](&unk_233AC4258, &type metadata for ProcessConstraintDisjunction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE298);
  }
  return result;
}

uint64_t sub_233AA7A9C()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12[3];

  v1 = objc_msgSend(v0, sel_dictionary);
  if (v1)
  {
    v2 = v1;
    v3 = sub_233AC35A8();

    v4 = sub_233AC1EF4(v3);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v4 + 16) && (v5 = sub_233AA346C(1936811378, 0xE400000000000000), (v6 & 1) != 0))
    {
      sub_233AA71E0(*(_QWORD *)(v4 + 56) + 40 * v5, (uint64_t)&v9);
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v10 + 1))
      {
        sub_233AA4660(&v9, (uint64_t)v12);
        sub_233AA4660(v12, (uint64_t)&v9);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
        swift_dynamicCast();
        return v8;
      }
    }
    else
    {
      v11 = 0;
      v9 = 0u;
      v10 = 0u;
      swift_bridgeObjectRelease();
    }
    sub_233AA731C((uint64_t)&v9, &qword_2560FE418);
  }
  return MEMORY[0x24BEE4B00];
}

uint64_t sub_233AA7BF4(uint64_t a1, uint64_t a2, void (*a3)(_OWORD *__return_ptr, _QWORD, _QWORD), uint64_t a4, void (*a5)(_OWORD *__return_ptr, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t result;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];

  sub_233AADB30(a1, (uint64_t)v17);
  if (swift_dynamicCast())
  {
    a3(v17, (unsigned __int16)v15, *((_QWORD *)&v15 + 1));
    if (v5)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)a5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE408);
    swift_dynamicCast();
    a5 = (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))v15;
    if (!*(_QWORD *)(v15 + 16) || (v10 = sub_233AA346C(1684955428, 0xE400000000000000), (v11 & 1) == 0))
    {
      memset(v17, 0, 32);
      sub_233AA731C((uint64_t)v17, &qword_2560FE410);
      swift_bridgeObjectRelease();
      return (uint64_t)a5;
    }
    sub_233AADB30(*(_QWORD *)(v15 + 56) + 32 * v10, (uint64_t)v17);
    sub_233AA731C((uint64_t)v17, &qword_2560FE410);
    if (*(_QWORD *)(v15 + 16) && (v12 = sub_233AA346C(1684955428, 0xE400000000000000), (v13 & 1) != 0))
    {
      sub_233AADB30(*(_QWORD *)(v15 + 56) + 32 * v12, (uint64_t)&v15);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    result = swift_bridgeObjectRelease();
    if (*((_QWORD *)&v16 + 1))
    {
      swift_bridgeObjectRelease();
      sub_233AADB6C(&v15, v17);
      swift_dynamicCast();
      return v14;
    }
  }
  else
  {
    sub_233AADB30(a1, (uint64_t)v17);
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      a5(v17, (unsigned __int16)v15, *((_QWORD *)&v15 + 1));
      swift_bridgeObjectRelease();
      if (!v5)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE408);
        swift_dynamicCast();
        return v15;
      }
      return (uint64_t)a5;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_233AA7E54(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  id v11;
  id v12[4];

  v12[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_self();
  sub_233AA8088(a2);
  v5 = (void *)sub_233AC359C();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  v6 = objc_msgSend(v4, sel_withVersion_withConstraintCategory_withRequirements_withError_, 1, a1, v5, v12);

  if (v6)
  {
    v7 = v12[0];
    v8 = objc_msgSend(v6, sel_externalRepresentation);
    v9 = sub_233AC356C();

    return v9;
  }
  else
  {
    v11 = v12[0];
    sub_233AC3554();

    swift_willThrow();
    v12[0] = 0;
    v12[1] = (id)0xE000000000000000;
    sub_233AC368C();
    sub_233AC35E4();
    sub_233AC37A0();
    sub_233AC35E4();
    swift_bridgeObjectRelease();
    sub_233AC35E4();
    sub_233AC35B4();
    sub_233AC35E4();
    swift_bridgeObjectRelease();
    result = sub_233AC36B0();
    __break(1u);
  }
  return result;
}

uint64_t sub_233AA8088(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE400);
    v2 = sub_233AC36E0();
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
    sub_233AADB30(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_233AADB6C(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_233AADB6C(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_233AADB6C(v36, v37);
    sub_233AADB6C(v37, &v33);
    result = sub_233AC3680();
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
    result = (uint64_t)sub_233AADB6C(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_233AA71BC();
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

uint64_t ProcessCodeRequirement.dictionaryEncoding.getter()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5;
  uint64_t v7[4];

  v1 = v0;
  v2 = v0[3];
  v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  v5 = sub_233AA7BF4((uint64_t)v7, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t ProcessCodeRequirement.dataEncoding.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  sub_233AA72D8(v1, *(_QWORD *)(v0 + 48));
  return v1;
}

uint64_t static ProcessCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  ValueMetadata *v12;

  v4 = a1();
  *(_QWORD *)(a2 + 24) = &type metadata for ProcessConstraintConjunction;
  *(_QWORD *)(a2 + 32) = sub_233AA1BE0();
  *(_WORD *)a2 = 5141;
  *(_QWORD *)(a2 + 8) = v4;
  v10 = 5141;
  v12 = &type metadata for ProcessConstraintConjunction;
  v11 = v4;
  swift_bridgeObjectRetain();
  v5 = sub_233AA7BF4((uint64_t)&v10, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a2);
  v7 = sub_233AA7E54(0, v5);
  v9 = v8;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v9;
  return result;
}

uint64_t static ProcessCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  ValueMetadata *v12;

  v4 = a1();
  *(_QWORD *)(a2 + 24) = &type metadata for ProcessConstraintDisjunction;
  *(_QWORD *)(a2 + 32) = sub_233AA1D00();
  *(_WORD *)a2 = 7197;
  *(_QWORD *)(a2 + 8) = v4;
  v10 = 7197;
  v12 = &type metadata for ProcessConstraintDisjunction;
  v11 = v4;
  swift_bridgeObjectRetain();
  v5 = sub_233AA7BF4((uint64_t)&v10, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a2);
  v7 = sub_233AA7E54(0, v5);
  v9 = v8;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v9;
  return result;
}

uint64_t ProcessCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  _BYTE *v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  unsigned __int16 v24;
  uint64_t v25;
  ValueMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_233AA45E0();
    swift_allocError();
    *v5 = 2;
    swift_willThrow();
    return sub_233AA8944(a1);
  }
  sub_233AA71E0(a1 + 24, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = sub_233A9CB1C(v24, v25);
    if (v2)
      return sub_233AA8944(a1);
    v9 = v7;
    v10 = v8;
    v11 = v7 >> 8;
    *((_QWORD *)&v28 + 1) = &type metadata for ProcessConstraintConjunction;
    v12 = sub_233AA1BE0();
    LOBYTE(v27) = v9;
    BYTE1(v27) = v11;
    *(_QWORD *)&v29 = v12;
    *((_QWORD *)&v27 + 1) = v10;
    LOBYTE(v24) = v9;
    HIBYTE(v24) = v11;
    v26 = &type metadata for ProcessConstraintConjunction;
    v25 = v10;
    swift_bridgeObjectRetain();
LABEL_10:
    v19 = sub_233AA7BF4((uint64_t)&v24, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
    v20 = sub_233AA7E54(0, v19);
    v22 = v21;
    swift_bridgeObjectRelease();
    *((_QWORD *)&v29 + 1) = v20;
    *(_QWORD *)(a2 + 48) = v22;
    v23 = v28;
    *(_OWORD *)a2 = v27;
    *(_OWORD *)(a2 + 16) = v23;
    *(_OWORD *)(a2 + 32) = v29;
    return sub_233AA8944(a1);
  }
  sub_233AA71E0(a1 + 24, (uint64_t)&v27);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v13 = sub_233A9D028(v24, v25);
    if (v2)
      return sub_233AA8944(a1);
    v15 = v13;
    v16 = v14;
    v17 = v13 >> 8;
    *((_QWORD *)&v28 + 1) = &type metadata for ProcessConstraintDisjunction;
    v18 = sub_233AA1D00();
    LOBYTE(v27) = v15;
    BYTE1(v27) = v17;
    *(_QWORD *)&v29 = v18;
    *((_QWORD *)&v27 + 1) = v16;
    LOBYTE(v24) = v15;
    HIBYTE(v24) = v17;
    v26 = &type metadata for ProcessConstraintDisjunction;
    v25 = v16;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  unsigned __int16 v24;
  uint64_t v25;
  ValueMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v5 = a1 + 16;
  sub_233AA71E0(a1 + 16, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v6 = sub_233A9D534(v24, v25);
    if (!v2)
    {
      v8 = v6;
      v9 = v7;
      v10 = v6 >> 8;
      *((_QWORD *)&v28 + 1) = &type metadata for ProcessConstraintConjunction;
      v11 = sub_233AA1BE0();
      LOBYTE(v27) = v8;
      BYTE1(v27) = v10;
      *(_QWORD *)&v29 = v11;
      *((_QWORD *)&v27 + 1) = v9;
      LOBYTE(v24) = v8;
      HIBYTE(v24) = v10;
      v26 = &type metadata for ProcessConstraintConjunction;
      v25 = v9;
      swift_bridgeObjectRetain();
LABEL_7:
      v19 = sub_233AA7BF4((uint64_t)&v24, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      v20 = sub_233AA7E54(0, v19);
      v22 = v21;
      swift_bridgeObjectRelease();
      *((_QWORD *)&v29 + 1) = v20;
      *(_QWORD *)(a2 + 48) = v22;
      v23 = v28;
      *(_OWORD *)a2 = v27;
      *(_OWORD *)(a2 + 16) = v23;
      *(_OWORD *)(a2 + 32) = v29;
      return sub_233AA8B98(a1);
    }
    return sub_233AA8B98(a1);
  }
  sub_233AA71E0(v5, (uint64_t)&v27);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v13 = sub_233A9DB4C(v24, v25);
    if (!v2)
    {
      v15 = v13;
      v16 = v14;
      v17 = v13 >> 8;
      *((_QWORD *)&v28 + 1) = &type metadata for ProcessConstraintDisjunction;
      v18 = sub_233AA1D00();
      LOBYTE(v27) = v15;
      BYTE1(v27) = v17;
      *(_QWORD *)&v29 = v18;
      *((_QWORD *)&v27 + 1) = v16;
      LOBYTE(v24) = v15;
      HIBYTE(v24) = v17;
      v26 = &type metadata for ProcessConstraintDisjunction;
      v25 = v16;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_233AA8B98(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int16 v15;
  uint64_t v16;
  ValueMetadata *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];

  v4 = sub_233AC1EF4(a1);
  if (v2)
    return swift_bridgeObjectRelease();
  v5 = v4;
  swift_bridgeObjectRelease();
  sub_233AAFC1C(v5, v21);
  swift_bridgeObjectRelease();
  sub_233AA71E0((uint64_t)v21, (uint64_t)&v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((_QWORD *)&v19 + 1) = &type metadata for ProcessConstraintConjunction;
    v7 = sub_233AA1BE0();
    LOWORD(v18) = v15;
    *(_QWORD *)&v20 = v7;
    *((_QWORD *)&v18 + 1) = v16;
    v17 = &type metadata for ProcessConstraintConjunction;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_233AA71E0((uint64_t)v21, (uint64_t)&v18);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_233AA45E0();
      swift_allocError();
      *v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    }
    *((_QWORD *)&v19 + 1) = &type metadata for ProcessConstraintDisjunction;
    v8 = sub_233AA1D00();
    LOWORD(v18) = v15;
    *(_QWORD *)&v20 = v8;
    *((_QWORD *)&v18 + 1) = v16;
    v17 = &type metadata for ProcessConstraintDisjunction;
    swift_bridgeObjectRetain();
  }
  v9 = sub_233AA7BF4((uint64_t)&v15, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  v11 = sub_233AA7E54(0, v9);
  v13 = v12;
  swift_bridgeObjectRelease();
  *((_QWORD *)&v20 + 1) = v11;
  *(_QWORD *)(a2 + 48) = v13;
  v14 = v19;
  *(_OWORD *)a2 = v18;
  *(_OWORD *)(a2 + 16) = v14;
  *(_OWORD *)(a2 + 32) = v20;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_233AA8944(uint64_t a1)
{
  sub_233AA94E0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  return a1;
}

uint64_t sub_233AA8B98(uint64_t a1)
{
  sub_233AA94E0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return a1;
}

uint64_t sub_233AA8BCC()
{
  return 1;
}

uint64_t sub_233AA8BD8()
{
  return sub_233AC35D8();
}

uint64_t sub_233AA8BF0@<X0>(BOOL *a1@<X8>)
{
  return sub_233AAB710(a1);
}

uint64_t sub_233AA8BFC()
{
  return 0x65756C6176;
}

uint64_t sub_233AA8C10@<X0>(BOOL *a1@<X8>)
{
  return sub_233AAB780(a1);
}

void sub_233AA8C1C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_233AA8C28()
{
  sub_233AA8E14();
  return sub_233AC38D8();
}

uint64_t sub_233AA8C50()
{
  sub_233AA8E14();
  return sub_233AC38E4();
}

uint64_t ProcessCodeRequirement.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE2A0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA8E14();
  sub_233AC38CC();
  sub_233AA71E0(v2, (uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
  if (swift_dynamicCast())
  {
    v12 = v10;
    v13 = v11;
    sub_233AA2160();
LABEL_5:
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  sub_233AA71E0(v2, (uint64_t)&v12);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v12 = v10;
    v13 = v11;
    sub_233AA2454();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

unint64_t sub_233AA8E14()
{
  unint64_t result;

  result = qword_2560FE2A8;
  if (!qword_2560FE2A8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4FC4, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE2A8);
  }
  return result;
}

uint64_t ProcessCodeRequirement.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  _OWORD *v18;
  _BYTE v21[8];
  uint64_t v22;
  ValueMetadata *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD *v31;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE2B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AA8E14();
  sub_233AC38C0();
  if (!v2)
  {
    sub_233AA211C();
    sub_233AC3728();
    v31 = a2;
    v9 = v24;
    v10 = BYTE1(v24);
    v11 = *((_QWORD *)&v24 + 1);
    *((_QWORD *)&v25 + 1) = &type metadata for ProcessConstraintConjunction;
    v12 = sub_233AA1BE0();
    LOBYTE(v24) = v9;
    BYTE1(v24) = v10;
    *(_QWORD *)&v26 = v12;
    *((_QWORD *)&v24 + 1) = v11;
    v21[0] = v9;
    v21[1] = v10;
    v23 = &type metadata for ProcessConstraintConjunction;
    v22 = v11;
    swift_bridgeObjectRetain();
    v13 = sub_233AA7BF4((uint64_t)v21, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    v14 = sub_233AA7E54(0, v13);
    v16 = v15;
    swift_bridgeObjectRelease();
    *((_QWORD *)&v26 + 1) = v14;
    v30 = v16;
    v27 = v24;
    v28 = v25;
    v29 = v26;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v17 = v28;
    v18 = v31;
    *v31 = v27;
    v18[1] = v17;
    v18[2] = v29;
    *((_QWORD *)v18 + 6) = v30;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void ProcessCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int16 v22;
  uint64_t v23;
  ValueMetadata *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _QWORD v29[6];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_233AC3560();
  *(_QWORD *)&v25 = 0;
  v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v25);

  if (!v9)
  {
    v12 = (id)v25;
    sub_233AC3554();

    swift_willThrow();
    sub_233AA94E0(a1, a2);
    return;
  }
  v10 = (id)v25;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    sub_233AA94E0(a1, a2);

    return;
  }
  v11 = sub_233AA7A9C();
  sub_233AAFC1C(v11, v29);
  if (v3)
  {
    sub_233AA94E0(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRelease();
  sub_233AA71E0((uint64_t)v29, (uint64_t)&v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((_QWORD *)&v26 + 1) = &type metadata for ProcessConstraintConjunction;
    v14 = sub_233AA1BE0();
    LOWORD(v25) = v22;
    *(_QWORD *)&v27 = v14;
    *((_QWORD *)&v25 + 1) = v23;
    v24 = &type metadata for ProcessConstraintConjunction;
    swift_bridgeObjectRetain();
    v15 = sub_233AA7BF4((uint64_t)&v22, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
LABEL_12:
    v18 = sub_233AA7E54(0, v15);
    v20 = v19;
    swift_bridgeObjectRelease();
    *((_QWORD *)&v27 + 1) = v18;
    v28 = v20;
    *(_QWORD *)(a3 + 48) = v20;
    v21 = v26;
    *(_OWORD *)a3 = v25;
    *(_OWORD *)(a3 + 16) = v21;
    *(_OWORD *)(a3 + 32) = v27;
    goto LABEL_13;
  }
  sub_233AA71E0((uint64_t)v29, (uint64_t)&v25);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((_QWORD *)&v26 + 1) = &type metadata for ProcessConstraintDisjunction;
    v16 = sub_233AA1D00();
    LOWORD(v25) = v22;
    *(_QWORD *)&v27 = v16;
    *((_QWORD *)&v25 + 1) = v23;
    v24 = &type metadata for ProcessConstraintDisjunction;
    swift_bridgeObjectRetain();
    v15 = sub_233AA7BF4((uint64_t)&v22, (uint64_t)&type metadata for ProcessConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A598, (uint64_t)&type metadata for ProcessConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A574);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_12;
  }
  sub_233AA45E0();
  swift_allocError();
  *v17 = 1;
  swift_willThrow();
LABEL_13:

  sub_233AA94E0(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_233AA94E0(uint64_t a1, unint64_t a2)
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

uint64_t sub_233AA9770@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return ProcessCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_233AA9784(_QWORD *a1)
{
  return ProcessCodeRequirement.encode(to:)(a1);
}

uint64_t LaunchCodeRequirement.dictionaryEncoding.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5;
  uint64_t v7[4];

  v1 = (_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  v5 = sub_233AA7BF4((uint64_t)v7, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t LaunchCodeRequirement.dataEncoding.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_233AA72D8(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

void LaunchCodeRequirement.constraintCategory.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

uint64_t static LaunchCodeRequirement.allOf(constraintCategory:requirement:)@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  ValueMetadata *v15;

  v5 = *a1;
  v6 = a2();
  *(_QWORD *)(a3 + 16) = v5;
  *(_QWORD *)(a3 + 48) = &type metadata for LaunchConstraintConjunction;
  v7 = sub_233AA1C40();
  *(_WORD *)(a3 + 24) = 5141;
  *(_QWORD *)(a3 + 56) = v7;
  *(_QWORD *)(a3 + 32) = v6;
  v13 = 5141;
  v15 = &type metadata for LaunchConstraintConjunction;
  v14 = v6;
  swift_bridgeObjectRetain();
  v8 = sub_233AA7BF4((uint64_t)&v13, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  if (v3)
    return __swift_destroy_boxed_opaque_existential_1(a3 + 24);
  v10 = sub_233AA7E54(v5, v8);
  v12 = v11;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a3 = v10;
  *(_QWORD *)(a3 + 8) = v12;
  return result;
}

uint64_t static LaunchCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  ValueMetadata *v13;

  v4 = a1();
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 48) = &type metadata for LaunchConstraintConjunction;
  v5 = sub_233AA1C40();
  *(_WORD *)(a2 + 24) = 5141;
  *(_QWORD *)(a2 + 56) = v5;
  *(_QWORD *)(a2 + 32) = v4;
  v11 = 5141;
  v13 = &type metadata for LaunchConstraintConjunction;
  v12 = v4;
  swift_bridgeObjectRetain();
  v6 = sub_233AA7BF4((uint64_t)&v11, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a2 + 24);
  v8 = sub_233AA7E54(0, v6);
  v10 = v9;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  return result;
}

uint64_t static LaunchCodeRequirement.anyOf(constraintCategory:requirement:)@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  ValueMetadata *v15;

  v5 = *a1;
  v6 = a2();
  *(_QWORD *)(a3 + 16) = v5;
  *(_QWORD *)(a3 + 48) = &type metadata for LaunchConstraintDisjunction;
  v7 = sub_233AA1D60();
  *(_WORD *)(a3 + 24) = 7197;
  *(_QWORD *)(a3 + 56) = v7;
  *(_QWORD *)(a3 + 32) = v6;
  v13 = 7197;
  v15 = &type metadata for LaunchConstraintDisjunction;
  v14 = v6;
  swift_bridgeObjectRetain();
  v8 = sub_233AA7BF4((uint64_t)&v13, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  if (v3)
    return __swift_destroy_boxed_opaque_existential_1(a3 + 24);
  v10 = sub_233AA7E54(v5, v8);
  v12 = v11;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a3 = v10;
  *(_QWORD *)(a3 + 8) = v12;
  return result;
}

uint64_t static LaunchCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  ValueMetadata *v13;

  v4 = a1();
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 48) = &type metadata for LaunchConstraintDisjunction;
  v5 = sub_233AA1D60();
  *(_WORD *)(a2 + 24) = 7197;
  *(_QWORD *)(a2 + 56) = v5;
  *(_QWORD *)(a2 + 32) = v4;
  v11 = 7197;
  v13 = &type metadata for LaunchConstraintDisjunction;
  v12 = v4;
  swift_bridgeObjectRetain();
  v6 = sub_233AA7BF4((uint64_t)&v11, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a2 + 24);
  v8 = sub_233AA7E54(0, v6);
  v10 = v9;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  return result;
}

uint64_t LaunchCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  unsigned int v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t result;
  unsigned int v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  unsigned __int16 v24;
  uint64_t v25;
  ValueMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  sub_233AA71E0(a1, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v5 = sub_233A9E2B0(v24, v25);
    if (!v2)
    {
      v7 = v5;
      v8 = v6;
      v9 = v5 >> 8;
      *(_QWORD *)&v28 = 0;
      *(_QWORD *)&v30 = &type metadata for LaunchConstraintConjunction;
      v10 = sub_233AA1C40();
      BYTE8(v28) = v7;
      BYTE9(v28) = v9;
      *((_QWORD *)&v30 + 1) = v10;
      *(_QWORD *)&v29 = v8;
      LOBYTE(v24) = v7;
      HIBYTE(v24) = v9;
      v26 = &type metadata for LaunchConstraintConjunction;
      v25 = v8;
      swift_bridgeObjectRetain();
LABEL_7:
      v18 = sub_233AA7BF4((uint64_t)&v24, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      v19 = sub_233AA7E54(0, v18);
      v21 = v20;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v27 = v19;
      *((_QWORD *)&v27 + 1) = v21;
      v22 = v30;
      a2[2] = v29;
      a2[3] = v22;
      v23 = v28;
      *a2 = v27;
      a2[1] = v23;
      return sub_233AACBF4(a1);
    }
    return sub_233AACBF4(a1);
  }
  sub_233AA71E0(a1, (uint64_t)&v27);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v12 = sub_233A9E7BC(v24, v25);
    if (!v2)
    {
      v14 = v12;
      v15 = v13;
      v16 = v12 >> 8;
      *(_QWORD *)&v28 = 0;
      *(_QWORD *)&v30 = &type metadata for LaunchConstraintDisjunction;
      v17 = sub_233AA1D60();
      BYTE8(v28) = v14;
      BYTE9(v28) = v16;
      *((_QWORD *)&v30 + 1) = v17;
      *(_QWORD *)&v29 = v15;
      LOBYTE(v24) = v14;
      HIBYTE(v24) = v16;
      v26 = &type metadata for LaunchConstraintDisjunction;
      v25 = v15;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_233AACBF4(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  unsigned __int16 v25;
  uint64_t v26;
  ValueMetadata *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v5 = a1 + 16;
  sub_233AA71E0(a1 + 16, (uint64_t)&v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v6 = sub_233A9ECC8(v25, v26);
    if (!v2)
    {
      v8 = v6;
      v9 = v7;
      v10 = v6 >> 8;
      *(_QWORD *)&v29 = 0;
      *(_QWORD *)&v31 = &type metadata for LaunchConstraintConjunction;
      v11 = sub_233AA1C40();
      BYTE8(v29) = v8;
      BYTE9(v29) = v10;
      *((_QWORD *)&v31 + 1) = v11;
      *(_QWORD *)&v30 = v9;
      LOBYTE(v25) = v8;
      HIBYTE(v25) = v10;
      v27 = &type metadata for LaunchConstraintConjunction;
      v26 = v9;
      swift_bridgeObjectRetain();
LABEL_7:
      v19 = sub_233AA7BF4((uint64_t)&v25, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
      v20 = sub_233AA7E54(0, v19);
      v22 = v21;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v28 = v20;
      *((_QWORD *)&v28 + 1) = v22;
      v23 = v31;
      a2[2] = v30;
      a2[3] = v23;
      v24 = v29;
      *a2 = v28;
      a2[1] = v24;
      return sub_233AA8B98(a1);
    }
    return sub_233AA8B98(a1);
  }
  sub_233AA71E0(v5, (uint64_t)&v28);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v13 = sub_233A9F2E0(v25, v26);
    if (!v2)
    {
      v15 = v13;
      v16 = v14;
      v17 = v13 >> 8;
      *(_QWORD *)&v29 = 0;
      *(_QWORD *)&v31 = &type metadata for LaunchConstraintDisjunction;
      v18 = sub_233AA1D60();
      BYTE8(v29) = v15;
      BYTE9(v29) = v17;
      *((_QWORD *)&v31 + 1) = v18;
      *(_QWORD *)&v30 = v16;
      LOBYTE(v25) = v15;
      HIBYTE(v25) = v17;
      v27 = &type metadata for LaunchConstraintDisjunction;
      v26 = v16;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_233AA8B98(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int16 v16;
  uint64_t v17;
  ValueMetadata *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];

  v4 = sub_233AC1EF4(a1);
  if (v2)
    return swift_bridgeObjectRelease();
  v5 = v4;
  swift_bridgeObjectRelease();
  sub_233AAFDFC(v5, v23);
  swift_bridgeObjectRelease();
  sub_233AA71E0((uint64_t)v23, (uint64_t)&v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)&v20 = 0;
    *(_QWORD *)&v22 = &type metadata for LaunchConstraintConjunction;
    v7 = sub_233AA1C40();
    WORD4(v20) = v16;
    *((_QWORD *)&v22 + 1) = v7;
    *(_QWORD *)&v21 = v17;
    v18 = &type metadata for LaunchConstraintConjunction;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_233AA71E0((uint64_t)v23, (uint64_t)&v19);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_233AA45E0();
      swift_allocError();
      *v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }
    *(_QWORD *)&v20 = 0;
    *(_QWORD *)&v22 = &type metadata for LaunchConstraintDisjunction;
    v8 = sub_233AA1D60();
    WORD4(v20) = v16;
    *((_QWORD *)&v22 + 1) = v8;
    *(_QWORD *)&v21 = v17;
    v18 = &type metadata for LaunchConstraintDisjunction;
    swift_bridgeObjectRetain();
  }
  v9 = sub_233AA7BF4((uint64_t)&v16, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  v11 = sub_233AA7E54(0, v9);
  v13 = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v19 = v11;
  *((_QWORD *)&v19 + 1) = v13;
  v14 = v22;
  a2[2] = v21;
  a2[3] = v14;
  v15 = v20;
  *a2 = v19;
  a2[1] = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_233AAA078(char *a1, char *a2)
{
  return sub_233AAFB4C(*a1, *a2);
}

uint64_t sub_233AAA084()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AAA104()
{
  sub_233AC35D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AAA160()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AAA1DC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_233AC36EC();
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

void sub_233AAA238(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x65756C6176;
  if (*v1)
    v2 = 0xD000000000000012;
  v3 = 0x8000000233AC9370;
  if (!*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_233AAA278()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0x65756C6176;
}

uint64_t sub_233AAA2B4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_233AC36EC();
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

void sub_233AAA314(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_233AAA320()
{
  sub_233AACC20();
  return sub_233AC38D8();
}

uint64_t sub_233AAA348()
{
  sub_233AACC20();
  return sub_233AC38E4();
}

uint64_t LaunchCodeRequirement.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE2B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AACC20();
  sub_233AC38CC();
  v13 = *(_QWORD *)(v3 + 16);
  LOBYTE(v11) = 1;
  sub_233AACC64();
  sub_233AC377C();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_233AA71E0(v3 + 24, (uint64_t)&v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
  if (swift_dynamicCast())
  {
    LOWORD(v13) = v11;
    v14 = v12;
    LOBYTE(v11) = 0;
    sub_233AA228C();
LABEL_7:
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  sub_233AA71E0(v3 + 24, (uint64_t)&v13);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    LOWORD(v13) = v11;
    v14 = v12;
    LOBYTE(v11) = 0;
    sub_233AA24F0();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t LaunchCodeRequirement.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[8];
  uint64_t v25;
  ValueMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _OWORD *v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE2D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AACC20();
  sub_233AC38C0();
  if (!v2)
  {
    v24[0] = 1;
    sub_233AACCA8();
    sub_233AC3728();
    v10 = v27;
    v24[0] = 0;
    sub_233AA2248();
    sub_233AC3728();
    v35 = a2;
    v11 = v10;
    LOBYTE(v10) = v27;
    v12 = BYTE1(v27);
    v13 = *((_QWORD *)&v27 + 1);
    v23 = v11;
    *(_QWORD *)&v28 = v11;
    *(_QWORD *)&v30 = &type metadata for LaunchConstraintConjunction;
    v14 = sub_233AA1C40();
    BYTE8(v28) = v10;
    BYTE9(v28) = v12;
    *((_QWORD *)&v30 + 1) = v14;
    *(_QWORD *)&v29 = v13;
    v24[0] = v10;
    v24[1] = v12;
    v26 = &type metadata for LaunchConstraintConjunction;
    v25 = v13;
    swift_bridgeObjectRetain();
    v15 = sub_233AA7BF4((uint64_t)v24, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    v16 = sub_233AA7E54(v23, v15);
    v18 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v27 = v16;
    *((_QWORD *)&v27 + 1) = v18;
    v33 = v29;
    v34 = v30;
    v31 = v27;
    v32 = v28;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v19 = v32;
    v20 = v35;
    *v35 = v31;
    v20[1] = v19;
    v21 = v34;
    v20[2] = v33;
    v20[3] = v21;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void LaunchCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  ValueMetadata *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[6];

  v33[5] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_233AC3560();
  *(_QWORD *)&v29 = 0;
  v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v29);

  if (!v9)
  {
    v12 = (id)v29;
    sub_233AC3554();

    swift_willThrow();
    sub_233AA94E0(a1, a2);
    return;
  }
  v10 = (id)v29;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    sub_233AA94E0(a1, a2);

    return;
  }
  v11 = sub_233AA7A9C();
  sub_233AAFDFC(v11, v33);
  if (v3)
  {
    sub_233AA94E0(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v9, sel_constraintCategory);
  v15 = (uint64_t)v14;
  if (v14 && v14 != (id)17 && v14 != (id)255)
    __break(1u);
  sub_233AA71E0((uint64_t)v33, (uint64_t)&v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v25 = v15;
    *(_QWORD *)&v30 = v15;
    *(_QWORD *)&v32 = &type metadata for LaunchConstraintConjunction;
    v16 = sub_233AA1C40();
    WORD4(v30) = v26;
    *((_QWORD *)&v32 + 1) = v16;
    *(_QWORD *)&v31 = v27;
    v28 = &type metadata for LaunchConstraintConjunction;
    swift_bridgeObjectRetain();
    v17 = sub_233AA7BF4((uint64_t)&v26, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
LABEL_15:
    v20 = sub_233AA7E54(v25, v17);
    v22 = v21;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v29 = v20;
    *((_QWORD *)&v29 + 1) = v22;
    v23 = v32;
    a3[2] = v31;
    a3[3] = v23;
    v24 = v30;
    *a3 = v29;
    a3[1] = v24;
    goto LABEL_16;
  }
  sub_233AA71E0((uint64_t)v33, (uint64_t)&v29);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v25 = v15;
    *(_QWORD *)&v30 = v15;
    *(_QWORD *)&v32 = &type metadata for LaunchConstraintDisjunction;
    v18 = sub_233AA1D60();
    WORD4(v30) = v26;
    *((_QWORD *)&v32 + 1) = v18;
    *(_QWORD *)&v31 = v27;
    v28 = &type metadata for LaunchConstraintDisjunction;
    swift_bridgeObjectRetain();
    v17 = sub_233AA7BF4((uint64_t)&v26, (uint64_t)&type metadata for LaunchConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A7A4, (uint64_t)&type metadata for LaunchConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A780);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
    goto LABEL_15;
  }
  sub_233AA45E0();
  swift_allocError();
  *v19 = 1;
  swift_willThrow();
LABEL_16:

  sub_233AA94E0(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

uint64_t sub_233AAAF18@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return LaunchCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_233AAAF2C(_QWORD *a1)
{
  return LaunchCodeRequirement.encode(to:)(a1);
}

uint64_t OnDiskCodeRequirement.dictionaryEncoding.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5;
  uint64_t v7[4];

  v1 = (_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = __swift_project_boxed_opaque_existential_1(v1, v2);
  v7[3] = v2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  v5 = sub_233AA7BF4((uint64_t)v7, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t OnDiskCodeRequirement.dataEncoding.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_233AA72D8(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t static OnDiskCodeRequirement.allOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  ValueMetadata *v13;

  v4 = a1();
  *(_QWORD *)(a2 + 40) = &type metadata for OnDiskConstraintConjunction;
  v5 = sub_233AA1CA0();
  *(_WORD *)(a2 + 16) = 5141;
  *(_QWORD *)(a2 + 48) = v5;
  *(_QWORD *)(a2 + 24) = v4;
  v11 = 5141;
  v13 = &type metadata for OnDiskConstraintConjunction;
  v12 = v4;
  swift_bridgeObjectRetain();
  v6 = sub_233AA7BF4((uint64_t)&v11, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a2 + 16);
  v8 = sub_233AA7E54(0, v6);
  v10 = v9;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  return result;
}

uint64_t static OnDiskCodeRequirement.anyOf(requirement:)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  ValueMetadata *v13;

  v4 = a1();
  *(_QWORD *)(a2 + 40) = &type metadata for OnDiskConstraintDisjunction;
  v5 = sub_233AA1E20();
  *(_WORD *)(a2 + 16) = 7197;
  *(_QWORD *)(a2 + 48) = v5;
  *(_QWORD *)(a2 + 24) = v4;
  v11 = 7197;
  v13 = &type metadata for OnDiskConstraintDisjunction;
  v12 = v4;
  swift_bridgeObjectRetain();
  v6 = sub_233AA7BF4((uint64_t)&v11, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v11);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a2 + 16);
  v8 = sub_233AA7E54(0, v6);
  v10 = v9;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  return result;
}

uint64_t OnDiskCodeRequirement.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned int v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t result;
  unsigned int v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  unsigned __int16 v24;
  uint64_t v25;
  ValueMetadata *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;

  sub_233AA71E0(a1, (uint64_t)&v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE180);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v5 = sub_233AA0704(v24, v25);
    if (!v2)
    {
      v7 = v5;
      v8 = v6;
      v9 = v5 >> 8;
      *((_QWORD *)&v29 + 1) = &type metadata for OnDiskConstraintConjunction;
      v10 = sub_233AA1CA0();
      LOBYTE(v28) = v7;
      BYTE1(v28) = v9;
      v30 = v10;
      *((_QWORD *)&v28 + 1) = v8;
      LOBYTE(v24) = v7;
      HIBYTE(v24) = v9;
      v26 = &type metadata for OnDiskConstraintConjunction;
      v25 = v8;
      swift_bridgeObjectRetain();
LABEL_7:
      v18 = sub_233AA7BF4((uint64_t)&v24, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
      v19 = sub_233AA7E54(0, v18);
      v21 = v20;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v27 = v19;
      *((_QWORD *)&v27 + 1) = v21;
      v22 = v29;
      *(_QWORD *)(a2 + 48) = v30;
      v23 = v27;
      *(_OWORD *)(a2 + 16) = v28;
      *(_OWORD *)(a2 + 32) = v22;
      *(_OWORD *)a2 = v23;
      return sub_233AACBF4(a1);
    }
    return sub_233AACBF4(a1);
  }
  sub_233AA71E0(a1, (uint64_t)&v27);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v12 = sub_233AA0D1C(v24, v25);
    if (!v2)
    {
      v14 = v12;
      v15 = v13;
      v16 = v12 >> 8;
      *((_QWORD *)&v29 + 1) = &type metadata for OnDiskConstraintDisjunction;
      v17 = sub_233AA1E20();
      LOBYTE(v28) = v14;
      BYTE1(v28) = v16;
      v30 = v17;
      *((_QWORD *)&v28 + 1) = v15;
      LOBYTE(v24) = v14;
      HIBYTE(v24) = v16;
      v26 = &type metadata for OnDiskConstraintDisjunction;
      v25 = v15;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    }
    return sub_233AACBF4(a1);
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  _BYTE *v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  unsigned __int16 v25;
  uint64_t v26;
  ValueMetadata *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_233AA45E0();
    swift_allocError();
    *v5 = 2;
    swift_willThrow();
    return sub_233AA8944(a1);
  }
  sub_233AA71E0(a1 + 24, (uint64_t)&v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = sub_233A9FAD4(v25, v26);
    if (v2)
      return sub_233AA8944(a1);
    v9 = v7;
    v10 = v8;
    v11 = v7 >> 8;
    *((_QWORD *)&v30 + 1) = &type metadata for OnDiskConstraintConjunction;
    v12 = sub_233AA1CA0();
    LOBYTE(v29) = v9;
    BYTE1(v29) = v11;
    v31 = v12;
    *((_QWORD *)&v29 + 1) = v10;
    LOBYTE(v25) = v9;
    HIBYTE(v25) = v11;
    v27 = &type metadata for OnDiskConstraintConjunction;
    v26 = v10;
    swift_bridgeObjectRetain();
LABEL_10:
    v19 = sub_233AA7BF4((uint64_t)&v25, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    v20 = sub_233AA7E54(0, v19);
    v22 = v21;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v28 = v20;
    *((_QWORD *)&v28 + 1) = v22;
    v23 = v30;
    *(_QWORD *)(a2 + 48) = v31;
    v24 = v28;
    *(_OWORD *)(a2 + 16) = v29;
    *(_OWORD *)(a2 + 32) = v23;
    *(_OWORD *)a2 = v24;
    return sub_233AA8944(a1);
  }
  sub_233AA71E0(a1 + 24, (uint64_t)&v28);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v13 = sub_233AA00EC(v25, v26);
    if (v2)
      return sub_233AA8944(a1);
    v15 = v13;
    v16 = v14;
    v17 = v13 >> 8;
    *((_QWORD *)&v30 + 1) = &type metadata for OnDiskConstraintDisjunction;
    v18 = sub_233AA1E20();
    LOBYTE(v29) = v15;
    BYTE1(v29) = v17;
    v31 = v18;
    *((_QWORD *)&v29 + 1) = v16;
    LOBYTE(v25) = v15;
    HIBYTE(v25) = v17;
    v27 = &type metadata for OnDiskConstraintDisjunction;
    v26 = v16;
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int16 v16;
  uint64_t v17;
  ValueMetadata *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  _QWORD v23[5];

  v4 = sub_233AC1EF4(a1);
  if (v2)
    return swift_bridgeObjectRelease();
  v5 = v4;
  swift_bridgeObjectRelease();
  sub_233AAFFDC(v5, v23);
  swift_bridgeObjectRelease();
  sub_233AA71E0((uint64_t)v23, (uint64_t)&v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((_QWORD *)&v21 + 1) = &type metadata for OnDiskConstraintConjunction;
    v7 = sub_233AA1CA0();
    LOWORD(v20) = v16;
    v22 = v7;
    *((_QWORD *)&v20 + 1) = v17;
    v18 = &type metadata for OnDiskConstraintConjunction;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_233AA71E0((uint64_t)v23, (uint64_t)&v19);
    if ((swift_dynamicCast() & 1) == 0)
    {
      sub_233AA45E0();
      swift_allocError();
      *v10 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    }
    *((_QWORD *)&v21 + 1) = &type metadata for OnDiskConstraintDisjunction;
    v8 = sub_233AA1E20();
    LOWORD(v20) = v16;
    v22 = v8;
    *((_QWORD *)&v20 + 1) = v17;
    v18 = &type metadata for OnDiskConstraintDisjunction;
    swift_bridgeObjectRetain();
  }
  v9 = sub_233AA7BF4((uint64_t)&v16, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  v11 = sub_233AA7E54(0, v9);
  v13 = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v19 = v11;
  *((_QWORD *)&v19 + 1) = v13;
  v14 = v21;
  *(_QWORD *)(a2 + 48) = v22;
  v15 = v19;
  *(_OWORD *)(a2 + 16) = v20;
  *(_OWORD *)(a2 + 32) = v14;
  *(_OWORD *)a2 = v15;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
}

uint64_t sub_233AAB670()
{
  sub_233AC3890();
  sub_233AC35D8();
  return sub_233AC38B4();
}

uint64_t sub_233AAB6BC()
{
  sub_233AC3890();
  sub_233AC35D8();
  return sub_233AC38B4();
}

uint64_t sub_233AAB704@<X0>(BOOL *a1@<X8>)
{
  return sub_233AAB710(a1);
}

uint64_t sub_233AAB710@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_233AC36EC();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_233AAB75C(_QWORD *a1@<X8>)
{
  *a1 = 0x65756C6176;
  a1[1] = 0xE500000000000000;
}

uint64_t sub_233AAB774@<X0>(BOOL *a1@<X8>)
{
  return sub_233AAB780(a1);
}

uint64_t sub_233AAB780@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_233AC36EC();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_233AAB7D0()
{
  sub_233AACCEC();
  return sub_233AC38D8();
}

uint64_t sub_233AAB7F8()
{
  sub_233AACCEC();
  return sub_233AC38E4();
}

uint64_t OnDiskCodeRequirement.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE2E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AACCEC();
  sub_233AC38CC();
  sub_233AA71E0(v2 + 16, (uint64_t)&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
  if (swift_dynamicCast())
  {
    v12 = v10;
    v13 = v11;
    sub_233AA23B8();
LABEL_5:
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return swift_bridgeObjectRelease();
  }
  sub_233AA71E0(v2 + 16, (uint64_t)&v12);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v12 = v10;
    v13 = v11;
    sub_233AA258C();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t OnDiskCodeRequirement.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  _OWORD *v18;
  _BYTE v21[8];
  uint64_t v22;
  ValueMetadata *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  _OWORD *v32;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE2F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233AACCEC();
  sub_233AC38C0();
  if (!v2)
  {
    sub_233AA2374();
    sub_233AC3728();
    v32 = a2;
    v9 = v24;
    v10 = BYTE1(v24);
    v11 = *((_QWORD *)&v24 + 1);
    *((_QWORD *)&v26 + 1) = &type metadata for OnDiskConstraintConjunction;
    v12 = sub_233AA1CA0();
    LOBYTE(v25) = v9;
    BYTE1(v25) = v10;
    v27 = v12;
    *((_QWORD *)&v25 + 1) = v11;
    v21[0] = v9;
    v21[1] = v10;
    v23 = &type metadata for OnDiskConstraintConjunction;
    v22 = v11;
    swift_bridgeObjectRetain();
    v13 = sub_233AA7BF4((uint64_t)v21, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    v14 = sub_233AA7E54(0, v13);
    v16 = v15;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v24 = v14;
    *((_QWORD *)&v24 + 1) = v16;
    v31 = v27;
    v29 = v25;
    v30 = v26;
    v28 = v24;
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v17 = v29;
    v18 = v32;
    *v32 = v28;
    v18[1] = v17;
    v18[2] = v30;
    *((_QWORD *)v18 + 6) = v31;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void OnDiskCodeRequirement.init(_:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int16 v23;
  uint64_t v24;
  ValueMetadata *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_233AC3560();
  *(_QWORD *)&v26 = 0;
  v9 = objc_msgSend(v7, sel_withData_withError_, v8, &v26);

  if (!v9)
  {
    v12 = (id)v26;
    sub_233AC3554();

    swift_willThrow();
    sub_233AA94E0(a1, a2);
    return;
  }
  v10 = (id)v26;
  if (!objc_msgSend(v9, sel_hasRequirements))
  {
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    sub_233AA94E0(a1, a2);

    return;
  }
  v11 = sub_233AA7A9C();
  sub_233AAFFDC(v11, v30);
  if (v3)
  {
    sub_233AA94E0(a1, a2);
    swift_bridgeObjectRelease();

    return;
  }
  swift_bridgeObjectRelease();
  sub_233AA71E0((uint64_t)v30, (uint64_t)&v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE198);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((_QWORD *)&v28 + 1) = &type metadata for OnDiskConstraintConjunction;
    v14 = sub_233AA1CA0();
    LOWORD(v27) = v23;
    v29 = v14;
    *((_QWORD *)&v27 + 1) = v24;
    v25 = &type metadata for OnDiskConstraintConjunction;
    swift_bridgeObjectRetain();
    v15 = sub_233AA7BF4((uint64_t)&v23, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
LABEL_12:
    v18 = sub_233AA7E54(0, v15);
    v20 = v19;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v26 = v18;
    *((_QWORD *)&v26 + 1) = v20;
    v21 = v28;
    *(_QWORD *)(a3 + 48) = v29;
    v22 = v26;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = v21;
    *(_OWORD *)a3 = v22;
    goto LABEL_13;
  }
  sub_233AA71E0((uint64_t)v30, (uint64_t)&v26);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *((_QWORD *)&v28 + 1) = &type metadata for OnDiskConstraintDisjunction;
    v16 = sub_233AA1E20();
    LOWORD(v27) = v23;
    v29 = v16;
    *((_QWORD *)&v27 + 1) = v24;
    v25 = &type metadata for OnDiskConstraintDisjunction;
    swift_bridgeObjectRetain();
    v15 = sub_233AA7BF4((uint64_t)&v23, (uint64_t)&type metadata for OnDiskConstraintConjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A75C, (uint64_t)&type metadata for OnDiskConstraintDisjunction, (void (*)(_OWORD *__return_ptr, _QWORD, _QWORD))sub_233A9A738);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    goto LABEL_12;
  }
  sub_233AA45E0();
  swift_allocError();
  *v17 = 1;
  swift_willThrow();
LABEL_13:

  sub_233AA94E0(a1, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
}

uint64_t sub_233AAC2C4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnDiskCodeRequirement.init(from:)(a1, a2);
}

uint64_t sub_233AAC2D8(_QWORD *a1)
{
  return OnDiskCodeRequirement.encode(to:)(a1);
}

void sub_233AAC2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_233AAC354(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x233AAC538);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_233AAC55C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_233AAC5B8()
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
  sub_233AAC2F4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_233AA94E0(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_233AAC780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_233AC3530();
  v11 = result;
  if (result)
  {
    result = sub_233AC3548();
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
  v14 = sub_233AC353C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_233AAC2F4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void _s27LightweightCodeRequirements06LaunchB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_233AAC870()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_233AAC8A4 + dword_233AAC964[v0 >> 62]))();
}

uint64_t sub_233AAC8B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_233AA72D8(v3, v4);
      sub_233AAC55C(v1, v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void _s27LightweightCodeRequirements06OnDiskB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_233AAC9B0()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_233AAC9E4 + dword_233AACAA4[v0 >> 62]))();
}

uint64_t sub_233AAC9F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_233AA72D8(v3, v4);
      sub_233AAC55C(v1, v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void _s27LightweightCodeRequirements07ProcessB11RequirementV2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_233AACAF0()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_233AACB24 + dword_233AACBE4[v0 >> 62]))();
}

uint64_t sub_233AACB34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;

  if (a1 == BYTE6(v4))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_233AA72D8(v3, v4);
      sub_233AAC55C(v1, v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_233AACBF4(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  sub_233AA94E0(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return a1;
}

unint64_t sub_233AACC20()
{
  unint64_t result;

  result = qword_2560FE2C0;
  if (!qword_2560FE2C0)
  {
    result = MEMORY[0x23493B550](&unk_233AC4F74, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE2C0);
  }
  return result;
}

unint64_t sub_233AACC64()
{
  unint64_t result;

  result = qword_2560FE2C8;
  if (!qword_2560FE2C8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintCategory, &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FE2C8);
  }
  return result;
}

unint64_t sub_233AACCA8()
{
  unint64_t result;

  result = qword_2560FE2D8;
  if (!qword_2560FE2D8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintCategory, &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FE2D8);
  }
  return result;
}

unint64_t sub_233AACCEC()
{
  unint64_t result;

  result = qword_2560FE2E8;
  if (!qword_2560FE2E8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4F24, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE2E8);
  }
  return result;
}

unint64_t sub_233AACD34()
{
  unint64_t result;

  result = qword_2560FE2F8;
  if (!qword_2560FE2F8)
  {
    result = MEMORY[0x23493B550](&unk_233AC3F54, &type metadata for ProcessConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FE2F8);
  }
  return result;
}

unint64_t sub_233AACD7C()
{
  unint64_t result;

  result = qword_2560FE300;
  if (!qword_2560FE300)
  {
    result = MEMORY[0x23493B550](&unk_233AC3F38, &type metadata for ProcessConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FE300);
  }
  return result;
}

unint64_t sub_233AACDC4()
{
  unint64_t result;

  result = qword_2560FE338;
  if (!qword_2560FE338)
  {
    result = MEMORY[0x23493B550](&unk_233AC3F1C, &type metadata for LaunchConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FE338);
  }
  return result;
}

unint64_t sub_233AACE0C()
{
  unint64_t result;

  result = qword_2560FE340;
  if (!qword_2560FE340)
  {
    result = MEMORY[0x23493B550](&unk_233AC3F00, &type metadata for LaunchConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FE340);
  }
  return result;
}

unint64_t sub_233AACE54()
{
  unint64_t result;

  result = qword_2560FE378;
  if (!qword_2560FE378)
  {
    result = MEMORY[0x23493B550](&unk_233AC3EE4, &type metadata for OnDiskConstraintConjunction);
    atomic_store(result, (unint64_t *)&qword_2560FE378);
  }
  return result;
}

unint64_t sub_233AACE9C()
{
  unint64_t result;

  result = qword_2560FE380;
  if (!qword_2560FE380)
  {
    result = MEMORY[0x23493B550](&unk_233AC3EC8, &type metadata for OnDiskConstraintDisjunction);
    atomic_store(result, (unint64_t *)&qword_2560FE380);
  }
  return result;
}

uint64_t destroy for ProcessCodeRequirement(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return sub_233AA94E0(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t initializeWithCopy for ProcessCodeRequirement(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  unint64_t v5;
  uint64_t v6;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v6 = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  sub_233AA72D8(v6, v5);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v5;
  return a1;
}

uint64_t *assignWithCopy for ProcessCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v5 = a2[5];
  v4 = a2[6];
  sub_233AA72D8(v5, v4);
  v6 = a1[5];
  v7 = a1[6];
  a1[5] = v5;
  a1[6] = v4;
  sub_233AA94E0(v6, v7);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ProcessCodeRequirement(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  unint64_t v6;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_233AA94E0(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessCodeRequirement(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeRequirement()
{
  return &type metadata for ProcessCodeRequirement;
}

uint64_t initializeBufferWithCopyOfBuffer for LaunchCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LaunchCodeRequirement(uint64_t a1)
{
  sub_233AA94E0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return __swift_destroy_boxed_opaque_existential_1(a1 + 24);
}

uint64_t initializeWithCopy for LaunchCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_233AA72D8(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 24, a2 + 24);
  return a1;
}

uint64_t *assignWithCopy for LaunchCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_233AA72D8(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_233AA94E0(v6, v7);
  a1[2] = a2[2];
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LaunchCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_233AA94E0(v4, v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for LaunchCodeRequirement(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeRequirement()
{
  return &type metadata for LaunchCodeRequirement;
}

uint64_t destroy for OnDiskCodeRequirement(uint64_t a1)
{
  sub_233AA94E0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for OnDiskCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_233AA72D8(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  return a1;
}

uint64_t *assignWithCopy for OnDiskCodeRequirement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_233AA72D8(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_233AA94E0(v6, v7);
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t assignWithTake for OnDiskCodeRequirement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_233AA94E0(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OnDiskCodeRequirement(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OnDiskCodeRequirement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnDiskCodeRequirement()
{
  return &type metadata for OnDiskCodeRequirement;
}

uint64_t sub_233AAD63C()
{
  return 0;
}

ValueMetadata *type metadata accessor for OnDiskCodeRequirement.CodingKeys()
{
  return &type metadata for OnDiskCodeRequirement.CodingKeys;
}

uint64_t getEnumTagSinglePayload for LaunchCodeRequirement.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LaunchCodeRequirement.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AAD730 + 4 * byte_233AC49C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_233AAD764 + 4 * byte_233AC49C0[v4]))();
}

uint64_t sub_233AAD764(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AAD76C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AAD774);
  return result;
}

uint64_t sub_233AAD780(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AAD788);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_233AAD78C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AAD794(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_233AAD7A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchCodeRequirement.CodingKeys()
{
  return &type metadata for LaunchCodeRequirement.CodingKeys;
}

uint64_t _s27LightweightCodeRequirements21OnDiskCodeRequirementV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s27LightweightCodeRequirements21OnDiskCodeRequirementV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_233AAD84C + 4 * byte_233AC49CA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_233AAD86C + 4 * byte_233AC49CF[v4]))();
}

_BYTE *sub_233AAD84C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_233AAD86C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233AAD874(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233AAD87C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233AAD884(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233AAD88C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeRequirement.CodingKeys()
{
  return &type metadata for ProcessCodeRequirement.CodingKeys;
}

unint64_t sub_233AAD8AC()
{
  unint64_t result;

  result = qword_2560FE3B8;
  if (!qword_2560FE3B8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4D1C, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3B8);
  }
  return result;
}

unint64_t sub_233AAD8F4()
{
  unint64_t result;

  result = qword_2560FE3C0;
  if (!qword_2560FE3C0)
  {
    result = MEMORY[0x23493B550](&unk_233AC4E0C, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3C0);
  }
  return result;
}

unint64_t sub_233AAD93C()
{
  unint64_t result;

  result = qword_2560FE3C8;
  if (!qword_2560FE3C8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4EFC, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3C8);
  }
  return result;
}

unint64_t sub_233AAD984()
{
  unint64_t result;

  result = qword_2560FE3D0;
  if (!qword_2560FE3D0)
  {
    result = MEMORY[0x23493B550](&unk_233AC4E34, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3D0);
  }
  return result;
}

unint64_t sub_233AAD9CC()
{
  unint64_t result;

  result = qword_2560FE3D8;
  if (!qword_2560FE3D8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4E5C, &type metadata for OnDiskCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3D8);
  }
  return result;
}

unint64_t sub_233AADA14()
{
  unint64_t result;

  result = qword_2560FE3E0;
  if (!qword_2560FE3E0)
  {
    result = MEMORY[0x23493B550](&unk_233AC4D44, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3E0);
  }
  return result;
}

unint64_t sub_233AADA5C()
{
  unint64_t result;

  result = qword_2560FE3E8;
  if (!qword_2560FE3E8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4D6C, &type metadata for LaunchCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3E8);
  }
  return result;
}

unint64_t sub_233AADAA4()
{
  unint64_t result;

  result = qword_2560FE3F0;
  if (!qword_2560FE3F0)
  {
    result = MEMORY[0x23493B550](&unk_233AC4C54, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3F0);
  }
  return result;
}

unint64_t sub_233AADAEC()
{
  unint64_t result;

  result = qword_2560FE3F8;
  if (!qword_2560FE3F8)
  {
    result = MEMORY[0x23493B550](&unk_233AC4C7C, &type metadata for ProcessCodeRequirement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE3F8);
  }
  return result;
}

uint64_t sub_233AADB30(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_233AADB6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_233AADB84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v5;
  char v6;
  uint64_t v7;
  _QWORD v8[2];
  _BYTE v9[40];

  result = sub_233AC1154(a1);
  if ((v6 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
    *(_QWORD *)(a2 + 48) = 0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  else
  {
    v8[0] = sub_233AC11DC((uint64_t)v9, result, v5, 0, a1);
    v8[1] = v7;
    *(_QWORD *)a2 = v8[0];
    *(_QWORD *)(a2 + 8) = v7;
    sub_233AA71E0((uint64_t)v9, a2 + 16);
    swift_bridgeObjectRetain();
    return sub_233AC1610((uint64_t)v8);
  }
  return result;
}

_QWORD *sub_233AADC48(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_233AC1154(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_233AC126C(&v5, (uint64_t)result, v3, 0, a1);
}

uint64_t sub_233AADCD0(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *), uint64_t *a3, uint64_t *a4, void (*a5)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t result;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  _QWORD *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _BYTE *v47;
  int64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  int64_t v52;
  _OWORD *v53;
  __int128 *v54;
  void (*v55)(unint64_t, char *, _QWORD **, uint64_t, uint64_t);
  void (*v56)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *);
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  _OWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;

  v55 = a5;
  v50 = a3;
  v56 = a2;
  v68 = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_233AA71E0(a1, (uint64_t)&v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  result = swift_dynamicCast();
  if (!(_DWORD)result)
  {
    sub_233AA71E0(a1, (uint64_t)&v63);
    v54 = (__int128 *)__swift_instantiateConcreteTypeFromMangledName(&qword_2560FE150);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v49 = a4;
      v34 = *(_QWORD *)(v60 + 16);
      if (v34)
      {
        v53 = (_OWORD *)v60;
        v35 = v60 + 32;
        while (1)
        {
          sub_233AA71E0(v35, (uint64_t)&v63);
          if (!swift_dynamicCast())
            goto LABEL_54;
          v36 = v60;
          if (*(_QWORD *)(v60 + 16) != 2
            || (sub_233AA71E0(v60 + 32, (uint64_t)&v63), result = swift_dynamicCast(), (result & 1) == 0))
          {
            swift_bridgeObjectRelease();
LABEL_54:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_233AA45E0();
            swift_allocError();
            *v47 = 1;
            return swift_willThrow();
          }
          if (*(_QWORD *)(v36 + 16) < 2uLL)
            goto LABEL_59;
          v37 = v60;
          sub_233AA71E0(v36 + 72, (uint64_t)&v60);
          swift_bridgeObjectRelease();
          v56(&v63, v37, *((_QWORD *)&v37 + 1), &v60);
          if (v5)
            break;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
          swift_bridgeObjectRelease();
          v38 = v68;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            v38 = sub_233ABC8B4(0, v38[2] + 1, 1, v38, v50, v49);
            v68 = v38;
          }
          v40 = v38[2];
          v39 = v38[3];
          if (v40 >= v39 >> 1)
            v68 = sub_233ABC8B4((_QWORD *)(v39 > 1), v40 + 1, 1, v38, v50, v49);
          v41 = v66;
          v42 = v67;
          v43 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v63, v66);
          MEMORY[0x24BDAC7A8](v43);
          v45 = (char *)&v48 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *))(v46 + 16))(v45);
          v55(v40, v45, &v68, v41, v42);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v63);
          v35 += 40;
          if (!--v34)
            goto LABEL_56;
        }
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
LABEL_56:
      swift_bridgeObjectRelease();
    }
    return (uint64_t)v68;
  }
  v49 = a4;
  v9 = 0;
  v10 = v60;
  v11 = *(_QWORD *)(v60 + 64);
  v51 = v60 + 64;
  v12 = 1 << *(_BYTE *)(v60 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v53 = v61;
  v54 = (__int128 *)&v65;
  v52 = (unint64_t)(v12 + 63) >> 6;
  v48 = v52 - 1;
  if ((v13 & v11) == 0)
    goto LABEL_7;
LABEL_5:
  v15 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  v16 = v15 | (v9 << 6);
LABEL_6:
  v17 = *(_QWORD *)(v10 + 56);
  v18 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v16);
  v19 = v18[1];
  *(_QWORD *)&v60 = *v18;
  *((_QWORD *)&v60 + 1) = v19;
  sub_233AA71E0(v17 + 40 * v16, (uint64_t)v53);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_233AA7100((uint64_t)&v60, (uint64_t)&v63);
    v22 = v64;
    if (!v64)
    {
      swift_release();
      return (uint64_t)v68;
    }
    v23 = v63;
    sub_233AA4660(v54, (uint64_t)&v60);
    v56(v57, v23, v22, &v60);
    swift_bridgeObjectRelease();
    if (v5)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    v24 = v68;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v24 = sub_233ABC8B4(0, v24[2] + 1, 1, v24, v50, v49);
      v68 = v24;
    }
    v26 = v24[2];
    v25 = v24[3];
    if (v26 >= v25 >> 1)
      v68 = sub_233ABC8B4((_QWORD *)(v25 > 1), v26 + 1, 1, v24, v50, v49);
    v27 = v58;
    v28 = v59;
    v29 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v58);
    MEMORY[0x24BDAC7A8](v29);
    v31 = (char *)&v48 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v32 + 16))(v31);
    v55(v26, v31, &v68, v27, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v60);
    if (v14)
      goto LABEL_5;
LABEL_7:
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
      break;
    if (v20 < v52)
    {
      v21 = *(_QWORD *)(v51 + 8 * v20);
      if (v21)
        goto LABEL_10;
      v9 += 2;
      if (v20 + 1 >= v52)
      {
        v9 = v20;
      }
      else
      {
        v21 = *(_QWORD *)(v51 + 8 * v9);
        if (v21)
        {
          ++v20;
          goto LABEL_10;
        }
        if (v20 + 2 < v52)
        {
          v21 = *(_QWORD *)(v51 + 8 * (v20 + 2));
          if (v21)
          {
            v20 += 2;
            goto LABEL_10;
          }
          v33 = v20 + 3;
          if (v20 + 3 < v52)
          {
            v21 = *(_QWORD *)(v51 + 8 * v33);
            if (!v21)
            {
              while (1)
              {
                v20 = v33 + 1;
                if (__OFADD__(v33, 1))
                  goto LABEL_60;
                if (v20 >= v52)
                {
                  v9 = v48;
                  goto LABEL_15;
                }
                v21 = *(_QWORD *)(v51 + 8 * v20);
                ++v33;
                if (v21)
                  goto LABEL_10;
              }
            }
            v20 += 3;
LABEL_10:
            v14 = (v21 - 1) & v21;
            v16 = __clz(__rbit64(v21)) + (v20 << 6);
            v9 = v20;
            goto LABEL_6;
          }
          v9 = v20 + 2;
        }
      }
    }
LABEL_15:
    v14 = 0;
    v62 = 0;
    memset(v61, 0, sizeof(v61));
    v60 = 0u;
  }
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
  return result;
}

unint64_t sub_233AAE3B8@<X0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  __int16 v8;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[40];

  swift_bridgeObjectRetain();
  switch(sub_233AC30FC())
  {
    case 0u:
      result = sub_233ABC0A0(a1);
      if (!v2)
      {
        v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_233AA4F60();
        result = swift_allocObject();
        *a2 = result;
        *(_BYTE *)(result + 16) = 0;
        goto LABEL_35;
      }
      return result;
    case 1u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_233AA4F1C();
      v12 = swift_allocObject();
      v13 = v12 + 16;
      *a2 = v12;
      v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for ProcessCodeSigningFlags;
      a2[4] = sub_233AA4ED8();
      v15 = swift_allocObject();
      *a2 = v15;
      result = sub_233AB35FC((uint64_t)v25, v15 + 16);
      goto LABEL_37;
    case 3u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_233AA4E94();
      result = swift_allocObject();
      *a2 = result;
      v16 = 3;
      goto LABEL_34;
    case 4u:
      sub_233AA71E0(a1, (uint64_t)v25);
      result = sub_233AC1300((uint64_t)v25);
      if (!v2)
      {
        v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        result = sub_233AC1698(&qword_2560FDF20, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
        a2[4] = result;
        *a2 = v17;
      }
      return result;
    case 5u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_233AA4E50();
      v18 = swift_allocObject();
      v13 = v18 + 16;
      *a2 = v18;
      v14 = 5;
LABEL_16:
      result = sub_233AB5F54((uint64_t)v25, v14, v13);
      goto LABEL_37;
    case 6u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_233AA4E0C();
      result = swift_allocObject();
      *a2 = result;
      v16 = 6;
      goto LABEL_34;
    case 7u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for IsInitProcess;
      a2[4] = sub_233AA4DC8();
      result = swift_allocObject();
      *a2 = result;
      *(_BYTE *)(result + 16) = 7;
      goto LABEL_35;
    case 9u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_233AA4D84();
      result = swift_allocObject();
      *a2 = result;
      v16 = 9;
      goto LABEL_34;
    case 0xBu:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_233AA4D40();
      result = swift_allocObject();
      *a2 = result;
      v16 = 11;
      goto LABEL_34;
    case 0xCu:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_233AA4CFC();
      result = swift_allocObject();
      *a2 = result;
      v16 = 12;
      goto LABEL_34;
    case 0xDu:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_233AA4CB8();
      v19 = swift_allocObject();
      *a2 = v19;
      result = sub_233ABA9AC((uint64_t)v25, 13, v19 + 16);
      goto LABEL_37;
    case 0xEu:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_233AA4C30();
      v20 = swift_allocObject();
      *a2 = v20;
      result = sub_233AB9B10((uint64_t)v25, v20 + 16);
      goto LABEL_37;
    case 0xFu:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_233AA4C74();
      v21 = swift_allocObject();
      *a2 = v21;
      result = sub_233AB8E78((uint64_t)v25, v21 + 16);
      goto LABEL_37;
    case 0x10u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_233AA4BEC();
      v22 = swift_allocObject();
      *a2 = v22;
      result = sub_233ABA9AC((uint64_t)v25, 16, v22 + 16);
      goto LABEL_37;
    case 0x11u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_233AA4BA8();
      v23 = swift_allocObject();
      *a2 = v23;
      result = sub_233ABA9AC((uint64_t)v25, 17, v23 + 16);
      goto LABEL_37;
    case 0x12u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for TeamIdentifierMatchesCurrentProcess;
      a2[4] = sub_233AA4B64();
      result = swift_allocObject();
      *a2 = result;
      v16 = 18;
LABEL_34:
      *(_BYTE *)(result + 16) = v16;
LABEL_35:
      *(_QWORD *)(result + 48) = MEMORY[0x24BEE1328];
      *(_QWORD *)(result + 56) = &off_2504D28F0;
      *(_BYTE *)(result + 24) = v11 & 1;
      return result;
    case 0x13u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_233AA4AFC();
      v24 = swift_allocObject();
      *a2 = v24;
      result = sub_233ABBC28((uint64_t)v25, v24 + 16);
LABEL_37:
      if (v2)
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      return result;
    case 0x14u:
    case 0x15u:
      sub_233AA71E0(a1, (uint64_t)v25);
      v5 = sub_233AADCD0((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAE3B8, &qword_2560FE420, &qword_2560FE180, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
      if (v2)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for ProcessConstraintConjunction;
      result = sub_233AA1BE0();
      a2[4] = result;
      v8 = 5141;
      goto LABEL_40;
    case 0x1Cu:
    case 0x1Du:
      sub_233AA71E0(a1, (uint64_t)v25);
      v9 = sub_233AADCD0((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAE3B8, &qword_2560FE420, &qword_2560FE180, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
      if (v2)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for ProcessConstraintDisjunction;
      result = sub_233AA1D00();
      a2[4] = result;
      v8 = 7197;
LABEL_40:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_233AA45E0();
      swift_allocError();
      *v10 = 1;
      return swift_willThrow();
  }
}

unint64_t sub_233AAEAE4@<X0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  __int16 v8;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[40];

  swift_bridgeObjectRetain();
  switch(sub_233AC30FC())
  {
    case 0u:
      result = sub_233ABC0A0(a1);
      if (!v2)
      {
        v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_233AA61C4();
        result = swift_allocObject();
        *a2 = result;
        *(_BYTE *)(result + 16) = 0;
        goto LABEL_29;
      }
      return result;
    case 1u:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_233AA6180();
      v12 = swift_allocObject();
      v13 = v12 + 16;
      *a2 = v12;
      v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for ProcessCodeSigningFlags;
      a2[4] = sub_233AA613C();
      v15 = swift_allocObject();
      *a2 = v15;
      result = sub_233AB35FC((uint64_t)v26, v15 + 16);
      goto LABEL_36;
    case 3u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_233AA60F8();
      result = swift_allocObject();
      *a2 = result;
      v16 = 3;
      goto LABEL_28;
    case 4u:
      sub_233AA71E0(a1, (uint64_t)v26);
      result = sub_233AC1300((uint64_t)v26);
      if (!v2)
      {
        v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        result = sub_233AC1698(&qword_2560FDFF0, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
        a2[4] = result;
        *a2 = v17;
      }
      return result;
    case 5u:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_233AA60B4();
      v18 = swift_allocObject();
      v13 = v18 + 16;
      *a2 = v18;
      v14 = 5;
LABEL_16:
      result = sub_233AB5F54((uint64_t)v26, v14, v13);
      goto LABEL_36;
    case 6u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_233AA6070();
      result = swift_allocObject();
      *a2 = result;
      v16 = 6;
      goto LABEL_28;
    case 7u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for IsInitProcess;
      a2[4] = sub_233AA602C();
      result = swift_allocObject();
      *a2 = result;
      *(_BYTE *)(result + 16) = 7;
      goto LABEL_29;
    case 9u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_233AA5FE8();
      result = swift_allocObject();
      *a2 = result;
      v16 = 9;
      goto LABEL_28;
    case 0xAu:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for LaunchType;
      a2[4] = sub_233AA5FA4();
      v19 = swift_allocObject();
      *a2 = v19;
      result = sub_233AB77BC((uint64_t)v26, v19 + 16);
      goto LABEL_36;
    case 0xBu:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_233AA5F60();
      result = swift_allocObject();
      *a2 = result;
      v16 = 11;
      goto LABEL_28;
    case 0xCu:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_233AA5F1C();
      result = swift_allocObject();
      *a2 = result;
      v16 = 12;
LABEL_28:
      *(_BYTE *)(result + 16) = v16;
LABEL_29:
      *(_QWORD *)(result + 48) = MEMORY[0x24BEE1328];
      *(_QWORD *)(result + 56) = &off_2504D28F0;
      *(_BYTE *)(result + 24) = v11 & 1;
      return result;
    case 0xDu:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_233AA5ED8();
      v20 = swift_allocObject();
      *a2 = v20;
      result = sub_233ABA9AC((uint64_t)v26, 13, v20 + 16);
      goto LABEL_36;
    case 0xEu:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_233AA5E50();
      v21 = swift_allocObject();
      *a2 = v21;
      result = sub_233AB9B10((uint64_t)v26, v21 + 16);
      goto LABEL_36;
    case 0xFu:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_233AA5E94();
      v22 = swift_allocObject();
      *a2 = v22;
      result = sub_233AB8E78((uint64_t)v26, v22 + 16);
      goto LABEL_36;
    case 0x10u:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_233AA5E0C();
      v23 = swift_allocObject();
      *a2 = v23;
      result = sub_233ABA9AC((uint64_t)v26, 16, v23 + 16);
      goto LABEL_36;
    case 0x11u:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_233AA5DC8();
      v24 = swift_allocObject();
      *a2 = v24;
      result = sub_233ABA9AC((uint64_t)v26, 17, v24 + 16);
      goto LABEL_36;
    case 0x13u:
      sub_233AA71E0(a1, (uint64_t)v26);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_233AA5D84();
      v25 = swift_allocObject();
      *a2 = v25;
      result = sub_233ABBC28((uint64_t)v26, v25 + 16);
LABEL_36:
      if (v2)
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      return result;
    case 0x14u:
    case 0x15u:
      sub_233AA71E0(a1, (uint64_t)v26);
      v5 = sub_233AADCD0((uint64_t)v26, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAEAE4, &qword_2560FE428, &qword_2560FE190, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
      if (v2)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      a2[3] = &type metadata for LaunchConstraintConjunction;
      result = sub_233AA1C40();
      a2[4] = result;
      v8 = 5141;
      goto LABEL_40;
    case 0x1Cu:
    case 0x1Du:
      sub_233AA71E0(a1, (uint64_t)v26);
      v9 = sub_233AADCD0((uint64_t)v26, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAEAE4, &qword_2560FE428, &qword_2560FE190, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
      if (v2)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      a2[3] = &type metadata for LaunchConstraintDisjunction;
      result = sub_233AA1D60();
      a2[4] = result;
      v8 = 7197;
LABEL_40:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_233AA45E0();
      swift_allocError();
      *v10 = 1;
      return swift_willThrow();
  }
}

unint64_t sub_233AAF210@<X0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  __int16 v8;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[40];

  swift_bridgeObjectRetain();
  switch(sub_233AC30FC())
  {
    case 0u:
      result = sub_233ABC0A0(a1);
      if (!v2)
      {
        v11 = result;
        a2[3] = &type metadata for AppleInternal;
        a2[4] = sub_233AA6BD4();
        result = swift_allocObject();
        *a2 = result;
        *(_BYTE *)(result + 16) = 0;
        goto LABEL_26;
      }
      return result;
    case 1u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for CodeDirectoryHash;
      a2[4] = sub_233AA6B90();
      v12 = swift_allocObject();
      v13 = v12 + 16;
      *a2 = v12;
      v14 = 1;
      goto LABEL_16;
    case 2u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for OnDiskCodeSigningFlags;
      a2[4] = sub_233AA6B28();
      v15 = swift_allocObject();
      *a2 = v15;
      result = sub_233AB35FC((uint64_t)v25, v15 + 16);
      goto LABEL_33;
    case 3u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for DeveloperMode;
      a2[4] = sub_233AA6AE4();
      result = swift_allocObject();
      *a2 = result;
      v16 = 3;
      goto LABEL_25;
    case 4u:
      sub_233AA71E0(a1, (uint64_t)v25);
      result = sub_233AC1300((uint64_t)v25);
      if (!v2)
      {
        v17 = result;
        a2[3] = type metadata accessor for EntitlementsQuery();
        result = sub_233AC1698(&qword_2560FE0C0, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
        a2[4] = result;
        *a2 = v17;
      }
      return result;
    case 5u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for InfoPlistHash;
      a2[4] = sub_233AA6A60();
      v18 = swift_allocObject();
      v13 = v18 + 16;
      *a2 = v18;
      v14 = 5;
LABEL_16:
      result = sub_233AB5F54((uint64_t)v25, v14, v13);
      goto LABEL_33;
    case 6u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for InTrustCacheWithConstraintCategory;
      a2[4] = sub_233AA6A1C();
      result = swift_allocObject();
      *a2 = result;
      v16 = 6;
      goto LABEL_25;
    case 9u:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for IsSIPProtected;
      a2[4] = sub_233AA6994();
      result = swift_allocObject();
      *a2 = result;
      v16 = 9;
      goto LABEL_25;
    case 0xBu:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for OnAuthorizedAuthAPFSVolume;
      a2[4] = sub_233AA6950();
      result = swift_allocObject();
      *a2 = result;
      v16 = 11;
      goto LABEL_25;
    case 0xCu:
      result = sub_233ABC0A0(a1);
      if (v2)
        return result;
      v11 = result;
      a2[3] = &type metadata for OnSystemVolume;
      a2[4] = sub_233AA690C();
      result = swift_allocObject();
      *a2 = result;
      v16 = 12;
LABEL_25:
      *(_BYTE *)(result + 16) = v16;
LABEL_26:
      *(_QWORD *)(result + 48) = MEMORY[0x24BEE1328];
      *(_QWORD *)(result + 56) = &off_2504D28F0;
      *(_BYTE *)(result + 24) = v11 & 1;
      return result;
    case 0xDu:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for OSEnvironment;
      a2[4] = sub_233AA68C8();
      v19 = swift_allocObject();
      *a2 = v19;
      result = sub_233ABA9AC((uint64_t)v25, 13, v19 + 16);
      goto LABEL_33;
    case 0xEu:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformIdentifier;
      a2[4] = sub_233AA6840();
      v20 = swift_allocObject();
      *a2 = v20;
      result = sub_233AB9B10((uint64_t)v25, v20 + 16);
      goto LABEL_33;
    case 0xFu:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for PlatformType;
      a2[4] = sub_233AA6884();
      v21 = swift_allocObject();
      *a2 = v21;
      result = sub_233AB8E78((uint64_t)v25, v21 + 16);
      goto LABEL_33;
    case 0x10u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for SigningIdentifier;
      a2[4] = sub_233AA67FC();
      v22 = swift_allocObject();
      *a2 = v22;
      result = sub_233ABA9AC((uint64_t)v25, 16, v22 + 16);
      goto LABEL_33;
    case 0x11u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for TeamIdentifier;
      a2[4] = sub_233AA67B8();
      v23 = swift_allocObject();
      *a2 = v23;
      result = sub_233ABA9AC((uint64_t)v25, 17, v23 + 16);
      goto LABEL_33;
    case 0x13u:
      sub_233AA71E0(a1, (uint64_t)v25);
      a2[3] = &type metadata for ValidationCategory;
      a2[4] = sub_233AA6774();
      v24 = swift_allocObject();
      *a2 = v24;
      result = sub_233ABBC28((uint64_t)v25, v24 + 16);
LABEL_33:
      if (v2)
        return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a2);
      return result;
    case 0x14u:
    case 0x15u:
      sub_233AA71E0(a1, (uint64_t)v25);
      v5 = sub_233AADCD0((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAF210, &qword_2560FE430, &qword_2560FE198, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
      if (v2)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      v6 = v5;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for OnDiskConstraintConjunction;
      result = sub_233AA1CA0();
      a2[4] = result;
      v8 = 5141;
      goto LABEL_36;
    case 0x1Cu:
    case 0x1Du:
      sub_233AA71E0(a1, (uint64_t)v25);
      v9 = sub_233AADCD0((uint64_t)v25, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAF210, &qword_2560FE430, &qword_2560FE198, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
      if (v2)
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      v6 = v9;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      a2[3] = &type metadata for OnDiskConstraintDisjunction;
      result = sub_233AA1E20();
      a2[4] = result;
      v8 = 7197;
LABEL_36:
      *(_WORD *)a2 = v8;
      a2[1] = v6;
      return result;
    default:
      sub_233AA45E0();
      swift_allocError();
      *v10 = 1;
      return swift_willThrow();
  }
}

uint64_t sub_233AAF8A4(unsigned __int8 a1, unsigned __int8 a2)
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
      v3 = 0x79654B7961727261;
    else
      v3 = 0x65756C6176;
    if (v2 == 1)
      v4 = 0xE800000000000000;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x79654B7961727261;
      else
        v6 = 0x65756C6176;
      if (v5 == 1)
        v7 = 0xE800000000000000;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE300000000000000;
    v3 = 7955819;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE300000000000000;
  if (v3 != 7955819)
  {
LABEL_21:
    v8 = sub_233AC383C();
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

uint64_t sub_233AAF9A4(unsigned __int8 a1, unsigned __int8 a2)
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
      v3 = 0x726F74617265706FLL;
    else
      v3 = 0x65756C6176;
    if (v2 == 1)
      v4 = 0xEB0000000079654BLL;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x726F74617265706FLL;
      else
        v6 = 0x65756C6176;
      if (v5 == 1)
        v7 = 0xEB0000000079654BLL;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE300000000000000;
    v3 = 7955819;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE300000000000000;
  if (v3 != 7955819)
  {
LABEL_21:
    v8 = sub_233AC383C();
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

uint64_t sub_233AAFAB4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x65756C6176;
  else
    v3 = 7955819;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x65756C6176;
  else
    v5 = 7955819;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_233AC383C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_233AAFB4C(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000012;
  else
    v3 = 0x65756C6176;
  if (v2)
    v4 = 0xE500000000000000;
  else
    v4 = 0x8000000233AC9370;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000012;
  else
    v5 = 0x65756C6176;
  if ((a2 & 1) != 0)
    v6 = 0x8000000233AC9370;
  else
    v6 = 0xE500000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_233AC383C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t OnDiskCodeSigningFlags.ValueSet.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t *static OnDiskCodeSigningFlags.isSuperset(of:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  *(_BYTE *)a2 = 2;
  *(_BYTE *)(a2 + 8) = 23;
  *(_QWORD *)(a2 + 16) = v2;
  *(_BYTE *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_233AAFC1C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _UNKNOWN **v13;
  _BYTE v14[40];

  if (*(_QWORD *)(a1 + 16) == 1)
  {
    v5 = swift_bridgeObjectRetain();
    sub_233AADB84(v5, (uint64_t)&v10);
    result = swift_bridgeObjectRelease();
    v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }
    v8 = v10;
    sub_233AA4660(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000
      || (sub_233AC383C() & 1) != 0
      || v8 == 0x617272612D726F24 && v7 == 0xE900000000000079
      || (sub_233AC383C() & 1) != 0)
    {
      sub_233AAE3B8((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  *((_QWORD *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  v13 = &off_2504D5320;
  v10 = a1;
  swift_bridgeObjectRetain();
  v9 = sub_233AADCD0((uint64_t)&v10, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAE3B8, &qword_2560FE420, &qword_2560FE180, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for ProcessConstraintConjunction;
    result = sub_233AA1BE0();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }
  return result;
}

uint64_t sub_233AAFDFC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _UNKNOWN **v13;
  _BYTE v14[40];

  if (*(_QWORD *)(a1 + 16) == 1)
  {
    v5 = swift_bridgeObjectRetain();
    sub_233AADB84(v5, (uint64_t)&v10);
    result = swift_bridgeObjectRelease();
    v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }
    v8 = v10;
    sub_233AA4660(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000
      || (sub_233AC383C() & 1) != 0
      || v8 == 0x617272612D726F24 && v7 == 0xE900000000000079
      || (sub_233AC383C() & 1) != 0)
    {
      sub_233AAEAE4((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  *((_QWORD *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  v13 = &off_2504D5320;
  v10 = a1;
  swift_bridgeObjectRetain();
  v9 = sub_233AADCD0((uint64_t)&v10, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAEAE4, &qword_2560FE428, &qword_2560FE190, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for LaunchConstraintConjunction;
    result = sub_233AA1C40();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }
  return result;
}

uint64_t sub_233AAFFDC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _UNKNOWN **v13;
  _BYTE v14[40];

  if (*(_QWORD *)(a1 + 16) == 1)
  {
    v5 = swift_bridgeObjectRetain();
    sub_233AADB84(v5, (uint64_t)&v10);
    result = swift_bridgeObjectRelease();
    v7 = v11;
    if (!v11)
    {
      __break(1u);
      return result;
    }
    v8 = v10;
    sub_233AA4660(&v12, (uint64_t)v14);
    if (v8 == 7499556 && v7 == 0xE300000000000000
      || (sub_233AC383C() & 1) != 0
      || v8 == 0x617272612D726F24 && v7 == 0xE900000000000079
      || (sub_233AC383C() & 1) != 0)
    {
      sub_233AAF210((uint64_t)v14, a2);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      return swift_bridgeObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    swift_bridgeObjectRelease();
  }
  *((_QWORD *)&v12 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  v13 = &off_2504D5320;
  v10 = a1;
  swift_bridgeObjectRetain();
  v9 = sub_233AADCD0((uint64_t)&v10, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t, __int128 *))sub_233AAF210, &qword_2560FE430, &qword_2560FE198, (void (*)(unint64_t, char *, _QWORD **, uint64_t, uint64_t))sub_233AA398C);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  if (!v2)
  {
    a2[3] = &type metadata for OnDiskConstraintConjunction;
    result = sub_233AA1CA0();
    a2[4] = result;
    *(_WORD *)a2 = 5141;
    a2[1] = v9;
  }
  return result;
}

_QWORD *static ProcessConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_233AB01F0(a1, &qword_2560FE420, &qword_2560FE180);
}

uint64_t static ProcessConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_233AB0360(a1, &qword_2560FE420);
}

_QWORD *static LaunchConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_233AB01F0(a1, &qword_2560FE428, &qword_2560FE190);
}

_QWORD *sub_233AB01F0(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  result = (_QWORD *)swift_bridgeObjectRetain();
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v10 = *(_QWORD *)(a1 + 8 * v8 + 32);
    v11 = *(_QWORD *)(v10 + 16);
    v12 = v9[2];
    v13 = v12 + v11;
    if (__OFADD__(v12, v11))
      break;
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v13 <= v9[3] >> 1)
    {
      if (*(_QWORD *)(v10 + 16))
        goto LABEL_14;
    }
    else
    {
      if (v12 <= v13)
        v14 = v12 + v11;
      else
        v14 = v12;
      result = sub_233ABC8B4(result, v14, 1, v9, a2, a3);
      v9 = result;
      if (*(_QWORD *)(v10 + 16))
      {
LABEL_14:
        if ((v9[3] >> 1) - v9[2] < v11)
          goto LABEL_23;
        __swift_instantiateConcreteTypeFromMangledName(a3);
        result = (_QWORD *)swift_arrayInitWithCopy();
        if (v11)
        {
          v15 = v9[2];
          v16 = __OFADD__(v15, v11);
          v17 = v15 + v11;
          if (v16)
            goto LABEL_24;
          v9[2] = v17;
        }
        goto LABEL_4;
      }
    }
    if (v11)
      goto LABEL_22;
LABEL_4:
    result = (_QWORD *)swift_bridgeObjectRelease();
    if (v3 == ++v8)
    {
      swift_bridgeObjectRelease();
      return v9;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t static LaunchConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_233AB0360(a1, &qword_2560FE428);
}

uint64_t sub_233AB0360(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_233AC3C20;
  sub_233AA71E0(a1, v3 + 32);
  return v3;
}

uint64_t static LaunchConstraintBuilder.buildOptional(_:)(uint64_t a1)
{
  uint64_t v1;

  if (a1)
    v1 = a1;
  else
    v1 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *static OnDiskConstraintBuilder.buildBlock(_:)(uint64_t a1)
{
  return sub_233AB01F0(a1, &qword_2560FE430, &qword_2560FE198);
}

uint64_t static OnDiskConstraintBuilder.buildExpression(_:)(uint64_t a1)
{
  return sub_233AB0360(a1, &qword_2560FE430);
}

uint64_t sub_233AB0404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v5;
  char v6;
  uint64_t v7;
  __int128 v8;
  _BYTE *v9;
  uint64_t *v10;
  _BYTE *v11;
  __int128 v12;
  _QWORD v13[2];
  __int128 v14;
  uint64_t v15[5];

  sub_233AA71E0(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if (!swift_dynamicCast())
    goto LABEL_8;
  if (*(_QWORD *)(v15[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_233AA45E0();
    swift_allocError();
    *v9 = 1;
    swift_willThrow();
    v10 = (uint64_t *)a1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  sub_233AADB84(v15[0], (uint64_t)v13);
  result = swift_bridgeObjectRelease();
  if (v13[1])
  {
    sub_233AA4660(&v14, (uint64_t)v15);
    v5 = sub_233AC30FC();
    if (v5 != 31)
    {
      v6 = v5;
      sub_233AA71E0((uint64_t)v15, (uint64_t)v13);
      if ((swift_dynamicCast() & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
        v7 = 0;
        v8 = v12;
LABEL_12:
        *(_BYTE *)a2 = v6;
        *(_OWORD *)(a2 + 8) = v8;
        *(_QWORD *)(a2 + 24) = v7;
        return result;
      }
      sub_233AA71E0((uint64_t)v15, (uint64_t)v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF210);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v7 = v12;
        __swift_destroy_boxed_opaque_existential_1(a1);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
        v8 = xmmword_233AC8C20;
        goto LABEL_12;
      }
    }
    sub_233AA45E0();
    swift_allocError();
    *v11 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    v10 = v15;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB0614(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  _BYTE *v5;
  uint64_t *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11[5];

  sub_233AA71E0(a1, (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if (!swift_dynamicCast())
    goto LABEL_8;
  v1 = v11[0];
  if (*(_QWORD *)(v11[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_233AA45E0();
    swift_allocError();
    *v5 = 1;
    swift_willThrow();
    v6 = (uint64_t *)a1;
    goto LABEL_9;
  }
  sub_233AADB84(v11[0], (uint64_t)&v8);
  result = swift_bridgeObjectRelease();
  v1 = v9;
  if (v9)
  {
    sub_233AA4660(&v10, (uint64_t)v11);
    v4 = sub_233AC30FC();
    if (v4 != 31)
    {
      v1 = v4;
      sub_233AA71E0((uint64_t)v11, (uint64_t)&v8);
      if ((swift_dynamicCast() & 1) != 0
        || (sub_233AA71E0((uint64_t)v11, (uint64_t)&v8),
            __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF218),
            (swift_dynamicCast() & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        return v1;
      }
    }
    sub_233AA45E0();
    swift_allocError();
    *v7 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    v6 = v11;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB081C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  _BYTE *v5;
  uint64_t *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11[5];

  sub_233AA71E0(a1, (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if (!swift_dynamicCast())
    goto LABEL_8;
  v1 = v11[0];
  if (*(_QWORD *)(v11[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_233AA45E0();
    swift_allocError();
    *v5 = 1;
    swift_willThrow();
    v6 = (uint64_t *)a1;
    goto LABEL_9;
  }
  sub_233AADB84(v11[0], (uint64_t)&v8);
  result = swift_bridgeObjectRelease();
  v1 = v9;
  if (v9)
  {
    sub_233AA4660(&v10, (uint64_t)v11);
    v4 = sub_233AC30FC();
    if (v4 != 31)
    {
      v1 = v4;
      sub_233AA71E0((uint64_t)v11, (uint64_t)&v8);
      if ((swift_dynamicCast() & 1) != 0
        || (sub_233AA71E0((uint64_t)v11, (uint64_t)&v8),
            __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF228),
            (swift_dynamicCast() & 1) != 0))
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        return v1;
      }
    }
    sub_233AA45E0();
    swift_allocError();
    *v7 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    v6 = v11;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB0A1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t result;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t *v13;
  _BYTE *v14;
  uint64_t v15;
  _QWORD v16[2];
  __int128 v17;
  uint64_t v18[5];

  sub_233AA71E0(a1, (uint64_t)v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if (!swift_dynamicCast())
    goto LABEL_8;
  if (*(_QWORD *)(v18[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    sub_233AA45E0();
    swift_allocError();
    *v12 = 1;
    swift_willThrow();
    v13 = (uint64_t *)a1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  sub_233AADB84(v18[0], (uint64_t)v16);
  result = swift_bridgeObjectRelease();
  if (v16[1])
  {
    sub_233AA4660(&v17, (uint64_t)v18);
    v7 = sub_233AC30FC();
    if (v7 != 31)
    {
      v8 = v7;
      sub_233AA71E0((uint64_t)v18, (uint64_t)v16);
      v9 = swift_dynamicCast();
      if ((v9 & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1(a1);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        v10 = 0;
        v11 = v15;
LABEL_12:
        *(_BYTE *)a3 = v8;
        *(_QWORD *)(a3 + 8) = v11;
        *(_BYTE *)(a3 + 16) = v9 ^ 1;
        *(_QWORD *)(a3 + 24) = v10;
        return result;
      }
      sub_233AA71E0((uint64_t)v18, (uint64_t)v16);
      __swift_instantiateConcreteTypeFromMangledName(a2);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v10 = v15;
        __swift_destroy_boxed_opaque_existential_1(a1);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        v11 = 0;
        goto LABEL_12;
      }
    }
    sub_233AA45E0();
    swift_allocError();
    *v14 = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1(a1);
    v13 = v18;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  __break(1u);
  return result;
}

BOOL sub_233AB0C40(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_233AB0C50()
{
  return sub_233AC389C();
}

uint64_t sub_233AB0C74(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_233AC383C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E695365756C6176 && a2 == 0xEB00000000656C67 || (sub_233AC383C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x72724165756C6176 && a2 == 0xEA00000000007961)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_233AB0DDC()
{
  sub_233AC3890();
  sub_233AC389C();
  return sub_233AC38B4();
}

uint64_t sub_233AB0E20(char a1)
{
  if (!a1)
    return 7955819;
  if (a1 == 1)
    return 0x6E695365756C6176;
  return 0x72724165756C6176;
}

BOOL sub_233AB0E7C(char *a1, char *a2)
{
  return sub_233AB0C40(*a1, *a2);
}

uint64_t sub_233AB0E94()
{
  return sub_233AB0DDC();
}

uint64_t sub_233AB0EA4()
{
  return sub_233AB0C50();
}

uint64_t sub_233AB0EB4()
{
  sub_233AC3890();
  sub_233AB0C50();
  return sub_233AC38B4();
}

uint64_t sub_233AB0EFC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v17 = *(_QWORD *)(a2 + 16);
  v18 = v5;
  v6 = type metadata accessor for ContainerConstraint.CodingKeys(255, v17, v4, v5);
  MEMORY[0x23493B550](&unk_233AC8BD0, v6);
  v7 = sub_233AC3794();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = v19;
  sub_233AC38CC();
  LOBYTE(v22) = *v11;
  v23 = 0;
  sub_233AA2828();
  v12 = v20;
  sub_233AC377C();
  if (v12)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v14 = v8;
  LOBYTE(v22) = 1;
  v15 = v18;
  sub_233AC3758();
  v22 = *(_QWORD *)&v11[*(int *)(a2 + 48)];
  v23 = 2;
  v16 = sub_233AC365C();
  v21 = v15;
  MEMORY[0x23493B550](MEMORY[0x24BEE12A0], v16, &v21);
  sub_233AC3758();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v10, v7);
}

uint64_t sub_233AB10DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  _QWORD v29[2];
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  v31 = a5;
  v9 = sub_233AC3668();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)v29 - v10;
  v11 = type metadata accessor for ContainerConstraint.CodingKeys(255, a2, a3, a4);
  MEMORY[0x23493B550](&unk_233AC8BD0, v11);
  v39 = sub_233AC3740();
  v35 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v13 = (char *)v29 - v12;
  v37 = a2;
  v38 = a3;
  v34 = type metadata accessor for ContainerConstraint(0, a2, a3, a4);
  v14 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v16 = (char *)v29 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v40 = v13;
  v17 = v41;
  sub_233AC38C0();
  if (v17)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v18 = v16;
  v41 = v14;
  v19 = v35;
  v20 = v38;
  v44 = 0;
  sub_233AA459C();
  v21 = v39;
  sub_233AC3728();
  v30 = v18;
  *v18 = v43;
  LOBYTE(v43) = 1;
  sub_233AC3704();
  v22 = *(void (**)(void))(v32 + 32);
  v29[1] = &v30[*(int *)(v34 + 44)];
  v22();
  v23 = sub_233AC365C();
  v44 = 2;
  v42 = v20;
  MEMORY[0x23493B550](MEMORY[0x24BEE12D0], v23, &v42);
  sub_233AC3704();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v40, v21);
  v24 = v34;
  v26 = v30;
  v25 = v31;
  *(_QWORD *)&v30[*(int *)(v34 + 48)] = v43;
  v27 = v41;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v41 + 16))(v25, v26, v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v27 + 8))(v26, v24);
}

uint64_t sub_233AB1408()
{
  char *v0;

  return sub_233AB0E20(*v0);
}

uint64_t sub_233AB1418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AB0C74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_233AB1448@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AC1498();
  *a1 = result;
  return result;
}

uint64_t sub_233AB1478(uint64_t a1)
{
  MEMORY[0x23493B550](&unk_233AC8BD0, a1);
  return sub_233AC38D8();
}

uint64_t sub_233AB14AC(uint64_t a1)
{
  MEMORY[0x23493B550](&unk_233AC8BD0, a1);
  return sub_233AC38E4();
}

uint64_t sub_233AB14E0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_233AB10DC(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_233AB1500(_QWORD *a1, uint64_t a2)
{
  return sub_233AB0EFC(a1, a2);
}

uint64_t sub_233AB1514@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_233AB1858(a1, a2);
}

uint64_t sub_233AB1528@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5;
  uint64_t inited;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v13;
  uint64_t v14;

  v5 = result;
  if ((a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF198);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(inited + 40) = v9;
    *(_QWORD *)(inited + 48) = a2;
    v10 = sub_233A99EA4(inited);
    v11 = (uint64_t *)&unk_2560FF1A0;
LABEL_5:
    result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_2504D5320;
    *a5 = v10;
    return result;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1A8);
    v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v13 + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(v13 + 40) = v14;
    *(_QWORD *)(v13 + 48) = a4;
    swift_bridgeObjectRetain();
    v10 = sub_233A99FB4(v13);
    v11 = (uint64_t *)&unk_2560FF1B0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB162C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t inited;
  uint64_t v15;

  v5 = result;
  if (a3 >> 60 != 15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1E8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(inited + 40) = v15;
    *(_QWORD *)(inited + 48) = a2;
    *(_QWORD *)(inited + 56) = a3;
    sub_233AA72D8(a2, a3);
    v10 = sub_233A99FC0(inited);
    v11 = (uint64_t *)&unk_2560FF1F0;
    goto LABEL_5;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1F8);
    v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v8 + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(v8 + 40) = v9;
    *(_QWORD *)(v8 + 48) = a4;
    swift_bridgeObjectRetain();
    v10 = sub_233A9A0E4(v8);
    v11 = (uint64_t *)&unk_2560FF200;
LABEL_5:
    result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_2504D5320;
    *a5 = v10;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB1748@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5;
  uint64_t inited;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v14;
  uint64_t v15;

  v5 = result;
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1C8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(inited + 40) = v10;
    *(_QWORD *)(inited + 48) = a2;
    *(_QWORD *)(inited + 56) = a3;
    swift_bridgeObjectRetain();
    v11 = sub_233A9A200(inited);
    v12 = (uint64_t *)&unk_2560FF1D0;
LABEL_5:
    result = __swift_instantiateConcreteTypeFromMangledName(v12);
    a5[3] = result;
    a5[4] = (unint64_t)&off_2504D5320;
    *a5 = v11;
    return result;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1D8);
    v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v14 + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(v14 + 40) = v15;
    *(_QWORD *)(v14 + 48) = a4;
    swift_bridgeObjectRetain();
    v11 = sub_233A9A320(v14);
    v12 = (uint64_t *)&unk_2560FF1E0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB1858@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  uint64_t result;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t TupleTypeMetadata2;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unsigned __int8 *, uint64_t);
  uint64_t *v31;
  unsigned __int8 *v32;

  v31 = a2;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_233AC3668();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v28 - v10;
  v12 = *(int *)(a1 + 44);
  v32 = v2;
  v13 = &v2[v12];
  v30 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16);
  v30((char *)&v28 - v10, &v2[v12], v5);
  v29 = *(_QWORD *)(v4 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v15 = v14(v11, 1, v4);
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  if (v15 == 1)
  {
    v17 = v32;
    v18 = *(_QWORD *)&v32[*(int *)(a1 + 48)];
    if (v18)
    {
      sub_233AC365C();
      swift_getTupleTypeMetadata2();
      sub_233AC37AC();
      swift_initStackObject();
      sub_233AC3638();
      v20 = v19;
      *v19 = sub_233AC1BB4(*v17);
      v20[1] = v21;
      v20[2] = v18;
      sub_233AC365C();
      swift_bridgeObjectRetain();
      v22 = sub_233AC35C0();
LABEL_6:
      result = sub_233AC35CC();
      v27 = v31;
      v31[3] = result;
      v27[4] = (uint64_t)&off_2504D5320;
      *v27 = v22;
      return result;
    }
    __break(1u);
  }
  else
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    sub_233AC37AC();
    swift_allocObject();
    sub_233AC3638();
    v25 = v24;
    *v24 = sub_233AC1BB4(*v32);
    v25[1] = v26;
    v30(v9, v13, v5);
    result = v14(v9, 1, v4);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))((char *)v25 + *(int *)(TupleTypeMetadata2 + 48), v9, v4);
      sub_233AC365C();
      v22 = sub_233AC35C0();
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB1B30@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  unsigned __int8 v5;
  uint64_t inited;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v5 = result;
  if ((a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF198);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(inited + 40) = v9;
    *(_QWORD *)(inited + 48) = a2;
    v10 = sub_233A99EA4(inited);
    v11 = (uint64_t *)&unk_2560FF1A0;
LABEL_11:
    result = __swift_instantiateConcreteTypeFromMangledName(v11);
    a5[3] = result;
    a5[4] = (unint64_t)&off_2504D5320;
    *a5 = v10;
    return result;
  }
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1A8);
    v13 = swift_initStackObject();
    *(_OWORD *)(v13 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v13 + 32) = sub_233AC1BB4(v5);
    *(_QWORD *)(v13 + 40) = v14;
    v15 = *(_QWORD *)(a4 + 16);
    v16 = MEMORY[0x24BEE4AF8];
    if (v15)
    {
      v21 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_233AA28F8(0, v15, 0);
      v17 = 0;
      v16 = v21;
      v18 = *(_QWORD *)(v21 + 16);
      do
      {
        v19 = *(_QWORD *)(a4 + 8 * v17 + 32);
        v20 = *(_QWORD *)(v21 + 24);
        if (v18 >= v20 >> 1)
          sub_233AA28F8((char *)(v20 > 1), v18 + 1, 1);
        ++v17;
        *(_QWORD *)(v21 + 16) = v18 + 1;
        *(_QWORD *)(v21 + 8 * v18++ + 32) = v19;
      }
      while (v15 != v17);
      swift_bridgeObjectRelease();
    }
    *(_QWORD *)(v13 + 48) = v16;
    v10 = sub_233A99FB4(v13);
    v11 = (uint64_t *)&unk_2560FF1B0;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB1CE4@<X0>(unint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[40];

  sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE648);
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1C8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(*v1);
    *(_QWORD *)(inited + 40) = v5;
    sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v15);
    swift_dynamicCast();
    v6 = sub_233A9A200(inited);
    v7 = (uint64_t *)&unk_2560FF1D0;
  }
  else
  {
    sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE628);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE108);
    v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v8 + 32) = sub_233AC1BB4(*v1);
    *(_QWORD *)(v8 + 40) = v9;
    sub_233AB1748(v11, v12, v13, v14, (unint64_t *)(v8 + 48));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE118);
      return swift_arrayDestroy();
    }
    v6 = sub_233A99D78(v8);
    v7 = &qword_2560FE0F8;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(v7);
  a1[3] = result;
  a1[4] = (unint64_t)&off_2504D5320;
  *a1 = v6;
  return result;
}

uint64_t sub_233AB1EEC@<X0>(unint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE v14[40];

  sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE480);
  if (swift_dynamicCast())
  {
    sub_233AA94E0(v10, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1E8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(*v1);
    *(_QWORD *)(inited + 40) = v5;
    sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v14);
    swift_dynamicCast();
    v6 = sub_233A99FC0(inited);
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1F0);
    a1[3] = result;
    a1[4] = (unint64_t)&off_2504D5320;
  }
  else
  {
    sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE460);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE108);
    v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v8 + 32) = sub_233AC1BB4(*v1);
    *(_QWORD *)(v8 + 40) = v9;
    sub_233AB162C(v10, v11, v12, v13, (unint64_t *)(v8 + 48));
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE118);
      swift_arrayDestroy();
      sub_233ABC590(v11, v12);
      return swift_bridgeObjectRelease();
    }
    v6 = sub_233A99D78(v8);
    a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    a1[4] = (unint64_t)&off_2504D5320;
    sub_233ABC590(v11, v12);
    result = swift_bridgeObjectRelease();
  }
  *a1 = v6;
  return result;
}

uint64_t sub_233AB211C@<X0>(unint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unsigned __int8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _BYTE v15[40];

  sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5D8);
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF198);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(*v1);
    *(_QWORD *)(inited + 40) = v5;
    sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v15);
    swift_dynamicCast();
    v6 = sub_233A99EA4(inited);
    v7 = &qword_2560FF1A0;
  }
  else
  {
    sub_233AA71E0((uint64_t)(v1 + 8), (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE108);
    v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v8 + 32) = sub_233AC1BB4(*v1);
    *(_QWORD *)(v8 + 40) = v9;
    sub_233AB1528(v11, v12, v13, v14, (unint64_t *)(v8 + 48));
    swift_bridgeObjectRelease();
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE118);
      return swift_arrayDestroy();
    }
    v6 = sub_233A99D78(v8);
    v7 = &qword_2560FE0F8;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(v7);
  a1[3] = result;
  a1[4] = (unint64_t)&off_2504D5320;
  *a1 = v6;
  return result;
}

uint64_t sub_233AB2318@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _BYTE v17[40];

  sub_233AA71E0((uint64_t)(v2 + 8), (uint64_t)v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5D8);
  if (swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF198);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
    *(_QWORD *)(inited + 32) = sub_233AC1BB4(*v2);
    *(_QWORD *)(inited + 40) = v7;
    sub_233AA71E0((uint64_t)(v2 + 8), (uint64_t)v17);
    swift_dynamicCast();
    v8 = sub_233A99EA4(inited);
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1A0);
    a2[3] = result;
    a2[4] = (unint64_t)&off_2504D5320;
    *a2 = v8;
  }
  else
  {
    sub_233AA71E0((uint64_t)(v2 + 8), (uint64_t)v17);
    __swift_instantiateConcreteTypeFromMangledName(a1);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE108);
    v10 = swift_initStackObject();
    *(_OWORD *)(v10 + 16) = xmmword_233AC3C20;
    *(_QWORD *)(v10 + 32) = sub_233AC1BB4(*v2);
    *(_QWORD *)(v10 + 40) = v11;
    sub_233AB1B30(v13, v14, v15, v16, (unint64_t *)(v10 + 48));
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE118);
      swift_arrayDestroy();
    }
    else
    {
      v12 = sub_233A99D78(v10);
      a2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
      a2[4] = (unint64_t)&off_2504D5320;
      *a2 = v12;
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_233AB2510@<X0>(void (*a1)(uint64_t)@<X0>, void (*a2)(uint64_t)@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE108);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
  *(_QWORD *)(inited + 32) = sub_233AC1BB4(*(_BYTE *)v3);
  *(_QWORD *)(inited + 40) = v6;
  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_BYTE *)(v3 + 24);
  v9 = *(_QWORD *)(v3 + 32);
  v10 = *(unsigned __int8 *)(v3 + 8);
  a1(v3);
  sub_233AB1528(v10, v7, v8, v9, (unint64_t *)(inited + 48));
  a2(v3);
  if (v14)
  {
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE118);
    return swift_arrayDestroy();
  }
  else
  {
    v12 = sub_233A99D78(inited);
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    a3[3] = result;
    a3[4] = (unint64_t)&off_2504D5320;
    *a3 = v12;
  }
  return result;
}

void AppleInternal.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t AppleInternal.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB2694@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB26A0@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB26AC()
{
  sub_233ABC444();
  return sub_233AC38D8();
}

uint64_t sub_233AB26D4()
{
  sub_233ABC444();
  return sub_233AC38E4();
}

uint64_t AppleInternal.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v11[40];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE438);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC444();
  sub_233AC38CC();
  sub_233AC1BB4(*v3);
  v11[0] = 0;
  sub_233AC3764();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE448);
    swift_dynamicCast();
    v11[0] = 1;
    sub_233AC3770();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t AppleInternal.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE450);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC444();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0x6E692D656C707061 && v9 == 0xEE006C616E726574)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB2AC8@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB4010(a1);
}

uint64_t sub_233AB2ADC@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return AppleInternal.init(from:)(a1, a2);
}

uint64_t sub_233AB2AF0(_QWORD *a1)
{
  return AppleInternal.encode(to:)(a1);
}

unint64_t CodeDirectoryHash.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_233AB58C8(a1, a2, 1, a3);
}

uint64_t static CodeDirectoryHash.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB2B1C(a1, 1, a2);
}

{
  return sub_233AB2B1C(a1, 1, a2);
}

uint64_t sub_233AB2B1C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  *(_BYTE *)a3 = a2;
  *(_QWORD *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE460);
  *(_QWORD *)(a3 + 40) = sub_233ABCE38(&qword_2560FE468, &qword_2560FE460, (uint64_t)&unk_233AC8A9C);
  v5 = swift_allocObject();
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(v5 + 16) = 22;
  *(_OWORD *)(v5 + 24) = xmmword_233AC8C20;
  *(_QWORD *)(v5 + 40) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AB2BAC(char *a1, char *a2)
{
  return sub_233AAFAB4(*a1, *a2) & 1;
}

uint64_t sub_233AB2BCC@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

void sub_233AB2BD8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 7955819;
  if (*v1)
    v2 = 0x65756C6176;
  v3 = 0xE300000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_233AB2C0C()
{
  _BYTE *v0;

  if (*v0)
    return 0x65756C6176;
  else
    return 7955819;
}

uint64_t sub_233AB2C3C@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB2C48()
{
  sub_233ABC54C();
  return sub_233AC38D8();
}

uint64_t sub_233AB2C70()
{
  sub_233ABC54C();
  return sub_233AC38E4();
}

uint64_t CodeDirectoryHash.encode(to:)(_QWORD *a1)
{
  return sub_233AB59B4(a1, &qword_2560FE470, (void (*)(void))sub_233ABC54C);
}

uint64_t CodeDirectoryHash.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  _OWORD v20[3];
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE498);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC54C();
  sub_233AC38C0();
  if (!v2)
  {
    v21 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v20[0]) = v17;
    if (sub_233AC1BB4(v17) == 0x687361686463 && v10 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    v21 = 1;
    sub_233ABC5E8();
    v12 = MEMORY[0x24BDCDDE8];
    sub_233AC3728();
    v14 = v17;
    v18 = v12;
    v19 = sub_233ABC488();
    v17 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v17, (uint64_t)v20 + 8);
    v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB2FC4@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB1EEC(a1);
}

uint64_t sub_233AB2FD8@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return CodeDirectoryHash.init(from:)(a1, a2);
}

uint64_t sub_233AB2FEC(_QWORD *a1)
{
  return CodeDirectoryHash.encode(to:)(a1);
}

uint64_t ProcessCodeSigningFlags.ValueSet.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static ProcessCodeSigningFlags.ValueSet.isDynamicallyValid.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ProcessCodeSigningFlags.ValueSet.isDebuggable.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ProcessCodeSigningFlags.ValueSet.canInstallFilesToSIPProtectedLocations.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static ProcessCodeSigningFlags.ValueSet.hasLibraryValidationBecauseOfHardenedRuntime.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static ProcessCodeSigningFlags.ValueSet.invalidAllowed.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static ProcessCodeSigningFlags.ValueSet.isEntitlementSetValidated.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x4000;
}

void static ProcessCodeSigningFlags.ValueSet.isAccessToNVRAMUnrestricted.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x8000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesWillBusErrorOnCodeSigningFailure.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x100000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesWillTerminateOnCodeSigningFailure.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x200000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesRequireCodeSignaturesForAllExecutableCode.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x400000;
}

void static ProcessCodeSigningFlags.ValueSet.launchedProcessesCanInstallFilesToSIPProtectedLocations.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x800000;
}

void static ProcessCodeSigningFlags.ValueSet.noUntrustedHelper.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x2000000;
}

void static ProcessCodeSigningFlags.ValueSet.isPlatformSigned.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x4000000;
}

void static ProcessCodeSigningFlags.ValueSet.platformPath.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x8000000;
}

void static ProcessCodeSigningFlags.ValueSet.isDebugged.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x10000000;
}

void static ProcessCodeSigningFlags.ValueSet.isSigned.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x20000000;
}

void static ProcessCodeSigningFlags.ValueSet.isDevelopmentSigned.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x40000000;
}

void static ProcessCodeSigningFlags.ValueSet.dataVaultController.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x80000000;
}

uint64_t sub_233AB30E0()
{
  sub_233ABD13C();
  return sub_233AC3614();
}

uint64_t sub_233AB313C()
{
  sub_233ABD13C();
  return sub_233AC35FC();
}

uint64_t sub_233AB3190()
{
  return sub_233AC3674();
}

uint64_t sub_233AB31A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_233AB31BC(a1, a2);
}

uint64_t sub_233AB31BC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_233AB3218()
{
  sub_233ABC660();
  return sub_233AC38D8();
}

uint64_t sub_233AB3240()
{
  sub_233ABC660();
  return sub_233AC38E4();
}

uint64_t ProcessCodeSigningFlags.encode(to:)(_QWORD *a1)
{
  return sub_233AB38C8(a1, &qword_2560FE4B0, (void (*)(void))sub_233ABC660);
}

uint64_t ProcessCodeSigningFlags.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB3AA0(a1, &qword_2560FE4D0, (void (*)(void))sub_233ABC660, a2);
}

uint64_t sub_233AB32C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ProcessCodeSigningFlags.init(from:)(a1, a2);
}

uint64_t sub_233AB32D4(_QWORD *a1)
{
  return ProcessCodeSigningFlags.encode(to:)(a1);
}

uint64_t sub_233AB32E8@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB2510((void (*)(uint64_t))sub_233AC18BC, (void (*)(uint64_t))sub_233AC18C0, a1);
}

uint64_t OnDiskCodeSigningFlags.ValueSet.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static OnDiskCodeSigningFlags.ValueSet.isAdhocSigned.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static OnDiskCodeSigningFlags.ValueSet.signalsBusErrorOnCodeSigningFailure.getter(_QWORD *a1@<X8>)
{
  *a1 = 256;
}

void static OnDiskCodeSigningFlags.ValueSet.terminatesOnCodeSigningFailure.getter(_QWORD *a1@<X8>)
{
  *a1 = 512;
}

void static OnDiskCodeSigningFlags.ValueSet.isCertificateExpirationEnforced.getter(_QWORD *a1@<X8>)
{
  *a1 = 1024;
}

void static OnDiskCodeSigningFlags.ValueSet.isDynamicLinkerPolicyHardened.getter(_QWORD *a1@<X8>)
{
  *a1 = 2048;
}

void static OnDiskCodeSigningFlags.ValueSet.isCodeSignatureRequiredForAllExecutableCode.getter(_QWORD *a1@<X8>)
{
  *a1 = 4096;
}

void static OnDiskCodeSigningFlags.ValueSet.isLibraryValidationRequired.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x2000;
}

void static OnDiskCodeSigningFlags.ValueSet.isHardenedRuntimeEnforced.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x10000;
}

void static OnDiskCodeSigningFlags.ValueSet.isSignedByLinker.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x20000;
}

uint64_t sub_233AB33A4()
{
  sub_233ABD484();
  return sub_233AC3614();
}

uint64_t sub_233AB3400()
{
  sub_233ABD484();
  return sub_233AC35FC();
}

_QWORD *sub_233AB344C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_233AB3458(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_233AB3460@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_233AB3474@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_233AB3488@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_233AB349C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_233AB34CC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_233AB34F8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_233AB351C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_233AB3530(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_233AB3544(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_233AB3558@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_233AB356C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_233AB3580(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_233AB3594(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_233AB35A8()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_233AB35B8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_233AB35CC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_233AB35DC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_233AB35E8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_233AB35FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned __int8 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t result;
  unsigned __int8 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _BYTE *v16;
  _BYTE v17[40];

  sub_233AA71E0(a1, (uint64_t)v17);
  v5 = sub_233AB0614((uint64_t)v17);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1(a1);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  if (sub_233AC1BB4(v5) == 0x68632D67616C6624 && v14 == 0xEB000000006B6365)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_233AA45E0();
      swift_allocError();
      *v16 = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1(a1);
    }
  }
  result = __swift_destroy_boxed_opaque_existential_1(a1);
  *(_BYTE *)a2 = 2;
  *(_BYTE *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v11;
  *(_BYTE *)(a2 + 24) = v12 & 1;
  *(_QWORD *)(a2 + 32) = v13;
  return result;
}

BOOL sub_233AB3764(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_233AB377C()
{
  sub_233AC3890();
  sub_233AC389C();
  return sub_233AC38B4();
}

uint64_t sub_233AB37C0()
{
  return sub_233AC389C();
}

uint64_t sub_233AB37E8()
{
  sub_233AC3890();
  sub_233AC389C();
  return sub_233AC38B4();
}

uint64_t sub_233AB3828@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AC14A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_233AB384C()
{
  sub_233ABC6A4();
  return sub_233AC38D8();
}

uint64_t sub_233AB3874()
{
  sub_233ABC6A4();
  return sub_233AC38E4();
}

uint64_t OnDiskCodeSigningFlags.encode(to:)(_QWORD *a1)
{
  return sub_233AB38C8(a1, &qword_2560FE4E0, (void (*)(void))sub_233ABC6A4);
}

uint64_t sub_233AB38C8(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  int v22;
  char v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v17 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v3;
  v22 = v3[8];
  v15 = *((_QWORD *)v3 + 2);
  v14 = v3[24];
  v13 = *((_QWORD *)v3 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_233AC38CC();
  v18 = v9;
  v23 = 0;
  sub_233AA2828();
  v10 = v16;
  sub_233AC377C();
  if (!v10)
  {
    v18 = v22;
    v19 = v15;
    v20 = v14;
    v21 = v13;
    v23 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
    sub_233ABCE38(&qword_2560FE4C8, &qword_2560FE4C0, (uint64_t)&unk_233AC8A24);
    sub_233AC377C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v6);
}

uint64_t OnDiskCodeSigningFlags.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB3AA0(a1, &qword_2560FE4F0, (void (*)(void))sub_233ABC6A4, a2);
}

uint64_t sub_233AB3AA0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, void (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;

  v19 = a4;
  v20 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_233AC38C0();
  if (!v4)
  {
    v10 = v7;
    v11 = v19;
    v25 = 0;
    sub_233AA459C();
    v12 = v20;
    sub_233AC3728();
    v13 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
    v25 = 1;
    sub_233ABCE38(&qword_2560FE4D8, &qword_2560FE4C0, (uint64_t)&unk_233AC89FC);
    sub_233AC3728();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v9, v12);
    v14 = v21;
    v15 = v22;
    v16 = v23;
    v17 = v24;
    *(_BYTE *)v11 = v13;
    *(_BYTE *)(v11 + 8) = v14;
    *(_QWORD *)(v11 + 16) = v15;
    *(_BYTE *)(v11 + 24) = v16;
    *(_QWORD *)(v11 + 32) = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB3C68@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return OnDiskCodeSigningFlags.init(from:)(a1, a2);
}

uint64_t sub_233AB3C7C(_QWORD *a1)
{
  return OnDiskCodeSigningFlags.encode(to:)(a1);
}

uint64_t sub_233AB3C90@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB2510((void (*)(uint64_t))sub_233AC15C0, (void (*)(uint64_t))sub_233AC15E8, a1);
}

void DeveloperMode.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 3;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t DeveloperMode.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 3;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB3D24@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB3D30@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB3D3C()
{
  sub_233ABC6E8();
  return sub_233AC38D8();
}

uint64_t sub_233AB3D64()
{
  sub_233ABC6E8();
  return sub_233AC38E4();
}

uint64_t DeveloperMode.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE4F8, (void (*)(void))sub_233ABC6E8);
}

uint64_t DeveloperMode.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE508);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC6E8();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0x65706F6C65766564 && v9 == 0xEE0065646F6D2D72)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB4010@<X0>(unint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
  *(_QWORD *)(inited + 32) = sub_233AC1BB4(*v2);
  *(_QWORD *)(inited + 40) = v5;
  sub_233AA71E0((uint64_t)(v2 + 8), (uint64_t)&v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE448);
  swift_dynamicCast();
  v6 = sub_233A9A0F0(inited);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF1C0);
  a1[3] = result;
  a1[4] = (unint64_t)&off_2504D5320;
  *a1 = v6;
  return result;
}

uint64_t sub_233AB40E0@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return DeveloperMode.init(from:)(a1, a2);
}

uint64_t sub_233AB40F4(_QWORD *a1)
{
  return DeveloperMode.encode(to:)(a1);
}

LightweightCodeRequirements::EntitlementsQuery::DataType_optional __swiftcall EntitlementsQuery.DataType.init(rawValue:)(Swift::Int64 rawValue)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x40302010005uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 6)
    LOBYTE(v2) = 5;
  *v1 = v2;
  return (LightweightCodeRequirements::EntitlementsQuery::DataType_optional)rawValue;
}

uint64_t EntitlementsQuery.DataType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

BOOL sub_233AB413C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_233AB4150()
{
  sub_233AC3890();
  sub_233AC38A8();
  return sub_233AC38B4();
}

uint64_t sub_233AB4194()
{
  return sub_233AC38A8();
}

uint64_t sub_233AB41C0()
{
  sub_233AC3890();
  sub_233AC38A8();
  return sub_233AC38B4();
}

LightweightCodeRequirements::EntitlementsQuery::DataType_optional sub_233AB4200(Swift::Int64 *a1)
{
  return EntitlementsQuery.DataType.init(rawValue:)(*a1);
}

void sub_233AB4208(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t static EntitlementsQuery.key(_:)(uint64_t a1, uint64_t a2)
{
  return sub_233AB45C8(a1, a2, 1);
}

uint64_t sub_233AB4220(uint64_t a1, uint64_t a2)
{
  return sub_233AB4238(a1, a2, 1);
}

uint64_t sub_233AB4228(uint64_t a1)
{
  return sub_233AB44A4(a1, 2);
}

uint64_t sub_233AB4230(uint64_t a1, uint64_t a2)
{
  return sub_233AB4238(a1, a2, 3);
}

uint64_t sub_233AB4238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE510);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE4008];
  *(_QWORD *)(v7 + 64) = &off_2504D5368;
  *(_QWORD *)(v7 + 32) = a3;
  v8 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v7 + 16) = xmmword_233AC3C30;
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = &off_2504D5380;
  *(_QWORD *)(v7 + 72) = a1;
  *(_QWORD *)(v7 + 80) = a2;
  v9 = *(_QWORD **)(v3 + 24);
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v3 + 24) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_233ABC74C(0, v9[2] + 1, 1, v9, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v3 + 24) = v9;
  }
  v12 = v9[2];
  v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    v9 = sub_233ABC74C((_QWORD *)(v11 > 1), v12 + 1, 1, v9, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v3 + 24) = v9;
  }
  v9[2] = v12 + 1;
  v9[v12 + 4] = v7;
  return swift_retain();
}

uint64_t sub_233AB4368(uint64_t a1, uint64_t a2)
{
  return sub_233AB4238(a1, a2, 4);
}

uint64_t sub_233AB4370(char a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v6;
  unint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE510);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_233AC3C30;
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE4008];
  *(_QWORD *)(v3 + 64) = &off_2504D5368;
  *(_QWORD *)(v3 + 32) = 5;
  *(_QWORD *)(v3 + 96) = MEMORY[0x24BEE1328];
  *(_QWORD *)(v3 + 104) = &off_2504D5398;
  *(_BYTE *)(v3 + 72) = a1;
  v4 = *(_QWORD **)(v1 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 24) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v4 = sub_233ABC74C(0, v4[2] + 1, 1, v4, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v1 + 24) = v4;
  }
  v7 = v4[2];
  v6 = v4[3];
  if (v7 >= v6 >> 1)
  {
    v4 = sub_233ABC74C((_QWORD *)(v6 > 1), v7 + 1, 1, v4, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v1 + 24) = v4;
  }
  v4[2] = v7 + 1;
  v4[v7 + 4] = v3;
  return swift_retain();
}

uint64_t sub_233AB4494(uint64_t a1, uint64_t a2)
{
  return sub_233AB4238(a1, a2, 6);
}

uint64_t sub_233AB449C(uint64_t a1)
{
  return sub_233AB44A4(a1, 7);
}

uint64_t sub_233AB44A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE510);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_233AC3C30;
  v6 = MEMORY[0x24BEE4008];
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE4008];
  *(_QWORD *)(v5 + 64) = &off_2504D5368;
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 96) = v6;
  *(_QWORD *)(v5 + 104) = &off_2504D5368;
  *(_QWORD *)(v5 + 72) = a1;
  v7 = *(_QWORD **)(v2 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v2 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_233ABC74C(0, v7[2] + 1, 1, v7, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v2 + 24) = v7;
  }
  v10 = v7[2];
  v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    v7 = sub_233ABC74C((_QWORD *)(v9 > 1), v10 + 1, 1, v7, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v2 + 24) = v7;
  }
  v7[2] = v10 + 1;
  v7[v10 + 4] = v5;
  return swift_retain();
}

uint64_t sub_233AB45B8(uint64_t a1, uint64_t a2)
{
  return sub_233AB4238(a1, a2, 8);
}

uint64_t static EntitlementsQuery.keyPrefix(_:)(uint64_t a1, uint64_t a2)
{
  return sub_233AB45C8(a1, a2, 9);
}

uint64_t sub_233AB45C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE510);
  v6 = swift_allocObject();
  v7 = MEMORY[0x24BEE4008];
  *(_OWORD *)(v6 + 16) = xmmword_233AC3C30;
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = &off_2504D5368;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 96) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 104) = &off_2504D5380;
  *(_QWORD *)(v6 + 72) = a1;
  *(_QWORD *)(v6 + 80) = a2;
  type metadata accessor for EntitlementsQuery();
  v8 = swift_allocObject();
  *(_WORD *)(v8 + 16) = 7684;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE518);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_233AC3C20;
  *(_QWORD *)(v9 + 32) = v6;
  *(_QWORD *)(v8 + 24) = v9;
  swift_bridgeObjectRetain();
  return v8;
}

uint64_t sub_233AB46A0(uint64_t a1, uint64_t a2)
{
  return sub_233AB4238(a1, a2, 9);
}

uint64_t sub_233AB46A8(uint64_t a1)
{
  return sub_233AB44A4(a1, 10);
}

uint64_t sub_233AB46B0(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE510);
  v3 = swift_allocObject();
  v4 = MEMORY[0x24BEE4008];
  *(_OWORD *)(v3 + 16) = xmmword_233AC3C30;
  *(_QWORD *)(v3 + 56) = v4;
  *(_QWORD *)(v3 + 64) = &off_2504D5368;
  *(_QWORD *)(v3 + 32) = 11;
  *(_QWORD *)(v3 + 96) = v4;
  *(_QWORD *)(v3 + 104) = &off_2504D5368;
  *(_QWORD *)(v3 + 72) = v2 + 1;
  v5 = *(_QWORD **)(v1 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v1 + 24) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = sub_233ABC74C(0, v5[2] + 1, 1, v5, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v1 + 24) = v5;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    v5 = sub_233ABC74C((_QWORD *)(v7 > 1), v8 + 1, 1, v5, &qword_2560FE518, &qword_2560FF208);
    *(_QWORD *)(v1 + 24) = v5;
  }
  v5[2] = v8 + 1;
  v5[v8 + 4] = v3;
  return swift_retain();
}

uint64_t sub_233AB47C8@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE130);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
  *(_QWORD *)(inited + 32) = sub_233AC1BB4(*(_BYTE *)(v1 + 16));
  *(_QWORD *)(inited + 40) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE138);
  v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_233AC3C20;
  *(_QWORD *)(v5 + 32) = sub_233AC1BB4(*(_BYTE *)(v1 + 17));
  *(_QWORD *)(v5 + 40) = v6;
  *(_QWORD *)(v5 + 48) = *(_QWORD *)(v1 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_233A9A32C(v5);
  v7 = sub_233A9A338(inited);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE140);
  a1[3] = result;
  a1[4] = (unint64_t)&off_2504D5320;
  *a1 = v7;
  return result;
}

uint64_t sub_233AB48A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_233AAF9A4(*a1, *a2);
}

uint64_t sub_233AB48B0()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AB494C()
{
  sub_233AC35D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AB49C4()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AB4A5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AC1578();
  *a1 = result;
  return result;
}

void sub_233AB4A88(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE300000000000000;
  v4 = 0xEB0000000079654BLL;
  v5 = 0x726F74617265706FLL;
  if (v2 != 1)
  {
    v5 = 0x65756C6176;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 7955819;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_233AB4AE4()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x726F74617265706FLL;
  if (*v0 != 1)
    v1 = 0x65756C6176;
  if (*v0)
    return v1;
  else
    return 7955819;
}

uint64_t sub_233AB4B3C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AC1578();
  *a1 = result;
  return result;
}

uint64_t sub_233AB4B60()
{
  sub_233ABC870();
  return sub_233AC38D8();
}

uint64_t sub_233AB4B88()
{
  sub_233ABC870();
  return sub_233AC38E4();
}

uint64_t sub_233AB4BB0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[40];
  _BYTE v20[40];
  _BYTE v21[24];
  uint64_t v22;
  _BYTE v23[24];
  uint64_t v24;
  unint64_t v25;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE520);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC870();
  sub_233AC38CC();
  v23[0] = *(_BYTE *)(v3 + 16);
  v21[0] = 0;
  sub_233AA2828();
  sub_233AC377C();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v23[0] = *(_BYTE *)(v3 + 17);
  v21[0] = 1;
  sub_233AC377C();
  v21[0] = 2;
  sub_233AC374C();
  v10 = *(_QWORD *)(v3 + 24);
  v15[0] = *(_QWORD *)(v10 + 16);
  if (v15[0])
  {
    v18 = v10 + 32;
    result = swift_bridgeObjectRetain();
    v11 = 0;
    v17 = v6;
    v16 = result;
    while (v11 < *(_QWORD *)(result + 16))
    {
      v25 = v11;
      v12 = *(_QWORD *)(v18 + 8 * v11);
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
      swift_bridgeObjectRetain();
      sub_233AC3800();
      v13 = *(_QWORD *)(v12 + 16);
      if (v13)
      {
        v15[1] = v12;
        v14 = v12 + 32;
        do
        {
          sub_233AA71E0(v14, (uint64_t)v20);
          sub_233AA71E0((uint64_t)v20, (uint64_t)v19);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE530);
          if (swift_dynamicCast())
          {
            __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
            sub_233AC3830();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
          }
          else
          {
            sub_233AA71E0((uint64_t)v20, (uint64_t)v19);
            if (swift_dynamicCast())
            {
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              sub_233AC380C();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
              swift_bridgeObjectRelease();
            }
            else
            {
              sub_233AA71E0((uint64_t)v20, (uint64_t)v19);
              result = swift_dynamicCast();
              if (!(_DWORD)result)
                goto LABEL_20;
              __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
              sub_233AC3818();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
            }
          }
          v14 += 40;
          --v13;
        }
        while (v13);
      }
      swift_bridgeObjectRelease();
      v11 = v25 + 1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      v6 = v17;
      result = v16;
      if (v11 == v15[0])
      {
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
  }
  else
  {
LABEL_18:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  return result;
}

uint64_t EntitlementsQuery.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  EntitlementsQuery.init(from:)(a1);
  return v2;
}

uint64_t EntitlementsQuery.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unsigned __int8 v13;
  uint64_t v14;
  char v15;
  _BYTE *v16;
  char v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  __int128 v28;
  uint64_t v29;
  _UNKNOWN **v30;
  _QWORD v31[3];
  uint64_t v32;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE538);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC870();
  sub_233AC38C0();
  if (v2)
    goto LABEL_14;
  LOBYTE(v31[0]) = 0;
  sub_233AA459C();
  sub_233AC3728();
  v35 = v6;
  v9 = v33[0];
  *(_BYTE *)(v1 + 16) = v33[0];
  if (sub_233AC1BB4(v9) == 0x6D656C7469746E65 && v10 == 0xEC00000073746E65)
  {
    swift_bridgeObjectRelease();
    v11 = v35;
  }
  else
  {
    v12 = sub_233AC383C();
    swift_bridgeObjectRelease();
    v11 = v35;
    if ((v12 & 1) == 0)
    {
LABEL_13:
      sub_233AA45E0();
      swift_allocError();
      *v16 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v5);
LABEL_14:
      type metadata accessor for EntitlementsQuery();
      swift_deallocPartialClassInstance();
      goto LABEL_15;
    }
  }
  LOBYTE(v31[0]) = 1;
  sub_233AC3728();
  v13 = v33[0];
  *(_BYTE *)(v1 + 17) = v33[0];
  if (sub_233AC1BB4(v13) != 0x797265757124 || v14 != 0xE600000000000000)
  {
    v15 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  LOBYTE(v31[0]) = 2;
  sub_233AC36F8();
  __swift_project_boxed_opaque_existential_1(v33, v34);
  if ((sub_233AC37F4() & 1) != 0)
  {
    v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v27 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v34);
      sub_233AC37B8();
      __swift_project_boxed_opaque_existential_1(v31, v32);
      v18 = sub_233AC37F4();
      v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if ((v18 & 1) == 0)
      {
        do
        {
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
          v23 = sub_233AC37E8();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v19 = sub_233ABC8B4(0, v19[2] + 1, 1, v19, &qword_2560FE510, &qword_2560FE530);
          v25 = v19[2];
          v24 = v19[3];
          if (v25 >= v24 >> 1)
            v19 = sub_233ABC8B4((_QWORD *)(v24 > 1), v25 + 1, 1, v19, &qword_2560FE510, &qword_2560FE530);
          v30 = &off_2504D5368;
          v29 = MEMORY[0x24BEE4008];
          *(_QWORD *)&v28 = v23;
          v19[2] = v25 + 1;
          sub_233AA4660(&v28, (uint64_t)&v19[5 * v25 + 4]);
          __swift_project_boxed_opaque_existential_1(v31, v32);
        }
        while ((sub_233AC37F4() & 1) == 0);
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v27 = sub_233ABC74C(0, v27[2] + 1, 1, v27, &qword_2560FE518, &qword_2560FF208);
      v21 = v27[2];
      v20 = v27[3];
      v11 = v35;
      if (v21 >= v20 >> 1)
        v27 = sub_233ABC74C((_QWORD *)(v20 > 1), v21 + 1, 1, v27, &qword_2560FE518, &qword_2560FF208);
      v22 = v27;
      v27[2] = v21 + 1;
      v22[v21 + 4] = v19;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      __swift_project_boxed_opaque_existential_1(v33, v34);
    }
    while ((sub_233AC37F4() & 1) == 0);
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v5);
  *(_QWORD *)(v3 + 24) = v27;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
LABEL_15:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t EntitlementsQuery.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EntitlementsQuery.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_233AB582C@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB47C8(a1);
}

uint64_t sub_233AB584C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for EntitlementsQuery();
  v5 = swift_allocObject();
  result = EntitlementsQuery.init(from:)(a1);
  if (!v2)
    *a2 = v5;
  return result;
}

uint64_t sub_233AB58A0(_QWORD *a1)
{
  return sub_233AB4BB0(a1);
}

unint64_t InfoPlistHash.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_233AB58C8(a1, a2, 5, a3);
}

unint64_t sub_233AB58C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  unint64_t result;

  *(_BYTE *)a4 = a3;
  *(_QWORD *)(a4 + 32) = MEMORY[0x24BDCDDE8];
  result = sub_233ABC488();
  *(_QWORD *)(a4 + 40) = result;
  *(_QWORD *)(a4 + 8) = a1;
  *(_QWORD *)(a4 + 16) = a2;
  return result;
}

uint64_t static InfoPlistHash.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB2B1C(a1, 5, a2);
}

{
  return sub_233AB2B1C(a1, 5, a2);
}

uint64_t sub_233AB5920@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB592C@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB5938()
{
  sub_233ABC9EC();
  return sub_233AC38D8();
}

uint64_t sub_233AB5960()
{
  sub_233ABC9EC();
  return sub_233AC38E4();
}

uint64_t InfoPlistHash.encode(to:)(_QWORD *a1)
{
  return sub_233AB59B4(a1, &qword_2560FE540, (void (*)(void))sub_233ABC9EC);
}

uint64_t sub_233AB59B4(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  _BYTE *v3;
  _BYTE *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_233AC38CC();
  LOBYTE(v22) = *v5;
  LOBYTE(v18) = 0;
  sub_233AA2828();
  v11 = v26;
  sub_233AC377C();
  if (v11)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_233AA71E0((uint64_t)(v5 + 8), (uint64_t)&v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE480);
  if (swift_dynamicCast())
  {
    v13 = v18;
    v14 = v19;
    v22 = v18;
    v23 = v19;
    LOBYTE(v18) = 1;
    sub_233ABC5A4();
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return sub_233AA94E0(v13, v14);
  }
  else
  {
    sub_233AA71E0((uint64_t)(v5 + 8), (uint64_t)&v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE460);
    result = swift_dynamicCast();
    if ((_DWORD)result)
    {
      v15 = v19;
      v16 = v20;
      LOBYTE(v22) = v18;
      v23 = v19;
      v24 = v20;
      v25 = v21;
      LOBYTE(v18) = 1;
      sub_233ABCE38(&qword_2560FE488, &qword_2560FE460, (uint64_t)&unk_233AC8A24);
      sub_233AC377C();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      sub_233ABC590(v15, v16);
      return swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t InfoPlistHash.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  _OWORD v20[3];
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE550);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABC9EC();
  sub_233AC38C0();
  if (!v2)
  {
    v21 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v20[0]) = v17;
    if (sub_233AC1BB4(v17) == 0x696C702D6F666E69 && v10 == 0xEF687361682D7473)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    v21 = 1;
    sub_233ABC5E8();
    v12 = MEMORY[0x24BDCDDE8];
    sub_233AC3728();
    v14 = v17;
    v18 = v12;
    v19 = sub_233ABC488();
    v17 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v17, (uint64_t)v20 + 8);
    v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB5F54@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE v22[40];
  uint64_t v23;

  sub_233AA71E0(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v7 = MEMORY[0x24BDCDDE8];
  if ((swift_dynamicCast() & 1) != 0)
  {
    v8 = v18;
    v9 = v19;
    *(_BYTE *)a3 = a2;
    *(_QWORD *)(a3 + 32) = v7;
    *(_QWORD *)(a3 + 40) = sub_233ABC488();
    *(_QWORD *)(a3 + 8) = v8;
    *(_QWORD *)(a3 + 16) = v9;
  }
  else
  {
    sub_233AA71E0(a1, (uint64_t)v22);
    sub_233AB0404((uint64_t)v22, (uint64_t)&v18);
    if (!v3)
    {
      v10 = v18;
      v12 = v19;
      v11 = v20;
      v23 = v21;
      if (sub_233AC1BB4(v18) == 7235876 && v13 == 0xE300000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v14 = sub_233AC383C();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {
          sub_233AA45E0();
          swift_allocError();
          *v16 = 1;
          swift_willThrow();
          sub_233ABC590(v12, v11);
          swift_bridgeObjectRelease();
          return __swift_destroy_boxed_opaque_existential_1(a1);
        }
      }
      *(_BYTE *)a3 = a2;
      *(_QWORD *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE460);
      *(_QWORD *)(a3 + 40) = sub_233ABCE38(&qword_2560FE468, &qword_2560FE460, (uint64_t)&unk_233AC8A9C);
      v15 = swift_allocObject();
      *(_QWORD *)(a3 + 8) = v15;
      *(_BYTE *)(v15 + 16) = v10;
      *(_QWORD *)(v15 + 24) = v12;
      *(_QWORD *)(v15 + 32) = v11;
      *(_QWORD *)(v15 + 40) = v23;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_233AB6138@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return InfoPlistHash.init(from:)(a1, a2);
}

uint64_t sub_233AB614C(_QWORD *a1)
{
  return InfoPlistHash.encode(to:)(a1);
}

void InTrustCacheWithConstraintCategory.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 6;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t InTrustCacheWithConstraintCategory.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 6;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB61AC@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB61B8@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB61C4()
{
  sub_233ABCA30();
  return sub_233AC38D8();
}

uint64_t sub_233AB61EC()
{
  sub_233ABCA30();
  return sub_233AC38E4();
}

uint64_t InTrustCacheWithConstraintCategory.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE558, (void (*)(void))sub_233ABCA30);
}

uint64_t sub_233AB6240(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v12;
  _BYTE v13[56];

  v6 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v12 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_233AC38CC();
  v13[0] = *v6;
  v13[55] = 0;
  sub_233AA2828();
  sub_233AC377C();
  if (!v4)
  {
    sub_233AA71E0((uint64_t)(v6 + 8), (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE448);
    swift_dynamicCast();
    v13[0] = 1;
    sub_233AC3770();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v12 + 8))(v10, v8);
}

uint64_t InTrustCacheWithConstraintCategory.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE568);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCA30();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD00000000000001ELL && v9 == 0x8000000233AC91E0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB65E4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return InTrustCacheWithConstraintCategory.init(from:)(a1, a2);
}

uint64_t sub_233AB65F8(_QWORD *a1)
{
  return InTrustCacheWithConstraintCategory.encode(to:)(a1);
}

void IsInitProcess.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 7;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t IsInitProcess.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 7;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB6658@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB6664@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB6670()
{
  sub_233ABCA74();
  return sub_233AC38D8();
}

uint64_t sub_233AB6698()
{
  sub_233ABCA74();
  return sub_233AC38E4();
}

uint64_t IsInitProcess.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE570, (void (*)(void))sub_233ABCA74);
}

uint64_t IsInitProcess.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE580);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCA74();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0x2D74696E692D7369 && v9 == 0xEC000000636F7270)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB6938@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsInitProcess.init(from:)(a1, a2);
}

uint64_t sub_233AB694C(_QWORD *a1)
{
  return IsInitProcess.encode(to:)(a1);
}

void IsMainBinary.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 8;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t IsMainBinary.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 8;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB69AC@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB69B8@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB69C4()
{
  sub_233ABCAB8();
  return sub_233AC38D8();
}

uint64_t sub_233AB69EC()
{
  sub_233ABCAB8();
  return sub_233AC38E4();
}

uint64_t IsMainBinary.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE588, (void (*)(void))sub_233ABCAB8);
}

uint64_t IsMainBinary.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE598);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCAB8();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0x2D6E69616D2D7369 && v9 == 0xEE007972616E6962)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB6C98@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsMainBinary.init(from:)(a1, a2);
}

uint64_t sub_233AB6CAC(_QWORD *a1)
{
  return IsMainBinary.encode(to:)(a1);
}

void IsSIPProtected.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 9;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t IsSIPProtected.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 9;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB6D0C@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB6D18@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB6D24()
{
  sub_233ABCAFC();
  return sub_233AC38D8();
}

uint64_t sub_233AB6D4C()
{
  sub_233ABCAFC();
  return sub_233AC38E4();
}

uint64_t IsSIPProtected.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE5A0, (void (*)(void))sub_233ABCAFC);
}

uint64_t IsSIPProtected.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCAFC();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD000000000000010 && v9 == 0x8000000233AC9220)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB6FD4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return IsSIPProtected.init(from:)(a1, a2);
}

uint64_t sub_233AB6FE8(_QWORD *a1)
{
  return IsSIPProtected.encode(to:)(a1);
}

uint64_t LaunchType.Value.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t LaunchType.Value.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;

  if (result <= 3)
    v2 = result;
  else
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = result > 3;
  return result;
}

void static LaunchType.Value.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static LaunchType.Value.application.getter(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_233AB7030()
{
  sub_233ABDD20();
  return sub_233AC3614();
}

uint64_t sub_233AB708C()
{
  sub_233ABDD20();
  return sub_233AC35FC();
}

uint64_t sub_233AB70DC()
{
  return sub_233AC38A8();
}

uint64_t *sub_233AB7108@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 3;
  if ((unint64_t)*result > 3)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t *LaunchType.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  v3 = MEMORY[0x24BEE4008];
  *(_BYTE *)a2 = 10;
  *(_QWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 40) = &off_2504D2908;
  *(_QWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t static LaunchType.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB718C(a1, 10, &qword_2560FE5B8, &qword_2560FE5C0, a2);
}

{
  return sub_233AB718C(a1, 10, &qword_2560FE5B8, &qword_2560FE5C0, a2);
}

uint64_t sub_233AB718C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;

  *(_BYTE *)a5 = a2;
  *(_QWORD *)(a5 + 32) = __swift_instantiateConcreteTypeFromMangledName(a3);
  *(_QWORD *)(a5 + 40) = sub_233ABCE38(a4, a3, (uint64_t)&unk_233AC8710);
  v9 = swift_allocObject();
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(v9 + 16) = 22;
  *(_QWORD *)(v9 + 24) = 0;
  *(_BYTE *)(v9 + 32) = 1;
  *(_QWORD *)(v9 + 40) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AB7220@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB722C@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB7238()
{
  sub_233ABCB40();
  return sub_233AC38D8();
}

uint64_t sub_233AB7260()
{
  sub_233ABCB40();
  return sub_233AC38E4();
}

uint64_t LaunchType.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15[8];
  uint64_t v16;
  char v17;
  uint64_t v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCB40();
  sub_233AC38CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_233AA2828();
  sub_233AC377C();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5D8);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_233AC3788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5B8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    LOBYTE(v11) = 1;
    sub_233ABCE38(&qword_2560FE5E0, &qword_2560FE5B8, (uint64_t)&unk_233AC8A24);
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LaunchType.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCB40();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0x742D68636E75616CLL && v10 == 0xEB00000000657079)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    v12 = sub_233AC3734();
    v17 = MEMORY[0x24BEE4008];
    v18 = &off_2504D2908;
    *(_QWORD *)&v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v16, (uint64_t)v19 + 8);
    v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB77BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t inited;
  unint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  _UNKNOWN **v37;
  uint64_t v38[6];
  uint64_t v39;

  sub_233AA71E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v5 = MEMORY[0x24BEE4008];
  if ((swift_dynamicCast() & 1) != 0)
  {
    v6 = v38[0];
    if (v38[0] < 4uLL)
    {
      *(_BYTE *)a2 = 10;
      *(_QWORD *)(a2 + 32) = v5;
      *(_QWORD *)(a2 + 40) = &off_2504D2908;
      *(_QWORD *)(a2 + 8) = v6;
LABEL_19:
      v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
LABEL_18:
    sub_233AA45E0();
    swift_allocError();
    *v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  sub_233AA71E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  if (*(_QWORD *)(v38[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_233AADB84(v38[0], (uint64_t)&v34);
  result = swift_bridgeObjectRelease();
  v8 = v35;
  if (v35)
  {
    v9 = v34;
    sub_233AA4660(&v36, (uint64_t)v38);
    sub_233AA71E0((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF218);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v30 = a2;
      v10 = v31[0];
      v11 = *(_QWORD *)(v31[0] + 16);
      if (v11)
      {
        v39 = v8;
        swift_bridgeObjectRetain();
        v12 = 0;
        v13 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          v14 = *(_QWORD *)(v10 + 8 * v12 + 32);
          if (v14 <= 3)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v13 = sub_233ABC328(0, *((_QWORD *)v13 + 2) + 1, 1, v13, qword_2560FF288);
            v16 = *((_QWORD *)v13 + 2);
            v15 = *((_QWORD *)v13 + 3);
            if (v16 >= v15 >> 1)
              v13 = sub_233ABC328((char *)(v15 > 1), v16 + 1, 1, v13, qword_2560FF288);
            *((_QWORD *)v13 + 2) = v16 + 1;
            *(_QWORD *)&v13[8 * v16 + 32] = v14;
          }
          ++v12;
        }
        while (v11 != v12);
        swift_bridgeObjectRelease();
        v19 = *(_QWORD *)(v10 + 16);
        v8 = v39;
      }
      else
      {
        v19 = 0;
        v13 = (char *)MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRelease();
      if (v19 == *((_QWORD *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF270);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
        *(_QWORD *)(inited + 32) = v9;
        *(_QWORD *)(inited + 40) = v8;
        *(_QWORD *)(inited + 48) = v13;
        v21 = sub_233A9A35C(inited);
        *((_QWORD *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF278);
        v37 = &off_2504D5320;
        v34 = v21;
        sub_233AB0A1C((uint64_t)&v34, &qword_2560FF280, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        v22 = v31[0];
        v23 = v31[1];
        v24 = v32;
        v25 = v33;
        if (sub_233AC1BB4(v31[0]) == 7235876 && v26 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(_BYTE *)v30 = 10;
          *(_QWORD *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5B8);
          *(_QWORD *)(v30 + 40) = sub_233ABCE38(&qword_2560FE5C0, &qword_2560FE5B8, (uint64_t)&unk_233AC8710);
          v29 = swift_allocObject();
          *(_QWORD *)(v30 + 8) = v29;
          *(_BYTE *)(v29 + 16) = v22;
          *(_QWORD *)(v29 + 24) = v23;
          *(_BYTE *)(v29 + 32) = v24;
          *(_QWORD *)(v29 + 40) = v25;
          goto LABEL_30;
        }
        v28 = sub_233AC383C();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
          goto LABEL_32;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_233AA45E0();
    swift_allocError();
    *v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB7BF0@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return LaunchType.init(from:)(a1, a2);
}

uint64_t sub_233AB7C04(_QWORD *a1)
{
  return LaunchType.encode(to:)(a1);
}

uint64_t sub_233AB7C18@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB2318(&qword_2560FE5B8, a1);
}

void OnAuthorizedAuthAPFSVolume.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 11;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t OnAuthorizedAuthAPFSVolume.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 11;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB7C80@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB7C8C@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB7C98()
{
  sub_233ABCB84();
  return sub_233AC38D8();
}

uint64_t sub_233AB7CC0()
{
  sub_233ABCB84();
  return sub_233AC38E4();
}

uint64_t OnAuthorizedAuthAPFSVolume.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE5F8, (void (*)(void))sub_233ABCB84);
}

uint64_t OnAuthorizedAuthAPFSVolume.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE608);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCB84();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD00000000000001DLL && v9 == 0x8000000233AC9240)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB7F48@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnAuthorizedAuthAPFSVolume.init(from:)(a1, a2);
}

uint64_t sub_233AB7F5C(_QWORD *a1)
{
  return OnAuthorizedAuthAPFSVolume.encode(to:)(a1);
}

void OnSystemVolume.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 12;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t OnSystemVolume.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 12;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233AB7FBC@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB7FC8@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB7FD4()
{
  sub_233ABCBC8();
  return sub_233AC38D8();
}

uint64_t sub_233AB7FFC()
{
  sub_233ABCBC8();
  return sub_233AC38E4();
}

uint64_t OnSystemVolume.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE610, (void (*)(void))sub_233ABCBC8);
}

uint64_t OnSystemVolume.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE620);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCBC8();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD000000000000010 && v9 == 0x8000000233AC9260)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB8284@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return OnSystemVolume.init(from:)(a1, a2);
}

uint64_t sub_233AB8298(_QWORD *a1)
{
  return OnSystemVolume.encode(to:)(a1);
}

uint64_t OSEnvironment.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = 13;
  *(_QWORD *)(a3 + 32) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(a3 + 40) = &off_2504D28C0;
  *(_QWORD *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 16) = a2;
  return result;
}

uint64_t static OSEnvironment.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB82E0(a1, 13, a2);
}

{
  return sub_233AB82E0(a1, 13, a2);
}

uint64_t sub_233AB82E0@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  *(_BYTE *)a3 = a2;
  *(_QWORD *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE628);
  *(_QWORD *)(a3 + 40) = sub_233ABCE38(&qword_2560FE630, &qword_2560FE628, (uint64_t)&unk_233AC8604);
  v5 = swift_allocObject();
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(v5 + 16) = 22;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AB8368@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB8374@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB8380()
{
  sub_233ABCC38();
  return sub_233AC38D8();
}

uint64_t sub_233AB83A8()
{
  sub_233ABCC38();
  return sub_233AC38E4();
}

uint64_t OSEnvironment.encode(to:)(_QWORD *a1)
{
  return sub_233ABA46C(a1, &qword_2560FE638, (void (*)(void))sub_233ABCC38);
}

uint64_t OSEnvironment.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _UNKNOWN **v19;
  _OWORD v20[3];
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE658);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCC38();
  sub_233AC38C0();
  if (!v2)
  {
    v21 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v20[0]) = v17;
    if (sub_233AC1BB4(v17) == 0x7269766E652D736FLL && v10 == 0xEE00746E656D6E6FLL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v17) = 1;
    v12 = sub_233AC3710();
    v18 = MEMORY[0x24BEE0D00];
    v19 = &off_2504D28C0;
    *(_QWORD *)&v17 = v12;
    *((_QWORD *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v17, (uint64_t)v20 + 8);
    v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB8710@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB1CE4(a1);
}

uint64_t sub_233AB8724@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return OSEnvironment.init(from:)(a1, a2);
}

uint64_t sub_233AB8738(_QWORD *a1)
{
  return OSEnvironment.encode(to:)(a1);
}

uint64_t PlatformType.Value.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PlatformType.Value.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  if ((unint64_t)(result - 13) >= 0xFFFFFFFFFFFFFFF4)
    v2 = result;
  else
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = (unint64_t)(result - 13) < 0xFFFFFFFFFFFFFFF4;
  return result;
}

void static PlatformType.Value.bridgeOS.getter(_QWORD *a1@<X8>)
{
  *a1 = 5;
}

void static PlatformType.Value.macCatalyst.getter(_QWORD *a1@<X8>)
{
  *a1 = 6;
}

void static PlatformType.Value.iOSSimulator.getter(_QWORD *a1@<X8>)
{
  *a1 = 7;
}

void static PlatformType.Value.watchOSSimulator.getter(_QWORD *a1@<X8>)
{
  *a1 = 9;
}

void static PlatformType.Value.driverKit.getter(_QWORD *a1@<X8>)
{
  *a1 = 10;
}

void static PlatformType.Value.visionOS.getter(_QWORD *a1@<X8>)
{
  *a1 = 11;
}

void static PlatformType.Value.visionOSSimulator.getter(_QWORD *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_233AB87C4()
{
  sub_233ABE26C();
  return sub_233AC3614();
}

uint64_t sub_233AB8820()
{
  sub_233ABE26C();
  return sub_233AC35FC();
}

uint64_t *sub_233AB886C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = *result - 13;
  v4 = __CFADD__(v3, 12);
  v5 = v3 < 0xFFFFFFFFFFFFFFF4;
  if (!v4)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t *PlatformType.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  v3 = MEMORY[0x24BEE4008];
  *(_BYTE *)a2 = 15;
  *(_QWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 40) = &off_2504D2908;
  *(_QWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t static PlatformType.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB718C(a1, 15, &qword_2560FE668, &qword_2560FE670, a2);
}

{
  return sub_233AB718C(a1, 15, &qword_2560FE668, &qword_2560FE670, a2);
}

uint64_t sub_233AB88F4@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB8900@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB890C()
{
  sub_233ABCCA0();
  return sub_233AC38D8();
}

uint64_t sub_233AB8934()
{
  sub_233ABCCA0();
  return sub_233AC38E4();
}

uint64_t PlatformType.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15[8];
  uint64_t v16;
  char v17;
  uint64_t v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE678);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCCA0();
  sub_233AC38CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_233AA2828();
  sub_233AC377C();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5D8);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_233AC3788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE668);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    LOBYTE(v11) = 1;
    sub_233ABCE38(&qword_2560FE688, &qword_2560FE668, (uint64_t)&unk_233AC8A24);
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PlatformType.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE690);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCCA0();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0x6D726F6674616C70 && v10 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    v12 = sub_233AC3734();
    v17 = MEMORY[0x24BEE4008];
    v18 = &off_2504D2908;
    *(_QWORD *)&v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v16, (uint64_t)v19 + 8);
    v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB8E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t inited;
  unint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  _UNKNOWN **v37;
  uint64_t v38[6];
  uint64_t v39;

  sub_233AA71E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v5 = MEMORY[0x24BEE4008];
  if ((swift_dynamicCast() & 1) != 0)
  {
    v6 = v38[0];
    if ((unint64_t)(v38[0] - 13) > 0xFFFFFFFFFFFFFFF3)
    {
      *(_BYTE *)a2 = 15;
      *(_QWORD *)(a2 + 32) = v5;
      *(_QWORD *)(a2 + 40) = &off_2504D2908;
      *(_QWORD *)(a2 + 8) = v6;
LABEL_19:
      v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
LABEL_18:
    sub_233AA45E0();
    swift_allocError();
    *v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  sub_233AA71E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  if (*(_QWORD *)(v38[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_233AADB84(v38[0], (uint64_t)&v34);
  result = swift_bridgeObjectRelease();
  v8 = v35;
  if (v35)
  {
    v9 = v34;
    sub_233AA4660(&v36, (uint64_t)v38);
    sub_233AA71E0((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF218);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v30 = a2;
      v10 = v31[0];
      v11 = *(_QWORD *)(v31[0] + 16);
      if (v11)
      {
        v39 = v8;
        swift_bridgeObjectRetain();
        v12 = 0;
        v13 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          v14 = *(_QWORD *)(v10 + 8 * v12 + 32);
          if ((unint64_t)(v14 - 13) >= 0xFFFFFFFFFFFFFFF4)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v13 = sub_233ABC328(0, *((_QWORD *)v13 + 2) + 1, 1, v13, &qword_2560FF248);
            v16 = *((_QWORD *)v13 + 2);
            v15 = *((_QWORD *)v13 + 3);
            if (v16 >= v15 >> 1)
              v13 = sub_233ABC328((char *)(v15 > 1), v16 + 1, 1, v13, &qword_2560FF248);
            *((_QWORD *)v13 + 2) = v16 + 1;
            *(_QWORD *)&v13[8 * v16 + 32] = v14;
          }
          ++v12;
        }
        while (v11 != v12);
        swift_bridgeObjectRelease();
        v19 = *(_QWORD *)(v10 + 16);
        v8 = v39;
      }
      else
      {
        v19 = 0;
        v13 = (char *)MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRelease();
      if (v19 == *((_QWORD *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF230);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
        *(_QWORD *)(inited + 32) = v9;
        *(_QWORD *)(inited + 40) = v8;
        *(_QWORD *)(inited + 48) = v13;
        v21 = sub_233A9A344(inited);
        *((_QWORD *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF238);
        v37 = &off_2504D5320;
        v34 = v21;
        sub_233AB0A1C((uint64_t)&v34, &qword_2560FF240, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        v22 = v31[0];
        v23 = v31[1];
        v24 = v32;
        v25 = v33;
        if (sub_233AC1BB4(v31[0]) == 7235876 && v26 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(_BYTE *)v30 = 15;
          *(_QWORD *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE668);
          *(_QWORD *)(v30 + 40) = sub_233ABCE38(&qword_2560FE670, &qword_2560FE668, (uint64_t)&unk_233AC8710);
          v29 = swift_allocObject();
          *(_QWORD *)(v30 + 8) = v29;
          *(_BYTE *)(v29 + 16) = v22;
          *(_QWORD *)(v29 + 24) = v23;
          *(_BYTE *)(v29 + 32) = v24;
          *(_QWORD *)(v29 + 40) = v25;
          goto LABEL_30;
        }
        v28 = sub_233AC383C();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
          goto LABEL_32;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_233AA45E0();
    swift_allocError();
    *v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AB92B4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return PlatformType.init(from:)(a1, a2);
}

uint64_t sub_233AB92C8(_QWORD *a1)
{
  return PlatformType.encode(to:)(a1);
}

uint64_t sub_233AB92DC@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB2318(&qword_2560FE668, a1);
}

uint64_t PlatformIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4008];
  *(_BYTE *)a2 = 14;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D2908;
  *(_QWORD *)(a2 + 8) = result;
  return result;
}

uint64_t static PlatformIdentifier.greaterThan(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(_BYTE *)a2 = 14;
  *(_QWORD *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
  *(_QWORD *)(a2 + 40) = sub_233ABCE38(&qword_2560FE6A0, &qword_2560FE4C0, (uint64_t)&unk_233AC8710);
  result = swift_allocObject();
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 24;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.greaterThanOrEqual(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(_BYTE *)a2 = 14;
  *(_QWORD *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
  *(_QWORD *)(a2 + 40) = sub_233ABCE38(&qword_2560FE6A0, &qword_2560FE4C0, (uint64_t)&unk_233AC8710);
  result = swift_allocObject();
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 25;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.lessThan(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(_BYTE *)a2 = 14;
  *(_QWORD *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
  *(_QWORD *)(a2 + 40) = sub_233ABCE38(&qword_2560FE6A0, &qword_2560FE4C0, (uint64_t)&unk_233AC8710);
  result = swift_allocObject();
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 26;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.lessThanOrEqual(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(_BYTE *)a2 = 14;
  *(_QWORD *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
  *(_QWORD *)(a2 + 40) = sub_233ABCE38(&qword_2560FE6A0, &qword_2560FE4C0, (uint64_t)&unk_233AC8710);
  result = swift_allocObject();
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(result + 16) = 27;
  *(_QWORD *)(result + 24) = a1;
  *(_BYTE *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t static PlatformIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB718C(a1, 14, &qword_2560FE4C0, &qword_2560FE6A0, a2);
}

{
  return sub_233AB718C(a1, 14, &qword_2560FE4C0, &qword_2560FE6A0, a2);
}

uint64_t sub_233AB958C@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233AB9598@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233AB95A4()
{
  sub_233ABCCE4();
  return sub_233AC38D8();
}

uint64_t sub_233AB95CC()
{
  sub_233ABCCE4();
  return sub_233AC38E4();
}

uint64_t PlatformIdentifier.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15[8];
  uint64_t v16;
  char v17;
  uint64_t v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE6A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCCE4();
  sub_233AC38CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_233AA2828();
  sub_233AC377C();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5D8);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_233AC3788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    LOBYTE(v11) = 1;
    sub_233ABCE38(&qword_2560FE4C8, &qword_2560FE4C0, (uint64_t)&unk_233AC8A24);
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PlatformIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE6B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCCE4();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD000000000000013 && v10 == 0x8000000233AC9280)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    v12 = sub_233AC3734();
    v17 = MEMORY[0x24BEE4008];
    v18 = &off_2504D2908;
    *(_QWORD *)&v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v16, (uint64_t)v19 + 8);
    v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233AB9B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v17;
  _BYTE v18[40];

  sub_233AA71E0(a1, (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v5 = MEMORY[0x24BEE4008];
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_BYTE *)a2 = 14;
    *(_QWORD *)(a2 + 32) = v5;
    *(_QWORD *)(a2 + 40) = &off_2504D2908;
    *(_QWORD *)(a2 + 8) = v17;
  }
  else
  {
    sub_233AA71E0(a1, (uint64_t)v18);
    v6 = sub_233AB0614((uint64_t)v18);
    if (!v2)
    {
      v10 = v6;
      v11 = v7;
      v12 = v8;
      v13 = v9;
      if ((sub_233AB9C98(v6, (uint64_t)&unk_2504D0D20) & 1) != 0)
      {
        *(_BYTE *)a2 = 14;
        *(_QWORD *)(a2 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE4C0);
        *(_QWORD *)(a2 + 40) = sub_233ABCE38(&qword_2560FE6A0, &qword_2560FE4C0, (uint64_t)&unk_233AC8710);
        v14 = swift_allocObject();
        *(_QWORD *)(a2 + 8) = v14;
        *(_BYTE *)(v14 + 16) = v10;
        *(_QWORD *)(v14 + 24) = v11;
        *(_BYTE *)(v14 + 32) = v12 & 1;
        *(_QWORD *)(v14 + 40) = v13;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_233AA45E0();
        swift_allocError();
        *v15 = 1;
        swift_willThrow();
      }
    }
  }
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_233AB9C98(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  return 0;
}

uint64_t sub_233ABA368@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB211C(a1);
}

uint64_t sub_233ABA37C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return PlatformIdentifier.init(from:)(a1, a2);
}

uint64_t sub_233ABA390(_QWORD *a1)
{
  return PlatformIdentifier.encode(to:)(a1);
}

uint64_t SigningIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = 16;
  *(_QWORD *)(a3 + 32) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(a3 + 40) = &off_2504D28C0;
  *(_QWORD *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 16) = a2;
  return result;
}

uint64_t static SigningIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB82E0(a1, 16, a2);
}

{
  return sub_233AB82E0(a1, 16, a2);
}

uint64_t sub_233ABA3D8@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233ABA3E4@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233ABA3F0()
{
  sub_233ABCD28();
  return sub_233AC38D8();
}

uint64_t sub_233ABA418()
{
  sub_233ABCD28();
  return sub_233AC38E4();
}

uint64_t SigningIdentifier.encode(to:)(_QWORD *a1)
{
  return sub_233ABA46C(a1, &qword_2560FE6C0, (void (*)(void))sub_233ABCD28);
}

uint64_t sub_233ABA46C(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  char *v3;
  char *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18[8];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_233AC38CC();
  v18[0] = *v5;
  LOBYTE(v14) = 0;
  sub_233AA2828();
  v11 = v22;
  sub_233AC377C();
  if (v11)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_233AA71E0((uint64_t)(v5 + 8), (uint64_t)v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE648);
  if (swift_dynamicCast())
  {
    v18[0] = 1;
    sub_233AC3764();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    sub_233AA71E0((uint64_t)(v5 + 8), (uint64_t)v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE628);
    result = swift_dynamicCast();
    if (!(_DWORD)result)
    {
      __break(1u);
      return result;
    }
    v18[0] = v14;
    v19 = v15;
    v20 = v16;
    v21 = v17;
    LOBYTE(v14) = 1;
    sub_233ABCE38(&qword_2560FE650, &qword_2560FE628, (uint64_t)&unk_233AC8A24);
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t SigningIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _UNKNOWN **v19;
  _OWORD v20[3];
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE6D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCD28();
  sub_233AC38C0();
  if (!v2)
  {
    v21 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v20[0]) = v17;
    if (sub_233AC1BB4(v17) == 0xD000000000000012 && v10 == 0x8000000233AC92A0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v17) = 1;
    v12 = sub_233AC3710();
    v18 = MEMORY[0x24BEE0D00];
    v19 = &off_2504D28C0;
    *(_QWORD *)&v17 = v12;
    *((_QWORD *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v17, (uint64_t)v20 + 8);
    v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233ABA9AC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[40];
  uint64_t v23;

  sub_233AA71E0(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v7 = MEMORY[0x24BEE0D00];
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_BYTE *)a3 = a2;
    *(_QWORD *)(a3 + 32) = v7;
    *(_QWORD *)(a3 + 40) = &off_2504D28C0;
    *(_QWORD *)(a3 + 8) = v20;
    *(_QWORD *)(a3 + 16) = v21;
  }
  else
  {
    sub_233AA71E0(a1, (uint64_t)v22);
    v8 = sub_233AB081C((uint64_t)v22);
    if (!v3)
    {
      v12 = v8;
      v13 = v10;
      v14 = v11;
      v23 = v9;
      if (sub_233AC1BB4(v8) == 7235876 && v15 == 0xE300000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v16 = sub_233AC383C();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_233AA45E0();
          swift_allocError();
          *v18 = 1;
          swift_willThrow();
          return __swift_destroy_boxed_opaque_existential_1(a1);
        }
      }
      *(_BYTE *)a3 = a2;
      *(_QWORD *)(a3 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE628);
      *(_QWORD *)(a3 + 40) = sub_233ABCE38(&qword_2560FE630, &qword_2560FE628, (uint64_t)&unk_233AC8604);
      v17 = swift_allocObject();
      *(_QWORD *)(a3 + 8) = v17;
      *(_BYTE *)(v17 + 16) = v12;
      *(_QWORD *)(v17 + 24) = v23;
      *(_QWORD *)(v17 + 32) = v13;
      *(_QWORD *)(v17 + 40) = v14;
    }
  }
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_233ABAB84@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return SigningIdentifier.init(from:)(a1, a2);
}

uint64_t sub_233ABAB98(_QWORD *a1)
{
  return SigningIdentifier.encode(to:)(a1);
}

uint64_t TeamIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_BYTE *)a3 = 17;
  *(_QWORD *)(a3 + 32) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(a3 + 40) = &off_2504D28C0;
  *(_QWORD *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 16) = a2;
  return result;
}

uint64_t static TeamIdentifier.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB82E0(a1, 17, a2);
}

{
  return sub_233AB82E0(a1, 17, a2);
}

uint64_t sub_233ABABE0@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233ABABEC@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233ABABF8()
{
  sub_233ABCD6C();
  return sub_233AC38D8();
}

uint64_t sub_233ABAC20()
{
  sub_233ABCD6C();
  return sub_233AC38E4();
}

uint64_t TeamIdentifier.encode(to:)(_QWORD *a1)
{
  return sub_233ABA46C(a1, &qword_2560FE6D8, (void (*)(void))sub_233ABCD6C);
}

uint64_t TeamIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _UNKNOWN **v19;
  _OWORD v20[3];
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE6E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCD6C();
  sub_233AC38C0();
  if (!v2)
  {
    v21 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v20[0]) = v17;
    if (sub_233AC1BB4(v17) == 0x6564692D6D616574 && v10 == 0xEF7265696669746ELL)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v17) = 1;
    v12 = sub_233AC3710();
    v18 = MEMORY[0x24BEE0D00];
    v19 = &off_2504D28C0;
    *(_QWORD *)&v17 = v12;
    *((_QWORD *)&v17 + 1) = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v17, (uint64_t)v20 + 8);
    v15 = v20[1];
    *a2 = v20[0];
    a2[1] = v15;
    a2[2] = v20[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233ABAF88@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return TeamIdentifier.init(from:)(a1, a2);
}

uint64_t sub_233ABAF9C(_QWORD *a1)
{
  return TeamIdentifier.encode(to:)(a1);
}

void TeamIdentifierMatchesCurrentProcess.init()(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 18;
  *(_QWORD *)(a1 + 32) = MEMORY[0x24BEE1328];
  *(_QWORD *)(a1 + 40) = &off_2504D28F0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t TeamIdentifierMatchesCurrentProcess.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE1328];
  *(_BYTE *)a2 = 18;
  *(_QWORD *)(a2 + 32) = v2;
  *(_QWORD *)(a2 + 40) = &off_2504D28F0;
  *(_BYTE *)(a2 + 8) = result;
  return result;
}

uint64_t sub_233ABAFFC@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233ABB008@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233ABB014()
{
  sub_233ABCDB0();
  return sub_233AC38D8();
}

uint64_t sub_233ABB03C()
{
  sub_233ABCDB0();
  return sub_233AC38E4();
}

uint64_t TeamIdentifierMatchesCurrentProcess.encode(to:)(_QWORD *a1)
{
  return sub_233AB6240(a1, &qword_2560FE6F0, (void (*)(void))sub_233ABCDB0);
}

uint64_t TeamIdentifierMatchesCurrentProcess.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  _BYTE *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE700);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCDB0();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD000000000000023 && v9 == 0x8000000233AC92D0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v10 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
LABEL_7:
      v20 = 1;
      v11 = sub_233AC371C();
      v17 = MEMORY[0x24BEE1328];
      v18 = &off_2504D28F0;
      LOBYTE(v16) = v11 & 1;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_233AA4660(&v16, (uint64_t)v19 + 8);
      v12 = v19[1];
      *a2 = v19[0];
      a2[1] = v12;
      a2[2] = v19[2];
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
    sub_233AA45E0();
    swift_allocError();
    *v13 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233ABB2C4@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return TeamIdentifierMatchesCurrentProcess.init(from:)(a1, a2);
}

uint64_t sub_233ABB2D8(_QWORD *a1)
{
  return TeamIdentifierMatchesCurrentProcess.encode(to:)(a1);
}

uint64_t ValidationCategory.Value.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t ValidationCategory.Value.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;

  if (result <= 0xA)
    v2 = result;
  else
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = result > 0xA;
  return result;
}

uint64_t sub_233ABB30C()
{
  sub_233ABE9D4();
  return sub_233AC3614();
}

uint64_t sub_233ABB368()
{
  sub_233ABE9D4();
  return sub_233AC35FC();
}

uint64_t sub_233ABB3B4()
{
  sub_233AC3890();
  sub_233AC38A8();
  return sub_233AC38B4();
}

uint64_t sub_233ABB3F8()
{
  sub_233AC3890();
  sub_233AC38A8();
  return sub_233AC38B4();
}

uint64_t *sub_233ABB438@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 0xA;
  if ((unint64_t)*result > 0xA)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t *ValidationCategory.init(_:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  v3 = MEMORY[0x24BEE4008];
  *(_BYTE *)a2 = 19;
  *(_QWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 40) = &off_2504D2908;
  *(_QWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t static ValidationCategory.in(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_233AB718C(a1, 19, &qword_2560FE708, &qword_2560FE710, a2);
}

{
  return sub_233AB718C(a1, 19, &qword_2560FE708, &qword_2560FE710, a2);
}

uint64_t sub_233ABB4BC()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233ABB530()
{
  sub_233AC35D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233ABB580()
{
  sub_233AC3890();
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233ABB5F0@<X0>(char *a1@<X8>)
{
  return sub_233ABB5FC(a1);
}

uint64_t sub_233ABB5FC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_233AC36EC();
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

uint64_t sub_233ABB654@<X0>(char *a1@<X8>)
{
  return sub_233ABB660(a1);
}

uint64_t sub_233ABB660@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_233AC36EC();
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

uint64_t sub_233ABB6BC()
{
  sub_233ABCDF4();
  return sub_233AC38D8();
}

uint64_t sub_233ABB6E4()
{
  sub_233ABCDF4();
  return sub_233AC38E4();
}

uint64_t ValidationCategory.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15[8];
  uint64_t v16;
  char v17;
  uint64_t v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE718);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCDF4();
  sub_233AC38CC();
  v15[0] = *v3;
  LOBYTE(v11) = 0;
  sub_233AA2828();
  sub_233AC377C();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE5D8);
  if (swift_dynamicCast())
  {
    v15[0] = 1;
    sub_233AC3788();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_233AA71E0((uint64_t)(v3 + 8), (uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE708);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v15[0] = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    LOBYTE(v11) = 1;
    sub_233ABCE38(&qword_2560FE728, &qword_2560FE708, (uint64_t)&unk_233AC8A24);
    sub_233AC377C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ValidationCategory.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _BYTE *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;
  _OWORD v19[3];
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE730);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_233ABCDF4();
  sub_233AC38C0();
  if (!v2)
  {
    v20 = 0;
    sub_233AA459C();
    sub_233AC3728();
    LOBYTE(v19[0]) = v16;
    if (sub_233AC1BB4(v16) == 0xD000000000000013 && v10 == 0x8000000233AC9300)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        sub_233AA45E0();
        swift_allocError();
        *v13 = 1;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
    }
    LOBYTE(v16) = 1;
    v12 = sub_233AC3734();
    v17 = MEMORY[0x24BEE4008];
    v18 = &off_2504D2908;
    *(_QWORD *)&v16 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_233AA4660(&v16, (uint64_t)v19 + 8);
    v14 = v19[1];
    *a2 = v19[0];
    a2[1] = v14;
    a2[2] = v19[2];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_233ABBC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t inited;
  unint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  _UNKNOWN **v37;
  uint64_t v38[6];
  uint64_t v39;

  sub_233AA71E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  v5 = MEMORY[0x24BEE4008];
  if ((swift_dynamicCast() & 1) != 0)
  {
    v6 = v38[0];
    if (v38[0] < 0xBuLL)
    {
      *(_BYTE *)a2 = 19;
      *(_QWORD *)(a2 + 32) = v5;
      *(_QWORD *)(a2 + 40) = &off_2504D2908;
      *(_QWORD *)(a2 + 8) = v6;
LABEL_19:
      v18 = (uint64_t *)a1;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
LABEL_18:
    sub_233AA45E0();
    swift_allocError();
    *v17 = 1;
    swift_willThrow();
    goto LABEL_19;
  }
  sub_233AA71E0(a1, (uint64_t)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  if (*(_QWORD *)(v38[0] + 16) != 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  sub_233AADB84(v38[0], (uint64_t)&v34);
  result = swift_bridgeObjectRelease();
  v8 = v35;
  if (v35)
  {
    v9 = v34;
    sub_233AA4660(&v36, (uint64_t)v38);
    sub_233AA71E0((uint64_t)v38, (uint64_t)&v34);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF218);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v30 = a2;
      v10 = v31[0];
      v11 = *(_QWORD *)(v31[0] + 16);
      if (v11)
      {
        v39 = v8;
        swift_bridgeObjectRetain();
        v12 = 0;
        v13 = (char *)MEMORY[0x24BEE4AF8];
        do
        {
          v14 = *(_QWORD *)(v10 + 8 * v12 + 32);
          if (v14 <= 0xA)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v13 = sub_233ABC328(0, *((_QWORD *)v13 + 2) + 1, 1, v13, &qword_2560FF268);
            v16 = *((_QWORD *)v13 + 2);
            v15 = *((_QWORD *)v13 + 3);
            if (v16 >= v15 >> 1)
              v13 = sub_233ABC328((char *)(v15 > 1), v16 + 1, 1, v13, &qword_2560FF268);
            *((_QWORD *)v13 + 2) = v16 + 1;
            *(_QWORD *)&v13[8 * v16 + 32] = v14;
          }
          ++v12;
        }
        while (v11 != v12);
        swift_bridgeObjectRelease();
        v19 = *(_QWORD *)(v10 + 16);
        v8 = v39;
      }
      else
      {
        v19 = 0;
        v13 = (char *)MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRelease();
      if (v19 == *((_QWORD *)v13 + 2))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF250);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_233AC3C20;
        *(_QWORD *)(inited + 32) = v9;
        *(_QWORD *)(inited + 40) = v8;
        *(_QWORD *)(inited + 48) = v13;
        v21 = sub_233A9A350(inited);
        *((_QWORD *)&v36 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF258);
        v37 = &off_2504D5320;
        v34 = v21;
        sub_233AB0A1C((uint64_t)&v34, &qword_2560FF260, (uint64_t)v31);
        if (v2)
        {
LABEL_30:
          __swift_destroy_boxed_opaque_existential_1(a1);
          v18 = v38;
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
        }
        v22 = v31[0];
        v23 = v31[1];
        v24 = v32;
        v25 = v33;
        if (sub_233AC1BB4(v31[0]) == 7235876 && v26 == 0xE300000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          *(_BYTE *)v30 = 19;
          *(_QWORD *)(v30 + 32) = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE708);
          *(_QWORD *)(v30 + 40) = sub_233ABCE38(&qword_2560FE710, &qword_2560FE708, (uint64_t)&unk_233AC8710);
          v29 = swift_allocObject();
          *(_QWORD *)(v30 + 8) = v29;
          *(_BYTE *)(v29 + 16) = v22;
          *(_QWORD *)(v29 + 24) = v23;
          *(_BYTE *)(v29 + 32) = v24;
          *(_QWORD *)(v29 + 40) = v25;
          goto LABEL_30;
        }
        v28 = sub_233AC383C();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
          goto LABEL_32;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    sub_233AA45E0();
    swift_allocError();
    *v27 = 1;
    swift_willThrow();
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_233ABC05C@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return ValidationCategory.init(from:)(a1, a2);
}

uint64_t sub_233ABC070(_QWORD *a1)
{
  return ValidationCategory.encode(to:)(a1);
}

uint64_t sub_233ABC084@<X0>(unint64_t *a1@<X8>)
{
  return sub_233AB2318(&qword_2560FE708, a1);
}

uint64_t sub_233ABC0A0(uint64_t a1)
{
  char v2;
  _BYTE *v3;
  _BYTE v5[40];
  unint64_t v6;

  sub_233AA71E0(a1, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  if (swift_dynamicCast())
  {
    v2 = v6;
  }
  else
  {
    sub_233AA71E0(a1, (uint64_t)v5);
    if ((swift_dynamicCast() & 1) == 0 || (v2 = v6, v6 >= 2))
    {
      sub_233AA45E0();
      swift_allocError();
      *v3 = 1;
      swift_willThrow();
    }
  }
  return v2 & 1;
}

_QWORD *sub_233ABC184(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_233ABC74C(a1, a2, a3, a4, &qword_2560FE148, &qword_2560FE150);
}

char *sub_233ABC198(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_233ABC210(a1, a2, a3, a4, &qword_2560FF170);
}

char *sub_233ABC1AC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_233ABC210(a1, a2, a3, a4, &qword_2560FF168);
}

char *sub_233ABC1C0(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_233ABC210(a1, a2, a3, a4, &qword_2560FF190);
}

char *sub_233ABC1D4(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_233ABC210(a1, a2, a3, a4, &qword_2560FF188);
}

char *sub_233ABC1E8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_233ABC210(a1, a2, a3, a4, &qword_2560FF180);
}

char *sub_233ABC1FC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_233ABC210(a1, a2, a3, a4, &qword_2560FF178);
}

char *sub_233ABC210(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9])
      memmove(v14, v15, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

_QWORD *sub_233ABC314(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_233ABC8B4(a1, a2, a3, a4, &qword_2560FE420, &qword_2560FE180);
}

char *sub_233ABC328(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

_QWORD *sub_233ABC41C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_233ABC8B4(a1, a2, a3, a4, &qword_2560FE428, &qword_2560FE190);
}

_QWORD *sub_233ABC430(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_233ABC8B4(a1, a2, a3, a4, &qword_2560FE430, &qword_2560FE198);
}

unint64_t sub_233ABC444()
{
  unint64_t result;

  result = qword_2560FE440;
  if (!qword_2560FE440)
  {
    result = MEMORY[0x23493B550](&unk_233AC8AB8, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE440);
  }
  return result;
}

unint64_t sub_233ABC488()
{
  unint64_t result;

  result = qword_2560FE458;
  if (!qword_2560FE458)
  {
    result = MEMORY[0x23493B550](&unk_233AC5160, MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2560FE458);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493B544](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_233ABC510()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1 >> 60 != 15)
    sub_233AA94E0(*(_QWORD *)(v0 + 24), v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_233ABC54C()
{
  unint64_t result;

  result = qword_2560FE478;
  if (!qword_2560FE478)
  {
    result = MEMORY[0x23493B550](&unk_233AC8A4C, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE478);
  }
  return result;
}

uint64_t sub_233ABC590(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_233AA94E0(a1, a2);
  return a1;
}

unint64_t sub_233ABC5A4()
{
  unint64_t result;

  result = qword_2560FE490;
  if (!qword_2560FE490)
  {
    result = MEMORY[0x23493B550](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2560FE490);
  }
  return result;
}

unint64_t sub_233ABC5E8()
{
  unint64_t result;

  result = qword_2560FE4A0;
  if (!qword_2560FE4A0)
  {
    result = MEMORY[0x23493B550](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2560FE4A0);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x23493B5BCLL);
  return result;
}

unint64_t sub_233ABC660()
{
  unint64_t result;

  result = qword_2560FE4B8;
  if (!qword_2560FE4B8)
  {
    result = MEMORY[0x23493B550](&unk_233AC89AC, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE4B8);
  }
  return result;
}

unint64_t sub_233ABC6A4()
{
  unint64_t result;

  result = qword_2560FE4E8;
  if (!qword_2560FE4E8)
  {
    result = MEMORY[0x23493B550](&unk_233AC895C, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE4E8);
  }
  return result;
}

unint64_t sub_233ABC6E8()
{
  unint64_t result;

  result = qword_2560FE500;
  if (!qword_2560FE500)
  {
    result = MEMORY[0x23493B550](&unk_233AC890C, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE500);
  }
  return result;
}

uint64_t type metadata accessor for EntitlementsQuery()
{
  return objc_opt_self();
}

_QWORD *sub_233ABC74C(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4])
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_233ABC870()
{
  unint64_t result;

  result = qword_2560FE528;
  if (!qword_2560FE528)
  {
    result = MEMORY[0x23493B550](&unk_233AC88BC, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE528);
  }
  return result;
}

_QWORD *sub_233ABC8B4(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4])
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_233ABC9EC()
{
  unint64_t result;

  result = qword_2560FE548;
  if (!qword_2560FE548)
  {
    result = MEMORY[0x23493B550](&unk_233AC886C, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE548);
  }
  return result;
}

unint64_t sub_233ABCA30()
{
  unint64_t result;

  result = qword_2560FE560;
  if (!qword_2560FE560)
  {
    result = MEMORY[0x23493B550](&unk_233AC881C, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE560);
  }
  return result;
}

unint64_t sub_233ABCA74()
{
  unint64_t result;

  result = qword_2560FE578;
  if (!qword_2560FE578)
  {
    result = MEMORY[0x23493B550](&unk_233AC87CC, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE578);
  }
  return result;
}

unint64_t sub_233ABCAB8()
{
  unint64_t result;

  result = qword_2560FE590;
  if (!qword_2560FE590)
  {
    result = MEMORY[0x23493B550](&unk_233AC877C, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE590);
  }
  return result;
}

unint64_t sub_233ABCAFC()
{
  unint64_t result;

  result = qword_2560FE5A8;
  if (!qword_2560FE5A8)
  {
    result = MEMORY[0x23493B550](&unk_233AC872C, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE5A8);
  }
  return result;
}

unint64_t sub_233ABCB40()
{
  unint64_t result;

  result = qword_2560FE5D0;
  if (!qword_2560FE5D0)
  {
    result = MEMORY[0x23493B550](&unk_233AC86C0, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE5D0);
  }
  return result;
}

unint64_t sub_233ABCB84()
{
  unint64_t result;

  result = qword_2560FE600;
  if (!qword_2560FE600)
  {
    result = MEMORY[0x23493B550](&unk_233AC8670, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE600);
  }
  return result;
}

unint64_t sub_233ABCBC8()
{
  unint64_t result;

  result = qword_2560FE618;
  if (!qword_2560FE618)
  {
    result = MEMORY[0x23493B550](&unk_233AC8620, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE618);
  }
  return result;
}

uint64_t sub_233ABCC0C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_233ABCC38()
{
  unint64_t result;

  result = qword_2560FE640;
  if (!qword_2560FE640)
  {
    result = MEMORY[0x23493B550](&unk_233AC85B4, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE640);
  }
  return result;
}

uint64_t sub_233ABCC7C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_233ABCCA0()
{
  unint64_t result;

  result = qword_2560FE680;
  if (!qword_2560FE680)
  {
    result = MEMORY[0x23493B550](&unk_233AC8564, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE680);
  }
  return result;
}

unint64_t sub_233ABCCE4()
{
  unint64_t result;

  result = qword_2560FE6B0;
  if (!qword_2560FE6B0)
  {
    result = MEMORY[0x23493B550](&unk_233AC8514, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE6B0);
  }
  return result;
}

unint64_t sub_233ABCD28()
{
  unint64_t result;

  result = qword_2560FE6C8;
  if (!qword_2560FE6C8)
  {
    result = MEMORY[0x23493B550](&unk_233AC84C4, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE6C8);
  }
  return result;
}

unint64_t sub_233ABCD6C()
{
  unint64_t result;

  result = qword_2560FE6E0;
  if (!qword_2560FE6E0)
  {
    result = MEMORY[0x23493B550](&unk_233AC8474, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE6E0);
  }
  return result;
}

unint64_t sub_233ABCDB0()
{
  unint64_t result;

  result = qword_2560FE6F8;
  if (!qword_2560FE6F8)
  {
    result = MEMORY[0x23493B550](&unk_233AC8424, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE6F8);
  }
  return result;
}

unint64_t sub_233ABCDF4()
{
  unint64_t result;

  result = qword_2560FE720;
  if (!qword_2560FE720)
  {
    result = MEMORY[0x23493B550](&unk_233AC83D4, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FE720);
  }
  return result;
}

uint64_t sub_233ABCE38(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23493B550](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_233ABCE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABC5E8, (uint64_t (*)(void))sub_233ABC5A4);
}

unint64_t sub_233ABCE8C(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABCEB0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABCEB0()
{
  unint64_t result;

  result = qword_2560FE740;
  if (!qword_2560FE740)
  {
    result = MEMORY[0x23493B550](&unk_233AC520C, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_2560FE740);
  }
  return result;
}

uint64_t sub_233ABCEF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4678, (uint64_t (*)(void))sub_233ABCF08);
}

unint64_t sub_233ABCF08()
{
  unint64_t result;

  result = qword_2560FE748;
  if (!qword_2560FE748)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for AppleInternal, &type metadata for AppleInternal);
    atomic_store(result, (unint64_t *)&qword_2560FE748);
  }
  return result;
}

uint64_t sub_233ABCF4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABCF60, (uint64_t (*)(void))sub_233ABCFA4);
}

unint64_t sub_233ABCF60()
{
  unint64_t result;

  result = qword_2560FE750;
  if (!qword_2560FE750)
  {
    result = MEMORY[0x23493B550](&unk_233AC52E8, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FE750);
  }
  return result;
}

unint64_t sub_233ABCFA4()
{
  unint64_t result;

  result = qword_2560FE758;
  if (!qword_2560FE758)
  {
    result = MEMORY[0x23493B550](&unk_233AC5304, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FE758);
  }
  return result;
}

uint64_t sub_233ABCFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA46BC, (uint64_t (*)(void))sub_233ABCFFC);
}

unint64_t sub_233ABCFFC()
{
  unint64_t result;

  result = qword_2560FE760;
  if (!qword_2560FE760)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for CodeDirectoryHash, &type metadata for CodeDirectoryHash);
    atomic_store(result, (unint64_t *)&qword_2560FE760);
  }
  return result;
}

_UNKNOWN **sub_233ABD040()
{
  return &off_2504D5318;
}

uint64_t sub_233ABD050(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233ABE460(a1, a2, a3, (uint64_t (*)(void))sub_233ABD06C, (uint64_t (*)(void))sub_233ABD0B0, (uint64_t (*)(void))sub_233ABD0F4);
}

unint64_t sub_233ABD06C()
{
  unint64_t result;

  result = qword_2560FE7A0;
  if (!qword_2560FE7A0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7A0);
  }
  return result;
}

unint64_t sub_233ABD0B0()
{
  unint64_t result;

  result = qword_2560FE7A8;
  if (!qword_2560FE7A8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7A8);
  }
  return result;
}

unint64_t sub_233ABD0F4()
{
  unint64_t result;

  result = qword_2560FE7B0;
  if (!qword_2560FE7B0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7B0);
  }
  return result;
}

unint64_t sub_233ABD13C()
{
  unint64_t result;

  result = qword_2560FE7B8;
  if (!qword_2560FE7B8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7B8);
  }
  return result;
}

unint64_t sub_233ABD184()
{
  unint64_t result;

  result = qword_2560FE7C0;
  if (!qword_2560FE7C0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7C0);
  }
  return result;
}

unint64_t sub_233ABD1CC()
{
  unint64_t result;

  result = qword_2560FE7C8;
  if (!qword_2560FE7C8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7C8);
  }
  return result;
}

unint64_t sub_233ABD214()
{
  unint64_t result;

  result = qword_2560FE7D0;
  if (!qword_2560FE7D0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags.ValueSet, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE7D0);
  }
  return result;
}

uint64_t sub_233ABD258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABD26C, (uint64_t (*)(void))sub_233ABD2B0);
}

unint64_t sub_233ABD26C()
{
  unint64_t result;

  result = qword_2560FE800;
  if (!qword_2560FE800)
  {
    result = MEMORY[0x23493B550](&unk_233AC5610, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE800);
  }
  return result;
}

unint64_t sub_233ABD2B0()
{
  unint64_t result;

  result = qword_2560FE808;
  if (!qword_2560FE808)
  {
    result = MEMORY[0x23493B550](&unk_233AC562C, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE808);
  }
  return result;
}

uint64_t sub_233ABD2F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4700, (uint64_t (*)(void))sub_233ABD308);
}

unint64_t sub_233ABD308()
{
  unint64_t result;

  result = qword_2560FE810;
  if (!qword_2560FE810)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ProcessCodeSigningFlags, &type metadata for ProcessCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE810);
  }
  return result;
}

unint64_t sub_233ABD350()
{
  unint64_t result;

  result = qword_2560FE818;
  if (!qword_2560FE818)
  {
    result = MEMORY[0x23493B550](&unk_233AC5370, &type metadata for ProcessCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE818);
  }
  return result;
}

uint64_t sub_233ABD398(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233ABE460(a1, a2, a3, (uint64_t (*)(void))sub_233ABD3B4, (uint64_t (*)(void))sub_233ABD3F8, (uint64_t (*)(void))sub_233ABD43C);
}

unint64_t sub_233ABD3B4()
{
  unint64_t result;

  result = qword_2560FE850;
  if (!qword_2560FE850)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE850);
  }
  return result;
}

unint64_t sub_233ABD3F8()
{
  unint64_t result;

  result = qword_2560FE858;
  if (!qword_2560FE858)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE858);
  }
  return result;
}

unint64_t sub_233ABD43C()
{
  unint64_t result;

  result = qword_2560FE860;
  if (!qword_2560FE860)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE860);
  }
  return result;
}

unint64_t sub_233ABD484()
{
  unint64_t result;

  result = qword_2560FE868;
  if (!qword_2560FE868)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE868);
  }
  return result;
}

unint64_t sub_233ABD4CC()
{
  unint64_t result;

  result = qword_2560FE870;
  if (!qword_2560FE870)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE870);
  }
  return result;
}

unint64_t sub_233ABD514()
{
  unint64_t result;

  result = qword_2560FE878;
  if (!qword_2560FE878)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE878);
  }
  return result;
}

unint64_t sub_233ABD55C()
{
  unint64_t result;

  result = qword_2560FE880;
  if (!qword_2560FE880)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags.ValueSet, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE880);
  }
  return result;
}

uint64_t sub_233ABD5A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABD5B4, (uint64_t (*)(void))sub_233ABD5F8);
}

unint64_t sub_233ABD5B4()
{
  unint64_t result;

  result = qword_2560FE8B0;
  if (!qword_2560FE8B0)
  {
    result = MEMORY[0x23493B550](&unk_233AC58CC, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE8B0);
  }
  return result;
}

unint64_t sub_233ABD5F8()
{
  unint64_t result;

  result = qword_2560FE8B8;
  if (!qword_2560FE8B8)
  {
    result = MEMORY[0x23493B550](&unk_233AC58E8, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE8B8);
  }
  return result;
}

uint64_t sub_233ABD63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA66EC, (uint64_t (*)(void))sub_233ABD650);
}

unint64_t sub_233ABD650()
{
  unint64_t result;

  result = qword_2560FE8C0;
  if (!qword_2560FE8C0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnDiskCodeSigningFlags, &type metadata for OnDiskCodeSigningFlags);
    atomic_store(result, (unint64_t *)&qword_2560FE8C0);
  }
  return result;
}

unint64_t sub_233ABD698()
{
  unint64_t result;

  result = qword_2560FE8C8;
  if (!qword_2560FE8C8)
  {
    result = MEMORY[0x23493B550](&unk_233AC5648, &type metadata for OnDiskCodeSigningFlags.ValueSet);
    atomic_store(result, (unint64_t *)&qword_2560FE8C8);
  }
  return result;
}

unint64_t sub_233ABD6E0(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABD704();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABD704()
{
  unint64_t result;

  result = qword_2560FE900;
  if (!qword_2560FE900)
  {
    result = MEMORY[0x23493B550](&unk_233AC5974, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_2560FE900);
  }
  return result;
}

uint64_t sub_233ABD748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4744, (uint64_t (*)(void))sub_233ABD75C);
}

unint64_t sub_233ABD75C()
{
  unint64_t result;

  result = qword_2560FE908;
  if (!qword_2560FE908)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for DeveloperMode, &type metadata for DeveloperMode);
    atomic_store(result, (unint64_t *)&qword_2560FE908);
  }
  return result;
}

unint64_t sub_233ABD7A4()
{
  unint64_t result;

  result = qword_2560FE910;
  if (!qword_2560FE910)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for EntitlementsQuery.DataType, &type metadata for EntitlementsQuery.DataType);
    atomic_store(result, (unint64_t *)&qword_2560FE910);
  }
  return result;
}

uint64_t sub_233ABD7EC(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_233AC1698(&qword_2560FDDE0, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
  result = sub_233AC1698(&qword_2560FE918, (uint64_t)&protocol conformance descriptor for EntitlementsQuery);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_233ABD838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABD84C, (uint64_t (*)(void))sub_233ABD890);
}

unint64_t sub_233ABD84C()
{
  unint64_t result;

  result = qword_2560FE920;
  if (!qword_2560FE920)
  {
    result = MEMORY[0x23493B550](&unk_233AC5BB0, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FE920);
  }
  return result;
}

unint64_t sub_233ABD890()
{
  unint64_t result;

  result = qword_2560FE928;
  if (!qword_2560FE928)
  {
    result = MEMORY[0x23493B550](&unk_233AC5BCC, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FE928);
  }
  return result;
}

uint64_t sub_233ABD8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4788, (uint64_t (*)(void))sub_233ABD8E8);
}

unint64_t sub_233ABD8E8()
{
  unint64_t result;

  result = qword_2560FE930;
  if (!qword_2560FE930)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InfoPlistHash, &type metadata for InfoPlistHash);
    atomic_store(result, (unint64_t *)&qword_2560FE930);
  }
  return result;
}

unint64_t sub_233ABD930(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABD954();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABD954()
{
  unint64_t result;

  result = qword_2560FE970;
  if (!qword_2560FE970)
  {
    result = MEMORY[0x23493B550](&unk_233AC5CA8, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FE970);
  }
  return result;
}

uint64_t sub_233ABD998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA47CC, (uint64_t (*)(void))sub_233ABD9AC);
}

unint64_t sub_233ABD9AC()
{
  unint64_t result;

  result = qword_2560FE978;
  if (!qword_2560FE978)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for InTrustCacheWithConstraintCategory, &type metadata for InTrustCacheWithConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FE978);
  }
  return result;
}

unint64_t sub_233ABD9F0(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABDA14();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABDA14()
{
  unint64_t result;

  result = qword_2560FE980;
  if (!qword_2560FE980)
  {
    result = MEMORY[0x23493B550](&unk_233AC5D68, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_2560FE980);
  }
  return result;
}

uint64_t sub_233ABDA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4810, (uint64_t (*)(void))sub_233ABDA6C);
}

unint64_t sub_233ABDA6C()
{
  unint64_t result;

  result = qword_2560FE988;
  if (!qword_2560FE988)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsInitProcess, &type metadata for IsInitProcess);
    atomic_store(result, (unint64_t *)&qword_2560FE988);
  }
  return result;
}

unint64_t sub_233ABDAB0(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABDAD4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABDAD4()
{
  unint64_t result;

  result = qword_2560FE990;
  if (!qword_2560FE990)
  {
    result = MEMORY[0x23493B550](&unk_233AC5E0C, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_2560FE990);
  }
  return result;
}

uint64_t sub_233ABDB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA6730, (uint64_t (*)(void))sub_233ABDB2C);
}

unint64_t sub_233ABDB2C()
{
  unint64_t result;

  result = qword_2560FE998;
  if (!qword_2560FE998)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsMainBinary, &type metadata for IsMainBinary);
    atomic_store(result, (unint64_t *)&qword_2560FE998);
  }
  return result;
}

unint64_t sub_233ABDB70(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABDB94();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABDB94()
{
  unint64_t result;

  result = qword_2560FE9A0;
  if (!qword_2560FE9A0)
  {
    result = MEMORY[0x23493B550](&unk_233AC5EE8, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_2560FE9A0);
  }
  return result;
}

uint64_t sub_233ABDBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4854, (uint64_t (*)(void))sub_233ABDBEC);
}

unint64_t sub_233ABDBEC()
{
  unint64_t result;

  result = qword_2560FE9A8;
  if (!qword_2560FE9A8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for IsSIPProtected, &type metadata for IsSIPProtected);
    atomic_store(result, (unint64_t *)&qword_2560FE9A8);
  }
  return result;
}

uint64_t sub_233ABDC30(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233ABE8B8(a1, a2, a3, (uint64_t (*)(void))sub_233ABDC54, (uint64_t (*)(void))sub_233ABDC98, (uint64_t (*)(void))sub_233ABDCDC, (uint64_t (*)(void))sub_233ABDD20);
}

unint64_t sub_233ABDC54()
{
  unint64_t result;

  result = qword_2560FE9B0;
  if (!qword_2560FE9B0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType.Value, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FE9B0);
  }
  return result;
}

unint64_t sub_233ABDC98()
{
  unint64_t result;

  result = qword_2560FE9B8;
  if (!qword_2560FE9B8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType.Value, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FE9B8);
  }
  return result;
}

unint64_t sub_233ABDCDC()
{
  unint64_t result;

  result = qword_2560FE9C0;
  if (!qword_2560FE9C0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType.Value, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FE9C0);
  }
  return result;
}

unint64_t sub_233ABDD20()
{
  unint64_t result;

  result = qword_2560FE9C8;
  if (!qword_2560FE9C8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType.Value, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FE9C8);
  }
  return result;
}

unint64_t sub_233ABDD68()
{
  unint64_t result;

  result = qword_2560FE9D0;
  if (!qword_2560FE9D0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType.Value, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FE9D0);
  }
  return result;
}

unint64_t sub_233ABDDB0()
{
  unint64_t result;

  result = qword_2560FE9D8;
  if (!qword_2560FE9D8)
  {
    result = MEMORY[0x23493B550](&unk_233AC5F54, &type metadata for LaunchType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FE9D8);
  }
  return result;
}

uint64_t sub_233ABDDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABDE08, (uint64_t (*)(void))sub_233ABDE4C);
}

unint64_t sub_233ABDE08()
{
  unint64_t result;

  result = qword_2560FEA20;
  if (!qword_2560FEA20)
  {
    result = MEMORY[0x23493B550](&unk_233AC60F8, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_2560FEA20);
  }
  return result;
}

unint64_t sub_233ABDE4C()
{
  unint64_t result;

  result = qword_2560FEA28;
  if (!qword_2560FEA28)
  {
    result = MEMORY[0x23493B550](&unk_233AC6114, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_2560FEA28);
  }
  return result;
}

uint64_t sub_233ABDE90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA5D40, (uint64_t (*)(void))sub_233ABDEA4);
}

unint64_t sub_233ABDEA4()
{
  unint64_t result;

  result = qword_2560FEA30;
  if (!qword_2560FEA30)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for LaunchType, &type metadata for LaunchType);
    atomic_store(result, (unint64_t *)&qword_2560FEA30);
  }
  return result;
}

_UNKNOWN **sub_233ABDEE8()
{
  return &off_2504D2F20;
}

unint64_t sub_233ABDEF8(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABDF1C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABDF1C()
{
  unint64_t result;

  result = qword_2560FEA70;
  if (!qword_2560FEA70)
  {
    result = MEMORY[0x23493B550](&unk_233AC61A0, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_2560FEA70);
  }
  return result;
}

uint64_t sub_233ABDF60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4898, (uint64_t (*)(void))sub_233ABDF74);
}

unint64_t sub_233ABDF74()
{
  unint64_t result;

  result = qword_2560FEA78;
  if (!qword_2560FEA78)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnAuthorizedAuthAPFSVolume, &type metadata for OnAuthorizedAuthAPFSVolume);
    atomic_store(result, (unint64_t *)&qword_2560FEA78);
  }
  return result;
}

unint64_t sub_233ABDFB8(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABDFDC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABDFDC()
{
  unint64_t result;

  result = qword_2560FEA80;
  if (!qword_2560FEA80)
  {
    result = MEMORY[0x23493B550](&unk_233AC627C, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_2560FEA80);
  }
  return result;
}

uint64_t sub_233ABE020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA48DC, (uint64_t (*)(void))sub_233ABE034);
}

unint64_t sub_233ABE034()
{
  unint64_t result;

  result = qword_2560FEA88;
  if (!qword_2560FEA88)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OnSystemVolume, &type metadata for OnSystemVolume);
    atomic_store(result, (unint64_t *)&qword_2560FEA88);
  }
  return result;
}

uint64_t sub_233ABE078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABE08C, (uint64_t (*)(void))sub_233ABE0D0);
}

unint64_t sub_233ABE08C()
{
  unint64_t result;

  result = qword_2560FEA90;
  if (!qword_2560FEA90)
  {
    result = MEMORY[0x23493B550](&unk_233AC6358, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FEA90);
  }
  return result;
}

unint64_t sub_233ABE0D0()
{
  unint64_t result;

  result = qword_2560FEA98;
  if (!qword_2560FEA98)
  {
    result = MEMORY[0x23493B550](&unk_233AC6374, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FEA98);
  }
  return result;
}

uint64_t sub_233ABE114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4920, (uint64_t (*)(void))sub_233ABE128);
}

unint64_t sub_233ABE128()
{
  unint64_t result;

  result = qword_2560FEAA0;
  if (!qword_2560FEAA0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for OSEnvironment, &type metadata for OSEnvironment);
    atomic_store(result, (unint64_t *)&qword_2560FEAA0);
  }
  return result;
}

_UNKNOWN **sub_233ABE16C()
{
  return &off_2504D5288;
}

uint64_t sub_233ABE17C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233ABE8B8(a1, a2, a3, (uint64_t (*)(void))sub_233ABE1A0, (uint64_t (*)(void))sub_233ABE1E4, (uint64_t (*)(void))sub_233ABE228, (uint64_t (*)(void))sub_233ABE26C);
}

unint64_t sub_233ABE1A0()
{
  unint64_t result;

  result = qword_2560FEAE0;
  if (!qword_2560FEAE0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType.Value, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FEAE0);
  }
  return result;
}

unint64_t sub_233ABE1E4()
{
  unint64_t result;

  result = qword_2560FEAE8;
  if (!qword_2560FEAE8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType.Value, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FEAE8);
  }
  return result;
}

unint64_t sub_233ABE228()
{
  unint64_t result;

  result = qword_2560FEAF0;
  if (!qword_2560FEAF0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType.Value, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FEAF0);
  }
  return result;
}

unint64_t sub_233ABE26C()
{
  unint64_t result;

  result = qword_2560FEAF8;
  if (!qword_2560FEAF8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType.Value, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FEAF8);
  }
  return result;
}

unint64_t sub_233ABE2B4()
{
  unint64_t result;

  result = qword_2560FEB00;
  if (!qword_2560FEB00)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType.Value, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FEB00);
  }
  return result;
}

unint64_t sub_233ABE2FC()
{
  unint64_t result;

  result = qword_2560FEB08;
  if (!qword_2560FEB08)
  {
    result = MEMORY[0x23493B550](&unk_233AC63E0, &type metadata for PlatformType.Value);
    atomic_store(result, (unint64_t *)&qword_2560FEB08);
  }
  return result;
}

uint64_t sub_233ABE340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABE354, (uint64_t (*)(void))sub_233ABE398);
}

unint64_t sub_233ABE354()
{
  unint64_t result;

  result = qword_2560FEB50;
  if (!qword_2560FEB50)
  {
    result = MEMORY[0x23493B550](&unk_233AC65BC, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FEB50);
  }
  return result;
}

unint64_t sub_233ABE398()
{
  unint64_t result;

  result = qword_2560FEB58;
  if (!qword_2560FEB58)
  {
    result = MEMORY[0x23493B550](&unk_233AC65D8, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FEB58);
  }
  return result;
}

uint64_t sub_233ABE3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4964, (uint64_t (*)(void))sub_233ABE3F0);
}

unint64_t sub_233ABE3F0()
{
  unint64_t result;

  result = qword_2560FEB60;
  if (!qword_2560FEB60)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformType, &type metadata for PlatformType);
    atomic_store(result, (unint64_t *)&qword_2560FEB60);
  }
  return result;
}

_UNKNOWN **sub_233ABE434()
{
  return &off_2504D3168;
}

uint64_t sub_233ABE444(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233ABE460(a1, a2, a3, (uint64_t (*)(void))sub_233ABE4A4, (uint64_t (*)(void))sub_233ABE4E8, (uint64_t (*)(void))sub_233ABE52C);
}

uint64_t sub_233ABE460(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t result;

  a1[1] = a4();
  a1[2] = a5();
  result = a6();
  a1[3] = result;
  return result;
}

unint64_t sub_233ABE4A4()
{
  unint64_t result;

  result = qword_2560FEBA0;
  if (!qword_2560FEBA0)
  {
    result = MEMORY[0x23493B550](&unk_233AC6664, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEBA0);
  }
  return result;
}

unint64_t sub_233ABE4E8()
{
  unint64_t result;

  result = qword_2560FEBA8;
  if (!qword_2560FEBA8)
  {
    result = MEMORY[0x23493B550](&unk_233AC669C, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEBA8);
  }
  return result;
}

unint64_t sub_233ABE52C()
{
  unint64_t result;

  result = qword_2560FEBB0;
  if (!qword_2560FEBB0)
  {
    result = MEMORY[0x23493B550](&unk_233AC6680, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEBB0);
  }
  return result;
}

uint64_t sub_233ABE570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA49A8, (uint64_t (*)(void))sub_233ABE584);
}

unint64_t sub_233ABE584()
{
  unint64_t result;

  result = qword_2560FEBB8;
  if (!qword_2560FEBB8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for PlatformIdentifier, &type metadata for PlatformIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEBB8);
  }
  return result;
}

_UNKNOWN **sub_233ABE5C8()
{
  return &off_2504D52B8;
}

_UNKNOWN **sub_233ABE5D8()
{
  return &off_2504D5290;
}

uint64_t sub_233ABE5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABE5F8, (uint64_t (*)(void))sub_233ABE63C);
}

unint64_t sub_233ABE5F8()
{
  unint64_t result;

  result = qword_2560FEC40;
  if (!qword_2560FEC40)
  {
    result = MEMORY[0x23493B550](&unk_233AC6778, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEC40);
  }
  return result;
}

unint64_t sub_233ABE63C()
{
  unint64_t result;

  result = qword_2560FEC48;
  if (!qword_2560FEC48)
  {
    result = MEMORY[0x23493B550](&unk_233AC6794, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEC48);
  }
  return result;
}

uint64_t sub_233ABE680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA49EC, (uint64_t (*)(void))sub_233ABE694);
}

unint64_t sub_233ABE694()
{
  unint64_t result;

  result = qword_2560FEC50;
  if (!qword_2560FEC50)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for SigningIdentifier, &type metadata for SigningIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEC50);
  }
  return result;
}

uint64_t sub_233ABE6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABE6F0, (uint64_t (*)(void))sub_233ABE734);
}

unint64_t sub_233ABE6F0()
{
  unint64_t result;

  result = qword_2560FEC90;
  if (!qword_2560FEC90)
  {
    result = MEMORY[0x23493B550](&unk_233AC6870, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEC90);
  }
  return result;
}

unint64_t sub_233ABE734()
{
  unint64_t result;

  result = qword_2560FEC98;
  if (!qword_2560FEC98)
  {
    result = MEMORY[0x23493B550](&unk_233AC688C, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FEC98);
  }
  return result;
}

uint64_t sub_233ABE778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4A30, (uint64_t (*)(void))sub_233ABE78C);
}

unint64_t sub_233ABE78C()
{
  unint64_t result;

  result = qword_2560FECA0;
  if (!qword_2560FECA0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifier, &type metadata for TeamIdentifier);
    atomic_store(result, (unint64_t *)&qword_2560FECA0);
  }
  return result;
}

unint64_t sub_233ABE7D4(uint64_t a1)
{
  unint64_t result;

  result = sub_233ABE7F8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_233ABE7F8()
{
  unint64_t result;

  result = qword_2560FECE0;
  if (!qword_2560FECE0)
  {
    result = MEMORY[0x23493B550](&unk_233AC6930, &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_2560FECE0);
  }
  return result;
}

uint64_t sub_233ABE83C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4A74, (uint64_t (*)(void))sub_233ABE850);
}

unint64_t sub_233ABE850()
{
  unint64_t result;

  result = qword_2560FECE8;
  if (!qword_2560FECE8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for TeamIdentifierMatchesCurrentProcess, &type metadata for TeamIdentifierMatchesCurrentProcess);
    atomic_store(result, (unint64_t *)&qword_2560FECE8);
  }
  return result;
}

uint64_t sub_233ABE894(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_233ABE8B8(a1, a2, a3, (uint64_t (*)(void))sub_233ABE908, (uint64_t (*)(void))sub_233ABE94C, (uint64_t (*)(void))sub_233ABE990, (uint64_t (*)(void))sub_233ABE9D4);
}

uint64_t sub_233ABE8B8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t result;

  a1[2] = a4();
  a1[3] = a5();
  a1[4] = a6();
  result = a7();
  a1[5] = result;
  return result;
}

unint64_t sub_233ABE908()
{
  unint64_t result;

  result = qword_2560FECF0;
  if (!qword_2560FECF0)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory.Value, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_2560FECF0);
  }
  return result;
}

unint64_t sub_233ABE94C()
{
  unint64_t result;

  result = qword_2560FECF8;
  if (!qword_2560FECF8)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory.Value, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_2560FECF8);
  }
  return result;
}

unint64_t sub_233ABE990()
{
  unint64_t result;

  result = qword_2560FED00;
  if (!qword_2560FED00)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory.Value, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_2560FED00);
  }
  return result;
}

unint64_t sub_233ABE9D4()
{
  unint64_t result;

  result = qword_2560FED08;
  if (!qword_2560FED08)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory.Value, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_2560FED08);
  }
  return result;
}

unint64_t sub_233ABEA1C()
{
  unint64_t result;

  result = qword_2560FED10;
  if (!qword_2560FED10)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory.Value, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_2560FED10);
  }
  return result;
}

unint64_t sub_233ABEA64()
{
  unint64_t result;

  result = qword_2560FED18;
  if (!qword_2560FED18)
  {
    result = MEMORY[0x23493B550](&unk_233AC699C, &type metadata for ValidationCategory.Value);
    atomic_store(result, (unint64_t *)&qword_2560FED18);
  }
  return result;
}

uint64_t sub_233ABEAA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233ABEABC, (uint64_t (*)(void))sub_233ABEB00);
}

unint64_t sub_233ABEABC()
{
  unint64_t result;

  result = qword_2560FED60;
  if (!qword_2560FED60)
  {
    result = MEMORY[0x23493B550](&unk_233AC6B78, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FED60);
  }
  return result;
}

unint64_t sub_233ABEB00()
{
  unint64_t result;

  result = qword_2560FED68;
  if (!qword_2560FED68)
  {
    result = MEMORY[0x23493B550](&unk_233AC6B94, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FED68);
  }
  return result;
}

uint64_t sub_233ABEB44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233AA2750(a1, a2, a3, (uint64_t (*)(void))sub_233AA4AB8, (uint64_t (*)(void))sub_233ABEB58);
}

unint64_t sub_233ABEB58()
{
  unint64_t result;

  result = qword_2560FED70;
  if (!qword_2560FED70)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ValidationCategory, &type metadata for ValidationCategory);
    atomic_store(result, (unint64_t *)&qword_2560FED70);
  }
  return result;
}

_UNKNOWN **sub_233ABEB9C()
{
  return &off_2504D3460;
}

ValueMetadata *type metadata accessor for ProcessConstraintBuilder()
{
  return &type metadata for ProcessConstraintBuilder;
}

ValueMetadata *type metadata accessor for LaunchConstraintBuilder()
{
  return &type metadata for LaunchConstraintBuilder;
}

ValueMetadata *type metadata accessor for OnDiskConstraintBuilder()
{
  return &type metadata for OnDiskConstraintBuilder;
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

ValueMetadata *type metadata accessor for AppleInternal()
{
  return &type metadata for AppleInternal;
}

uint64_t destroy for CodeDirectoryHash(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 8);
}

uint64_t assignWithCopy for CodeDirectoryHash(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  return a1;
}

uint64_t assignWithTake for CodeDirectoryHash(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for CodeDirectoryHash()
{
  return &type metadata for CodeDirectoryHash;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags()
{
  return &type metadata for ProcessCodeSigningFlags;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags.ValueSet()
{
  return &type metadata for ProcessCodeSigningFlags.ValueSet;
}

uint64_t destroy for OnDiskCodeSigningFlags()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwta_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s27LightweightCodeRequirements23ProcessCodeSigningFlagsVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags()
{
  return &type metadata for OnDiskCodeSigningFlags;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags.ValueSet()
{
  return &type metadata for OnDiskCodeSigningFlags.ValueSet;
}

ValueMetadata *type metadata accessor for DeveloperMode()
{
  return &type metadata for DeveloperMode;
}

uint64_t method lookup function for EntitlementsQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EntitlementsQuery.key(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of EntitlementsQuery.elementAtIndex(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchSingle(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchPrefixSingle(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of EntitlementsQuery.match(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchPrefix(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of EntitlementsQuery.keyPrefix(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of EntitlementsQuery.matchType(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of EntitlementsQuery.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of EntitlementsQuery.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t getEnumTagSinglePayload for EntitlementsQuery.DataType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EntitlementsQuery.DataType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233ABF064 + 4 * byte_233AC5123[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_233ABF098 + 4 * byte_233AC511E[v4]))();
}

uint64_t sub_233ABF098(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233ABF0A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233ABF0A8);
  return result;
}

uint64_t sub_233ABF0B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233ABF0BCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_233ABF0C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233ABF0C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EntitlementsQuery.DataType()
{
  return &type metadata for EntitlementsQuery.DataType;
}

ValueMetadata *type metadata accessor for InfoPlistHash()
{
  return &type metadata for InfoPlistHash;
}

ValueMetadata *type metadata accessor for InTrustCacheWithConstraintCategory()
{
  return &type metadata for InTrustCacheWithConstraintCategory;
}

ValueMetadata *type metadata accessor for IsInitProcess()
{
  return &type metadata for IsInitProcess;
}

ValueMetadata *type metadata accessor for IsMainBinary()
{
  return &type metadata for IsMainBinary;
}

ValueMetadata *type metadata accessor for IsSIPProtected()
{
  return &type metadata for IsSIPProtected;
}

ValueMetadata *type metadata accessor for LaunchType()
{
  return &type metadata for LaunchType;
}

ValueMetadata *type metadata accessor for LaunchType.Value()
{
  return &type metadata for LaunchType.Value;
}

ValueMetadata *type metadata accessor for OnAuthorizedAuthAPFSVolume()
{
  return &type metadata for OnAuthorizedAuthAPFSVolume;
}

ValueMetadata *type metadata accessor for OnSystemVolume()
{
  return &type metadata for OnSystemVolume;
}

ValueMetadata *type metadata accessor for OSEnvironment()
{
  return &type metadata for OSEnvironment;
}

ValueMetadata *type metadata accessor for PlatformType()
{
  return &type metadata for PlatformType;
}

ValueMetadata *type metadata accessor for PlatformType.Value()
{
  return &type metadata for PlatformType.Value;
}

ValueMetadata *type metadata accessor for PlatformIdentifier()
{
  return &type metadata for PlatformIdentifier;
}

ValueMetadata *type metadata accessor for SigningIdentifier()
{
  return &type metadata for SigningIdentifier;
}

ValueMetadata *type metadata accessor for TeamIdentifier()
{
  return &type metadata for TeamIdentifier;
}

ValueMetadata *type metadata accessor for TeamIdentifierMatchesCurrentProcess()
{
  return &type metadata for TeamIdentifierMatchesCurrentProcess;
}

uint64_t _s27LightweightCodeRequirements13AppleInternalVwcp_0(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a1 + 8, a2 + 8);
  return a1;
}

uint64_t _s27LightweightCodeRequirements13AppleInternalVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_233ABF274(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationCategory()
{
  return &type metadata for ValidationCategory;
}

ValueMetadata *type metadata accessor for ValidationCategory.Value()
{
  return &type metadata for ValidationCategory.Value;
}

ValueMetadata *type metadata accessor for ValidationCategory.CodingKeys()
{
  return &type metadata for ValidationCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for TeamIdentifierMatchesCurrentProcess.CodingKeys()
{
  return &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys;
}

ValueMetadata *type metadata accessor for TeamIdentifier.CodingKeys()
{
  return &type metadata for TeamIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for SigningIdentifier.CodingKeys()
{
  return &type metadata for SigningIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for PlatformIdentifier.CodingKeys()
{
  return &type metadata for PlatformIdentifier.CodingKeys;
}

ValueMetadata *type metadata accessor for PlatformType.CodingKeys()
{
  return &type metadata for PlatformType.CodingKeys;
}

ValueMetadata *type metadata accessor for OSEnvironment.CodingKeys()
{
  return &type metadata for OSEnvironment.CodingKeys;
}

ValueMetadata *type metadata accessor for OnSystemVolume.CodingKeys()
{
  return &type metadata for OnSystemVolume.CodingKeys;
}

ValueMetadata *type metadata accessor for OnAuthorizedAuthAPFSVolume.CodingKeys()
{
  return &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys;
}

ValueMetadata *type metadata accessor for LaunchType.CodingKeys()
{
  return &type metadata for LaunchType.CodingKeys;
}

ValueMetadata *type metadata accessor for IsSIPProtected.CodingKeys()
{
  return &type metadata for IsSIPProtected.CodingKeys;
}

ValueMetadata *type metadata accessor for IsMainBinary.CodingKeys()
{
  return &type metadata for IsMainBinary.CodingKeys;
}

ValueMetadata *type metadata accessor for IsInitProcess.CodingKeys()
{
  return &type metadata for IsInitProcess.CodingKeys;
}

ValueMetadata *type metadata accessor for InTrustCacheWithConstraintCategory.CodingKeys()
{
  return &type metadata for InTrustCacheWithConstraintCategory.CodingKeys;
}

ValueMetadata *type metadata accessor for InfoPlistHash.CodingKeys()
{
  return &type metadata for InfoPlistHash.CodingKeys;
}

ValueMetadata *type metadata accessor for EntitlementsQuery.CodingKeys()
{
  return &type metadata for EntitlementsQuery.CodingKeys;
}

ValueMetadata *type metadata accessor for DeveloperMode.CodingKeys()
{
  return &type metadata for DeveloperMode.CodingKeys;
}

ValueMetadata *type metadata accessor for OnDiskCodeSigningFlags.CodingKeys()
{
  return &type metadata for OnDiskCodeSigningFlags.CodingKeys;
}

ValueMetadata *type metadata accessor for ProcessCodeSigningFlags.CodingKeys()
{
  return &type metadata for ProcessCodeSigningFlags.CodingKeys;
}

ValueMetadata *type metadata accessor for CodeDirectoryHash.CodingKeys()
{
  return &type metadata for CodeDirectoryHash.CodingKeys;
}

uint64_t sub_233ABF42C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_233ABF434()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233AC3668();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_233ABF4B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  int v9;
  uint64_t v12;
  void *v13;
  const void *v14;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  if (*(_DWORD *)(v5 + 84))
    v8 = *(_QWORD *)(v5 + 64);
  else
    v8 = *(_QWORD *)(v5 + 64) + 1;
  v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || ((v8 + 7 + ((v7 + 1) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v13 = (void *)(((unint64_t)a1 + v7 + 1) & ~v7);
    v14 = (const void *)(((unint64_t)a2 + v7 + 1) & ~v7);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4))
    {
      memcpy(v13, v14, v8);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v13, v14, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
    }
    *(_QWORD *)(((unint64_t)v13 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v14 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_233ABF5F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2))
    (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  return swift_bridgeObjectRelease();
}

_BYTE *sub_233ABF670(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  *(_QWORD *)(((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *sub_233ABF760(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v10 = v9(v7, 1, v4);
  v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84))
    v12 = *(_QWORD *)(v5 + 64);
  else
    v12 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  *(_QWORD *)(((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *sub_233ABF8A8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (const void *)((unint64_t)&a2[v6 + 1] & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  *(_QWORD *)(((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_BYTE *sub_233ABF994(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)((unint64_t)&a1[v6 + 1] & ~v6);
  v8 = (void *)((unint64_t)&a2[v6 + 1] & ~v6);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v10 = v9(v7, 1, v4);
  v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84))
    v12 = *(_QWORD *)(v5 + 64);
  else
    v12 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  *(_QWORD *)(((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233ABFAD4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = v8 + 7;
  if (v7 < a2)
  {
    if (((((v10 + ((v9 + 1) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v7 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    __asm { BR              X17 }
  }
  v15 = (a1 + v9 + 1) & ~v9;
  if (v6 < 0x7FFFFFFE)
  {
    v17 = *(_QWORD *)((v10 + v15) & 0xFFFFFFFFFFFFF8);
    if (v17 >= 0xFFFFFFFF)
      LODWORD(v17) = -1;
    if ((v17 + 1) >= 2)
      return v17;
    else
      return 0;
  }
  else
  {
    v16 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v15);
    if (v16 >= 2)
      return v16 - 1;
    else
      return 0;
  }
}

void sub_233ABFC30(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_233ABFD3C@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  _QWORD *v19;
  uint64_t result;

  *(_BYTE *)(v15 + v16) = 0;
  if (a1)
  {
    v17 = (void *)((v15 + v14 + 1) & v10);
    if (v11 < 0x7FFFFFFE)
    {
      v19 = (_QWORD *)(((unint64_t)v17 + v13) & 0xFFFFFFFFFFFFFFF8);
      if (a1 > 0x7FFFFFFE)
      {
        *v19 = 0;
        *(_DWORD *)v19 = a1 - 0x7FFFFFFF;
      }
      else
      {
        *v19 = a1;
      }
    }
    else if (v11 >= a1)
    {
      return (*(uint64_t (**)(void *, _QWORD))(v12 + 56))(v17, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v18 = a2;
      else
        v18 = 4;
      bzero(v17, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_233ABFE4C()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_233ABFE5C()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_233ABFE64()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t type metadata accessor for ContainerConstraint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContainerConstraint);
}

uint64_t _s27LightweightCodeRequirements18ValidationCategoryV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233ABFEC8 + 4 * byte_233AC5140[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_233ABFEFC + 4 * byte_233AC513B[v4]))();
}

uint64_t sub_233ABFEFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233ABFF04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233ABFF0CLL);
  return result;
}

uint64_t sub_233ABFF18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233ABFF20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_233ABFF24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233ABFF2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppleInternal.CodingKeys()
{
  return &type metadata for AppleInternal.CodingKeys;
}

unint64_t sub_233ABFF4C()
{
  unint64_t result;

  result = qword_2560FEF70;
  if (!qword_2560FEF70)
  {
    result = MEMORY[0x23493B550](&unk_233AC7140, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEF70);
  }
  return result;
}

unint64_t sub_233ABFF98()
{
  unint64_t result;

  result = qword_2560FEF78;
  if (!qword_2560FEF78)
  {
    result = MEMORY[0x23493B550](&unk_233AC724C, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEF78);
  }
  return result;
}

unint64_t sub_233ABFFE0()
{
  unint64_t result;

  result = qword_2560FEF80;
  if (!qword_2560FEF80)
  {
    result = MEMORY[0x23493B550](&unk_233AC7304, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEF80);
  }
  return result;
}

unint64_t sub_233AC0028()
{
  unint64_t result;

  result = qword_2560FEF88;
  if (!qword_2560FEF88)
  {
    result = MEMORY[0x23493B550](&unk_233AC73BC, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEF88);
  }
  return result;
}

unint64_t sub_233AC0070()
{
  unint64_t result;

  result = qword_2560FEF90;
  if (!qword_2560FEF90)
  {
    result = MEMORY[0x23493B550](&unk_233AC74AC, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEF90);
  }
  return result;
}

unint64_t sub_233AC00B8()
{
  unint64_t result;

  result = qword_2560FEF98;
  if (!qword_2560FEF98)
  {
    result = MEMORY[0x23493B550](&unk_233AC759C, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEF98);
  }
  return result;
}

unint64_t sub_233AC0100()
{
  unint64_t result;

  result = qword_2560FEFA0;
  if (!qword_2560FEFA0)
  {
    result = MEMORY[0x23493B550](&unk_233AC768C, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFA0);
  }
  return result;
}

unint64_t sub_233AC0148()
{
  unint64_t result;

  result = qword_2560FEFA8;
  if (!qword_2560FEFA8)
  {
    result = MEMORY[0x23493B550](&unk_233AC777C, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFA8);
  }
  return result;
}

unint64_t sub_233AC0190()
{
  unint64_t result;

  result = qword_2560FEFB0;
  if (!qword_2560FEFB0)
  {
    result = MEMORY[0x23493B550](&unk_233AC786C, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFB0);
  }
  return result;
}

unint64_t sub_233AC01D8()
{
  unint64_t result;

  result = qword_2560FEFB8;
  if (!qword_2560FEFB8)
  {
    result = MEMORY[0x23493B550](&unk_233AC795C, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFB8);
  }
  return result;
}

unint64_t sub_233AC0220()
{
  unint64_t result;

  result = qword_2560FEFC0;
  if (!qword_2560FEFC0)
  {
    result = MEMORY[0x23493B550](&unk_233AC7A4C, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFC0);
  }
  return result;
}

unint64_t sub_233AC0268()
{
  unint64_t result;

  result = qword_2560FEFC8;
  if (!qword_2560FEFC8)
  {
    result = MEMORY[0x23493B550](&unk_233AC7B3C, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFC8);
  }
  return result;
}

unint64_t sub_233AC02B0()
{
  unint64_t result;

  result = qword_2560FEFD0;
  if (!qword_2560FEFD0)
  {
    result = MEMORY[0x23493B550](&unk_233AC7C2C, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFD0);
  }
  return result;
}

unint64_t sub_233AC02F8()
{
  unint64_t result;

  result = qword_2560FEFD8;
  if (!qword_2560FEFD8)
  {
    result = MEMORY[0x23493B550](&unk_233AC7D1C, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFD8);
  }
  return result;
}

unint64_t sub_233AC0340()
{
  unint64_t result;

  result = qword_2560FEFE0;
  if (!qword_2560FEFE0)
  {
    result = MEMORY[0x23493B550](&unk_233AC7E0C, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFE0);
  }
  return result;
}

unint64_t sub_233AC0388()
{
  unint64_t result;

  result = qword_2560FEFE8;
  if (!qword_2560FEFE8)
  {
    result = MEMORY[0x23493B550](&unk_233AC7EFC, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFE8);
  }
  return result;
}

unint64_t sub_233AC03D0()
{
  unint64_t result;

  result = qword_2560FEFF0;
  if (!qword_2560FEFF0)
  {
    result = MEMORY[0x23493B550](&unk_233AC7FEC, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFF0);
  }
  return result;
}

unint64_t sub_233AC0418()
{
  unint64_t result;

  result = qword_2560FEFF8;
  if (!qword_2560FEFF8)
  {
    result = MEMORY[0x23493B550](&unk_233AC80DC, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FEFF8);
  }
  return result;
}

unint64_t sub_233AC0460()
{
  unint64_t result;

  result = qword_2560FF000;
  if (!qword_2560FF000)
  {
    result = MEMORY[0x23493B550](&unk_233AC81CC, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF000);
  }
  return result;
}

unint64_t sub_233AC04A8()
{
  unint64_t result;

  result = qword_2560FF008;
  if (!qword_2560FF008)
  {
    result = MEMORY[0x23493B550](&unk_233AC82BC, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF008);
  }
  return result;
}

unint64_t sub_233AC04F0()
{
  unint64_t result;

  result = qword_2560FF010;
  if (!qword_2560FF010)
  {
    result = MEMORY[0x23493B550](&unk_233AC83AC, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF010);
  }
  return result;
}

unint64_t sub_233AC0538()
{
  unint64_t result;

  result = qword_2560FF018;
  if (!qword_2560FF018)
  {
    result = MEMORY[0x23493B550](&unk_233AC82E4, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF018);
  }
  return result;
}

unint64_t sub_233AC0580()
{
  unint64_t result;

  result = qword_2560FF020;
  if (!qword_2560FF020)
  {
    result = MEMORY[0x23493B550](&unk_233AC830C, &type metadata for ValidationCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF020);
  }
  return result;
}

unint64_t sub_233AC05C8()
{
  unint64_t result;

  result = qword_2560FF028;
  if (!qword_2560FF028)
  {
    result = MEMORY[0x23493B550](&unk_233AC81F4, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF028);
  }
  return result;
}

unint64_t sub_233AC0610()
{
  unint64_t result;

  result = qword_2560FF030;
  if (!qword_2560FF030)
  {
    result = MEMORY[0x23493B550](&unk_233AC821C, &type metadata for TeamIdentifierMatchesCurrentProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF030);
  }
  return result;
}

unint64_t sub_233AC0658()
{
  unint64_t result;

  result = qword_2560FF038;
  if (!qword_2560FF038)
  {
    result = MEMORY[0x23493B550](&unk_233AC8104, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF038);
  }
  return result;
}

unint64_t sub_233AC06A0()
{
  unint64_t result;

  result = qword_2560FF040;
  if (!qword_2560FF040)
  {
    result = MEMORY[0x23493B550](&unk_233AC812C, &type metadata for TeamIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF040);
  }
  return result;
}

unint64_t sub_233AC06E8()
{
  unint64_t result;

  result = qword_2560FF048;
  if (!qword_2560FF048)
  {
    result = MEMORY[0x23493B550](&unk_233AC8014, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF048);
  }
  return result;
}

unint64_t sub_233AC0730()
{
  unint64_t result;

  result = qword_2560FF050;
  if (!qword_2560FF050)
  {
    result = MEMORY[0x23493B550](&unk_233AC803C, &type metadata for SigningIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF050);
  }
  return result;
}

unint64_t sub_233AC0778()
{
  unint64_t result;

  result = qword_2560FF058;
  if (!qword_2560FF058)
  {
    result = MEMORY[0x23493B550](&unk_233AC7F24, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF058);
  }
  return result;
}

unint64_t sub_233AC07C0()
{
  unint64_t result;

  result = qword_2560FF060;
  if (!qword_2560FF060)
  {
    result = MEMORY[0x23493B550](&unk_233AC7F4C, &type metadata for PlatformIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF060);
  }
  return result;
}

unint64_t sub_233AC0808()
{
  unint64_t result;

  result = qword_2560FF068;
  if (!qword_2560FF068)
  {
    result = MEMORY[0x23493B550](&unk_233AC7E34, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF068);
  }
  return result;
}

unint64_t sub_233AC0850()
{
  unint64_t result;

  result = qword_2560FF070;
  if (!qword_2560FF070)
  {
    result = MEMORY[0x23493B550](&unk_233AC7E5C, &type metadata for PlatformType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF070);
  }
  return result;
}

unint64_t sub_233AC0898()
{
  unint64_t result;

  result = qword_2560FF078;
  if (!qword_2560FF078)
  {
    result = MEMORY[0x23493B550](&unk_233AC7D44, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF078);
  }
  return result;
}

unint64_t sub_233AC08E0()
{
  unint64_t result;

  result = qword_2560FF080;
  if (!qword_2560FF080)
  {
    result = MEMORY[0x23493B550](&unk_233AC7D6C, &type metadata for OSEnvironment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF080);
  }
  return result;
}

unint64_t sub_233AC0928()
{
  unint64_t result;

  result = qword_2560FF088;
  if (!qword_2560FF088)
  {
    result = MEMORY[0x23493B550](&unk_233AC7C54, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF088);
  }
  return result;
}

unint64_t sub_233AC0970()
{
  unint64_t result;

  result = qword_2560FF090;
  if (!qword_2560FF090)
  {
    result = MEMORY[0x23493B550](&unk_233AC7C7C, &type metadata for OnSystemVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF090);
  }
  return result;
}

unint64_t sub_233AC09B8()
{
  unint64_t result;

  result = qword_2560FF098;
  if (!qword_2560FF098)
  {
    result = MEMORY[0x23493B550](&unk_233AC7B64, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF098);
  }
  return result;
}

unint64_t sub_233AC0A00()
{
  unint64_t result;

  result = qword_2560FF0A0;
  if (!qword_2560FF0A0)
  {
    result = MEMORY[0x23493B550](&unk_233AC7B8C, &type metadata for OnAuthorizedAuthAPFSVolume.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0A0);
  }
  return result;
}

unint64_t sub_233AC0A48()
{
  unint64_t result;

  result = qword_2560FF0A8;
  if (!qword_2560FF0A8)
  {
    result = MEMORY[0x23493B550](&unk_233AC7A74, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0A8);
  }
  return result;
}

unint64_t sub_233AC0A90()
{
  unint64_t result;

  result = qword_2560FF0B0;
  if (!qword_2560FF0B0)
  {
    result = MEMORY[0x23493B550](&unk_233AC7A9C, &type metadata for LaunchType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0B0);
  }
  return result;
}

unint64_t sub_233AC0AD8()
{
  unint64_t result;

  result = qword_2560FF0B8;
  if (!qword_2560FF0B8)
  {
    result = MEMORY[0x23493B550](&unk_233AC7984, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0B8);
  }
  return result;
}

unint64_t sub_233AC0B20()
{
  unint64_t result;

  result = qword_2560FF0C0;
  if (!qword_2560FF0C0)
  {
    result = MEMORY[0x23493B550](&unk_233AC79AC, &type metadata for IsSIPProtected.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0C0);
  }
  return result;
}

unint64_t sub_233AC0B68()
{
  unint64_t result;

  result = qword_2560FF0C8;
  if (!qword_2560FF0C8)
  {
    result = MEMORY[0x23493B550](&unk_233AC7894, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0C8);
  }
  return result;
}

unint64_t sub_233AC0BB0()
{
  unint64_t result;

  result = qword_2560FF0D0;
  if (!qword_2560FF0D0)
  {
    result = MEMORY[0x23493B550](&unk_233AC78BC, &type metadata for IsMainBinary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0D0);
  }
  return result;
}

unint64_t sub_233AC0BF8()
{
  unint64_t result;

  result = qword_2560FF0D8;
  if (!qword_2560FF0D8)
  {
    result = MEMORY[0x23493B550](&unk_233AC77A4, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0D8);
  }
  return result;
}

unint64_t sub_233AC0C40()
{
  unint64_t result;

  result = qword_2560FF0E0;
  if (!qword_2560FF0E0)
  {
    result = MEMORY[0x23493B550](&unk_233AC77CC, &type metadata for IsInitProcess.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0E0);
  }
  return result;
}

unint64_t sub_233AC0C88()
{
  unint64_t result;

  result = qword_2560FF0E8;
  if (!qword_2560FF0E8)
  {
    result = MEMORY[0x23493B550](&unk_233AC76B4, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0E8);
  }
  return result;
}

unint64_t sub_233AC0CD0()
{
  unint64_t result;

  result = qword_2560FF0F0;
  if (!qword_2560FF0F0)
  {
    result = MEMORY[0x23493B550](&unk_233AC76DC, &type metadata for InTrustCacheWithConstraintCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0F0);
  }
  return result;
}

unint64_t sub_233AC0D18()
{
  unint64_t result;

  result = qword_2560FF0F8;
  if (!qword_2560FF0F8)
  {
    result = MEMORY[0x23493B550](&unk_233AC75C4, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF0F8);
  }
  return result;
}

unint64_t sub_233AC0D60()
{
  unint64_t result;

  result = qword_2560FF100;
  if (!qword_2560FF100)
  {
    result = MEMORY[0x23493B550](&unk_233AC75EC, &type metadata for InfoPlistHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF100);
  }
  return result;
}

unint64_t sub_233AC0DA8()
{
  unint64_t result;

  result = qword_2560FF108;
  if (!qword_2560FF108)
  {
    result = MEMORY[0x23493B550](&unk_233AC74D4, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF108);
  }
  return result;
}

unint64_t sub_233AC0DF0()
{
  unint64_t result;

  result = qword_2560FF110;
  if (!qword_2560FF110)
  {
    result = MEMORY[0x23493B550](&unk_233AC74FC, &type metadata for EntitlementsQuery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF110);
  }
  return result;
}

unint64_t sub_233AC0E38()
{
  unint64_t result;

  result = qword_2560FF118;
  if (!qword_2560FF118)
  {
    result = MEMORY[0x23493B550](&unk_233AC73E4, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF118);
  }
  return result;
}

unint64_t sub_233AC0E80()
{
  unint64_t result;

  result = qword_2560FF120;
  if (!qword_2560FF120)
  {
    result = MEMORY[0x23493B550](&unk_233AC740C, &type metadata for DeveloperMode.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF120);
  }
  return result;
}

unint64_t sub_233AC0EC8()
{
  unint64_t result;

  result = qword_2560FF128;
  if (!qword_2560FF128)
  {
    result = MEMORY[0x23493B550](&unk_233AC732C, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF128);
  }
  return result;
}

unint64_t sub_233AC0F10()
{
  unint64_t result;

  result = qword_2560FF130;
  if (!qword_2560FF130)
  {
    result = MEMORY[0x23493B550](&unk_233AC7354, &type metadata for OnDiskCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF130);
  }
  return result;
}

unint64_t sub_233AC0F58()
{
  unint64_t result;

  result = qword_2560FF138;
  if (!qword_2560FF138)
  {
    result = MEMORY[0x23493B550](&unk_233AC7274, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF138);
  }
  return result;
}

unint64_t sub_233AC0FA0()
{
  unint64_t result;

  result = qword_2560FF140;
  if (!qword_2560FF140)
  {
    result = MEMORY[0x23493B550](&unk_233AC729C, &type metadata for ProcessCodeSigningFlags.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF140);
  }
  return result;
}

unint64_t sub_233AC0FE8()
{
  unint64_t result;

  result = qword_2560FF148;
  if (!qword_2560FF148)
  {
    result = MEMORY[0x23493B550](&unk_233AC7184, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF148);
  }
  return result;
}

unint64_t sub_233AC1030()
{
  unint64_t result;

  result = qword_2560FF150;
  if (!qword_2560FF150)
  {
    result = MEMORY[0x23493B550](&unk_233AC71AC, &type metadata for CodeDirectoryHash.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF150);
  }
  return result;
}

uint64_t sub_233AC1074(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x23493B550](&unk_233AC89FC);
  result = MEMORY[0x23493B550](&unk_233AC8A24, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_233AC10BC()
{
  unint64_t result;

  result = qword_2560FF158;
  if (!qword_2560FF158)
  {
    result = MEMORY[0x23493B550](&unk_233AC7078, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF158);
  }
  return result;
}

unint64_t sub_233AC1104()
{
  unint64_t result;

  result = qword_2560FF160;
  if (!qword_2560FF160)
  {
    result = MEMORY[0x23493B550](&unk_233AC70A0, &type metadata for AppleInternal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF160);
  }
  return result;
}

uint64_t type metadata accessor for ContainerConstraint.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContainerConstraint.CodingKeys);
}

uint64_t sub_233AC1154(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_233AC11DC(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    sub_233AA71E0(*(_QWORD *)(a5 + 56) + 40 * a2, result);
    swift_bridgeObjectRetain();
    return v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

_QWORD *sub_233AC126C(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    *result = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_233AC1300(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 v7;
  uint64_t v8;
  char v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v12[40];

  sub_233AA71E0(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF220);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_12;
  if (*(_QWORD *)(v11 + 16) != 1)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    sub_233AA45E0();
    swift_allocError();
    *v10 = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  sub_233AADC48(v11);
  v3 = v2;
  v5 = v4;
  result = swift_bridgeObjectRelease();
  if (v3)
  {
    v7 = sub_233AC30FC();
    if (v7 != 31)
    {
      if (sub_233AC1BB4(v7) == 0x797265757124 && v8 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
LABEL_10:
        __swift_destroy_boxed_opaque_existential_1(a1);
        type metadata accessor for EntitlementsQuery();
        result = swift_allocObject();
        *(_WORD *)(result + 16) = 7684;
        *(_QWORD *)(result + 24) = v5;
        return result;
      }
      v9 = sub_233AC383C();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
        goto LABEL_10;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AC1498()
{
  return 3;
}

uint64_t sub_233AC14A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_233AC383C() & 1) != 0)
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
    v6 = sub_233AC383C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_233AC1578()
{
  unint64_t v0;

  v0 = sub_233AC36EC();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_233AC15C0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_233AC15E8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233AC1610(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE160);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233AC1650()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocObject();
}

uint64_t sub_233AC1674()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_233AC1698(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for EntitlementsQuery();
    result = MEMORY[0x23493B550](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23493B520](a1, v6, a5);
}

uint64_t sub_233AC1700()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t _s27LightweightCodeRequirements17EntitlementsQueryC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AC1754 + 4 * byte_233AC514A[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233AC1788 + 4 * byte_233AC5145[v4]))();
}

uint64_t sub_233AC1788(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AC1790(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AC1798);
  return result;
}

uint64_t sub_233AC17A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AC17ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233AC17B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AC17B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_233AC17C4()
{
  JUMPOUT(0x23493B550);
}

void sub_233AC17D4()
{
  JUMPOUT(0x23493B550);
}

void sub_233AC17E4()
{
  JUMPOUT(0x23493B550);
}

void SecTaskValidateForRequirement(task:requirement:)()
{
  void *v0;
  char v1;

  v0 = (void *)sub_233AC3560();
  v1 = SecTaskValidateForLightweightCodeRequirementData();

  if ((v1 & 1) == 0)
    __break(1u);
}

unint64_t sub_233AC1B6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2560FF310;
  if (!qword_2560FF310)
  {
    type metadata accessor for CFString();
    result = MEMORY[0x23493B550](&unk_233AC3F70, v1);
    atomic_store(result, (unint64_t *)&qword_2560FF310);
  }
  return result;
}

uint64_t sub_233AC1BB4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_233AC1BF4 + 4 * byte_233AC8C30[a1]))(0x6E692D656C707061, 0xEE006C616E726574);
}

uint64_t sub_233AC1BF4()
{
  return 0x687361686463;
}

unint64_t sub_233AC1C08()
{
  return 0xD000000000000012;
}

uint64_t sub_233AC1E10()
{
  return 1684955428;
}

uint64_t sub_233AC1E20()
{
  return 0x7272612D646E6124;
}

uint64_t sub_233AC1E3C()
{
  return 7235876;
}

uint64_t sub_233AC1E4C()
{
  return 0x68632D67616C6624;
}

uint64_t sub_233AC1E6C()
{
  return 7628580;
}

uint64_t sub_233AC1E7C()
{
  return 1702127396;
}

uint64_t sub_233AC1E8C()
{
  return 1702128676;
}

uint64_t sub_233AC1EA0()
{
  return 7499556;
}

uint64_t sub_233AC1EB0()
{
  return 0x617272612D726F24;
}

uint64_t sub_233AC1ECC()
{
  return 0x797265757124;
}

uint64_t sub_233AC1EE0()
{
  return 7629860;
}

uint64_t sub_233AC1EF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  __int128 v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;
  _BYTE *v26;
  uint64_t result;
  uint64_t v28;
  int64_t v29;
  __int128 v31[2];
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;

  v28 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v41 = &v40;
  v29 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  v5 = 0;
  v6 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v4)
    {
      v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v9 = v8 | (v5 << 6);
LABEL_8:
      sub_233AC314C(*(_QWORD *)(a1 + 48) + 40 * v9, (uint64_t)&v33);
      sub_233AADB30(*(_QWORD *)(a1 + 56) + 32 * v9, (uint64_t)v35 + 8);
      goto LABEL_18;
    }
    v10 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_49;
    if (v10 < v29)
    {
      v11 = *(_QWORD *)(v28 + 8 * v10);
      if (v11)
        goto LABEL_12;
      v5 += 2;
      if (v10 + 1 >= v29)
      {
        v5 = v10;
      }
      else
      {
        v11 = *(_QWORD *)(v28 + 8 * v5);
        if (v11)
        {
          ++v10;
LABEL_12:
          v4 = (v11 - 1) & v11;
          v9 = __clz(__rbit64(v11)) + (v10 << 6);
          v5 = v10;
          goto LABEL_8;
        }
        if (v10 + 2 < v29)
        {
          v11 = *(_QWORD *)(v28 + 8 * (v10 + 2));
          if (v11)
          {
            v10 += 2;
            goto LABEL_12;
          }
          v25 = v10 + 3;
          if (v10 + 3 < v29)
          {
            v11 = *(_QWORD *)(v28 + 8 * v25);
            if (!v11)
            {
              while (1)
              {
                v10 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_50;
                if (v10 >= v29)
                {
                  v5 = v29 - 1;
                  goto LABEL_17;
                }
                v11 = *(_QWORD *)(v28 + 8 * v10);
                ++v25;
                if (v11)
                  goto LABEL_12;
              }
            }
            v10 += 3;
            goto LABEL_12;
          }
          v5 = v10 + 2;
        }
      }
    }
LABEL_17:
    v4 = 0;
    v36 = 0;
    memset(v35, 0, sizeof(v35));
    v33 = 0u;
    v34 = 0u;
LABEL_18:
    sub_233AC3188((uint64_t)&v33, (uint64_t)&v37);
    if (!*((_QWORD *)&v38 + 1))
      goto LABEL_46;
    sub_233AADB6C(v41, v32);
    v33 = v37;
    v34 = v38;
    *(_QWORD *)&v35[0] = v39;
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_233AA45E0();
      swift_allocError();
      *v26 = 1;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
LABEL_46:
      swift_release();
      return (uint64_t)v6;
    }
    v12 = v31[0];
    sub_233AC235C((uint64_t)v32, (uint64_t *)&v33);
    if (v1)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    sub_233AA71E0((uint64_t)&v33, (uint64_t)v31);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = sub_233AA346C(v12, *((uint64_t *)&v12 + 1));
    v16 = v6[2];
    v17 = (v14 & 1) == 0;
    v18 = v16 + v17;
    if (__OFADD__(v16, v17))
      break;
    v19 = v14;
    if (v6[3] >= v18)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v14 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_233AA34D0();
        if ((v19 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_233AA3148(v18, isUniquelyReferenced_nonNull_native);
      v20 = sub_233AA346C(v12, *((uint64_t *)&v12 + 1));
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_51;
      v15 = v20;
      if ((v19 & 1) != 0)
      {
LABEL_4:
        v7 = v6[7] + 40 * v15;
        __swift_destroy_boxed_opaque_existential_1(v7);
        sub_233AA4660(v31, v7);
        goto LABEL_5;
      }
    }
    v6[(v15 >> 6) + 8] |= 1 << v15;
    *(_OWORD *)(v6[6] + 16 * v15) = v12;
    sub_233AA4660(v31, v6[7] + 40 * v15);
    v22 = v6[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_48;
    v6[2] = v24;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  result = sub_233AC3854();
  __break(1u);
  return result;
}

uint64_t ConstraintCategory.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  if (result == 255)
    v2 = 255;
  else
    v2 = 0;
  v3 = result != 255;
  if (result == 17)
  {
    v2 = 17;
    v3 = 0;
  }
  if (!result)
  {
    v2 = 0;
    v3 = 0;
  }
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_233AC235C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _UNKNOWN **v19;
  _BYTE *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23[4];
  __int128 v24[2];
  uint64_t v25;
  _BYTE v26[32];
  uint64_t v27;

  sub_233AADB30(a1, (uint64_t)v26);
  v5 = MEMORY[0x24BEE0D00];
  if (swift_dynamicCast())
  {
    swift_bridgeObjectRelease();
    sub_233AADB30(a1, (uint64_t)v24);
    v6 = &off_2504D5278;
LABEL_3:
    a2[3] = v5;
    a2[4] = (uint64_t)v6;
LABEL_7:
    swift_dynamicCast();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  v7 = MEMORY[0x24BDCDDE8];
  if (swift_dynamicCast())
  {
    sub_233AA94E0(v23[0], v23[1]);
    sub_233AADB30(a1, (uint64_t)v24);
    v8 = &off_2504D5308;
LABEL_6:
    a2[3] = v7;
    a2[4] = (uint64_t)v8;
    goto LABEL_7;
  }
  if (swift_dynamicCast())
  {
    sub_233AADB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    a2[3] = MEMORY[0x24BEE4008];
    a2[4] = (uint64_t)&off_2504D52A8;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  if (swift_dynamicCast())
  {
    sub_233AADB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    v10 = MEMORY[0x24BEE4008];
    v11 = (char)v27;
LABEL_17:
    a2[3] = v10;
    a2[4] = (uint64_t)&off_2504D52A8;
    *a2 = v11;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  if (swift_dynamicCast())
  {
    sub_233AADB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    v10 = MEMORY[0x24BEE4008];
    v11 = (__int16)v27;
    goto LABEL_17;
  }
  if (swift_dynamicCast())
  {
    sub_233AADB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    v10 = MEMORY[0x24BEE4008];
    v11 = (int)v27;
    goto LABEL_17;
  }
  v5 = MEMORY[0x24BEE4008];
  if (swift_dynamicCast())
  {
    sub_233AADB30(a1, (uint64_t)v24);
    v6 = &off_2504D52A8;
    goto LABEL_3;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF350);
  if (!swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF358);
    if (!swift_dynamicCast())
    {
      v7 = MEMORY[0x24BEE1328];
      if (!swift_dynamicCast())
      {
        sub_233AA45E0();
        swift_allocError();
        *v20 = 1;
        swift_willThrow();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      sub_233AADB30(a1, (uint64_t)v24);
      v8 = &off_2504D52D8;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    sub_233AADB30(a1, (uint64_t)v24);
    swift_dynamicCast();
    v14 = sub_233AC1EF4(v27);
    swift_bridgeObjectRelease();
    if (v2)
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE0F8);
    v19 = &off_2504D5320;
LABEL_37:
    a2[3] = v18;
    a2[4] = (uint64_t)v19;
    *a2 = v14;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  swift_bridgeObjectRelease();
  sub_233AADB30(a1, (uint64_t)v24);
  swift_dynamicCast();
  v12 = *(_QWORD *)(v23[0] + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    v14 = MEMORY[0x24BEE4AF8];
LABEL_36:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FE150);
    v19 = &off_2504D5328;
    goto LABEL_37;
  }
  v25 = MEMORY[0x24BEE4AF8];
  sub_233AA295C(0, v12, 0);
  v13 = v23[0] + 32;
  while (1)
  {
    sub_233AADB30(v13, (uint64_t)v23);
    sub_233AC235C(v24, v23);
    if (v2)
      break;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    v14 = v25;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_233AA295C(0, *(_QWORD *)(v14 + 16) + 1, 1);
      v14 = v25;
    }
    v15 = *(_QWORD *)(v14 + 16);
    v16 = *(_QWORD *)(v14 + 24);
    v17 = v15 + 1;
    if (v15 >= v16 >> 1)
    {
      v21 = *(_QWORD *)(v14 + 16);
      v22 = v15 + 1;
      sub_233AA295C((_QWORD *)(v16 > 1), v15 + 1, 1);
      v15 = v21;
      v17 = v22;
      v14 = v25;
    }
    *(_QWORD *)(v14 + 16) = v17;
    sub_233AA4660(v24, v14 + 40 * v15 + 32);
    v13 += 32;
    if (!--v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t ConstraintCategory.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static ConstraintCategory.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static ConstraintCategory.sysdiagnoseNewTool.getter(_QWORD *a1@<X8>)
{
  *a1 = 17;
}

void static ConstraintCategory.logOnly.getter(_QWORD *a1@<X8>)
{
  *a1 = 255;
}

uint64_t sub_233AC28FC()
{
  sub_233AC2AD4();
  return sub_233AC3614();
}

uint64_t sub_233AC2958()
{
  sub_233AC2AD4();
  return sub_233AC35FC();
}

uint64_t *sub_233AC29A4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;
  char v4;

  v2 = *result;
  if (!*result || (v2 != 255 ? (v3 = v2 == 17) : (v3 = 1), v3))
  {
    v4 = 0;
  }
  else
  {
    v2 = 0;
    v4 = 1;
  }
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

BOOL static ConstraintError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ConstraintError.hash(into:)()
{
  return sub_233AC389C();
}

uint64_t ConstraintError.hashValue.getter()
{
  sub_233AC3890();
  sub_233AC389C();
  return sub_233AC38B4();
}

unint64_t sub_233AC2A54(_QWORD *a1)
{
  unint64_t result;

  a1[2] = sub_233AACCA8();
  a1[3] = sub_233AACC64();
  a1[4] = sub_233AC2A90();
  result = sub_233AC2AD4();
  a1[5] = result;
  return result;
}

unint64_t sub_233AC2A90()
{
  unint64_t result;

  result = qword_2560FF318;
  if (!qword_2560FF318)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintCategory, &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FF318);
  }
  return result;
}

unint64_t sub_233AC2AD4()
{
  unint64_t result;

  result = qword_2560FF320;
  if (!qword_2560FF320)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintCategory, &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FF320);
  }
  return result;
}

unint64_t sub_233AC2B1C()
{
  unint64_t result;

  result = qword_2560FF328;
  if (!qword_2560FF328)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintCategory, &type metadata for ConstraintCategory);
    atomic_store(result, (unint64_t *)&qword_2560FF328);
  }
  return result;
}

unint64_t sub_233AC2B64()
{
  unint64_t result;

  result = qword_2560FF330;
  if (!qword_2560FF330)
  {
    result = MEMORY[0x23493B550](&protocol conformance descriptor for ConstraintError, &type metadata for ConstraintError);
    atomic_store(result, (unint64_t *)&qword_2560FF330);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintCategory()
{
  return &type metadata for ConstraintCategory;
}

uint64_t storeEnumTagSinglePayload for ConstraintError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AC2C14 + 4 * byte_233AC8C54[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_233AC2C48 + 4 * byte_233AC8C4F[v4]))();
}

uint64_t sub_233AC2C48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AC2C50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AC2C58);
  return result;
}

uint64_t sub_233AC2C64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AC2C6CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_233AC2C70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AC2C78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintError()
{
  return &type metadata for ConstraintError;
}

uint64_t getEnumTagSinglePayload for ConstraintKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE2)
    goto LABEL_17;
  if (a2 + 30 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 30) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 30;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 30;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 30;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1F;
  v8 = v6 - 31;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstraintKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 30 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 30) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE1)
    return ((uint64_t (*)(void))((char *)&loc_233AC2D70 + 4 * byte_233AC8C5E[v4]))();
  *a1 = a2 + 30;
  return ((uint64_t (*)(void))((char *)sub_233AC2DA4 + 4 * byte_233AC8C59[v4]))();
}

uint64_t sub_233AC2DA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AC2DAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AC2DB4);
  return result;
}

uint64_t sub_233AC2DC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AC2DC8);
  *(_BYTE *)result = a2 + 30;
  return result;
}

uint64_t sub_233AC2DCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AC2DD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintKeys()
{
  return &type metadata for ConstraintKeys;
}

uint64_t sub_233AC2DF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_233AC1BB4(*a1);
  v5 = v4;
  if (v3 == sub_233AC1BB4(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_233AC383C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_233AC2E78()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_233AC3890();
  sub_233AC1BB4(v1);
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AC2ED8()
{
  unsigned __int8 *v0;

  sub_233AC1BB4(*v0);
  sub_233AC35D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AC2F18()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_233AC3890();
  sub_233AC1BB4(v1);
  sub_233AC35D8();
  swift_bridgeObjectRelease();
  return sub_233AC38B4();
}

uint64_t sub_233AC2F74@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_233AC30FC();
  *a1 = result;
  return result;
}

uint64_t sub_233AC2FA0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_233AC1BB4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_233AC2FCC()
{
  unint64_t result;

  result = qword_2560FF338;
  if (!qword_2560FF338)
  {
    result = MEMORY[0x23493B550](&unk_233AC90F0, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF338);
  }
  return result;
}

uint64_t sub_233AC3010()
{
  sub_233AC30B8();
  return sub_233AC3608();
}

uint64_t sub_233AC306C()
{
  sub_233AC30B8();
  return sub_233AC35F0();
}

unint64_t sub_233AC30B8()
{
  unint64_t result;

  result = qword_2560FF340;
  if (!qword_2560FF340)
  {
    result = MEMORY[0x23493B550](&unk_233AC9078, &type metadata for ConstraintKeys);
    atomic_store(result, (unint64_t *)&qword_2560FF340);
  }
  return result;
}

uint64_t sub_233AC30FC()
{
  unint64_t v0;

  v0 = sub_233AC3848();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1F)
    return 31;
  else
    return v0;
}

uint64_t sub_233AC314C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_233AC3188(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560FF348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ValidationResult.signatureIsValid.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ValidationResult.requirementMatched.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ValidationResult.failureReason.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

void sub_233AC31E8()
{
  void *v0;
  int v1;

  v0 = (void *)sub_233AC3560();
  v1 = SecRequirementCreateWithLightweightCodeRequirementData();

  if (!v1)
    __break(1u);
}

void SecStaticCodeCheckValidityWithOnDiskRequirement(code:flags:requirement:)(const __SecCode *a1@<X0>, SecCSFlags a2@<W1>, uint64_t a3@<X8>)
{
  OSStatus v6;
  __SecRequirement *v7;
  __SecRequirement *v8;
  OSStatus v9;
  BOOL v10;
  char v11;
  BOOL v12;

  sub_233AC31E8();
  if (v7)
  {
    v8 = v7;
    v9 = SecStaticCodeCheckValidity(a1, a2, v7);

    v10 = v9 == -67050;
    if (v9 == -66996)
      v10 = 0;
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    if (v9)
      v12 = v9 == -66996;
    else
      v12 = 1;
  }
  else
  {
    v9 = v6;
    v11 = 0;
    v12 = 0;
  }
  *(_BYTE *)a3 = v11;
  *(_BYTE *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void SecCodeCheckValidityWithOnDiskRequirement(code:flags:requirement:)(__SecCode *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  OSStatus v6;
  __SecRequirement *v7;
  __SecRequirement *v8;
  OSStatus v9;
  BOOL v10;
  char v11;
  BOOL v12;

  sub_233AC31E8();
  if (v7)
  {
    v8 = v7;
    v9 = SecCodeCheckValidity(a1, a2 & 0xFF7FFFFF, v7);

    v10 = v9 == -67050;
    if (v9 == -66996)
      v10 = 0;
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    if (v9)
      v12 = v9 == -66996;
    else
      v12 = 1;
  }
  else
  {
    v9 = v6;
    v11 = 0;
    v12 = 0;
  }
  *(_BYTE *)a3 = v11;
  *(_BYTE *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

void SecCodeCheckValidityWithProcessRequirement(code:flags:requirement:)(__SecCode *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  OSStatus v6;
  __SecRequirement *v7;
  __SecRequirement *v8;
  OSStatus v9;
  BOOL v10;
  char v11;
  BOOL v12;

  sub_233AC31E8();
  if (v7)
  {
    v8 = v7;
    v9 = SecCodeCheckValidity(a1, a2 | 0x800000, v7);

    v10 = v9 == -67050;
    if (v9 == -66996)
      v10 = 0;
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    if (v9)
      v12 = v9 == -66996;
    else
      v12 = 1;
  }
  else
  {
    v9 = v6;
    v11 = 0;
    v12 = 0;
  }
  *(_BYTE *)a3 = v11;
  *(_BYTE *)(a3 + 1) = v12;
  *(_DWORD *)(a3 + 4) = v9;
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValidationResult(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[8])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationResult()
{
  return &type metadata for ValidationResult;
}

uint64_t sub_233AC3530()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_233AC353C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_233AC3548()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_233AC3554()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_233AC3560()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_233AC356C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_233AC3578()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_233AC3584()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_233AC3590()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_233AC359C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_233AC35A8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_233AC35B4()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_233AC35C0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_233AC35CC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_233AC35D8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_233AC35E4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_233AC35F0()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_233AC35FC()
{
  return MEMORY[0x24BEE1040]();
}

uint64_t sub_233AC3608()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_233AC3614()
{
  return MEMORY[0x24BEE10C0]();
}

uint64_t sub_233AC3620()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_233AC362C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_233AC3638()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_233AC3644()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_233AC3650()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_233AC365C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_233AC3668()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_233AC3674()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_233AC3680()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_233AC368C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_233AC3698()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_233AC36A4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_233AC36B0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_233AC36BC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_233AC36C8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_233AC36D4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_233AC36E0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_233AC36EC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_233AC36F8()
{
  return MEMORY[0x24BEE32B0]();
}

uint64_t sub_233AC3704()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_233AC3710()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_233AC371C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_233AC3728()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_233AC3734()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_233AC3740()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_233AC374C()
{
  return MEMORY[0x24BEE3400]();
}

uint64_t sub_233AC3758()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_233AC3764()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_233AC3770()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_233AC377C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_233AC3788()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_233AC3794()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_233AC37A0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_233AC37AC()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_233AC37B8()
{
  return MEMORY[0x24BEE35D0]();
}

uint64_t sub_233AC37C4()
{
  return MEMORY[0x24BEE3618]();
}

uint64_t sub_233AC37D0()
{
  return MEMORY[0x24BEE3620]();
}

uint64_t sub_233AC37DC()
{
  return MEMORY[0x24BEE3638]();
}

uint64_t sub_233AC37E8()
{
  return MEMORY[0x24BEE3640]();
}

uint64_t sub_233AC37F4()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_233AC3800()
{
  return MEMORY[0x24BEE3720]();
}

uint64_t sub_233AC380C()
{
  return MEMORY[0x24BEE3758]();
}

uint64_t sub_233AC3818()
{
  return MEMORY[0x24BEE3760]();
}

uint64_t sub_233AC3824()
{
  return MEMORY[0x24BEE3788]();
}

uint64_t sub_233AC3830()
{
  return MEMORY[0x24BEE37A8]();
}

uint64_t sub_233AC383C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_233AC3848()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_233AC3854()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_233AC3860()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_233AC386C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_233AC3878()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_233AC3884()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_233AC3890()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_233AC389C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_233AC38A8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_233AC38B4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_233AC38C0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_233AC38CC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_233AC38D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_233AC38E4()
{
  return MEMORY[0x24BEE4A10]();
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

OSStatus SecCodeCheckValidity(SecCodeRef code, SecCSFlags flags, SecRequirementRef requirement)
{
  return MEMORY[0x24BDE89D8](code, *(_QWORD *)&flags, requirement);
}

uint64_t SecRequirementCreateWithLightweightCodeRequirementData()
{
  return MEMORY[0x24BDE8CD8]();
}

OSStatus SecStaticCodeCheckValidity(SecStaticCodeRef staticCode, SecCSFlags flags, SecRequirementRef requirement)
{
  return MEMORY[0x24BDE8D20](staticCode, *(_QWORD *)&flags, requirement);
}

uint64_t SecTaskValidateForLightweightCodeRequirementData()
{
  return MEMORY[0x24BDE8D88]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

