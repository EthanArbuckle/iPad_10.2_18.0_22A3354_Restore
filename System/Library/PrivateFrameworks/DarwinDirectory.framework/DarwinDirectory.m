void sub_23A1E1808()
{
  qword_256950D40 = (uint64_t)&type metadata for LibSystemDarwinDirectoryProvider;
  *(_QWORD *)algn_256950D48 = &off_250B2E010;
}

uint64_t sub_23A1E1828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), void (*a5)(uint64_t), void (*a6)(char *, char *))
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
  return sub_23A1E2184((uint64_t)v15, a4);
}

uint64_t sub_23A1E190C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_23A1E1954@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, unint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  int64_t v48;

  v7 = a2(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (_DWORD *)((char *)&v42 - v12);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v42 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v20 = (_DWORD *)((char *)&v42 - v19);
  v21 = *(_QWORD *)(a1 + 56);
  v47 = (char *)(a1 + 56);
  v22 = *(_BYTE *)(a1 + 32);
  v23 = 1 << v22;
  v24 = -1;
  if (1 << v22 < 64)
    v24 = ~(-1 << (1 << v22));
  v25 = v24 & v21;
  if (v25)
  {
    v44 = a3;
    v45 = v17;
    v46 = v3;
    v26 = 0;
    v27 = __clz(__rbit64(v25));
    a3 = (v25 - 1) & v25;
    v48 = (unint64_t)(v23 + 63) >> 6;
    while (1)
    {
      v28 = *(_QWORD *)(a1 + 48);
      v43 = v18;
      v29 = *(_QWORD *)(v18 + 72);
      sub_23A1E21C0(v28 + v29 * v27, (uint64_t)v16, a2);
      sub_23A1E2204((uint64_t)v16, (uint64_t)v20, a2);
      swift_bridgeObjectRetain();
      v16 = v47;
      while (a3)
      {
        while (1)
        {
          v31 = __clz(__rbit64(a3));
          a3 &= a3 - 1;
          v32 = v31 | (v26 << 6);
LABEL_25:
          sub_23A1E21C0(*(_QWORD *)(a1 + 48) + v32 * v29, (uint64_t)v10, a2);
          sub_23A1E2204((uint64_t)v10, (uint64_t)v13, a2);
          if (*v20 < *v13)
            break;
          sub_23A1E2184((uint64_t)v13, a2);
          if (!a3)
            goto LABEL_9;
        }
        sub_23A1E2184((uint64_t)v20, a2);
        sub_23A1E2204((uint64_t)v13, (uint64_t)v20, a2);
      }
LABEL_9:
      v33 = v26 + 1;
      if (__OFADD__(v26, 1))
      {
        __break(1u);
LABEL_39:
        if (v30 < 9)
          return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v18 + 56))(a3, 1, 1);
        v38 = *(_QWORD *)(a1 + 88);
        if (v38)
        {
          v26 = 4;
          goto LABEL_32;
        }
        v38 = *(_QWORD *)(a1 + 96);
        if (v38)
        {
          v26 = 5;
          goto LABEL_32;
        }
      }
      else
      {
        if (v33 >= v48)
          goto LABEL_28;
        v34 = *(_QWORD *)&v16[8 * v33];
        ++v26;
        if (v34)
          goto LABEL_24;
        v26 = v33 + 1;
        if (v33 + 1 >= v48)
          goto LABEL_28;
        v34 = *(_QWORD *)&v16[8 * v26];
        if (v34)
          goto LABEL_24;
        v26 = v33 + 2;
        if (v33 + 2 >= v48)
          goto LABEL_28;
        v34 = *(_QWORD *)&v16[8 * v26];
        if (v34)
          goto LABEL_24;
        v26 = v33 + 3;
        if (v33 + 3 >= v48)
          goto LABEL_28;
        v34 = *(_QWORD *)&v16[8 * v26];
        if (v34)
          goto LABEL_24;
        v35 = v33 + 4;
        if (v35 >= v48)
        {
LABEL_28:
          swift_release();
          v36 = v44;
          sub_23A1E2204((uint64_t)v20, v44, a2);
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v36, 0, 1, v45);
        }
        v34 = *(_QWORD *)&v16[8 * v35];
        if (v34)
        {
          v26 = v35;
LABEL_24:
          a3 = (v34 - 1) & v34;
          v32 = __clz(__rbit64(v34)) + (v26 << 6);
          goto LABEL_25;
        }
        while (1)
        {
          v26 = v35 + 1;
          if (__OFADD__(v35, 1))
            break;
          if (v26 >= v48)
            goto LABEL_28;
          v34 = *(_QWORD *)&v16[8 * v26];
          ++v35;
          if (v34)
            goto LABEL_24;
        }
        __break(1u);
      }
      v39 = 0;
      v40 = 6;
      if (v48 > 6)
        v40 = v48;
      v41 = v40 - 6;
      do
      {
        if (v41 == v39)
          return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v18 + 56))(a3, 1, 1);
        v38 = *(_QWORD *)(a1 + 104 + 8 * v39++);
      }
      while (!v38);
      v26 = v39 + 5;
LABEL_32:
      a3 = (v38 - 1) & v38;
      v27 = __clz(__rbit64(v38)) + (v26 << 6);
    }
  }
  v30 = v22 & 0x3F;
  if (v30 > 6)
  {
    v48 = (unint64_t)(v23 + 63) >> 6;
    v38 = *(_QWORD *)(a1 + 64);
    if (v38)
    {
      v44 = a3;
      v45 = v17;
      v46 = v3;
      v26 = 1;
      goto LABEL_32;
    }
    if (v30 >= 8)
    {
      v38 = *(_QWORD *)(a1 + 72);
      v45 = v17;
      v46 = v3;
      v44 = a3;
      if (v38)
      {
        v26 = 2;
      }
      else
      {
        v38 = *(_QWORD *)(a1 + 80);
        if (!v38)
          goto LABEL_39;
        v26 = 3;
      }
      goto LABEL_32;
    }
  }
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v18 + 56))(a3, 1, 1);
}

uint64_t sub_23A1E1D38()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  _QWORD aBlock[6];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256950D58);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (int *)((char *)aBlock - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_256950D20 != -1)
    swift_once();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = MEMORY[0x24BEE4B08];
  v4 = (uint64_t *)(v3 + 16);
  aBlock[4] = sub_23A1E2154;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A1E190C;
  aBlock[3] = &block_descriptor_6;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v5);
  swift_beginAccess();
  v6 = *v4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_23A1E1954(v6, type metadata accessor for LibSystemUserRecord, (unint64_t)v2);
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for LibSystemUserRecord(0);
  result = (*(uint64_t (**)(int *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v2, 1, v7);
  if ((_DWORD)result != 1)
  {
    v9 = *v2;
    sub_23A1E2184((uint64_t)v2, type metadata accessor for LibSystemUserRecord);
    result = (v9 + 1);
    if (v9 != -1)
      return result;
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A1E1EF0()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  _QWORD aBlock[6];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256950D50);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (int *)((char *)aBlock - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_256950D20 != -1)
    swift_once();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = MEMORY[0x24BEE4B08];
  v4 = (uint64_t *)(v3 + 16);
  aBlock[4] = sub_23A1E210C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A1E190C;
  aBlock[3] = &block_descriptor;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v5);
  swift_beginAccess();
  v6 = *v4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_23A1E1954(v6, type metadata accessor for LibSystemGroupRecord, (unint64_t)v2);
  swift_bridgeObjectRelease();
  v7 = type metadata accessor for LibSystemGroupRecord(0);
  result = (*(uint64_t (**)(int *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v2, 1, v7);
  if ((_DWORD)result != 1)
  {
    v9 = *v2;
    sub_23A1E2184((uint64_t)v2, type metadata accessor for LibSystemGroupRecord);
    result = (v9 + 1);
    if (v9 != -1)
      return result;
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B844B44]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A1E20E8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A1E210C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A1E1828(a1, a2, v2, type metadata accessor for LibSystemGroupRecord, (void (*)(uint64_t))sub_23A1E241C, (void (*)(char *, char *))sub_23A1E5870);
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

uint64_t sub_23A1E2154(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A1E1828(a1, a2, v2, type metadata accessor for LibSystemUserRecord, (void (*)(uint64_t))sub_23A1E230C, (void (*)(char *, char *))sub_23A1E5558);
}

uint64_t sub_23A1E2184(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A1E21C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A1E2204(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A1E2254(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1E22CC(&qword_256950D60, type metadata accessor for LibSystemGroupRecord, (uint64_t)&unk_23A1EEFD4);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A1E2290(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1E22CC(&qword_256950D68, type metadata accessor for LibSystemUserRecord, (uint64_t)&unk_23A1EF03C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A1E22CC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B844B50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A1E230C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  *(_QWORD *)(a2 + 8) = sub_23A1EE85C();
  *(_QWORD *)(a2 + 16) = v4;
  v5 = (int *)type metadata accessor for LibSystemUserRecord(0);
  sub_23A1EE808();
  v6 = sub_23A1EE85C();
  v7 = (uint64_t *)(a2 + v5[7]);
  *v7 = v6;
  v7[1] = v8;
  v9 = sub_23A1EE85C();
  v10 = (uint64_t *)(a2 + v5[8]);
  *v10 = v9;
  v10[1] = v11;
  *(_DWORD *)(a2 + v5[9]) = *(_QWORD *)(a1 + 40);
  result = sub_23A1EE85C();
  v13 = (uint64_t *)(a2 + v5[10]);
  *v13 = result;
  v13[1] = v14;
  *(_BYTE *)(a2 + v5[11]) = *(_BYTE *)(a1 + 32);
  return result;
}

uint64_t sub_23A1E241C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  *(_QWORD *)(a2 + 8) = sub_23A1EE85C();
  *(_QWORD *)(a2 + 16) = v4;
  v5 = type metadata accessor for LibSystemGroupRecord(0);
  sub_23A1EE808();
  v6 = 0;
  *(_BYTE *)(a2 + *(int *)(v5 + 32)) = *(_BYTE *)(a1 + 32);
  v12 = MEMORY[0x24BEE4B08];
  while (1)
  {
    result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v6);
    if (!result)
      break;
    v8 = sub_23A1EE85C();
    sub_23A1E5BB0(&v11, v8, v9);
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

uint64_t sub_23A1E2704(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _OWORD *v8;
  _QWORD *v9;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;

  v5 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8]();
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (_OWORD *)(v2 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v8, (uint64_t)&v13);
  swift_dynamicCast();
  v9 = &v7[*(int *)(v5 + 36)];
  *v9 = a1;
  v9[1] = a2;
  swift_bridgeObjectRelease();
  v14 = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
  sub_23A1E2204((uint64_t)v7, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  sub_23A1EA9B4(&v13, v8);
  return swift_endAccess();
}

id sub_23A1E2860()
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
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t *boxed_opaque_existential_0;
  id v14;
  uint64_t v16;
  objc_super v17;
  _BYTE v18[32];

  v1 = type metadata accessor for Group();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v16 - v5;
  v7 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v0 + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC(v10, (uint64_t)v18);
  swift_dynamicCast();
  sub_23A1E21C0((uint64_t)&v9[*(int *)(v7 + 32)], (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  sub_23A1E2184((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for User);
  sub_23A1E21C0((uint64_t)v6, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v11 = (char *)objc_allocWithZone((Class)DDGroup);
  v12 = (uint64_t *)&v11[OBJC_IVAR___DDGroup__group];
  v12[3] = v1;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  sub_23A1E21C0((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v17.receiver = v11;
  v17.super_class = (Class)DDGroup;
  v14 = objc_msgSendSuper2(&v17, sel_init);
  sub_23A1E2184((uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  sub_23A1E2184((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  return v14;
}

void sub_23A1E2B74(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = sub_23A1EE844();
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

}

uint64_t sub_23A1E2BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _OWORD *v8;
  _QWORD *v9;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v12[24];
  __int128 v13;
  uint64_t v14;

  v5 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (_OWORD *)(v2 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v8, (uint64_t)&v13);
  swift_dynamicCast();
  v9 = &v7[*(int *)(v5 + 40)];
  *v9 = a1;
  v9[1] = a2;
  swift_bridgeObjectRelease();
  v14 = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
  sub_23A1E2204((uint64_t)v7, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  sub_23A1EA9B4(&v13, v8);
  return swift_endAccess();
}

uint64_t sub_23A1E2E70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _OWORD *v6;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v9[24];
  __int128 v10;
  uint64_t v11;

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = (_OWORD *)(v1 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v6, (uint64_t)&v10);
  swift_dynamicCast();
  *(_QWORD *)&v5[*(int *)(v3 + 48)] = a1;
  swift_bridgeObjectRelease();
  v11 = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v10);
  sub_23A1E2204((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  sub_23A1EA9B4(&v10, v6);
  return swift_endAccess();
}

uint64_t sub_23A1E2F98()
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
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  int64_t v16;
  int v17;
  int v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  unint64_t v37[4];

  v1 = type metadata accessor for Group();
  v34 = *(_QWORD *)(v1 - 8);
  v35 = v1;
  v2 = MEMORY[0x24BDAC7A8](v1);
  v33 = (uint64_t)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v29 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v32 = (uint64_t)&v29 - v7;
  v8 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v0 + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC(v11, (uint64_t)v37);
  swift_dynamicCast();
  v12 = *(_QWORD *)&v10[*(int *)(v8 + 44)];
  v13 = *(_QWORD *)(v12 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  if (v13)
  {
    v30 = v10;
    v37[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A1EE988();
    result = sub_23A1E9B50(v12);
    v16 = result;
    v18 = v17;
    v20 = v19 & 1;
    v31 = v12 + 56;
    while ((v16 & 0x8000000000000000) == 0 && v16 < 1 << *(_BYTE *)(v12 + 32))
    {
      if (((*(_QWORD *)(v31 + (((unint64_t)v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
        goto LABEL_11;
      if (*(_DWORD *)(v12 + 36) != v18)
        goto LABEL_12;
      v21 = v32;
      sub_23A1E21C0(*(_QWORD *)(v12 + 48) + *(_QWORD *)(v34 + 72) * v16, v32, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1E2204(v21, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v22 = v33;
      sub_23A1E21C0((uint64_t)v6, v33, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v23 = (char *)objc_allocWithZone((Class)DDGroup);
      v24 = (uint64_t *)&v23[OBJC_IVAR___DDGroup__group];
      v24[3] = v35;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v24);
      sub_23A1E21C0(v22, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v36.receiver = v23;
      v36.super_class = (Class)DDGroup;
      objc_msgSendSuper2(&v36, sel_init);
      sub_23A1E2184(v22, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1E2184((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1EE970();
      sub_23A1EE994();
      sub_23A1EE9A0();
      sub_23A1EE97C();
      result = sub_23A1E9BF0(v16, v18, v20 & 1, v12);
      v16 = result;
      v18 = v26;
      v20 = v27 & 1;
      if (!--v13)
      {
        sub_23A1EA988(result, v26, v27 & 1);
        v14 = v37[0];
        swift_bridgeObjectRelease();
        v10 = v30;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_9:
    sub_23A1E2184((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for User);
    v28 = sub_23A1EA140(v14);
    swift_bridgeObjectRelease();
    return v28;
  }
  return result;
}

uint64_t sub_23A1E32C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(__int128 *, _QWORD);
  uint64_t v35;
  _OWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *boxed_opaque_existential_0;
  _QWORD v40[2];
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  uint64_t v52;

  v2 = type metadata accessor for Group();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v42);
  v41 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v8 = sub_23A1EE904();
    if (v8)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
LABEL_23:
    v35 = sub_23A1EA29C(v12);
    swift_bridgeObjectRelease();
    v36 = (_OWORD *)(v40[1] + OBJC_IVAR___DDUser__user);
    swift_beginAccess();
    sub_23A1E38FC((uint64_t)v36, (uint64_t)&v51);
    v38 = (uint64_t)v41;
    v37 = v42;
    swift_dynamicCast();
    *(_QWORD *)(v38 + *(int *)(v37 + 44)) = v35;
    swift_bridgeObjectRelease();
    v52 = v37;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v51);
    sub_23A1E2204(v38, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    sub_23A1EA9B4(&v51, v36);
    return swift_endAccess();
  }
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_6;
LABEL_3:
  v47 = MEMORY[0x24BEE4AF8];
  sub_23A1E951C(0, v8 & ~(v8 >> 63), 0);
  if (v7)
  {
    result = sub_23A1EE8C8();
    v11 = 1;
  }
  else
  {
    result = sub_23A1E9F14(a1);
    v11 = v13 & 1;
  }
  v48 = result;
  v49 = v10;
  v50 = v11;
  if ((v8 & 0x8000000000000000) == 0)
  {
    v14 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0)
      v14 = a1;
    v45 = v14;
    v15 = 0x256950000;
    v46 = MEMORY[0x24BEE4AD8] + 8;
    v43 = a1;
    v44 = v5;
    do
    {
      while (1)
      {
        sub_23A1E9CD4(v48, v49, v50, a1);
        v29 = v28;
        v30 = (uint64_t)v28 + *(_QWORD *)(v15 + 3456);
        swift_beginAccess();
        sub_23A1E38FC(v30, (uint64_t)&v51);
        swift_dynamicCast();

        v31 = v47;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A1E951C(0, *(_QWORD *)(v31 + 16) + 1, 1);
          v31 = v47;
        }
        v33 = *(_QWORD *)(v31 + 16);
        v32 = *(_QWORD *)(v31 + 24);
        if (v33 >= v32 >> 1)
        {
          sub_23A1E951C(v32 > 1, v33 + 1, 1);
          v31 = v47;
        }
        *(_QWORD *)(v31 + 16) = v33 + 1;
        result = sub_23A1E2204((uint64_t)v5, v31+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v33, (uint64_t (*)(_QWORD))type metadata accessor for Group);
        if (v7)
          break;
        v16 = v48;
        v17 = v49;
        v18 = v50;
        v19 = sub_23A1E9BF0(v48, v49, v50, a1);
        v20 = v2;
        v21 = v19;
        v23 = v22;
        v24 = v3;
        v26 = v25;
        sub_23A1EA988(v16, v17, v18);
        v48 = v21;
        v49 = v23;
        v2 = v20;
        v7 = 0;
        v15 = 0x256950000uLL;
        v27 = v26 & 1;
        v3 = v24;
        a1 = v43;
        v5 = v44;
        v50 = v27;
        if (!--v8)
          goto LABEL_22;
      }
      if ((v50 & 1) == 0)
        goto LABEL_25;
      if (sub_23A1EE8E0())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256950DF8);
      v34 = (void (*)(__int128 *, _QWORD))sub_23A1EE88C();
      sub_23A1EE934();
      v34(&v51, 0);
      --v8;
    }
    while (v8);
LABEL_22:
    sub_23A1EA988(v48, v49, v50);
    swift_bridgeObjectRelease();
    v12 = v47;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

void DDUser.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t DDUser.isEqual(_:)(uint64_t a1)
{
  return sub_23A1E5108(a1, (uint64_t (*)(_QWORD))type metadata accessor for User, (void (*)(uint64_t))type metadata accessor for DDUser, &OBJC_IVAR___DDUser__user, (uint64_t (*)(_BYTE *, _BYTE *))_s15DarwinDirectory4UserV2eeoiySbAC_ACtFZ_0);
}

uint64_t sub_23A1E3860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256950D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1E38A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256950D70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DDUser(uint64_t a1)
{
  return sub_23A1EA8D4(a1, &qword_256950DB8);
}

uint64_t sub_23A1E38FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DDUser.hash.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7[4];

  v1 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = v0 + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_23A1E38FC(v4, (uint64_t)v7);
  swift_dynamicCast();
  sub_23A1EE9DC();
  User.hash(into:)(v7);
  v5 = sub_23A1EEA0C();
  sub_23A1E2184((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for User);
  return v5;
}

id sub_23A1E3B40(void *a1, uint64_t a2, void (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _BYTE v18[32];

  a3(0);
  MEMORY[0x24BDAC7A8]();
  v8 = v18 - v7 + 16;
  v9 = sub_23A1EE820();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  v13 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_23A1E38FC(v13, (uint64_t)v18);
  v14 = a1;
  swift_dynamicCast();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v8, v9);
  sub_23A1E2184((uint64_t)v8, (uint64_t (*)(_QWORD))a3);

  v15 = (void *)sub_23A1EE7F0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

uint64_t sub_23A1E3C98(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _BYTE v15[32];

  v7 = a3(0);
  MEMORY[0x24BDAC7A8]();
  v9 = v15 - v8 + 16;
  v10 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_23A1E38FC(v10, (uint64_t)v15);
  v11 = a1;
  swift_dynamicCast();
  v12 = *(unsigned int *)&v9[*(int *)(v7 + 20)];
  sub_23A1E2184((uint64_t)v9, a3);

  return v12;
}

void sub_23A1E3D88(char *a1, uint64_t a2, int a3, uint64_t (*a4)(_QWORD), _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  char *v12;
  char *v13;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;

  v9 = a4(0);
  MEMORY[0x24BDAC7A8]();
  v11 = &v15[-v10];
  v12 = &a1[*a5];
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v12, (uint64_t)&v16);
  v13 = a1;
  swift_dynamicCast();
  *(_DWORD *)&v11[*(int *)(v9 + 20)] = a3;
  v17 = v9;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v16);
  sub_23A1E2204((uint64_t)v11, (uint64_t)boxed_opaque_existential_0, a4);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  sub_23A1EA9B4(&v16, v12);
  swift_endAccess();

}

id sub_23A1E3EB8(void *a1, uint64_t a2, void (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _BYTE v14[32];

  a3(0);
  MEMORY[0x24BDAC7A8]();
  v8 = v14 - v7 + 16;
  v9 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_23A1E38FC(v9, (uint64_t)v14);
  v10 = a1;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A1E2184((uint64_t)v8, (uint64_t (*)(_QWORD))a3);

  v11 = (void *)sub_23A1EE838();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_23A1E3FD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _OWORD *v12;
  _QWORD *v13;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v16[24];
  __int128 v17;
  uint64_t v18;

  v9 = a3(0);
  MEMORY[0x24BDAC7A8]();
  v11 = &v16[-v10];
  v12 = (_OWORD *)(v4 + *a4);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v12, (uint64_t)&v17);
  swift_dynamicCast();
  v13 = &v11[*(int *)(v9 + 24)];
  *v13 = a1;
  v13[1] = a2;
  swift_bridgeObjectRelease();
  v18 = v9;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v17);
  sub_23A1E2204((uint64_t)v11, (uint64_t)boxed_opaque_existential_0, a3);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  sub_23A1EA9B4(&v17, v12);
  return swift_endAccess();
}

id sub_23A1E410C(void *a1, uint64_t a2, void (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _BYTE v14[32];

  a3(0);
  MEMORY[0x24BDAC7A8]();
  v8 = v14 - v7 + 16;
  v9 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_23A1E38FC(v9, (uint64_t)v14);
  v10 = a1;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_23A1E2184((uint64_t)v8, (uint64_t (*)(_QWORD))a3);

  v11 = (void *)sub_23A1EE838();
  swift_bridgeObjectRelease();
  return v11;
}

void sub_23A1E4228(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v10 = sub_23A1EE844();
  v12 = v11;
  v13 = a1;
  a6(v10, v12, a4, a5);

}

uint64_t sub_23A1E42A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _OWORD *v12;
  _QWORD *v13;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v16[24];
  __int128 v17;
  uint64_t v18;

  v9 = a3(0);
  MEMORY[0x24BDAC7A8]();
  v11 = &v16[-v10];
  v12 = (_OWORD *)(v4 + *a4);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v12, (uint64_t)&v17);
  swift_dynamicCast();
  v13 = &v11[*(int *)(v9 + 28)];
  *v13 = a1;
  v13[1] = a2;
  swift_bridgeObjectRelease();
  v18 = v9;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v17);
  sub_23A1E2204((uint64_t)v11, (uint64_t)boxed_opaque_existential_0, a3);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  sub_23A1EA9B4(&v17, v12);
  return swift_endAccess();
}

uint64_t sub_23A1E4534(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _OWORD *v6;
  uint64_t *boxed_opaque_existential_0;
  _BYTE v9[24];
  __int128 v10;
  uint64_t v11;

  v3 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = (_OWORD *)(v1 + OBJC_IVAR___DDGroup__group);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v6, (uint64_t)&v10);
  swift_dynamicCast();
  *(_QWORD *)&v5[*(int *)(v3 + 32)] = a1;
  swift_bridgeObjectRelease();
  v11 = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v10);
  sub_23A1E2204((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  sub_23A1EA9B4(&v10, v6);
  return swift_endAccess();
}

id sub_23A1E465C(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a1;
  a3();

  type metadata accessor for DDGroup(v5);
  sub_23A1EA948(&qword_256950DF0, v6, type metadata accessor for DDGroup, MEMORY[0x24BEE5BD8]);
  v7 = (void *)sub_23A1EE868();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_23A1E46D0()
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
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  int64_t v16;
  int v17;
  int v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t *v24;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;
  unint64_t v37[4];

  v1 = type metadata accessor for Group();
  v34 = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v33 = (uint64_t)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v29 - v5;
  v7 = MEMORY[0x24BDAC7A8](v4);
  v32 = (uint64_t)&v29 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - v9;
  v11 = v0 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_23A1E38FC(v11, (uint64_t)v37);
  swift_dynamicCast();
  v35 = v1;
  v12 = *(_QWORD *)&v10[*(int *)(v1 + 36)];
  v13 = *(_QWORD *)(v12 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  if (v13)
  {
    v30 = v10;
    v37[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A1EE988();
    result = sub_23A1E9B50(v12);
    v16 = result;
    v18 = v17;
    v20 = v19 & 1;
    v31 = v12 + 56;
    while ((v16 & 0x8000000000000000) == 0 && v16 < 1 << *(_BYTE *)(v12 + 32))
    {
      if (((*(_QWORD *)(v31 + (((unint64_t)v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
        goto LABEL_11;
      if (*(_DWORD *)(v12 + 36) != v18)
        goto LABEL_12;
      v21 = v32;
      sub_23A1E21C0(*(_QWORD *)(v12 + 48) + *(_QWORD *)(v34 + 72) * v16, v32, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1E2204(v21, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v22 = v33;
      sub_23A1E21C0((uint64_t)v6, v33, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v23 = (char *)objc_allocWithZone((Class)DDGroup);
      v24 = (uint64_t *)&v23[OBJC_IVAR___DDGroup__group];
      v24[3] = v35;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v24);
      sub_23A1E21C0(v22, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      v36.receiver = v23;
      v36.super_class = (Class)DDGroup;
      objc_msgSendSuper2(&v36, sel_init);
      sub_23A1E2184(v22, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1E2184((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1EE970();
      sub_23A1EE994();
      sub_23A1EE9A0();
      sub_23A1EE97C();
      result = sub_23A1E9BF0(v16, v18, v20 & 1, v12);
      v16 = result;
      v18 = v26;
      v20 = v27 & 1;
      if (!--v13)
      {
        sub_23A1EA988(result, v26, v27 & 1);
        v14 = v37[0];
        swift_bridgeObjectRelease();
        v10 = v30;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_9:
    sub_23A1E2184((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    v28 = sub_23A1EA140(v14);
    swift_bridgeObjectRelease();
    return v28;
  }
  return result;
}

void sub_23A1E49EC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  type metadata accessor for DDGroup((uint64_t)a1);
  sub_23A1EA948(&qword_256950DF0, v6, type metadata accessor for DDGroup, MEMORY[0x24BEE5BD8]);
  v7 = sub_23A1EE874();
  v8 = a1;
  a4(v7);

}

uint64_t sub_23A1E4A74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void (*v34)(__int128 *, _QWORD);
  uint64_t v35;
  _OWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  __int128 v50;
  uint64_t v51;

  v45 = type metadata accessor for Group();
  v2 = *(_QWORD *)(v45 - 8);
  v3 = MEMORY[0x24BDAC7A8](v45);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)&v40 - v6;
  v44 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v7 = sub_23A1EE904();
    v8 = 0x256950000;
    if (v7)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
LABEL_23:
    v35 = sub_23A1EA29C(v12);
    swift_bridgeObjectRelease();
    v36 = (_OWORD *)(v40 + *(_QWORD *)(v8 + 3456));
    swift_beginAccess();
    sub_23A1E38FC((uint64_t)v36, (uint64_t)&v50);
    v37 = (uint64_t)v41;
    v38 = v45;
    swift_dynamicCast();
    *(_QWORD *)(v37 + *(int *)(v38 + 36)) = v35;
    swift_bridgeObjectRelease();
    v51 = v38;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v50);
    sub_23A1E2204(v37, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    sub_23A1EA9B4(&v50, v36);
    return swift_endAccess();
  }
  v7 = *(_QWORD *)(a1 + 16);
  v8 = 0x256950000;
  if (!v7)
    goto LABEL_6;
LABEL_3:
  v46 = MEMORY[0x24BEE4AF8];
  sub_23A1E951C(0, v7 & ~(v7 >> 63), 0);
  if (v44)
  {
    result = sub_23A1EE8C8();
    v11 = 1;
  }
  else
  {
    result = sub_23A1E9F14(a1);
    v11 = v13 & 1;
  }
  v47 = result;
  v48 = v10;
  v49 = v11;
  if ((v7 & 0x8000000000000000) == 0)
  {
    v14 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0)
      v14 = a1;
    v43 = v14;
    v15 = MEMORY[0x24BEE4AD8] + 8;
    v42 = v5;
    do
    {
      while (1)
      {
        sub_23A1E9CD4(v47, v48, v49, a1);
        v29 = v28;
        v30 = (uint64_t)v28 + *(_QWORD *)(v8 + 3456);
        swift_beginAccess();
        sub_23A1E38FC(v30, (uint64_t)&v50);
        swift_dynamicCast();

        v31 = v46;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23A1E951C(0, *(_QWORD *)(v31 + 16) + 1, 1);
          v31 = v46;
        }
        v33 = *(_QWORD *)(v31 + 16);
        v32 = *(_QWORD *)(v31 + 24);
        if (v33 >= v32 >> 1)
        {
          sub_23A1E951C(v32 > 1, v33 + 1, 1);
          v31 = v46;
        }
        *(_QWORD *)(v31 + 16) = v33 + 1;
        result = sub_23A1E2204((uint64_t)v5, v31+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v33, (uint64_t (*)(_QWORD))type metadata accessor for Group);
        if (v44)
          break;
        v16 = v47;
        v17 = v48;
        v18 = v2;
        v19 = v49;
        v20 = v15;
        v21 = sub_23A1E9BF0(v47, v48, v49, a1);
        v22 = a1;
        v24 = v23;
        v26 = v25;
        v27 = v19;
        v2 = v18;
        v8 = 0x256950000uLL;
        sub_23A1EA988(v16, v17, v27);
        v47 = v21;
        v15 = v20;
        v48 = v24;
        a1 = v22;
        v5 = v42;
        v49 = v26 & 1;
        if (!--v7)
          goto LABEL_22;
      }
      if ((v49 & 1) == 0)
        goto LABEL_25;
      if (sub_23A1EE8E0())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256950DF8);
      v34 = (void (*)(__int128 *, _QWORD))sub_23A1EE88C();
      sub_23A1EE934();
      v34(&v50, 0);
      --v7;
    }
    while (v7);
LABEL_22:
    sub_23A1EA988(v47, v48, v49);
    swift_bridgeObjectRelease();
    v12 = v46;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

id _sSo6DDUserC15DarwinDirectoryEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void DDGroup.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t DDGroup.isEqual(_:)(uint64_t a1)
{
  return sub_23A1E5108(a1, (uint64_t (*)(_QWORD))type metadata accessor for Group, (void (*)(uint64_t))type metadata accessor for DDGroup, &OBJC_IVAR___DDGroup__group, (uint64_t (*)(_BYTE *, _BYTE *))_s15DarwinDirectory5GroupV2eeoiySbAC_ACtFZ_0);
}

uint64_t sub_23A1E5108(uint64_t a1, uint64_t (*a2)(_QWORD), void (*a3)(uint64_t), _QWORD *a4, uint64_t (*a5)(_BYTE *, _BYTE *))
{
  void *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _BYTE v23[24];
  void *v24;
  _BYTE v25[24];
  uint64_t v26;

  v11 = a2(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v16 = &v23[-v15];
  v17 = sub_23A1E3860(a1, (uint64_t)v25);
  if (!v26)
  {
    sub_23A1E38A8((uint64_t)v25);
    goto LABEL_6;
  }
  a3(v17);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    v21 = 0;
    return v21 & 1;
  }
  v18 = v24;
  if (v24 == v5)
  {

    v21 = 1;
  }
  else
  {
    v19 = (uint64_t)v5 + *a4;
    swift_beginAccess();
    sub_23A1E38FC(v19, (uint64_t)v25);
    swift_dynamicCast();
    v20 = (uint64_t)v18 + *a4;
    swift_beginAccess();
    sub_23A1E38FC(v20, (uint64_t)v25);
    swift_dynamicCast();
    v21 = a5(v16, v14);

    sub_23A1E2184((uint64_t)v14, a2);
    sub_23A1E2184((uint64_t)v16, a2);
  }
  return v21 & 1;
}

uint64_t sub_23A1E52D4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_23A1EE8B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_23A1E38A8((uint64_t)v10);
  return v8 & 1;
}

uint64_t DDGroup.hash.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9[4];

  v1 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = v0 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_23A1E38FC(v4, (uint64_t)v9);
  swift_dynamicCast();
  sub_23A1EE9DC();
  sub_23A1EE820();
  sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)&v3[*(int *)(v1 + 32)];
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v9, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)&v3[*(int *)(v1 + 36)];
  swift_bridgeObjectRetain();
  sub_23A1E9840(v9, v6);
  swift_bridgeObjectRelease();
  v7 = sub_23A1EEA0C();
  sub_23A1E2184((uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  return v7;
}

uint64_t sub_23A1E5558(uint64_t a1, uint64_t a2)
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
  sub_23A1EE9DC();
  swift_bridgeObjectRetain();
  sub_23A1EAA4C();
  v13 = sub_23A1EEA0C();
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
      sub_23A1E21C0(*(_QWORD *)(v12 + 48) + v17 * v15, (uint64_t)v10, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v10 == *(_DWORD *)a2)
      {
        v18 = *((_QWORD *)v10 + 1) == *(_QWORD *)(a2 + 8) && *((_QWORD *)v10 + 2) == *(_QWORD *)(a2 + 16);
        if ((v18 || (sub_23A1EE9C4() & 1) != 0) && (sub_23A1EE7FC() & 1) != 0)
        {
          v19 = v6[7];
          v20 = *(_QWORD *)&v10[v19];
          v21 = *(_QWORD *)&v10[v19 + 8];
          v22 = (_QWORD *)(a2 + v19);
          v23 = v20 == *v22 && v21 == v22[1];
          if (v23 || (sub_23A1EE9C4() & 1) != 0)
          {
            v24 = v6[8];
            v25 = *(_QWORD *)&v10[v24];
            v26 = *(_QWORD *)&v10[v24 + 8];
            v27 = (_QWORD *)(a2 + v24);
            v28 = v25 == *v27 && v26 == v27[1];
            if ((v28 || (sub_23A1EE9C4() & 1) != 0) && *(_DWORD *)&v10[v6[9]] == *(_DWORD *)(a2 + v6[9]))
            {
              if ((v29 = v6[10],
                    v30 = *(_QWORD *)&v10[v29],
                    v31 = *(_QWORD *)&v10[v29 + 8],
                    v32 = (_QWORD *)(a2 + v29),
                    v30 == *v32)
                && v31 == v32[1]
                || (sub_23A1EE9C4() & 1) != 0)
              {
                if (v10[v6[11]] == *(_BYTE *)(a2 + v6[11]))
                  break;
              }
            }
          }
        }
      }
      sub_23A1E2184((uint64_t)v10, type metadata accessor for LibSystemUserRecord);
      v15 = (v15 + 1) & v16;
      if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v36;
        a1 = v37;
        goto LABEL_29;
      }
    }
    sub_23A1E2184((uint64_t)v10, type metadata accessor for LibSystemUserRecord);
    swift_bridgeObjectRelease();
    sub_23A1E2184(a2, type metadata accessor for LibSystemUserRecord);
    sub_23A1E21C0(*(_QWORD *)(*v36 + 48) + v17 * v15, v37, type metadata accessor for LibSystemUserRecord);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_29:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = v38;
    sub_23A1E21C0(a2, v38, type metadata accessor for LibSystemUserRecord);
    v39 = *v3;
    *v3 = 0x8000000000000000;
    sub_23A1E7318(v34, v15, isUniquelyReferenced_nonNull_native);
    *v3 = v39;
    swift_bridgeObjectRelease();
    sub_23A1E2204(a2, a1, type metadata accessor for LibSystemUserRecord);
    return 1;
  }
}

uint64_t sub_23A1E5870(uint64_t a1, uint64_t a2)
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
  sub_23A1EE9DC();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v12 = a2 + v6[6];
  sub_23A1EE820();
  sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v29 = v12;
  sub_23A1EE82C();
  v28 = v6[7];
  v13 = *(_QWORD *)(a2 + v28);
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v30, v13);
  swift_bridgeObjectRelease();
  v27 = v6[8];
  sub_23A1EE9F4();
  v14 = sub_23A1EEA0C();
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
      sub_23A1E21C0(*(_QWORD *)(v11 + 48) + v18 * v16, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a2)
      {
        v19 = *((_QWORD *)v9 + 1) == *(_QWORD *)(a2 + 8) && *((_QWORD *)v9 + 2) == *(_QWORD *)(a2 + 16);
        if ((v19 || (sub_23A1EE9C4() & 1) != 0)
          && (sub_23A1EE7FC() & 1) != 0
          && (sub_23A1EAF40(*(_QWORD *)&v9[v6[7]], *(_QWORD *)(a2 + v28)) & 1) != 0
          && v9[v6[8]] == *(_BYTE *)(a2 + v27))
        {
          sub_23A1E2184((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
          swift_bridgeObjectRelease();
          sub_23A1E2184(a2, type metadata accessor for LibSystemGroupRecord);
          sub_23A1E21C0(*(_QWORD *)(*v23 + 48) + v18 * v16, v24, type metadata accessor for LibSystemGroupRecord);
          return 0;
        }
      }
      sub_23A1E2184((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
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
  sub_23A1E21C0(a2, v26, type metadata accessor for LibSystemGroupRecord);
  v30[0] = *v3;
  *v3 = 0x8000000000000000;
  sub_23A1E75FC(v22, v16, isUniquelyReferenced_nonNull_native);
  *v3 = v30[0];
  swift_bridgeObjectRelease();
  sub_23A1E2204(a2, a1, type metadata accessor for LibSystemGroupRecord);
  return 1;
}

uint64_t sub_23A1E5BB0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23A1EE9DC();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  v8 = sub_23A1EEA0C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23A1EE9C4() & 1) != 0)
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
      if (v19 || (sub_23A1EE9C4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23A1E78FC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23A1E5D5C(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_23A1EE910();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for DDGroup(v10);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_23A1EE904();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v22 = sub_23A1E5FD0(v7, result + 1);
    v28 = v22;
    if (*(_QWORD *)(v22 + 24) <= *(_QWORD *)(v22 + 16))
    {
      v26 = v8;
      sub_23A1E6C20();
      v23 = v28;
    }
    else
    {
      v23 = v22;
      v24 = v8;
    }
    sub_23A1E70E4((uint64_t)v8, v23);
    *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    v12 = sub_23A1EE898();
    v13 = -1 << *(_BYTE *)(v6 + 32);
    v14 = v12 & ~v13;
    if (((*(_QWORD *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      type metadata accessor for DDGroup(v12);
      v15 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v14);
      v16 = sub_23A1EE8A4();

      if ((v16 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v20 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v14);
        *a1 = v20;
        v21 = v20;
        return 0;
      }
      v17 = ~v13;
      while (1)
      {
        v14 = (v14 + 1) & v17;
        if (((*(_QWORD *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v14);
        v19 = sub_23A1EE8A4();

        if ((v19 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_23A1E7A94((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *v2 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_23A1E5FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256950E18);
    v2 = sub_23A1EE958();
    v15 = v2;
    sub_23A1EE8D4();
    v3 = sub_23A1EE928();
    if (v3)
    {
      type metadata accessor for DDGroup(v3);
      do
      {
        swift_dynamicCast();
        v2 = v15;
        if (*(_QWORD *)(v15 + 24) <= *(_QWORD *)(v15 + 16))
        {
          sub_23A1E6C20();
          v2 = v15;
        }
        result = sub_23A1EE898();
        v5 = v2 + 56;
        v6 = -1 << *(_BYTE *)(v2 + 32);
        v7 = result & ~v6;
        v8 = v7 >> 6;
        if (((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
        {
          v9 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v10 = 0;
          v11 = (unint64_t)(63 - v6) >> 6;
          do
          {
            if (++v8 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v12 = v8 == v11;
            if (v8 == v11)
              v8 = 0;
            v10 |= v12;
            v13 = *(_QWORD *)(v5 + 8 * v8);
          }
          while (v13 == -1);
          v9 = __clz(__rbit64(~v13)) + (v8 << 6);
        }
        *(_QWORD *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v9) = v14;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_23A1EE928());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_23A1E61B0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E30);
  v6 = sub_23A1EE94C();
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
      sub_23A1E2204(*(_QWORD *)(v17 + 48) + v18 * v16, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
      sub_23A1EE9DC();
      sub_23A1EEA00();
      swift_bridgeObjectRetain();
      sub_23A1EE850();
      swift_bridgeObjectRelease();
      sub_23A1EE820();
      sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23A1EE82C();
      swift_bridgeObjectRetain();
      sub_23A1EE850();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23A1EE850();
      swift_bridgeObjectRelease();
      sub_23A1EEA00();
      swift_bridgeObjectRetain();
      sub_23A1EE850();
      swift_bridgeObjectRelease();
      sub_23A1EE9F4();
      sub_23A1EEA0C();
      v19 = sub_23A1EE8BC();
      *(_QWORD *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      result = sub_23A1E2204((uint64_t)v4, *(_QWORD *)(v7 + 48) + v19 * v18, type metadata accessor for LibSystemUserRecord);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23A1E656C()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44[72];

  v1 = v0;
  v2 = type metadata accessor for LibSystemGroupRecord(0);
  v3 = *(_QWORD *)(v2 - 8);
  v42 = v2;
  v43 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E20);
  v7 = sub_23A1EE94C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_37;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v40 = (_QWORD *)(v6 + 56);
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v38 = v0;
  v39 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  v16 = type metadata accessor for LibSystemGroupRecord;
  v41 = v6;
  v17 = v42;
  while (1)
  {
    if (v12)
    {
      v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v20 = v19 | (v15 << 6);
      goto LABEL_22;
    }
    v21 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v21 >= v39)
      break;
    v22 = v40;
    v23 = v40[v21];
    ++v15;
    if (!v23)
    {
      v15 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_31;
      v23 = v40[v15];
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_31:
          swift_release();
          v1 = v38;
          goto LABEL_33;
        }
        v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            v15 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_39;
            if (v15 >= v39)
              goto LABEL_31;
            v23 = v40[v15];
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v15 = v24;
      }
    }
LABEL_21:
    v12 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v43 + 72);
    v26 = *(_QWORD *)(v6 + 48) + v25 * v20;
    v27 = v16;
    sub_23A1E2204(v26, (uint64_t)v5, v16);
    sub_23A1EE9DC();
    sub_23A1EEA00();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    sub_23A1EE820();
    sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A1EE82C();
    v28 = *(_QWORD *)&v5[*(int *)(v17 + 28)];
    swift_bridgeObjectRetain();
    sub_23A1E96AC((uint64_t)v44, v28);
    swift_bridgeObjectRelease();
    sub_23A1EE9F4();
    result = sub_23A1EEA0C();
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      v16 = v27;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      v16 = v27;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v31);
      }
      while (v35 == -1);
      v18 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v13 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_23A1E2204((uint64_t)v5, *(_QWORD *)(v8 + 48) + v18 * v25, v16);
    ++*(_QWORD *)(v8 + 16);
    v6 = v41;
  }
  swift_release();
  v1 = v38;
  v22 = v40;
LABEL_33:
  v36 = 1 << *(_BYTE *)(v6 + 32);
  if (v36 > 63)
    bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v36;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_37:
  result = swift_release();
  *v1 = v8;
  return result;
}

uint64_t sub_23A1E6944()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E28);
  v3 = sub_23A1EE94C();
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
      sub_23A1EE9DC();
      sub_23A1EE850();
      result = sub_23A1EEA0C();
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

uint64_t sub_23A1E6C20()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E18);
  v3 = sub_23A1EE94C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_23A1EE898();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23A1E6EBC()
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
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = type metadata accessor for Group();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E08);
  v7 = sub_23A1EE94C();
  if (*(_QWORD *)(v6 + 16))
  {
    v8 = 1 << *(_BYTE *)(v6 + 32);
    v9 = (_QWORD *)(v6 + 56);
    v10 = -1;
    if (v8 < 64)
      v10 = ~(-1 << v8);
    v11 = v10 & *(_QWORD *)(v6 + 56);
    v12 = (unint64_t)(v8 + 63) >> 6;
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
        v17 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v17 >= v12)
          goto LABEL_22;
        v18 = v9[v17];
        ++v14;
        if (!v18)
        {
          v14 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_22;
          v18 = v9[v14];
          if (!v18)
          {
            v14 = v17 + 2;
            if (v17 + 2 >= v12)
              goto LABEL_22;
            v18 = v9[v14];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_22:
                swift_release();
                v20 = 1 << *(_BYTE *)(v6 + 32);
                if (v20 > 63)
                  bzero((void *)(v6 + 56), ((unint64_t)(v20 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v9 = -1 << v20;
                *(_QWORD *)(v6 + 16) = 0;
                break;
              }
              v18 = v9[v19];
              if (!v18)
              {
                while (1)
                {
                  v14 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_28;
                  if (v14 >= v12)
                    goto LABEL_22;
                  v18 = v9[v14];
                  ++v19;
                  if (v18)
                    goto LABEL_21;
                }
              }
              v14 = v19;
            }
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }
      sub_23A1E2204(*(_QWORD *)(v6 + 48) + *(_QWORD *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      result = sub_23A1E7164((uint64_t)v5, v7);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

unint64_t sub_23A1E70E4(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_23A1EE898();
  result = sub_23A1EE8BC();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_23A1E7164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  __int128 v9[4];

  sub_23A1EE9DC();
  sub_23A1EE820();
  sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v4 = type metadata accessor for Group();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a1 + *(int *)(v4 + 32));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v9, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a1 + *(int *)(v4 + 36));
  swift_bridgeObjectRetain();
  sub_23A1E9840(v9, v6);
  swift_bridgeObjectRelease();
  sub_23A1EEA0C();
  v7 = sub_23A1EE8BC();
  *(_QWORD *)(a2 + 56 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v7;
  result = sub_23A1E2204(a1, *(_QWORD *)(a2 + 48) + *(_QWORD *)(*(_QWORD *)(v4 - 8) + 72) * v7, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_23A1E7318(uint64_t a1, unint64_t a2, char a3)
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
    sub_23A1E61B0();
  }
  else
  {
    if (v13 > v12)
    {
      sub_23A1E7F74(type metadata accessor for LibSystemUserRecord, &qword_256950E30);
      goto LABEL_34;
    }
    sub_23A1E86F0();
  }
  v14 = *v4;
  sub_23A1EE9DC();
  sub_23A1EAA4C();
  v15 = sub_23A1EEA0C();
  v16 = -1 << *(_BYTE *)(v14 + 32);
  a2 = v15 & ~v16;
  if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v17 = ~v16;
    v18 = *(_QWORD *)(v9 + 72);
    do
    {
      sub_23A1E21C0(*(_QWORD *)(v14 + 48) + v18 * a2, (uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v11 == *(_DWORD *)a1)
      {
        v19 = *((_QWORD *)v11 + 1) == *(_QWORD *)(a1 + 8) && *((_QWORD *)v11 + 2) == *(_QWORD *)(a1 + 16);
        if ((v19 || (sub_23A1EE9C4() & 1) != 0) && (sub_23A1EE7FC() & 1) != 0)
        {
          v20 = v8[7];
          v21 = *(_QWORD *)&v11[v20];
          v22 = *(_QWORD *)&v11[v20 + 8];
          v23 = (_QWORD *)(a1 + v20);
          v24 = v21 == *v23 && v22 == v23[1];
          if (v24 || (sub_23A1EE9C4() & 1) != 0)
          {
            v25 = v8[8];
            v26 = *(_QWORD *)&v11[v25];
            v27 = *(_QWORD *)&v11[v25 + 8];
            v28 = (_QWORD *)(a1 + v25);
            v29 = v26 == *v28 && v27 == v28[1];
            if ((v29 || (sub_23A1EE9C4() & 1) != 0) && *(_DWORD *)&v11[v8[9]] == *(_DWORD *)(a1 + v8[9]))
            {
              if ((v30 = v8[10],
                    v31 = *(_QWORD *)&v11[v30],
                    v32 = *(_QWORD *)&v11[v30 + 8],
                    v33 = (_QWORD *)(a1 + v30),
                    v31 == *v33)
                && v32 == v33[1]
                || (sub_23A1EE9C4() & 1) != 0)
              {
                if (v11[v8[11]] == *(_BYTE *)(a1 + v8[11]))
                  goto LABEL_37;
              }
            }
          }
        }
      }
      sub_23A1E2184((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      a2 = (a2 + 1) & v17;
    }
    while (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_34:
  v34 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23A1E2204(a1, *(_QWORD *)(v34 + 48) + *(_QWORD *)(v39 + 72) * a2, type metadata accessor for LibSystemUserRecord);
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
  sub_23A1E2184((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
  result = sub_23A1EE9D0();
  __break(1u);
  return result;
}

uint64_t sub_23A1E75FC(uint64_t a1, unint64_t a2, char a3)
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
    sub_23A1E656C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23A1E7F74(type metadata accessor for LibSystemGroupRecord, &qword_256950E20);
      goto LABEL_21;
    }
    sub_23A1E8A70();
  }
  v12 = *v3;
  sub_23A1EE9DC();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  sub_23A1EE820();
  sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v26 = *(int *)(v7 + 28);
  v13 = *(_QWORD *)(a1 + v26);
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v29, v13);
  swift_bridgeObjectRelease();
  v25 = *(int *)(v7 + 32);
  sub_23A1EE9F4();
  v14 = sub_23A1EEA0C();
  v15 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v28 + 72);
    while (1)
    {
      sub_23A1E21C0(*(_QWORD *)(v12 + 48) + v17 * a2, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a1)
      {
        v18 = *((_QWORD *)v9 + 1) == *(_QWORD *)(a1 + 8) && *((_QWORD *)v9 + 2) == *(_QWORD *)(a1 + 16);
        if ((v18 || (sub_23A1EE9C4() & 1) != 0)
          && (sub_23A1EE7FC() & 1) != 0
          && (sub_23A1EAF40(*(_QWORD *)&v9[*(int *)(v7 + 28)], *(_QWORD *)(a1 + v26)) & 1) != 0
          && v9[*(int *)(v7 + 32)] == *(_BYTE *)(a1 + v25))
        {
          break;
        }
      }
      sub_23A1E2184((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      a2 = (a2 + 1) & v16;
      if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_21;
    }
    sub_23A1E2184((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
    sub_23A1EE9D0();
    __break(1u);
  }
LABEL_21:
  v19 = *v27;
  *(_QWORD *)(*v27 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23A1E2204(a1, *(_QWORD *)(v19 + 48) + *(_QWORD *)(v28 + 72) * a2, type metadata accessor for LibSystemGroupRecord);
  v21 = *(_QWORD *)(v19 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v23;
  return result;
}

uint64_t sub_23A1E78FC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23A1E6944();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23A1E8178();
      goto LABEL_22;
    }
    sub_23A1E8E04();
  }
  v11 = *v4;
  sub_23A1EE9DC();
  sub_23A1EE850();
  result = sub_23A1EEA0C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23A1EE9C4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23A1EE9D0();
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
          result = sub_23A1EE9C4();
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

void sub_23A1E7A94(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23A1E6C20();
  }
  else
  {
    if (v7 > v6)
    {
      sub_23A1E8328();
      goto LABEL_14;
    }
    sub_23A1E90B0();
  }
  v8 = *v3;
  v9 = sub_23A1EE898();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    type metadata accessor for DDGroup(v9);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_23A1EE8A4();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_23A1EE9D0();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_23A1EE8A4();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

uint64_t sub_23A1E7C04(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  BOOL v22;
  char *v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int128 v37[4];

  v7 = (int *)type metadata accessor for Group();
  v8 = *((_QWORD *)v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(*v3 + 16);
  v12 = *(_QWORD *)(*v3 + 24);
  v34 = v8;
  v35 = v3;
  if (v12 > v11 && (a3 & 1) != 0)
    goto LABEL_26;
  if ((a3 & 1) != 0)
  {
    sub_23A1E6EBC();
  }
  else
  {
    if (v12 > v11)
    {
      sub_23A1E84D0();
      goto LABEL_26;
    }
    sub_23A1E9328();
  }
  v13 = *v3;
  sub_23A1EE9DC();
  sub_23A1EE820();
  sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v36 = v7[5];
  sub_23A1EEA00();
  v14 = (_QWORD *)(a1 + v7[6]);
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v33 = (_QWORD *)(a1 + v7[7]);
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v32 = v7[8];
  v15 = *(_QWORD *)(a1 + v32);
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v37, v15);
  swift_bridgeObjectRelease();
  v31 = v7[9];
  v16 = *(_QWORD *)(a1 + v31);
  swift_bridgeObjectRetain();
  sub_23A1E9840(v37, v16);
  swift_bridgeObjectRelease();
  v17 = sub_23A1EEA0C();
  v18 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v17 & ~v18;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v19 = ~v18;
    v20 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      sub_23A1E21C0(*(_QWORD *)(v13 + 48) + v20 * a2, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      if ((sub_23A1EE7FC() & 1) != 0 && *(_DWORD *)&v10[v7[5]] == *(_DWORD *)(a1 + v36))
      {
        v21 = &v10[v7[6]];
        v22 = *(_QWORD *)v21 == *v14 && *((_QWORD *)v21 + 1) == v14[1];
        if (v22 || (sub_23A1EE9C4() & 1) != 0)
        {
          v23 = &v10[v7[7]];
          v24 = *(_QWORD *)v23 == *v33 && *((_QWORD *)v23 + 1) == v33[1];
          if ((v24 || (sub_23A1EE9C4() & 1) != 0)
            && (sub_23A1EAF40(*(_QWORD *)&v10[v7[8]], *(_QWORD *)(a1 + v32)) & 1) != 0
            && (sub_23A1EB1C4(*(_QWORD *)&v10[v7[9]], *(_QWORD *)(a1 + v31)) & 1) != 0)
          {
            break;
          }
        }
      }
      sub_23A1E2184((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      a2 = (a2 + 1) & v19;
      if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_26;
    }
    sub_23A1E2184((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    sub_23A1EE9D0();
    __break(1u);
  }
LABEL_26:
  v25 = *v35;
  *(_QWORD *)(*v35 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23A1E2204(a1, *(_QWORD *)(v25 + 48) + *(_QWORD *)(v34 + 72) * a2, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v27 = *(_QWORD *)(v25 + 16);
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (v28)
    __break(1u);
  else
    *(_QWORD *)(v25 + 16) = v29;
  return result;
}

void *sub_23A1E7F74(uint64_t (*a1)(_QWORD), uint64_t *a2)
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
  v11 = sub_23A1EE940();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
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
      goto LABEL_30;
    }
    if (v25 >= v21)
      goto LABEL_26;
    v26 = *(_QWORD *)(v14 + 8 * v25);
    ++v17;
    if (!v26)
    {
      v17 = v25 + 1;
      if (v25 + 1 >= v21)
        goto LABEL_26;
      v26 = *(_QWORD *)(v14 + 8 * v17);
      if (!v26)
        break;
    }
LABEL_25:
    v20 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v17 << 6);
LABEL_12:
    v24 = *(_QWORD *)(v7 + 72) * v23;
    sub_23A1E21C0(*(_QWORD *)(v10 + 48) + v24, (uint64_t)v9, a1);
    result = (void *)sub_23A1E2204((uint64_t)v9, *(_QWORD *)(v12 + 48) + v24, a1);
  }
  v27 = v25 + 2;
  if (v27 >= v21)
  {
LABEL_26:
    result = (void *)swift_release();
    v5 = v29;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v14 + 8 * v27);
  if (v26)
  {
    v17 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v17 >= v21)
      goto LABEL_26;
    v26 = *(_QWORD *)(v14 + 8 * v17);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23A1E8178()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E28);
  v2 = *v0;
  v3 = sub_23A1EE940();
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

id sub_23A1E8328()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E18);
  v2 = *v0;
  v3 = sub_23A1EE940();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23A1E84D0()
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
  v2 = type metadata accessor for Group();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E08);
  v6 = *v0;
  v7 = sub_23A1EE940();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
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
      goto LABEL_32;
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
    sub_23A1E21C0(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    result = (void *)sub_23A1E2204((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20, (uint64_t (*)(_QWORD))type metadata accessor for Group);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
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
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_23A1E86F0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E30);
  v6 = sub_23A1EE94C();
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
    sub_23A1E21C0(*(_QWORD *)(result + 48) + v17 * v15, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
    sub_23A1EE9DC();
    sub_23A1EEA00();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    sub_23A1EE820();
    sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A1EE82C();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    sub_23A1EEA00();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    sub_23A1EE9F4();
    sub_23A1EEA0C();
    v18 = sub_23A1EE8BC();
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    sub_23A1E2204((uint64_t)v4, *(_QWORD *)(v7 + 48) + v18 * v17, type metadata accessor for LibSystemUserRecord);
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

uint64_t sub_23A1E8A70()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42[72];

  v1 = v0;
  v2 = type metadata accessor for LibSystemGroupRecord(0);
  v3 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  v41 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E20);
  v7 = sub_23A1EE94C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_33:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v36 = v0;
  v37 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v38 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  v16 = type metadata accessor for LibSystemGroupRecord;
  v39 = v6;
  v17 = v40;
  while (1)
  {
    if (v12)
    {
      v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v20 = v19 | (v15 << 6);
      goto LABEL_22;
    }
    v21 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v38)
      goto LABEL_31;
    v22 = *(_QWORD *)(v37 + 8 * v21);
    ++v15;
    if (!v22)
    {
      v15 = v21 + 1;
      if (v21 + 1 >= v38)
        goto LABEL_31;
      v22 = *(_QWORD *)(v37 + 8 * v15);
      if (!v22)
        break;
    }
LABEL_21:
    v12 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v15 << 6);
LABEL_22:
    v24 = *(_QWORD *)(v41 + 72);
    v25 = *(_QWORD *)(v6 + 48) + v24 * v20;
    v26 = v16;
    sub_23A1E21C0(v25, (uint64_t)v5, v16);
    sub_23A1EE9DC();
    sub_23A1EEA00();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    sub_23A1EE820();
    sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A1EE82C();
    v27 = *(_QWORD *)&v5[*(int *)(v17 + 28)];
    swift_bridgeObjectRetain();
    sub_23A1E96AC((uint64_t)v42, v27);
    swift_bridgeObjectRelease();
    sub_23A1EE9F4();
    result = sub_23A1EEA0C();
    v28 = -1 << *(_BYTE *)(v8 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v13 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v13 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      v16 = v26;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      v16 = v26;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v13 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v13 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_23A1E2204((uint64_t)v5, *(_QWORD *)(v8 + 48) + v18 * v24, v16);
    ++*(_QWORD *)(v8 + 16);
    v6 = v39;
  }
  v23 = v21 + 2;
  if (v23 >= v38)
  {
LABEL_31:
    result = swift_release_n();
    v1 = v36;
    goto LABEL_33;
  }
  v22 = *(_QWORD *)(v37 + 8 * v23);
  if (v22)
  {
    v15 = v23;
    goto LABEL_21;
  }
  while (1)
  {
    v15 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v15 >= v38)
      goto LABEL_31;
    v22 = *(_QWORD *)(v37 + 8 * v15);
    ++v23;
    if (v22)
      goto LABEL_21;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_23A1E8E04()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E28);
  v3 = sub_23A1EE94C();
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
    sub_23A1EE9DC();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    result = sub_23A1EEA0C();
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

uint64_t sub_23A1E90B0()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E18);
  v3 = sub_23A1EE94C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_23A1EE898();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23A1E9328()
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
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for Group();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E08);
  v7 = sub_23A1EE94C();
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_24:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v6 + 32);
  v9 = v6 + 56;
  v10 = -1;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  v11 = v10 & *(_QWORD *)(v6 + 56);
  v12 = (unint64_t)(v8 + 63) >> 6;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v12)
      goto LABEL_22;
    v18 = *(_QWORD *)(v9 + 8 * v17);
    ++v14;
    if (!v18)
    {
      v14 = v17 + 1;
      if (v17 + 1 >= v12)
        goto LABEL_22;
      v18 = *(_QWORD *)(v9 + 8 * v14);
      if (!v18)
      {
        v14 = v17 + 2;
        if (v17 + 2 >= v12)
          goto LABEL_22;
        v18 = *(_QWORD *)(v9 + 8 * v14);
        if (!v18)
          break;
      }
    }
LABEL_21:
    v11 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_6:
    sub_23A1E21C0(*(_QWORD *)(v6 + 48) + *(_QWORD *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    result = sub_23A1E7164((uint64_t)v5, v7);
  }
  v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_22:
    result = swift_release_n();
    goto LABEL_24;
  }
  v18 = *(_QWORD *)(v9 + 8 * v19);
  if (v18)
  {
    v14 = v19;
    goto LABEL_21;
  }
  while (1)
  {
    v14 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v14 >= v12)
      goto LABEL_22;
    v18 = *(_QWORD *)(v9 + 8 * v14);
    ++v19;
    if (v18)
      goto LABEL_21;
  }
LABEL_26:
  __break(1u);
  return result;
}

size_t sub_23A1E951C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_23A1E9538(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_23A1E9538(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950E10);
  v10 = *(_QWORD *)(type metadata accessor for Group() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for Group() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
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
  return (size_t)v13;
}

uint64_t sub_23A1E96AC(uint64_t a1, uint64_t a2)
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

  sub_23A1EEA0C();
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
      return sub_23A1EE9E8();
    }
    v13 = *(_QWORD *)(v3 + 8 * v10);
    if (!v13)
      break;
LABEL_16:
    v6 = (v13 - 1) & v13;
LABEL_5:
    sub_23A1EE9DC();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    v11 = sub_23A1EEA0C();
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

uint64_t sub_23A1E9840(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t result;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v28;
  int64_t v29;
  __int128 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[72];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v4 = type metadata accessor for Group();
  v33 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - v8;
  v10 = *((_QWORD *)a1 + 8);
  v11 = a1[1];
  v36 = *a1;
  v37 = v11;
  v12 = a1[2];
  v13 = a1[3];
  v30 = a1;
  v38 = v12;
  v39 = v13;
  v40 = v10;
  v32 = sub_23A1EEA0C();
  v14 = *(_QWORD *)(a2 + 56);
  v31 = a2 + 56;
  v15 = 1 << *(_BYTE *)(a2 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v18 = (unint64_t)(v15 + 63) >> 6;
  v34 = a2;
  result = swift_bridgeObjectRetain();
  v20 = 0;
  v21 = 0;
  while (1)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v21 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v21++, 1))
      goto LABEL_19;
    if (v21 >= v18)
    {
LABEL_17:
      swift_release();
      return sub_23A1EE9E8();
    }
    v28 = *(_QWORD *)(v31 + 8 * v21);
    if (!v28)
      break;
LABEL_16:
    v17 = (v28 - 1) & v28;
    v23 = __clz(__rbit64(v28)) + (v21 << 6);
LABEL_5:
    sub_23A1E21C0(*(_QWORD *)(v34 + 48) + *(_QWORD *)(v33 + 72) * v23, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    sub_23A1E2204((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    sub_23A1EE9DC();
    sub_23A1EE820();
    sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23A1EE82C();
    sub_23A1EEA00();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    v24 = *(_QWORD *)&v7[*(int *)(v4 + 32)];
    swift_bridgeObjectRetain();
    sub_23A1E96AC((uint64_t)v35, v24);
    swift_bridgeObjectRelease();
    v25 = *(_QWORD *)&v7[*(int *)(v4 + 36)];
    swift_bridgeObjectRetain();
    sub_23A1E9840(v35, v25);
    swift_bridgeObjectRelease();
    v26 = sub_23A1EEA0C();
    result = sub_23A1E2184((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    v20 ^= v26;
  }
  v29 = v21 + 1;
  if (v21 + 1 >= v18)
    goto LABEL_17;
  v28 = *(_QWORD *)(v31 + 8 * v29);
  if (v28)
  {
    ++v21;
    goto LABEL_16;
  }
  while (1)
  {
    v21 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v21 >= v18)
      goto LABEL_17;
    v28 = *(_QWORD *)(v31 + 8 * v21);
    ++v29;
    if (v28)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_23A1E9B50(uint64_t a1)
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

int64_t sub_23A1E9BF0(int64_t result, int a2, char a3, uint64_t a4)
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

void sub_23A1E9CD4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_23A1EE8EC() == *(_DWORD *)(a4 + 36))
      {
        v17 = sub_23A1EE8F8();
        type metadata accessor for DDGroup(v17);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v18;
        swift_unknownObjectRelease();
        v8 = sub_23A1EE898();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_23A1EE8A4();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_23A1EE8A4();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  v16 = MEMORY[0x23B84482C](a1, a2, v7);
  type metadata accessor for DDGroup(v16);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_23A1E9F14(uint64_t a1)
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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_23A1E9F9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v14[3];
  uint64_t v15;

  v3 = type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 64;
  v6 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 64;
  v9 = a1 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_23A1E38FC(v9, (uint64_t)v14);
  swift_dynamicCast();
  v10 = (_OWORD *)(v1 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_23A1E38FC((uint64_t)v10, (uint64_t)v14);
  swift_dynamicCast();
  sub_23A1EA9C8((uint64_t)v8, (uint64_t)&v5[*(int *)(v3 + 32)]);
  v15 = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  sub_23A1E2204((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  sub_23A1EA9B4(v14, v10);
  return swift_endAccess();
}

uint64_t sub_23A1EA140(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void **v8;
  void *v9;
  id v10;
  uint64_t v11;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A1EE9B8();
    a1 = swift_bridgeObjectRelease();
  }
  type metadata accessor for DDGroup(a1);
  sub_23A1EA948(&qword_256950DF0, v3, type metadata accessor for DDGroup, MEMORY[0x24BEE5BD8]);
  result = sub_23A1EE880();
  v11 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v5 = sub_23A1EE9B8();
    result = swift_bridgeObjectRelease();
    if (!v5)
      return v11;
  }
  else
  {
    v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
      return v11;
  }
  if (v5 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)MEMORY[0x23B844874](i, v1);
        sub_23A1E5D5C(&v10, v7);

      }
    }
    else
    {
      v8 = (void **)(v1 + 32);
      do
      {
        v9 = *v8++;
        sub_23A1E5D5C(&v10, v9);

        --v5;
      }
      while (v5);
    }
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A1EA29C(uint64_t a1)
{
  int *v2;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  BOOL v24;
  char *v25;
  BOOL v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  __int128 v39[4];

  v2 = (int *)type metadata accessor for Group();
  v3 = *((_QWORD *)v2 - 1);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v31 = (uint64_t)&v30 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  sub_23A1EA948(&qword_256950E00, 255, v12, (uint64_t)&protocol conformance descriptor for Group);
  v13 = sub_23A1EE880();
  v33 = v11;
  if (v11)
  {
    v14 = 0;
    v32 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v15 = *(_QWORD *)(v3 + 72);
    do
    {
      v34 = v14;
      sub_23A1E21C0(v32 + v15 * v14, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      sub_23A1EE9DC();
      sub_23A1EE820();
      sub_23A1EA948(&qword_256950D88, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      swift_bridgeObjectRetain();
      sub_23A1EE82C();
      v38 = v2[5];
      sub_23A1EEA00();
      v16 = &v10[v2[6]];
      swift_bridgeObjectRetain();
      sub_23A1EE850();
      swift_bridgeObjectRelease();
      v37 = &v10[v2[7]];
      swift_bridgeObjectRetain();
      sub_23A1EE850();
      swift_bridgeObjectRelease();
      v36 = v2[8];
      v17 = *(_QWORD *)&v10[v36];
      swift_bridgeObjectRetain();
      sub_23A1E96AC((uint64_t)v39, v17);
      swift_bridgeObjectRelease();
      v35 = v2[9];
      v18 = *(_QWORD *)&v10[v35];
      swift_bridgeObjectRetain();
      sub_23A1E9840(v39, v18);
      swift_bridgeObjectRelease();
      v19 = sub_23A1EEA0C();
      v20 = -1 << *(_BYTE *)(v13 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v13 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
      {
        v22 = ~v20;
        while (1)
        {
          sub_23A1E21C0(*(_QWORD *)(v13 + 48) + v21 * v15, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
          if ((sub_23A1EE7FC() & 1) != 0 && *(_DWORD *)&v6[v2[5]] == *(_DWORD *)&v10[v38])
          {
            v23 = &v6[v2[6]];
            v24 = *(_QWORD *)v23 == *(_QWORD *)v16 && *((_QWORD *)v23 + 1) == *((_QWORD *)v16 + 1);
            if (v24 || (sub_23A1EE9C4() & 1) != 0)
            {
              v25 = &v6[v2[7]];
              v26 = *(_QWORD *)v25 == *(_QWORD *)v37 && *((_QWORD *)v25 + 1) == *((_QWORD *)v37 + 1);
              if ((v26 || (sub_23A1EE9C4() & 1) != 0)
                && (sub_23A1EAF40(*(_QWORD *)&v6[v2[8]], *(_QWORD *)&v10[v36]) & 1) != 0
                && (sub_23A1EB1C4(*(_QWORD *)&v6[v2[9]], *(_QWORD *)&v10[v35]) & 1) != 0)
              {
                break;
              }
            }
          }
          sub_23A1E2184((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
          v21 = (v21 + 1) & v22;
          if (((*(_QWORD *)(v13 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
            goto LABEL_21;
        }
        sub_23A1E2184((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for Group);
      }
      else
      {
LABEL_21:
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v28 = v31;
        sub_23A1E21C0((uint64_t)v10, v31, (uint64_t (*)(_QWORD))type metadata accessor for Group);
        *(_QWORD *)&v39[0] = v13;
        sub_23A1E7C04(v28, v21, isUniquelyReferenced_nonNull_native);
        v13 = *(_QWORD *)&v39[0];
      }
      swift_bridgeObjectRelease();
      v14 = v34 + 1;
      sub_23A1E2184((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for Group);
    }
    while (v14 != v33);
  }
  return v13;
}

id sub_23A1EA68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t *v23;
  uint64_t *boxed_opaque_existential_0;
  id v25;
  uint64_t v27;
  objc_super v28;
  _BYTE v29[32];

  v10 = type metadata accessor for Group();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (int *)type metadata accessor for User();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a5 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_23A1E38FC(v16, (uint64_t)v29);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_dynamicCast();
  v17 = &v15[v13[9]];
  *(_QWORD *)v17 = 0x706D652F7261762FLL;
  *((_QWORD *)v17 + 1) = 0xEA00000000007974;
  v18 = &v15[v13[10]];
  strcpy(v18, "/usr/bin/false");
  v18[15] = -18;
  v19 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v15[v13[11]] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v15[v13[12]] = v19;
  sub_23A1EE814();
  *(_DWORD *)&v15[v13[5]] = sub_23A1E1D38();
  v20 = &v15[v13[6]];
  *(_QWORD *)v20 = a1;
  *((_QWORD *)v20 + 1) = a2;
  v21 = &v15[v13[7]];
  *(_QWORD *)v21 = a3;
  *((_QWORD *)v21 + 1) = a4;
  sub_23A1E2204((uint64_t)v12, (uint64_t)&v15[v13[8]], (uint64_t (*)(_QWORD))type metadata accessor for Group);
  v22 = (char *)objc_allocWithZone((Class)DDUser);
  v23 = (uint64_t *)&v22[OBJC_IVAR___DDUser__user];
  v23[3] = (uint64_t)v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v23);
  sub_23A1E21C0((uint64_t)v15, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(_QWORD))type metadata accessor for User);
  v28.receiver = v22;
  v28.super_class = (Class)DDUser;
  v25 = objc_msgSendSuper2(&v28, sel_init);
  sub_23A1E2184((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for User);
  return v25;
}

uint64_t type metadata accessor for DDGroup(uint64_t a1)
{
  return sub_23A1EA8D4(a1, &qword_256950DE8);
}

uint64_t sub_23A1EA8D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A1EA948(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B844B50](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A1EA988(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_OWORD *sub_23A1EA9B4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A1EA9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1EAA0C()
{
  return sub_23A1E22CC(&qword_256950E38, type metadata accessor for LibSystemGroupRecord, (uint64_t)&unk_23A1EF014);
}

uint64_t type metadata accessor for LibSystemGroupRecord(uint64_t a1)
{
  return sub_23A1EAF0C(a1, qword_256950F48);
}

uint64_t sub_23A1EAA4C()
{
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  type metadata accessor for LibSystemUserRecord(0);
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  return sub_23A1EE9F4();
}

uint64_t sub_23A1EAB9C()
{
  sub_23A1EE9DC();
  sub_23A1EAA4C();
  return sub_23A1EEA0C();
}

uint64_t sub_23A1EABDC()
{
  sub_23A1EE9DC();
  sub_23A1EAA4C();
  return sub_23A1EEA0C();
}

uint64_t sub_23A1EAC14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  sub_23A1EE9DC();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v1 = type metadata accessor for LibSystemGroupRecord(0);
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v2 = *(_QWORD *)(v0 + *(int *)(v1 + 28));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_23A1EE9F4();
  return sub_23A1EEA0C();
}

uint64_t sub_23A1EAD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v5 = *(_QWORD *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_23A1E96AC(a1, v5);
  swift_bridgeObjectRelease();
  return sub_23A1EE9F4();
}

uint64_t sub_23A1EADE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BYTE v6[72];

  sub_23A1EE9DC();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v4 = *(_QWORD *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  sub_23A1EE9F4();
  return sub_23A1EEA0C();
}

uint64_t sub_23A1EAECC()
{
  return sub_23A1E22CC(qword_256950E40, type metadata accessor for LibSystemUserRecord, (uint64_t)&unk_23A1EF07C);
}

uint64_t type metadata accessor for LibSystemUserRecord(uint64_t a1)
{
  return sub_23A1EAF0C(a1, qword_256950EA0);
}

uint64_t sub_23A1EAF0C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A1EAF40(uint64_t result, uint64_t a2)
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
    sub_23A1EE9DC();
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    v18 = sub_23A1EEA0C();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_39;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_23A1EE9C4() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_23A1EE9C4() & 1) != 0)
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

uint64_t sub_23A1EB1C4(uint64_t a1, uint64_t a2)
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
  uint64_t (*v22)(uint64_t);
  unint64_t i;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  BOOL v38;
  char *v39;
  BOOL v40;
  int64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  __int128 v51[5];

  v4 = (int *)type metadata accessor for Group();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v41 - v9;
  result = MEMORY[0x24BDAC7A8](v8);
  v14 = (char *)&v41 - v13;
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
  v22 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v44 = v12;
  v45 = a1;
  v42 = a1 + 56;
  v43 = v14;
  v41 = v20;
  if (!v19)
    goto LABEL_8;
LABEL_7:
  v46 = (v19 - 1) & v19;
  v47 = v15;
  for (i = __clz(__rbit64(v19)) | (v15 << 6); ; i = __clz(__rbit64(v25)) + (v26 << 6))
  {
    v28 = *(_QWORD *)(v12 + 72);
    sub_23A1EB81C(*(_QWORD *)(a1 + 48) + v28 * i, (uint64_t)v14);
    sub_23A1EB860((uint64_t)v14, (uint64_t)v10);
    sub_23A1EE9DC();
    sub_23A1EE820();
    sub_23A1E22CC(&qword_256950D88, v22, MEMORY[0x24BDCEA88]);
    sub_23A1EE82C();
    v29 = v4[5];
    sub_23A1EEA00();
    v30 = &v10[v4[6]];
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    v50 = &v10[v4[7]];
    swift_bridgeObjectRetain();
    sub_23A1EE850();
    swift_bridgeObjectRelease();
    v49 = v4[8];
    v31 = *(_QWORD *)&v10[v49];
    swift_bridgeObjectRetain();
    sub_23A1E96AC((uint64_t)v51, v31);
    swift_bridgeObjectRelease();
    v48 = v4[9];
    v32 = *(_QWORD *)&v10[v48];
    swift_bridgeObjectRetain();
    sub_23A1E9840(v51, v32);
    swift_bridgeObjectRelease();
    v33 = sub_23A1EEA0C();
    v34 = -1 << *(_BYTE *)(a2 + 32);
    v35 = v33 & ~v34;
    if (((*(_QWORD *)(v21 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
    {
LABEL_42:
      sub_23A1EB8A4((uint64_t)v10);
      return 0;
    }
    v36 = ~v34;
    while (1)
    {
      sub_23A1EB81C(*(_QWORD *)(a2 + 48) + v35 * v28, (uint64_t)v7);
      if ((sub_23A1EE7FC() & 1) != 0 && *(_DWORD *)&v7[v4[5]] == *(_DWORD *)&v10[v29])
      {
        v37 = &v7[v4[6]];
        v38 = *(_QWORD *)v37 == *(_QWORD *)v30 && *((_QWORD *)v37 + 1) == *((_QWORD *)v30 + 1);
        if (v38 || (sub_23A1EE9C4() & 1) != 0)
        {
          v39 = &v7[v4[7]];
          v40 = *(_QWORD *)v39 == *(_QWORD *)v50 && *((_QWORD *)v39 + 1) == *((_QWORD *)v50 + 1);
          if ((v40 || (sub_23A1EE9C4() & 1) != 0)
            && (sub_23A1EAF40(*(_QWORD *)&v7[v4[8]], *(_QWORD *)&v10[v49]) & 1) != 0
            && (sub_23A1EB1C4(*(_QWORD *)&v7[v4[9]], *(_QWORD *)&v10[v48]) & 1) != 0)
          {
            break;
          }
        }
      }
      sub_23A1EB8A4((uint64_t)v7);
      v35 = (v35 + 1) & v36;
      if (((*(_QWORD *)(v21 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
        goto LABEL_42;
    }
    sub_23A1EB8A4((uint64_t)v7);
    result = sub_23A1EB8A4((uint64_t)v10);
    v12 = v44;
    a1 = v45;
    v16 = v42;
    v14 = v43;
    v20 = v41;
    v22 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
    v19 = v46;
    v15 = v47;
    if (v46)
      goto LABEL_7;
LABEL_8:
    v24 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v24 >= v20)
      return 1;
    v25 = *(_QWORD *)(v16 + 8 * v24);
    v26 = v15 + 1;
    if (!v25)
    {
      v26 = v15 + 2;
      if (v15 + 2 >= v20)
        return 1;
      v25 = *(_QWORD *)(v16 + 8 * v26);
      if (!v25)
      {
        v26 = v15 + 3;
        if (v15 + 3 >= v20)
          return 1;
        v25 = *(_QWORD *)(v16 + 8 * v26);
        if (!v25)
          break;
      }
    }
LABEL_21:
    v46 = (v25 - 1) & v25;
    v47 = v26;
  }
  v27 = v15 + 4;
  if (v15 + 4 >= v20)
    return 1;
  v25 = *(_QWORD *)(v16 + 8 * v27);
  if (v25)
  {
    v26 = v15 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    v26 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v26 >= v20)
      return 1;
    v25 = *(_QWORD *)(v16 + 8 * v26);
    ++v27;
    if (v25)
      goto LABEL_21;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_23A1EB610(uint64_t a1, uint64_t a2)
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
    v5 = sub_23A1EE9C4();
    v6 = 0;
    if ((v5 & 1) == 0)
      return v6 & 1;
  }
  v7 = (int *)type metadata accessor for LibSystemUserRecord(0);
  if ((sub_23A1EE7FC() & 1) == 0)
    goto LABEL_23;
  v8 = v7[7];
  v9 = *(_QWORD *)(a1 + v8);
  v10 = *(_QWORD *)(a1 + v8 + 8);
  v11 = (_QWORD *)(a2 + v8);
  if (v9 != *v11 || v10 != v11[1])
  {
    v13 = sub_23A1EE9C4();
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
    v19 = sub_23A1EE9C4();
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
  if (v21 == *v23 && v22 == v23[1] || (v24 = sub_23A1EE9C4(), v6 = 0, (v24 & 1) != 0))
    v6 = *(_BYTE *)(a1 + v7[11]) ^ *(_BYTE *)(a2 + v7[11]) ^ 1;
  return v6 & 1;
}

uint64_t sub_23A1EB760(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  uint64_t v7;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    goto LABEL_10;
  v4 = *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16);
  if (v4 || (v5 = sub_23A1EE9C4(), v6 = 0, (v5 & 1) != 0))
  {
    v7 = type metadata accessor for LibSystemGroupRecord(0);
    if ((sub_23A1EE7FC() & 1) != 0
      && (sub_23A1EAF40(*(_QWORD *)(a1 + *(int *)(v7 + 28)), *(_QWORD *)(a2 + *(int *)(v7 + 28))) & 1) != 0)
    {
      v6 = *(_BYTE *)(a1 + *(int *)(v7 + 32)) ^ *(_BYTE *)(a2 + *(int *)(v7 + 32)) ^ 1;
      return v6 & 1;
    }
LABEL_10:
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_23A1EB81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1EB860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1EB8A4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_23A1EB8E0(_QWORD *a1, _QWORD *a2, int *a3)
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
    v11 = sub_23A1EE820();
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

uint64_t sub_23A1EB9F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A1EBA74(uint64_t a1, uint64_t a2, int *a3)
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
  v10 = sub_23A1EE820();
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

uint64_t sub_23A1EBB5C(uint64_t a1, uint64_t a2, int *a3)
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
  v9 = sub_23A1EE820();
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

uint64_t sub_23A1EBC84(uint64_t a1, uint64_t a2, int *a3)
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
  v9 = sub_23A1EE820();
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

uint64_t sub_23A1EBD2C(uint64_t a1, uint64_t a2, int *a3)
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
  v10 = sub_23A1EE820();
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

uint64_t sub_23A1EBE10()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1EBE20()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1EBE30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A1EE820();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_23A1EBEC8(_QWORD *a1, _QWORD *a2, int *a3)
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
    v11 = sub_23A1EE820();
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

uint64_t sub_23A1EBF94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A1EBFF0(uint64_t a1, uint64_t a2, int *a3)
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
  v10 = sub_23A1EE820();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v12) = *(_BYTE *)(a2 + v12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A1EC090(uint64_t a1, uint64_t a2, int *a3)
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
  v9 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_23A1EC144(uint64_t a1, uint64_t a2, int *a3)
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
  v9 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  return a1;
}

uint64_t sub_23A1EC1CC(uint64_t a1, uint64_t a2, int *a3)
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
  v10 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_23A1EC268()
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
    v8 = sub_23A1EE820();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_23A1EC2F4()
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
    v7 = sub_23A1EE820();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23A1EC378()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A1EE820();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t Group.init(name:fullName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  _QWORD *v14;

  v10 = (int *)type metadata accessor for Group();
  v11 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a5 + v10[8]) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a5 + v10[9]) = v11;
  sub_23A1EE814();
  result = sub_23A1E1EF0();
  *(_DWORD *)(a5 + v10[5]) = result;
  v13 = (_QWORD *)(a5 + v10[6]);
  *v13 = a1;
  v13[1] = a2;
  v14 = (_QWORD *)(a5 + v10[7]);
  *v14 = a3;
  v14[1] = a4;
  return result;
}

uint64_t type metadata accessor for Group()
{
  uint64_t result;

  result = qword_256950FF0;
  if (!qword_256950FF0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Group.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6[4];

  v1 = v0;
  sub_23A1EE9DC();
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v2 = type metadata accessor for Group();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v0 + *(int *)(v2 + 32));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v6, v3);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v1 + *(int *)(v2 + 36));
  swift_bridgeObjectRetain();
  sub_23A1E9840(v6, v4);
  swift_bridgeObjectRelease();
  return sub_23A1EEA0C();
}

uint64_t Group.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A1EE820();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Group.gid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for Group() + 20));
}

uint64_t Group.gid.setter(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Group();
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*Group.gid.modify())()
{
  type metadata accessor for Group();
  return nullsub_1;
}

uint64_t Group.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Group() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Group() + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Group.name.modify())()
{
  type metadata accessor for Group();
  return nullsub_1;
}

uint64_t Group.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Group() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Group() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Group.fullName.modify())()
{
  type metadata accessor for Group();
  return nullsub_1;
}

uint64_t Group.aliases.getter()
{
  type metadata accessor for Group();
  return swift_bridgeObjectRetain();
}

uint64_t Group.aliases.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Group() + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.aliases.modify())()
{
  type metadata accessor for Group();
  return nullsub_1;
}

uint64_t Group.nestedGroups.getter()
{
  type metadata accessor for Group();
  return swift_bridgeObjectRetain();
}

uint64_t Group.nestedGroups.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Group() + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.nestedGroups.modify())()
{
  type metadata accessor for Group();
  return nullsub_1;
}

uint64_t Group.hash(into:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1;
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v4 = type metadata accessor for Group();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v1 + *(int *)(v4 + 32));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)a1, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v2 + *(int *)(v4 + 36));
  swift_bridgeObjectRetain();
  sub_23A1E9840(a1, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A1ECA40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8[4];

  v4 = v2;
  sub_23A1EE9DC();
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v2 + *(int *)(a2 + 32));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)v8, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v4 + *(int *)(a2 + 36));
  swift_bridgeObjectRetain();
  sub_23A1E9840(v8, v6);
  swift_bridgeObjectRelease();
  return sub_23A1EEA0C();
}

uint64_t _s15DarwinDirectory5GroupV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;

  if ((sub_23A1EE7FC() & 1) == 0)
    return 0;
  v4 = type metadata accessor for Group();
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20)))
    return 0;
  v5 = (int *)v4;
  v6 = *(int *)(v4 + 24);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = v7 == *v9 && v8 == v9[1];
  if ((v10 || (sub_23A1EE9C4() & 1) != 0)
    && ((v11 = v5[7],
         v12 = *(_QWORD *)(a1 + v11),
         v13 = *(_QWORD *)(a1 + v11 + 8),
         v14 = (_QWORD *)(a2 + v11),
         v12 == *v14)
      ? (v15 = v13 == v14[1])
      : (v15 = 0),
        (v15 || (sub_23A1EE9C4() & 1) != 0)
     && (sub_23A1EAF40(*(_QWORD *)(a1 + v5[8]), *(_QWORD *)(a2 + v5[8])) & 1) != 0))
  {
    return sub_23A1EB1C4(*(_QWORD *)(a1 + v5[9]), *(_QWORD *)(a2 + v5[9]));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23A1ECC48()
{
  return sub_23A1E22CC(&qword_256950F90, (uint64_t (*)(uint64_t))type metadata accessor for Group, (uint64_t)&protocol conformance descriptor for Group);
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
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
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
    v7 = sub_23A1EE820();
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
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Group(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
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
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = sub_23A1EE820();
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
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_23A1EE820();
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
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A1EE820();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
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
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_23A1EE820();
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
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1ED0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A1EE820();
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

uint64_t sub_23A1ED140(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A1EE820();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A1ED1BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A1EE820();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t User.init(name:fullName:primaryGroup:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  v12 = (int *)type metadata accessor for User();
  v13 = (_QWORD *)(a6 + v12[9]);
  *v13 = 0x706D652F7261762FLL;
  v13[1] = 0xEA00000000007974;
  v14 = (char *)(a6 + v12[10]);
  strcpy(v14, "/usr/bin/false");
  v14[15] = -18;
  v15 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a6 + v12[11]) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a6 + v12[12]) = v15;
  sub_23A1EE814();
  *(_DWORD *)(a6 + v12[5]) = sub_23A1E1D38();
  v16 = (_QWORD *)(a6 + v12[6]);
  *v16 = a1;
  v16[1] = a2;
  v17 = (_QWORD *)(a6 + v12[7]);
  *v17 = a3;
  v17[1] = a4;
  return sub_23A1EB860(a5, a6 + v12[8]);
}

uint64_t type metadata accessor for User()
{
  uint64_t result;

  result = qword_256951098;
  if (!qword_256951098)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t User.hashValue.getter()
{
  __int128 v1[4];

  sub_23A1EE9DC();
  User.hash(into:)(v1);
  return sub_23A1EEA0C();
}

uint64_t User.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A1EE820();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t User.uid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User() + 20));
}

uint64_t User.uid.setter(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for User();
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*User.uid.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User() + 24));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.name.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.fullName.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.primaryGroup.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for User() + 32);
  return sub_23A1EB81C(v3, a1);
}

uint64_t User.primaryGroup.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for User() + 32);
  return sub_23A1EA9C8(a1, v3);
}

uint64_t (*User.primaryGroup.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.homeDirectory.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.homeDirectory.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User() + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.homeDirectory.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.shell.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.shell.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User() + 40));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.shell.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.memberships.getter()
{
  type metadata accessor for User();
  return swift_bridgeObjectRetain();
}

uint64_t User.memberships.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for User() + 44);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.memberships.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.aliases.getter()
{
  type metadata accessor for User();
  return swift_bridgeObjectRetain();
}

uint64_t User.aliases.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for User() + 48);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.aliases.modify())()
{
  type metadata accessor for User();
  return nullsub_1;
}

uint64_t User.hash(into:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v1;
  sub_23A1EE820();
  sub_23A1E22CC(&qword_256950D88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A1EE82C();
  v4 = (int *)type metadata accessor for User();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v5 = v1 + v4[8];
  sub_23A1EE82C();
  v6 = type metadata accessor for Group();
  sub_23A1EEA00();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v5 + *(int *)(v6 + 32));
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)a1, v7);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v5 + *(int *)(v6 + 36));
  swift_bridgeObjectRetain();
  sub_23A1E9840(a1, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A1EE850();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v2 + v4[11]);
  swift_bridgeObjectRetain();
  sub_23A1E9840(a1, v9);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v2 + v4[12]);
  swift_bridgeObjectRetain();
  sub_23A1E96AC((uint64_t)a1, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A1EDAF4()
{
  __int128 v1[4];

  sub_23A1EE9DC();
  User.hash(into:)(v1);
  return sub_23A1EEA0C();
}

uint64_t sub_23A1EDB34()
{
  __int128 v1[4];

  sub_23A1EE9DC();
  User.hash(into:)(v1);
  return sub_23A1EEA0C();
}

uint64_t _s15DarwinDirectory4UserV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;

  if ((sub_23A1EE7FC() & 1) == 0)
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
  if (!v10 && (sub_23A1EE9C4() & 1) == 0)
    return 0;
  v11 = v5[7];
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a1 + v11 + 8);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v12 == *v14 && v13 == v14[1];
  if (!v15 && (sub_23A1EE9C4() & 1) == 0)
    return 0;
  if ((_s15DarwinDirectory5GroupV2eeoiySbAC_ACtFZ_0(a1 + v5[8], a2 + v5[8]) & 1) == 0)
    return 0;
  v16 = v5[9];
  v17 = *(_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v17 == *v19 && v18 == v19[1];
  if (!v20 && (sub_23A1EE9C4() & 1) == 0)
    return 0;
  v21 = v5[10];
  v22 = *(_QWORD *)(a1 + v21);
  v23 = *(_QWORD *)(a1 + v21 + 8);
  v24 = (_QWORD *)(a2 + v21);
  if ((v22 != *v24 || v23 != v24[1]) && (sub_23A1EE9C4() & 1) == 0)
    return 0;
  if ((sub_23A1EB1C4(*(_QWORD *)(a1 + v5[11]), *(_QWORD *)(a2 + v5[11])) & 1) != 0)
    return sub_23A1EAF40(*(_QWORD *)(a1 + v5[12]), *(_QWORD *)(a2 + v5[12]));
  else
    return 0;
}

uint64_t sub_23A1EDCBC()
{
  return sub_23A1E22CC(&qword_256951038, (uint64_t (*)(uint64_t))type metadata accessor for User, (uint64_t)&protocol conformance descriptor for User);
}

uint64_t *initializeBufferWithCopyOfBuffer for User(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v39 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v39 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A1EE820();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = a3[7];
    v14 = a3[8];
    v15 = (uint64_t *)((char *)a1 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (char *)a1 + v14;
    v19 = (char *)a2 + v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8((uint64_t *)v18, (uint64_t *)v19, v7);
    v20 = (int *)type metadata accessor for Group();
    *(_DWORD *)&v18[v20[5]] = *(_DWORD *)&v19[v20[5]];
    v21 = v20[6];
    v22 = &v18[v21];
    v23 = &v19[v21];
    v25 = *(_QWORD *)v23;
    v24 = *((_QWORD *)v23 + 1);
    *(_QWORD *)v22 = v25;
    *((_QWORD *)v22 + 1) = v24;
    v26 = v20[7];
    v27 = &v18[v26];
    v28 = &v19[v26];
    v29 = *((_QWORD *)v28 + 1);
    *(_QWORD *)v27 = *(_QWORD *)v28;
    *((_QWORD *)v27 + 1) = v29;
    *(_QWORD *)&v18[v20[8]] = *(_QWORD *)&v19[v20[8]];
    *(_QWORD *)&v18[v20[9]] = *(_QWORD *)&v19[v20[9]];
    v30 = a3[9];
    v31 = a3[10];
    v32 = (uint64_t *)((char *)a1 + v30);
    v33 = (uint64_t *)((char *)a2 + v30);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = (uint64_t *)((char *)a1 + v31);
    v36 = (uint64_t *)((char *)a2 + v31);
    v37 = v36[1];
    *v35 = *v36;
    v35[1] = v37;
    v38 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v38) = *(uint64_t *)((char *)a2 + v38);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for User(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_23A1EE820();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5(a1 + *(int *)(a2 + 32), v4);
  type metadata accessor for Group();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = sub_23A1EE820();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a3[7];
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a1 + v13;
  v18 = a2 + v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7(v17, v18, v6);
  v19 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v17 + v19[5]) = *(_DWORD *)(v18 + v19[5]);
  v20 = v19[6];
  v21 = (_QWORD *)(v17 + v20);
  v22 = (uint64_t *)(v18 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  v25 = v19[7];
  v26 = (_QWORD *)(v17 + v25);
  v27 = (_QWORD *)(v18 + v25);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  *(_QWORD *)(v17 + v19[8]) = *(_QWORD *)(v18 + v19[8]);
  *(_QWORD *)(v17 + v19[9]) = *(_QWORD *)(v18 + v19[9]);
  v29 = a3[9];
  v30 = a3[10];
  v31 = (_QWORD *)(a1 + v29);
  v32 = (_QWORD *)(a2 + v29);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = (_QWORD *)(a1 + v30);
  v35 = (_QWORD *)(a2 + v30);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  v37 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v37) = *(_QWORD *)(a2 + v37);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;

  v6 = sub_23A1EE820();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[8];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v7(a1 + v14, a2 + v14, v6);
  v17 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v15 + v17[5]) = *(_DWORD *)(v16 + v17[5]);
  v18 = v17[6];
  v19 = (_QWORD *)(v15 + v18);
  v20 = (_QWORD *)(v16 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = v17[7];
  v22 = (_QWORD *)(v15 + v21);
  v23 = (_QWORD *)(v16 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[8]) = *(_QWORD *)(v16 + v17[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[9]) = *(_QWORD *)(v16 + v17[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[9];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[10];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_23A1EE820();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v7(a1 + v9, a2 + v9, v6);
  v12 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v10 + v12[5]) = *(_DWORD *)(v11 + v12[5]);
  *(_OWORD *)(v10 + v12[6]) = *(_OWORD *)(v11 + v12[6]);
  *(_OWORD *)(v10 + v12[7]) = *(_OWORD *)(v11 + v12[7]);
  *(_QWORD *)(v10 + v12[8]) = *(_QWORD *)(v11 + v12[8]);
  *(_QWORD *)(v10 + v12[9]) = *(_QWORD *)(v11 + v12[9]);
  v13 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  v14 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = sub_23A1EE820();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[8];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v7(a1 + v18, a2 + v18, v6);
  v21 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v19 + v21[5]) = *(_DWORD *)(v20 + v21[5]);
  v22 = v21[6];
  v23 = (_QWORD *)(v19 + v22);
  v24 = (uint64_t *)(v20 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = v21[7];
  v28 = (_QWORD *)(v19 + v27);
  v29 = (uint64_t *)(v20 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v19 + v21[8]) = *(_QWORD *)(v20 + v21[8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v19 + v21[9]) = *(_QWORD *)(v20 + v21[9]);
  swift_bridgeObjectRelease();
  v32 = a3[9];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (uint64_t *)(a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = a3[10];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (uint64_t *)(a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for User()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1EE5E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23A1EE820();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = type metadata accessor for Group();
    v10 = a1 + *(int *)(a3 + 32);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for User()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1EE698(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_23A1EE820();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    v10 = type metadata accessor for Group();
    v12 = a1 + *(int *)(a4 + 32);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23A1EE740()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A1EE820();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for Group();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23A1EE7F0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23A1EE7FC()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23A1EE808()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_23A1EE814()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A1EE820()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A1EE82C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A1EE838()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A1EE844()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A1EE850()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A1EE85C()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23A1EE868()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A1EE874()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23A1EE880()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23A1EE88C()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_23A1EE898()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23A1EE8A4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23A1EE8B0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A1EE8BC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23A1EE8C8()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_23A1EE8D4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23A1EE8E0()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_23A1EE8EC()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_23A1EE8F8()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_23A1EE904()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23A1EE910()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_23A1EE91C()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_23A1EE928()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23A1EE934()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_23A1EE940()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A1EE94C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A1EE958()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_23A1EE964()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A1EE970()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A1EE97C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A1EE988()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A1EE994()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A1EE9A0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A1EE9AC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A1EE9B8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A1EE9C4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A1EE9D0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A1EE9DC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A1EE9E8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A1EE9F4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23A1EEA00()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A1EEA0C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t DarwinDirectoryRecordStoreApply()
{
  return MEMORY[0x24BDAC460]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

