uint64_t Group.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A2513FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Group.gid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for Group() + 20));
}

uint64_t type metadata accessor for Group()
{
  uint64_t result;

  result = qword_2569563A0;
  if (!qword_2569563A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Group.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Group() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.members.getter()
{
  type metadata accessor for Group();
  return swift_bridgeObjectRetain();
}

uint64_t Group.hash(into:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v3 = type metadata accessor for Group();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v1 + *(int *)(v3 + 28));
  swift_bridgeObjectRetain();
  sub_23A241E74(a1, v4);
  return swift_bridgeObjectRelease();
}

uint64_t Group.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3[4];

  sub_23A25157C();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v1 = type metadata accessor for Group();
  sub_23A2515A0();
  sub_23A25142C();
  sub_23A241E74(v3, *(_QWORD *)(v0 + *(int *)(v1 + 28)));
  return sub_23A2515AC();
}

uint64_t sub_23A240844(uint64_t a1)
{
  uint64_t v1;
  __int128 v4[4];

  sub_23A25157C();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  sub_23A2515A0();
  sub_23A25142C();
  sub_23A241E74(v4, *(_QWORD *)(v1 + *(int *)(a1 + 28)));
  return sub_23A2515AC();
}

uint64_t sub_23A2408F4(__int128 *a1, uint64_t a2)
{
  uint64_t v2;

  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  sub_23A2515A0();
  sub_23A25142C();
  return sub_23A241E74(a1, *(_QWORD *)(v2 + *(int *)(a2 + 28)));
}

uint64_t sub_23A240990(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v5[4];

  sub_23A25157C();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  sub_23A2515A0();
  sub_23A25142C();
  sub_23A241E74(v5, *(_QWORD *)(v2 + *(int *)(a2 + 28)));
  return sub_23A2515AC();
}

uint64_t sub_23A240A40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + *(int *)(type metadata accessor for LibSystemGroupRecord(0) + 28));
  v4 = (uint64_t *)(a1 + *(int *)(type metadata accessor for User() + 24));
  v5 = *v4;
  v6 = v4[1];
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_23A240ABC(v5, v6, v3);
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_23A240ABC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_23A25157C();
    sub_23A25142C();
    v6 = sub_23A2515AC();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23A251564() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23A251564() & 1) != 0)
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

uint64_t sub_23A240BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  _QWORD *v26;
  _BYTE v27[4];
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];

  v31 = a2;
  v5 = sub_23A2513FC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for LibSystemGroupRecord(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = &v27[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v18 = &v27[-v17];
  sub_23A2428D8(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1(v31);
    sub_23A242940(a1);
    sub_23A242940((uint64_t)v11);
    v19 = type metadata accessor for Group();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a3, 1, 1, v19);
  }
  else
  {
    sub_23A242A84((uint64_t)v11, (uint64_t)v18, type metadata accessor for LibSystemGroupRecord);
    sub_23A242A40((uint64_t)v18, (uint64_t)v16, type metadata accessor for LibSystemGroupRecord);
    sub_23A242980(v31, (uint64_t)v32);
    __swift_project_boxed_opaque_existential_1(v32, v32[3]);
    v21 = sub_23A24F874();
    v22 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(v8, &v16[*(int *)(v12 + 24)], v5);
    v30 = a1;
    v28 = *(_DWORD *)v16;
    v23 = *((_QWORD *)v16 + 2);
    v29 = *((_QWORD *)v16 + 1);
    MEMORY[0x24BDAC7A8](v22);
    *(_QWORD *)&v27[-16] = v16;
    swift_bridgeObjectRetain();
    v24 = sub_23A24107C((uint64_t)sub_23A2429E8, (uint64_t)&v27[-32], v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 32))(a3, v8, v5);
    v25 = (int *)type metadata accessor for Group();
    *(_DWORD *)(a3 + v25[5]) = v28;
    v26 = (_QWORD *)(a3 + v25[6]);
    *v26 = v29;
    v26[1] = v23;
    *(_QWORD *)(a3 + v25[7]) = v24;
    sub_23A242A04((uint64_t)v16, type metadata accessor for LibSystemGroupRecord);
    __swift_destroy_boxed_opaque_existential_1(v31);
    sub_23A242940(v30);
    sub_23A242A04((uint64_t)v18, type metadata accessor for LibSystemGroupRecord);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v25 - 1) + 56))(a3, 0, 1, v25);
  }
}

uint64_t sub_23A240EBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23A240ED8(a1, a2, (uint64_t)sub_23A242AC8, a3);
}

uint64_t sub_23A240ED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t (*v15)(_QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  _QWORD *v20;
  _BYTE v22[4];
  int v23;
  uint64_t v24;
  _BYTE v25[16];
  _BYTE *v26;
  _QWORD v27[5];

  v8 = sub_23A2513FC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for LibSystemGroupRecord(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A242A40(a1, (uint64_t)v14, v15);
  sub_23A242980(a2, (uint64_t)v27);
  __swift_project_boxed_opaque_existential_1(v27, v27[3]);
  v16 = sub_23A24F874();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 16))(v11, &v14[*(int *)(v12 + 24)], v8);
  v23 = *(_DWORD *)v14;
  v17 = *((_QWORD *)v14 + 2);
  v24 = *((_QWORD *)v14 + 1);
  v26 = v14;
  swift_bridgeObjectRetain();
  v18 = sub_23A24107C(a3, (uint64_t)v25, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 32))(a4, v11, v8);
  v19 = (int *)type metadata accessor for Group();
  *(_DWORD *)(a4 + v19[5]) = v23;
  v20 = (_QWORD *)(a4 + v19[6]);
  *v20 = v24;
  v20[1] = v17;
  *(_QWORD *)(a4 + v19[7]) = v18;
  return sub_23A242A04((uint64_t)v14, type metadata accessor for LibSystemGroupRecord);
}

uint64_t sub_23A24107C(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v5)(char *);
  char v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v5 = (uint64_t (*)(char *))isStackAllocationSafe;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = *(_BYTE *)(a3 + 32);
  v7 = (unint64_t)((1 << v6) + 63) >> 6;
  v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = sub_23A2411F8((_QWORD *)((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a3, v5);
    swift_release();
    if (v3)
      swift_willThrow();
  }
  else
  {
    v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    v9 = sub_23A2411F8((unint64_t *)v10, v7, a3, v5);
    swift_release();
    MEMORY[0x23B8460A0](v10, -1, -1);
  }
  return v9;
}

uint64_t sub_23A2411F8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t (*v30)(char *);
  uint64_t v31;

  v30 = a4;
  v25 = a2;
  v26 = a1;
  v6 = type metadata accessor for User();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v31 = a3;
  v12 = *(_QWORD *)(a3 + 56);
  v27 = 0;
  v28 = a3 + 56;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v29 = (unint64_t)(v13 + 63) >> 6;
  while (v15)
  {
    v16 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v17 = v16 | (v11 << 6);
LABEL_17:
    sub_23A242A40(*(_QWORD *)(v31 + 48) + *(_QWORD *)(v7 + 72) * v17, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v21 = v30(v10);
    result = sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for User);
    if (v4)
      return result;
    if ((v21 & 1) != 0)
    {
      *(unint64_t *)((char *)v26 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = __OFADD__(v27++, 1);
      if (v18)
        goto LABEL_30;
    }
  }
  v18 = __OFADD__(v11++, 1);
  if (v18)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v29)
    goto LABEL_27;
  v19 = *(_QWORD *)(v28 + 8 * v11);
  if (v19)
  {
LABEL_16:
    v15 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v11 << 6);
    goto LABEL_17;
  }
  v20 = v11 + 1;
  if (v11 + 1 >= v29)
    goto LABEL_27;
  v19 = *(_QWORD *)(v28 + 8 * v20);
  if (v19)
    goto LABEL_15;
  v20 = v11 + 2;
  if (v11 + 2 >= v29)
    goto LABEL_27;
  v19 = *(_QWORD *)(v28 + 8 * v20);
  if (v19)
    goto LABEL_15;
  v20 = v11 + 3;
  if (v11 + 3 >= v29)
  {
LABEL_27:
    v22 = v25;
    v23 = v27;
    v24 = v31;
    swift_retain();
    return sub_23A24144C(v26, v22, v23, v24);
  }
  v19 = *(_QWORD *)(v28 + 8 * v20);
  if (v19)
  {
LABEL_15:
    v11 = v20;
    goto LABEL_16;
  }
  while (1)
  {
    v11 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v11 >= v29)
      goto LABEL_27;
    v19 = *(_QWORD *)(v28 + 8 * v11);
    ++v20;
    if (v19)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A24144C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a1;
  v7 = type metadata accessor for User();
  v29 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E8);
  result = sub_23A2514E0();
  v10 = result;
  v26 = a2;
  if (a2 < 1)
    v12 = 0;
  else
    v12 = *v27;
  v13 = 0;
  v28 = result + 56;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v13 << 6);
    }
    else
    {
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_30;
      if (v16 >= v26)
      {
LABEL_27:
        swift_release();
        return v10;
      }
      v17 = v27[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v26)
          goto LABEL_27;
        v17 = v27[v13];
        if (!v17)
        {
          v13 = v16 + 2;
          if (v16 + 2 >= v26)
            goto LABEL_27;
          v17 = v27[v13];
          if (!v17)
          {
            v18 = v16 + 3;
            if (v18 >= v26)
              goto LABEL_27;
            v17 = v27[v18];
            if (!v17)
            {
              while (1)
              {
                v13 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_31;
                if (v13 >= v26)
                  goto LABEL_27;
                v17 = v27[v13];
                ++v18;
                if (v17)
                  goto LABEL_24;
              }
            }
            v13 = v18;
          }
        }
      }
LABEL_24:
      v12 = (v17 - 1) & v17;
      v15 = __clz(__rbit64(v17)) + (v13 << 6);
    }
    v19 = a4;
    v20 = *(_QWORD *)(a4 + 48);
    v21 = *(_QWORD *)(v29 + 72);
    sub_23A242A40(v20 + v21 * v15, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A25157C();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2515AC();
    v22 = v28;
    v23 = sub_23A251480();
    *(_QWORD *)(v22 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    result = sub_23A242A84((uint64_t)v9, *(_QWORD *)(v10 + 48) + v23 * v21, (uint64_t (*)(_QWORD))type metadata accessor for User);
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v19;
    if (!a3)
      goto LABEL_27;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23A2417D8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31[72];

  v8 = type metadata accessor for LibSystemGroupRecord(0);
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F0);
  result = sub_23A2514E0();
  v11 = result;
  v26 = a1;
  v27 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *a1;
  v14 = 0;
  v28 = result + 56;
  v15 = v30;
  while (1)
  {
    if (v13)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v17 = v16 | (v14 << 6);
    }
    else
    {
      v18 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_30;
      if (v18 >= v27)
      {
LABEL_27:
        swift_release();
        return v11;
      }
      v19 = v26[v18];
      ++v14;
      if (!v19)
      {
        v14 = v18 + 1;
        if (v18 + 1 >= v27)
          goto LABEL_27;
        v19 = v26[v14];
        if (!v19)
        {
          v14 = v18 + 2;
          if (v18 + 2 >= v27)
            goto LABEL_27;
          v19 = v26[v14];
          if (!v19)
          {
            v20 = v18 + 3;
            if (v20 >= v27)
              goto LABEL_27;
            v19 = v26[v20];
            if (!v19)
            {
              while (1)
              {
                v14 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_31;
                if (v14 >= v27)
                  goto LABEL_27;
                v19 = v26[v14];
                ++v20;
                if (v19)
                  goto LABEL_24;
              }
            }
            v14 = v20;
          }
        }
      }
LABEL_24:
      v13 = (v19 - 1) & v19;
      v17 = __clz(__rbit64(v19)) + (v14 << 6);
    }
    v21 = *(_QWORD *)(v29 + 72);
    sub_23A242A40(*(_QWORD *)(a4 + 48) + v21 * v17, (uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
    sub_23A25157C();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    v22 = *(_QWORD *)&v10[*(int *)(v15 + 28)];
    swift_bridgeObjectRetain();
    sub_23A242138((uint64_t)v31, v22);
    swift_bridgeObjectRelease();
    sub_23A251594();
    sub_23A2515AC();
    v23 = v28;
    v24 = sub_23A251480();
    *(_QWORD *)(v23 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    result = sub_23A242A84((uint64_t)v10, *(_QWORD *)(v11 + 48) + v24 * v21, type metadata accessor for LibSystemGroupRecord);
    ++*(_QWORD *)(v11 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    if (!a3)
      goto LABEL_27;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23A241AE4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a1;
  v7 = type metadata accessor for LibSystemUserRecord(0);
  v29 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F8);
  result = sub_23A2514E0();
  v10 = result;
  v26 = a2;
  if (a2 < 1)
    v12 = 0;
  else
    v12 = *v27;
  v13 = 0;
  v28 = result + 56;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v13 << 6);
    }
    else
    {
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_30;
      if (v16 >= v26)
      {
LABEL_27:
        swift_release();
        return v10;
      }
      v17 = v27[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v26)
          goto LABEL_27;
        v17 = v27[v13];
        if (!v17)
        {
          v13 = v16 + 2;
          if (v16 + 2 >= v26)
            goto LABEL_27;
          v17 = v27[v13];
          if (!v17)
          {
            v18 = v16 + 3;
            if (v18 >= v26)
              goto LABEL_27;
            v17 = v27[v18];
            if (!v17)
            {
              while (1)
              {
                v13 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_31;
                if (v13 >= v26)
                  goto LABEL_27;
                v17 = v27[v13];
                ++v18;
                if (v17)
                  goto LABEL_24;
              }
            }
            v13 = v18;
          }
        }
      }
LABEL_24:
      v12 = (v17 - 1) & v17;
      v15 = __clz(__rbit64(v17)) + (v13 << 6);
    }
    v19 = a4;
    v20 = *(_QWORD *)(a4 + 48);
    v21 = *(_QWORD *)(v29 + 72);
    sub_23A242A40(v20 + v21 * v15, (uint64_t)v9, type metadata accessor for LibSystemUserRecord);
    sub_23A25157C();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A251594();
    sub_23A2515AC();
    v22 = v28;
    v23 = sub_23A251480();
    *(_QWORD *)(v22 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    result = sub_23A242A84((uint64_t)v9, *(_QWORD *)(v10 + 48) + v23 * v21, type metadata accessor for LibSystemUserRecord);
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v19;
    if (!a3)
      goto LABEL_27;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23A241E74(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t result;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v25;
  int64_t v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v30 = *(_QWORD *)(type metadata accessor for User() - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *((_QWORD *)a1 + 8);
  v10 = a1[1];
  v32 = *a1;
  v33 = v10;
  v11 = a1[2];
  v12 = a1[3];
  v27 = a1;
  v34 = v11;
  v35 = v12;
  v36 = v9;
  v29 = sub_23A2515AC();
  v13 = *(_QWORD *)(a2 + 56);
  v28 = a2 + 56;
  v14 = 1 << *(_BYTE *)(a2 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v17 = (unint64_t)(v14 + 63) >> 6;
  v31 = a2;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  v20 = 0;
  while (1)
  {
    if (v16)
    {
      v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v20++, 1))
      goto LABEL_19;
    if (v20 >= v17)
    {
LABEL_17:
      swift_release();
      return sub_23A251588();
    }
    v25 = *(_QWORD *)(v28 + 8 * v20);
    if (!v25)
      break;
LABEL_16:
    v16 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_5:
    sub_23A242A40(*(_QWORD *)(v31 + 48) + *(_QWORD *)(v30 + 72) * v22, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A242A84((uint64_t)v8, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A25157C();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    sub_23A2515A0();
    sub_23A25142C();
    sub_23A25142C();
    sub_23A25142C();
    sub_23A2515A0();
    sub_23A25142C();
    v23 = sub_23A2515AC();
    result = sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v19 ^= v23;
  }
  v26 = v20 + 1;
  if (v20 + 1 >= v17)
    goto LABEL_17;
  v25 = *(_QWORD *)(v28 + 8 * v26);
  if (v25)
  {
    ++v20;
    goto LABEL_16;
  }
  while (1)
  {
    v20 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v20 >= v17)
      goto LABEL_17;
    v25 = *(_QWORD *)(v28 + 8 * v20);
    ++v26;
    if (v25)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_23A242138(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v13;
  int64_t v14;

  sub_23A2515AC();
  v3 = a2 + 56;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1))
      goto LABEL_19;
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_23A251588();
    }
    v13 = *(_QWORD *)(v3 + 8 * v10);
    if (!v13)
      break;
LABEL_16:
    v6 = (v13 - 1) & v13;
LABEL_5:
    sub_23A25157C();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    v11 = sub_23A2515AC();
    result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  v14 = v10 + 1;
  if (v10 + 1 >= v7)
    goto LABEL_17;
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_16;
  }
  while (1)
  {
    v10 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v10 >= v7)
      goto LABEL_17;
    v13 = *(_QWORD *)(v3 + 8 * v10);
    ++v14;
    if (v13)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t _s20DarwinDirectoryQuery5GroupV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;

  if ((sub_23A2513CC() & 1) != 0
    && (v4 = type metadata accessor for Group(),
        *(_DWORD *)(a1 + *(int *)(v4 + 20)) == *(_DWORD *)(a2 + *(int *)(v4 + 20)))
    && ((v5 = v4,
         v6 = *(int *)(v4 + 24),
         v7 = *(_QWORD *)(a1 + v6),
         v8 = *(_QWORD *)(a1 + v6 + 8),
         v9 = (_QWORD *)(a2 + v6),
         v7 == *v9)
      ? (v10 = v8 == v9[1])
      : (v10 = 0),
        v10 || (sub_23A251564() & 1) != 0))
  {
    return sub_23A243024(*(_QWORD *)(a1 + *(int *)(v5 + 28)), *(_QWORD *)(a2 + *(int *)(v5 + 28)));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23A242368()
{
  return sub_23A242394(&qword_256956340, (uint64_t (*)(uint64_t))type metadata accessor for Group, (uint64_t)&protocol conformance descriptor for Group);
}

uint64_t sub_23A242394(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B846028](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Group(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A2513FC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Group(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A242704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A2513FC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Group()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A242790(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A2513FC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A24280C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2513FC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B84601C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A2428D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_23A242940(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A242980(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23A2429E8(uint64_t a1)
{
  uint64_t v1;

  return sub_23A240A40(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_23A242A04(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A242A40(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A242A84(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A242AC8(uint64_t a1)
{
  return sub_23A2429E8(a1) & 1;
}

uint64_t sub_23A242AE0(uint64_t a1)
{
  uint64_t result;

  result = sub_23A242394(&qword_256956400, type metadata accessor for LibSystemGroupRecord, (uint64_t)&unk_23A251D98);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A242B1C(uint64_t a1)
{
  uint64_t result;

  result = sub_23A242394(&qword_256956408, type metadata accessor for LibSystemUserRecord, (uint64_t)&unk_23A251D30);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A242B58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t *v13;
  uint64_t v14;

  *(_DWORD *)a2 = *(_DWORD *)(a1 + 4);
  *(_QWORD *)(a2 + 8) = sub_23A251438();
  *(_QWORD *)(a2 + 16) = v4;
  v5 = (int *)type metadata accessor for LibSystemUserRecord(0);
  sub_23A2513E4();
  v6 = sub_23A251438();
  v7 = (uint64_t *)(a2 + v5[7]);
  *v7 = v6;
  v7[1] = v8;
  v9 = sub_23A251438();
  v10 = (uint64_t *)(a2 + v5[8]);
  *v10 = v9;
  v10[1] = v11;
  *(_DWORD *)(a2 + v5[9]) = *(_QWORD *)(a1 + 40);
  result = sub_23A251438();
  v13 = (uint64_t *)(a2 + v5[10]);
  *v13 = result;
  v13[1] = v14;
  *(_BYTE *)(a2 + v5[11]) = *(_BYTE *)(a1 + 32);
  return result;
}

uint64_t sub_23A242C68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  *(_DWORD *)a2 = *(_DWORD *)(a1 + 4);
  *(_QWORD *)(a2 + 8) = sub_23A251438();
  *(_QWORD *)(a2 + 16) = v4;
  v5 = type metadata accessor for LibSystemGroupRecord(0);
  sub_23A2513E4();
  v6 = 0;
  *(_BYTE *)(a2 + *(int *)(v5 + 32)) = *(_BYTE *)(a1 + 32);
  v12 = MEMORY[0x24BEE4B08];
  while (1)
  {
    result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v6);
    if (!result)
      break;
    v8 = sub_23A251438();
    sub_23A24B09C(&v11, v8, v9);
    result = swift_bridgeObjectRelease();
    if (__OFADD__(v6++, 1))
    {
      __break(1u);
      break;
    }
  }
  *(_QWORD *)(a2 + *(int *)(v5 + 28)) = v12;
  return result;
}

ValueMetadata *type metadata accessor for LibSystemDarwinDirectoryProvider()
{
  return &type metadata for LibSystemDarwinDirectoryProvider;
}

uint64_t sub_23A242DA0(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
          break;
      }
    }
LABEL_23:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_23A25157C();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    v18 = sub_23A2515AC();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_39;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_23A251564() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_23A251564() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 4;
  if (v3 + 4 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_23;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_23A243024(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  BOOL v34;
  char *v35;
  BOOL v36;
  char *v37;
  BOOL v38;
  char *v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;

  v4 = (int *)type metadata accessor for User();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v40 - v9;
  result = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)&v40 - v13;
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
  v43 = v12;
  v44 = a1;
  v41 = a1 + 56;
  v42 = v14;
  v40 = v20;
  if (!v19)
    goto LABEL_8;
LABEL_7:
  v45 = (v19 - 1) & v19;
  v46 = v15;
  for (i = __clz(__rbit64(v19)) | (v15 << 6); ; i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    v27 = *(_QWORD *)(v12 + 72);
    sub_23A242A40(*(_QWORD *)(a1 + 48) + v27 * i, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A242A84((uint64_t)v14, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A25157C();
    sub_23A2513FC();
    sub_23A24659C(&qword_256956338, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    v51 = v4[5];
    sub_23A2515A0();
    v28 = &v10[v4[6]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v50 = &v10[v4[7]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v49 = &v10[v4[8]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v48 = v4[9];
    sub_23A2515A0();
    v47 = &v10[v4[10]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v29 = sub_23A2515AC();
    v30 = -1 << *(_BYTE *)(a2 + 32);
    v31 = v29 & ~v30;
    if (((*(_QWORD *)(v21 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
    {
LABEL_51:
      sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for User);
      return 0;
    }
    v32 = ~v30;
    while (1)
    {
      sub_23A242A40(*(_QWORD *)(a2 + 48) + v31 * v27, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for User);
      if ((sub_23A2513CC() & 1) != 0 && *(_DWORD *)&v7[v4[5]] == *(_DWORD *)&v10[v51])
      {
        v33 = &v7[v4[6]];
        v34 = *(_QWORD *)v33 == *(_QWORD *)v28 && *((_QWORD *)v33 + 1) == *((_QWORD *)v28 + 1);
        if (v34 || (sub_23A251564() & 1) != 0)
        {
          v35 = &v7[v4[7]];
          v36 = *(_QWORD *)v35 == *(_QWORD *)v50 && *((_QWORD *)v35 + 1) == *((_QWORD *)v50 + 1);
          if (v36 || (sub_23A251564() & 1) != 0)
          {
            v37 = &v7[v4[8]];
            v38 = *(_QWORD *)v37 == *(_QWORD *)v49 && *((_QWORD *)v37 + 1) == *((_QWORD *)v49 + 1);
            if ((v38 || (sub_23A251564() & 1) != 0) && *(_DWORD *)&v7[v4[9]] == *(_DWORD *)&v10[v48])
            {
              v39 = &v7[v4[10]];
              if (*(_QWORD *)v39 == *(_QWORD *)v47 && *((_QWORD *)v39 + 1) == *((_QWORD *)v47 + 1))
                break;
              if ((sub_23A251564() & 1) != 0)
                break;
            }
          }
        }
      }
      sub_23A242A04((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v31 = (v31 + 1) & v32;
      if (((*(_QWORD *)(v21 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
        goto LABEL_51;
    }
    sub_23A242A04((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for User);
    result = sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v12 = v43;
    a1 = v44;
    v16 = v41;
    v14 = v42;
    v20 = v40;
    v19 = v45;
    v15 = v46;
    if (v45)
      goto LABEL_7;
LABEL_8:
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_54;
    }
    if (v23 >= v20)
      return 1;
    v24 = *(_QWORD *)(v16 + 8 * v23);
    v25 = v15 + 1;
    if (!v24)
    {
      v25 = v15 + 2;
      if (v15 + 2 >= v20)
        return 1;
      v24 = *(_QWORD *)(v16 + 8 * v25);
      if (!v24)
      {
        v25 = v15 + 3;
        if (v15 + 3 >= v20)
          return 1;
        v24 = *(_QWORD *)(v16 + 8 * v25);
        if (!v24)
        {
          v25 = v15 + 4;
          if (v15 + 4 >= v20)
            return 1;
          v24 = *(_QWORD *)(v16 + 8 * v25);
          if (!v24)
            break;
        }
      }
    }
LABEL_23:
    v45 = (v24 - 1) & v24;
    v46 = v25;
  }
  v26 = v15 + 5;
  if (v15 + 5 >= v20)
    return 1;
  v24 = *(_QWORD *)(v16 + 8 * v26);
  if (v24)
  {
    v25 = v15 + 5;
    goto LABEL_23;
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
      goto LABEL_23;
  }
LABEL_54:
  __break(1u);
  return result;
}

id sub_23A24352C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *))
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_23A245418(a3);
  type metadata accessor for DDQUser(v3);
  sub_23A24659C(&qword_256956490, v4, type metadata accessor for DDQUser, MEMORY[0x24BEE5BD8]);
  v5 = (void *)sub_23A251444();
  swift_bridgeObjectRelease();
  return v5;
}

void DDQUser.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t DDQUser.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v13;
  void *v14;
  _BYTE v15[24];
  uint64_t v16;

  v3 = type metadata accessor for User();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - v7;
  v9 = sub_23A246648(a1, (uint64_t)v15, &qword_256956410);
  if (!v16)
  {
    sub_23A24668C((uint64_t)v15, &qword_256956410);
    goto LABEL_6;
  }
  type metadata accessor for DDQUser(v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    v11 = 0;
    return v11 & 1;
  }
  v10 = v14;
  if (v14 == v1)
  {

    v11 = 1;
  }
  else
  {
    sub_23A243D1C((uint64_t)v1 + OBJC_IVAR___DDQUser__user, (uint64_t)v15);
    swift_dynamicCast();
    sub_23A243D1C((uint64_t)v10 + OBJC_IVAR___DDQUser__user, (uint64_t)v15);
    swift_dynamicCast();
    v11 = _s20DarwinDirectoryQuery4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v8, (uint64_t)v6);

    sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A242A04((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for User);
  }
  return v11 & 1;
}

uint64_t type metadata accessor for DDQUser(uint64_t a1)
{
  return sub_23A245C64(a1, &qword_256956450);
}

uint64_t sub_23A243D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DDQUser.hash.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _BYTE v7[72];

  v1 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_23A243D1C(v0 + OBJC_IVAR___DDQUser__user, (uint64_t)v7);
  swift_dynamicCast();
  sub_23A25157C();
  sub_23A2513FC();
  sub_23A24659C(&qword_256956338, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  v4 = sub_23A2515AC();
  sub_23A242A04((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for User);
  return v4;
}

id sub_23A243F88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a3();
  type metadata accessor for DDQGroup(v3);
  sub_23A24659C(&qword_256956498, v4, type metadata accessor for DDQGroup, MEMORY[0x24BEE5BD8]);
  v5 = (void *)sub_23A251444();
  swift_bridgeObjectRelease();
  return v5;
}

id sub_23A244000(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  id v14;
  void *v15;
  _BYTE v17[32];

  v7 = a3(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v17[-v8];
  v10 = sub_23A2513FC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23A243D1C((uint64_t)a1 + *a4, (uint64_t)v17);
  v14 = a1;
  swift_dynamicCast();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 16))(v13, v9, v10);
  sub_23A242A04((uint64_t)v9, a3);

  v15 = (void *)sub_23A2513C0();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  return v15;
}

uint64_t sub_23A244140(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  uint64_t v11;
  _BYTE v13[32];

  v7 = a3(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v13[-v8];
  sub_23A243D1C((uint64_t)a1 + *a4, (uint64_t)v13);
  v10 = a1;
  swift_dynamicCast();
  v11 = *(unsigned int *)&v9[*(int *)(v7 + 20)];
  sub_23A242A04((uint64_t)v9, a3);

  return v11;
}

id sub_23A244218(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  void *v11;
  _BYTE v13[32];

  v7 = a3(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v13[-v8];
  sub_23A243D1C((uint64_t)a1 + *a4, (uint64_t)v13);
  v10 = a1;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A242A04((uint64_t)v9, a3);

  v11 = (void *)sub_23A251414();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_23A244370()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t result;
  int64_t v14;
  int v15;
  int v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  unint64_t v35[4];

  v1 = type metadata accessor for User();
  v32 = *(_QWORD *)(v1 - 8);
  v33 = v1;
  v2 = MEMORY[0x24BDAC7A8](v1);
  v31 = (uint64_t)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v30 = (uint64_t)&v28 - v7;
  v8 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A243D1C(v0 + OBJC_IVAR___DDQGroup__group, (uint64_t)v35);
  swift_dynamicCast();
  v11 = *(_QWORD *)&v10[*(int *)(v8 + 28)];
  swift_bridgeObjectRetain();
  sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v35[0] = MEMORY[0x24BEE4AF8];
    sub_23A251528();
    result = sub_23A245290(v11);
    v14 = result;
    v16 = v15;
    v18 = v17 & 1;
    v29 = v11 + 56;
    while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(_BYTE *)(v11 + 32))
    {
      if (((*(_QWORD *)(v29 + (((unint64_t)v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
        goto LABEL_12;
      if (*(_DWORD *)(v11 + 36) != v16)
        goto LABEL_13;
      v19 = v30;
      sub_23A242A40(*(_QWORD *)(v11 + 48) + *(_QWORD *)(v32 + 72) * v14, v30, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A242A84(v19, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v20 = v31;
      sub_23A242A40((uint64_t)v6, v31, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v21 = (char *)objc_allocWithZone((Class)DDQUser);
      v22 = (uint64_t *)&v21[OBJC_IVAR___DDQUser__user];
      v22[3] = v33;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
      sub_23A242A40(v20, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v34.receiver = v21;
      v34.super_class = (Class)DDQUser;
      objc_msgSendSuper2(&v34, sel_init);
      sub_23A242A04(v20, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A251510();
      sub_23A251534();
      sub_23A251540();
      sub_23A25151C();
      result = sub_23A245334(v14, v16, v18 & 1, v11);
      v14 = result;
      v16 = v24;
      v18 = v25 & 1;
      if (!--v12)
      {
        sub_23A2465DC(result, v24, v25 & 1);
        v26 = v35[0];
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v26 = MEMORY[0x24BEE4AF8];
LABEL_10:
    v27 = sub_23A250CE0(v26);
    swift_bridgeObjectRelease();
    return v27;
  }
  return result;
}

void sub_23A244694()
{
  uint64_t v0;

  v0 = sub_23A2513FC();
  MEMORY[0x24BDAC7A8](v0);
  sub_23A2513D8();
  sub_23A25154C();
  __break(1u);
}

id _sSo7DDQUserC20DarwinDirectoryQueryEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void DDQGroup.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t DDQGroup.isEqual(_:)(uint64_t a1)
{
  void *v1;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char v16;
  uint64_t v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;

  v3 = (int *)type metadata accessor for Group();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - v7;
  v9 = sub_23A246648(a1, (uint64_t)v20, &qword_256956410);
  if (!v21)
  {
    sub_23A24668C((uint64_t)v20, &qword_256956410);
    goto LABEL_13;
  }
  type metadata accessor for DDQGroup(v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    v16 = 0;
    return v16 & 1;
  }
  v10 = v19;
  if (v19 == v1)
  {

    v16 = 1;
  }
  else
  {
    sub_23A243D1C((uint64_t)v1 + OBJC_IVAR___DDQGroup__group, (uint64_t)v20);
    swift_dynamicCast();
    sub_23A243D1C((uint64_t)v10 + OBJC_IVAR___DDQGroup__group, (uint64_t)v20);
    swift_dynamicCast();
    if ((sub_23A2513CC() & 1) != 0 && *(_DWORD *)&v8[v3[5]] == *(_DWORD *)&v6[v3[5]])
    {
      v11 = v3[6];
      v12 = *(_QWORD *)&v8[v11];
      v13 = *(_QWORD *)&v8[v11 + 8];
      v14 = &v6[v11];
      v15 = v12 == *(_QWORD *)v14 && v13 == *((_QWORD *)v14 + 1);
      if (v15 || (v16 = 0, (sub_23A251564() & 1) != 0))
        v16 = sub_23A243024(*(_QWORD *)&v8[v3[7]], *(_QWORD *)&v6[v3[7]]);
    }
    else
    {
      v16 = 0;
    }

    sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    sub_23A242A04((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  }
  return v16 & 1;
}

uint64_t sub_23A245098(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_23A251474();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_23A24668C((uint64_t)v10, &qword_256956410);
  return v8 & 1;
}

uint64_t DDQGroup.hash.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;
  __int128 v7[4];

  v1 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A243D1C(v0 + OBJC_IVAR___DDQGroup__group, (uint64_t)v7);
  swift_dynamicCast();
  sub_23A25157C();
  sub_23A2513FC();
  sub_23A24659C(&qword_256956338, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  sub_23A2515A0();
  sub_23A25142C();
  sub_23A241E74(v7, *(_QWORD *)&v3[*(int *)(v1 + 28)]);
  v4 = sub_23A2515AC();
  sub_23A242A04((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  return v4;
}

uint64_t sub_23A245290(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_23A245334(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_23A245418(uint64_t (*a1)(void *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int v12;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t *boxed_opaque_existential_0;
  int64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  unint64_t v32;

  v2 = type metadata accessor for User();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v28 = (uint64_t)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v27 = (uint64_t)&v26 - v8;
  if (qword_256956330 != -1)
    goto LABEL_15;
  while (1)
  {
    v9 = a1(&unk_256956760);
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
      break;
    v32 = MEMORY[0x24BEE4AF8];
    sub_23A251528();
    v11 = sub_23A245290(v9);
    v13 = v12;
    a1 = (uint64_t (*)(void *))(v14 & 1);
    v26 = v9 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(_BYTE *)(v9 + 32))
    {
      if (((*(_QWORD *)(v26 + (((unint64_t)v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_13;
      if (*(_DWORD *)(v9 + 36) != v13)
        goto LABEL_14;
      v15 = v27;
      sub_23A242A40(*(_QWORD *)(v9 + 48) + *(_QWORD *)(v29 + 72) * v11, v27, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A242A84(v15, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v16 = v28;
      sub_23A242A40((uint64_t)v7, v28, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v17 = (char *)objc_allocWithZone((Class)DDQUser);
      v18 = (uint64_t *)&v17[OBJC_IVAR___DDQUser__user];
      v18[3] = v30;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v18);
      sub_23A242A40(v16, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v31.receiver = v17;
      v31.super_class = (Class)DDQUser;
      objc_msgSendSuper2(&v31, sel_init);
      sub_23A242A04(v16, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A242A04((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A251510();
      sub_23A251534();
      sub_23A251540();
      sub_23A25151C();
      v20 = sub_23A245334(v11, v13, a1 & 1, v9);
      v11 = v20;
      v13 = v21;
      a1 = (uint64_t (*)(void *))(v22 & 1);
      if (!--v10)
      {
        sub_23A2465DC(v20, v21, v22 & 1);
        v23 = v32;
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
  }
  swift_bridgeObjectRelease();
  v23 = MEMORY[0x24BEE4AF8];
LABEL_11:
  v24 = sub_23A250CE0(v23);
  swift_bridgeObjectRelease();
  return v24;
}

id sub_23A2456E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v15[5];

  v2 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2569564A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256956330 != -1)
    swift_once();
  v15[3] = &type metadata for ProviderSideEffects;
  v15[4] = &off_250B32A58;
  v15[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v15[0] + 16);
  v11 = __swift_project_boxed_opaque_existential_1(v15, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v12 = sub_23A2513FC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v4, a1, v12);
  swift_storeEnumTagMultiPayload();
  sub_23A249794((uint64_t)v4, (uint64_t)v7);
  sub_23A242A04((uint64_t)v4, type metadata accessor for DarwinDirectoryFilter);
  sub_23A248464((uint64_t)v7, (uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return sub_23A2463A8((uint64_t)v10, qword_2569564A8, (uint64_t (*)(_QWORD))type metadata accessor for User, (Class *)&off_250B325B0, &OBJC_IVAR___DDQUser__user);
}

id sub_23A2458BC(int a1)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD v14[5];

  v2 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (_DWORD *)((char *)&v14[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2569564A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256956330 != -1)
    swift_once();
  v14[3] = &type metadata for ProviderSideEffects;
  v14[4] = &off_250B32A58;
  v14[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v14[0] + 16);
  v11 = __swift_project_boxed_opaque_existential_1(v14, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  *v4 = a1;
  swift_storeEnumTagMultiPayload();
  sub_23A249794((uint64_t)v4, (uint64_t)v7);
  sub_23A242A04((uint64_t)v4, type metadata accessor for DarwinDirectoryFilter);
  sub_23A248464((uint64_t)v7, (uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return sub_23A2463A8((uint64_t)v10, qword_2569564A8, (uint64_t (*)(_QWORD))type metadata accessor for User, (Class *)&off_250B325B0, &OBJC_IVAR___DDQUser__user);
}

id sub_23A245A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  _QWORD v16[5];

  v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_QWORD *)((char *)&v16[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2569564A8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256956330 != -1)
    swift_once();
  v16[3] = &type metadata for ProviderSideEffects;
  v16[4] = &off_250B32A58;
  v16[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v16[0] + 16);
  v13 = __swift_project_boxed_opaque_existential_1(v16, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  *v6 = a1;
  v6[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_23A249794((uint64_t)v6, (uint64_t)v9);
  sub_23A242A04((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_23A248464((uint64_t)v9, (uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return sub_23A2463A8((uint64_t)v12, qword_2569564A8, (uint64_t (*)(_QWORD))type metadata accessor for User, (Class *)&off_250B325B0, &OBJC_IVAR___DDQUser__user);
}

uint64_t type metadata accessor for DDQGroup(uint64_t a1)
{
  return sub_23A245C64(a1, &qword_256956480);
}

uint64_t sub_23A245C64(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A245C9C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_23A245CC0(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ProviderSideEffects(a2, a1);
  return a2;
}

uint64_t sub_23A245CFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  int v16;
  int v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  uint64_t *boxed_opaque_existential_0;
  int64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;
  _QWORD aBlock[6];
  _QWORD v39[6];

  v0 = type metadata accessor for Group();
  v35 = *(_QWORD *)(v0 - 8);
  v36 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v34 = (uint64_t)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v31 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v33 = (uint64_t)&v31 - v6;
  if (qword_256956330 != -1)
    goto LABEL_15;
  while (1)
  {
    v39[3] = &type metadata for ProviderSideEffects;
    v39[4] = &off_250B32A58;
    v39[0] = swift_allocObject();
    sub_23A245CC0((uint64_t)&unk_256956760, v39[0] + 16);
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = MEMORY[0x24BEE4B08];
    v8 = (uint64_t *)(v7 + 16);
    aBlock[4] = sub_23A24660C;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A249418;
    aBlock[3] = &block_descriptor;
    v9 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    DarwinDirectoryRecordStoreApply();
    _Block_release(v9);
    swift_beginAccess();
    v10 = *v8;
    swift_bridgeObjectRetain();
    v11 = swift_release();
    MEMORY[0x24BDAC7A8](v11);
    *(&v31 - 2) = (uint64_t)v39;
    v12 = sub_23A249050((void (*)(uint64_t))sub_23A24662C, (uint64_t)(&v31 - 4), v10);
    swift_bridgeObjectRelease();
    v13 = sub_23A2509B0(v12);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    v14 = *(_QWORD *)(v13 + 16);
    if (!v14)
      break;
    v39[0] = MEMORY[0x24BEE4AF8];
    sub_23A251528();
    v15 = sub_23A245290(v13);
    v17 = v16;
    v19 = v18 & 1;
    v32 = v13 + 56;
    while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(_BYTE *)(v13 + 32))
    {
      if (((*(_QWORD *)(v32 + (((unint64_t)v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
        goto LABEL_13;
      if (*(_DWORD *)(v13 + 36) != v17)
        goto LABEL_14;
      v20 = v33;
      sub_23A242A40(*(_QWORD *)(v13 + 48) + *(_QWORD *)(v35 + 72) * v15, v33, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A242A84(v20, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v21 = v34;
      sub_23A242A40((uint64_t)v5, v34, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v22 = (char *)objc_allocWithZone((Class)DDQGroup);
      v23 = (uint64_t *)&v22[OBJC_IVAR___DDQGroup__group];
      v23[3] = v36;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v23);
      sub_23A242A40(v21, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v37.receiver = v22;
      v37.super_class = (Class)DDQGroup;
      objc_msgSendSuper2(&v37, sel_init);
      sub_23A242A04(v21, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A242A04((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A251510();
      sub_23A251534();
      sub_23A251540();
      sub_23A25151C();
      v25 = sub_23A245334(v15, v17, v19 & 1, v13);
      v15 = v25;
      v17 = v26;
      v19 = v27 & 1;
      if (!--v14)
      {
        sub_23A2465DC(v25, v26, v27 & 1);
        v28 = v39[0];
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
  }
  swift_bridgeObjectRelease();
  v28 = MEMORY[0x24BEE4AF8];
LABEL_11:
  v29 = sub_23A250CFC(v28);
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t sub_23A246114()
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
  uint64_t result;
  int64_t v10;
  int v11;
  int v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  unint64_t v30;

  v0 = type metadata accessor for Group();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v26 = (uint64_t)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v24 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v25 = (uint64_t)&v24 - v6;
  v7 = _s20DarwinDirectoryQuery5GroupV13mutableGroupsShyACGvgZ_0();
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v30 = MEMORY[0x24BEE4AF8];
    sub_23A251528();
    result = sub_23A245290(v7);
    v10 = result;
    v12 = v11;
    v14 = v13 & 1;
    v24 = v7 + 56;
    while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(_BYTE *)(v7 + 32))
    {
      if (((*(_QWORD *)(v24 + (((unint64_t)v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_12;
      if (*(_DWORD *)(v7 + 36) != v12)
        goto LABEL_13;
      v15 = v25;
      sub_23A242A40(*(_QWORD *)(v7 + 48) + *(_QWORD *)(v27 + 72) * v10, v25, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A242A84(v15, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v16 = v26;
      sub_23A242A40((uint64_t)v5, v26, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v17 = (char *)objc_allocWithZone((Class)DDQGroup);
      v18 = (uint64_t *)&v17[OBJC_IVAR___DDQGroup__group];
      v18[3] = v28;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v18);
      sub_23A242A40(v16, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v29.receiver = v17;
      v29.super_class = (Class)DDQGroup;
      objc_msgSendSuper2(&v29, sel_init);
      sub_23A242A04(v16, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A242A04((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A251510();
      sub_23A251534();
      sub_23A251540();
      sub_23A25151C();
      result = sub_23A245334(v10, v12, v14 & 1, v7);
      v10 = result;
      v12 = v20;
      v14 = v21 & 1;
      if (!--v8)
      {
        sub_23A2465DC(result, v20, v21 & 1);
        v22 = v30;
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x24BEE4AF8];
LABEL_10:
    v23 = sub_23A250CFC(v22);
    swift_bridgeObjectRelease();
    return v23;
  }
  return result;
}

id sub_23A2463A8(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD), Class *a4, _QWORD *a5)
{
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
  id v20;
  char *v21;
  uint64_t *v22;
  uint64_t *boxed_opaque_existential_0;
  objc_class *v24;
  objc_super v26;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v26 - v18;
  sub_23A246648(a1, (uint64_t)v12, a2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_23A24668C(a1, a2);
    sub_23A24668C((uint64_t)v12, a2);
    return 0;
  }
  else
  {
    sub_23A242A84((uint64_t)v12, (uint64_t)v19, a3);
    sub_23A242A40((uint64_t)v19, (uint64_t)v17, a3);
    v21 = (char *)objc_allocWithZone(*a4);
    v22 = (uint64_t *)&v21[*a5];
    v22[3] = v13;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
    sub_23A242A40((uint64_t)v17, (uint64_t)boxed_opaque_existential_0, a3);
    v24 = *a4;
    v26.receiver = v21;
    v26.super_class = v24;
    v20 = objc_msgSendSuper2(&v26, sel_init);
    sub_23A242A04((uint64_t)v17, a3);
    sub_23A24668C(a1, a2);
    sub_23A242A04((uint64_t)v19, a3);
  }
  return v20;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_23A24659C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B846028](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A2465DC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_23A2465E8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A24660C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A249318(a1, a2, v2);
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

uint64_t sub_23A24662C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_23A240EBC(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_23A246648(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A24668C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_23A2466C8(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23A2513FC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[8];
    *(_QWORD *)((char *)v4 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *((_BYTE *)v4 + v13) = *((_BYTE *)a2 + v13);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23A246794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A2467F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A2513FC();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A246890(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_23A246944(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  return a1;
}

uint64_t sub_23A2469CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_23A246A68()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A246A78()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for LibSystemGroupRecord(uint64_t a1)
{
  return sub_23A247530(a1, qword_256956508);
}

uint64_t sub_23A246A9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2513FC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_23A246B34(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v25 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23A2513FC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = (_QWORD *)((char *)v4 + v13);
    v16 = (_QWORD *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (_QWORD *)((char *)v4 + v14);
    v19 = (_QWORD *)((char *)a2 + v14);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = a3[10];
    *(_DWORD *)((char *)v4 + a3[9]) = *(_DWORD *)((char *)a2 + a3[9]);
    v22 = (_QWORD *)((char *)v4 + v21);
    v23 = (_QWORD *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    *((_BYTE *)v4 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_23A246C48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A246CC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A2513FC();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_QWORD *)(a1 + v13);
  v18 = (_QWORD *)(a2 + v13);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A246DB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  v16 = a3[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_23A246ED8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  v11 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_23A246F80(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_23A247064()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23A2513FC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_23A2470F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23A2513FC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LibSystemUserRecord(uint64_t a1)
{
  return sub_23A247530(a1, qword_2569565A8);
}

uint64_t sub_23A247188()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2513FC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23A247220(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

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
    if (EnumCaseMultiPayload == 2)
    {
      v10 = sub_23A2513FC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
  }
  return a1;
}

uint64_t sub_23A2472FC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v3 = sub_23A2513FC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if ((_DWORD)result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_23A247360(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = sub_23A2513FC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_23A247414(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_23A2474E0((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v7 = sub_23A2513FC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_23A2474E0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DarwinDirectoryFilter(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DarwinDirectoryFilter(uint64_t a1)
{
  return sub_23A247530(a1, qword_256956668);
}

uint64_t sub_23A247530(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void *sub_23A247564(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_23A2513FC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_23A2475F0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23A2474E0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_23A2513FC();
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

uint64_t sub_23A24768C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23A247698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A2476AC()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A2476BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2513FC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23A247738()
{
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  type metadata accessor for LibSystemUserRecord(0);
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  return sub_23A251594();
}

uint64_t sub_23A247888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  sub_23A25157C();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  v1 = type metadata accessor for LibSystemGroupRecord(0);
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v2 = *(_QWORD *)(v0 + *(int *)(v1 + 28));
  swift_bridgeObjectRetain();
  sub_23A242138((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_23A251594();
  return sub_23A2515AC();
}

uint64_t sub_23A247978()
{
  sub_23A25157C();
  sub_23A247738();
  return sub_23A2515AC();
}

uint64_t sub_23A2479B8()
{
  sub_23A25157C();
  sub_23A247738();
  return sub_23A2515AC();
}

uint64_t sub_23A2479F4()
{
  return sub_23A242394(&qword_2569566A0, type metadata accessor for LibSystemUserRecord, (uint64_t)&unk_23A251D08);
}

uint64_t sub_23A247A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v5 = *(_QWORD *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_23A242138(a1, v5);
  swift_bridgeObjectRelease();
  return sub_23A251594();
}

uint64_t sub_23A247AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[72];

  sub_23A25157C();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v4 = *(_QWORD *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_23A242138((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  sub_23A251594();
  return sub_23A2515AC();
}

uint64_t sub_23A247BE4()
{
  return sub_23A242394(&qword_2569566A8, type metadata accessor for LibSystemGroupRecord, (uint64_t)&unk_23A251D70);
}

uint64_t sub_23A247C10(uint64_t a1, uint64_t a2)
{
  char v5;
  char v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    goto LABEL_23;
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8) || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
  {
    v5 = sub_23A251564();
    v6 = 0;
    if ((v5 & 1) == 0)
      return v6 & 1;
  }
  v7 = (int *)type metadata accessor for LibSystemUserRecord(0);
  if ((sub_23A2513CC() & 1) == 0)
    goto LABEL_23;
  v8 = v7[7];
  v9 = *(_QWORD *)(a1 + v8);
  v10 = *(_QWORD *)(a1 + v8 + 8);
  v11 = (_QWORD *)(a2 + v8);
  if (v9 != *v11 || v10 != v11[1])
  {
    v13 = sub_23A251564();
    v6 = 0;
    if ((v13 & 1) == 0)
      return v6 & 1;
  }
  v14 = v7[8];
  v15 = *(_QWORD *)(a1 + v14);
  v16 = *(_QWORD *)(a1 + v14 + 8);
  v17 = (_QWORD *)(a2 + v14);
  if (v15 != *v17 || v16 != v17[1])
  {
    v19 = sub_23A251564();
    v6 = 0;
    if ((v19 & 1) == 0)
      return v6 & 1;
  }
  if (*(_DWORD *)(a1 + v7[9]) != *(_DWORD *)(a2 + v7[9]))
  {
LABEL_23:
    v6 = 0;
    return v6 & 1;
  }
  v20 = v7[10];
  v21 = *(_QWORD *)(a1 + v20);
  v22 = *(_QWORD *)(a1 + v20 + 8);
  v23 = (_QWORD *)(a2 + v20);
  if (v21 == *v23 && v22 == v23[1] || (v24 = sub_23A251564(), v6 = 0, (v24 & 1) != 0))
    v6 = *(_BYTE *)(a1 + v7[11]) ^ *(_BYTE *)(a2 + v7[11]) ^ 1;
  return v6 & 1;
}

uint64_t sub_23A247D60(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  uint64_t v7;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    goto LABEL_10;
  v4 = *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16);
  if (v4 || (v5 = sub_23A251564(), v6 = 0, (v5 & 1) != 0))
  {
    v7 = type metadata accessor for LibSystemGroupRecord(0);
    if ((sub_23A2513CC() & 1) != 0
      && (sub_23A242DA0(*(_QWORD *)(a1 + *(int *)(v7 + 28)), *(_QWORD *)(a2 + *(int *)(v7 + 28))) & 1) != 0)
    {
      v6 = *(_BYTE *)(a1 + *(int *)(v7 + 32)) ^ *(_BYTE *)(a2 + *(int *)(v7 + 32)) ^ 1;
      return v6 & 1;
    }
LABEL_10:
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t initializeBufferWithCopyOfBuffer for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for ProviderSideEffects(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for ProviderSideEffects(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProviderSideEffects(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderSideEffects(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProviderSideEffects()
{
  return &type metadata for ProviderSideEffects;
}

uint64_t User.hashValue.getter()
{
  sub_23A25157C();
  User.hash(into:)();
  return sub_23A2515AC();
}

uint64_t User.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A2513FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t User.uid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User() + 20));
}

uint64_t User.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.homeDirectory.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.primaryGroupID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User() + 36));
}

uint64_t User.shell.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.hash(into:)()
{
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  type metadata accessor for User();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A2483E8()
{
  sub_23A25157C();
  User.hash(into:)();
  return sub_23A2515AC();
}

uint64_t sub_23A248428()
{
  sub_23A25157C();
  User.hash(into:)();
  return sub_23A2515AC();
}

uint64_t sub_23A248464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int v20;
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
  int *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_23A2513FC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for LibSystemUserRecord(0);
  v12 = *((_QWORD *)v11 - 1);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v36 - v16;
  sub_23A248F04(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_23A248F4C(a1);
    sub_23A248F4C((uint64_t)v10);
    v18 = type metadata accessor for User();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a2, 1, 1, v18);
  }
  else
  {
    sub_23A248F8C((uint64_t)v10, (uint64_t)v17);
    sub_23A248FD0((uint64_t)v17, (uint64_t)v15);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v15[v11[6]], v4);
    v20 = *(_DWORD *)v15;
    v21 = *((_QWORD *)v15 + 2);
    v41 = *((_QWORD *)v15 + 1);
    v42 = a1;
    v22 = v11[8];
    v23 = &v15[v11[7]];
    v24 = *((_QWORD *)v23 + 1);
    v36 = *(_QWORD *)v23;
    v25 = *(_QWORD *)&v15[v22];
    v26 = *(_QWORD *)&v15[v22 + 8];
    v27 = v11[10];
    LODWORD(v23) = *(_DWORD *)&v15[v11[9]];
    v37 = v20;
    v38 = (int)v23;
    v28 = &v15[v27];
    v29 = *(_QWORD *)&v15[v27];
    v30 = *((_QWORD *)v28 + 1);
    v39 = v25;
    v40 = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23A249014((uint64_t)v15);
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    v31 = (int *)type metadata accessor for User();
    *(_DWORD *)(a2 + v31[5]) = v37;
    v32 = (_QWORD *)(a2 + v31[6]);
    *v32 = v41;
    v32[1] = v21;
    v33 = (_QWORD *)(a2 + v31[7]);
    *v33 = v36;
    v33[1] = v24;
    v34 = (_QWORD *)(a2 + v31[8]);
    *v34 = v39;
    v34[1] = v26;
    *(_DWORD *)(a2 + v31[9]) = v38;
    v35 = (_QWORD *)(a2 + v31[10]);
    *v35 = v40;
    v35[1] = v30;
    sub_23A248F4C(v42);
    sub_23A249014((uint64_t)v17);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v31 - 1) + 56))(a2, 0, 1, v31);
  }
}

uint64_t _s20DarwinDirectoryQuery4UserV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  char v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;

  if ((sub_23A2513CC() & 1) == 0)
    return 0;
  v4 = type metadata accessor for User();
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20)))
    return 0;
  v5 = (int *)v4;
  v6 = *(int *)(v4 + 24);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = v7 == *v9 && v8 == v9[1];
  if (v10 || (v11 = sub_23A251564(), result = 0, (v11 & 1) != 0))
  {
    v13 = v5[7];
    v14 = *(_QWORD *)(a1 + v13);
    v15 = *(_QWORD *)(a1 + v13 + 8);
    v16 = (_QWORD *)(a2 + v13);
    v17 = v14 == *v16 && v15 == v16[1];
    if (v17 || (v18 = sub_23A251564(), result = 0, (v18 & 1) != 0))
    {
      v19 = v5[8];
      v20 = *(_QWORD *)(a1 + v19);
      v21 = *(_QWORD *)(a1 + v19 + 8);
      v22 = (_QWORD *)(a2 + v19);
      v23 = v20 == *v22 && v21 == v22[1];
      if (v23 || (v24 = sub_23A251564(), result = 0, (v24 & 1) != 0))
      {
        if (*(_DWORD *)(a1 + v5[9]) == *(_DWORD *)(a2 + v5[9]))
        {
          v25 = v5[10];
          v26 = *(_QWORD *)(a1 + v25);
          v27 = *(_QWORD *)(a1 + v25 + 8);
          v28 = (_QWORD *)(a2 + v25);
          if (v26 == *v28 && v27 == v28[1])
            return 1;
          else
            return sub_23A251564();
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for User()
{
  uint64_t result;

  result = qword_256956710;
  if (!qword_256956710)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A248884()
{
  return sub_23A242394(&qword_2569566B0, (uint64_t (*)(uint64_t))type metadata accessor for User, (uint64_t)&protocol conformance descriptor for User);
}

uint64_t *initializeBufferWithCopyOfBuffer for User(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A2513FC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = a3[8];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = (uint64_t *)((char *)a1 + v13);
    v18 = (uint64_t *)((char *)a2 + v13);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = a3[10];
    *(_DWORD *)((char *)a1 + a3[9]) = *(_DWORD *)((char *)a2 + a3[9]);
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for User(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a3[8];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_QWORD *)(a1 + v12);
  v17 = (_QWORD *)(a2 + v12);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  v16 = a3[10];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = sub_23A2513FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[8];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for User()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A248D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A2513FC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for User()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A248E00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A2513FC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A248E7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A2513FC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23A248F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A248F4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A248F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A248FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A249014(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A249050(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = a1;
  v35 = a2;
  v5 = type metadata accessor for LibSystemGroupRecord(0);
  v33 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v32 = (uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v31 = (uint64_t)&v27 - v8;
  v9 = type metadata accessor for Group();
  v30 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (!v12)
    return v13;
  v36 = v3;
  v37 = MEMORY[0x24BEE4AF8];
  sub_23A24F6D4(0, v12, 0);
  result = sub_23A24528C(a3);
  v15 = result;
  v17 = v16;
  v19 = v18 & 1;
  v28 = v11;
  v29 = a3 + 56;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(_BYTE *)(a3 + 32))
  {
    if (((*(_QWORD *)(v29 + (((unint64_t)v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      goto LABEL_17;
    if (*(_DWORD *)(a3 + 36) != (_DWORD)v17)
      goto LABEL_18;
    v20 = v31;
    sub_23A242A40(*(_QWORD *)(a3 + 48) + *(_QWORD *)(v33 + 72) * v15, v31, type metadata accessor for LibSystemGroupRecord);
    v21 = v32;
    sub_23A242A84(v20, v32, type metadata accessor for LibSystemGroupRecord);
    v22 = v36;
    v34(v21);
    sub_23A242A04(v21, type metadata accessor for LibSystemGroupRecord);
    v13 = v37;
    v36 = v22;
    if (v22)
    {
      swift_release();
      return v13;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_23A24F6D4(0, *(_QWORD *)(v13 + 16) + 1, 1);
      v13 = v37;
    }
    v24 = *(_QWORD *)(v13 + 16);
    v23 = *(_QWORD *)(v13 + 24);
    if (v24 >= v23 >> 1)
    {
      sub_23A24F6D4(v23 > 1, v24 + 1, 1);
      v13 = v37;
    }
    *(_QWORD *)(v13 + 16) = v24 + 1;
    sub_23A242A84((uint64_t)v28, v13+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(_QWORD *)(v30 + 72) * v24, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    result = sub_23A245330(v15, v17, v19 & 1, a3);
    v15 = result;
    v17 = v25;
    v19 = v26 & 1;
    if (!--v12)
    {
      sub_23A2465DC(result, v25, v26 & 1);
      return v13;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_23A249318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A249334(a1, a2, a3, type metadata accessor for LibSystemGroupRecord, (void (*)(uint64_t))sub_23A242C68, (void (*)(char *, char *))sub_23A24AD60);
}

uint64_t sub_23A249334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), void (*a5)(uint64_t), void (*a6)(char *, char *))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;

  v10 = a4(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v17 - v14;
  a5(a1);
  swift_beginAccess();
  a6(v15, v13);
  swift_endAccess();
  return sub_23A242A04((uint64_t)v15, a4);
}

uint64_t sub_23A249418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_23A249460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  uint64_t aBlock;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, uint64_t);
  void *v43;
  uint64_t (*v44)(uint64_t, _BYTE *);
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = sub_23A2513FC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  v11 = swift_allocBox();
  v13 = v12;
  v14 = type metadata accessor for LibSystemGroupRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_23A242A40(a1, (uint64_t)v10, type metadata accessor for DarwinDirectoryFilter);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v16 = *v10;
      v17 = v10[1];
      swift_retain();
      sub_23A249C58(v16, v17, v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, v4);
      v31 = sub_23A2513F0();
      v32 = v20;
      v33 = v21;
      v34 = v22;
      v35 = v23;
      v36 = v24;
      v37 = v25;
      v38 = v26;
      v39 = v27;
      v44 = sub_23A251068;
      v45 = v11;
      aBlock = MEMORY[0x24BDAC760];
      v41 = 1107296256;
      v42 = sub_23A249418;
      v43 = &block_descriptor_12;
      v28 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      DarwinDirectoryRecordStoreApplyWithUUIDFilter(1, (const unsigned __int8 *)&v31, v28);
      _Block_release(v28);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
    v18 = *(unsigned int *)v10;
    v44 = sub_23A251068;
    v45 = v11;
    aBlock = MEMORY[0x24BDAC760];
    v41 = 1107296256;
    v42 = sub_23A249418;
    v43 = &block_descriptor_15;
    v19 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    DarwinDirectoryRecordStoreApplyWithIDFilter(1, v18, v19);
    _Block_release(v19);
  }
  swift_beginAccess();
  sub_23A246648(v13, a2, &qword_2569563E0);
  return swift_release();
}

uint64_t sub_23A249794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  uint64_t aBlock;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, uint64_t);
  void *v43;
  uint64_t (*v44)(uint64_t, _BYTE *);
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = sub_23A2513FC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  v11 = swift_allocBox();
  v13 = v12;
  v14 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_23A242A40(a1, (uint64_t)v10, type metadata accessor for DarwinDirectoryFilter);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v16 = *v10;
      v17 = v10[1];
      swift_retain();
      sub_23A249DB8(v16, v17, v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, v4);
      v31 = sub_23A2513F0();
      v32 = v20;
      v33 = v21;
      v34 = v22;
      v35 = v23;
      v36 = v24;
      v37 = v25;
      v38 = v26;
      v39 = v27;
      v44 = sub_23A251270;
      v45 = v11;
      aBlock = MEMORY[0x24BDAC760];
      v41 = 1107296256;
      v42 = sub_23A249418;
      v43 = &block_descriptor_32;
      v28 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      DarwinDirectoryRecordStoreApplyWithUUIDFilter(0, (const unsigned __int8 *)&v31, v28);
      _Block_release(v28);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
    v18 = *(unsigned int *)v10;
    v44 = sub_23A251270;
    v45 = v11;
    aBlock = MEMORY[0x24BDAC760];
    v41 = 1107296256;
    v42 = sub_23A249418;
    v43 = &block_descriptor_35;
    v19 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    DarwinDirectoryRecordStoreApplyWithIDFilter(0, v18, v19);
    _Block_release(v19);
  }
  swift_beginAccess();
  sub_23A246648(v13, a2, &qword_2569564A0);
  return swift_release();
}

uint64_t sub_23A249AC8(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t *a4, void (*a5)(uint64_t), uint64_t (*a6)(_QWORD))
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v11 = __swift_instantiateConcreteTypeFromMangledName(a4);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_projectBox();
  a5(a1);
  v15 = a6(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 0, 1, v15);
  swift_beginAccess();
  result = sub_23A2512A0((uint64_t)v13, v14, a4);
  *a2 = 1;
  return result;
}

void sub_23A249BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  void *v7;
  _QWORD v8[6];

  v8[5] = a2;
  v8[4] = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_23A249418;
  v8[3] = a4;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApplyWithNameFilter(a5, a1, v7);
  _Block_release(v7);
}

uint64_t sub_23A249C58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[2];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_23A2514EC();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v4 = sub_23A251504();
    sub_23A249BB4(v4, a3, (uint64_t)sub_23A251068, (uint64_t)&block_descriptor_23, 1u);
    return swift_release();
  }
  v8[0] = a1;
  v8[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  v7[4] = sub_23A251068;
  v7[5] = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_23A249418;
  v7[3] = &block_descriptor_18;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApplyWithNameFilter(1, (uint64_t)v8, v6);
  _Block_release(v6);
  return swift_release();
}

uint64_t sub_23A249DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[2];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_23A2514EC();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v4 = sub_23A251504();
    sub_23A249BB4(v4, a3, (uint64_t)sub_23A251270, (uint64_t)&block_descriptor_43, 0);
    return swift_release();
  }
  v8[0] = a1;
  v8[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  v7[4] = sub_23A251270;
  v7[5] = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_23A249418;
  v7[3] = &block_descriptor_39;
  v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApplyWithNameFilter(0, (uint64_t)v8, v6);
  _Block_release(v6);
  return swift_release();
}

uint64_t static User.allUsers.getter()
{
  return sub_23A249F30((uint64_t (*)(void *))sub_23A24F874);
}

uint64_t static User.mutableUsers.getter()
{
  return sub_23A249F30((uint64_t (*)(void *))sub_23A24FD00);
}

uint64_t sub_23A249F30(uint64_t (*a1)(void *))
{
  if (qword_256956330 == -1)
    return a1(&unk_256956760);
  swift_once();
  return a1(&unk_256956760);
}

uint64_t static User.with(uuid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v14[5];

  v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256956330 != -1)
    swift_once();
  v14[3] = &type metadata for ProviderSideEffects;
  v14[4] = &off_250B32A58;
  v14[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v14[0] + 16);
  v10 = __swift_project_boxed_opaque_existential_1(v14, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  v11 = sub_23A2513FC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v6, a1, v11);
  swift_storeEnumTagMultiPayload();
  sub_23A249794((uint64_t)v6, (uint64_t)v9);
  sub_23A242A04((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_23A248464((uint64_t)v9, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t static User.with(uid:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD v13[5];

  v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_DWORD *)((char *)&v13[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256956330 != -1)
    swift_once();
  v13[3] = &type metadata for ProviderSideEffects;
  v13[4] = &off_250B32A58;
  v13[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v13[0] + 16);
  v10 = __swift_project_boxed_opaque_existential_1(v13, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  *v6 = a1;
  swift_storeEnumTagMultiPayload();
  sub_23A249794((uint64_t)v6, (uint64_t)v9);
  sub_23A242A04((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_23A248464((uint64_t)v9, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t static User.with(name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD v15[5];

  v6 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_QWORD *)((char *)&v15[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569564A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256956330 != -1)
    swift_once();
  v15[3] = &type metadata for ProviderSideEffects;
  v15[4] = &off_250B32A58;
  v15[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v15[0] + 16);
  v12 = __swift_project_boxed_opaque_existential_1(v15, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  *v8 = a1;
  v8[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_23A249794((uint64_t)v8, (uint64_t)v11);
  sub_23A242A04((uint64_t)v8, type metadata accessor for DarwinDirectoryFilter);
  sub_23A248464((uint64_t)v11, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t static Group.allGroups.getter()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD aBlock[6];
  _QWORD v10[5];

  if (qword_256956330 != -1)
    swift_once();
  v10[3] = &type metadata for ProviderSideEffects;
  v10[4] = &off_250B32A58;
  v10[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v10[0] + 16);
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B08];
  v1 = (uint64_t *)(v0 + 16);
  aBlock[4] = sub_23A2501C8;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A249418;
  aBlock[3] = &block_descriptor_0;
  v2 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v2);
  swift_beginAccess();
  v3 = *v1;
  swift_bridgeObjectRetain();
  v4 = swift_release();
  MEMORY[0x24BDAC7A8](v4);
  v8[2] = v10;
  v5 = sub_23A249050((void (*)(uint64_t))sub_23A24662C, (uint64_t)v8, v3);
  swift_bridgeObjectRelease();
  v6 = sub_23A2509B0(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v6;
}

uint64_t static Group.with(uuid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _QWORD *v10;
  uint64_t v11;
  _BYTE v13[40];
  _QWORD v14[5];

  v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_256956330 != -1)
    swift_once();
  v14[3] = &type metadata for ProviderSideEffects;
  v14[4] = &off_250B32A58;
  v14[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v14[0] + 16);
  v10 = __swift_project_boxed_opaque_existential_1(v14, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  v11 = sub_23A2513FC();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v6, a1, v11);
  swift_storeEnumTagMultiPayload();
  sub_23A249460((uint64_t)v6, (uint64_t)v9);
  sub_23A242A04((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_23A242980((uint64_t)v14, (uint64_t)v13);
  sub_23A240BF0((uint64_t)v9, (uint64_t)v13, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t static Group.with(gid:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _QWORD *v10;
  _BYTE v12[40];
  _QWORD v13[5];

  v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_256956330 != -1)
    swift_once();
  v13[3] = &type metadata for ProviderSideEffects;
  v13[4] = &off_250B32A58;
  v13[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v13[0] + 16);
  v10 = __swift_project_boxed_opaque_existential_1(v13, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  *v6 = a1;
  swift_storeEnumTagMultiPayload();
  sub_23A249460((uint64_t)v6, (uint64_t)v9);
  sub_23A242A04((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_23A242980((uint64_t)v13, (uint64_t)v12);
  sub_23A240BF0((uint64_t)v9, (uint64_t)v12, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t static Group.with(name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _QWORD *v12;
  _BYTE v14[40];
  _QWORD v15[5];

  v6 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_256956330 != -1)
    swift_once();
  v15[3] = &type metadata for ProviderSideEffects;
  v15[4] = &off_250B32A58;
  v15[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v15[0] + 16);
  v12 = __swift_project_boxed_opaque_existential_1(v15, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  *v8 = a1;
  v8[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_23A249460((uint64_t)v8, (uint64_t)v11);
  sub_23A242A04((uint64_t)v8, type metadata accessor for DarwinDirectoryFilter);
  sub_23A242980((uint64_t)v15, (uint64_t)v14);
  sub_23A240BF0((uint64_t)v11, (uint64_t)v14, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

void sub_23A24AA28()
{
  qword_256956778 = (uint64_t)&type metadata for LibSystemDarwinDirectoryProvider;
  unk_256956780 = &off_250B328F0;
}

uint64_t sub_23A24AA48(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v6 = (int *)type metadata accessor for LibSystemUserRecord(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v38 = (uint64_t)&v36 - v11;
  v12 = *v2;
  sub_23A25157C();
  swift_bridgeObjectRetain();
  sub_23A247738();
  v13 = sub_23A2515AC();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  v15 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
  {
    v36 = v2;
    v37 = a1;
    v16 = ~v14;
    v17 = *(_QWORD *)(v7 + 72);
    while (1)
    {
      sub_23A242A40(*(_QWORD *)(v12 + 48) + v17 * v15, (uint64_t)v10, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v10 == *(_DWORD *)a2)
      {
        v18 = *((_QWORD *)v10 + 1) == *(_QWORD *)(a2 + 8) && *((_QWORD *)v10 + 2) == *(_QWORD *)(a2 + 16);
        if ((v18 || (sub_23A251564() & 1) != 0) && (sub_23A2513CC() & 1) != 0)
        {
          v19 = v6[7];
          v20 = *(_QWORD *)&v10[v19];
          v21 = *(_QWORD *)&v10[v19 + 8];
          v22 = (_QWORD *)(a2 + v19);
          v23 = v20 == *v22 && v21 == v22[1];
          if (v23 || (sub_23A251564() & 1) != 0)
          {
            v24 = v6[8];
            v25 = *(_QWORD *)&v10[v24];
            v26 = *(_QWORD *)&v10[v24 + 8];
            v27 = (_QWORD *)(a2 + v24);
            v28 = v25 == *v27 && v26 == v27[1];
            if ((v28 || (sub_23A251564() & 1) != 0) && *(_DWORD *)&v10[v6[9]] == *(_DWORD *)(a2 + v6[9]))
            {
              if ((v29 = v6[10],
                    v30 = *(_QWORD *)&v10[v29],
                    v31 = *(_QWORD *)&v10[v29 + 8],
                    v32 = (_QWORD *)(a2 + v29),
                    v30 == *v32)
                && v31 == v32[1]
                || (sub_23A251564() & 1) != 0)
              {
                if (v10[v6[11]] == *(_BYTE *)(a2 + v6[11]))
                  break;
              }
            }
          }
        }
      }
      sub_23A242A04((uint64_t)v10, type metadata accessor for LibSystemUserRecord);
      v15 = (v15 + 1) & v16;
      if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v36;
        a1 = v37;
        goto LABEL_29;
      }
    }
    sub_23A242A04((uint64_t)v10, type metadata accessor for LibSystemUserRecord);
    swift_bridgeObjectRelease();
    sub_23A242A04(a2, type metadata accessor for LibSystemUserRecord);
    sub_23A242A40(*(_QWORD *)(*v36 + 48) + v17 * v15, v37, type metadata accessor for LibSystemUserRecord);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_29:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = v38;
    sub_23A242A40(a2, v38, type metadata accessor for LibSystemUserRecord);
    v39 = *v3;
    *v3 = 0x8000000000000000;
    sub_23A24CB50(v34, v15, isUniquelyReferenced_nonNull_native);
    *v3 = v39;
    swift_bridgeObjectRelease();
    sub_23A242A84(a2, a1, type metadata accessor for LibSystemUserRecord);
    return 1;
  }
}

uint64_t sub_23A24AD60(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  int *v6;
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
  uint64_t v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[9];

  v3 = v2;
  v6 = (int *)type metadata accessor for LibSystemGroupRecord(0);
  v25 = *((_QWORD *)v6 - 1);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v26 = (uint64_t)&v23 - v10;
  v11 = *v2;
  sub_23A25157C();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  v12 = a2 + v6[6];
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v29 = v12;
  sub_23A251408();
  v28 = v6[7];
  v13 = *(_QWORD *)(a2 + v28);
  swift_bridgeObjectRetain();
  sub_23A242138((uint64_t)v30, v13);
  swift_bridgeObjectRelease();
  v27 = v6[8];
  sub_23A251594();
  v14 = sub_23A2515AC();
  v15 = -1 << *(_BYTE *)(v11 + 32);
  v16 = v14 & ~v15;
  if (((*(_QWORD *)(v11 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
  {
    v23 = v3;
    v24 = a1;
    v17 = ~v15;
    v18 = *(_QWORD *)(v25 + 72);
    do
    {
      sub_23A242A40(*(_QWORD *)(v11 + 48) + v18 * v16, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a2)
      {
        v19 = *((_QWORD *)v9 + 1) == *(_QWORD *)(a2 + 8) && *((_QWORD *)v9 + 2) == *(_QWORD *)(a2 + 16);
        if ((v19 || (sub_23A251564() & 1) != 0)
          && (sub_23A2513CC() & 1) != 0
          && (sub_23A242DA0(*(_QWORD *)&v9[v6[7]], *(_QWORD *)(a2 + v28)) & 1) != 0
          && v9[v6[8]] == *(_BYTE *)(a2 + v27))
        {
          sub_23A242A04((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
          swift_bridgeObjectRelease();
          sub_23A242A04(a2, type metadata accessor for LibSystemGroupRecord);
          sub_23A242A40(*(_QWORD *)(*v23 + 48) + v18 * v16, v24, type metadata accessor for LibSystemGroupRecord);
          return 0;
        }
      }
      sub_23A242A04((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      v16 = (v16 + 1) & v17;
    }
    while (((*(_QWORD *)(v11 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0);
    swift_bridgeObjectRelease();
    v3 = v23;
    a1 = v24;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22 = v26;
  sub_23A242A40(a2, v26, type metadata accessor for LibSystemGroupRecord);
  v30[0] = *v3;
  *v3 = 0x8000000000000000;
  sub_23A24CE20(v22, v16, isUniquelyReferenced_nonNull_native);
  *v3 = v30[0];
  swift_bridgeObjectRelease();
  sub_23A242A84(a2, a1, type metadata accessor for LibSystemGroupRecord);
  return 1;
}

uint64_t sub_23A24B09C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23A25157C();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  v8 = sub_23A2515AC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23A251564() & 1) != 0)
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
      if (v19 || (sub_23A251564() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23A24D3D0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23A24B248(_QWORD *a1, void *a2, void (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  char isUniquelyReferenced_nonNull_native;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v7 = v4;
  v10 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v10 < 0)
      v11 = *v4;
    else
      v11 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v12 = a2;
    v13 = sub_23A2514A4();

    if (v13)
    {
      swift_bridgeObjectRelease();

      a3(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v35;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_23A251498();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v25 = sub_23A24B4F4(v11, result + 1, a4, a3);
    v36 = v25;
    v26 = *(_QWORD *)(v25 + 16);
    if (*(_QWORD *)(v25 + 24) <= v26)
    {
      v31 = v26 + 1;
      v32 = v12;
      sub_23A24C838(v31, a4);
      v27 = v36;
    }
    else
    {
      v27 = v25;
      v28 = v12;
    }
    sub_23A24CAD0((uint64_t)v12, v27);
    *v7 = v27;
    swift_bridgeObjectRelease();
    *a1 = v12;
  }
  else
  {
    swift_bridgeObjectRetain();
    v15 = sub_23A25145C();
    v16 = -1 << *(_BYTE *)(v10 + 32);
    v17 = v15 & ~v16;
    if (((*(_QWORD *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
    {
      a3(0);
      v18 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v17);
      v19 = sub_23A251468();

      if ((v19 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v23 = *(void **)(*(_QWORD *)(*v4 + 48) + 8 * v17);
        *a1 = v23;
        v24 = v23;
        return 0;
      }
      v20 = ~v16;
      while (1)
      {
        v17 = (v17 + 1) & v20;
        if (((*(_QWORD *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
          break;
        v21 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v17);
        v22 = sub_23A251468();

        if ((v22 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v37 = *v4;
    *v4 = 0x8000000000000000;
    v30 = a2;
    sub_23A24D568((uint64_t)v30, v17, isUniquelyReferenced_nonNull_native, a4, a3);
    *v4 = v37;
    swift_bridgeObjectRelease();
    *a1 = v30;
  }
  return 1;
}

uint64_t sub_23A24B4F4(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(_QWORD))
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_23A2514D4();
    v19 = v6;
    sub_23A25148C();
    if (sub_23A2514B0())
    {
      a4(0);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_23A24C838(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_23A25145C();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_23A2514B0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

uint64_t sub_23A24B6E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD *v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  int64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = type metadata accessor for LibSystemUserRecord(0);
  v28 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F8);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v27 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v25 = v0;
    v26 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    v29 = v5;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v14 << 6);
        v17 = v29;
      }
      else
      {
        v20 = v14 + 1;
        v17 = v29;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        v21 = v27;
        if (v20 >= v26)
          goto LABEL_21;
        v22 = v27[v20];
        ++v14;
        if (!v22)
        {
          v14 = v20 + 1;
          if (v20 + 1 >= v26)
            goto LABEL_21;
          v22 = v27[v14];
          if (!v22)
          {
            v23 = v20 + 2;
            if (v23 >= v26)
            {
LABEL_21:
              swift_release();
              v24 = 1 << *(_BYTE *)(v17 + 32);
              if (v24 > 63)
                bzero(v21, ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v21 = -1 << v24;
              v1 = v25;
              *(_QWORD *)(v17 + 16) = 0;
              break;
            }
            v22 = v27[v23];
            if (!v22)
            {
              while (1)
              {
                v14 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_28;
                if (v14 >= v26)
                  goto LABEL_21;
                v22 = v27[v14];
                ++v23;
                if (v22)
                  goto LABEL_20;
              }
            }
            v14 = v23;
          }
        }
LABEL_20:
        v11 = (v22 - 1) & v22;
        v16 = __clz(__rbit64(v22)) + (v14 << 6);
      }
      v18 = *(_QWORD *)(v28 + 72);
      sub_23A242A84(*(_QWORD *)(v17 + 48) + v18 * v16, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
      sub_23A25157C();
      sub_23A2515A0();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      sub_23A2513FC();
      sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23A251408();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      sub_23A2515A0();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      sub_23A251594();
      sub_23A2515AC();
      v19 = sub_23A251480();
      *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19 * v18, type metadata accessor for LibSystemUserRecord);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23A24BAA0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = type metadata accessor for User();
  v27 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E8);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v24 = v0;
    v25 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v26 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    v28 = v5;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v14 << 6);
        v17 = v28;
      }
      else
      {
        v20 = v14 + 1;
        v17 = v28;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v20 >= v26)
          goto LABEL_23;
        v21 = v25[v20];
        ++v14;
        if (!v21)
        {
          v14 = v20 + 1;
          if (v20 + 1 >= v26)
            goto LABEL_23;
          v21 = v25[v14];
          if (!v21)
          {
            v14 = v20 + 2;
            if (v20 + 2 >= v26)
              goto LABEL_23;
            v21 = v25[v14];
            if (!v21)
            {
              v22 = v20 + 3;
              if (v22 >= v26)
              {
LABEL_23:
                swift_release();
                v23 = 1 << *(_BYTE *)(v17 + 32);
                if (v23 > 63)
                  bzero(v25, ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v25 = -1 << v23;
                v1 = v24;
                *(_QWORD *)(v17 + 16) = 0;
                break;
              }
              v21 = v25[v22];
              if (!v21)
              {
                while (1)
                {
                  v14 = v22 + 1;
                  if (__OFADD__(v22, 1))
                    goto LABEL_30;
                  if (v14 >= v26)
                    goto LABEL_23;
                  v21 = v25[v14];
                  ++v22;
                  if (v21)
                    goto LABEL_22;
                }
              }
              v14 = v22;
            }
          }
        }
LABEL_22:
        v11 = (v21 - 1) & v21;
        v16 = __clz(__rbit64(v21)) + (v14 << 6);
      }
      v18 = *(_QWORD *)(v27 + 72);
      sub_23A242A84(*(_QWORD *)(v17 + 48) + v18 * v16, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A25157C();
      sub_23A2513FC();
      sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23A251408();
      sub_23A2515A0();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      sub_23A2515A0();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      sub_23A2515AC();
      v19 = sub_23A251480();
      *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19 * v18, (uint64_t (*)(_QWORD))type metadata accessor for User);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23A24BE90()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  _QWORD *v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30[72];

  v1 = v0;
  v2 = type metadata accessor for LibSystemGroupRecord(0);
  v28 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F0);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v25 = v0;
    v26 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v27 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    v29 = v5;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v14 << 6);
      }
      else
      {
        v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v20 >= v27)
          goto LABEL_23;
        v21 = v26[v20];
        ++v14;
        if (!v21)
        {
          v14 = v20 + 1;
          if (v20 + 1 >= v27)
            goto LABEL_23;
          v21 = v26[v14];
          if (!v21)
          {
            v14 = v20 + 2;
            if (v20 + 2 >= v27)
              goto LABEL_23;
            v21 = v26[v14];
            if (!v21)
            {
              v22 = v20 + 3;
              if (v22 >= v27)
              {
LABEL_23:
                v23 = v29;
                swift_release();
                v24 = 1 << *(_BYTE *)(v23 + 32);
                if (v24 > 63)
                  bzero(v26, ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v26 = -1 << v24;
                v1 = v25;
                *(_QWORD *)(v23 + 16) = 0;
                break;
              }
              v21 = v26[v22];
              if (!v21)
              {
                while (1)
                {
                  v14 = v22 + 1;
                  if (__OFADD__(v22, 1))
                    goto LABEL_30;
                  if (v14 >= v27)
                    goto LABEL_23;
                  v21 = v26[v14];
                  ++v22;
                  if (v21)
                    goto LABEL_22;
                }
              }
              v14 = v22;
            }
          }
        }
LABEL_22:
        v11 = (v21 - 1) & v21;
        v16 = __clz(__rbit64(v21)) + (v14 << 6);
      }
      v17 = *(_QWORD *)(v28 + 72);
      sub_23A242A84(*(_QWORD *)(v29 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemGroupRecord);
      sub_23A25157C();
      sub_23A2515A0();
      swift_bridgeObjectRetain();
      sub_23A25142C();
      swift_bridgeObjectRelease();
      sub_23A2513FC();
      sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23A251408();
      v18 = *(_QWORD *)&v4[*(int *)(v2 + 28)];
      swift_bridgeObjectRetain();
      sub_23A242138((uint64_t)v30, v18);
      swift_bridgeObjectRelease();
      sub_23A251594();
      sub_23A2515AC();
      v19 = sub_23A251480();
      *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19 * v17, type metadata accessor for LibSystemGroupRecord);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23A24C210()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[4];

  v1 = v0;
  v2 = type metadata accessor for Group();
  v27 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569567A8);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v24 = v0;
    v25 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v26 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    v28 = v5;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v19 >= v26)
          goto LABEL_23;
        v20 = v25[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v26)
            goto LABEL_23;
          v20 = v25[v14];
          if (!v20)
          {
            v14 = v19 + 2;
            if (v19 + 2 >= v26)
              goto LABEL_23;
            v20 = v25[v14];
            if (!v20)
            {
              v21 = v19 + 3;
              if (v21 >= v26)
              {
LABEL_23:
                v22 = v28;
                swift_release();
                v23 = 1 << *(_BYTE *)(v22 + 32);
                if (v23 > 63)
                  bzero(v25, ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v25 = -1 << v23;
                v1 = v24;
                *(_QWORD *)(v22 + 16) = 0;
                break;
              }
              v20 = v25[v21];
              if (!v20)
              {
                while (1)
                {
                  v14 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_30;
                  if (v14 >= v26)
                    goto LABEL_23;
                  v20 = v25[v14];
                  ++v21;
                  if (v20)
                    goto LABEL_22;
                }
              }
              v14 = v21;
            }
          }
        }
LABEL_22:
        v11 = (v20 - 1) & v20;
        v16 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v17 = *(_QWORD *)(v27 + 72);
      sub_23A242A84(*(_QWORD *)(v28 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A25157C();
      sub_23A2513FC();
      sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23A251408();
      sub_23A2515A0();
      sub_23A25142C();
      sub_23A241E74(v29, *(_QWORD *)&v4[*(int *)(v2 + 28)]);
      sub_23A2515AC();
      v18 = sub_23A251480();
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v18 * v17, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23A24C55C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256956798);
  v3 = sub_23A2514C8();
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
      sub_23A25157C();
      sub_23A25142C();
      result = sub_23A2515AC();
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

uint64_t sub_23A24C838(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
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
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_23A2514C8();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
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
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
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
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_23A25145C();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_23A24CAD0(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_23A25145C();
  result = sub_23A251480();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_23A24CB50(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;

  v4 = v3;
  v8 = (int *)type metadata accessor for LibSystemUserRecord(0);
  v9 = *((_QWORD *)v8 - 1);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(*v4 + 16);
  v13 = *(_QWORD *)(*v4 + 24);
  v39 = v9;
  if (v13 > v12 && (a3 & 1) != 0)
    goto LABEL_34;
  if ((a3 & 1) != 0)
  {
    sub_23A24B6E8();
  }
  else
  {
    if (v13 > v12)
    {
      sub_23A24D6EC();
      goto LABEL_34;
    }
    sub_23A24DE60();
  }
  v14 = *v4;
  sub_23A25157C();
  sub_23A247738();
  v15 = sub_23A2515AC();
  v16 = -1 << *(_BYTE *)(v14 + 32);
  a2 = v15 & ~v16;
  if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v17 = ~v16;
    v18 = *(_QWORD *)(v9 + 72);
    do
    {
      sub_23A242A40(*(_QWORD *)(v14 + 48) + v18 * a2, (uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v11 == *(_DWORD *)a1)
      {
        v19 = *((_QWORD *)v11 + 1) == *(_QWORD *)(a1 + 8) && *((_QWORD *)v11 + 2) == *(_QWORD *)(a1 + 16);
        if ((v19 || (sub_23A251564() & 1) != 0) && (sub_23A2513CC() & 1) != 0)
        {
          v20 = v8[7];
          v21 = *(_QWORD *)&v11[v20];
          v22 = *(_QWORD *)&v11[v20 + 8];
          v23 = (_QWORD *)(a1 + v20);
          v24 = v21 == *v23 && v22 == v23[1];
          if (v24 || (sub_23A251564() & 1) != 0)
          {
            v25 = v8[8];
            v26 = *(_QWORD *)&v11[v25];
            v27 = *(_QWORD *)&v11[v25 + 8];
            v28 = (_QWORD *)(a1 + v25);
            v29 = v26 == *v28 && v27 == v28[1];
            if ((v29 || (sub_23A251564() & 1) != 0) && *(_DWORD *)&v11[v8[9]] == *(_DWORD *)(a1 + v8[9]))
            {
              if ((v30 = v8[10],
                    v31 = *(_QWORD *)&v11[v30],
                    v32 = *(_QWORD *)&v11[v30 + 8],
                    v33 = (_QWORD *)(a1 + v30),
                    v31 == *v33)
                && v32 == v33[1]
                || (sub_23A251564() & 1) != 0)
              {
                if (v11[v8[11]] == *(_BYTE *)(a1 + v8[11]))
                  goto LABEL_37;
              }
            }
          }
        }
      }
      sub_23A242A04((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      a2 = (a2 + 1) & v17;
    }
    while (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_34:
  v34 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23A242A84(a1, *(_QWORD *)(v34 + 48) + *(_QWORD *)(v39 + 72) * a2, type metadata accessor for LibSystemUserRecord);
  v36 = *(_QWORD *)(v34 + 16);
  v37 = __OFADD__(v36, 1);
  v38 = v36 + 1;
  if (!v37)
  {
    *(_QWORD *)(v34 + 16) = v38;
    return result;
  }
  __break(1u);
LABEL_37:
  sub_23A242A04((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
  result = sub_23A251570();
  __break(1u);
  return result;
}

uint64_t sub_23A24CE20(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _BYTE v29[72];

  v7 = type metadata accessor for LibSystemGroupRecord(0);
  v28 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v27 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_21;
  if ((a3 & 1) != 0)
  {
    sub_23A24BE90();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23A24D8F8(type metadata accessor for LibSystemGroupRecord, &qword_2569563F0);
      goto LABEL_21;
    }
    sub_23A24E584();
  }
  v12 = *v3;
  sub_23A25157C();
  sub_23A2515A0();
  swift_bridgeObjectRetain();
  sub_23A25142C();
  swift_bridgeObjectRelease();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v26 = *(int *)(v7 + 28);
  v13 = *(_QWORD *)(a1 + v26);
  swift_bridgeObjectRetain();
  sub_23A242138((uint64_t)v29, v13);
  swift_bridgeObjectRelease();
  v25 = *(int *)(v7 + 32);
  sub_23A251594();
  v14 = sub_23A2515AC();
  v15 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v28 + 72);
    while (1)
    {
      sub_23A242A40(*(_QWORD *)(v12 + 48) + v17 * a2, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a1)
      {
        v18 = *((_QWORD *)v9 + 1) == *(_QWORD *)(a1 + 8) && *((_QWORD *)v9 + 2) == *(_QWORD *)(a1 + 16);
        if ((v18 || (sub_23A251564() & 1) != 0)
          && (sub_23A2513CC() & 1) != 0
          && (sub_23A242DA0(*(_QWORD *)&v9[*(int *)(v7 + 28)], *(_QWORD *)(a1 + v26)) & 1) != 0
          && v9[*(int *)(v7 + 32)] == *(_BYTE *)(a1 + v25))
        {
          break;
        }
      }
      sub_23A242A04((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      a2 = (a2 + 1) & v16;
      if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_21;
    }
    sub_23A242A04((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
    sub_23A251570();
    __break(1u);
  }
LABEL_21:
  v19 = *v27;
  *(_QWORD *)(*v27 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23A242A84(a1, *(_QWORD *)(v19 + 48) + *(_QWORD *)(v28 + 72) * a2, type metadata accessor for LibSystemGroupRecord);
  v21 = *(_QWORD *)(v19 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v23;
  return result;
}

uint64_t sub_23A24D11C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __int128 v31[4];

  v7 = (int *)type metadata accessor for Group();
  v8 = *((_QWORD *)v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(*v3 + 16);
  v12 = *(_QWORD *)(*v3 + 24);
  v28 = v8;
  v29 = v3;
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_20;
  if ((a3 & 1) != 0)
  {
    sub_23A24C210();
  }
  else
  {
    if (v12 > v11)
    {
      sub_23A24D8F8((uint64_t (*)(_QWORD))type metadata accessor for Group, &qword_2569567A8);
      goto LABEL_20;
    }
    sub_23A24E8C0();
  }
  v13 = *v3;
  sub_23A25157C();
  sub_23A2513FC();
  sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A251408();
  v30 = v7[5];
  sub_23A2515A0();
  v14 = (_QWORD *)(a1 + v7[6]);
  sub_23A25142C();
  v27 = v7[7];
  sub_23A241E74(v31, *(_QWORD *)(a1 + v27));
  v15 = sub_23A2515AC();
  v16 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v15 & ~v16;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v17 = ~v16;
    v18 = *(_QWORD *)(v8 + 72);
    do
    {
      sub_23A242A40(*(_QWORD *)(v13 + 48) + v18 * a2, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      if ((sub_23A2513CC() & 1) != 0 && *(_DWORD *)&v10[v7[5]] == *(_DWORD *)(a1 + v30))
      {
        v19 = &v10[v7[6]];
        v20 = *(_QWORD *)v19 == *v14 && *((_QWORD *)v19 + 1) == v14[1];
        if ((v20 || (sub_23A251564() & 1) != 0)
          && (sub_23A243024(*(_QWORD *)&v10[v7[7]], *(_QWORD *)(a1 + v27)) & 1) != 0)
        {
          goto LABEL_23;
        }
      }
      sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      a2 = (a2 + 1) & v17;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_20:
  v21 = *v29;
  *(_QWORD *)(*v29 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23A242A84(a1, *(_QWORD *)(v21 + 48) + *(_QWORD *)(v28 + 72) * a2, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_23:
  sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  result = sub_23A251570();
  __break(1u);
  return result;
}

uint64_t sub_23A24D3D0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23A24C55C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23A24DB10();
      goto LABEL_22;
    }
    sub_23A24EBC8();
  }
  v11 = *v4;
  sub_23A25157C();
  sub_23A25142C();
  result = sub_23A2515AC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23A251564(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23A251570();
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
          result = sub_23A251564();
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

void sub_23A24D568(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, void (*a5)(_QWORD))
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_23A24C838(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_23A24DCC0(a4);
      goto LABEL_14;
    }
    sub_23A24EE74(v11, a4);
  }
  v12 = *v5;
  v13 = sub_23A25145C();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    a5(0);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_23A251468();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_23A251570();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_23A251468();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

void *sub_23A24D6EC()
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
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for LibSystemUserRecord(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F8);
  v6 = *v0;
  v7 = sub_23A2514BC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v25 = v1;
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
      goto LABEL_26;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_26;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
        break;
    }
LABEL_25:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_23A242A40(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5, type metadata accessor for LibSystemUserRecord);
    result = (void *)sub_23A242A84((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20, type metadata accessor for LibSystemUserRecord);
  }
  v23 = v21 + 2;
  if (v23 >= v17)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_26;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23A24D8F8(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *result;
  uint64_t v14;
  unint64_t v15;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;

  v5 = v2;
  v6 = a1(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v28 - v8;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v10 = *v2;
  v11 = sub_23A2514BC();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v5 = v12;
    return result;
  }
  v29 = v5;
  result = (void *)(v11 + 56);
  v14 = v10 + 56;
  v15 = (unint64_t)((1 << *(_BYTE *)(v12 + 32)) + 63) >> 6;
  if (v12 != v10 || (unint64_t)result >= v10 + 56 + 8 * v15)
    result = memmove(result, (const void *)(v10 + 56), 8 * v15);
  v17 = 0;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v10 + 16);
  v18 = 1 << *(_BYTE *)(v10 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & *(_QWORD *)(v10 + 56);
  v21 = (unint64_t)(v18 + 63) >> 6;
  while (1)
  {
    if (v20)
    {
      v22 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v23 = v22 | (v17 << 6);
      goto LABEL_12;
    }
    v25 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v25 >= v21)
      goto LABEL_28;
    v26 = *(_QWORD *)(v14 + 8 * v25);
    ++v17;
    if (!v26)
    {
      v17 = v25 + 1;
      if (v25 + 1 >= v21)
        goto LABEL_28;
      v26 = *(_QWORD *)(v14 + 8 * v17);
      if (!v26)
      {
        v17 = v25 + 2;
        if (v25 + 2 >= v21)
          goto LABEL_28;
        v26 = *(_QWORD *)(v14 + 8 * v17);
        if (!v26)
          break;
      }
    }
LABEL_27:
    v20 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_12:
    v24 = *(_QWORD *)(v7 + 72) * v23;
    sub_23A242A40(*(_QWORD *)(v10 + 48) + v24, (uint64_t)v9, a1);
    result = (void *)sub_23A242A84((uint64_t)v9, *(_QWORD *)(v12 + 48) + v24, a1);
  }
  v27 = v25 + 3;
  if (v27 >= v21)
  {
LABEL_28:
    result = (void *)swift_release();
    v5 = v29;
    goto LABEL_30;
  }
  v26 = *(_QWORD *)(v14 + 8 * v27);
  if (v26)
  {
    v17 = v27;
    goto LABEL_27;
  }
  while (1)
  {
    v17 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v17 >= v21)
      goto LABEL_28;
    v26 = *(_QWORD *)(v14 + 8 * v17);
    ++v27;
    if (v26)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_23A24DB10()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256956798);
  v2 = *v0;
  v3 = sub_23A2514BC();
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

id sub_23A24DCC0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23A2514BC();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A24DE60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for LibSystemUserRecord(0);
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F8);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_23:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v22 = v0;
  v23 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v24 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  v26 = v5;
  swift_retain();
  v13 = 0;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v13 << 6);
      result = v26;
      goto LABEL_7;
    }
    v19 = v13 + 1;
    result = v26;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v24)
      goto LABEL_21;
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v13;
    if (!v20)
    {
      v13 = v19 + 1;
      if (v19 + 1 >= v24)
        goto LABEL_21;
      v20 = *(_QWORD *)(v23 + 8 * v13);
      if (!v20)
        break;
    }
LABEL_20:
    v11 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_7:
    v17 = *(_QWORD *)(v25 + 72);
    sub_23A242A40(*(_QWORD *)(result + 48) + v17 * v15, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
    sub_23A25157C();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A251594();
    sub_23A2515AC();
    v18 = sub_23A251480();
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v18 * v17, type metadata accessor for LibSystemUserRecord);
    ++*(_QWORD *)(v7 + 16);
  }
  v21 = v19 + 2;
  if (v21 >= v24)
  {
LABEL_21:
    result = swift_release_n();
    v1 = v22;
    goto LABEL_23;
  }
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v13 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v13 >= v24)
      goto LABEL_21;
    v20 = *(_QWORD *)(v23 + 8 * v13);
    ++v21;
    if (v20)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A24E1DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for User();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563E8);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_25:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v22 = v0;
  v23 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v24 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  v26 = v5;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v14 << 6);
      goto LABEL_7;
    }
    v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v24)
      goto LABEL_23;
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v14;
    if (!v20)
    {
      v14 = v19 + 1;
      if (v19 + 1 >= v24)
        goto LABEL_23;
      v20 = *(_QWORD *)(v23 + 8 * v14);
      if (!v20)
      {
        v14 = v19 + 2;
        if (v19 + 2 >= v24)
          goto LABEL_23;
        v20 = *(_QWORD *)(v23 + 8 * v14);
        if (!v20)
          break;
      }
    }
LABEL_22:
    v11 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_7:
    v17 = *(_QWORD *)(v25 + 72);
    sub_23A242A40(*(_QWORD *)(v26 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A25157C();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2515AC();
    v18 = sub_23A251480();
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v18 * v17, (uint64_t (*)(_QWORD))type metadata accessor for User);
    ++*(_QWORD *)(v7 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v24)
  {
LABEL_23:
    result = swift_release_n();
    v1 = v22;
    goto LABEL_25;
  }
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v14 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v14 >= v24)
      goto LABEL_23;
    v20 = *(_QWORD *)(v23 + 8 * v14);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23A24E584()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28[72];

  v1 = v0;
  v2 = type metadata accessor for LibSystemGroupRecord(0);
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569563F0);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_25:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v23 = v0;
  v24 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v25 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  v27 = v5;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v14 << 6);
      goto LABEL_7;
    }
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25)
      goto LABEL_23;
    v21 = *(_QWORD *)(v24 + 8 * v20);
    ++v14;
    if (!v21)
    {
      v14 = v20 + 1;
      if (v20 + 1 >= v25)
        goto LABEL_23;
      v21 = *(_QWORD *)(v24 + 8 * v14);
      if (!v21)
      {
        v14 = v20 + 2;
        if (v20 + 2 >= v25)
          goto LABEL_23;
        v21 = *(_QWORD *)(v24 + 8 * v14);
        if (!v21)
          break;
      }
    }
LABEL_22:
    v11 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_7:
    v17 = *(_QWORD *)(v26 + 72);
    sub_23A242A40(*(_QWORD *)(v27 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemGroupRecord);
    sub_23A25157C();
    sub_23A2515A0();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    v18 = *(_QWORD *)&v4[*(int *)(v2 + 28)];
    swift_bridgeObjectRetain();
    sub_23A242138((uint64_t)v28, v18);
    swift_bridgeObjectRelease();
    sub_23A251594();
    sub_23A2515AC();
    v19 = sub_23A251480();
    *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19 * v17, type metadata accessor for LibSystemGroupRecord);
    ++*(_QWORD *)(v7 + 16);
  }
  v22 = v20 + 3;
  if (v22 >= v25)
  {
LABEL_23:
    result = swift_release_n();
    v1 = v23;
    goto LABEL_25;
  }
  v21 = *(_QWORD *)(v24 + 8 * v22);
  if (v21)
  {
    v14 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v14 >= v25)
      goto LABEL_23;
    v21 = *(_QWORD *)(v24 + 8 * v14);
    ++v22;
    if (v21)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23A24E8C0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27[4];

  v1 = v0;
  v2 = type metadata accessor for Group();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569567A8);
  v6 = sub_23A2514C8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_25:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v22 = v0;
  v23 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v24 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 56;
  v26 = v5;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v14 << 6);
      goto LABEL_7;
    }
    v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v24)
      goto LABEL_23;
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v14;
    if (!v20)
    {
      v14 = v19 + 1;
      if (v19 + 1 >= v24)
        goto LABEL_23;
      v20 = *(_QWORD *)(v23 + 8 * v14);
      if (!v20)
      {
        v14 = v19 + 2;
        if (v19 + 2 >= v24)
          goto LABEL_23;
        v20 = *(_QWORD *)(v23 + 8 * v14);
        if (!v20)
          break;
      }
    }
LABEL_22:
    v11 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_7:
    v17 = *(_QWORD *)(v25 + 72);
    sub_23A242A40(*(_QWORD *)(v26 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    sub_23A25157C();
    sub_23A2513FC();
    sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A251408();
    sub_23A2515A0();
    sub_23A25142C();
    sub_23A241E74(v27, *(_QWORD *)&v4[*(int *)(v2 + 28)]);
    sub_23A2515AC();
    v18 = sub_23A251480();
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_23A242A84((uint64_t)v4, *(_QWORD *)(v7 + 48) + v18 * v17, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    ++*(_QWORD *)(v7 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v24)
  {
LABEL_23:
    result = swift_release_n();
    v1 = v22;
    goto LABEL_25;
  }
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v14 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v14 >= v24)
      goto LABEL_23;
    v20 = *(_QWORD *)(v23 + 8 * v14);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23A24EBC8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256956798);
  v3 = sub_23A2514C8();
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
    sub_23A25157C();
    swift_bridgeObjectRetain();
    sub_23A25142C();
    result = sub_23A2515AC();
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

uint64_t sub_23A24EE74(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_23A2514C8();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_23A25145C();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
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
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23A24F0E8(uint64_t isStackAllocationSafe, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(isStackAllocationSafe + 32);
  v6 = (unint64_t)((1 << v5) + 63) >> 6;
  v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    v8 = a2((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v6, v4);
    swift_release();
    if (v2)
      swift_willThrow();
  }
  else
  {
    v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    v8 = a2((char *)v9, v6, v4);
    swift_release();
    MEMORY[0x23B8460A0](v9, -1, -1);
  }
  return v8;
}

uint64_t sub_23A24F250(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  v22 = a2;
  v23 = a1;
  v4 = type metadata accessor for LibSystemGroupRecord(0);
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 0;
  v10 = *(_QWORD *)(a3 + 56);
  v24 = 0;
  v25 = a3 + 56;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v26 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v26)
      goto LABEL_24;
    v18 = *(_QWORD *)(v25 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v26)
        goto LABEL_24;
      v18 = *(_QWORD *)(v25 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v26)
          goto LABEL_24;
        v18 = *(_QWORD *)(v25 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_20:
    v13 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    sub_23A242A40(*(_QWORD *)(a3 + 48) + *(_QWORD *)(v5 + 72) * v15, (uint64_t)v8, type metadata accessor for LibSystemGroupRecord);
    v16 = v8[*(int *)(v4 + 32)];
    result = sub_23A242A04((uint64_t)v8, type metadata accessor for LibSystemGroupRecord);
    if (v16 == 1)
    {
      *(unint64_t *)((char *)v23 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_23A2417D8(v23, v22, v24, a3);
      }
    }
  }
  v19 = v17 + 3;
  if (v19 >= v26)
    goto LABEL_24;
  v18 = *(_QWORD *)(v25 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v26)
      goto LABEL_24;
    v18 = *(_QWORD *)(v25 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23A24F47C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  v22 = a2;
  v23 = a1;
  v4 = type metadata accessor for LibSystemUserRecord(0);
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 0;
  v10 = *(_QWORD *)(a3 + 56);
  v24 = 0;
  v25 = a3 + 56;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v26 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v26)
      goto LABEL_24;
    v18 = *(_QWORD *)(v25 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v26)
        goto LABEL_24;
      v18 = *(_QWORD *)(v25 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v26)
          goto LABEL_24;
        v18 = *(_QWORD *)(v25 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_20:
    v13 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    sub_23A242A40(*(_QWORD *)(a3 + 48) + *(_QWORD *)(v5 + 72) * v15, (uint64_t)v8, type metadata accessor for LibSystemUserRecord);
    v16 = v8[*(int *)(v4 + 44)];
    result = sub_23A242A04((uint64_t)v8, type metadata accessor for LibSystemUserRecord);
    if (v16 == 1)
    {
      *(unint64_t *)((char *)v23 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_23A241AE4(v23, v22, v24, a3);
      }
    }
  }
  v19 = v17 + 3;
  if (v19 >= v26)
    goto LABEL_24;
  v18 = *(_QWORD *)(v25 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v26)
      goto LABEL_24;
    v18 = *(_QWORD *)(v25 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

size_t sub_23A24F6A8(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_23A24F700(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_2569567C0, (uint64_t (*)(_QWORD))type metadata accessor for User);
  *v3 = result;
  return result;
}

size_t sub_23A24F6D4(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_23A24F700(a1, a2, a3, (_QWORD *)*v3, &qword_2569567B0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  *v3 = result;
  return result;
}

size_t sub_23A24F700(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(a6(0) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

uint64_t sub_23A24F874()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD aBlock[6];

  v0 = type metadata accessor for LibSystemUserRecord(0);
  v57 = *(_QWORD *)(v0 - 8);
  v58 = (int *)v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v56 = (uint64_t)&v50 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v55 = (uint64_t)&v50 - v6;
  v7 = type metadata accessor for User();
  v53 = *(_QWORD *)(v7 - 8);
  v54 = (int *)v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v60 = (uint64_t)&v50 - v11;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = MEMORY[0x24BEE4B08];
  v13 = (uint64_t *)(v12 + 16);
  aBlock[4] = sub_23A251334;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A249418;
  aBlock[3] = &block_descriptor_54;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v14);
  swift_beginAccess();
  v15 = *v13;
  swift_bridgeObjectRetain();
  swift_release();
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v61 = MEMORY[0x24BEE4AF8];
    sub_23A24F6A8(0, v16, 0);
    result = sub_23A24528C(v15);
    v18 = result;
    v20 = v19;
    v22 = v21 & 1;
    v51 = v15;
    v52 = v15 + 56;
    while ((v18 & 0x8000000000000000) == 0 && v18 < 1 << *(_BYTE *)(v15 + 32))
    {
      if (((*(_QWORD *)(v52 + (((unint64_t)v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
        goto LABEL_16;
      if (*(_DWORD *)(v15 + 36) != (_DWORD)v20)
        goto LABEL_17;
      v59 = v22;
      v23 = v55;
      sub_23A242A40(*(_QWORD *)(v15 + 48) + *(_QWORD *)(v57 + 72) * v18, v55, type metadata accessor for LibSystemUserRecord);
      v24 = v56;
      sub_23A242A84(v23, v56, type metadata accessor for LibSystemUserRecord);
      sub_23A242A40(v24, (uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      v25 = v58;
      v26 = &v3[v58[6]];
      v27 = sub_23A2513FC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v10, v26, v27);
      v29 = *((_QWORD *)v3 + 1);
      v28 = *((_QWORD *)v3 + 2);
      v30 = &v3[v25[7]];
      v31 = *(_QWORD *)v30;
      v32 = *((_QWORD *)v30 + 1);
      v33 = &v3[v25[8]];
      v34 = *(_QWORD *)v33;
      v35 = *((_QWORD *)v33 + 1);
      LODWORD(v33) = *(_DWORD *)&v3[v25[9]];
      v36 = &v3[v25[10]];
      v37 = *(_QWORD *)v36;
      v38 = *((_QWORD *)v36 + 1);
      v39 = v54;
      *(_DWORD *)&v10[v54[5]] = *(_DWORD *)v3;
      v40 = &v10[v39[6]];
      *(_QWORD *)v40 = v29;
      *((_QWORD *)v40 + 1) = v28;
      v41 = &v10[v39[7]];
      *(_QWORD *)v41 = v31;
      *((_QWORD *)v41 + 1) = v32;
      v42 = &v10[v39[8]];
      *(_QWORD *)v42 = v34;
      *((_QWORD *)v42 + 1) = v35;
      *(_DWORD *)&v10[v39[9]] = (_DWORD)v33;
      v43 = &v10[v39[10]];
      *(_QWORD *)v43 = v37;
      *((_QWORD *)v43 + 1) = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A242A04((uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      sub_23A242A84((uint64_t)v10, v60, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A242A04(v24, type metadata accessor for LibSystemUserRecord);
      v44 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23A24F6A8(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v44 = v61;
      }
      v46 = *(_QWORD *)(v44 + 16);
      v45 = *(_QWORD *)(v44 + 24);
      v15 = v51;
      if (v46 >= v45 >> 1)
      {
        sub_23A24F6A8(v45 > 1, v46 + 1, 1);
        v44 = v61;
      }
      *(_QWORD *)(v44 + 16) = v46 + 1;
      sub_23A242A84(v60, v44+ ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))+ *(_QWORD *)(v53 + 72) * v46, (uint64_t (*)(_QWORD))type metadata accessor for User);
      result = sub_23A245330(v18, v20, v59 & 1, v15);
      v18 = result;
      v20 = v47;
      v22 = v48 & 1;
      if (!--v16)
      {
        sub_23A2465DC(result, v47, v22);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v44 = MEMORY[0x24BEE4AF8];
LABEL_14:
    v49 = sub_23A250210(v44);
    swift_bridgeObjectRelease();
    return v49;
  }
  return result;
}

uint64_t sub_23A24FD00()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  int *v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD aBlock[6];

  v0 = type metadata accessor for LibSystemUserRecord(0);
  v58 = *(_QWORD *)(v0 - 8);
  v59 = (int *)v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v57 = (char *)&v52 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v56 = (uint64_t)&v52 - v6;
  v7 = type metadata accessor for User();
  v54 = *(_QWORD *)(v7 - 8);
  v55 = (int *)v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v61 = (uint64_t)&v52 - v11;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = MEMORY[0x24BEE4B08];
  v13 = (uint64_t *)(v12 + 16);
  aBlock[4] = sub_23A251334;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A249418;
  aBlock[3] = &block_descriptor_49;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v14);
  swift_beginAccess();
  v15 = *v13;
  swift_bridgeObjectRetain();
  swift_release();
  v16 = sub_23A24F0E8(v15, (uint64_t (*)(char *, unint64_t, uint64_t))sub_23A24F47C);
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
  {
    v62 = MEMORY[0x24BEE4AF8];
    sub_23A24F6A8(0, v17, 0);
    result = sub_23A24528C(v16);
    v19 = result;
    v21 = v20;
    v23 = v22 & 1;
    v52 = v16;
    v53 = v16 + 56;
    v24 = (uint64_t)v57;
    while ((v19 & 0x8000000000000000) == 0 && v19 < 1 << *(_BYTE *)(v16 + 32))
    {
      if (((*(_QWORD *)(v53 + (((unint64_t)v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        goto LABEL_16;
      if (*(_DWORD *)(v16 + 36) != (_DWORD)v21)
        goto LABEL_17;
      v60 = v23;
      v25 = *(_QWORD *)(v16 + 48) + *(_QWORD *)(v58 + 72) * v19;
      v26 = v56;
      sub_23A242A40(v25, v56, type metadata accessor for LibSystemUserRecord);
      sub_23A242A84(v26, v24, type metadata accessor for LibSystemUserRecord);
      sub_23A242A40(v24, (uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      v27 = v59;
      v28 = &v3[v59[6]];
      v29 = sub_23A2513FC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v10, v28, v29);
      v31 = *((_QWORD *)v3 + 1);
      v30 = *((_QWORD *)v3 + 2);
      v32 = &v3[v27[7]];
      v33 = *(_QWORD *)v32;
      v34 = *((_QWORD *)v32 + 1);
      v35 = &v3[v27[8]];
      v36 = *(_QWORD *)v35;
      v37 = *((_QWORD *)v35 + 1);
      LODWORD(v35) = *(_DWORD *)&v3[v27[9]];
      v38 = &v3[v27[10]];
      v39 = *(_QWORD *)v38;
      v40 = *((_QWORD *)v38 + 1);
      v41 = v55;
      *(_DWORD *)&v10[v55[5]] = *(_DWORD *)v3;
      v42 = &v10[v41[6]];
      *(_QWORD *)v42 = v31;
      *((_QWORD *)v42 + 1) = v30;
      v43 = &v10[v41[7]];
      *(_QWORD *)v43 = v33;
      *((_QWORD *)v43 + 1) = v34;
      v44 = &v10[v41[8]];
      *(_QWORD *)v44 = v36;
      *((_QWORD *)v44 + 1) = v37;
      *(_DWORD *)&v10[v41[9]] = (_DWORD)v35;
      v45 = &v10[v41[10]];
      *(_QWORD *)v45 = v39;
      *((_QWORD *)v45 + 1) = v40;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A242A04((uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      sub_23A242A84((uint64_t)v10, v61, (uint64_t (*)(_QWORD))type metadata accessor for User);
      sub_23A242A04(v24, type metadata accessor for LibSystemUserRecord);
      v46 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23A24F6A8(0, *(_QWORD *)(v46 + 16) + 1, 1);
        v46 = v62;
      }
      v48 = *(_QWORD *)(v46 + 16);
      v47 = *(_QWORD *)(v46 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_23A24F6A8(v47 > 1, v48 + 1, 1);
        v46 = v62;
      }
      *(_QWORD *)(v46 + 16) = v48 + 1;
      sub_23A242A84(v61, v46+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(_QWORD *)(v54 + 72) * v48, (uint64_t (*)(_QWORD))type metadata accessor for User);
      v16 = v52;
      result = sub_23A245330(v19, v21, v60 & 1, v52);
      v19 = result;
      v21 = v49;
      v23 = v50 & 1;
      if (!--v17)
      {
        sub_23A2465DC(result, v49, v23);
        swift_release();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_release();
    v46 = MEMORY[0x24BEE4AF8];
LABEL_14:
    v51 = sub_23A250210(v46);
    swift_bridgeObjectRelease();
    return v51;
  }
  return result;
}

uint64_t sub_23A2501A4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_23A2501C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A249334(a1, a2, v2, type metadata accessor for LibSystemGroupRecord, (void (*)(uint64_t))sub_23A242C68, (void (*)(char *, char *))sub_23A24AD60);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23A250210(uint64_t a1)
{
  int *v2;
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  BOOL v27;
  char *v28;
  BOOL v29;
  char *v30;
  BOOL v31;
  char *v32;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  BOOL v40;
  char *v41;
  BOOL v42;
  char *v43;
  BOOL v44;
  char *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v2 = (int *)type metadata accessor for User();
  v3 = *((_QWORD *)v2 - 1);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v50 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v50 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v50 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  sub_23A242394(&qword_2569567B8, v16, (uint64_t)&protocol conformance descriptor for User);
  v17 = sub_23A251450();
  v52 = v15;
  if (!v15)
    return v17;
  v18 = 0;
  v51 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v62 = *(_QWORD *)(v3 + 72);
  v53 = v12;
  while (1)
  {
    v57 = v18;
    sub_23A242A40(v51 + v62 * v18, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for User);
    sub_23A25157C();
    v19 = sub_23A2513FC();
    v20 = sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    swift_bridgeObjectRetain();
    v54 = v20;
    v55 = (_QWORD *)v19;
    sub_23A251408();
    v61 = v2[5];
    sub_23A2515A0();
    v21 = &v14[v2[6]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v60 = &v14[v2[7]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v59 = &v14[v2[8]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v58 = v2[9];
    sub_23A2515A0();
    v56 = &v14[v2[10]];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v22 = sub_23A2515AC();
    v23 = -1 << *(_BYTE *)(v17 + 32);
    v24 = v22 & ~v23;
    if (((*(_QWORD *)(v17 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) != 0)
    {
      v25 = ~v23;
      while (1)
      {
        sub_23A242A40(*(_QWORD *)(v17 + 48) + v24 * v62, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
        if ((sub_23A2513CC() & 1) != 0 && *(_DWORD *)&v6[v2[5]] == *(_DWORD *)&v14[v61])
        {
          v26 = &v6[v2[6]];
          v27 = *(_QWORD *)v26 == *(_QWORD *)v21 && *((_QWORD *)v26 + 1) == *((_QWORD *)v21 + 1);
          if (v27 || (sub_23A251564() & 1) != 0)
          {
            v28 = &v6[v2[7]];
            v29 = *(_QWORD *)v28 == *(_QWORD *)v60 && *((_QWORD *)v28 + 1) == *((_QWORD *)v60 + 1);
            if (v29 || (sub_23A251564() & 1) != 0)
            {
              v30 = &v6[v2[8]];
              v31 = *(_QWORD *)v30 == *(_QWORD *)v59 && *((_QWORD *)v30 + 1) == *((_QWORD *)v59 + 1);
              if ((v31 || (sub_23A251564() & 1) != 0) && *(_DWORD *)&v6[v2[9]] == *(_DWORD *)&v14[v58])
              {
                v32 = &v6[v2[10]];
                if (*(_QWORD *)v32 == *(_QWORD *)v56 && *((_QWORD *)v32 + 1) == *((_QWORD *)v56 + 1))
                  break;
                if ((sub_23A251564() & 1) != 0)
                  break;
              }
            }
          }
        }
        sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
        v24 = (v24 + 1) & v25;
        if (((*(_QWORD *)(v17 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) == 0)
          goto LABEL_28;
      }
      sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for User);
      goto LABEL_62;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = (uint64_t)v53;
    sub_23A242A40((uint64_t)v14, (uint64_t)v53, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v63 = v17;
    if (*(_QWORD *)(v17 + 24) > *(_QWORD *)(v17 + 16))
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23A24D8F8((uint64_t (*)(_QWORD))type metadata accessor for User, &qword_2569563E8);
      goto LABEL_60;
    }
    if (isUniquelyReferenced_nonNull_native)
      sub_23A24BAA0();
    else
      sub_23A24E1DC();
    v35 = v63;
    sub_23A25157C();
    sub_23A251408();
    v61 = v2[5];
    sub_23A2515A0();
    v60 = (char *)(v34 + v2[6]);
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v59 = (char *)(v34 + v2[7]);
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v58 = v34 + v2[8];
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v56 = (char *)v2[9];
    sub_23A2515A0();
    v55 = (_QWORD *)(v34 + v2[10]);
    swift_bridgeObjectRetain();
    sub_23A25142C();
    swift_bridgeObjectRelease();
    v36 = sub_23A2515AC();
    v37 = -1 << *(_BYTE *)(v35 + 32);
    v24 = v36 & ~v37;
    if (((*(_QWORD *)(v35 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) != 0)
      break;
    v34 = (uint64_t)v53;
LABEL_60:
    v17 = v63;
    *(_QWORD *)(v63 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v24;
    sub_23A242A84(v34, *(_QWORD *)(v17 + 48) + v24 * v62, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v46 = *(_QWORD *)(v17 + 16);
    v47 = __OFADD__(v46, 1);
    v48 = v46 + 1;
    if (v47)
    {
      __break(1u);
      goto LABEL_65;
    }
    *(_QWORD *)(v17 + 16) = v48;
LABEL_62:
    swift_bridgeObjectRelease();
    v18 = v57 + 1;
    sub_23A242A04((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for User);
    if (v18 == v52)
      return v17;
  }
  v38 = ~v37;
  v34 = (uint64_t)v53;
  while (1)
  {
    sub_23A242A40(*(_QWORD *)(v35 + 48) + v24 * v62, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for User);
    if ((sub_23A2513CC() & 1) != 0 && *(_DWORD *)&v9[v2[5]] == *(_DWORD *)(v34 + v61))
    {
      v39 = &v9[v2[6]];
      v40 = *(_QWORD *)v39 == *(_QWORD *)v60 && *((_QWORD *)v39 + 1) == *((_QWORD *)v60 + 1);
      if (v40 || (sub_23A251564() & 1) != 0)
      {
        v41 = &v9[v2[7]];
        v42 = *(_QWORD *)v41 == *(_QWORD *)v59 && *((_QWORD *)v41 + 1) == *((_QWORD *)v59 + 1);
        if (v42 || (sub_23A251564() & 1) != 0)
        {
          v43 = &v9[v2[8]];
          v44 = *(_QWORD *)v43 == *(_QWORD *)v58 && *((_QWORD *)v43 + 1) == *(_QWORD *)(v58 + 8);
          if ((v44 || (sub_23A251564() & 1) != 0) && *(_DWORD *)&v9[v2[9]] == *(_DWORD *)&v56[v34])
          {
            v45 = &v9[v2[10]];
            if (*(_QWORD *)v45 == *v55 && *((_QWORD *)v45 + 1) == v55[1])
              break;
            if ((sub_23A251564() & 1) != 0)
              break;
          }
        }
      }
    }
    sub_23A242A04((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v24 = (v24 + 1) & v38;
    if (((*(_QWORD *)(v35 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFF8)) >> v24) & 1) == 0)
      goto LABEL_60;
  }
LABEL_65:
  sub_23A242A04((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for User);
  result = sub_23A251570();
  __break(1u);
  return result;
}

uint64_t sub_23A2509B0(uint64_t a1)
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
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  BOOL v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  __int128 v35[4];

  v2 = type metadata accessor for Group();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v29 = (uint64_t)&v28 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  sub_23A242394(&qword_2569567A0, v12, (uint64_t)&protocol conformance descriptor for Group);
  v34 = (int *)v2;
  v13 = sub_23A251450();
  v31 = v11;
  if (v11)
  {
    v14 = 0;
    v30 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v15 = *(_QWORD *)(v3 + 72);
    do
    {
      v32 = v14;
      sub_23A242A40(v30 + v15 * v14, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A25157C();
      sub_23A2513FC();
      sub_23A242394(&qword_256956338, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      swift_bridgeObjectRetain();
      sub_23A251408();
      v18 = v34;
      v19 = v34[5];
      sub_23A2515A0();
      v20 = &v10[v18[6]];
      sub_23A25142C();
      v33 = v18[7];
      sub_23A241E74(v35, *(_QWORD *)&v10[v33]);
      v21 = sub_23A2515AC();
      v22 = -1 << *(_BYTE *)(v13 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v13 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        v24 = ~v22;
        while (1)
        {
          sub_23A242A40(*(_QWORD *)(v13 + 48) + v23 * v15, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
          if ((sub_23A2513CC() & 1) != 0 && *(_DWORD *)&v6[v34[5]] == *(_DWORD *)&v10[v19])
          {
            v25 = &v6[v34[6]];
            v26 = *(_QWORD *)v25 == *(_QWORD *)v20 && *((_QWORD *)v25 + 1) == *((_QWORD *)v20 + 1);
            if ((v26 || (sub_23A251564() & 1) != 0)
              && (sub_23A243024(*(_QWORD *)&v6[v34[7]], *(_QWORD *)&v10[v33]) & 1) != 0)
            {
              break;
            }
          }
          sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
          v23 = (v23 + 1) & v24;
          if (((*(_QWORD *)(v13 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            goto LABEL_3;
        }
        sub_23A242A04((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      }
      else
      {
LABEL_3:
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v17 = v29;
        sub_23A242A40((uint64_t)v10, v29, (uint64_t (*)(_QWORD))type metadata accessor for Group);
        *(_QWORD *)&v35[0] = v13;
        sub_23A24D11C(v17, v23, isUniquelyReferenced_nonNull_native);
        v13 = *(_QWORD *)&v35[0];
      }
      swift_bridgeObjectRelease();
      v14 = v32 + 1;
      sub_23A242A04((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    }
    while (v14 != v31);
  }
  return v13;
}

uint64_t sub_23A250CE0(unint64_t a1)
{
  return sub_23A250D18(a1, type metadata accessor for DDQUser, &qword_256956490, &qword_256956788);
}

uint64_t sub_23A250CFC(unint64_t a1)
{
  return sub_23A250D18(a1, type metadata accessor for DDQGroup, &qword_256956498, &qword_256956790);
}

uint64_t sub_23A250D18(unint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t *a4)
{
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void **v13;
  void *v14;
  id v15;
  uint64_t v16;

  v8 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A251558();
    swift_bridgeObjectRelease();
  }
  a2(0);
  sub_23A242394(a3, a2, MEMORY[0x24BEE5BD8]);
  result = sub_23A251450();
  v16 = result;
  if (v8)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23A251558();
    result = swift_bridgeObjectRelease();
    if (!v10)
      return v16;
  }
  else
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v10)
      return v16;
  }
  if (v10 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v10; ++i)
      {
        v12 = (void *)MEMORY[0x23B845D28](i, a1);
        sub_23A24B248(&v15, v12, (void (*)(_QWORD))a2, a4);

      }
    }
    else
    {
      v13 = (void **)(a1 + 32);
      do
      {
        v14 = *v13++;
        sub_23A24B248(&v15, v14, (void (*)(_QWORD))a2, a4);

        --v10;
      }
      while (v10);
    }
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t _s20DarwinDirectoryQuery5GroupV13mutableGroupsShyACGvgZ_0()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD aBlock[6];
  _QWORD v10[5];

  if (qword_256956330 != -1)
    swift_once();
  v10[3] = &type metadata for ProviderSideEffects;
  v10[4] = &off_250B32A58;
  v10[0] = swift_allocObject();
  sub_23A245CC0((uint64_t)&unk_256956760, v10[0] + 16);
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B08];
  v1 = (uint64_t *)(v0 + 16);
  aBlock[4] = sub_23A2501C8;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A249418;
  aBlock[3] = &block_descriptor_29;
  v2 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v2);
  swift_beginAccess();
  v3 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  v4 = sub_23A24F0E8(v3, (uint64_t (*)(char *, unint64_t, uint64_t))sub_23A24F250);
  MEMORY[0x24BDAC7A8](v4);
  v8[2] = v10;
  v5 = sub_23A249050((void (*)(uint64_t))sub_23A24662C, (uint64_t)v8, v4);
  swift_release();
  v6 = sub_23A2509B0(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v6;
}

uint64_t sub_23A251068(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_23A249AC8(a1, a2, v2, &qword_2569563E0, (void (*)(uint64_t))sub_23A242C68, type metadata accessor for LibSystemGroupRecord);
}

void DarwinDirectoryRecordStoreApplyWithUUIDFilter(uint64_t a1, const unsigned __int8 *a2, void *a3)
{
  id v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  *((_QWORD *)&v5 + 1) = 0;
  v6 = 0;
  uuid_copy((unsigned __int8 *)&v5 + 8, a2);
  DarwinDirectoryRecordStoreApplyWithFilter();

}

void DarwinDirectoryRecordStoreApplyWithIDFilter(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  DarwinDirectoryRecordStoreApplyWithFilter();

}

void sub_23A2511B8(uint64_t a1)
{
  uint64_t v1;

  sub_23A249BB4(a1, v1, (uint64_t)sub_23A251068, (uint64_t)&block_descriptor_23, 1u);
}

void DarwinDirectoryRecordStoreApplyWithNameFilter(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  DarwinDirectoryRecordStoreApplyWithFilter();

}

uint64_t sub_23A251270(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_23A249AC8(a1, a2, v2, &qword_2569564A0, (void (*)(uint64_t))sub_23A242B58, type metadata accessor for LibSystemUserRecord);
}

uint64_t sub_23A2512A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

void sub_23A2512E4(uint64_t a1)
{
  uint64_t v1;

  sub_23A249BB4(a1, v1, (uint64_t)sub_23A251270, (uint64_t)&block_descriptor_43, 0);
}

uint64_t sub_23A251310()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A251334(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A249334(a1, a2, v2, type metadata accessor for LibSystemUserRecord, (void (*)(uint64_t))sub_23A242B58, (void (*)(char *, char *))sub_23A24AA48);
}

uint64_t sub_23A2513C0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23A2513CC()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23A2513D8()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23A2513E4()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_23A2513F0()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_23A2513FC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A251408()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A251414()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A251420()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A25142C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A251438()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23A251444()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A251450()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23A25145C()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23A251468()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23A251474()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A251480()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23A25148C()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23A251498()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23A2514A4()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_23A2514B0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23A2514BC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A2514C8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A2514D4()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_23A2514E0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A2514EC()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_23A2514F8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A251504()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A251510()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A25151C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A251528()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A251534()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A251540()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A25154C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A251558()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A251564()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A251570()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A25157C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A251588()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A251594()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23A2515A0()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A2515AC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t DarwinDirectoryRecordStoreApply()
{
  return MEMORY[0x24BDAC460]();
}

uint64_t DarwinDirectoryRecordStoreApplyWithFilter()
{
  return MEMORY[0x24BDAC468]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

