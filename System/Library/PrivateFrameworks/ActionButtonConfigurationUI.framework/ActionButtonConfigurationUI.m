uint64_t type metadata accessor for Preloader()
{
  return objc_opt_self();
}

uint64_t sub_235E26AC8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235E26B00()
{
  uint64_t v0;

  v0 = sub_235E60AA0();
  __swift_allocate_value_buffer(v0, qword_256386DC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256386DC8);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return sub_235E60A94();
}

uint64_t sub_235E26BA0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385660);
    sub_235E2B7AC();
    v4 = sub_235E60FF8();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_235E26C3C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_QWORD *)(result + 16) = v1;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235E26CB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563868F0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563868F8);
  v20 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386900);
  v21 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v17 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  *(_BYTE *)(v9 + 16) = 1;
  *(_QWORD *)(v9 + 24) = v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386908);
  sub_235E29CC0(&qword_256386910, &qword_256386908, MEMORY[0x24BDB9568]);
  sub_235E60BF0();
  sub_235E29CC0(&qword_256386918, &qword_2563868F0, MEMORY[0x24BDB9E90]);
  v10 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v22 = v10;
  swift_retain();
  sub_235E60B60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386920);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386810);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386928);
  sub_235E29CC0(&qword_256386930, &qword_256386920, MEMORY[0x24BDB9AF8]);
  v11 = MEMORY[0x24BDB98F0];
  sub_235E29CC0(&qword_256386938, &qword_256386928, MEMORY[0x24BDB98F0]);
  sub_235E60C80();
  swift_release();
  swift_release();
  sub_235E29CC0(&qword_256386940, &qword_2563868F8, v11);
  v13 = v17;
  v12 = v18;
  sub_235E60C20();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v12);
  sub_235E29CC0(&qword_256386948, &qword_256386900, MEMORY[0x24BDB9580]);
  v14 = v19;
  v15 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v14);
  return v15;
}

uint64_t sub_235E26FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v3 = v2;
  if (a1)
  {
    v10 = a1;
    v11 = a2;
    *(_QWORD *)&v8 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v8 + 1) = 1107296256;
    *(_QWORD *)&v9 = sub_235E2B83C;
    *((_QWORD *)&v9 + 1) = &block_descriptor_5;
    v4 = _Block_copy(&v8);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)ABLoadResourcesWithCompletion();
  _Block_release(v4);
  if (v5)
  {
    sub_235E61448();
    swift_unknownObjectRelease();
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  v6 = v3 + OBJC_IVAR___BCPreloader_resourceLoadToken;
  swift_beginAccess();
  sub_235E2B738((uint64_t)&v8, v6);
  swift_endAccess();
  if (qword_2563854C8 != -1)
    swift_once();
  *(_QWORD *)&v8 = sub_235E26CB0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563862A8);
  sub_235E2B88C();
  sub_235E60C44();
  swift_release();
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  return swift_release();
}

void sub_235E27174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = qword_2563854D0;
  swift_retain();
  if (v5 != -1)
    swift_once();
  v6 = sub_235E60AA0();
  __swift_project_value_buffer(v6, (uint64_t)qword_256386DC8);
  v7 = sub_235E60A88();
  v8 = sub_235E6119C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_235E24000, v7, v8, "Fetching actions...", v9, 2u);
    MEMORY[0x23B7E3DAC](v9, -1, -1);
  }

  v10 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_235E291F8;
  *(_QWORD *)(v11 + 24) = v4;
  v13[4] = sub_235E2B834;
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_235E26BA0;
  v13[3] = &block_descriptor_18;
  v12 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v10, sel_fetchAvailableStaccatoActions_, v12);
  _Block_release(v12);

}

unint64_t sub_235E27324@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t inited;
  id v7;
  unint64_t result;

  v5 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563868C8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235E637D0;
  *(_QWORD *)(inited + 32) = a2;
  *(_QWORD *)(inited + 40) = v5;
  v7 = a2;
  swift_bridgeObjectRetain();
  result = sub_235E27398(inited);
  *a3 = result;
  return result;
}

unint64_t sub_235E27398(uint64_t a1)
{
  return sub_235E273AC(a1, &qword_256386C48, (uint64_t (*)(id))sub_235E274BC);
}

unint64_t sub_235E273AC(uint64_t a1, uint64_t *a2, uint64_t (*a3)(id))
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = (_QWORD *)sub_235E61634();
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v5;
  }
  swift_retain();
  v7 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v8 = *v7;
    v9 = (id)*(v7 - 1);
    swift_bridgeObjectRetain();
    result = a3(v9);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = 8 * result;
    *(_QWORD *)(v5[6] + v12) = v9;
    *(_QWORD *)(v5[7] + v12) = v8;
    v13 = v5[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v5[2] = v15;
    v7 += 2;
    if (!--v6)
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

unint64_t sub_235E274BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235E612BC();
  return sub_235E27800(a1, v2, &qword_2563867F0);
}

uint64_t sub_235E27508(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_235E61034();
  *a2 = 0;
  return result;
}

uint64_t sub_235E2757C(uint64_t *a1)
{
  uint64_t v1;

  return sub_235E27584(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235E27584(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  v4 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6 = result;
    swift_beginAccess();
    v7 = a3;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *(_QWORD *)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0x8000000000000000;
    sub_235E27654(v4, v7, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v6 + 24) = v9;

    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

id sub_235E27654(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_235E277B4((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_235E5107C();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_bridgeObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_235E27910(v12, a3 & 1);
  v18 = sub_235E277B4((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_235E26AC8(0, &qword_2563869F0);
  result = (id)sub_235E61700();
  __break(1u);
  return result;
}

unint64_t sub_235E277B4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235E612BC();
  return sub_235E27800(a1, v2, &qword_2563869F0);
}

unint64_t sub_235E27800(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a2 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_235E26AC8(0, a3);
    v7 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
    v8 = sub_235E612C8();

    if ((v8 & 1) == 0)
    {
      v9 = ~v5;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
        v11 = sub_235E612C8();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_235E27910(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C40);
  v6 = sub_235E61628();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_bridgeObjectRetain();
    }
    result = sub_235E612BC();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
          goto LABEL_41;
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
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235E27BE4()
{
  uint64_t v0;

  sub_235E6104C();
  sub_235E6173C();
  sub_235E61064();
  v0 = sub_235E61754();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_235E27C54(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  _BYTE v20[12];
  int v21;

  v21 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563867E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563867E8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = objc_msgSend(a1, sel_parameters);
  sub_235E26AC8(0, &qword_2563867F0);
  v13 = sub_235E610AC();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (v19)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386810);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
    sub_235E60BD8();
    sub_235E29CC0(&qword_256386820, &qword_2563867E0, MEMORY[0x24BDB9E20]);
    sub_235E60BFC();
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  if (!*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_8;
LABEL_3:
  if ((v13 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x23B7E35E4](0, v13);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v14 = *(id *)(v13 + 32);
LABEL_6:
    v15 = v14;
    swift_bridgeObjectRelease();
    v16 = swift_allocObject();
    *(_BYTE *)(v16 + 16) = v21 & 1;
    *(_QWORD *)(v16 + 24) = v2;
    *(_QWORD *)(v16 + 32) = a1;
    *(_QWORD *)(v16 + 40) = v15;
    swift_retain();
    v17 = a1;
    v18 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563867F8);
    sub_235E29CC0(&qword_256386800, &qword_2563867F8, MEMORY[0x24BDB9568]);
    sub_235E60BF0();
    sub_235E29CC0(&qword_256386808, &qword_2563867E8, MEMORY[0x24BDB9E90]);
    sub_235E60BFC();

    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    return;
  }
  __break(1u);
}

uint64_t sub_235E27F28@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  os_log_type_t v29;
  uint64_t v30;
  uint8_t *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint8_t *v36;
  char *v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  id v41;
  void *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386828);
  MEMORY[0x24BDAC7A8](v6);
  v69 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386980);
  v68 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v66 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386988);
  v74 = *(_QWORD *)(v9 - 8);
  v75 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v73 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386990);
  v62 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386998);
  v61 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v59 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v53 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563869A0);
  v64 = *(_QWORD *)(v18 - 8);
  v65 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v63 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563869A8);
  v70 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v67 = (char *)&v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_235E60AA0();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = 0;
  if ((a1 & 1) == 0)
  {
    v25 = *(void **)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  if (qword_2563854D0 != -1)
    swift_once();
  v26 = __swift_project_value_buffer(v21, (uint64_t)qword_256386DC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v26, v21);
  swift_bridgeObjectRetain_n();
  v27 = sub_235E60A88();
  v28 = sub_235E6119C();
  v58 = v22;
  v29 = v28;
  if (os_log_type_enabled(v27, v28))
  {
    v54 = v17;
    v30 = swift_slowAlloc();
    v55 = v13;
    v31 = (uint8_t *)v30;
    v32 = (void *)swift_slowAlloc();
    v57 = a3;
    v33 = v32;
    v53 = v11;
    *(_DWORD *)v31 = 136315138;
    v77[0] = v32;
    if (v25)
      v34 = 0x676E697375;
    else
      v34 = 0x2074756F68746977;
    v56 = a2;
    if (v25)
      v35 = 0xE500000000000000;
    else
      v35 = 0xED0000676E697375;
    v76 = sub_235E2AEC4(v34, v35, (uint64_t *)v77);
    v17 = v54;
    v11 = v53;
    sub_235E61430();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235E24000, v27, v29, "Loading actions %s cache", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v33, -1, -1);
    v36 = v31;
    v13 = v55;
    MEMORY[0x23B7E3DAC](v36, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v58 + 8))(v24, v21);
  v77[0] = v25;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563869B0);
  v37 = v60;
  sub_235E60BCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385660);
  v38 = v59;
  sub_235E60BB4();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v37, v11);
  sub_235E61418();
  v39 = *(void (**)(char *, uint64_t))(v61 + 8);
  v39(v38, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
  sub_235E29CC0(&qword_2563869B8, &qword_256386998, MEMORY[0x24BDBA198]);
  v40 = v63;
  sub_235E60CEC();
  v39(v17, v13);
  v41 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563869C0);
  swift_allocObject();
  v77[0] = (id)sub_235E60BE4();
  sub_235E29CC0(&qword_2563869C8, &qword_2563869C0, MEMORY[0x24BDB9E58]);
  v42 = (void *)sub_235E60BFC();

  swift_release();
  v77[0] = v42;
  *(_QWORD *)(swift_allocObject() + 16) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386920);
  sub_235E29CC0(&qword_256386930, &qword_256386920, MEMORY[0x24BDB9AF8]);
  v43 = v66;
  sub_235E60C68();
  swift_release();
  swift_release();
  sub_235E26AC8(0, (unint64_t *)&qword_2563859F0);
  v77[0] = (id)sub_235E611FC();
  v44 = sub_235E611CC();
  v45 = (uint64_t)v69;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v69, 1, 1, v44);
  sub_235E29CC0(&qword_2563869D0, &qword_256386980, MEMORY[0x24BDB97F8]);
  sub_235E48C20((unint64_t *)&qword_2563868A8, (unint64_t *)&qword_2563859F0, 0x24BDAC4D0, MEMORY[0x24BEE5670]);
  v46 = v73;
  v47 = v71;
  sub_235E60C98();
  sub_235E47D24(v45);

  (*(void (**)(char *, uint64_t))(v68 + 8))(v43, v47);
  sub_235E29CC0(&qword_2563869D8, &qword_2563869A0, MEMORY[0x24BDB95F8]);
  sub_235E29CC0(&qword_2563869E0, &qword_256386988, MEMORY[0x24BDB9A08]);
  v48 = v67;
  v49 = v65;
  v50 = v75;
  sub_235E60C50();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v46, v50);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v40, v49);
  swift_allocObject();
  swift_weakInit();
  sub_235E29CC0(&qword_2563869E8, &qword_2563869A8, MEMORY[0x24BDB9798]);
  v51 = v72;
  sub_235E60C14();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v48, v51);
}

void sub_235E287CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t aBlock[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = qword_2563854D0;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v8 = sub_235E60AA0();
  __swift_project_value_buffer(v8, (uint64_t)qword_256386DC8);
  v9 = a3;
  v10 = sub_235E60A88();
  v11 = sub_235E6119C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v23 = v6;
    v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = objc_msgSend(v9, sel_actionIdentifier);
    v15 = sub_235E6104C();
    v17 = v16;

    sub_235E2AEC4(v15, v17, aBlock);
    sub_235E61430();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235E24000, v10, v11, "Fetching values for parameter %s...", v12, 0xCu);
    swift_arrayDestroy();
    v18 = v13;
    v6 = v23;
    MEMORY[0x23B7E3DAC](v18, -1, -1);
    MEMORY[0x23B7E3DAC](v12, -1, -1);

  }
  else
  {

  }
  v19 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v9;
  v20[3] = sub_235E291F8;
  v20[4] = v6;
  aBlock[4] = (uint64_t)sub_235E28B18;
  aBlock[5] = (uint64_t)v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_235E28A8C;
  aBlock[3] = (uint64_t)&block_descriptor;
  v21 = _Block_copy(aBlock);
  v22 = v9;
  swift_release();
  objc_msgSend(v19, sel_fetchAllValueSectionsForStaccatoParameter_completion_, v22, v21);
  _Block_release(v21);

}

uint64_t sub_235E28A8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_235E26AC8(0, &qword_256385638);
    v4 = sub_235E610AC();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_235E28B18(unint64_t a1, void *a2)
{
  uint64_t v2;

  sub_235E28B24(a1, a2, *(void **)(v2 + 16), *(void (**)(void *, uint64_t))(v2 + 24));
}

void sub_235E28B24(unint64_t a1, void *a2, void *a3, void (*a4)(void *, uint64_t))
{
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _BYTE *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  os_log_type_t v45;
  _DWORD *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(void *, uint64_t);
  unint64_t v50;
  uint64_t v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (qword_2563854D0 != -1)
      swift_once();
    v20 = sub_235E60AA0();
    __swift_project_value_buffer(v20, (uint64_t)qword_256386DC8);
    v21 = a3;
    v22 = a2;
    v23 = v21;
    v24 = a2;
    v25 = sub_235E60A88();
    v26 = sub_235E6119C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v51[0] = v48;
      *(_DWORD *)v27 = 136315394;
      v29 = objc_msgSend(v23, sel_actionIdentifier);
      v30 = sub_235E6104C();
      v32 = v31;

      sub_235E2AEC4(v30, v32, v51);
      sub_235E61430();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2112;
      if (a2)
      {
        v33 = a2;
        v34 = _swift_stdlib_bridgeErrorToNSError();
        sub_235E61430();
      }
      else
      {
        sub_235E61430();
        v34 = 0;
      }
      *v28 = v34;

      _os_log_impl(&dword_235E24000, v25, v26, "Failed to fetch parameter values for %s: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v28, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v48, -1, -1);
      MEMORY[0x23B7E3DAC](v27, -1, -1);

      v36 = a2;
      if (a2)
        goto LABEL_31;
    }
    else
    {

      v36 = a2;
      if (a2)
      {
LABEL_31:
        v42 = a2;
        a4(v36, 1);

        return;
      }
    }
    sub_235E2D478();
    v36 = (void *)swift_allocError();
    *v41 = 1;
    goto LABEL_31;
  }
  if (qword_2563854D0 != -1)
    swift_once();
  v7 = sub_235E60AA0();
  __swift_project_value_buffer(v7, (uint64_t)qword_256386DC8);
  v8 = a3;
  swift_bridgeObjectRetain_n();
  v9 = v8;
  v10 = sub_235E60A88();
  v11 = sub_235E6119C();
  if (os_log_type_enabled(v10, v11))
  {
    v45 = v11;
    v47 = v9;
    v12 = (_DWORD *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    v51[0] = v44;
    *v12 = 134218242;
    v50 = MEMORY[0x24BEE4AF8];
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v13 = sub_235E61610();
    }
    else
    {
      v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v49 = a4;
    v46 = v12;
    if (v13)
    {
      v43 = v10;
      if (v13 < 1)
        __break(1u);
      v14 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0)
          v15 = (id)MEMORY[0x23B7E35E4](v14, a1);
        else
          v15 = *(id *)(a1 + 8 * v14 + 32);
        v16 = v15;
        ++v14;
        v17 = objc_msgSend(v15, sel_values, v43);
        sub_235E26AC8(0, (unint64_t *)&qword_256385650);
        v18 = sub_235E610AC();

        sub_235E291FC(v18);
      }
      while (v13 != v14);
      swift_bridgeObjectRelease();
      v35 = v50;
      v10 = v43;
    }
    else
    {
      swift_bridgeObjectRelease();
      v35 = MEMORY[0x24BEE4AF8];
    }
    if (v35 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_235E61610();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_235E61430();
    swift_bridgeObjectRelease();
    *((_WORD *)v46 + 6) = 2080;
    v37 = objc_msgSend(v47, sel_actionIdentifier);
    v38 = sub_235E6104C();
    v40 = v39;

    sub_235E2AEC4(v38, v40, v51);
    sub_235E61430();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235E24000, v10, v45, "Successfully fetched %ld parameter values for %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v44, -1, -1);
    MEMORY[0x23B7E3DAC](v46, -1, -1);

    a4 = v49;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  a4((void *)a1, 0);
}

uint64_t sub_235E291C0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_235E291FC(unint64_t a1)
{
  return sub_235E295C8(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_235E29790);
}

void sub_235E29208(uint64_t a1, void *a2, void (*a3)(unint64_t, uint64_t))
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _BYTE *v21;
  id v22;

  if (a1)
  {
    v4 = swift_bridgeObjectRetain();
    v5 = sub_235E2CA0C(v4);
    swift_bridgeObjectRelease();
    if (qword_2563854D0 != -1)
      swift_once();
    v6 = sub_235E60AA0();
    __swift_project_value_buffer(v6, (uint64_t)qword_256386DC8);
    swift_bridgeObjectRetain_n();
    v7 = sub_235E60A88();
    v8 = sub_235E6119C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v9 = 134217984;
      if (v5 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_235E61610();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_235E61430();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235E24000, v7, v8, "Successfully fetched %ld actions", v9, 0xCu);
      MEMORY[0x23B7E3DAC](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a3(v5, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2563854D0 != -1)
      swift_once();
    v11 = sub_235E60AA0();
    __swift_project_value_buffer(v11, (uint64_t)qword_256386DC8);
    v12 = a2;
    v13 = a2;
    v14 = sub_235E60A88();
    v15 = sub_235E6119C();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      if (a2)
      {
        v18 = a2;
        v19 = _swift_stdlib_bridgeErrorToNSError();
        sub_235E61430();
      }
      else
      {
        sub_235E61430();
        v19 = 0;
      }
      *v17 = v19;

      _os_log_impl(&dword_235E24000, v14, v15, "Failed to fetch actions: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v17, -1, -1);
      MEMORY[0x23B7E3DAC](v16, -1, -1);
    }
    else
    {

    }
    v20 = a2;
    if (!a2)
    {
      sub_235E2D478();
      v20 = (void *)swift_allocError();
      *v21 = 0;
    }
    v22 = a2;
    a3((unint64_t)v20, 1);

  }
}

uint64_t sub_235E295C8(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235E61610();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_23;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x23B7E35F0](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v11 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_235E610C4();
  }
  __break(1u);
  return result;
}

uint64_t sub_235E29784(unint64_t a1)
{
  return sub_235E295C8(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_235E29A70);
}

uint64_t sub_235E29790(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_235E29CC0(&qword_256386C28, &qword_256385830, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256385830);
          v12 = sub_235E299B0(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_235E26AC8(0, (unint64_t *)&qword_256385650);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_235E61640();
  __break(1u);
  return result;
}

void (*sub_235E299B0(void (**a1)(id *), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_235E29A04(v6, a2, a3);
  return sub_235E299AC;
}

void (*sub_235E29A04(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B7E35E4](a2, a3);
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
    return j__s27ActionButtonConfigurationUI7ControlVwxx;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E29A70(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_235E29CC0(&qword_256386CC0, &qword_256385660, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256385660);
          v12 = sub_235E29D04(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_235E26AC8(0, &qword_2563869F0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_235E61640();
  __break(1u);
  return result;
}

void sub_235E29C8C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void destroy for Control(id *a1)
{

}

uint64_t sub_235E29CC0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7E3CE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void (*sub_235E29D04(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_235E29D58(v6, a2, a3);
  return sub_235E299AC;
}

void (*sub_235E29D58(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B7E35E4](a2, a3);
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
    return destroy for Control;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E29DC4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386950);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v20 = MEMORY[0x24BEE4AF8];
  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x24BEE4AF8];
LABEL_15:
    swift_retain();
    v17 = sub_235E47EDC(v16);
    swift_release();
    swift_release();
    v20 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386958);
    sub_235E29CC0(&qword_256386960, &qword_256386958, MEMORY[0x24BEE12C8]);
    sub_235E61088();
    swift_bridgeObjectRelease();
    sub_235E60B60();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386968);
    sub_235E29CC0(&qword_256386970, &qword_256386950, MEMORY[0x24BDB9970]);
    sub_235E29CC0(&qword_256386978, &qword_256386968, MEMORY[0x24BDB9AF8]);
    sub_235E60D04();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_bridgeObjectRetain();
  result = sub_235E61610();
  v9 = result;
  if (!result)
    goto LABEL_14;
LABEL_3:
  if (v9 >= 1)
  {
    v18[1] = a2;
    v19 = v5;
    for (i = 0; i != v9; ++i)
    {
      if ((v8 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x23B7E35E4](i, v8);
      else
        v12 = *(id *)(v8 + 8 * i + 32);
      v13 = v12;
      sub_235E465AC();
      v15 = v14;
      swift_bridgeObjectRelease();
      if (v15)
      {
        sub_235E6152C();
        sub_235E61550();
        sub_235E6155C();
        sub_235E61538();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v16 = v20;
    v5 = v19;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

unint64_t sub_235E2A060(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C38);
  v2 = (_QWORD *)sub_235E61634();
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
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    result = sub_235E2A174((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v7;
    v10 = (_QWORD *)(v2[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
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

unint64_t sub_235E2A174(uint64_t a1)
{
  uint64_t v2;

  sub_235E6104C();
  sub_235E6173C();
  sub_235E61064();
  v2 = sub_235E61754();
  swift_bridgeObjectRelease();
  return sub_235E2A1F4(a1, v2);
}

unint64_t sub_235E2A1F4(uint64_t a1, uint64_t a2)
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
    v6 = sub_235E6104C();
    v8 = v7;
    if (v6 == sub_235E6104C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_235E616D0();
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
          v13 = sub_235E6104C();
          v15 = v14;
          if (v13 == sub_235E6104C() && v15 == v16)
            break;
          v18 = sub_235E616D0();
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

unint64_t sub_235E2A368()
{
  unint64_t result;

  result = qword_2563859D0;
  if (!qword_2563859D0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E62F70, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_2563859D0);
  }
  return result;
}

uint64_t sub_235E2A3AC@<X0>(char a1@<W0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
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
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE *v33;
  id v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  int v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  _BYTE *v56;
  _BYTE *v57;
  void (*v58)(_BYTE *, uint64_t);
  _BYTE *v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  _BYTE *v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  _BYTE v82[12];
  int v83;
  uint64_t v84;
  void *v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  _BYTE *v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE *v104;
  _BYTE *v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;

  v94 = a4;
  v111 = a5;
  v112 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386828);
  MEMORY[0x24BDAC7A8](v7);
  v106 = &v82[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386830);
  v96 = *(_QWORD *)(v9 - 8);
  v97 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v95 = &v82[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386838);
  v102 = *(_QWORD *)(v11 - 8);
  v103 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v101 = &v82[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386840);
  v108 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v105 = &v82[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386848);
  v92 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v90 = &v82[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386850);
  v91 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v89 = &v82[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v20 = &v82[-v19];
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386858);
  v99 = *(_QWORD *)(v21 - 8);
  v100 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v98 = &v82[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386860);
  v107 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v104 = &v82[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = sub_235E60AA0();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = &v82[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v28 = 0;
  if ((a1 & 1) == 0)
  {
    v29 = v112;
    swift_beginAccess();
    v30 = *(_QWORD *)(v29 + 24);
    if (*(_QWORD *)(v30 + 16))
    {
      v31 = v27;
      v32 = v25;
      v33 = v20;
      v34 = a3;
      v35 = sub_235E277B4((uint64_t)v34);
      if ((v36 & 1) != 0)
      {
        v28 = *(void **)(*(_QWORD *)(v30 + 56) + 8 * v35);
        swift_bridgeObjectRetain();
      }
      else
      {
        v28 = 0;
      }

      v20 = v33;
      v25 = v32;
      v27 = v31;
    }
    else
    {
      v28 = 0;
    }
    swift_endAccess();
  }
  if (qword_2563854D0 != -1)
    swift_once();
  v37 = __swift_project_value_buffer(v24, (uint64_t)qword_256386DC8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v25 + 16))(v27, v37, v24);
  swift_bridgeObjectRetain_n();
  v38 = v25;
  v39 = a3;
  v40 = sub_235E60A88();
  v41 = sub_235E6119C();
  v42 = v41;
  v43 = os_log_type_enabled(v40, v41);
  v93 = v39;
  if (v43)
  {
    v44 = swift_slowAlloc();
    v87 = v38;
    v45 = v44;
    v85 = (void *)swift_slowAlloc();
    v114 = v85;
    *(_DWORD *)v45 = 136315394;
    v46 = objc_msgSend(v39, sel_sectionIdentifier, v45 + 4);
    v83 = v42;
    v86 = v27;
    v47 = v46;
    v48 = sub_235E6104C();
    v88 = v14;
    v49 = v48;
    v84 = v24;
    v50 = v16;
    v52 = v51;

    v113 = sub_235E2AEC4(v49, v52, (uint64_t *)&v114);
    sub_235E61430();

    v16 = v50;
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    if (v28)
      v53 = 0x676E697375;
    else
      v53 = 0x2074756F68746977;
    if (v28)
      v54 = 0xE500000000000000;
    else
      v54 = 0xED0000676E697375;
    v113 = sub_235E2AEC4(v53, v54, (uint64_t *)&v114);
    v14 = v88;
    sub_235E61430();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235E24000, v40, (os_log_type_t)v83, "Loading parameter values for %s %s cache", (uint8_t *)v45, 0x16u);
    v55 = v85;
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v55, -1, -1);
    MEMORY[0x23B7E3DAC](v45, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v87 + 8))(v86, v84);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(_BYTE *, uint64_t))(v38 + 8))(v27, v24);
  }
  v114 = v28;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386868);
  v56 = v90;
  sub_235E60BCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386810);
  v57 = v89;
  sub_235E60BB4();
  (*(void (**)(_BYTE *, uint64_t))(v92 + 8))(v56, v14);
  sub_235E61418();
  v58 = *(void (**)(_BYTE *, uint64_t))(v91 + 8);
  v58(v57, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
  sub_235E29CC0(&qword_256386870, &qword_256386850, MEMORY[0x24BDBA198]);
  v59 = v98;
  sub_235E60CEC();
  v58(v20, v16);
  v60 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v61 = swift_allocObject();
  v62 = v94;
  *(_QWORD *)(v61 + 16) = v94;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386878);
  swift_allocObject();
  v63 = v62;
  v114 = (id)sub_235E60BE4();
  sub_235E29CC0(&qword_256386880, &qword_256386878, MEMORY[0x24BDB9E58]);
  v64 = (void *)sub_235E60BFC();

  swift_release();
  v114 = v64;
  *(_QWORD *)(swift_allocObject() + 16) = v63;
  v65 = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386888);
  sub_235E29CC0(&qword_256386890, &qword_256386888, MEMORY[0x24BDB9AF8]);
  v66 = v95;
  sub_235E60C38();
  swift_release();
  swift_release();
  *(_QWORD *)(swift_allocObject() + 16) = v28;
  sub_235E29CC0(&qword_256386898, &qword_256386830, MEMORY[0x24BDB96C0]);
  v67 = v101;
  v68 = v97;
  sub_235E60C68();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v96 + 8))(v66, v68);
  sub_235E26AC8(0, (unint64_t *)&qword_2563859F0);
  v114 = (id)sub_235E611FC();
  v69 = sub_235E611CC();
  v70 = (uint64_t)v106;
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v106, 1, 1, v69);
  sub_235E29CC0(&qword_2563868A0, &qword_256386838, MEMORY[0x24BDB97F8]);
  sub_235E48C20((unint64_t *)&qword_2563868A8, (unint64_t *)&qword_2563859F0, 0x24BDAC4D0, MEMORY[0x24BEE5670]);
  v71 = v105;
  v72 = v103;
  sub_235E60C98();
  sub_235E47D24(v70);

  (*(void (**)(_BYTE *, uint64_t))(v102 + 8))(v67, v72);
  sub_235E29CC0(&qword_2563868B0, &qword_256386858, MEMORY[0x24BDB95F8]);
  sub_235E29CC0(&qword_2563868B8, &qword_256386840, MEMORY[0x24BDB9A08]);
  v73 = v104;
  v74 = v100;
  v75 = v110;
  sub_235E60C50();
  (*(void (**)(_BYTE *, uint64_t))(v108 + 8))(v71, v75);
  (*(void (**)(_BYTE *, uint64_t))(v99 + 8))(v59, v74);
  v76 = swift_allocObject();
  swift_weakInit();
  v77 = swift_allocObject();
  v78 = v93;
  *(_QWORD *)(v77 + 16) = v76;
  *(_QWORD *)(v77 + 24) = v78;
  sub_235E29CC0(&qword_2563868C0, &qword_256386860, MEMORY[0x24BDB9798]);
  v79 = v78;
  v80 = v109;
  sub_235E60C14();
  swift_release();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v107 + 8))(v73, v80);
}

uint64_t sub_235E2AEC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235E2AFD0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235E2AF94((uint64_t)v12, *a3);
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
      sub_235E2AF94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_235E2AF94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235E2AFD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235E6143C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235E2B188(a5, a6);
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
  v8 = sub_235E61520();
  if (!v8)
  {
    sub_235E615EC();
    __break(1u);
LABEL_17:
    result = sub_235E61640();
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

uint64_t sub_235E2B188(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235E2B21C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235E5D52C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235E5D52C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235E2B21C(uint64_t a1, unint64_t a2)
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
      v3 = sub_235E2B390(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235E614FC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235E615EC();
      __break(1u);
LABEL_10:
      v2 = sub_235E6107C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235E61640();
    __break(1u);
LABEL_14:
    result = sub_235E615EC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235E2B390(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256387300);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

const char *sub_235E2B3FC()
{
  return "ActionButtonControls";
}

const char *sub_235E2B410()
{
  return "SpringBoard";
}

void sub_235E2B424(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void type metadata accessor for WFStaccatoActionSectionIdentifier(uint64_t a1)
{
  sub_235E2B424(a1, &qword_2563854E8);
}

void sub_235E2B47C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_235E287CC(a1, a2, *(void **)(v2 + 16));
}

id sub_235E2B484()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Preloader()), sel_init);
  qword_256386290 = (uint64_t)result;
  return result;
}

uint64_t sub_235E2B4B0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_235E2B4BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E2A3AC(*(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), a1);
}

uint64_t sub_235E2B4CC(uint64_t *a1)
{
  uint64_t v1;

  return sub_235E2B4D4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235E2B4D4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;

  if (!a2)
    return 1;
  v3 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_235E5CD2C(v3, a2);
  v5 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v5 ^ 1) & 1;
}

unint64_t sub_235E2B544@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_235E27324(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_235E2B550@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E3CC8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7E3CD4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_235E2B738(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E2B780()
{
  return sub_235E2B7F4(&qword_256385518, (uint64_t (*)(uint64_t))type metadata accessor for WFStaccatoActionSectionIdentifier, (uint64_t)&unk_235E624E0);
}

unint64_t sub_235E2B7AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256385548;
  if (!qword_256385548)
  {
    type metadata accessor for WFStaccatoActionSectionIdentifier(255);
    result = MEMORY[0x23B7E3CE0](&unk_235E6250C, v1);
    atomic_store(result, (unint64_t *)&qword_256385548);
  }
  return result;
}

uint64_t sub_235E2B7F4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7E3CE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_235E2B834(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_235E29208(a1, a2, *(void (**)(unint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_235E2B83C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

unint64_t sub_235E2B878(uint64_t a1)
{
  return sub_235E273AC(a1, &qword_256386C40, (uint64_t (*)(id))sub_235E277B4);
}

unint64_t sub_235E2B88C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563862B0;
  if (!qword_2563862B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563862A8);
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDB9AF8], v1);
    atomic_store(result, (unint64_t *)&qword_2563862B0);
  }
  return result;
}

id static Preloader.shared.getter()
{
  if (qword_2563854A8 != -1)
    swift_once();
  return (id)qword_256386290;
}

uint64_t dispatch thunk of Preloader.preloadResources(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t type metadata accessor for StaccatoStorage()
{
  return objc_opt_self();
}

uint64_t sub_235E2B958@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235E29DC4(a1, a2);
}

unint64_t sub_235E2B960()
{
  uint64_t v0;
  unint64_t result;

  type metadata accessor for StaccatoStorage();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  result = sub_235E2B878(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 24) = result;
  qword_2563874A0 = v0;
  return result;
}

uint64_t sub_235E2B9A8(uint64_t *a1)
{
  return sub_235E26C3C(a1);
}

uint64_t sub_235E2B9B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E27F28(*(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_235E2B9BC(uint64_t a1)
{
  uint64_t v1;

  return sub_235E2B9C4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235E2B9C4(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  if (!a2)
    return 1;
  v2 = swift_bridgeObjectRetain();
  v3 = sub_235E48018(v2);
  swift_bridgeObjectRelease();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_235E48018(v4);
  swift_bridgeObjectRelease();
  sub_235E46AF4(v3, v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v7 ^ 1) & 1;
}

uint64_t initializeBufferWithCopyOfBuffer for ButtonModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Color(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Color(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_235E2B424(a1, &qword_2563854D8);
}

void type metadata accessor for State(uint64_t a1)
{
  sub_235E2B424(a1, &qword_2563854E0);
}

void type metadata accessor for ABDeviceSceneParameter(uint64_t a1)
{
  sub_235E2B424(a1, &qword_2563854F0);
}

void sub_235E2BBB0()
{
  qword_256387450 = 0xC014000000000000;
}

void sub_235E2BBC0()
{
  qword_256387458 = 0x4014000000000000;
}

void sub_235E2BBD0()
{
  qword_256387460 = 0x4020000000000000;
}

void sub_235E2BBE0()
{
  qword_256387468 = 0x4030000000000000;
}

uint64_t sub_235E2BBF0(uint64_t a1, uint64_t a2)
{
  return sub_235E2BE64(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_235E2BC08(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_235E61040();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_235E2BC84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_235E6104C();
  v2 = sub_235E61028();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_235E2BCC4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_235E2BCCC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_235E2BCE0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_235E2BCF4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_235E2BD08(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_235E2BD38@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_235E2BD64@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_235E2BD88(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_235E2BD9C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_235E2BDB0(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_235E2BDC4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_235E2BDD8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_235E2BDEC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_235E2BE00(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_235E2BE14()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_235E2BE24()
{
  return sub_235E61454();
}

_QWORD *sub_235E2BE3C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_235E2BE58(uint64_t a1, uint64_t a2)
{
  return sub_235E2BE64(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_235E2BE64(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_235E6104C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_235E2BEA0()
{
  sub_235E6104C();
  sub_235E61064();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_235E2BEE0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_235E2BEF0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_235E2BEFC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235E2BF10@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_235E2C6D8(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_235E2BF4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_235E6104C();
  v2 = v1;
  if (v0 == sub_235E6104C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_235E2BFD4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_235E2BFE0()
{
  sub_235E2B7F4((unint64_t *)&qword_256385548, (uint64_t (*)(uint64_t))type metadata accessor for WFStaccatoActionSectionIdentifier, (uint64_t)&unk_235E6250C);
  sub_235E2B7F4((unint64_t *)&unk_256385550, (uint64_t (*)(uint64_t))type metadata accessor for WFStaccatoActionSectionIdentifier, (uint64_t)&unk_235E624AC);
  return sub_235E6164C();
}

uint64_t sub_235E2C064@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_235E6104C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235E2C08C()
{
  sub_235E2B7F4((unint64_t *)&qword_2563855A0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_235E62938);
  sub_235E2B7F4(&qword_2563855A8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_235E6288C);
  return sub_235E6164C();
}

uint64_t sub_235E2C110@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235E61028();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_235E2C154()
{
  sub_235E2B7F4(&qword_256385930, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6274C);
  sub_235E2B7F4(&qword_256385560, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6238C);
  return sub_235E6164C();
}

uint64_t sub_235E2C1D8()
{
  return sub_235E2B7F4(&qword_2563854F8, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E62354);
}

uint64_t sub_235E2C204()
{
  return sub_235E2B7F4(&qword_256385500, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6232C);
}

uint64_t sub_235E2C230()
{
  return sub_235E2B7F4(&qword_256385508, (uint64_t (*)(uint64_t))type metadata accessor for WFStaccatoActionSectionIdentifier, (uint64_t)&unk_235E62470);
}

uint64_t sub_235E2C25C()
{
  return sub_235E2B7F4(&qword_256385510, (uint64_t (*)(uint64_t))type metadata accessor for WFStaccatoActionSectionIdentifier, (uint64_t)&unk_235E62444);
}

uint64_t sub_235E2C288()
{
  return sub_235E2B7F4(&qword_256385520, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&unk_235E625DC);
}

uint64_t sub_235E2C2B4()
{
  return sub_235E2B7F4(&qword_256385528, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&unk_235E625A8);
}

uint64_t sub_235E2C2E0()
{
  return sub_235E2B7F4(&qword_256385530, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&unk_235E62608);
}

uint64_t sub_235E2C30C()
{
  return sub_235E2B7F4(&qword_256385538, (uint64_t (*)(uint64_t))type metadata accessor for State, (uint64_t)&unk_235E62644);
}

uint64_t sub_235E2C338()
{
  return sub_235E2B7F4(&qword_256385540, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E623BC);
}

id sub_235E2C364(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, *MEMORY[0x24BEBE0B8]);
  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, v2);
  v4 = (void *)objc_opt_self();
  objc_msgSend(v3, sel_pointSize);
  v5 = objc_msgSend(v4, sel_systemFontOfSize_weight_);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD5F0]), sel_initForTextStyle_, a1);
  v7 = objc_msgSend(v6, sel_scaledFontForFont_, v5);

  return v7;
}

id sub_235E2C48C()
{
  id v0;
  id v1;
  id v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  v1 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v1);

  v2 = sub_235E2C364(*MEMORY[0x24BEBE240]);
  objc_msgSend(v0, sel_setFont_, v2);

  objc_msgSend(v0, sel_setNumberOfLines_, 2);
  objc_msgSend(v0, sel_setLineBreakMode_, 4);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v0, sel_setMinimumScaleFactor_, 0.95);
  return v0;
}

id sub_235E2C5B4()
{
  id v0;
  id v1;
  id v2;
  id v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 1.0, 0.6);
  objc_msgSend(v0, sel_setTextColor_, v1);

  v2 = sub_235E2C364(*MEMORY[0x24BEBE220]);
  objc_msgSend(v0, sel_setFont_, v2);

  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  v3 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v3, sel_setCompositingFilter_, *MEMORY[0x24BDE5BD8]);

  return v0;
}

uint64_t sub_235E2C6D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_235E2B424(a1, &qword_256385568);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_235E2C730(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_235E2C750(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_235E2B424(a1, &qword_256385570);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_235E2B424(a1, &qword_256385578);
}

void type metadata accessor for CHSControlType(uint64_t a1)
{
  sub_235E2B424(a1, &qword_256385580);
}

uint64_t sub_235E2C7B4()
{
  return sub_235E2B7F4(&qword_256385588, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_235E62850);
}

uint64_t sub_235E2C7E0()
{
  return sub_235E2B7F4(&qword_256385590, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_235E62824);
}

uint64_t sub_235E2C80C()
{
  return sub_235E2B7F4(&qword_256385598, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_235E628C0);
}

id sub_235E2C894()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FindClass()
{
  return objc_opt_self();
}

id sub_235E2C8E8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for FindClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256387470 = (uint64_t)result;
  return result;
}

BOOL sub_235E2C93C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_235E2C950()
{
  sub_235E6173C();
  sub_235E61748();
  return sub_235E61754();
}

uint64_t sub_235E2C994()
{
  return sub_235E61748();
}

uint64_t sub_235E2C9BC()
{
  sub_235E6173C();
  sub_235E61748();
  return sub_235E61754();
}

uint64_t sub_235E2CA0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  v1 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5)
      goto LABEL_23;
    v10 = *(_QWORD *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      v7 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_23;
      v10 = *(_QWORD *)(v1 + 8 * v7);
      if (!v10)
      {
        v7 = v9 + 2;
        if (v9 + 2 >= v5)
          goto LABEL_23;
        v10 = *(_QWORD *)(v1 + 8 * v7);
        if (!v10)
        {
          v7 = v9 + 3;
          if (v9 + 3 >= v5)
            goto LABEL_23;
          v10 = *(_QWORD *)(v1 + 8 * v7);
          if (!v10)
            break;
        }
      }
    }
LABEL_22:
    v4 = (v10 - 1) & v10;
LABEL_5:
    v8 = swift_bridgeObjectRetain();
    result = sub_235E29784(v8);
  }
  v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return v12;
  }
  v10 = *(_QWORD *)(v1 + 8 * v11);
  if (v10)
  {
    v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v7 >= v5)
      goto LABEL_23;
    v10 = *(_QWORD *)(v1 + 8 * v7);
    ++v11;
    if (v10)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_235E2CB78()
{
  swift_release();
  return swift_deallocObject();
}

void sub_235E2CB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = qword_2563854D0;
  swift_retain();
  if (v5 != -1)
    swift_once();
  v6 = sub_235E60AA0();
  __swift_project_value_buffer(v6, (uint64_t)qword_256386DC8);
  v7 = sub_235E60A88();
  v8 = sub_235E6119C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_235E24000, v7, v8, "Fetching default action...", v9, 2u);
    MEMORY[0x23B7E3DAC](v9, -1, -1);
  }

  v10 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_235E291F8;
  *(_QWORD *)(v11 + 24) = v4;
  v13[4] = sub_235E2D570;
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_235E2D148;
  v13[3] = &block_descriptor_27;
  v12 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v10, sel_defaultStaccatoActionWithCompletion_, v12);
  _Block_release(v12);

}

void sub_235E2CD4C(void *a1, void *a2, void (*a3)(void *, uint64_t))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  _BYTE *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  uint8_t *buf;
  uint64_t v33;
  uint64_t v34;

  if (a1 && (objc_opt_self(), (v6 = swift_dynamicCastObjCClass()) != 0))
  {
    if (!a2)
    {
      v7 = (void *)v6;
      v8 = qword_2563854D0;
      v9 = a1;
      if (v8 != -1)
        swift_once();
      v10 = sub_235E60AA0();
      __swift_project_value_buffer(v10, (uint64_t)qword_256386DC8);
      v11 = v9;
      v12 = sub_235E60A88();
      v13 = sub_235E6119C();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v33 = swift_slowAlloc();
        v34 = v33;
        *(_DWORD *)v14 = 136315138;
        buf = v14;
        v15 = objc_msgSend(v7, sel_sectionIdentifier);
        v16 = sub_235E6104C();
        v18 = v17;

        sub_235E2AEC4(v16, v18, &v34);
        sub_235E61430();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235E24000, v12, v13, "Fetched %s", buf, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7E3DAC](v33, -1, -1);
        MEMORY[0x23B7E3DAC](buf, -1, -1);

      }
      else
      {

      }
      v31 = v11;
      a3(v7, 0);

      return;
    }
  }
  else if (!a2)
  {
    sub_235E2D478();
    v19 = (void *)swift_allocError();
    *v20 = 2;
    goto LABEL_11;
  }
  v19 = a2;
LABEL_11:
  v21 = a2;
  if (qword_2563854D0 != -1)
    swift_once();
  v22 = sub_235E60AA0();
  __swift_project_value_buffer(v22, (uint64_t)qword_256386DC8);
  v23 = v19;
  v24 = v19;
  v25 = sub_235E60A88();
  v26 = sub_235E6119C();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    v29 = v19;
    v34 = _swift_stdlib_bridgeErrorToNSError();
    sub_235E61430();
    *v28 = v34;

    _os_log_impl(&dword_235E24000, v25, v26, "Failed to fetch default action %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v28, -1, -1);
    MEMORY[0x23B7E3DAC](v27, -1, -1);
  }
  else
  {

  }
  v30 = v19;
  a3(v19, 1);

}

void sub_235E2D148(uint64_t a1, void *a2, void *a3)
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

void sub_235E2D1BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385658);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  sub_235E26AC8(0, (unint64_t *)&qword_256385650);
  v9 = (void *)sub_235E60FEC();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_235E2D520;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235E2D148;
  aBlock[3] = &block_descriptor_9;
  v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_configuredStaccatoActionFromTemplate_valuesByParameterKey_completion_, a3, v9, v12);
  _Block_release(v12);

}

uint64_t sub_235E2D340(void *a1, id a2)
{
  id v4;
  id v6;
  id v7;
  void *v8;

  if (a1 && (objc_opt_self(), swift_dynamicCastObjCClass()))
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385658);
    return sub_235E6110C();
  }
  else
  {
    if (a2)
    {
      v6 = a2;
    }
    else
    {
      sub_235E6104C();
      v7 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v8 = (void *)sub_235E61028();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_initWithDomain_code_userInfo_, v8, 0, 0);

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385658);
    return sub_235E61100();
  }
}

uint64_t sub_235E2D44C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

unint64_t sub_235E2D478()
{
  unint64_t result;

  result = qword_256385640;
  if (!qword_256385640)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E62A6C, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_256385640);
  }
  return result;
}

uint64_t sub_235E2D4BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385658);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_235E2D520(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385658);
  return sub_235E2D340(a1, a2);
}

void sub_235E2D570(void *a1, void *a2)
{
  uint64_t v2;

  sub_235E2CD4C(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s6ErrorsOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s6ErrorsOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E2D660 + 4 * byte_235E629E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235E2D694 + 4 * byte_235E629E0[v4]))();
}

uint64_t sub_235E2D694(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E2D69C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E2D6A4);
  return result;
}

uint64_t sub_235E2D6B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E2D6B8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235E2D6BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E2D6C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E2D6D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235E2D6D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

unint64_t sub_235E2D6F4()
{
  unint64_t result;

  result = qword_256385668;
  if (!qword_256385668)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E62A44, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_256385668);
  }
  return result;
}

uint64_t sub_235E2D760(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v13 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = (void *)a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = a2[6];
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    v8 = *(int *)(a3 + 32);
    v9 = (_QWORD *)(a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    *(_QWORD *)(a1 + 48) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = v6;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_235E60D4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_235E2D888(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_235E60D4C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_235E2D920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v7 = *(int *)(a3 + 32);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = v5;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_235E60D4C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_235E2DA14(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a1[3];
  v7 = (void *)a2[3];
  a1[3] = v7;
  v8 = v7;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
  v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 32);
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    sub_235E30A00((uint64_t)a1 + v10, &qword_256385A10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_235E60D4C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_235E2DB4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 32);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_235E60D4C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_235E2DC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 32);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_235E30A00(a1 + v8, &qword_256385A10);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_235E60D4C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_235E2DD1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235E2DD28(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385670);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_235E2DDA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235E2DDB4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385670);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for GroupedParameterConfigurationView()
{
  uint64_t result;

  result = qword_2563856D0;
  if (!qword_2563856D0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235E2DE68()
{
  unint64_t v0;

  sub_235E2DF00();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_235E2DF00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2563856E0)
  {
    sub_235E60D4C();
    v0 = sub_235E60D34();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2563856E0);
  }
}

uint64_t sub_235E2DF54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_235E2DF64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v22 = a2;
  v21 = sub_235E60DD0();
  v19 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385740);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385738);
  v20 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385760);
  sub_235E2FECC(&qword_256385768, &qword_256385760, (uint64_t (*)(void))sub_235E2FCF4);
  sub_235E60E48();
  v12 = a1[1];
  v24 = *a1;
  v25 = v12;
  v13 = sub_235E29CC0(&qword_256385748, &qword_256385740, MEMORY[0x24BDF1988]);
  v14 = sub_235E2FCA8();
  v15 = MEMORY[0x24BEE0D00];
  sub_235E60EB4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = v19;
  v17 = v21;
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v4, *MEMORY[0x24BDEE5F0], v21);
  v24 = v5;
  v25 = v15;
  v26 = v13;
  v27 = v14;
  swift_getOpaqueTypeConformance2();
  sub_235E60ECC();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v11, v9);
}

uint64_t sub_235E2E194(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v2 = type metadata accessor for GroupedParameterConfigurationView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v8[1] = *(_QWORD *)(a1 + 16);
  swift_getKeyPath();
  sub_235E3000C(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_235E30054((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385808);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385778);
  sub_235E29CC0(&qword_256385810, &qword_256385808, MEMORY[0x24BEE12D8]);
  sub_235E300A4();
  sub_235E2FCF4();
  return sub_235E60F68();
}

void sub_235E2E2E4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_title);
  if (v3)
  {
    v4 = v3;
    v5 = sub_235E6104C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_235E2E348(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_235E61028();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setTitle_);

}

uint64_t sub_235E2E3A4@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  char *v21;
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
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  _BYTE v55[56];
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;

  v51 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385820);
  MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_235E60D1C();
  v45 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v43 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385780);
  v47 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v41 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385828);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v42 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v52 = a2;
  v53 = v10;
  v11 = sub_235E60DDC();
  sub_235E2E93C(v10, (uint64_t)&v54);
  v40 = v54;
  v39 = *(_OWORD *)v55;
  v38 = *(_OWORD *)&v55[16];
  v37 = *(_OWORD *)&v55[32];
  v12 = *(_QWORD *)&v55[48];
  v13 = v56;
  v14 = BYTE8(v56);
  v15 = v57;
  v16 = v58;
  v17 = v59;
  v18 = v60;
  v67 = 1;
  v66 = v59;
  v19 = sub_235E60EFC();
  KeyPath = swift_getKeyPath();
  v54 = (unint64_t)v11;
  v55[0] = 1;
  *(_OWORD *)&v55[8] = v40;
  *(_OWORD *)&v55[24] = v39;
  *(_OWORD *)&v55[40] = v38;
  v56 = v37;
  v57 = v12;
  v58 = v13;
  v59 = v14;
  v60 = v15;
  v61 = v16;
  v62 = v17;
  v63 = v18;
  v64 = KeyPath;
  v65 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385798);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563857C8);
  sub_235E2FE30();
  sub_235E2FECC(&qword_2563857C0, &qword_2563857C8, (uint64_t (*)(void))sub_235E2FF30);
  v21 = v41;
  sub_235E60F74();
  v22 = v45;
  v23 = v43;
  v24 = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v43, *MEMORY[0x24BDEB1C0], v46);
  sub_235E2FDA0();
  v25 = v42;
  v26 = v44;
  sub_235E60EC0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v21, v26);
  v27 = sub_235E60E6C();
  v28 = (uint64_t)v50;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v50, 1, 1, v27);
  v29 = swift_getKeyPath();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385778);
  v31 = v51;
  v32 = (uint64_t *)(v51 + *(int *)(v30 + 36));
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385800);
  sub_235E30A3C(v28, (uint64_t)v32 + *(int *)(v33 + 28), &qword_256385820);
  *v32 = v29;
  v34 = v48;
  v35 = v49;
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 16))(v31, v25, v49);
  sub_235E30A00(v28, &qword_256385820);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v25, v35);
}

uint64_t sub_235E2E7C0(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v4 = type metadata accessor for GroupedParameterConfigurationView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = objc_msgSend(a2, sel_values);
  sub_235E30460();
  v8 = sub_235E610AC();

  v12[1] = v8;
  swift_getKeyPath();
  sub_235E3000C(a1, (uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  sub_235E30054((uint64_t)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385830);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563857D8);
  sub_235E29CC0(&qword_256385838, &qword_256385830, MEMORY[0x24BEE12D8]);
  sub_235E2FF30();
  return sub_235E60F68();
}

uint64_t sub_235E2E93C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v4 = objc_msgSend(a1, sel_image);
  v5 = 0;
  if (v4
    && (v6 = v4, v7 = objc_msgSend(v4, sel_platformImage), v6, v7))
  {
    v8 = v7;
    v43 = sub_235E60F08();
    sub_235E60F8C();
    v5 = v9;
    v11 = v10;
    v12 = sub_235E60E24();
    sub_235E60D10();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v41 = 0x3FF6666666666666;
    v42 = v12;
  }
  else
  {
    v42 = 0;
    v43 = 0;
    v41 = 0;
    v11 = 0;
    v14 = 0;
    v16 = 0;
    v18 = 0;
    v20 = 0;
  }
  v21 = objc_msgSend(a1, sel_title);
  if (v21)
  {
    v22 = v21;
    sub_235E6104C();

  }
  sub_235E2FCA8();
  v23 = sub_235E60E84();
  v25 = v24;
  v27 = v26 & 1;
  sub_235E60E3C();
  v28 = sub_235E60E78();
  v30 = v29;
  v32 = v31;
  swift_release();
  sub_235E30440(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_235E60E30();
  v33 = sub_235E60E54();
  v35 = v34;
  v37 = v36;
  v39 = v38 & 1;
  sub_235E30440(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v43;
  *(_QWORD *)(a2 + 8) = v41;
  *(_QWORD *)(a2 + 16) = v41;
  *(_QWORD *)(a2 + 24) = v5;
  *(_QWORD *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = v42;
  *(_QWORD *)(a2 + 48) = v14;
  *(_QWORD *)(a2 + 56) = v16;
  *(_QWORD *)(a2 + 64) = v18;
  *(_QWORD *)(a2 + 72) = v20;
  *(_BYTE *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = v33;
  *(_QWORD *)(a2 + 96) = v35;
  *(_BYTE *)(a2 + 104) = v39;
  *(_QWORD *)(a2 + 112) = v37;
  swift_retain();
  sub_235E30450(v33, v35, v39);
  swift_bridgeObjectRetain();
  sub_235E30440(v33, v35, v39);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_235E2EBCC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_identifier);
  v4 = sub_235E6104C();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

uint64_t sub_235E2EC20@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  _BYTE v20[16];
  void *v21;
  uint64_t v22;

  v6 = type metadata accessor for GroupedParameterConfigurationView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563857E8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = *a1;
  sub_235E3000C(a2, (uint64_t)&v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = swift_allocObject();
  sub_235E30054((uint64_t)&v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v15 + v14);
  *(_QWORD *)(v15 + ((v8 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
  v21 = v13;
  v22 = a2;
  v16 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385840);
  sub_235E29CC0(&qword_256385848, &qword_256385840, MEMORY[0x24BDF4498]);
  sub_235E60F5C();
  v17 = sub_235E60DE8();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v10 + 16))(a3, v12, v9);
  v18 = (uint64_t *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563857D8) + 36));
  *v18 = v17;
  v18[1] = (uint64_t)sub_235E2FA58;
  v18[2] = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_235E2EDD8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _QWORD v10[2];
  __int128 v11;

  v4 = sub_235E60D4C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_OWORD *)(a1 + 24);
  v10[1] = a2;
  v8 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385888);
  sub_235E60F50();
  (*(void (**)(void *))(a1 + 40))(a2);
  type metadata accessor for GroupedParameterConfigurationView();
  sub_235E30108((uint64_t)v7);
  sub_235E60D40();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_235E2EEB0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = sub_235E60DDC();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385850);
  return sub_235E2EF0C(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_235E2EF0C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
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
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  _BYTE *v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t KeyPath;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  _BYTE v105[240];
  id v106[30];
  __int128 v107;
  unsigned __int8 v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  int64x2_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  char v126;
  _BYTE *v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  char v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  char v146;
  _BYTE *v147;
  uint64_t v148;
  _BYTE v149[248];

  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385858);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v81 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v82 = (uint64_t)&v79 - v8;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385860);
  v93 = *(_QWORD *)(v95 - 8);
  v9 = MEMORY[0x24BDAC7A8](v95);
  v11 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v80 = (char *)&v79 - v12;
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385868);
  MEMORY[0x24BDAC7A8](v92);
  v94 = (uint64_t)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385870);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v98 = (uint64_t)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v97 = (uint64_t)&v79 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385878);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend(a1, sel_image);
  if (v21
    && (v22 = v21, v23 = objc_msgSend(v21, sel_UIImage), v22, v23))
  {
    v89 = sub_235E60DF4();
    v88 = v23;
    sub_235E60F08();
    v91 = v11;
    v24 = *MEMORY[0x24BDF4068];
    v25 = sub_235E60F2C();
    v26 = *(_QWORD *)(v25 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v20, v24, v25);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v20, 0, 1, v25);
    v87 = (void *)sub_235E60F20();
    swift_release();
    sub_235E30A00((uint64_t)v20, &qword_256385878);
    v86 = sub_235E60EE4();
    KeyPath = swift_getKeyPath();
    sub_235E60F8C();
    v28 = v27;
    v30 = v29;
    sub_235E60F80();
    sub_235E60D70();
    v31 = v135;
    v32 = v137;
    v33 = v139;
    v34 = v141;
    v90 = a2;
    v35 = v143;
    v36 = v145;
    v83 = v148;
    v84 = v147;
    v105[0] = 1;
    v104 = v136;
    v103 = v138;
    v102 = v140;
    v101 = v142;
    v100 = v144;
    v99 = v146;
    LOBYTE(v25) = sub_235E60E24();
    sub_235E60D10();
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    LOBYTE(v106[0]) = 0;
    v107 = (unint64_t)v89;
    v108 = v105[0];
    v109 = v87;
    v110 = KeyPath;
    v111 = v86;
    v112 = vdupq_n_s64(0x3FF6666666666666uLL);
    v113 = v28;
    v114 = v30;
    v115 = v31;
    v116 = v104;
    v117 = v32;
    v118 = v103;
    v119 = v33;
    v120 = v102;
    v121 = v34;
    v122 = v101;
    v123 = v35;
    a2 = v90;
    v11 = v91;
    v124 = v100;
    v125 = v36;
    v126 = v99;
    v127 = v84;
    v128 = v83;
    v129 = v25;
    v130 = v38;
    v131 = v40;
    v132 = v42;
    v133 = v44;
    v134 = 0;
    nullsub_1(&v107);
  }
  else
  {
    sub_235E3076C(&v107);
  }
  sub_235E30794((uint64_t)&v107, (uint64_t)v149, &qword_256385880);
  v87 = (void *)a3;
  v84 = (_BYTE *)(a3 + 256);
  v83 = sub_235E60DF4();
  sub_235E2F828(a1, (uint64_t)&v107);
  v86 = *((_QWORD *)&v107 + 1);
  v45 = v107;
  LODWORD(KeyPath) = v108;
  v90 = v111;
  v91 = (char *)v110;
  v88 = v109;
  v46 = v112.i64[1];
  v89 = v112.i64[0];
  v47 = objc_msgSend(a1, sel_identifier);
  v48 = sub_235E6104C();
  v50 = v49;

  v107 = *(_OWORD *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385888);
  sub_235E60F44();
  v51 = v106[0];
  if (!v106[0])
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v52 = objc_msgSend(v106[0], sel_identifier);

  v53 = sub_235E6104C();
  v55 = v54;

  if (v48 != v53 || v50 != v55)
  {
    v56 = sub_235E616D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v56 & 1) != 0)
      goto LABEL_11;
LABEL_12:
    *(_QWORD *)&v107 = sub_235E60F14();
    v63 = MEMORY[0x24BDF4108];
    v64 = MEMORY[0x24BDF40E8];
    sub_235E60ED8();
    swift_release();
    v65 = v93;
    v66 = (uint64_t)v81;
    v67 = v95;
    (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v81, v11, v95);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v11, v67);
    v68 = v82;
    sub_235E30794(v66, v82, &qword_256385858);
    sub_235E30A3C(v68, v94, &qword_256385858);
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)&v107 = v63;
    *((_QWORD *)&v107 + 1) = v64;
    swift_getOpaqueTypeConformance2();
    sub_235E307D8();
    v62 = v97;
    sub_235E60E0C();
    sub_235E30A00(v68, &qword_256385858);
    goto LABEL_13;
  }
  swift_bridgeObjectRelease_n();
LABEL_11:
  *(_QWORD *)&v107 = sub_235E60F14();
  v57 = MEMORY[0x24BDF4108];
  v58 = MEMORY[0x24BDF40E8];
  v59 = v80;
  sub_235E60ED8();
  swift_release();
  v60 = v93;
  v61 = v95;
  (*(void (**)(uint64_t, char *, uint64_t))(v93 + 16))(v94, v59, v95);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v107 = v57;
  *((_QWORD *)&v107 + 1) = v58;
  swift_getOpaqueTypeConformance2();
  sub_235E307D8();
  v62 = v97;
  sub_235E60E0C();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
LABEL_13:
  sub_235E30794((uint64_t)v149, (uint64_t)v105, &qword_256385880);
  sub_235E30A3C(v62, v98, &qword_256385870);
  sub_235E30794((uint64_t)v105, (uint64_t)v106, &qword_256385880);
  v69 = v87;
  sub_235E30794((uint64_t)v106, (uint64_t)v87, &qword_256385880);
  v70 = v84;
  v69[30] = v83;
  v69[31] = 0;
  *v70 = 1;
  v71 = v86;
  v69[33] = v45;
  v69[34] = v71;
  v72 = KeyPath;
  v70[24] = KeyPath;
  v73 = v89;
  v75 = v90;
  v74 = (uint64_t)v91;
  v69[36] = v88;
  v69[37] = v74;
  v69[38] = v75;
  v69[39] = v73;
  v69[40] = v46;
  v69[41] = 0;
  v70[80] = 1;
  v76 = (uint64_t)v69 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563858A0) + 80);
  v77 = v98;
  sub_235E30A3C(v98, v76, &qword_256385870);
  sub_235E30948((uint64_t)v106, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_235E308AC);
  sub_235E30450(v45, v71, v72);
  swift_bridgeObjectRetain();
  sub_235E308E8(v74, v75, v73, v46);
  sub_235E30A00(v97, &qword_256385870);
  sub_235E30A00(v77, &qword_256385870);
  sub_235E30440(v45, v71, v72);
  swift_bridgeObjectRelease();
  sub_235E30918(v74, v75, v73, v46);
  sub_235E30794((uint64_t)v105, (uint64_t)&v107, &qword_256385880);
  return sub_235E30948((uint64_t)&v107, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_235E309C4);
}

uint64_t sub_235E2F828@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v4 = objc_msgSend(a1, sel_localizedTitle);
  sub_235E6104C();

  sub_235E2FCA8();
  v5 = sub_235E60E84();
  v7 = v6;
  v9 = v8 & 1;
  sub_235E60EFC();
  v10 = sub_235E60E60();
  v33 = v11;
  v32 = v12;
  v14 = v13;
  swift_release();
  sub_235E30440(v5, v7, v9);
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(a1, sel_localizedSubtitle);
  if (v15)
  {
    sub_235E6104C();

    v16 = sub_235E60E84();
    v18 = v17;
    v31 = v14;
    v20 = v19 & 1;
    sub_235E60EF0();
    v21 = sub_235E60E60();
    v15 = v22;
    v23 = v10;
    v25 = v24;
    v27 = v26;
    swift_release();
    v28 = v25 & 1;
    v10 = v23;
    v29 = v20;
    v14 = v31;
    sub_235E30440(v16, v18, v29);
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
    v28 = 0;
    v27 = 0;
  }
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v33;
  *(_BYTE *)(a2 + 16) = v32 & 1;
  *(_QWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v21;
  *(_QWORD *)(a2 + 40) = v15;
  *(_QWORD *)(a2 + 48) = v28;
  *(_QWORD *)(a2 + 56) = v27;
  sub_235E30450(v10, v33, v32 & 1);
  swift_bridgeObjectRetain();
  sub_235E308E8(v21, (uint64_t)v15, v28, v27);
  sub_235E30918(v21, (uint64_t)v15, v28, v27);
  sub_235E30440(v10, v33, v32 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E2FA58()
{
  uint64_t v0;

  v0 = sub_235E60DF4();
  return MEMORY[0x23B7E2E40](v0);
}

uint64_t sub_235E2FA84()
{
  return sub_235E60EA8();
}

uint64_t sub_235E2FA9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t OpaqueTypeConformance2;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[16];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385720);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385728);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385730);
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385738);
  v11 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385740);
  v12 = sub_235E29CC0(&qword_256385748, &qword_256385740, MEMORY[0x24BDF1988]);
  v13 = sub_235E2FCA8();
  v22 = v11;
  v23 = MEMORY[0x24BEE0D00];
  v24 = v12;
  v25 = v13;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v22 = v10;
  v23 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_235E60D58();
  v15 = *MEMORY[0x24BDEB3F0];
  v16 = sub_235E60D28();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v17 + 104))(v5, v15, v16);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v5, 0, 1, v16);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385758);
  sub_235E30A3C((uint64_t)v5, a1 + *(int *)(v18 + 36), &qword_256385720);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 16))(a1, v9, v6);
  sub_235E30A00((uint64_t)v5, &qword_256385720);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_235E2FCA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E2DF64(*(_QWORD **)(v1 + 16), a1);
}

unint64_t sub_235E2FCA8()
{
  unint64_t result;

  result = qword_256385750;
  if (!qword_256385750)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256385750);
  }
  return result;
}

uint64_t sub_235E2FCEC()
{
  uint64_t v0;

  return sub_235E2E194(*(_QWORD *)(v0 + 16));
}

unint64_t sub_235E2FCF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256385770;
  if (!qword_256385770)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385778);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385780);
    v2[3] = sub_235E2FDA0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_235E29CC0(&qword_2563857F8, &qword_256385800, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256385770);
  }
  return result;
}

unint64_t sub_235E2FDA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_256385788;
  if (!qword_256385788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385780);
    v2[0] = sub_235E2FE30();
    v2[1] = sub_235E2FECC(&qword_2563857C0, &qword_2563857C8, (uint64_t (*)(void))sub_235E2FF30);
    v2[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256385788);
  }
  return result;
}

unint64_t sub_235E2FE30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256385790;
  if (!qword_256385790)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385798);
    v2[0] = sub_235E29CC0(&qword_2563857A0, &qword_2563857A8, MEMORY[0x24BDF4498]);
    v2[1] = sub_235E29CC0(&qword_2563857B0, &qword_2563857B8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256385790);
  }
  return result;
}

uint64_t sub_235E2FECC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDF4A08], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235E2FF30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563857D0;
  if (!qword_2563857D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563857D8);
    v2[0] = sub_235E29CC0(&qword_2563857E0, &qword_2563857E8, MEMORY[0x24BDF43B0]);
    v2[1] = sub_235E2FFB4();
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563857D0);
  }
  return result;
}

unint64_t sub_235E2FFB4()
{
  unint64_t result;

  result = qword_2563857F0;
  if (!qword_2563857F0)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDF08D8], MEMORY[0x24BDF08E8]);
    atomic_store(result, (unint64_t *)&qword_2563857F0);
  }
  return result;
}

char *keypath_get_selector_title()
{
  return sel_title;
}

uint64_t sub_235E3000C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GroupedParameterConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E30054(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GroupedParameterConfigurationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E30098(uint64_t a1)
{
  return sub_235E305DC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_235E2E3A4);
}

unint64_t sub_235E300A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_256385818;
  if (!qword_256385818)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_256385CD0);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_256385818);
  }
  return result;
}

uint64_t sub_235E30100()
{
  uint64_t v0;

  return sub_235E2E7C0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235E30108@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = v1;
  v4 = sub_235E60DC4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E30A3C(v2, (uint64_t)v9, &qword_256385A10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_235E60D4C();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    v12 = sub_235E61190();
    v13 = sub_235E60E18();
    v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18[1] = a1;
      v17 = v16;
      v19 = v16;
      *(_DWORD *)v15 = 136315138;
      v18[2] = sub_235E2AEC4(0x417373696D736944, 0xED00006E6F697463, &v19);
      sub_235E61430();
      _os_log_impl(&dword_235E24000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v17, -1, -1);
      MEMORY[0x23B7E3DAC](v15, -1, -1);
    }

    sub_235E60DB8();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_235E3034C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385820);
  MEMORY[0x24BDAC7A8](v2);
  sub_235E30A3C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_256385820);
  return sub_235E60DAC();
}

uint64_t sub_235E303CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_235E60D7C();
  *a1 = result;
  return result;
}

uint64_t sub_235E303F4()
{
  swift_retain();
  return sub_235E60D88();
}

uint64_t sub_235E3041C()
{
  return sub_235E60DA0();
}

uint64_t sub_235E30440(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_235E30450(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

unint64_t sub_235E30460()
{
  unint64_t result;

  result = qword_256385650;
  if (!qword_256385650)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256385650);
  }
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_235E304AC(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  v3 = (id)sub_235E61028();
  objc_msgSend(v2, sel_setIdentifier_, v3);

}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for GroupedParameterConfigurationView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  v4 = v3 + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_235E60D4C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_235E305D0(uint64_t a1)
{
  return sub_235E305DC(a1, (uint64_t (*)(uint64_t, uint64_t))sub_235E2EC20);
}

uint64_t sub_235E305DC(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GroupedParameterConfigurationView() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_235E30638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GroupedParameterConfigurationView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_235E60D4C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return swift_deallocObject();
}

uint64_t sub_235E30724()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for GroupedParameterConfigurationView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_235E2EDD8(v0 + v2, *(void **)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_235E30764@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_235E2EEB0(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

double sub_235E3076C(_OWORD *a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)((char *)a1 + 217) = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_235E30794(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_235E307D8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_256385890;
  if (!qword_256385890)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385858);
    v2[2] = MEMORY[0x24BDF4108];
    v2[3] = MEMORY[0x24BDF40E8];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_235E30868();
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256385890);
  }
  return result;
}

unint64_t sub_235E30868()
{
  unint64_t result;

  result = qword_256385898;
  if (!qword_256385898)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDED590], MEMORY[0x24BDED5B8]);
    atomic_store(result, (unint64_t *)&qword_256385898);
  }
  return result;
}

uint64_t sub_235E308AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_235E308E8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_235E30450(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_235E30918(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_235E30440(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235E30948(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 232);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    v4);
  return a1;
}

uint64_t sub_235E309C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_235E30A00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235E30A3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_235E30A84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2563858A8;
  if (!qword_2563858A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385758);
    v2[0] = sub_235E29CC0(&qword_2563858B0, &qword_256385728, MEMORY[0x24BDEC988]);
    v2[1] = sub_235E29CC0(&qword_2563858B8, (uint64_t *)&unk_2563858C0, MEMORY[0x24BDF0B90]);
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2563858A8);
  }
  return result;
}

BOOL ConfigurationViewController.Mode.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_235E30B44()
{
  sub_235E6173C();
  sub_235E61748();
  return sub_235E61754();
}

uint64_t sub_235E30B88()
{
  return sub_235E61748();
}

uint64_t sub_235E30BB0()
{
  sub_235E6173C();
  sub_235E61748();
  return sub_235E61754();
}

_QWORD *sub_235E30BF0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

id ConfigurationViewController.__allocating_init(mode:dismissHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return ConfigurationViewController.init(mode:dismissHandler:)(a1, a2, a3);
}

id ConfigurationViewController.init(mode:dismissHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  _QWORD *v4;
  objc_super v6;

  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_viewModel] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_welcomeView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_actionDetailsView] = 0;
  *(_OWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides] = xmmword_235E62C30;
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_cancellableBag] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor] = 0;
  v3[OBJC_IVAR___BCConfigurationViewController_isAppeared] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___BCConfigurationViewController_mode] = a1;
  v4 = &v3[OBJC_IVAR___BCConfigurationViewController_dismissHandler];
  *v4 = a2;
  v4[1] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ConfigurationViewController();
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for ConfigurationViewController()
{
  return objc_opt_self();
}

void sub_235E30DDC()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v8, sel_viewDidLoad);
  sub_235E316B0();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD790]), sel_init);
  objc_msgSend(v1, sel_configureWithTransparentBackground);
  v2 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v2, sel_setStandardAppearance_, v1);

  v3 = objc_msgSend(v0, sel_view);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
    v6 = objc_msgSend(v0, sel_view);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_setAccessibilityIgnoresInvertColors_, 1);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_235E30F64(char a1)
{
  char *v1;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  objc_super v11;

  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v11, sel_viewWillAppear_, a1 & 1);
  if (!*(_QWORD *)&v1[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    v3 = objc_msgSend(v1, sel_navigationController);
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, sel_navigationBar);

      v4 = objc_msgSend(v5, sel_tintColor);
    }
    v6 = *(void **)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor];
    *(_QWORD *)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor] = v4;

    v7 = objc_msgSend(v1, sel_navigationController);
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, sel_navigationBar);

      v10 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
      objc_msgSend(v9, sel_setTintColor_, v10);

    }
  }
}

void sub_235E310EC(char a1)
{
  char *v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v9, sel_viewWillDisappear_, a1 & 1);
  if (!*(_QWORD *)&v1[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    v3 = objc_msgSend(v1, sel_navigationController);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, sel_navigationBar);

      v6 = *(void **)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor];
      if (v6)
      {
        v7 = *(id *)&v1[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor];
      }
      else
      {
        v7 = objc_msgSend((id)objc_opt_self(), sel_systemBlueColor);
        v6 = 0;
      }
      v8 = v6;
      objc_msgSend(v5, sel_setTintColor_, v7);

    }
  }
}

void sub_235E31220(char a1)
{
  char *v1;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v10, sel_viewDidAppear_, a1 & 1);
  v1[OBJC_IVAR___BCConfigurationViewController_isAppeared] = 1;
  v3 = *(void **)&v1[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController];
  if (v3)
    objc_msgSend(v3, sel_loadViewIfNeeded);
  if (!*(_QWORD *)&v1[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    v4 = objc_msgSend(v1, sel_navigationController);
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, sel_navigationBar);

      v7 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
      objc_msgSend(v6, sel_setTintColor_, v7);

    }
    v8 = objc_msgSend(v1, sel_view);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_setNeedsLayout);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_235E31394()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ConfigurationViewController();
  objc_msgSendSuper2(&v5, sel_viewDidLayoutSubviews);
  if (!*(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_mode])
  {
    v1 = objc_msgSend(v0, sel_navigationController);
    if (v1)
    {
      v2 = v1;
      v3 = objc_msgSend(v1, sel_navigationBar);

      v4 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
      objc_msgSend(v3, sel_setTintColor_, v4);

    }
  }
}

void sub_235E31494(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = *a1;
  v2 = a1[1];
  v4 = (uint64_t *)(v1 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides);
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_235E32F38(v5);
  v6 = *(void **)(v1 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
  if (v6)
  {
    v7 = *v4;
    if (*v4 != 1)
    {
      if (v4[1])
      {
        v8 = v6;
        sub_235E32F68(v7);
        v9 = swift_bridgeObjectRetain();
        sub_235E33FE8(v9);
        swift_bridgeObjectRelease();
        type metadata accessor for ABDeviceSceneParameter(0);
        sub_235E26AC8(0, &qword_256385928);
        sub_235E2B7F4(&qword_256385930, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6274C);
        v10 = (void *)sub_235E60FEC();
        swift_release();
        if (v7)
        {
LABEL_6:
          v11 = swift_bridgeObjectRetain();
          sub_235E33FE8(v11);
          swift_bridgeObjectRelease();
          sub_235E32F38(v7);
          type metadata accessor for ABDeviceSceneParameter(0);
          sub_235E26AC8(0, &qword_256385928);
          sub_235E2B7F4(&qword_256385930, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6274C);
          v13 = (id)sub_235E60FEC();
          swift_release();
LABEL_9:
          objc_msgSend(v6, sel_overrideSceneParamsWithZoomedOutParams_zoomedInParams_, v10, v13, v13);

          return;
        }
      }
      else
      {
        v12 = v6;
        sub_235E32F68(v7);
        v10 = 0;
        if (v7)
          goto LABEL_6;
      }
      sub_235E32F38(0);
      v13 = 0;
      goto LABEL_9;
    }
  }
}

uint64_t sub_235E316B0()
{
  char *v0;
  void *v1;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  void **v17;
  void *v18;
  objc_class *v19;
  id v20;
  id v21;
  char *v22;
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52[16];
  _QWORD v53[5];
  char v54[8];

  v1 = v0;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385A38);
  v45 = *(_QWORD *)(v50 - 8);
  v2 = MEMORY[0x24BDAC7A8](v50);
  v43 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v44 = (char *)&v42 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385A40);
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385A48);
  v48 = *(_QWORD *)(v8 - 8);
  v49 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385A50);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_mode];
  v16 = v15 != 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v17 = (void **)MEMORY[0x24BEC54F8];
  if (v15 != 1)
    v17 = (void **)MEMORY[0x24BEC54F0];
  v18 = *v17;
  v19 = (objc_class *)type metadata accessor for ShortcutsConfigurationViewController();
  v20 = v18;
  v21 = objc_allocWithZone(v19);
  v22 = v1;
  v23 = objc_msgSend(v21, sel_initWithConfigurationContext_, v20);

  v24 = *(void **)&v22[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController];
  *(_QWORD *)&v22[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController] = v23;

  sub_235E348E8();
  v53[3] = &type metadata for ConfigurationViewController.Router;
  v53[4] = &off_25073A140;
  v53[0] = swift_allocObject();
  sub_235E348D4();
  type metadata accessor for ConfigurationViewModel();
  v25 = swift_allocObject();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v53, (uint64_t)&type metadata for ConfigurationViewController.Router);
  swift_unknownObjectWeakCopyInit();
  v26 = sub_235E341FC(v16, (uint64_t)v52, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  sub_235E34EF8((uint64_t)v54);
  v27 = OBJC_IVAR___BCConfigurationViewController_viewModel;
  *(_QWORD *)&v22[OBJC_IVAR___BCConfigurationViewController_viewModel] = v26;
  result = swift_release();
  v29 = *(_QWORD *)&v22[v27];
  if (!v29)
  {
    __break(1u);
    goto LABEL_10;
  }
  *(_QWORD *)&v22[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel] = v29;
  swift_retain_n();
  swift_release();
  sub_235E5404C();
  result = swift_release();
  v51 = v27;
  v30 = *(_QWORD *)&v22[v27];
  if (!v30)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v53[0] = *(_QWORD *)(*(_QWORD *)(v30 + 144) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A58);
  sub_235E29CC0(&qword_256385A60, &qword_256385A58, MEMORY[0x24BDB9D10]);
  v53[0] = sub_235E60BFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A70);
  sub_235E29CC0(&qword_256385A78, &qword_256385A68, MEMORY[0x24BDB9AF8]);
  sub_235E60C08();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_235E29CC0(&qword_256385A80, &qword_256385A50, MEMORY[0x24BDB94C8]);
  sub_235E60CF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  result = swift_release();
  v31 = v51;
  v32 = *(_QWORD *)&v22[v51];
  if (!v32)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v53[0] = *(_QWORD *)(*(_QWORD *)(v32 + 152) + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A88);
  sub_235E29CC0(&qword_256385A90, &qword_256385A88, MEMORY[0x24BDB9D10]);
  v53[0] = sub_235E60BFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A98);
  sub_235E29CC0(&qword_256385AA0, &qword_256385A98, MEMORY[0x24BDB9AF8]);
  sub_235E60C08();
  swift_release();
  sub_235E29CC0(&qword_256385AA8, &qword_256385A40, MEMORY[0x24BDB94C8]);
  v33 = v47;
  sub_235E60CC8();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v33);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_235E29CC0(&qword_256385AB0, &qword_256385A48, MEMORY[0x24BDB9658]);
  v34 = v49;
  sub_235E60CF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v10, v34);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  result = swift_release();
  v35 = *(_QWORD *)&v22[v31];
  v36 = v50;
  if (!v35)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v53[0] = *(_QWORD *)(*(_QWORD *)(v35 + 16) + 24);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385AB8);
  v48 = sub_235E29CC0(&qword_256385AC0, &qword_256385AB8, MEMORY[0x24BDB9D10]);
  v49 = v37;
  v53[0] = sub_235E60BFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385AC8);
  sub_235E29CC0(&qword_256385AD0, &qword_256385AC8, MEMORY[0x24BDB9AF8]);
  v38 = v44;
  sub_235E60CC8();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_235E29CC0(&qword_256385AD8, &qword_256385A38, MEMORY[0x24BDB9658]);
  sub_235E60CF8();
  swift_release();
  v39 = *(void (**)(char *, uint64_t))(v45 + 8);
  v39(v38, v36);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  result = swift_release();
  v40 = *(_QWORD *)&v22[v51];
  if (v40)
  {
    v53[0] = *(_QWORD *)(*(_QWORD *)(v40 + 168) + 24);
    v53[0] = sub_235E60BFC();
    v41 = v43;
    sub_235E60CC8();
    swift_release();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_235E60CF8();
    swift_release();
    v39(v41, v36);
    swift_beginAccess();
    sub_235E60B6C();
    swift_endAccess();
    return swift_release();
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_235E31F0C(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  char *v7;
  id v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x23B7E3E6C](v3);
  if (v4)
  {
    v5 = (_BYTE *)v4;
    v6 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v6 && (v7 = *(char **)(v4 + OBJC_IVAR___BCConfigurationViewController_actionDetailsView)) != 0)
    {
      v8 = v6;
      v9 = v7;
      swift_bridgeObjectRetain();
      if (v2 >> 62)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256385A28);
        sub_235E61604();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_235E616DC();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385A28);
      v10 = (void *)sub_235E610A0();
      swift_bridgeObjectRelease();
      if (v5[OBJC_IVAR___BCConfigurationViewController_isAppeared] == 1)
      {
        v11 = *(_QWORD *)&v5[OBJC_IVAR___BCConfigurationViewController_viewModel];
        if (!v11)
        {
LABEL_22:
          __break(1u);
          return;
        }
        v12 = *(unsigned __int8 *)(*(_QWORD *)(v11 + 168) + 16);
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(v6, sel_updateActionItems_animated_, v10, v12);

      v15 = sub_235E32118(v2);
      *(_QWORD *)&v7[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions] = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
      v17 = *(void **)&v7[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
      if (v17)
      {
        v18 = *(_QWORD *)(v15 + 16);
        objc_msgSend(v17, sel_setNumberOfPages_, v18);
        v19 = *(void **)&v7[v16];
        if (v19)
        {
          objc_msgSend(v19, sel__setPreferredNumberOfVisibleIndicators_, v18);

          swift_bridgeObjectRelease();
LABEL_16:

          return;
        }
        goto LABEL_21;
      }
    }
    else
    {
      v13 = *(_QWORD *)(v4 + OBJC_IVAR___BCConfigurationViewController_viewModel);
      if (v13)
      {
        v14 = *(_QWORD *)(v13 + 152);
        if ((*(_BYTE *)(v14 + 24) & 1) == 0)
          sub_235E326A8(v2, *(_QWORD *)(v14 + 16));
        goto LABEL_16;
      }
      __break(1u);
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
}

uint64_t sub_235E32118(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  _UNKNOWN **v31;
  _QWORD v32[3];
  uint64_t v33;
  _UNKNOWN **v34;
  uint64_t v35;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v35 = MEMORY[0x24BEE4AF8];
  result = sub_235E4F824(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v35;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = MEMORY[0x23B7E35E4](v5, a1);
        v7 = type metadata accessor for ActionSelectorItem();
        v33 = v7;
        v34 = &off_25073A968;
        v32[0] = v6;
        v35 = v3;
        v9 = *(_QWORD *)(v3 + 16);
        v8 = *(_QWORD *)(v3 + 24);
        v10 = v7;
        if (v9 >= v8 >> 1)
        {
          sub_235E4F824(v8 > 1, v9 + 1, 1);
          v10 = v33;
        }
        ++v5;
        v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v10);
        MEMORY[0x24BDAC7A8](v11);
        v13 = (uint64_t *)((char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v14 + 16))(v13);
        v15 = *v13;
        v30 = v7;
        v31 = &off_25073A968;
        *(_QWORD *)&v29 = v15;
        v3 = v35;
        *(_QWORD *)(v35 + 16) = v9 + 1;
        sub_235E34E08(&v29, v3 + 40 * v9 + 32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      }
      while (v2 != v5);
    }
    else
    {
      v16 = (void **)(a1 + 32);
      v17 = type metadata accessor for ActionSelectorItem();
      do
      {
        v18 = *v16;
        v33 = v17;
        v34 = &off_25073A968;
        v32[0] = v18;
        v35 = v3;
        v20 = *(_QWORD *)(v3 + 16);
        v19 = *(_QWORD *)(v3 + 24);
        v21 = v18;
        v22 = v17;
        if (v20 >= v19 >> 1)
        {
          sub_235E4F824(v19 > 1, v20 + 1, 1);
          v22 = v33;
        }
        v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v22);
        MEMORY[0x24BDAC7A8](v23);
        v25 = (uint64_t *)((char *)&v28 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
        (*(void (**)(uint64_t *))(v26 + 16))(v25);
        v27 = *v25;
        v30 = v17;
        v31 = &off_25073A968;
        *(_QWORD *)&v29 = v27;
        v3 = v35;
        *(_QWORD *)(v35 + 16) = v20 + 1;
        sub_235E34E08(&v29, v3 + 40 * v20 + 32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
        ++v16;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E323C4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

void sub_235E323D8(void **a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v2 = *a1;
  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x23B7E3E6C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v6 && (v7 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_actionDetailsView)) != 0)
    {
      if (*(_BYTE *)(v4 + OBJC_IVAR___BCConfigurationViewController_isAppeared) == 1)
      {
        v8 = *(_QWORD *)(v4 + OBJC_IVAR___BCConfigurationViewController_viewModel);
        if (!v8)
        {
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
        v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 + 168) + 16);
      }
      else
      {
        v9 = 0;
      }
      v12 = v6;
      v13 = v7;
      objc_msgSend(v12, sel_selectActionItemWithIndex_animated_, v2, v9);
      v14 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
      v15 = *(void **)&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
      if (v15)
      {
        if (objc_msgSend(v15, sel_currentPage) == v2)
        {
LABEL_15:

LABEL_16:
          return;
        }
        v16 = *(void **)&v13[v14];
        if (v16)
        {
          objc_msgSend(v16, sel_setCurrentPage_, v2);
          objc_msgSend(v13, sel_setNeedsLayout);
          goto LABEL_15;
        }
LABEL_21:
        __break(1u);
        return;
      }
    }
    else
    {
      v10 = *(_QWORD *)(v4 + OBJC_IVAR___BCConfigurationViewController_viewModel);
      if (v10)
      {
        if (*(_QWORD *)(*(_QWORD *)(v10 + 144) + 16))
        {
          v11 = swift_bridgeObjectRetain();
          sub_235E326A8(v11, (uint64_t)v2);
          swift_bridgeObjectRelease();
        }
        goto LABEL_16;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_20;
  }
}

void sub_235E32550(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  char **v7;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7E3E6C](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = *(void **)(v3 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v5)
    {
      v6 = *(_QWORD *)&v4[OBJC_IVAR___BCConfigurationViewController_viewModel];
      if (!v6)
      {
        __break(1u);
        return;
      }
      if (*(_BYTE *)(*(_QWORD *)(v6 + 16) + 16))
        v7 = &selRef_resumeSceneUpdates;
      else
        v7 = &selRef_pauseSceneUpdates;
      objc_msgSend(v5, *v7);
    }

  }
}

void sub_235E325E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  char *v7;
  uint64_t v8;
  char *v9;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7E3E6C](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = *(void **)(v3 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    if (v5)
    {
      v6 = v5;
      v7 = (char *)objc_msgSend(v6, sel_view);
      if (v7)
      {
        v8 = *(_QWORD *)&v4[OBJC_IVAR___BCConfigurationViewController_viewModel];
        if (v8)
        {
          v9 = v7;
          objc_msgSend(v7, sel_setUserInteractionEnabled_, *(unsigned __int8 *)(*(_QWORD *)(v8 + 168) + 16));

          v4 = v9;
          goto LABEL_6;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
LABEL_6:

  }
}

void sub_235E326A8(unint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char **v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void (**v62)(uint64_t);
  uint64_t v63;

  v3 = OBJC_IVAR___BCConfigurationViewController_viewModel;
  v4 = *(_QWORD **)&v2[OBJC_IVAR___BCConfigurationViewController_viewModel];
  if (!v4)
  {
    __break(1u);
    goto LABEL_43;
  }
  v5 = v4[15];
  if (v5)
  {
    v6 = v4[16];
    if (v6)
    {
      v7 = v4[17];
      if (v7)
      {
        v8 = v2;
        swift_retain();
        swift_retain();
        swift_retain();
        v11 = sub_235E32118(a1);
        v12 = *(_QWORD *)&v2[v3];
        if (v12)
        {
          v13 = v11;
          v14 = *(_QWORD *)(v12 + 112);
          objc_allocWithZone((Class)type metadata accessor for ActionDetailsView());
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v15 = sub_235E5E184(v13, a2, v14, v5, v6, v7);
          v16 = OBJC_IVAR___BCConfigurationViewController_actionDetailsView;
          v17 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_actionDetailsView];
          *(_QWORD *)&v8[OBJC_IVAR___BCConfigurationViewController_actionDetailsView] = v15;

          v18 = *(_QWORD *)&v8[OBJC_IVAR___BCConfigurationViewController_mode];
          if (v18 == 1)
          {
            swift_bridgeObjectRetain();
            if (a1 >> 62)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_256385A28);
              sub_235E61604();
              swift_bridgeObjectRelease();
            }
            else
            {
              sub_235E616DC();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_256385A28);
            v30 = (void *)sub_235E610A0();
            swift_bridgeObjectRelease();
            v31 = *(_QWORD *)&v8[v16];
            if (!v31)
              goto LABEL_49;
            v32 = objc_msgSend((id)objc_opt_self(), sel_settingsSelectorWithActionItems_selectedIndex_detailsView_, v30, a2, v31);

            v29 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController];
            *(_QWORD *)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = v32;
          }
          else
          {
            if (v18)
              goto LABEL_21;
            v19 = *(_QWORD *)&v8[v3];
            if (!v19)
            {
LABEL_48:
              __break(1u);
LABEL_49:
              __break(1u);
              goto LABEL_50;
            }
            v20 = *(_QWORD *)(v19 + 96);
            if (!v20 || (v21 = *(_QWORD *)(v19 + 104)) == 0)
            {
              swift_release();
              swift_release();
              swift_release();
              return;
            }
            objc_allocWithZone((Class)type metadata accessor for WelcomeView());
            swift_retain_n();
            swift_retain_n();
            v22 = sub_235E3F6B0(v20, v21);
            v23 = OBJC_IVAR___BCConfigurationViewController_welcomeView;
            v24 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_welcomeView];
            *(_QWORD *)&v8[OBJC_IVAR___BCConfigurationViewController_welcomeView] = v22;

            swift_bridgeObjectRetain();
            if (a1 >> 62)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_256385A28);
              sub_235E61604();
              swift_bridgeObjectRelease();
            }
            else
            {
              sub_235E616DC();
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_256385A28);
            v25 = (void *)sub_235E610A0();
            swift_bridgeObjectRelease();
            v26 = *(_QWORD *)&v8[v23];
            if (!v26)
              goto LABEL_53;
            v27 = *(_QWORD *)&v8[v16];
            if (!v27)
            {
LABEL_54:
              __break(1u);
              return;
            }
            v28 = objc_msgSend((id)objc_opt_self(), sel_assistantSelectorWithActionItems_selectedIndex_welcomeView_detailsView_, v25, a2, v26, v27);

            v29 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController];
            *(_QWORD *)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = v28;
            swift_release();
            swift_release();
          }

LABEL_21:
          v33 = OBJC_IVAR___BCConfigurationViewController_selectorViewController;
          v34 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_selectorViewController];
          if (!v34)
            goto LABEL_36;
          v35 = v34;
          objc_msgSend(v8, sel_addChildViewController_, v35);
          v36 = objc_msgSend(v35, sel_view);
          if (v36)
          {
            v37 = v36;
            v38 = objc_msgSend(v8, sel_view);
            if (v38)
            {
              v39 = v38;
              objc_msgSend(v38, sel_frame);
              v41 = v40;
              v43 = v42;
              v45 = v44;
              v47 = v46;

              objc_msgSend(v37, sel_setFrame_, v41, v43, v45, v47);
              v48 = objc_msgSend(v8, sel_view);
              if (v48)
              {
                v49 = v48;
                v50 = objc_msgSend(v35, sel_view);
                if (v50)
                {
                  v51 = v50;
                  objc_msgSend(v49, sel_addSubview_, v50);

                  objc_msgSend(v35, sel_didMoveToParentViewController_, v8);
                  sub_235E32D40();
                  v52 = *(void **)&v8[v33];
                  if (!v52)
                  {
LABEL_35:
                    objc_msgSend(v35, sel_setDelegate_, v8);

LABEL_36:
                    swift_release();
                    swift_release();
                    swift_release();
                    v60 = *(_QWORD *)&v8[v16];
                    if (v60)
                    {
                      v61 = swift_allocObject();
                      swift_unknownObjectWeakInit();
                      v62 = (void (**)(uint64_t))(v60
                                                          + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler);
                      v63 = *(_QWORD *)(v60
                                      + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler);
                      *v62 = sub_235E34DC8;
                      v62[1] = (void (*)(uint64_t))v61;
                      sub_235E34DD0(v63);
                    }
                    return;
                  }
                  v53 = *(_QWORD *)&v8[v3];
                  if (v53)
                  {
                    if (*(_BYTE *)(*(_QWORD *)(v53 + 16) + 16))
                      v54 = &selRef_resumeSceneUpdates;
                    else
                      v54 = &selRef_pauseSceneUpdates;
                    objc_msgSend(v52, *v54);
                    v55 = *(void **)&v8[v33];
                    if (!v55)
                      goto LABEL_35;
                    v56 = v55;
                    v57 = objc_msgSend(v56, sel_view);
                    if (v57)
                    {
                      v58 = *(_QWORD *)&v8[v3];
                      if (v58)
                      {
                        v59 = v57;
                        objc_msgSend(v57, sel_setUserInteractionEnabled_, *(unsigned __int8 *)(*(_QWORD *)(v58 + 168) + 16));

                        goto LABEL_35;
                      }
                      goto LABEL_52;
                    }
LABEL_51:
                    __break(1u);
LABEL_52:
                    __break(1u);
LABEL_53:
                    __break(1u);
                    goto LABEL_54;
                  }
LABEL_50:
                  __break(1u);
                  goto LABEL_51;
                }
                goto LABEL_47;
              }
LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
              goto LABEL_48;
            }
LABEL_45:
            __break(1u);
            goto LABEL_46;
          }
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
    }
  }
}

void sub_235E32CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x23B7E3E6C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = *(void **)(v4 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
    v7 = v6;

    if (v6)
    {
      objc_msgSend(v7, sel_selectActionItemWithIndex_animated_, a1, 1);

    }
  }
}

void sub_235E32D40()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v1 = *(void **)(v0 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);
  if (v1)
  {
    v2 = v0 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides;
    v3 = *(_QWORD *)(v0 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides);
    if (v3 != 1)
    {
      if (*(_QWORD *)(v2 + 8))
      {
        v4 = v1;
        sub_235E32F68(v3);
        v5 = swift_bridgeObjectRetain();
        sub_235E33FE8(v5);
        swift_bridgeObjectRelease();
        type metadata accessor for ABDeviceSceneParameter(0);
        sub_235E26AC8(0, &qword_256385928);
        sub_235E2B7F4(&qword_256385930, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6274C);
        v6 = (void *)sub_235E60FEC();
        swift_release();
        if (v3)
        {
LABEL_6:
          v7 = swift_bridgeObjectRetain();
          sub_235E33FE8(v7);
          swift_bridgeObjectRelease();
          sub_235E32F38(v3);
          type metadata accessor for ABDeviceSceneParameter(0);
          sub_235E26AC8(0, &qword_256385928);
          sub_235E2B7F4(&qword_256385930, (uint64_t (*)(uint64_t))type metadata accessor for ABDeviceSceneParameter, (uint64_t)&unk_235E6274C);
          v9 = (id)sub_235E60FEC();
          swift_release();
LABEL_9:
          objc_msgSend(v1, sel_overrideSceneParamsWithZoomedOutParams_zoomedInParams_, v6, v9, v9);

          return;
        }
      }
      else
      {
        v8 = v1;
        sub_235E32F68(v3);
        v6 = 0;
        if (v3)
          goto LABEL_6;
      }
      sub_235E32F38(0);
      v9 = 0;
      goto LABEL_9;
    }
  }
}

uint64_t sub_235E32F38(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235E32F68(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_235E32F9C(uint64_t a1, unint64_t a2)
{
  return sub_235E34544(a2);
}

uint64_t sub_235E32FFC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t result;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[2];
  __int128 v28;

  v7 = v6;
  v27[0] = a1;
  v13 = type metadata accessor for GroupedParameterConfigurationView();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v27 - v17;
  result = MEMORY[0x23B7E3E6C](v7);
  if (result)
  {
    v20 = (void *)result;
    sub_235E348D4();
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a5;
    *(_QWORD *)(v21 + 24) = a6;
    sub_235E348E8();
    *(_QWORD *)&v18[*(int *)(v13 + 32)] = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385A10);
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)v18 = v27[0];
    *((_QWORD *)v18 + 1) = a2;
    *((_QWORD *)v18 + 2) = a4;
    v27[1] = a3;
    v22 = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385A18);
    sub_235E60F38();
    *(_OWORD *)(v18 + 24) = v28;
    *((_QWORD *)v18 + 5) = sub_235E34FEC;
    *((_QWORD *)v18 + 6) = v21;
    sub_235E3000C((uint64_t)v18, (uint64_t)v16);
    v23 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_256385A20));
    v24 = (void *)sub_235E60E00();
    objc_msgSend(v24, sel_setOverrideUserInterfaceStyle_, 2);
    v25 = objc_msgSend(v24, sel_presentationController);
    if (v25)
    {
      v26 = v25;
      objc_msgSend(v25, sel_setDelegate_, v20);

    }
    objc_msgSend(v20, sel_presentViewController_animated_completion_, v24, 1, 0, v27[0]);

    return sub_235E34D68((uint64_t)v18);
  }
  return result;
}

void sub_235E33224(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v32[5];

  v11 = sub_235E60AB8();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32[3] = &type metadata for Features;
  v32[4] = sub_235E2A368();
  v14 = sub_235E60A4C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  if ((v14 & 1) != 0)
  {
    v15 = MEMORY[0x23B7E3E6C](v5);
    if (v15)
    {
      v16 = (void *)v15;
      sub_235E348D4();
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = a2;
      v17[3] = a3;
      sub_235E348E8();
      v17[5] = a4;
      v17[6] = a5;
      objc_allocWithZone((Class)type metadata accessor for ControlPickerViewController());
      swift_retain();
      swift_retain();
      v18 = sub_235E3A7F4((uint64_t)sub_235E34948, (uint64_t)v17);
      objc_msgSend(v18, sel_setOverrideUserInterfaceStyle_, 2);
      v19 = v18;
      if (a1)
      {
        v20 = a1;
        v21 = objc_msgSend(v20, sel_controlType);
        v22 = objc_msgSend(v21, sel_unsignedIntegerValue);

        v23 = objc_allocWithZone(MEMORY[0x24BE19BA0]);
        v24 = sub_235E36A18();

      }
      objc_msgSend(v18, sel_setSelectedControl_, 0);

      v25 = objc_msgSend(v18, sel_sheetPresentationController);
      if (v25)
      {
        v26 = v25;
        MEMORY[0x23B7E3350]();
        sub_235E60AAC();
        MEMORY[0x23B7E335C](v13);

        sub_235E6128C();
        objc_msgSend(v26, sel_setPrefersGrabberVisible_, 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2563859D8);
        v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_235E62C40;
        sub_235E26AC8(0, (unint64_t *)&unk_2563859E0);
        *(_QWORD *)(v27 + 32) = sub_235E612A4();
        v32[0] = v27;
        sub_235E610C4();
        v28 = (void *)sub_235E610A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v26, sel_setDetents_, v28);

      }
      v29 = objc_msgSend(v18, sel_presentationController);
      if (v29)
      {
        v30 = v29;
        objc_msgSend(v29, sel_setDelegate_, v16);

      }
      objc_msgSend(v16, sel_presentViewController_animated_completion_, v18, 1, 0);

    }
  }
}

double sub_235E33578(void *a1)
{
  double v1;

  objc_msgSend(a1, sel_maximumDetentValue);
  return v1 * 0.83;
}

void sub_235E335A8(void *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  void *v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t (**v15)(void *);
  uint64_t v16;
  id v17;
  void *v18;
  _BYTE v19[16];
  _BYTE v20[16];
  __int128 v21;

  v5 = v4;
  v10 = MEMORY[0x23B7E3E6C](v5);
  if (v10)
  {
    v11 = (void *)v10;
    v21 = *a2;
    sub_235E34864((uint64_t)(a2 + 1), (uint64_t)v20);
    sub_235E34864((uint64_t)(a2 + 2), (uint64_t)v19);
    objc_allocWithZone((Class)type metadata accessor for ControlConfigurationViewController());
    v12 = a1;
    sub_235E348AC((uint64_t)&v21);
    sub_235E348AC((uint64_t)v20);
    sub_235E348AC((uint64_t)v19);
    v13 = (char *)sub_235E39F28(v12, a2);
    objc_msgSend(v13, sel_setOverrideUserInterfaceStyle_, 2);
    sub_235E348D4();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    sub_235E348E8();
    v15 = (uint64_t (**)(void *))&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler];
    v16 = *(_QWORD *)&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler];
    *v15 = sub_235E348F8;
    v15[1] = (uint64_t (*)(void *))v14;
    swift_retain();
    sub_235E34DD0(v16);
    v17 = objc_msgSend(v13, sel_presentationController);
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, sel_setDelegate_, v11);

    }
    objc_msgSend(v11, sel_presentViewController_animated_completion_, v13, 1, 0);

  }
}

uint64_t sub_235E33738(void *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t result;
  char *v8;
  uint64_t v9;

  if (a1)
  {
    v6 = a1;
    a2();

  }
  result = MEMORY[0x23B7E3E6C](a4);
  if (result)
  {
    v8 = (char *)result;
    v9 = OBJC_IVAR___BCConfigurationViewController_viewModel;
    if (*(_QWORD *)(result + OBJC_IVAR___BCConfigurationViewController_viewModel))
    {
      swift_retain();
      sub_235E60B78();
      result = swift_release();
      if (*(_QWORD *)&v8[v9])
      {
        swift_retain();
        sub_235E60B78();

        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_235E337E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  void (**v12)(void *, char);
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v4 = v3;
  v8 = (char *)MEMORY[0x23B7E3E6C](v4);
  if (v8)
  {
    v9 = *(void **)&v8[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController];
    if (v9)
    {
      v16 = v8;
      v10 = v9;
      objc_msgSend(v10, sel_setModalPresentationStyle_, 2);
      swift_unknownObjectWeakAssign();
      objc_msgSend(v10, sel_setSelectedAction_, a1);
      sub_235E348D4();
      v11 = swift_allocObject();
      sub_235E348E8();
      *(_QWORD *)(v11 + 24) = a2;
      *(_QWORD *)(v11 + 32) = a3;
      v12 = (void (**)(void *, char))&v10[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler];
      v13 = *(_QWORD *)&v10[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler];
      *v12 = sub_235E34CD0;
      v12[1] = (void (*)(void *, char))v11;
      swift_retain();
      sub_235E34DD0(v13);
      v14 = objc_msgSend(v10, sel_presentationController);
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v14, sel_setDelegate_, v16);

      }
      objc_msgSend(v16, sel_presentViewController_animated_completion_, v10, 1, 0, v16);

    }
    else
    {

    }
  }
}

void sub_235E33968(void *a1, char a2, uint64_t a3, void (*a4)(char *, uint64_t))
{
  uint64_t v7;
  char *v8;
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
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD aBlock[6];

  v33 = a4;
  v34 = sub_235E60F98();
  v37 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235E60FBC();
  v35 = *(_QWORD *)(v9 - 8);
  v36 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235E60FD4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v31 - v17;
  v38 = a3;
  v19 = MEMORY[0x23B7E3E6C](a3);
  if (v19)
  {
    v20 = (void *)v19;
    if ((a2 & 1) != 0)
    {
      sub_235E26AC8(0, (unint64_t *)&qword_2563859F0);
      v32 = sub_235E611FC();
      sub_235E60FC8();
      MEMORY[0x23B7E30BC](v16, 0.01);
      v33 = *(void (**)(char *, uint64_t))(v13 + 8);
      v22 = v12;
      v33(v16, v12);
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = v20;
      aBlock[4] = sub_235E34D04;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_235E33D50;
      aBlock[3] = &block_descriptor_0;
      v24 = _Block_copy(aBlock);
      v25 = v20;
      swift_release();
      sub_235E60FB0();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_235E2B7F4(&qword_2563859F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385A00);
      sub_235E29CC0(&qword_256385A08, &qword_256385A00, MEMORY[0x24BEE12C8]);
      v26 = v34;
      sub_235E61460();
      v27 = (void *)v32;
      MEMORY[0x23B7E329C](v18, v11, v8, v24);
      _Block_release(v24);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v26);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v36);
      v33(v18, v22);
    }
    else
    {
      v21 = a1;
      ((void (*)(id))v33)(v21);
      sub_235E34D0C(a1);
    }
    v28 = MEMORY[0x23B7E3E6C](v38);
    if (v28)
    {
      v29 = (char *)v28;
      v30 = OBJC_IVAR___BCConfigurationViewController_viewModel;
      if (*(_QWORD *)(v28 + OBJC_IVAR___BCConfigurationViewController_viewModel))
      {
        swift_retain();
        sub_235E60B78();
        swift_release();
        if (*(_QWORD *)&v29[v30])
        {
          swift_retain();
          sub_235E60B78();

          swift_release();
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    else
    {

    }
  }
}

void sub_235E33CC8(uint64_t a1)
{
  id *v2;
  id v3;
  id v4;
  void *v5;

  if (*(_QWORD *)(a1 + OBJC_IVAR___BCConfigurationViewController_mode) == 1)
    v2 = (id *)MEMORY[0x24BEC54F8];
  else
    v2 = (id *)MEMORY[0x24BEC54F0];
  v3 = *v2;
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ShortcutsConfigurationViewController()), sel_initWithConfigurationContext_, v3);

  v5 = *(void **)(a1 + OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController);
  *(_QWORD *)(a1 + OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController) = v4;

}

uint64_t sub_235E33D50(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id ConfigurationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void ConfigurationViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_235E33E4C()
{
  uint64_t v0;

  swift_release();
  swift_release();

  sub_235E32F38(*(_QWORD *)(v0 + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides));
  swift_bridgeObjectRelease();

}

id ConfigurationViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DeviceSceneParameters.zoomedInParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DeviceSceneParameters.zoomedOutParameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DeviceSceneParameters.init(zoomedInParameters:zoomedOutParameters:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

_QWORD *sub_235E33FE8(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A30);
  result = (_QWORD *)sub_235E6161C();
  v3 = result;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 64);
  v22 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v23 = (unint64_t)(v6 + 63) >> 6;
  v9 = (char *)(result + 8);
  if ((v7 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    v15 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * i);
    v16 = *(double *)(*(_QWORD *)(a1 + 56) + 8 * i);
    v17 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    v18 = v15;
    result = objc_msgSend(v17, sel_initWithDouble_, v16);
    *(_QWORD *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(_QWORD *)(v3[6] + 8 * i) = v18;
    *(_QWORD *)(v3[7] + 8 * i) = result;
    v19 = v3[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v21;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v12 >= v23)
      return v3;
    v13 = *(_QWORD *)(v22 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v23)
        return v3;
      v13 = *(_QWORD *)(v22 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v23)
          return v3;
        v13 = *(_QWORD *)(v22 + 8 * v4);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v8 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v23)
    return v3;
  v13 = *(_QWORD *)(v22 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v23)
      return v3;
    v13 = *(_QWORD *)(v22 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

_QWORD *sub_235E341FC(char a1, uint64_t a2, uint64_t a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD v14[5];

  v4 = a1 & 1;
  v14[3] = &type metadata for ConfigurationViewController.Router;
  v14[4] = &off_25073A140;
  v14[0] = swift_allocObject();
  sub_235E348E8();
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385AE0);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A58);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v5 + 24) = sub_235E60B9C();
  *(_QWORD *)(a3 + 144) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385AE8);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  *(_BYTE *)(v6 + 24) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385A88);
  swift_allocObject();
  *(_QWORD *)(v6 + 32) = sub_235E60B9C();
  *(_QWORD *)(a3 + 152) = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256385AF0);
  v7 = swift_allocObject();
  *(_BYTE *)(v7 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385AB8);
  swift_allocObject();
  *(_QWORD *)(v7 + 24) = sub_235E60B9C();
  *(_QWORD *)(a3 + 160) = v7;
  v8 = swift_allocObject();
  *(_BYTE *)(v8 + 16) = 0;
  swift_allocObject();
  *(_QWORD *)(v8 + 24) = sub_235E60B9C();
  *(_QWORD *)(a3 + 168) = v8;
  *(_QWORD *)(a3 + 240) = MEMORY[0x24BEE4B08];
  *(_BYTE *)(a3 + 176) = v4;
  sub_235E34F3C((uint64_t)v14, a3 + 184);
  type metadata accessor for ControlAttributesStore();
  v9 = (_OWORD *)swift_allocObject();
  v9[1] = 0u;
  v9[2] = 0u;
  v9[3] = 0u;
  v9[4] = 0u;
  *(_QWORD *)(a3 + 232) = v9;
  type metadata accessor for ActionStore();
  swift_allocObject();
  v10 = swift_retain();
  v11 = sub_235E5271C(v10, v4);
  swift_release();
  *(_QWORD *)(a3 + 224) = v11;
  swift_release();
  v12 = sub_235E44530();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v12;
}

void sub_235E34464()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_viewModel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_selectorViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_welcomeView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_actionDetailsView] = 0;
  *(_OWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides] = xmmword_235E62C30;
  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_cancellableBag] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor] = 0;
  v0[OBJC_IVAR___BCConfigurationViewController_isAppeared] = 0;

  sub_235E615F8();
  __break(1u);
}

unint64_t sub_235E34544(unint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR___BCConfigurationViewController_viewModel);
  if (!v2)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 224) + 16) + 16);
  if (v3)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(v3 + 16) > result)
    {
      v4 = v3 + 24 * result;
      v5 = *(void **)(v4 + 32);
      v6 = *(_QWORD *)(v4 + 40);
      v7 = *(_BYTE *)(v4 + 48);
      swift_retain();
      sub_235E34E50(v5, v6, v7);
      sub_235E49BB0((uint64_t)v5, v6, v7);
      sub_235E34EA4(v5, v6, v7);
      return swift_release();
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

unint64_t sub_235E34610()
{
  unint64_t result;

  result = qword_256385938;
  if (!qword_256385938)
  {
    result = MEMORY[0x23B7E3CE0](&protocol conformance descriptor for ConfigurationViewController.Mode, &type metadata for ConfigurationViewController.Mode);
    atomic_store(result, (unint64_t *)&qword_256385938);
  }
  return result;
}

uint64_t method lookup function for ConfigurationViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfigurationViewController.__allocating_init(mode:dismissHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t dispatch thunk of ConfigurationViewController.updateSceneParameterOverrides(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of ConfigurationViewController.actionSelectorViewController(_:didSelectItemAt:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

ValueMetadata *type metadata accessor for ConfigurationViewController.Mode()
{
  return &type metadata for ConfigurationViewController.Mode;
}

uint64_t destroy for DeviceSceneParameters()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s27ActionButtonConfigurationUI21DeviceSceneParametersVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DeviceSceneParameters(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for DeviceSceneParameters(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceSceneParameters(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceSceneParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceSceneParameters()
{
  return &type metadata for DeviceSceneParameters;
}

uint64_t sub_235E34864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256385CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E348AC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_235E348D4()
{
  return swift_unknownObjectWeakCopyInit();
}

uint64_t sub_235E348E8()
{
  return swift_unknownObjectWeakTakeInit();
}

uint64_t sub_235E348F8(void *a1)
{
  uint64_t v1;

  return sub_235E33738(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), v1 + 32);
}

uint64_t sub_235E34914()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_release();
  return swift_deallocObject();
}

char *sub_235E34948(void *a1, char a2)
{
  uint64_t v2;
  char *v3;

  v3 = sub_235E34988(a1, a2 & 1, *(void (**)(id))(v2 + 16), *(_QWORD *)(v2 + 24), v2 + 32, *(_QWORD *)(v2 + 40));
  sub_235E34C94((uint64_t)v3);
  return v3;
}

char *sub_235E34988(id a1, char a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  char *result;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if ((a2 & 1) != 0)
  {
    v9 = a1;
    if (qword_2563854D0 != -1)
      swift_once();
    v10 = sub_235E60AA0();
    __swift_project_value_buffer(v10, (uint64_t)qword_256386DC8);
    v11 = a1;
    v12 = a1;
    v13 = sub_235E60A88();
    v14 = sub_235E61184();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = (_QWORD *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v23 = v21;
      *(_DWORD *)v15 = 136315394;
      sub_235E2AEC4(0xD00000000000001BLL, 0x8000000235E64690, &v23);
      sub_235E61430();
      *(_WORD *)(v15 + 12) = 2112;
      v17 = a1;
      v22 = _swift_stdlib_bridgeErrorToNSError();
      sub_235E61430();
      *v16 = v22;
      sub_235E34D0C(a1);
      sub_235E34D0C(a1);
      _os_log_impl(&dword_235E24000, v13, v14, "%s finished with error: %@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v16, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v21, -1, -1);
      MEMORY[0x23B7E3DAC](v15, -1, -1);

      sub_235E34D0C(a1);
    }
    else
    {
      sub_235E34D0C(a1);
      sub_235E34D0C(a1);

    }
  }
  else if (a1)
  {
    a3(a1);
    sub_235E34D0C(a1);
  }
  result = (char *)MEMORY[0x23B7E3E6C](a5);
  if (!result)
    return (char *)a6;
  v19 = result;
  v20 = OBJC_IVAR___BCConfigurationViewController_viewModel;
  if (*(_QWORD *)&result[OBJC_IVAR___BCConfigurationViewController_viewModel])
  {
    swift_retain();
    sub_235E60B78();
    result = (char *)swift_release();
    if (*(_QWORD *)&v19[v20])
    {
      swift_retain();
      sub_235E60B78();

      swift_release();
      return (char *)a6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_235E34C94(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_235E34CA4()
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  return swift_deallocObject();
}

void sub_235E34CD0(void *a1, char a2)
{
  uint64_t v2;

  sub_235E33968(a1, a2 & 1, v2 + 16, *(void (**)(char *, uint64_t))(v2 + 24));
}

uint64_t sub_235E34CE0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_235E34D04()
{
  uint64_t v0;

  sub_235E33CC8(*(_QWORD *)(v0 + 16));
}

void sub_235E34D0C(id a1)
{

}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E34D48()
{
  return sub_235E60D94();
}

uint64_t sub_235E34D68(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GroupedParameterConfigurationView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235E34DA4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_235E34DC8(uint64_t a1)
{
  uint64_t v1;

  sub_235E32CB4(a1, v1);
}

uint64_t sub_235E34DD0(uint64_t result)
{
  if (result)
    return swift_release();
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

uint64_t sub_235E34E08(__int128 *a1, uint64_t a2)
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

uint64_t sub_235E34E20()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_235E34E44()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_235E34E50(id result, uint64_t a2, char a3)
{
  id v3;

  switch(a3)
  {
    case 0:
    case 1:
    case 3:
      result = result;
      break;
    case 2:
      v3 = result;
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_235E34EA4(void *a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 3:

      break;
    case 2:

      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_235E34EF8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void sub_235E34F1C(unint64_t *a1)
{
  uint64_t v1;

  sub_235E31F0C(a1, v1);
}

void sub_235E34F24(void **a1)
{
  uint64_t v1;

  sub_235E323D8(a1, v1);
}

void sub_235E34F2C(uint64_t a1)
{
  uint64_t v1;

  sub_235E32550(a1, v1);
}

void sub_235E34F34(uint64_t a1)
{
  uint64_t v1;

  sub_235E325E8(a1, v1);
}

uint64_t sub_235E34F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t getEnumTagSinglePayload for ConfigurationViewController.Router(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ConfigurationViewController.Router(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationViewController.Router()
{
  return &type metadata for ConfigurationViewController.Router;
}

uint64_t sub_235E34FF4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  v0 = sub_235E609EC();
  MEMORY[0x24BDAC7A8](v0);
  sub_235E609E0();
  result = sub_235E61058();
  qword_256385B00 = result;
  *(_QWORD *)algn_256385B08 = v2;
  return result;
}

uint64_t sub_235E35074(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_235E366E4(v7, v8) & 1;
}

uint64_t sub_235E350B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  sub_235E366A8();
  return sub_235E612C8() & (v2 == v3);
}

uint64_t sub_235E35108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 72))
  {
    v1 = *(_QWORD *)(v0 + 72);
  }
  else
  {
    v2 = v0;
    if (qword_256385478 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385CB0);
    swift_allocObject();
    swift_bridgeObjectRetain();
    v1 = sub_235E60B9C();
    *(_QWORD *)(v2 + 72) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_235E351DC(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v3 = v1[2];
  v2 = v1[3];
  v5 = v1[4];
  v4 = v1[5];
  v7 = v1[6];
  v6 = v1[7];
  sub_235E30794(a1, (uint64_t)(v1 + 2), &qword_256385CC0);
  sub_235E3684C(v3, v2);
  sub_235E36888(v3, v2);
  v8 = v1[3];
  if (!v8)
    return sub_235E36888(v3, v2);
  v9 = v1[2];
  v10 = v1[4];
  v11 = v1[5];
  v12 = v1[6];
  v13 = v1[7];
  if (v2)
  {
    v19[0] = v3;
    v19[1] = v2;
    v19[2] = v5;
    v19[3] = v4;
    v19[4] = v7;
    v19[5] = v6;
    v17 = v9;
    v18[0] = v9;
    v18[1] = v8;
    v18[2] = v10;
    v18[3] = v11;
    v18[4] = v12;
    v18[5] = v13;
    if ((sub_235E366E4(v18, v19) & 1) != 0)
      return sub_235E36888(v3, v2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = v17;
  }
  else
  {
    v15 = v1[2];
    sub_235E3684C(v9, v8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = v15;
    sub_235E36888(v15, v8);
    sub_235E36888(v3, 0);
  }
  sub_235E35108();
  sub_235E60B90();
  swift_release();
  sub_235E36888(v16, v8);
  return sub_235E36888(v3, v2);
}

uint64_t sub_235E35408(void *a1, uint64_t a2)
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
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385C70);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385C78);
  v18 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = swift_allocObject();
  swift_weakInit();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = v11;
  v14 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385C80);
  sub_235E29CC0(&qword_256385C88, &qword_256385C80, MEMORY[0x24BDB9AF8]);
  sub_235E60BF0();
  sub_235E29CC0(&qword_256385C90, &qword_256385C70, MEMORY[0x24BDB9E90]);
  swift_retain_n();
  sub_235E60C14();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_235E29CC0(&qword_256385C98, &qword_256385C78, MEMORY[0x24BDB9568]);
  v15 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  swift_release();
  return v15;
}

uint64_t sub_235E35660@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v14[2];
  uint64_t v15[2];
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  __int128 v19;
  __int128 v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385CA0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v10 = sub_235E35884(a1, a2);
    v11 = *(void **)&v10[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance];
    sub_235E35C28(v15);
    v18[0] = v15[0];
    v18[1] = v15[1];
    v19 = v16;
    v20 = v17;
    sub_235E351DC((uint64_t)v18);
    if ((v10[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] & 1) == 0)
    {
      v10[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] = 1;
      objc_msgSend(v11, sel_registerObserver_, v10);
      objc_msgSend(v11, sel_activate);
    }
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v14[1] = sub_235E35108();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385CB0);
    sub_235E29CC0(&qword_256385CB8, &qword_256385CB0, MEMORY[0x24BDB9D10]);
    v12 = sub_235E60BFC();
    swift_release();

    result = swift_release();
  }
  else
  {
    sub_235E60BD8();
    sub_235E29CC0(&qword_256385CA8, &qword_256385CA0, MEMORY[0x24BDB9E20]);
    v12 = sub_235E60BFC();
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  *a3 = v12;
  return result;
}

char *sub_235E35884(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;
  char v11;
  char *result;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v3 = v2;
  v6 = *(char **)(v2 + 64);
  if (v6)
  {
    v7 = *(void **)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control];
    v8 = *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control
                      + 8];
    sub_235E366A8();
    v9 = v6;
    v10 = v7;
    v11 = sub_235E612C8();

    if ((v11 & 1) != 0 && v8 == a2)
      return v9;

    v13 = *(_QWORD *)(v3 + 64);
    if (v13
      && *(_BYTE *)(v13
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
    {
      *(_BYTE *)(v13
               + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
      objc_msgSend(*(id *)(v13+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_);
    }
  }
  v14 = swift_allocObject();
  swift_weakInit();
  v15 = objc_allocWithZone((Class)type metadata accessor for ControlObserver());
  v16 = a1;
  v17 = sub_235E368CC(v16, a2, (uint64_t)sub_235E368C4, v14);

  swift_release();
  v18 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v17;

  result = *(char **)(v3 + 64);
  if (result)
    return result;
  __break(1u);
  return result;
}

void sub_235E359E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7E3E6C](v2);
  if (v3)
  {
    v4 = (void *)v3;
    if (*(_BYTE *)(v3
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
    {
      *(_BYTE *)(v3
               + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
      objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_, v3);
    }

  }
}

void sub_235E35A60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B7E3E6C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    if (*(_BYTE *)(v2
                  + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
    {
      *(_BYTE *)(v2
               + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
      objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_, v2);
    }

  }
}

uint64_t sub_235E35AE0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[16];
  _BYTE v12[16];
  __int128 v13;
  _QWORD v14[6];

  v2 = *a1;
  v3 = a1[1];
  v4 = (uint64_t)(a1 + 2);
  v5 = a1[2];
  v6 = a1[3];
  v7 = (uint64_t)(a1 + 4);
  v8 = a1[4];
  v9 = a1[5];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v14[0] = v2;
    v14[1] = v3;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v8;
    v14[5] = v9;
    v13 = *(_OWORD *)a1;
    sub_235E30794(v4, (uint64_t)v12, (uint64_t *)&unk_256385CD0);
    sub_235E30794(v7, (uint64_t)v11, (uint64_t *)&unk_256385CD0);
    sub_235E348AC((uint64_t)&v13);
    sub_235E348AC((uint64_t)v12);
    sub_235E348AC((uint64_t)v11);
    sub_235E351DC((uint64_t)v14);
    return swift_release();
  }
  return result;
}

uint64_t sub_235E35BCC()
{
  uint64_t v0;

  sub_235E36888(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ControlAttributesStore()
{
  return objc_opt_self();
}

void sub_235E35C28(uint64_t *a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_235E362FC();
  v6 = v5;
  v7 = objc_msgSend(v2, sel_descriptor);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, sel_displayName);

    if (v9)
    {
      v8 = (void *)sub_235E6104C();
      v11 = v10;

      goto LABEL_6;
    }
    v8 = 0;
  }
  v11 = 0;
LABEL_6:
  v12 = objc_msgSend(v2, sel_descriptor);
  v13 = v12;
  if (!v12)
  {
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v14 = objc_msgSend(v12, sel_widgetDescription);

  if (!v14)
  {
    v13 = 0;
    goto LABEL_10;
  }
  v13 = (void *)sub_235E6104C();
  v16 = v15;

LABEL_11:
  *a1 = v4;
  a1[1] = v6;
  a1[2] = (uint64_t)v8;
  a1[3] = v11;
  a1[4] = (uint64_t)v13;
  a1[5] = v16;
}

id sub_235E35D3C()
{
  _BYTE *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  if (v0[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] == 1)
  {
    v0[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] = 0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance], sel_unregisterObserver_, v0);
  }
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ControlObserver()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for Control(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for Control(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for Control(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for Control(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Control(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Control()
{
  return &type metadata for Control;
}

uint64_t destroy for ControlAttributes()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ControlAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ControlAttributes(_QWORD *a1, _QWORD *a2)
{
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

_QWORD *assignWithTake for ControlAttributes(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MenuItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MenuItem(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlAttributes()
{
  return &type metadata for ControlAttributes;
}

uint64_t sub_235E362FC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  char *v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385CC8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235E36568();
  if (v5 && (v6 = objc_msgSend(v5, sel_title), swift_unknownObjectRelease(), v6)
    || (v7 = objc_msgSend(v0, sel_descriptor)) != 0
    && (v8 = v7, v6 = objc_msgSend(v7, sel_displayName), v8, v6))
  {
    v9 = sub_235E6104C();

  }
  else
  {
    v10 = objc_msgSend(v0, sel_control);
    v11 = (char *)objc_msgSend(v10, sel_extensionIdentity);

    v12 = &v11[*MEMORY[0x24BE16910]];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v12, v1);

    sub_235E60A64();
    v13 = objc_allocWithZone(MEMORY[0x24BDC1528]);
    v14 = sub_235E365E0();
    v15 = objc_msgSend(v14, sel_containingBundleRecord);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if (v15)
    {
      v16 = objc_msgSend(v15, sel_localizedName);

      v9 = sub_235E6104C();
    }
    else
    {
      if (qword_256385478 != -1)
        swift_once();
      v9 = qword_256385B00;
      swift_bridgeObjectRetain();
    }
  }
  return v9;
}

id sub_235E36568()
{
  id result;

  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_viewModel);
  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_viewModel);
  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_viewModel);
  return result;
}

id sub_235E365E0()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_235E609D4();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_235E366A8()
{
  unint64_t result;

  result = qword_256385C68;
  if (!qword_256385C68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256385C68);
  }
  return result;
}

uint64_t sub_235E366E4(_QWORD *a1, _QWORD *a2)
{
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  if (*a1 != *a2 || a1[1] != a2[1])
  {
    v5 = sub_235E616D0();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = a1[3];
  v8 = a2[3];
  if (!v7)
  {
    if (v8)
      return 0;
    goto LABEL_15;
  }
  if (!v8)
    return 0;
  v9 = a1[2] == a2[2] && v7 == v8;
  if (v9 || (v10 = sub_235E616D0(), result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    v11 = a1[5];
    v12 = a2[5];
    if (v11)
    {
      if (v12 && (a1[4] == a2[4] && v11 == v12 || (sub_235E616D0() & 1) != 0))
        return 1;
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_235E367B4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E367D8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E367FC()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E36830@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_235E35660(*(void **)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

void sub_235E3683C(uint64_t a1)
{
  uint64_t v1;

  sub_235E359E0(a1, v1);
}

void sub_235E36844()
{
  uint64_t v0;

  sub_235E35A60(v0);
}

uint64_t sub_235E3684C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_235E36888(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235E368C4(uint64_t *a1)
{
  return sub_235E35AE0(a1);
}

id sub_235E368CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;
  _BYTE *v5;
  objc_class *ObjectType;
  _QWORD *v11;
  id v12;
  char *v13;
  id v14;
  id v15;
  char *v16;
  objc_super v18;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v5[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive] = 0;
  v11 = &v5[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control];
  *v11 = a1;
  v11[1] = a2;
  v12 = objc_allocWithZone(MEMORY[0x24BE169A8]);
  v13 = v5;
  v14 = objc_msgSend(v12, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, a1, 1, 0, 0);
  v15 = objc_msgSend((id)objc_opt_self(), sel_instanceOfType_instanceIdentity_, a2, v14);

  *(_QWORD *)&v13[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance] = v15;
  v16 = &v13[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_updateHandler];
  *(_QWORD *)v16 = a3;
  *((_QWORD *)v16 + 1) = a4;
  swift_retain();

  v18.receiver = v13;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t sub_235E369EC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

id sub_235E36A18()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  id v7;
  id result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385CC8);
  MEMORY[0x24BDAC7A8](v5);
  v6 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  sub_235E6104C();

  sub_235E60A58();
  v7 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (!v7)
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386070);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 1, 1, v11);
    goto LABEL_5;
  }

  result = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (result)
  {
    v9 = result;
    sub_235E6104C();

    sub_235E60A58();
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386070);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 0, 1, v10);
LABEL_5:
    sub_235E6122C();
    v12 = (void *)sub_235E61220();
    v13 = objc_msgSend(v1, sel_kind);
    sub_235E6104C();

    v14 = objc_msgSend(v1, sel_intent);
    v15 = objc_allocWithZone(MEMORY[0x24BE169A0]);
    v16 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_kind_intent_, v12, v16, v14);

    return v17;
  }
  __break(1u);
  return result;
}

id sub_235E36C78(void *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = objc_msgSend(a1, sel_identity);
  v3 = objc_msgSend(v2, sel_intentReference);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_intent);

  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)sub_235E61028();
  v7 = objc_msgSend(v2, sel_extensionIdentity);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385CC8);
  sub_235E60A64();
  v8 = (void *)sub_235E61028();
  swift_endAccess();
  swift_bridgeObjectRelease();

  v9 = (char *)objc_msgSend(v2, sel_extensionIdentity);
  v10 = &v9[*MEMORY[0x24BE16900]];
  swift_beginAccess();
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11))
  {
    swift_endAccess();

    v12 = 0;
  }
  else
  {
    sub_235E60A64();
    swift_endAccess();

    v12 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  v13 = objc_msgSend(v2, sel_kind);
  if (!v13)
  {
    sub_235E6104C();
    v13 = (id)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v15 = objc_msgSend(a1, sel_type);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, v15);
  v17 = objc_msgSend(v14, sel_initWithIntent_named_extensionBundleIdentifier_containerBundleIdentifier_kind_controlType_, v5, v6, v8, v12, v13, v16);

  return v17;
}

id sub_235E36F14(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;

  v2 = v1;
  v4 = objc_msgSend(v1, sel_name);
  v24 = sub_235E6104C();
  v6 = v5;

  v7 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  v8 = sub_235E6104C();
  v10 = v9;

  v11 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (v11)
  {
    v12 = v11;
    v13 = sub_235E6104C();
    v15 = v14;

  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = objc_msgSend(v1, sel_kind);
  v17 = sub_235E6104C();
  v19 = v18;

  v20 = objc_msgSend(v2, sel_controlType);
  v21 = objc_allocWithZone(MEMORY[0x24BEC13D0]);
  v22 = a1;
  return sub_235E37078(a1, v24, v6, v8, v10, v13, v15, v17, v19, v20);
}

id sub_235E37078(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;

  v12 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  if (a7)
  {
    v14 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v18, sel_initWithIntent_named_extensionBundleIdentifier_containerBundleIdentifier_kind_controlType_, a1, v12, v13, v14, v15, a10);

  return v16;
}

id sub_235E37190(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;

  v3 = v2;
  v5 = objc_msgSend(v2, sel_intent);
  swift_bridgeObjectRetain();
  v6 = objc_msgSend(v2, sel_extensionBundleIdentifier);
  v7 = sub_235E6104C();
  v9 = v8;

  v10 = objc_msgSend(v2, sel_containerBundleIdentifier);
  if (v10)
  {
    v11 = v10;
    v12 = sub_235E6104C();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = objc_msgSend(v2, sel_kind);
  v16 = sub_235E6104C();
  v18 = v17;

  v19 = objc_msgSend(v3, sel_controlType);
  v20 = objc_allocWithZone(MEMORY[0x24BEC13D0]);
  return sub_235E37078(v5, a1, a2, v7, v9, v12, v14, v16, v18, v19);
}

uint64_t sub_235E372EC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  BOOL v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *a1;
  v1 = a1[1];
  v3 = (void *)a1[2];
  v4 = *((unsigned __int8 *)a1 + 24);
  v5 = *((unsigned __int8 *)a1 + 25);
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v10 = v5 == 0;
    v11 = *(_QWORD **)(result + 16);
    v12 = 256;
    if (v10)
      v12 = 0;
    v16 = v11[3];
    v17 = v11[2];
    v15 = (void *)v11[4];
    v11[2] = v2;
    v11[3] = v1;
    v11[4] = v3;
    v11[5] = v12 | v4;
    v11[6] = v6;
    v11[7] = v7;
    v11[8] = v8;
    v13 = v3;
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v14 = v13;
    swift_retain();
    sub_235E37740(v17, v16, v15);
    swift_retain();
    sub_235E60B90();
    swift_release();
    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    return swift_release();
  }
  return result;
}

uint64_t sub_235E37470()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ButtonViewModel()
{
  return objc_opt_self();
}

uint64_t destroy for ButtonModel(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for ButtonModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  v6 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ButtonModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  return a1;
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

uint64_t assignWithTake for ButtonModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ButtonModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonModel(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ButtonModel()
{
  return &type metadata for ButtonModel;
}

void sub_235E37740(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

  }
}

uint64_t sub_235E37790(uint64_t a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235E613E8();
  v10 = swift_allocBox();
  v12 = v11;
  sub_235E613F4();
  v13 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v9) == 1)
  {
    sub_235E37A5C((uint64_t)v8);
    swift_deallocBox();
    result = sub_235E615F8();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v12, v8, v9);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385DD0);
    sub_235E29CC0(&qword_256385DD8, &qword_256385DD0, MEMORY[0x24BDB9D10]);
    v19 = sub_235E60BFC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385DE0);
    sub_235E29CC0(&qword_256385DE8, &qword_256385DE0, MEMORY[0x24BDB9AF8]);
    sub_235E60C08();
    swift_release();
    v14 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    *(_QWORD *)(v15 + 24) = v10;
    sub_235E29CC0(&qword_256385DF0, &qword_256385DC0, MEMORY[0x24BDB94C8]);
    swift_retain();
    v16 = sub_235E60CF8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_release();
    return v16;
  }
  return result;
}

uint64_t sub_235E37A5C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235E37A9C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v2 = a1[1];
  v4 = (void *)a1[2];
  v5 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = (uint64_t)v4;
  a2[3] = v5;
  a2[4] = v6;
  a2[5] = v7;
  a2[6] = v8;
  return sub_235E380A0(v3, v2, v4);
}

uint64_t sub_235E37AC4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_235E37AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  __int16 v53;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)(a1 + 16);
  v8 = *(unsigned __int8 *)(a1 + 24);
  v9 = *(unsigned __int8 *)(a1 + 25);
  v10 = a2 + 16;
  v47 = *(_QWORD *)(a1 + 32);
  v11 = sub_235E613E8();
  v12 = swift_projectBox();
  swift_beginAccess();
  v13 = MEMORY[0x23B7E3E6C](v10);
  if (!v13)
    return;
  v14 = (id)v13;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_235E613D0();
  v15 = v7;
  sub_235E613AC();
  swift_endAccess();
  swift_beginAccess();
  v16 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v6, v12, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v6, 0, 1, v11);
  sub_235E61400();
  objc_msgSend(v14, sel_setEnabled_, v8);
  if (!v9)
  {
    swift_beginAccess();
    v19 = v14;
    sub_235E613C4();
    v21 = v20;
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (!v21)
      goto LABEL_10;
    swift_beginAccess();
    v22 = sub_235E613C4();
    v24 = v23;
    swift_endAccess();
    if (!v24)
    {
      __break(1u);
      return;
    }
    swift_bridgeObjectRelease();
    v25 = HIBYTE(v24) & 0xF;
    if ((v24 & 0x2000000000000000) == 0)
      v25 = v22 & 0xFFFFFFFFFFFFLL;
    if (!v25)
    {
LABEL_10:
      swift_beginAccess();
      v26 = (void *)sub_235E613A0();
      swift_endAccess();
      if (!v26)
        goto LABEL_4;

    }
    v18 = 0;
    goto LABEL_13;
  }
  v17 = v14;
LABEL_4:
  v18 = 1;
LABEL_13:
  v27 = v47;
  objc_msgSend(v14, sel_setHidden_, v18);

  v28 = *(_QWORD *)(v27 + 16);
  if (v28)
  {
    v46 = v14;
    v51 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_235E61544();
    v49 = sub_235E26AC8(0, (unint64_t *)&qword_256385DF8);
    v29 = (_QWORD *)(v27 + 72);
    v48 = xmmword_235E62C40;
    v45 = v28;
    do
    {
      v30 = *(v29 - 5);
      v31 = *(v29 - 4);
      v32 = (void *)*(v29 - 3);
      v33 = *((_BYTE *)v29 - 16);
      v34 = *((unsigned __int8 *)v29 - 15);
      v36 = *(v29 - 1);
      v35 = *v29;
      v37 = swift_allocObject();
      *(_QWORD *)(v37 + 16) = v30;
      *(_QWORD *)(v37 + 24) = v31;
      *(_QWORD *)(v37 + 32) = v32;
      *(_BYTE *)(v37 + 40) = v33;
      *(_BYTE *)(v37 + 41) = v34;
      *(_DWORD *)(v37 + 42) = v52;
      *(_WORD *)(v37 + 46) = v53;
      *(_QWORD *)(v37 + 48) = v36;
      *(_QWORD *)(v37 + 56) = v35;
      v38 = v32;
      swift_bridgeObjectRetain_n();
      v39 = v38;
      swift_retain_n();
      v40 = v39;
      v41 = sub_235E612D4();
      if (v34 == 1)
      {
        sub_235E26AC8(0, &qword_256385E00);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2563859D8);
        v42 = swift_allocObject();
        *(_OWORD *)(v42 + 16) = v48;
        *(_QWORD *)(v42 + 32) = v41;
        v50 = v42;
        sub_235E610C4();
        sub_235E612B0();
      }

      swift_bridgeObjectRelease();
      swift_release();
      sub_235E6152C();
      sub_235E61550();
      sub_235E6155C();
      sub_235E61538();
      v29 += 6;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    sub_235E26AC8(0, &qword_256385E00);
    v43 = (void *)sub_235E612B0();
    v14 = v46;
    objc_msgSend(v46, sel_setMenu_, v43);

    v28 = v45;
  }
  else
  {
    objc_msgSend(v14, sel_setMenu_, 0);
  }
  objc_msgSend(v14, sel_setShowsMenuAsPrimaryAction_, v28 != 0);
  objc_msgSend(v14, sel_setPreferredMenuElementOrder_, 2);
  objc_msgSend(v14, sel_setNeedsUpdateConfiguration);

}

uint64_t sub_235E38018()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_235E38044(uint64_t a1)
{
  uint64_t v1;

  sub_235E37AE8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235E3804C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E38080()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t sub_235E380A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t result;

  if (a2)
  {
    v3 = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MenuItem(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for MenuItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRetain();
  v6 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MenuItem(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v5;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for MenuItem(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for MenuItem()
{
  return &type metadata for MenuItem;
}

uint64_t getEnumTagSinglePayload for Features(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Features(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235E38308 + 4 * asc_235E62EE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235E38328 + 4 * byte_235E62EE5[v4]))();
}

_BYTE *sub_235E38308(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235E38328(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E38330(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E38338(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E38340(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E38348(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_235E38354()
{
  return 0;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_235E38370()
{
  unint64_t result;

  result = qword_256385E08;
  if (!qword_256385E08)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E62F48, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_256385E08);
  }
  return result;
}

uint64_t sub_235E383B4()
{
  return 1;
}

uint64_t sub_235E383BC()
{
  sub_235E6173C();
  sub_235E61748();
  return sub_235E61754();
}

uint64_t sub_235E383FC()
{
  return sub_235E61748();
}

uint64_t sub_235E38420()
{
  sub_235E6173C();
  sub_235E61748();
  return sub_235E61754();
}

uint64_t sub_235E3845C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void (*v29)(char *, _QWORD);
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  char v41[32];

  v39 = a5;
  v40 = a4;
  v38 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385E10);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385E18);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v37 - v16;
  v18 = sub_235E613E8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E613F4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
    return sub_235E37A5C((uint64_t)v17);
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  v23 = a2;
  sub_235E61370();
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v25 = swift_allocObject();
  v26 = v38;
  *(_QWORD *)(v25 + 16) = v24;
  *(_QWORD *)(v25 + 24) = v26;
  v27 = v26;
  sub_235E60B0C();
  v28 = sub_235E60B00();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v11, 0, 1, v28);
  v29 = (void (*)(char *, _QWORD))sub_235E612EC();
  sub_235E60ADC();
  v29(v41, 0);
  v30 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = v30;
  v32 = v39;
  v33 = v40;
  v31[3] = v40;
  v31[4] = v32;
  v34 = v32;
  v35 = v33;
  sub_235E60B24();
  v36 = sub_235E60B18();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v8, 0, 1, v36);
  sub_235E61388();
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v15, v21, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
  sub_235E61400();
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
}

id sub_235E38784(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  void *v9;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = (void *)MEMORY[0x23B7E3E6C](v4);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_isEnabled);

    if (a3)
      v8 = v7;
    else
      v8 = 1;
    v9 = a1;
    if (!v8)
      v9 = a3;
  }
  else
  {
    v9 = a1;
  }
  return v9;
}

uint64_t sub_235E3880C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  uint64_t KeyPath;
  id v18;
  void *v20;

  v10 = sub_235E609BC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v14 = MEMORY[0x23B7E3E6C](a2 + 16);
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  if (!v14)
    return v15(a5, a1, v10);
  v16 = (void *)v14;
  v15((uint64_t)v13, a1, v10);
  KeyPath = swift_getKeyPath();
  *(&v20 - 2) = (void *)MEMORY[0x24BDAC7A8](KeyPath);
  swift_getKeyPath();
  if (!objc_msgSend(v16, sel_isEnabled))
    a3 = a4;
  v20 = a3;
  sub_235E38F4C();
  v18 = a3;
  sub_235E609B0();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, v10);
}

void sub_235E38974(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_235E389C4()
{
  qword_256387478 = 0x4038000000000000;
}

void sub_235E389D4()
{
  qword_256387480 = 0x4014000000000000;
}

void sub_235E389E4()
{
  qword_256387488 = 0x4049000000000000;
}

void sub_235E389F4()
{
  qword_256387490 = 0x4014000000000000;
}

id sub_235E38A04(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
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
  void *v22;
  double v23;
  void (*v24)(_QWORD *, _QWORD);
  id v25;
  void (*v26)(_QWORD *, _QWORD);
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char *v38;
  uint64_t v39;
  id v40;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  char *v52;
  _QWORD aBlock[6];

  v49 = a4;
  v50 = a6;
  v47 = a5;
  v48 = a3;
  v42[1] = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v10);
  v52 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235E61310();
  v45 = *(_QWORD *)(v12 - 8);
  v46 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235E61394();
  v43 = *(_QWORD *)(v15 - 8);
  v44 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_235E613E8();
  v18 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v20 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HighlightAnimatingMenuButton();
  sub_235E38DE4();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a7;
  *(_QWORD *)(v21 + 24) = a8;
  swift_retain();
  sub_235E612D4();
  v22 = (void *)sub_235E6140C();
  objc_msgSend(v22, sel_setRole_, 1);
  LODWORD(v23) = 1148846080;
  objc_msgSend(v22, sel_setContentHuggingPriority_forAxis_, 1, v23);
  sub_235E613DC();
  swift_bridgeObjectRetain();
  sub_235E613D0();
  v24 = (void (*)(_QWORD *, _QWORD))sub_235E612EC();
  sub_235E60AC4();
  v24(aBlock, 0);
  v25 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 10);
  v26 = (void (*)(_QWORD *, _QWORD))sub_235E612EC();
  sub_235E60AD0();
  v26(aBlock, 0);
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v17, *MEMORY[0x24BEBD180], v44);
  sub_235E61304();
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v14, *MEMORY[0x24BEBD058], v46);
  sub_235E6131C();
  sub_235E61364();
  v27 = (_QWORD *)swift_allocObject();
  v29 = v47;
  v28 = v48;
  v30 = v49;
  v31 = v50;
  v27[2] = v47;
  v27[3] = v31;
  v27[4] = v28;
  v27[5] = v30;
  aBlock[4] = sub_235E38EA0;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235E38974;
  aBlock[3] = &block_descriptor_1;
  v32 = _Block_copy(aBlock);
  v33 = v30;
  v34 = v22;
  v35 = v29;
  v36 = v31;
  v37 = v28;
  swift_release();
  objc_msgSend(v34, sel_setConfigurationUpdateHandler_, v32);
  _Block_release(v32);

  v39 = v51;
  v38 = v52;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v52, v20, v51);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v38, 0, 1, v39);
  v40 = v34;
  sub_235E61400();

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v39);
  return v40;
}

unint64_t sub_235E38DE4()
{
  unint64_t result;

  result = qword_256385DF8;
  if (!qword_256385DF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256385DF8);
  }
  return result;
}

uint64_t sub_235E38E20()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E38E44()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235E38E64()
{
  id *v0;

  return swift_deallocObject();
}

uint64_t sub_235E38EA0(uint64_t a1)
{
  void **v1;

  return sub_235E3845C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_235E38EAC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E38ED0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_235E38EFC(void *a1)
{
  uint64_t v1;

  return sub_235E38784(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235E38F04()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235E38F38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235E3880C(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), a2);
}

unint64_t sub_235E38F4C()
{
  unint64_t result;

  result = qword_256385E20;
  if (!qword_256385E20)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEBBE08], MEMORY[0x24BEBBE18]);
    atomic_store(result, (unint64_t *)&qword_256385E20);
  }
  return result;
}

uint64_t sub_235E38F94()
{
  return 8;
}

uint64_t sub_235E38FA0()
{
  return swift_release();
}

uint64_t sub_235E38FA8(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_235E38FBC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

id sub_235E38FC8()
{
  char *v0;
  uint64_t v1;
  id result;
  char *v3;
  uint64_t v4;
  void (**v5)();
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  objc_msgSendSuper2(&v8, sel_setNeedsLayout);
  v1 = OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker;
  result = *(id *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker];
  if (result)
    return objc_msgSend(result, sel_setNeedsLayout);
  type metadata accessor for CommitTrackingView();
  v3 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_addSubview_, v3);
  v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5 = (void (**)())&v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler];
  v6 = *(_QWORD *)&v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI18CommitTrackingView_commitHandler];
  *v5 = sub_235E39F14;
  v5[1] = (void (*)())v4;
  sub_235E34DD0(v6);
  v7 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = v3;

  result = *(id *)&v0[v1];
  if (result)
    return objc_msgSend(result, sel_setNeedsLayout);
  __break(1u);
  return result;
}

void sub_235E390B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B7E3E6C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_235E3913C();

  }
}

id sub_235E3913C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  id result;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t aBlock;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_super v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_235E393C4() & 1) != 0)
  {
    v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] = 1;
    if (objc_msgSend(v0, sel_state) == (id)1)
      v4 = 0.17;
    else
      v4 = 0.3;
    v5 = (void *)objc_opt_self();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v0;
    v26 = sub_235E39E7C;
    v27 = v6;
    v7 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v23 = 1107296256;
    v24 = sub_235E33D50;
    v25 = &block_descriptor_2;
    v8 = _Block_copy(&aBlock);
    v9 = v0;
    swift_release();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v26 = sub_235E39EBC;
    v27 = v10;
    aBlock = v7;
    v23 = 1107296256;
    v24 = sub_235E2B83C;
    v25 = &block_descriptor_6;
    v11 = _Block_copy(&aBlock);
    v12 = v9;
    swift_release();
    objc_msgSend(v5, sel_transitionWithView_duration_options_animations_completion_, v12, 5242880, v8, v11, v4);
    _Block_release(v11);
    _Block_release(v8);
  }
  else if (v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] == 1)
  {
    v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout] = 1;
  }
  else
  {
    v13 = (objc_class *)type metadata accessor for HighlightAnimatingMenuButton();
    v28.receiver = v0;
    v28.super_class = v13;
    objc_msgSendSuper2(&v28, sel_layoutSubviews);
  }
  v14 = objc_msgSend(v0, sel_state);
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState] = v14;
  sub_235E613F4();
  v15 = (uint64_t)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration];
  swift_beginAccess();
  sub_235E39E10((uint64_t)v3, v15);
  swift_endAccess();
  result = objc_msgSend(v0, sel_bounds);
  v17 = &v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds];
  *v17 = v18;
  v17[1] = v19;
  v17[2] = v20;
  v17[3] = v21;
  return result;
}

uint64_t sub_235E393C4()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _BOOL4 v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t result;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  void (*v41)(char *, char *, uint64_t);
  void (*v42)(char *, uint64_t);
  char v43;
  void (*v44)(char *, char *, uint64_t);
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  char v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  void (*v52)(char *, uint64_t);
  id v53;
  uint64_t v54;
  CGRect v55;
  CGRect v56;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v54 - v5;
  v7 = sub_235E613E8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v54 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v54 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v54 - v18;
  if ((v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] & 1) != 0)
    return 0;
  v20 = (*(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState] & 1) == 0;
  if (((v20 ^ objc_msgSend(v0, sel_state)) & 1) != 0)
    return 0;
  v21 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds];
  v22 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds + 8];
  v23 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds + 16];
  v24 = *(double *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds + 24];
  objc_msgSend(v0, sel_bounds);
  v56.origin.x = v25;
  v56.origin.y = v26;
  v56.size.width = v27;
  v56.size.height = v28;
  v55.origin.x = v21;
  v55.origin.y = v22;
  v55.size.width = v23;
  v55.size.height = v24;
  result = CGRectEqualToRect(v55, v56);
  if (!(_DWORD)result)
    return result;
  v30 = (uint64_t)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration];
  swift_beginAccess();
  sub_235E39D8C(v30, (uint64_t)v6);
  v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v31(v6, 1, v7) == 1)
  {
    v32 = (uint64_t)v6;
LABEL_8:
    sub_235E37A5C(v32);
    return 0;
  }
  v33 = v6;
  v34 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v34(v19, v33, v7);
  sub_235E613F4();
  if (v31(v4, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v19, v7);
    v32 = (uint64_t)v4;
    goto LABEL_8;
  }
  v34(v17, v4, v7);
  v35 = sub_235E613C4();
  v37 = v36;
  v38 = sub_235E613C4();
  if (!v37)
  {
    if (!v39)
      goto LABEL_17;
    goto LABEL_18;
  }
  if (!v39)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    v41 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v41(v14, v19, v7);
    v41(v11, v17, v7);
    goto LABEL_19;
  }
  if (v35 == v38 && v37 == v39)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_17:
    v40 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v40(v14, v19, v7);
    v40(v11, v17, v7);
    goto LABEL_21;
  }
  v43 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v44(v14, v19, v7);
  v44(v11, v17, v7);
  if ((v43 & 1) == 0)
  {
LABEL_19:
    v42 = *(void (**)(char *, uint64_t))(v8 + 8);
    v42(v11, v7);
    v42(v14, v7);
    v42(v17, v7);
    v42(v19, v7);
    return 0;
  }
LABEL_21:
  v45 = (void *)sub_235E613A0();
  v46 = sub_235E613A0();
  v47 = (void *)v46;
  if (!v45)
  {
    v51 = *(void (**)(char *, uint64_t))(v8 + 8);
    v51(v11, v7);
    v51(v14, v7);
    v51(v17, v7);
    v51(v19, v7);
    if (v47)
    {

      return 0;
    }
    return 1;
  }
  if (!v46)
  {
    v52 = *(void (**)(char *, uint64_t))(v8 + 8);
    v53 = v45;
    v52(v11, v7);
    v52(v14, v7);
    v52(v17, v7);
    v52(v19, v7);

    return 0;
  }
  sub_235E39DD4();
  v48 = v45;
  v49 = sub_235E612C8();
  v50 = *(void (**)(char *, uint64_t))(v8 + 8);
  v50(v11, v7);
  v50(v14, v7);
  v50(v17, v7);
  v50(v19, v7);

  return (v49 & 1) != 0;
}

id sub_235E3995C(void *a1)
{
  _BYTE *v1;
  char *v3;
  uint64_t v4;
  _OWORD *v5;
  id v6;
  objc_super v8;

  v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] = 0;
  v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousState] = 0;
  v3 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration];
  v4 = sub_235E613E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousBounds];
  *v5 = 0u;
  v5[1] = 0u;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_commitTracker] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

void sub_235E39A4C()
{
  uint64_t v0;

  sub_235E37A5C(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_previousConfiguration);

}

id sub_235E39A78()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235E39AE4()
{
  return type metadata accessor for HighlightAnimatingMenuButton();
}

uint64_t type metadata accessor for HighlightAnimatingMenuButton()
{
  uint64_t result;

  result = qword_256385E80;
  if (!qword_256385E80)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235E39B28()
{
  unint64_t v0;

  sub_235E39BC4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_235E39BC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256385E90)
  {
    sub_235E613E8();
    v0 = sub_235E61424();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256385E90);
  }
}

uint64_t type metadata accessor for CommitTrackingView()
{
  return objc_opt_self();
}

uint64_t sub_235E39D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_235E39DD4()
{
  unint64_t result;

  result = qword_256385EC8;
  if (!qword_256385EC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256385EC8);
  }
  return result;
}

uint64_t sub_235E39E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E39E58()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_235E39E7C()
{
  uint64_t v0;
  objc_super v2;

  v2.receiver = *(id *)(v0 + 16);
  v2.super_class = (Class)type metadata accessor for HighlightAnimatingMenuButton();
  return objc_msgSendSuper2(&v2, sel_layoutSubviews);
}

_BYTE *sub_235E39EBC()
{
  uint64_t v0;
  _BYTE *result;

  result = *(_BYTE **)(v0 + 16);
  result[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_isAnimating] = 0;
  if (result[OBJC_IVAR____TtC27ActionButtonConfigurationUI28HighlightAnimatingMenuButton_hasPendingLayout] == 1)
    return objc_msgSend(result, sel_setNeedsLayout);
  return result;
}

uint64_t sub_235E39EF0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_235E39F14()
{
  uint64_t v0;

  sub_235E390B8(v0);
}

id sub_235E39F28(void *a1, __int128 *a2)
{
  char *v2;
  objc_class *ObjectType;
  char *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  __int128 v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction] = a1;
  v7 = objc_allocWithZone(MEMORY[0x24BEC54E0]);
  v8 = a1;
  v9 = objc_msgSend(v7, sel_init);
  v10 = objc_msgSend(v8, sel_intent);
  objc_msgSend(v9, sel_setIntent_, v10);

  objc_msgSend(v9, sel_setWidgetConfigurationType_, 1);
  if (*((_QWORD *)a2 + 3))
  {
    swift_bridgeObjectRetain();
    v11 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v9, sel_setWidgetDisplayName_, v11);

  if (*((_QWORD *)a2 + 5))
  {
    swift_bridgeObjectRetain();
    v12 = (void *)sub_235E61028();
    v16 = *a2;
    sub_235E369EC((uint64_t)&v16);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v16 = *a2;
    sub_235E369EC((uint64_t)&v16);
    v12 = 0;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setWidgetDescription_, v12);

  v15.receiver = v2;
  v15.super_class = ObjectType;
  v13 = objc_msgSendSuper2(&v15, sel_initWithOptions_, v9);
  objc_msgSend(v13, sel_setDelegate_, v13);

  return v13;
}

id sub_235E3A198()
{
  char *v0;
  objc_class *ObjectType;
  void *v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion];
  if (v2)
    objc_msgSend(v2, sel_invalidate);
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_235E3A2B4(char a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  objc_super v15;

  v15.receiver = v1;
  v15.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v15, sel_viewIsAppearing_, a1 & 1);
  v3 = OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion;
  if (!*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion])
  {
    v4 = objc_msgSend(v1, sel_view);
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, sel_window);

      if (v6)
      {
        v7 = objc_msgSend(v6, sel__rootSheetPresentationController);

        if (v7)
        {
          objc_msgSend(v7, sel__setShouldScaleDownBehindDescendantSheets_, 0);
          v8 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v9 = objc_allocWithZone(MEMORY[0x24BE0BE98]);
          swift_retain();
          v10 = (void *)sub_235E61028();
          v11 = (void *)sub_235E61028();
          v14[4] = sub_235E3A7EC;
          v14[5] = v8;
          v14[0] = MEMORY[0x24BDAC760];
          v14[1] = 1107296256;
          v14[2] = sub_235E38974;
          v14[3] = &block_descriptor_3;
          v12 = _Block_copy(v14);
          v13 = objc_msgSend(v9, sel_initWithIdentifier_forReason_invalidationBlock_, v10, v11, v12);

          _Block_release(v12);
          swift_release();

          swift_release();
          *(_QWORD *)&v1[v3] = v13;
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_235E3A4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x23B7E3E6C](v2);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel__setShouldScaleDownBehindDescendantSheets_, 1);

  }
}

uint64_t sub_235E3A554(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v6, sel_viewDidDisappear_, a1 & 1);
  v3 = OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion;
  v4 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_rootSheetPresentationControllerBehaviorAssertion];
  if (v4)
    objc_msgSend(v4, sel_invalidate);
  *(_QWORD *)&v1[v3] = 0;
  return swift_unknownObjectRelease();
}

void sub_235E3A600(void *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void (*v12)(id);
  id v13;

  v3 = v2;
  v6 = objc_msgSend(a2, sel__indexingHash);
  v7 = OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction;
  v8 = objc_msgSend(*(id *)(v3+ OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_configuredAction), sel_intent);
  if (v8 && (v9 = v8, v10 = objc_msgSend(v8, sel__indexingHash), v9, v6 == v10))
  {
    v13 = 0;
  }
  else
  {
    v11 = *(id *)(v3 + v7);
    v13 = sub_235E36F14(a2);

  }
  v12 = *(void (**)(id))(v3
                                  + OBJC_IVAR____TtC27ActionButtonConfigurationUI34ControlConfigurationViewController_completionHandler);
  if (v12)
  {
    swift_retain();
    v12(v13);
    sub_235E34DD0((uint64_t)v12);
  }
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

uint64_t type metadata accessor for ControlConfigurationViewController()
{
  return objc_opt_self();
}

uint64_t sub_235E3A7C8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_235E3A7EC(uint64_t a1)
{
  uint64_t v1;

  sub_235E3A4B8(a1, v1);
}

id sub_235E3A7F4(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  objc_super v23;
  uint64_t v24;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385CC8);
  MEMORY[0x24BDAC7A8](v10);
  v11 = &v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI27ControlPickerViewController_completionHandler];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v12 = objc_allocWithZone(MEMORY[0x24BE19BA8]);
  swift_retain();
  v13 = objc_msgSend(v12, sel_init);
  sub_235E61298();
  if (sub_235E3AE24())
  {
    sub_235E26AC8(0, &qword_256386080);
    v14 = (void *)sub_235E610A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, sel_setDisallowedControlIdentities_, v14);

  sub_235E6122C();
  sub_235E60A58();
  sub_235E60A58();
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386070);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 0, 1, v15);
  v16 = sub_235E61220();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563859D8);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_235E62C40;
  *(_QWORD *)(v17 + 32) = v16;
  v24 = v17;
  sub_235E610C4();
  v18 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setDisallowedExtensionIdentities_, v18);

  if (sub_235E3BD1C())
  {
    sub_235E61268();
    v19 = (void *)sub_235E610A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v13, sel_setSuggestedControls_, v19);

  v23.receiver = v3;
  v23.super_class = ObjectType;
  v20 = objc_msgSendSuper2(&v23, sel_initWithConfiguration_, v13);
  objc_msgSend(v20, sel_setDelegate_, v20);

  swift_release();
  return v20;
}

void sub_235E3AAF8(void *a1, void *a2, id a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  id v8;
  id v10;
  uint64_t (*v11)(id, BOOL);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[6];

  v4 = v3;
  if (a3)
  {
    v7 = 0;
    v8 = a3;
  }
  else if (a2)
  {
    sub_235E26AC8(0, &qword_256386088);
    v10 = a2;
    v8 = sub_235E36C78(objc_msgSend(v10, sel_control));
    v7 = objc_msgSend(v10, sel_promptsForUserConfiguration);

  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v11 = *(uint64_t (**)(id, BOOL))(v4
                                           + OBJC_IVAR____TtC27ActionButtonConfigurationUI27ControlPickerViewController_completionHandler);
  v12 = a3;
  swift_retain();
  v13 = v11(v8, a3 != 0);
  v15 = v14;
  swift_release();
  if (v7)
  {
    sub_235E34C94(v13);
    v16 = v13;
    v17 = v15;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v18 = objc_msgSend(a1, sel_presentingViewController);
  if (v18)
  {
    v19 = v18;
    if (v16)
    {
      v21[4] = v16;
      v21[5] = v17;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 1107296256;
      v21[2] = sub_235E33D50;
      v21[3] = &block_descriptor_4;
      v20 = _Block_copy(v21);
      swift_retain();
      swift_release();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v19, sel_dismissViewControllerAnimated_completion_, 1, v20);
    sub_235E34D0C(v8);
    sub_235E34DD0(v13);
    sub_235E34DD0(v16);
    _Block_release(v20);

  }
  else
  {
    sub_235E34D0C(v8);
    sub_235E34DD0(v13);
    sub_235E34DD0(v16);
  }
}

uint64_t type metadata accessor for ControlPickerViewController()
{
  return objc_opt_self();
}

uint64_t sub_235E3AE24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  unint64_t v75;
  id v76;
  void (*v77)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385CC8);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v67 - v5;
  v80 = MEMORY[0x24BEE4AF8];
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386070);
  v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v8(v4, 0, 1, v7);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  v9 = sub_235E6122C();
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v79 = v9;
  v10 = (void *)sub_235E61220();
  v11 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v12 = (void *)sub_235E61028();
  v13 = objc_msgSend(v11, sel_initWithExtensionIdentity_kind_intent_, v10, v12, 0);

  sub_235E3C954((uint64_t)v6);
  v14 = v13;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v76 = v14;
  sub_235E610E8();
  sub_235E610C4();
  v8(v6, 1, 1, v7);
  v75 = 0xD000000000000010;
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v8(v4, 0, 1, v7);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v15 = (void *)sub_235E61220();
  v16 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v17 = (void *)sub_235E61028();
  v18 = objc_msgSend(v16, sel_initWithExtensionIdentity_kind_intent_, v15, v17, 0);

  sub_235E3C954((uint64_t)v6);
  v19 = v18;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v74 = v19;
  sub_235E610E8();
  sub_235E610C4();
  v8(v6, 1, 1, v7);
  v72 = (id)0xD000000000000015;
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v8(v4, 0, 1, v7);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  v77 = v8;
  v78 = v7;
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v20 = (void *)sub_235E61220();
  v21 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v22 = (void *)sub_235E61028();
  v23 = objc_msgSend(v21, sel_initWithExtensionIdentity_kind_intent_, v20, v22, 0);

  sub_235E3C954((uint64_t)v6);
  v24 = v23;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v73 = v24;
  sub_235E610E8();
  sub_235E610C4();
  v25 = v77;
  v26 = v78;
  v77(v6, 1, 1, v78);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v25(v4, 0, 1, v26);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v27 = (void *)sub_235E61220();
  v28 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v29 = (void *)sub_235E61028();
  v30 = objc_msgSend(v28, sel_initWithExtensionIdentity_kind_intent_, v27, v29, 0);

  sub_235E3C954((uint64_t)v6);
  v31 = v30;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v72 = v31;
  sub_235E610E8();
  sub_235E610C4();
  v33 = v77;
  v32 = v78;
  v77(v6, 1, 1, v78);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v33(v4, 0, 1, v32);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v34 = (void *)sub_235E61220();
  v35 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v36 = (void *)sub_235E61028();
  v37 = objc_msgSend(v35, sel_initWithExtensionIdentity_kind_intent_, v34, v36, 0);

  sub_235E3C954((uint64_t)v6);
  v38 = v37;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v71 = v38;
  sub_235E610E8();
  sub_235E610C4();
  v33(v6, 1, 1, v32);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v33(v4, 0, 1, v32);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v39 = (void *)sub_235E61220();
  v40 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v41 = (void *)sub_235E61028();
  v42 = objc_msgSend(v40, sel_initWithExtensionIdentity_kind_intent_, v39, v41, 0);

  sub_235E3C954((uint64_t)v6);
  v43 = v42;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v70 = v43;
  sub_235E610E8();
  sub_235E610C4();
  v33(v6, 1, 1, v32);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v33(v4, 0, 1, v32);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v44 = (void *)sub_235E61220();
  v45 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v46 = (void *)sub_235E61028();
  v47 = objc_msgSend(v45, sel_initWithExtensionIdentity_kind_intent_, v44, v46, 0);

  sub_235E3C954((uint64_t)v6);
  v48 = v47;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v69 = v48;
  sub_235E610E8();
  sub_235E610C4();
  v33(v6, 1, 1, v32);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v33(v4, 0, 1, v32);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v49 = (void *)sub_235E61220();
  v50 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v51 = (void *)sub_235E61028();
  v52 = objc_msgSend(v50, sel_initWithExtensionIdentity_kind_intent_, v49, v51, 0);

  sub_235E3C954((uint64_t)v6);
  v53 = v52;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v68 = v53;
  sub_235E610E8();
  sub_235E610C4();
  v54 = v78;
  v33(v6, 1, 1, v78);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v33(v4, 0, 1, v54);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v55 = (void *)sub_235E61220();
  v56 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v57 = (void *)sub_235E61028();
  v58 = objc_msgSend(v56, sel_initWithExtensionIdentity_kind_intent_, v55, v57, 0);

  sub_235E3C954((uint64_t)v6);
  v59 = v58;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  sub_235E610E8();
  sub_235E610C4();
  v60 = v78;
  v33(v6, 1, 1, v78);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v6);
  v33(v4, 0, 1, v60);
  sub_235E3C994((uint64_t)v4, (uint64_t)v6);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v6, (uint64_t)v4);
  v61 = (void *)sub_235E61220();
  v62 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v63 = (void *)sub_235E61028();
  v64 = objc_msgSend(v62, sel_initWithExtensionIdentity_kind_intent_, v61, v63, 0);

  sub_235E3C954((uint64_t)v6);
  v65 = v64;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  sub_235E610E8();
  sub_235E610C4();

  return v80;
}

uint64_t sub_235E3BD1C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  _QWORD v62[2];
  id v63;
  id v64;
  char *v65;
  char *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385CC8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v62 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v62 - v7;
  v72 = MEMORY[0x24BEE4AF8];
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386070);
  v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
  v10(v8, 1, 1, v9);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v10(v6, 0, 1, v9);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  v11 = sub_235E6122C();
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v71 = v11;
  v12 = (void *)sub_235E61220();
  v13 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v14 = (void *)sub_235E61028();
  v15 = objc_msgSend(v13, sel_initWithExtensionIdentity_kind_intent_, v12, v14, 0);

  sub_235E3C954((uint64_t)v8);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v15, 0, 0);

  v17 = v16;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v69 = v17;
  sub_235E610E8();
  sub_235E610C4();
  v10(v8, 1, 1, v9);
  v66 = "timer.WorldClockWidget";
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v10(v6, 0, 1, v9);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  v65 = "ator.CalculatorWidget.control";
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v18 = (void *)sub_235E61220();
  v19 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v70 = v9;
  v20 = v2;
  v21 = v10;
  v22 = v19;
  v23 = (void *)sub_235E61028();
  v24 = objc_msgSend(v22, sel_initWithExtensionIdentity_kind_intent_, v18, v23, 0);

  sub_235E3C954((uint64_t)v8);
  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v24, 0, 0);

  v26 = v25;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v68 = v26;
  sub_235E610E8();
  sub_235E610C4();
  v27 = v70;
  v21(v8, 1, 1, v70);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v21(v6, 0, 1, v27);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v28 = (void *)sub_235E61220();
  v29 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v30 = (void *)sub_235E61028();
  v31 = objc_msgSend(v29, sel_initWithExtensionIdentity_kind_intent_, v28, v30, 0);

  sub_235E3C954((uint64_t)v8);
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v31, 0, 0);

  v33 = v32;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v67 = v33;
  sub_235E610E8();
  sub_235E610C4();
  v34 = v70;
  v21(v8, 1, 1, v70);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v21(v6, 0, 1, v34);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v35 = (void *)sub_235E61220();
  v62[1] = v20;
  v36 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v37 = (void *)sub_235E61028();
  v38 = objc_msgSend(v36, sel_initWithExtensionIdentity_kind_intent_, v35, v37, 0);

  sub_235E3C954((uint64_t)v8);
  v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v38, 0, 0);

  v40 = v39;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v64 = v40;
  sub_235E610E8();
  sub_235E610C4();
  v41 = v70;
  v21(v8, 1, 1, v70);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v21(v6, 0, 1, v41);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v42 = (void *)sub_235E61220();
  v43 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v44 = (void *)sub_235E61028();
  v62[0] = v21;
  v45 = objc_msgSend(v43, sel_initWithExtensionIdentity_kind_intent_, v42, v44, 0);

  sub_235E3C954((uint64_t)v8);
  v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v45, 0, 0);

  v47 = v46;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  v63 = v47;
  sub_235E610E8();
  sub_235E610C4();
  v48 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v62[0];
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v62[0])(v8, 1, 1, v41);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v48(v6, 0, 1, v41);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v49 = (void *)sub_235E61220();
  v50 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v51 = (void *)sub_235E61028();
  v52 = objc_msgSend(v50, (SEL)&selRef_fontName + 7, v49, v51, 0);

  sub_235E3C954((uint64_t)v8);
  v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v52, 0, 0);

  v54 = v53;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  sub_235E610E8();
  sub_235E610C4();
  v48(v8, 1, 1, v41);
  sub_235E60A58();
  sub_235E3C954((uint64_t)v8);
  v48(v6, 0, 1, v41);
  sub_235E3C994((uint64_t)v6, (uint64_t)v8);
  sub_235E60A58();
  sub_235E3C9DC((uint64_t)v8, (uint64_t)v6);
  v55 = (void *)sub_235E61220();
  v56 = objc_allocWithZone(MEMORY[0x24BE169A0]);
  v57 = (void *)sub_235E61028();
  v58 = objc_msgSend(v56, sel_initWithExtensionIdentity_kind_intent_, v55, v57, 0);

  sub_235E3C954((uint64_t)v8);
  v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19BA0]), sel_initWithIdentity_type_size_, v58, 0, 0);

  v60 = v59;
  MEMORY[0x23B7E3170]();
  if (*(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_235E610D0();
  sub_235E610E8();
  sub_235E610C4();

  return v72;
}

uint64_t sub_235E3C954(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235E3C994(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E3C9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256386060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_235E3CACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  void *v20;

  swift_getObjectType();
  sub_235E3CD84();
  if (!v1)
  {
    v15 = (objc_class *)MEMORY[0x24BEBD640];
LABEL_12:
    objc_msgSend(objc_allocWithZone(v15), sel_init);
    return;
  }
  v2 = sub_235E6104C();
  v4 = v3;
  if (v2 == sub_235E6104C() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v7 = sub_235E616D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      v8 = (void *)sub_235E61028();
      v9 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured);
      v10 = (void *)objc_opt_self();
      v11 = objc_msgSend(v10, sel__systemImageNamed_shape_fill_, v8, 0, v9);

      if (v11
        || (swift_bridgeObjectRetain(),
            v12 = (void *)sub_235E61028(),
            swift_bridgeObjectRelease(),
            v11 = objc_msgSend(v10, sel__systemImageNamed_, v12),
            v12,
            v11))
      {
        swift_bridgeObjectRelease();
LABEL_10:
        v13 = v11;
        v14 = (void *)sub_235E61028();
        objc_msgSend(v13, sel_setAccessibilityLabel_, v14);

        return;
      }
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      v20 = (void *)sub_235E61028();
      swift_bridgeObjectRelease();
      v11 = objc_msgSend(v10, sel_imageNamed_inBundle_withConfiguration_, v20, v19, 0);

      if (v11)
        goto LABEL_10;
      v15 = (objc_class *)MEMORY[0x24BEBD640];
      goto LABEL_12;
    }
  }
  v16 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_, v16);

  if (!v17)
    __break(1u);
}

uint64_t sub_235E3CD84()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier);
  v2 = sub_235E6104C();
  v4 = v3;
  if (v2 == sub_235E6104C() && v4 == v5)
  {
    v19 = v1;
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  v7 = sub_235E616D0();
  v8 = v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
LABEL_15:

    return 0x616C732E6C6C6562;
  }
  v9 = sub_235E6104C();
  v11 = v10;
  if (v9 == sub_235E6104C() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v14 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
  {
LABEL_18:

    return 0x6D726F6665766177;
  }
  v15 = sub_235E6104C();
  v17 = v16;
  if (v15 == sub_235E6104C() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
LABEL_20:

    return 1852796781;
  }
  v22 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_20;
  v23 = sub_235E6104C();
  v25 = v24;
  if (v23 == sub_235E6104C() && v25 == v26)
  {
    swift_bridgeObjectRelease_n();
LABEL_25:

    return 0x6172656D6163;
  }
  v27 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
    goto LABEL_25;
  v28 = sub_235E6104C();
  v30 = v29;
  if (v28 == sub_235E6104C() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_30:

    return 0x67696C6873616C66;
  }
  v32 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_30;
  v33 = sub_235E6104C();
  v35 = v34;
  if (v33 == sub_235E6104C() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:

    return 0x6269737365636361;
  }
  v37 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_35;
  v38 = sub_235E6104C();
  v40 = v39;
  if (v38 == sub_235E6104C() && v40 == v41)
  {
    swift_bridgeObjectRelease_n();
LABEL_40:

    return 0x74616C736E617274;
  }
  v42 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v42 & 1) != 0)
    goto LABEL_40;
  v43 = sub_235E6104C();
  v45 = v44;
  if (v43 == sub_235E6104C() && v45 == v46)
  {
    swift_bridgeObjectRelease_n();
LABEL_45:
    v20 = 0xD000000000000014;

    return v20;
  }
  v47 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v47 & 1) != 0)
    goto LABEL_45;
  v48 = sub_235E6104C();
  v50 = v49;
  if (v48 == sub_235E6104C() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_51:

    return 0x322E686374697773;
  }
  v52 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v52 & 1) != 0)
    goto LABEL_51;
  v53 = sub_235E6104C();
  v55 = v54;
  if (v53 == sub_235E6104C() && v55 == v56)
  {
    swift_bridgeObjectRelease_n();
LABEL_56:

    return 0x74732E322E707061;
  }
  v57 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v57 & 1) != 0)
    goto LABEL_56;
  v58 = sub_235E6104C();
  v60 = v59;
  if (v58 == sub_235E6104C() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_61:

    return 0x732E656C63726963;
  }
  v62 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v62 & 1) != 0)
    goto LABEL_61;
  v63 = sub_235E6104C();
  v65 = v64;
  if (v63 == sub_235E6104C() && v65 == v66)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v67 = sub_235E616D0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0)
      return 0;
  }
  return 0xD000000000000017;
}

uint64_t sub_235E3D4FC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_235E3D534 + 4 * byte_235E63100[a1]))(0xD000000000000011, 0x8000000235E65570);
}

uint64_t sub_235E3D534()
{
  return 0x656C746974;
}

uint64_t sub_235E3D548()
{
  return 0x656C746974627573;
}

uint64_t sub_235E3D560()
{
  return 0x6769666E6F437369;
}

uint64_t sub_235E3D580()
{
  return 0x6F6C6F43746E6974;
}

uint64_t sub_235E3D5A4()
{
  unsigned __int8 *v0;

  return sub_235E3D4FC(*v0);
}

uint64_t sub_235E3D5AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235E3E71C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235E3D5D0()
{
  return 0;
}

void sub_235E3D5DC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_235E3D5E8()
{
  sub_235E3EFFC();
  return sub_235E61778();
}

uint64_t sub_235E3D610()
{
  sub_235E3EFFC();
  return sub_235E61784();
}

uint64_t sub_235E3D688(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  _OWORD v11[2];
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386188);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E3EFFC();
  sub_235E6176C();
  *(_QWORD *)&v11[0] = *(_QWORD *)(v3
                                 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier);
  v12 = 0;
  type metadata accessor for WFStaccatoActionSectionIdentifier(0);
  sub_235E3F084(&qword_256386190, (uint64_t)&protocol conformance descriptor for WFStaccatoActionSectionIdentifier);
  sub_235E616B8();
  if (!v2)
  {
    LOBYTE(v11[0]) = 1;
    sub_235E61694();
    LOBYTE(v11[0]) = 2;
    sub_235E61694();
    LOBYTE(v11[0]) = 3;
    sub_235E616A0();
    v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor + 16);
    v11[0] = *(_OWORD *)(v3 + OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor);
    v11[1] = v9;
    v12 = 4;
    sub_235E3F0C4();
    sub_235E616B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_235E3D890(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  objc_class *ObjectType;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  char v24;

  ObjectType = (objc_class *)swift_getObjectType();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386168);
  v4 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v7 = sub_235E3EFFC();
  v8 = v1;
  sub_235E61760();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    v9 = v4;
    type metadata accessor for WFStaccatoActionSectionIdentifier(0);
    v24 = 0;
    sub_235E3F084(&qword_256386178, (uint64_t)&protocol conformance descriptor for WFStaccatoActionSectionIdentifier);
    v10 = v19;
    sub_235E61688();
    *(_QWORD *)&v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier] = v22;
    LOBYTE(v22) = 1;
    v12 = sub_235E61664();
    v13 = (uint64_t *)&v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_title];
    *v13 = v12;
    v13[1] = v14;
    LOBYTE(v22) = 2;
    v15 = sub_235E61664();
    v16 = (uint64_t *)&v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_subtitle];
    *v16 = v15;
    v16[1] = v17;
    LOBYTE(v22) = 3;
    v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured] = sub_235E61670() & 1;
    v24 = 4;
    sub_235E3F040();
    sub_235E61688();
    v18 = &v8[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor];
    *(_OWORD *)v18 = v22;
    *((_OWORD *)v18 + 1) = v23;

    v21.receiver = v8;
    v21.super_class = ObjectType;
    v7 = (unint64_t)objc_msgSendSuper2(&v21, sel_init);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_235E3DBE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_235E6104C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_235E3DC1C@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  unint64_t result;

  v6 = objc_allocWithZone(v2);
  result = sub_235E3D890(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_235E3DC68(_QWORD *a1)
{
  return sub_235E3D688(a1);
}

uint64_t sub_235E3DC88(char a1)
{
  return qword_235E63600[a1];
}

uint64_t sub_235E3DCA8(_QWORD *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;
  char v17;
  double v18;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563861B8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E3F108();
  sub_235E6176C();
  v18 = a2;
  v17 = 0;
  sub_235E3F190();
  sub_235E616B8();
  if (!v5)
  {
    v18 = a3;
    v17 = 1;
    sub_235E616B8();
    v18 = a4;
    v17 = 2;
    sub_235E616B8();
    v18 = a5;
    v17 = 3;
    sub_235E616B8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_235E3DE70()
{
  char *v0;

  return sub_235E3DC88(*v0);
}

uint64_t sub_235E3DE78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235E3E92C(a1, a2);
  *a3 = result;
  return result;
}

void sub_235E3DE9C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_235E3DEA8()
{
  sub_235E3F108();
  return sub_235E61778();
}

uint64_t sub_235E3DED0()
{
  sub_235E3F108();
  return sub_235E61784();
}

void sub_235E3DEF8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_235E3EA9C(a1);
  if (!v2)
  {
    *(double *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 24) = v7;
  }
}

uint64_t sub_235E3DF24(_QWORD *a1)
{
  double *v1;

  return sub_235E3DCA8(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_235E3DF50@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235E61658();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_235E3DFA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_235E3ECA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_235E3DFC8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_235E61658();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_235E3E01C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_235E3E028()
{
  sub_235E3EE08();
  return sub_235E61778();
}

uint64_t sub_235E3E050()
{
  sub_235E3EE08();
  return sub_235E61784();
}

uint64_t WFStaccatoActionSectionIdentifier.init(from:)(_QWORD *a1)
{
  return sub_235E3ECC0(a1);
}

uint64_t WFStaccatoActionSectionIdentifier.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386090);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E3EE08();
  sub_235E6176C();
  sub_235E6104C();
  sub_235E61694();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E3E17C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_235E3ECC0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_235E3E1A4(_QWORD *a1)
{
  return WFStaccatoActionSectionIdentifier.encode(to:)(a1);
}

uint64_t sub_235E3E1BC()
{
  sub_235E6173C();
  sub_235E61064();
  return sub_235E61754();
}

uint64_t sub_235E3E208()
{
  sub_235E6173C();
  sub_235E61064();
  return sub_235E61754();
}

uint64_t sub_235E3E258()
{
  return sub_235E61064();
}

double sub_235E3E270(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v3 = 0;
  v4 = 0;
  v2 = 0;
  objc_msgSend(a1, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2);
  return *(double *)v5;
}

void sub_235E3E2E8(uint64_t a1, uint64_t a2, char a3)
{
  swift_getObjectType();
  __asm { BR              X10 }
}

id sub_235E3E350(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, objc_super a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  char *v32;
  char v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  char v37;
  char *v38;
  __CFString *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  _DWORD *v60;
  objc_super v62;

  v38 = v32;
  v39 = CFSTR("Controls");
  *(_QWORD *)&v32[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_sectionIdentifier] = CFSTR("Controls");
  sub_235E5B528((uint64_t)v36, v34, v33);
  v40 = &v32[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_title];
  *(_QWORD *)v40 = v41;
  *((_QWORD *)v40 + 1) = v42;
  sub_235E5B758((uint64_t)v36, v34, v33);
  v43 = &v32[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_subtitle];
  *(_QWORD *)v43 = v44;
  *((_QWORD *)v43 + 1) = v45;
  sub_235E5B96C((uint64_t)v36, v34, v33);
  v47 = v46;
  v48 = objc_msgSend(v46, sel_UIColor);

  v49 = sub_235E3E270(v48);
  v51 = v50;
  v53 = v52;
  v55 = v54;

  v56 = (double *)&v32[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_tintColor];
  *v56 = v49;
  *((_QWORD *)v56 + 1) = v51;
  *((_QWORD *)v56 + 2) = v53;
  *((_QWORD *)v56 + 3) = v55;
  v32[OBJC_IVAR____TtC27ActionButtonConfigurationUI18ActionSelectorItem_isConfigured] = v37 & 1;

  if (qword_2563854D0 != -1)
    swift_once();
  v57 = sub_235E60AA0();
  __swift_project_value_buffer(v57, (uint64_t)qword_256386DC8);
  sub_235E34E50(v36, v34, v33);
  sub_235E34E50(v36, v34, v33);
  v58 = sub_235E60A88();
  v59 = sub_235E6119C();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    *v60 = 136315394;
    __asm { BR              X10 }
  }
  sub_235E34EA4(v36, v34, v33);
  sub_235E34EA4(v36, v34, v33);

  v62.receiver = v32;
  v62.super_class = v35;
  return objc_msgSendSuper2(&v62, sel_init);
}

uint64_t sub_235E3E71C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000235E65570 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6769666E6F437369 && a2 == 0xEC00000064657275 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F6C6F43746E6974 && a2 == 0xE900000000000072)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_235E616D0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_235E3E92C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v3 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E65657267 && a2 == 0xE500000000000000 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702194274 && a2 == 0xE400000000000000 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6168706C61 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_235E616D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

double sub_235E3EA9C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  uint64_t v8;
  double v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563861A0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E3F108();
  sub_235E61760();
  HIBYTE(v8) = 0;
  sub_235E3F14C();
  sub_235E61688();
  v6 = v9;
  HIBYTE(v8) = 1;
  sub_235E61688();
  HIBYTE(v8) = 2;
  sub_235E61688();
  HIBYTE(v8) = 3;
  sub_235E61688();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

uint64_t sub_235E3ECA8()
{
  return 0x65756C6156776172;
}

uint64_t sub_235E3ECC0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563861C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E3EE08();
  sub_235E61760();
  if (!v1)
  {
    sub_235E61664();
    v7 = sub_235E61028();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_235E3EE08()
{
  unint64_t result;

  result = qword_256386098;
  if (!qword_256386098)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E6339C, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256386098);
  }
  return result;
}

uint64_t type metadata accessor for ActionSelectorItem()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for Color()
{
  return &type metadata for Color;
}

uint64_t _s10CodingKeysOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235E3EEBC + 4 * byte_235E63105[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235E3EEDC + 4 * byte_235E6310A[v4]))();
}

_BYTE *sub_235E3EEBC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235E3EEDC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E3EEE4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E3EEEC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E3EEF4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E3EEFC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_235E3EF1C()
{
  unint64_t result;

  result = qword_256386150;
  if (!qword_256386150)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E6328C, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256386150);
  }
  return result;
}

uint64_t sub_235E3EF60()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_235E3EF70()
{
  unint64_t result;

  result = qword_256386158;
  if (!qword_256386158)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E631C4, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256386158);
  }
  return result;
}

unint64_t sub_235E3EFB8()
{
  unint64_t result;

  result = qword_256386160;
  if (!qword_256386160)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E631EC, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_256386160);
  }
  return result;
}

unint64_t sub_235E3EFFC()
{
  unint64_t result;

  result = qword_256386170;
  if (!qword_256386170)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E635AC, &type metadata for ActionSelectorItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256386170);
  }
  return result;
}

unint64_t sub_235E3F040()
{
  unint64_t result;

  result = qword_256386180;
  if (!qword_256386180)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E632DC, &type metadata for Color);
    atomic_store(result, (unint64_t *)&qword_256386180);
  }
  return result;
}

uint64_t sub_235E3F084(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for WFStaccatoActionSectionIdentifier(255);
    result = MEMORY[0x23B7E3CE0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_235E3F0C4()
{
  unint64_t result;

  result = qword_256386198;
  if (!qword_256386198)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E632B4, &type metadata for Color);
    atomic_store(result, (unint64_t *)&qword_256386198);
  }
  return result;
}

unint64_t sub_235E3F108()
{
  unint64_t result;

  result = qword_2563861A8;
  if (!qword_2563861A8)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E6355C, &type metadata for Color.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861A8);
  }
  return result;
}

unint64_t sub_235E3F14C()
{
  unint64_t result;

  result = qword_2563861B0;
  if (!qword_2563861B0)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2563861B0);
  }
  return result;
}

unint64_t sub_235E3F190()
{
  unint64_t result;

  result = qword_2563861C0;
  if (!qword_2563861C0)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2563861C0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Color.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Color.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E3F2B0 + 4 * byte_235E6311C[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_235E3F2E4 + 4 * byte_235E63117[v4]))();
}

uint64_t sub_235E3F2E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E3F2EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E3F2F4);
  return result;
}

uint64_t sub_235E3F300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E3F308);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_235E3F30C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E3F314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Color.CodingKeys()
{
  return &type metadata for Color.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ActionSelectorItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ActionSelectorItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E3F40C + 4 * byte_235E63126[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_235E3F440 + 4 * byte_235E63121[v4]))();
}

uint64_t sub_235E3F440(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E3F448(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E3F450);
  return result;
}

uint64_t sub_235E3F45C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E3F464);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_235E3F468(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E3F470(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActionSelectorItem.CodingKeys()
{
  return &type metadata for ActionSelectorItem.CodingKeys;
}

unint64_t sub_235E3F490()
{
  unint64_t result;

  result = qword_2563861D0;
  if (!qword_2563861D0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E6347C, &type metadata for ActionSelectorItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861D0);
  }
  return result;
}

unint64_t sub_235E3F4D8()
{
  unint64_t result;

  result = qword_2563861D8;
  if (!qword_2563861D8)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63534, &type metadata for Color.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861D8);
  }
  return result;
}

unint64_t sub_235E3F520()
{
  unint64_t result;

  result = qword_2563861E0;
  if (!qword_2563861E0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E634A4, &type metadata for Color.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861E0);
  }
  return result;
}

unint64_t sub_235E3F568()
{
  unint64_t result;

  result = qword_2563861E8;
  if (!qword_2563861E8)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E634CC, &type metadata for Color.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861E8);
  }
  return result;
}

unint64_t sub_235E3F5B0()
{
  unint64_t result;

  result = qword_2563861F0;
  if (!qword_2563861F0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E633EC, &type metadata for ActionSelectorItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861F0);
  }
  return result;
}

unint64_t sub_235E3F5F8()
{
  unint64_t result;

  result = qword_2563861F8;
  if (!qword_2563861F8)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63414, &type metadata for ActionSelectorItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563861F8);
  }
  return result;
}

uint64_t sub_235E3F64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235E411E4(a1, a2, a3, &qword_256386280);
}

uint64_t sub_235E3F658(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_256386280);
}

void sub_235E3F664()
{
  sub_235E38F4C();
  sub_235E609C8();
  __break(1u);
}

void sub_235E3F688()
{
  sub_235E6098C();
  __break(1u);
}

void sub_235E3F6A0()
{
  qword_256386200 = 0x4041000000000000;
}

id sub_235E3F6B0(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancellableBag] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_customizeButtonViewModel] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancelButtonViewModel] = a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  swift_retain();
  swift_retain();
  v6 = objc_msgSendSuper2(&v8, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  sub_235E3F7A4();

  swift_release();
  swift_release();
  return v6;
}

void sub_235E3F7A4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  double v57;
  double v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  double v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  void *v113;
  double v114;
  double v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  SEL *v130;
  id v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  id v137;
  void *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  void *v146;
  id v147;
  id v148;
  id v149;
  void *v150;
  id v151;
  id v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  id v158;
  void *v159;
  id v160;
  id v161;
  void *v162;
  uint64_t v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  char *v170;
  char *v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  __int128 v175;
  id v176;
  char *v177;
  char *v178;
  uint64_t v179;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v2);
  v171 = (char *)&v163 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385E10);
  MEMORY[0x24BDAC7A8](v4);
  v170 = (char *)&v163 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = sub_235E613E8();
  v174 = *(_QWORD *)(v172 - 8);
  MEMORY[0x24BDAC7A8](v172);
  v177 = (char *)&v163 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235E2C48C();
  if (qword_256385470 != -1)
    swift_once();
  v8 = (id)qword_256387470;
  v178 = "igurationUI/WelcomeView.swift";
  sub_235E609A4();

  if (qword_256385450 != -1)
    swift_once();
  v9 = *(double *)&qword_256387450;
  v10 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  swift_bridgeObjectRetain();
  v11 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithString_, v11);

  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  objc_msgSend(v13, sel_setLineSpacing_, v9);
  objc_msgSend(v13, sel_setAlignment_, 1);
  objc_msgSend(v13, sel_setLineBreakStrategy_, 1);
  v14 = *MEMORY[0x24BEBB3A8];
  v15 = v13;
  objc_msgSend(v12, sel_addAttribute_value_range_, v14, v15, 0, objc_msgSend(v12, sel_length));

  v173 = v7;
  objc_msgSend(v7, sel_setAttributedText_, v12);
  swift_bridgeObjectRelease();

  v176 = sub_235E2C5B4();
  v16 = (id)qword_256387470;
  sub_235E609A4();

  if (qword_256385458 != -1)
    swift_once();
  v17 = *(double *)&qword_256387458;
  v18 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  swift_bridgeObjectRetain();
  v19 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v18, sel_initWithString_, v19);

  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  objc_msgSend(v21, sel_setLineSpacing_, v17);
  objc_msgSend(v21, sel_setAlignment_, 1);
  objc_msgSend(v21, sel_setLineBreakStrategy_, 1);
  v22 = v21;
  objc_msgSend(v20, sel_addAttribute_value_range_, v14, v22, 0, objc_msgSend(v20, sel_length));

  objc_msgSend(v176, sel_setAttributedText_, v20);
  swift_bridgeObjectRelease();

  v23 = sub_235E2C5B4();
  v24 = (id)qword_256387470;
  sub_235E609A4();

  v25 = *(double *)&qword_256387458;
  v26 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  swift_bridgeObjectRetain();
  v27 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v26, sel_initWithString_, v27);

  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), (SEL)&stru_25073DDB8.type);
  objc_msgSend(v29, sel_setLineSpacing_, v25);
  objc_msgSend(v29, sel_setAlignment_, 1);
  objc_msgSend(v29, sel_setLineBreakStrategy_, 1);
  v30 = v29;
  objc_msgSend(v28, sel_addAttribute_value_range_, v14, v30, 0, objc_msgSend(v28, sel_length));

  objc_msgSend(v23, sel_setAttributedText_, v28);
  swift_bridgeObjectRelease();

  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), (SEL)&stru_25073DDB8.type);
  v32 = objc_msgSend(v31, sel_heightAnchor);
  v33 = objc_msgSend(v32, sel_constraintEqualToConstant_, 0.0);

  v34 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint;
  v35 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint] = v33;

  v36 = *(void **)&v1[v34];
  if (!v36)
  {
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  objc_msgSend(v36, sel_setActive_, 1);
  v178 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2563859D8);
  v37 = swift_allocObject();
  v175 = xmmword_235E63640;
  *(_OWORD *)(v37 + 16) = xmmword_235E63640;
  v38 = v173;
  *(_QWORD *)(v37 + 32) = v31;
  *(_QWORD *)(v37 + 40) = v38;
  v39 = v176;
  *(_QWORD *)(v37 + 48) = v176;
  *(_QWORD *)(v37 + 56) = v23;
  v179 = v37;
  sub_235E610C4();
  v40 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v41 = sub_235E26AC8(0, &qword_256386268);
  v169 = v31;
  v42 = v38;
  v43 = v39;
  v44 = v23;
  v45 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  v46 = objc_msgSend(v40, sel_initWithArrangedSubviews_, v45);

  objc_msgSend(v46, sel_setAxis_, 1);
  if (qword_256385460 != -1)
    swift_once();
  objc_msgSend(v46, sel_setCustomSpacing_afterView_, v42, *(double *)&qword_256387460);
  objc_msgSend(v46, sel_setSpacing_, 18.0);
  objc_msgSend(v46, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v47 = objc_msgSend(v46, sel_layer);
  objc_msgSend(v47, sel_setAllowsGroupOpacity_, 0);

  v48 = objc_msgSend(v46, sel_layer);
  objc_msgSend(v48, sel_setAllowsGroupBlending_, 0);

  v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v50 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView;
  v51 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView] = v49;

  v52 = *(void **)&v1[v50];
  if (!v52)
    goto LABEL_61;
  objc_msgSend(v52, sel_addSubview_, v46);
  v53 = *(void **)&v1[v50];
  if (!v53)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v54 = v46;
  objc_msgSend(v53, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v55 = objc_msgSend(v1, sel_traitCollection);
  v56 = objc_msgSend(v55, sel_preferredContentSizeCategory);

  LOBYTE(v55) = sub_235E6125C();
  if ((v55 & 1) != 0)
    v57 = 32.0;
  else
    v57 = 44.0;
  if (qword_256385480 != -1)
    swift_once();
  v168 = v42;
  v58 = *(double *)&qword_256387478;
  v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = v175;
  v60 = objc_msgSend(v46, sel_topAnchor);
  v61 = *(void **)&v1[v50];
  if (!v61)
    goto LABEL_63;
  v167 = v44;
  v173 = (id)v41;
  v62 = objc_msgSend(v61, sel_topAnchor);
  v63 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v62);

  *(_QWORD *)(v59 + 32) = v63;
  v64 = objc_msgSend(v54, sel_leadingAnchor);
  v65 = *(void **)&v1[v50];
  if (!v65)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  v66 = v57 - v58;
  v67 = objc_msgSend(v65, sel_leadingAnchor);
  v68 = objc_msgSend(v64, sel_constraintEqualToAnchor_constant_, v67, v66);

  *(_QWORD *)(v59 + 40) = v68;
  v69 = objc_msgSend(v54, sel_trailingAnchor);
  v70 = *(void **)&v1[v50];
  if (!v70)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  v71 = objc_msgSend(v70, sel_trailingAnchor);
  v72 = objc_msgSend(v69, sel_constraintEqualToAnchor_constant_, v71, -v66);

  *(_QWORD *)(v59 + 48) = v72;
  v166 = v54;
  v73 = objc_msgSend(v54, sel_bottomAnchor);
  v74 = *(void **)&v1[v50];
  if (!v74)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v75 = v73;
  v76 = (void *)objc_opt_self();
  v77 = objc_msgSend(v74, sel_bottomAnchor);
  v78 = objc_msgSend(v75, sel_constraintEqualToAnchor_, v77);

  *(_QWORD *)(v59 + 56) = v78;
  v179 = v59;
  sub_235E610C4();
  v176 = (id)sub_235E26AC8(0, &qword_256386270);
  v79 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v76, sel_activateConstraints_, v79);

  v80 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD918]), sel_init);
  v81 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView;
  v82 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView] = v80;

  v83 = *(void **)&v1[v81];
  if (!v83)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!*(_QWORD *)&v1[v50])
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  objc_msgSend(v83, sel_addSubview_);
  v84 = *(void **)&v1[v81];
  if (!v84)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  objc_msgSend(v84, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = v175;
  v86 = *(void **)&v1[v50];
  if (!v86)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  v87 = objc_msgSend(v86, sel_topAnchor);
  v88 = *(void **)&v1[v81];
  if (!v88)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  v89 = objc_msgSend(v88, sel_topAnchor);
  v90 = objc_msgSend(v87, sel_constraintEqualToAnchor_, v89);

  *(_QWORD *)(v85 + 32) = v90;
  v91 = *(void **)&v1[v50];
  if (!v91)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  v92 = objc_msgSend(v91, sel_leftAnchor);
  v93 = *(void **)&v1[v81];
  if (!v93)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v94 = objc_msgSend(v93, sel_leftAnchor);
  v95 = objc_msgSend(v92, sel_constraintEqualToAnchor_, v94);

  *(_QWORD *)(v85 + 40) = v95;
  v96 = *(void **)&v1[v50];
  if (!v96)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  v97 = objc_msgSend(v96, sel_widthAnchor);
  v98 = *(void **)&v1[v81];
  if (!v98)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  v99 = objc_msgSend(v98, sel_widthAnchor);
  v100 = objc_msgSend(v97, sel_constraintEqualToAnchor_, v99);

  *(_QWORD *)(v85 + 48) = v100;
  v101 = *(void **)&v1[v50];
  if (!v101)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  v102 = objc_msgSend(v101, sel_bottomAnchor);
  v103 = *(void **)&v1[v81];
  if (!v103)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v104 = objc_msgSend(v103, sel_bottomAnchor);
  if (qword_256385468 != -1)
    swift_once();
  v105 = objc_msgSend(v102, sel_constraintEqualToAnchor_constant_, v104, -*(double *)&qword_256387468);

  *(_QWORD *)(v85 + 56) = v105;
  v179 = v85;
  sub_235E610C4();
  v106 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v76, sel_activateConstraints_, v106);

  v107 = *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_customizeButtonViewModel];
  v108 = *(_QWORD *)(v107 + 16);
  v109 = *(_QWORD *)(v108 + 24);
  v165 = v43;
  v164 = v76;
  if (v109)
  {
    v110 = *(_QWORD *)(v108 + 16);
    swift_bridgeObjectRetain();
  }
  else
  {
    v110 = 0;
    v109 = 0xE000000000000000;
  }
  v111 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v112 = sub_235E38A04(v110, v109, 0, 0, 0, 0, (uint64_t)sub_235E415C4, v111);
  swift_bridgeObjectRelease();
  swift_release_n();
  sub_235E37790(v107);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  type metadata accessor for HighlightAnimatingMenuButton();
  sub_235E26AC8(0, (unint64_t *)&qword_256385DF8);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_235E612D4();
  v113 = (void *)sub_235E6140C();
  LODWORD(v114) = 1148846080;
  objc_msgSend(v113, sel_setContentHuggingPriority_forAxis_, 1, v114);
  LODWORD(v115) = 1148846080;
  objc_msgSend(v113, sel_setContentCompressionResistancePriority_forAxis_, 1, v115);
  sub_235E613B8();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v116 = v170;
  sub_235E60B24();
  v117 = sub_235E60B18();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v117 - 8) + 56))(v116, 0, 1, v117);
  sub_235E61388();
  v118 = *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancelButtonViewModel];
  if (*(_QWORD *)(*(_QWORD *)(v118 + 16) + 24))
    swift_bridgeObjectRetain();
  v119 = v177;
  sub_235E613D0();
  v120 = v174;
  v121 = v171;
  v122 = v119;
  v123 = v172;
  (*(void (**)(char *, char *, uint64_t))(v174 + 16))(v171, v122, v172);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v120 + 56))(v121, 0, 1, v123);
  v124 = v113;
  sub_235E61400();

  sub_235E37790(v118);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  v125 = swift_allocObject();
  *(_OWORD *)(v125 + 16) = xmmword_235E63650;
  v126 = *(void **)&v1[v81];
  if (!v126)
    goto LABEL_78;
  *(_QWORD *)(v125 + 32) = v126;
  *(_QWORD *)(v125 + 40) = v112;
  *(_QWORD *)(v125 + 48) = v124;
  v179 = v125;
  sub_235E610C4();
  v127 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  *(_QWORD *)&v175 = v124;
  v128 = v112;
  v129 = v126;
  v130 = (SEL *)sub_235E610A0();
  swift_bridgeObjectRelease();
  v131 = objc_msgSend(v127, sel_initWithArrangedSubviews_, v130);

  v132 = OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView;
  v133 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView] = v131;

  if (!*(_QWORD *)&v1[v132])
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  objc_msgSend(v1, sel_addSubview_);
  v134 = *(void **)&v1[v132];
  if (!v134)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  objc_msgSend(v134, sel_setAxis_, 1);
  v135 = *(void **)&v1[v132];
  if (!v135)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  v136 = qword_2563854A0;
  v137 = v135;
  if (v136 == -1)
  {
    if (*(_QWORD *)&v1[v50])
      goto LABEL_45;
  }
  else
  {
    swift_once();
    if (*(_QWORD *)&v1[v50])
    {
LABEL_45:
      v130 = (SEL *)&selRef_setFont_;
      objc_msgSend(v137, sel_setCustomSpacing_afterView_, *(double *)&qword_256386200);

      v138 = *(void **)&v1[v132];
      if (v138)
      {
        v139 = qword_256385498;
        v137 = v138;
        if (v139 == -1)
          goto LABEL_47;
        goto LABEL_59;
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
  }
  __break(1u);
LABEL_59:
  swift_once();
LABEL_47:
  objc_msgSend(v137, v130[166], v128, *(double *)&qword_256387490);

  v140 = *(void **)&v1[v132];
  if (!v140)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  objc_msgSend(v140, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v141 = swift_allocObject();
  *(_OWORD *)(v141 + 16) = xmmword_235E63660;
  v142 = *(void **)&v1[v132];
  if (!v142)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  v143 = objc_msgSend(v142, sel_topAnchor);
  v144 = objc_msgSend(v1, sel_topAnchor);
  v145 = objc_msgSend(v143, sel_constraintEqualToAnchor_, v144);

  *(_QWORD *)(v141 + 32) = v145;
  v146 = *(void **)&v1[v132];
  if (!v146)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  v147 = objc_msgSend(v146, sel_leadingAnchor);
  v148 = objc_msgSend(v1, sel_leadingAnchor);
  v149 = objc_msgSend(v147, sel_constraintEqualToAnchor_constant_, v148, *(double *)&qword_256387478);

  *(_QWORD *)(v141 + 40) = v149;
  v150 = *(void **)&v1[v132];
  if (!v150)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  v151 = objc_msgSend(v150, sel_trailingAnchor);
  v152 = objc_msgSend(v1, sel_trailingAnchor);
  v153 = objc_msgSend(v151, sel_constraintEqualToAnchor_constant_, v152, -*(double *)&qword_256387478);

  *(_QWORD *)(v141 + 48) = v153;
  v154 = *(void **)&v1[v132];
  if (!v154)
  {
LABEL_87:
    __break(1u);
    return;
  }
  v155 = objc_msgSend(v154, sel_bottomAnchor);
  v156 = objc_msgSend(v1, sel_safeAreaLayoutGuide);
  v157 = objc_msgSend(v156, sel_bottomAnchor);

  if (qword_256385488 != -1)
    swift_once();
  v158 = objc_msgSend(v155, sel_constraintEqualToAnchor_constant_, v157, -*(double *)&qword_256387480);

  *(_QWORD *)(v141 + 56) = v158;
  v159 = (void *)v175;
  v160 = objc_msgSend((id)v175, sel_heightAnchor);
  if (qword_256385490 != -1)
    swift_once();
  v161 = objc_msgSend(v160, sel_constraintEqualToConstant_, *(double *)&qword_256387488);

  *(_QWORD *)(v141 + 64) = v161;
  v179 = v141;
  sub_235E610C4();
  v162 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v164, sel_activateConstraints_, v162);

  (*(void (**)(char *, uint64_t))(v174 + 8))(v177, v123);
}

uint64_t sub_235E40DEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);

  v1 = a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x23B7E3E6C](v1);
  if (result)
  {
    v3 = (void *)result;
    v4 = *(_QWORD *)(result + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_customizeButtonViewModel);
    swift_retain();

    v5 = *(_QWORD **)(v4 + 16);
    v6 = v5[2];
    v7 = v5[3];
    v8 = (void *)v5[4];
    v9 = (void (*)(void))v5[7];
    sub_235E380A0(v6, v7, v8);
    result = swift_release();
    if (v7)
    {
      swift_retain();
      sub_235E37740(v6, v7, v8);
      v9();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_235E40ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (*v10)(void);

  v2 = a2 + 16;
  swift_beginAccess();
  result = MEMORY[0x23B7E3E6C](v2);
  if (result)
  {
    v4 = (void *)result;
    v5 = *(_QWORD *)(result + OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancelButtonViewModel);
    swift_retain();

    v6 = *(_QWORD **)(v5 + 16);
    v7 = v6[2];
    v8 = v6[3];
    v9 = (void *)v6[4];
    v10 = (void (*)(void))v6[7];
    sub_235E380A0(v7, v8, v9);
    result = swift_release();
    if (v8)
    {
      swift_retain();
      sub_235E37740(v7, v8, v9);
      v10();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_235E40FC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  uint64_t KeyPath;
  uint64_t v14;
  id v15;
  unsigned int v16;
  double v17;
  id v18;
  id v20;

  v6 = sub_235E609BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v10 = MEMORY[0x23B7E3E6C](a2 + 16);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!v10)
    return v11(a3, a1, v6);
  v12 = (void *)v10;
  v11((uint64_t)v9, a1, v6);
  KeyPath = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x24BDAC7A8](KeyPath);
  swift_getKeyPath();
  v20 = sub_235E2C364(*MEMORY[0x24BEBE1D0]);
  sub_235E415F8();
  sub_235E609B0();
  v14 = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x24BDAC7A8](v14);
  swift_getKeyPath();
  v15 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v16 = objc_msgSend(v12, sel_isHighlighted);
  v17 = 1.0;
  if (v16)
    v17 = 0.5;
  v18 = objc_msgSend(v15, sel_colorWithAlphaComponent_, v17);

  v20 = v18;
  sub_235E38F4C();
  sub_235E609B0();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t sub_235E411D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235E411E4(a1, a2, a3, &qword_256386288);
}

uint64_t sub_235E411E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_235E6101C() & 1;
}

uint64_t sub_235E41238(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_256386288);
}

uint64_t keypath_hashTm(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_235E61010();
}

void sub_235E41284()
{
  sub_235E415F8();
  sub_235E609C8();
  __break(1u);
}

void sub_235E412A8()
{
  sub_235E60998();
  __break(1u);
}

void sub_235E412C0()
{
  char *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  double Height;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = v0;
  v10.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v10, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView];
  if (!v1)
  {
    __break(1u);
    goto LABEL_11;
  }
  objc_msgSend(v1, sel_layoutIfNeeded);
  v2 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint];
  if (!v2)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v3 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView];
  if (!v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v4 = v2;
  objc_msgSend(v3, sel_frame);
  Height = CGRectGetHeight(v11);
  v6 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView];
  if (!v6)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v7 = Height;
  objc_msgSend(v6, sel_frame);
  v8 = CGRectGetHeight(v12);
  if (qword_2563854A0 != -1)
    swift_once();
  v9 = v7 - v8 - *(double *)&qword_256386200;
  if (v9 <= 0.0)
    v9 = 0.0;
  objc_msgSend(v4, sel_setConstant_, v9);

}

uint64_t type metadata accessor for WelcomeView()
{
  return objc_opt_self();
}

void sub_235E414F8()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_stackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelContainerView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_labelScrollView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_spacerHeightConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI11WelcomeView_cancellableBag] = MEMORY[0x24BEE4B08];

  sub_235E615F8();
  __break(1u);
}

uint64_t sub_235E415A0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E415C4()
{
  uint64_t v0;

  return sub_235E40DEC(v0);
}

uint64_t sub_235E415CC(uint64_t a1)
{
  uint64_t v1;

  return sub_235E40ED8(a1, v1);
}

uint64_t sub_235E415D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235E40FC4(a1, v2, a2);
}

void sub_235E415DC()
{
  sub_235E60998();
  __break(1u);
}

unint64_t sub_235E415F8()
{
  unint64_t result;

  result = qword_256386278;
  if (!qword_256386278)
  {
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEBBE20], MEMORY[0x24BEBBE30]);
    atomic_store(result, (unint64_t *)&qword_256386278);
  }
  return result;
}

void sub_235E4163C()
{
  sub_235E415F8();
  sub_235E609C8();
  __break(1u);
}

uint64_t sub_235E41660()
{
  return 8;
}

uint64_t sub_235E4166C()
{
  return swift_release();
}

uint64_t sub_235E41674(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_235E41680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235E411E4(a1, a2, a3, &qword_256386288) & 1;
}

uint64_t sub_235E416A0(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_256386288);
}

_QWORD *sub_235E416AC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_235E416B8()
{
  sub_235E6098C();
  __break(1u);
}

void sub_235E416D4()
{
  sub_235E38F4C();
  sub_235E609C8();
  __break(1u);
}

uint64_t sub_235E416F8()
{
  return 8;
}

uint64_t sub_235E41704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235E411E4(a1, a2, a3, &qword_256386280) & 1;
}

uint64_t sub_235E41724(uint64_t a1, uint64_t a2)
{
  return keypath_hashTm(a1, a2, &qword_256386280);
}

uint64_t sub_235E41880()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  v1 = v0 + OBJC_IVAR___BCPreloader_resourceLoadToken;
  swift_beginAccess();
  sub_235E2B738((uint64_t)v4, v1);
  swift_endAccess();
  v2 = (_QWORD *)(v0 + OBJC_IVAR___BCPreloader_cancellableBag);
  swift_beginAccess();
  *v2 = MEMORY[0x24BEE4B08];
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E41910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _OWORD v9[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  memset(v9, 0, sizeof(v9));
  v4 = v0 + OBJC_IVAR___BCPreloader_resourceLoadToken;
  swift_beginAccess();
  sub_235E2B738((uint64_t)v9, v4);
  swift_endAccess();
  v5 = (_QWORD *)(v0 + OBJC_IVAR___BCPreloader_cancellableBag);
  swift_beginAccess();
  *v5 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRelease();
  ABReleaseResources();
  v6 = sub_235E60A10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v3, 1, 1, v6);
  sub_235E456E4(0xD000000000000013, 0x8000000235E658D0, (uint64_t)v3);
  return sub_235E30A00((uint64_t)v3, &qword_2563862C0);
}

id Preloader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Preloader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for Preloader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Preloader.cancelPreload()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of Preloader.clearCache()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t sub_235E41AFC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_235E41B20(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_235E41B38()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_235E41BB4()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PublishedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PublishedValue);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B7E3C74](a1, v6, a5);
}

char *sub_235E41C34(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *result;
  char *v35;
  id v36;
  char v37;
  _BYTE v38[4];
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  CGRect v43;

  v42 = a1;
  v39 = a1 & 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v38[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385E18);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385E10);
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_235E613E8();
  v41 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = &v38[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ConfigureButton();
  sub_235E26AC8(0, (unint64_t *)&qword_256385DF8);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  swift_retain();
  sub_235E612D4();
  v18 = (char *)sub_235E6140C();
  v19 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v19, sel_setAllowsGroupOpacity_, 0);

  v20 = objc_msgSend(v18, sel_layer);
  objc_msgSend(v20, sel_setAllowsGroupBlending_, 0);

  sub_235E613B8();
  v21 = sub_235E2C364(*MEMORY[0x24BEBE1F0]);
  v22 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v21);

  sub_235E612E0();
  sub_235E61358();
  v23 = objc_msgSend(v18, sel_traitCollection);
  v24 = objc_msgSend(v23, sel_preferredContentSizeCategory);

  sub_235E6125C();
  sub_235E61364();
  objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView], sel_bounds);
  CGRectGetWidth(v43);
  sub_235E6134C();
  v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v25;
  LOBYTE(v17) = v39;
  *(_BYTE *)(v26 + 24) = v39;
  v27 = v40;
  *(_QWORD *)(v26 + 32) = v40;
  sub_235E60B24();
  v28 = sub_235E60B18();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v13, 0, 1, v28);
  sub_235E61388();
  v29 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v29;
  *(_BYTE *)(v30 + 24) = v17;
  *(_QWORD *)(v30 + 32) = v27;
  sub_235E60B0C();
  v31 = sub_235E60B00();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v10, 0, 1, v31);
  v32 = v41;
  sub_235E6137C();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v32 + 16))(v7, v16, v14);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v7, 0, 1, v14);
  v33 = v18;
  sub_235E61400();

  if ((v42 & 1) == 0)
    goto LABEL_5;
  result = (char *)objc_msgSend(v33, sel_titleLabel);
  if (result)
  {
    v35 = result;
    v36 = objc_msgSend(result, sel_layer);

    objc_msgSend(v36, sel_setCompositingFilter_, *MEMORY[0x24BDE5BD8]);
    v37 = v33[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron];
    v33[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron] = 1;
    if ((v37 & 1) == 0)
      sub_235E42ACC();
LABEL_5:
    (*(void (**)(_BYTE *, uint64_t))(v32 + 8))(v16, v14);
    return v33;
  }
  __break(1u);
  return result;
}

void sub_235E42158(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t KeyPath;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = a2 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x23B7E3E6C](v7);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = sub_235E609BC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a4, a1, v10);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    swift_getKeyPath();
    v12 = (uint64_t *)MEMORY[0x24BEBE1D0];
    v13 = a3 & 1;
    if (v13)
      v12 = (uint64_t *)MEMORY[0x24BEBE220];
    v16 = sub_235E2C364(*v12);
    sub_235E415F8();
    sub_235E609B0();
    v14 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v14);
    swift_getKeyPath();
    sub_235E43820(v13, (char)objc_msgSend(v9, sel_isHighlighted, v16));
    sub_235E38F4C();
    sub_235E609B0();

  }
  else
  {
    v15 = sub_235E609BC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a4, a1, v15);
  }
}

id sub_235E4230C(void *a1, uint64_t a2, char a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = (void *)MEMORY[0x23B7E3E6C](v4);
  if (!v5)
    return a1;
  v6 = v5;
  v7 = sub_235E43820(a3 & 1, (char)objc_msgSend(v5, sel_isHighlighted, a1));

  return v7;
}

void sub_235E423F4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  id v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  int v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  CGRect v59;
  CGRect v60;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v54 - v6;
  v8 = sub_235E613E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E613F4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_235E37A5C((uint64_t)v7);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  v12 = sub_235E613A0();
  if (v12)
  {
    v13 = (void *)v12;
    v56 = sub_235E2C364(*MEMORY[0x24BEBE1F0]);
    v55 = MEMORY[0x23B7E38E4](v13);
    v14 = objc_msgSend(v0, sel__imageView);
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, sel_layer);
      if (v55)
      {
        sub_235E6104C();
        v17 = sub_235E61028();
        swift_bridgeObjectRelease();
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(v16, sel_setCompositingFilter_, v17);

      swift_unknownObjectRelease();
    }
    v54 = v15;
    v18 = MEMORY[0x23B7E38E4](v13);
    v19 = v18 == 0;
    if (v18)
      v20 = 32;
    else
      v20 = 8552674;
    if (v19)
      v21 = 0xA300000000000000;
    else
      v21 = 0xE100000000000000;
    v22 = sub_235E42F70(v20, v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    swift_bridgeObjectRelease();
    v59.origin.x = v22;
    v59.origin.y = v24;
    v59.size.width = v26;
    v59.size.height = v28;
    v29 = ceil(CGRectGetWidth(v59));
    sub_235E61328();
    if (v29 == v30)
    {
      if ((v55 & 1) != 0)
      {
LABEL_17:
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

LABEL_30:
        return;
      }
    }
    else
    {
      v31 = MEMORY[0x23B7E38E4](v13);
      v32 = v31 == 0;
      if (v31)
        v33 = 32;
      else
        v33 = 8552674;
      if (v32)
        v34 = 0xA300000000000000;
      else
        v34 = 0xE100000000000000;
      v35 = sub_235E42F70(v33, v34);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      swift_bridgeObjectRelease();
      v60.origin.x = v35;
      v60.origin.y = v37;
      v60.size.width = v39;
      v60.size.height = v41;
      CGRectGetWidth(v60);
      sub_235E61334();
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
      sub_235E61400();
      if ((v55 & 1) != 0)
        goto LABEL_17;
    }
    v42 = v56;
    objc_msgSend(v56, sel_lineHeight);
    v44 = v43;
    v45 = sub_235E613C4();
    if (!v46)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      goto LABEL_29;
    }
    v47 = v45;
    v48 = v46;
    v49 = round(v44 * 1.15);
    objc_msgSend(v13, sel_size);
    if (v50 == v49)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      swift_bridgeObjectRelease();
LABEL_29:

      goto LABEL_30;
    }
    v57 = v47;
    v58 = v48;
    sub_235E61160();
    sub_235E61070();
    swift_bridgeObjectRelease();
    v51 = v57;
    v52 = v58;
    v53 = (uint64_t *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_iconCache];
    swift_beginAccess();
    sub_235E42894(v53, v51, v52, v49, v49);
    swift_endAccess();
    swift_bridgeObjectRelease();
    sub_235E613AC();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
    sub_235E61400();

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_235E42894(uint64_t *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  void *v5;
  void *v6;
  uint64_t v12;
  unint64_t v13;
  char v14;
  id v15;
  uint64_t result;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v25[6];

  v6 = v5;
  v12 = *a1;
  if (*(_QWORD *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    v13 = sub_235E5D3E8(a2, a3);
    if ((v14 & 1) != 0)
    {
      v15 = *(id *)(*(_QWORD *)(v12 + 56) + 8 * v13);
      swift_bridgeObjectRelease();
      return (uint64_t)v15;
    }
    swift_bridgeObjectRelease();
  }
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD618]), sel_initWithSize_, a4, a5);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v6;
  *(double *)(v18 + 24) = a4;
  *(double *)(v18 + 32) = a5;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_235E43768;
  *(_QWORD *)(v19 + 24) = v18;
  v25[4] = sub_235E38E44;
  v25[5] = v19;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 1107296256;
  v25[2] = sub_235E436C8;
  v25[3] = &block_descriptor_6;
  v20 = _Block_copy(v25);
  v21 = v6;
  swift_retain();
  swift_release();
  v22 = objc_msgSend(v17, sel_imageWithActions_, v20);

  _Block_release(v20);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v17 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    v23 = v22;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25[0] = *a1;
    *a1 = 0x8000000000000000;
    sub_235E50C0C((uint64_t)v23, a2, a3, isUniquelyReferenced_nonNull_native);
    *a1 = v25[0];
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v23;
  }
  return result;
}

uint64_t sub_235E42ACC()
{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double Width;
  id v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  id v48;
  double v49;
  double v50;
  double Height;
  double v52;
  double v53;
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v54 - v6;
  v8 = sub_235E613E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E613F4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    return sub_235E37A5C((uint64_t)v7);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  v13 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView];
  v14 = objc_msgSend(v13, sel_image);
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v13, sel_superview);

    if (!v16)
      objc_msgSend(v1, sel_addSubview_, v13);
    if ((objc_msgSend(v1, sel_isHidden) & 1) != 0 || !objc_msgSend(v1, sel_isEnabled))
      v17 = 1;
    else
      v17 = v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron];
    objc_msgSend(v13, sel_setHidden_, v17);
    v18 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
    v19 = objc_msgSend(v1, sel_isHighlighted);
    v20 = 0.35;
    if (v19)
      v20 = 0.25;
    v21 = objc_msgSend(v18, sel_colorWithAlphaComponent_, v20);

    objc_msgSend(v13, sel_setTintColor_, v21);
    sub_235E61340();
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = 0.0;
    if ((objc_msgSend(v13, sel_isHidden) & 1) == 0)
    {
      objc_msgSend(v13, sel_bounds);
      Width = CGRectGetWidth(v55);
      v30 = sub_235E2C364(*MEMORY[0x24BEBE1F0]);
      v31 = MEMORY[0x23B7E38E4](v15);
      v32 = v31 == 0;
      if (v31)
        v33 = 32;
      else
        v33 = 8552674;
      if (v32)
        v34 = 0xA300000000000000;
      else
        v34 = 0xE100000000000000;
      v35 = sub_235E42F70(v33, v34);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      swift_bridgeObjectRelease();
      v56.origin.x = v35;
      v56.origin.y = v37;
      v56.size.width = v39;
      v56.size.height = v41;
      v42 = CGRectGetWidth(v56);

      v28 = Width + ceil(v42);
    }
    sub_235E61340();
    if (v46 != v23 || v43 != v25 || v44 != v27 || v45 != v28)
    {
      sub_235E6134C();
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
      sub_235E61400();
    }
    objc_msgSend(v13, sel_sizeToFit);
    v47 = objc_msgSend(v1, sel_traitCollection);
    v48 = objc_msgSend(v47, sel_layoutDirection);

    v49 = 0.0;
    if (v48 != (id)1)
    {
      objc_msgSend(v1, sel_bounds);
      v50 = CGRectGetWidth(v57);
      objc_msgSend(v13, sel_bounds);
      v49 = v50 - CGRectGetWidth(v58);
    }
    objc_msgSend(v1, sel_bounds);
    Height = CGRectGetHeight(v59);
    objc_msgSend(v13, sel_bounds);
    v52 = (Height - CGRectGetHeight(v60)) * 0.5;
    objc_msgSend(v13, sel_bounds);
    v53 = CGRectGetWidth(v61);
    objc_msgSend(v13, sel_bounds);
    objc_msgSend(v13, sel_setFrame_, v49, v52, v53, CGRectGetHeight(v62));

  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

double sub_235E42F70(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  double v8;
  uint64_t inited;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;

  v3 = v2;
  swift_bridgeObjectRetain();
  sub_235E61070();
  v4 = objc_msgSend(v2, sel_fontName);
  sub_235E6104C();

  sub_235E61070();
  swift_bridgeObjectRelease();
  sub_235E61070();
  objc_msgSend(v2, sel_pointSize);
  sub_235E61160();
  sub_235E61070();
  swift_bridgeObjectRelease();
  if (qword_2563854B0 != -1)
    swift_once();
  swift_beginAccess();
  v5 = qword_256387498;
  if (!*(_QWORD *)(qword_256387498 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain();
  v6 = sub_235E5D3E8(a1, a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563863B0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235E637D0;
    v10 = (void *)*MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
    *(_QWORD *)(inited + 64) = sub_235E26AC8(0, &qword_2563863B8);
    *(_QWORD *)(inited + 40) = v3;
    swift_bridgeObjectRetain();
    v11 = v10;
    v12 = v3;
    sub_235E492B0(inited);
    v13 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v14 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_235E436FC();
    v15 = (void *)sub_235E60FEC();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v13, sel_initWithString_attributes_, v14, v15);

    objc_msgSend(v16, sel_boundingRectWithSize_options_context_, 3, 0, 1.79769313e308, 1.79769313e308);
    v8 = v17;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = qword_256387498;
    qword_256387498 = 0x8000000000000000;
    sub_235E50A90(a1, a2, isUniquelyReferenced_nonNull_native, v8, v19, v21, v23);
    qword_256387498 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();

    return v8;
  }
  v8 = *(double *)(*(_QWORD *)(v5 + 56) + 32 * v6);
  swift_endAccess();
  swift_bridgeObjectRelease_n();
  return v8;
}

id sub_235E432B0(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  objc_super v19;

  v9 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView;
  v10 = *MEMORY[0x24BEBE1D8];
  v11 = v4;
  v12 = sub_235E2C364(v10);
  v13 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v12);

  v14 = (void *)sub_235E61028();
  v15 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v14, v13);

  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v15);
  *(_QWORD *)&v4[v9] = v16;
  v11[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron] = 0;
  v17 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_iconCache;
  *(_QWORD *)&v11[v17] = sub_235E493C8(MEMORY[0x24BEE4AF8]);

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for ConfigureButton();
  return objc_msgSendSuper2(&v19, sel_initWithFrame_, a1, a2, a3, a4);
}

id sub_235E43458(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v3 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_chevronView;
  v4 = *MEMORY[0x24BEBE1D8];
  v5 = v1;
  v6 = sub_235E2C364(v4);
  v7 = objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v6);

  v8 = (void *)sub_235E61028();
  v9 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v8, v7);

  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v9);
  *(_QWORD *)&v1[v3] = v10;
  v5[OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_hidesChevron] = 0;
  v11 = OBJC_IVAR____TtC27ActionButtonConfigurationUI15ConfigureButton_iconCache;
  *(_QWORD *)&v5[v11] = sub_235E493C8(MEMORY[0x24BEE4AF8]);

  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for ConfigureButton();
  v12 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);

  return v12;
}

uint64_t sub_235E435F0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease();
}

id sub_235E4361C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigureButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfigureButton()
{
  return objc_opt_self();
}

unint64_t sub_235E436A4()
{
  unint64_t result;

  result = sub_235E4918C(MEMORY[0x24BEE4AF8]);
  qword_256387498 = result;
  return result;
}

void sub_235E436C8(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

unint64_t sub_235E436FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563855A0;
  if (!qword_2563855A0)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x23B7E3CE0](&unk_235E62938, v1);
    atomic_store(result, (unint64_t *)&qword_2563855A0);
  }
  return result;
}

uint64_t sub_235E43744()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_235E43768()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_235E43784()
{
  return swift_deallocObject();
}

uint64_t sub_235E43794()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E437B8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E437DC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_235E43800(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_235E42158(a1, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), a2);
}

id sub_235E43810(void *a1)
{
  uint64_t v1;

  return sub_235E4230C(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

id sub_235E43820(char a1, char a2)
{
  double v2;
  double v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v2 = 0.6;
  if ((a1 & 1) == 0)
    v2 = 1.0;
  if ((a2 & 1) != 0)
    v3 = v2 * 0.5;
  else
    v3 = v2;
  v4 = objc_msgSend((id)objc_opt_self(), sel_systemGray5Color);
  v5 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithUserInterfaceStyle_, 1);
  v6 = objc_msgSend(v4, sel_resolvedColorWithTraitCollection_, v5);

  v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, v3);
  return v7;
}

uint64_t sub_235E43918()
{
  return 8;
}

uint64_t sub_235E43924()
{
  return swift_release();
}

uint64_t sub_235E4392C(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_235E43940(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_235E43958()
{
  return 8;
}

uint64_t sub_235E4397C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = a1;
  swift_retain();
  v3 = swift_release();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 408))(v3);
}

void sub_235E439CC(uint64_t a1, uint64_t a2, void *a3)
{
  sub_235E44DDC(a2, a3);
}

void sub_235E439D8(void *a1)
{
  char *v1;
  void *v2;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  v2 = v1;
  if (objc_msgSend(a1, sel_presentationStyle))
  {
    if (*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
    {
      swift_retain();
      sub_235E60B78();
      swift_release();
    }
    v4 = objc_msgSend(a1, sel_presentedViewController);
    v5 = objc_msgSend(v4, sel_transitionCoordinator);

    if (v5)
    {
      v6 = swift_allocObject();
      *(_QWORD *)(v6 + 16) = v2;
      v9[4] = sub_235E44EEC;
      v9[5] = v6;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 1107296256;
      v9[2] = sub_235E4498C;
      v9[3] = &block_descriptor_7;
      v7 = _Block_copy(v9);
      v8 = v2;
      swift_release();
      objc_msgSend(v5, sel_animateAlongsideTransition_completion_, 0, v7);
      _Block_release(v7);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_235E43B10()
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
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  id v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  id v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v52[4];
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386638);
  v2 = *(_QWORD *)(v1 - 8);
  v76 = v1;
  v77 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v75 = (char *)v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_235E61238();
  v5 = *(_QWORD *)(v4 - 8);
  v61 = v4;
  v62 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v60 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386640);
  v7 = MEMORY[0x24BDAC7A8](v70);
  v64 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v57 = (char *)v52 - v9;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386648);
  v69 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386650);
  v73 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v66 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386658);
  v72 = *(_QWORD *)(v74 - 8);
  v12 = MEMORY[0x24BDAC7A8](v74);
  v68 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v65 = (char *)v52 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386660);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v52[3] = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v52[1] = (char *)v52 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v52[2] = (char *)v52 - v21;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386668);
  v54 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v23 = (char *)v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386670);
  v58 = *(_QWORD *)(v59 - 8);
  v24 = MEMORY[0x24BDAC7A8](v59);
  v56 = (char *)v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = v0[3];
  v78 = (char *)v52 - v27;
  v79 = v26;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386678);
  sub_235E29CC0(&qword_256386680, &qword_256386678, MEMORY[0x24BDB9CB0]);
  sub_235E60C38();
  swift_release();
  v79 = v0[6];
  swift_retain();
  sub_235E60C38();
  swift_release();
  v28 = v0[9];
  v55 = v0;
  v79 = v28;
  swift_retain();
  sub_235E60C38();
  swift_release();
  v79 = v0[8];
  swift_retain();
  sub_235E60C38();
  swift_release();
  sub_235E29CC0(&qword_256386688, &qword_256386660, MEMORY[0x24BDB96C0]);
  sub_235E60B54();
  sub_235E29CC0(&qword_256386690, &qword_256386668, MEMORY[0x24BDB9848]);
  v29 = v78;
  v30 = v53;
  sub_235E60CC8();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v23, v30);
  v31 = (void *)objc_opt_self();
  v32 = objc_msgSend(v31, sel_defaultCenter);
  v33 = v60;
  sub_235E61244();

  sub_235E44FA0();
  v34 = v61;
  sub_235E60C38();
  v35 = *(void (**)(char *, uint64_t))(v62 + 8);
  v35(v33, v34);
  v36 = objc_msgSend(v31, sel_defaultCenter);
  sub_235E61244();

  sub_235E60C38();
  v35(v33, v34);
  sub_235E29CC0(&qword_2563866A0, &qword_256386640, MEMORY[0x24BDB96C0]);
  v37 = v63;
  sub_235E60B48();
  sub_235E29CC0(&qword_2563866A8, &qword_256386648, MEMORY[0x24BDB9798]);
  v39 = v66;
  v38 = v67;
  sub_235E60C8C();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v37, v38);
  sub_235E29CC0(&qword_2563866B0, &qword_256386650, MEMORY[0x24BDB9530]);
  v40 = v65;
  v41 = v71;
  sub_235E60CC8();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v39, v41);
  v42 = v58;
  v43 = v59;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v56, v29, v59);
  v44 = v72;
  v45 = v74;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v68, v40, v74);
  v46 = MEMORY[0x24BDB9658];
  sub_235E29CC0(&qword_2563866B8, &qword_256386670, MEMORY[0x24BDB9658]);
  sub_235E29CC0(&qword_2563866C0, &qword_256386658, v46);
  v47 = v75;
  sub_235E60B30();
  v48 = swift_allocObject();
  swift_weakInit();
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = sub_235E4500C;
  *(_QWORD *)(v49 + 24) = v48;
  sub_235E29CC0(&qword_2563866C8, &qword_256386638, MEMORY[0x24BDB9450]);
  v50 = v76;
  sub_235E60CF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v47, v50);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v45);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v78, v43);
}

void sub_235E44404(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_235E4440C(char a1, char a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(result + 16) + 16) = a1 & a2 & 1;
    swift_retain();
    swift_retain();
    sub_235E60B90();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t ScreenViewModel.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ScreenViewModel.__deallocating_deinit()
{
  ScreenViewModel.deinit();
  return swift_deallocClassInstance();
}

_QWORD *sub_235E44530()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256385AF0);
  v1 = swift_allocObject();
  *(_BYTE *)(v1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385AB8);
  swift_allocObject();
  *(_QWORD *)(v1 + 24) = sub_235E60B9C();
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386678);
  swift_allocObject();
  v0[3] = sub_235E60B84();
  swift_allocObject();
  v0[4] = sub_235E60B84();
  swift_allocObject();
  v0[5] = sub_235E60B84();
  swift_allocObject();
  v0[6] = sub_235E60B84();
  swift_allocObject();
  v0[7] = sub_235E60B84();
  swift_allocObject();
  v0[8] = sub_235E60B84();
  swift_allocObject();
  v0[9] = sub_235E60B84();
  swift_allocObject();
  v2 = sub_235E60B84();
  v3 = MEMORY[0x24BEE4B08];
  v0[10] = v2;
  v0[11] = v3;
  return v0;
}

id sub_235E446A4(char a1)
{
  char *v1;
  id result;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  result = objc_msgSendSuper2(&v4, sel_viewIsAppearing_, a1 & 1);
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_235E60B78();
    return (id)swift_release();
  }
  return result;
}

id sub_235E4474C(char a1)
{
  char *v1;
  id result;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  result = objc_msgSendSuper2(&v4, sel_viewDidAppear_, a1 & 1);
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_235E60B78();
    return (id)swift_release();
  }
  return result;
}

id sub_235E447F4(char a1)
{
  char *v1;
  id result;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  result = objc_msgSendSuper2(&v4, sel_viewWillDisappear_, a1 & 1);
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_235E60B78();
    return (id)swift_release();
  }
  return result;
}

id sub_235E4489C(char a1)
{
  char *v1;
  id result;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  result = objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1 & 1);
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
  {
    swift_retain();
    sub_235E60B78();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_235E44944(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)(a2 + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel))
  {
    swift_retain();
    sub_235E60B78();
    return swift_release();
  }
  return result;
}

uint64_t sub_235E4498C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_235E44A44(void *a1, uint64_t a2)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(a1, sel_isCancelled);
  v4 = *(_QWORD *)(a2 + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel);
  if ((_DWORD)result)
  {
    if (!v4)
      return result;
  }
  else if (!v4)
  {
    return result;
  }
  swift_retain();
  sub_235E60B78();
  return (id)swift_release();
}

id ScreenViewModelTrackingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id ScreenViewModelTrackingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel] = 0;
  if (a2)
  {
    v5 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

id ScreenViewModelTrackingViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ScreenViewModelTrackingViewController.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ScreenViewModelTrackingViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_235E44DDC(uint64_t a1, void *a2)
{
  char *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  if (a1)
  {
    v3 = v2;
    if (*(_QWORD *)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel])
    {
      swift_retain();
      sub_235E60B78();
      swift_release();
    }
    if (a2)
    {
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v2;
      v8[4] = sub_235E45064;
      v8[5] = v5;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 1107296256;
      v8[2] = sub_235E4498C;
      v8[3] = &block_descriptor_13;
      v6 = _Block_copy(v8);
      v7 = v3;
      swift_release();
      objc_msgSend(a2, sel_animateAlongsideTransition_completion_, 0, v6);
      _Block_release(v6);
    }
  }
}

uint64_t sub_235E44EC8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_235E44EEC(void *a1)
{
  uint64_t v1;

  return sub_235E44A44(a1, *(_QWORD *)(v1 + 16));
}

uint64_t type metadata accessor for ScreenViewModelTrackingViewController()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ScreenViewModel()
{
  return objc_opt_self();
}

uint64_t method lookup function for ScreenViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for ScreenViewModelTrackingViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScreenViewModelTrackingViewController.bind(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ScreenViewModelTrackingViewController.presentationController(_:willPresentWithAdaptiveStyle:transitionCoordinator:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ScreenViewModelTrackingViewController.presentationControllerWillDismiss(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

unint64_t sub_235E44FA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256386698;
  if (!qword_256386698)
  {
    v1 = sub_235E61238();
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BDD0070], v1);
    atomic_store(result, (unint64_t *)&qword_256386698);
  }
  return result;
}

uint64_t sub_235E44FE8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E4500C(char a1, char a2)
{
  return sub_235E4440C(a1, a2);
}

uint64_t sub_235E45014()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E45038(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_235E45064(uint64_t a1)
{
  uint64_t v1;

  return sub_235E44944(a1, *(_QWORD *)(v1 + 16));
}

void *sub_235E45078(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for MenuButton();
  v5 = objc_msgSendSuper2(&v10, sel__contextMenuInteraction_styleForMenuWithConfiguration_, a1, a2);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, sel_setPreferredEdgeInsets_, 0.0, 0.0, 140.0, 0.0);
    objc_msgSend(v6, sel_setPreferredAttachmentEdge_, 0);
    v7 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v8 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.35);

    objc_msgSend(v6, sel_setPreferredBackgroundColor_, v8);
  }
  return v6;
}

id sub_235E4528C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MenuButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MenuButton()
{
  return objc_opt_self();
}

uint64_t sub_235E452DC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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

  v0 = sub_235E611F0();
  v11 = *(_QWORD *)(v0 - 8);
  v12 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_235E611B4();
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_235E60FBC();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_235E60FA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E45A0C();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5490], v5);
  sub_235E61214();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_235E60FB0();
  v13 = MEMORY[0x24BEE4AF8];
  sub_235E45A48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386708);
  sub_235E45A90();
  sub_235E61460();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v2, *MEMORY[0x24BEE5750], v12);
  result = sub_235E61208();
  qword_2563866F8 = result;
  return result;
}

uint64_t sub_235E454E4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
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
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - v8;
  v10 = sub_235E60A10();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E4569C(a1, (uint64_t)v7);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v14(v7, 1, v10) == 1)
  {
    sub_235E458E8((uint64_t)v9);
    sub_235E459CC((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v9, v7, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  if (v14(v9, 1, v10) == 1)
  {
    sub_235E459CC((uint64_t)v9);
    v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_235E60A04();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a2, v15, 1, v10);
}

uint64_t sub_235E4569C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E456E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t (*v15)(char *, uint64_t);
  id v16;
  id v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235E60A10();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E454E4(a3, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_235E459CC((uint64_t)v6);
    sub_235E45ADC();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v12 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v13 = (void *)sub_235E609F8();
    v18[0] = 0;
    v14 = objc_msgSend(v12, sel_removeItemAtURL_error_, v13, v18);

    if ((v14 & 1) != 0)
    {
      v15 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
      v16 = v18[0];
      return v15(v10, v7);
    }
    else
    {
      v17 = v18[0];
      sub_235E609D4();

      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
}

uint64_t sub_235E458E8@<X0>(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v3 = 1;
  v4 = objc_msgSend(v2, sel_URLsForDirectory_inDomains_, 9, 1);

  v5 = sub_235E60A10();
  v6 = sub_235E610AC();

  v7 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 16))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16))(a1, v6 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v5);
    v3 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, v3, 1, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E459CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_235E45A0C()
{
  unint64_t result;

  result = qword_2563859F0;
  if (!qword_2563859F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2563859F0);
  }
  return result;
}

unint64_t sub_235E45A48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256386700;
  if (!qword_256386700)
  {
    v1 = sub_235E611B4();
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_256386700);
  }
  return result;
}

unint64_t sub_235E45A90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256386710;
  if (!qword_256386710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256386708);
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256386710);
  }
  return result;
}

unint64_t sub_235E45ADC()
{
  unint64_t result;

  result = qword_256386718;
  if (!qword_256386718)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63A60, &type metadata for Persistence.Errors);
    atomic_store(result, (unint64_t *)&qword_256386718);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Persistence.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235E45B60 + 4 * asc_235E639C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235E45B80 + 4 * byte_235E639C5[v4]))();
}

_BYTE *sub_235E45B60(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235E45B80(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E45B88(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E45B90(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E45B98(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E45BA0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Persistence.Errors()
{
  return &type metadata for Persistence.Errors;
}

unint64_t sub_235E45BC0()
{
  unint64_t result;

  result = qword_256386720;
  if (!qword_256386720)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63A38, &type metadata for Persistence.Errors);
    atomic_store(result, (unint64_t *)&qword_256386720);
  }
  return result;
}

void sub_235E45C04()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_235E61028();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_256386728 = (uint64_t)v2;
}

uint64_t sub_235E45C70()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386A08);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386A10);
  sub_235E29CC0(&qword_256386A18, &qword_256386A10, MEMORY[0x24BDB9AF8]);
  sub_235E60BF0();
  sub_235E29CC0(&qword_256386A20, &qword_256386A08, MEMORY[0x24BDB9E90]);
  v6 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_235E45D8C@<X0>(uint64_t *a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  char v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  char v63;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386A28);
  v60 = *(_QWORD *)(v2 - 8);
  v61 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386A30);
  v57 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386A38);
  v58 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386828);
  MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386A40);
  v51 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v50 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386A48);
  v55 = *(_QWORD *)(v14 - 8);
  v56 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v54 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2563854D0 != -1)
    swift_once();
  v16 = sub_235E60AA0();
  __swift_project_value_buffer(v16, (uint64_t)qword_256386DC8);
  v17 = sub_235E60A88();
  v18 = sub_235E6119C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_235E24000, v17, v18, "Loading action data...", v19, 2u);
    MEMORY[0x23B7E3DAC](v19, -1, -1);
  }

  if (qword_2563854C0 != -1)
    swift_once();
  if (qword_256386728)
  {
    v49 = v8;
    v59 = a1;
    v20 = (id)qword_256386728;
    v21 = sub_235E5AD78(v20);
    v36 = v22;
    v37 = v20;
    if (v22 == -1)
    {
      v41 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256386A58);
      swift_allocObject();
      v62 = (id)sub_235E60BE4();
      sub_235E29CC0(&qword_256386A60, &qword_256386A58, MEMORY[0x24BDB9E58]);
      v42 = (void *)sub_235E60BFC();

      swift_release();
      v62 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256386A68);
      sub_235E29CC0(&qword_256386A70, &qword_256386A68, MEMORY[0x24BDB9AF8]);
      v43 = v50;
      sub_235E60C38();
      swift_release();
      sub_235E26AC8(0, (unint64_t *)&qword_2563859F0);
      v62 = (id)sub_235E611FC();
      v44 = sub_235E611CC();
      v45 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v52, 1, 1, v44);
      sub_235E29CC0(&qword_256386A78, &qword_256386A40, MEMORY[0x24BDB96C0]);
      sub_235E48C20((unint64_t *)&qword_2563868A8, (unint64_t *)&qword_2563859F0, 0x24BDAC4D0, MEMORY[0x24BEE5670]);
      v46 = v53;
      v47 = v54;
      sub_235E60C98();
      sub_235E47D24(v45);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v43, v46);
      sub_235E29CC0(&qword_256386A80, &qword_256386A48, MEMORY[0x24BDB9A08]);
      v48 = v56;
      v34 = sub_235E60BFC();

      result = (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v47, v48);
    }
    else
    {
      v38 = v21;
      v62 = v21;
      v63 = v22 & 1;
      v39 = v21;
      sub_235E60BCC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
      sub_235E60BC0();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v7, v5);
      sub_235E29CC0(&qword_256386A88, &qword_256386A38, MEMORY[0x24BDBA1D0]);
      v40 = v49;
      v34 = sub_235E60BFC();

      sub_235E48C9C(v38, v36);
      result = (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v10, v40);
    }
    a1 = v59;
  }
  else
  {
    sub_235E48BDC();
    v23 = (void *)swift_allocError();
    swift_willThrow();
    v24 = v23;
    v25 = v23;
    v26 = sub_235E60A88();
    v27 = sub_235E6119C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v28 = 138412290;
      v30 = v23;
      v31 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v62 = v31;
      sub_235E61430();
      *v29 = v31;

      _os_log_impl(&dword_235E24000, v26, v27, "Failed to load action data: %@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v29, -1, -1);
      MEMORY[0x23B7E3DAC](v28, -1, -1);
    }
    else
    {

    }
    v62 = v23;
    v32 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
    sub_235E60BA8();
    sub_235E29CC0(&qword_256386A50, &qword_256386A28, MEMORY[0x24BDB9DB0]);
    v33 = v61;
    v34 = sub_235E60BFC();

    result = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v4, v33);
  }
  *a1 = v34;
  return result;
}

id sub_235E46528@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = 0;
  return v2;
}

BOOL sub_235E46538(_QWORD *a1)
{
  uint64_t v1;

  if (*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v1 != 0;
}

BOOL sub_235E46598(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 16) != 0;
}

uint64_t sub_235E465AC()
{
  void *v0;
  void *v1;
  uint64_t inited;
  __CFString *v3;
  __CFString *v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563867D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235E63AB0;
  *(_QWORD *)(inited + 32) = CFSTR("Focus");
  *(_QWORD *)(inited + 40) = 0xD000000000000031;
  *(_QWORD *)(inited + 48) = 0x8000000235E65CD0;
  *(_QWORD *)(inited + 56) = CFSTR("Camera");
  *(_QWORD *)(inited + 64) = 0x746F685072616572;
  *(_QWORD *)(inited + 72) = 0xE90000000000006FLL;
  v3 = CFSTR("Focus");
  v4 = CFSTR("Camera");
  v5 = sub_235E2A060(inited);
  v6 = objc_msgSend(v1, sel_sectionIdentifier);
  v7 = v6;
  if (*(_QWORD *)(v5 + 16) && (v8 = sub_235E2A174((uint64_t)v6), (v9 & 1) != 0))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 16 * v8);
    swift_bridgeObjectRetain();
  }
  else
  {
    v10 = 0;
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_235E466C0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_235E466EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  BOOL v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  int64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;

  v3 = a3;
  v38 = a3 + 64;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 64);
  v39 = (unint64_t)(v6 + 63) >> 6;
  result = (id)swift_bridgeObjectRetain();
  v10 = 0;
  v44 = v3;
  if (!v8)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    v40 = v10;
    v16 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * i);
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v17 = sub_235E61610();
      result = (id)swift_bridgeObjectRelease();
      if (v17)
      {
LABEL_21:
        v18 = 0;
        v19 = v16 & 0xC000000000000001;
        v36 = v16 + 32;
        v37 = v16 & 0xFFFFFFFFFFFFFF8;
        v42 = v17;
        v43 = v8;
        v45 = v16;
        v41 = v16 & 0xC000000000000001;
        while (1)
        {
          if (v19)
          {
            result = (id)MEMORY[0x23B7E35E4](v18, v16);
          }
          else
          {
            if (v18 >= *(_QWORD *)(v37 + 16))
              goto LABEL_54;
            result = *(id *)(v36 + 8 * v18);
          }
          v20 = result;
          v21 = __OFADD__(v18, 1);
          v22 = v18 + 1;
          if (v21)
            break;
          v23 = objc_msgSend(result, sel_values);
          sub_235E26AC8(0, (unint64_t *)&qword_256385650);
          v24 = sub_235E610AC();

          v46 = v22;
          v47 = v20;
          if (v24 >> 62)
          {
            swift_bridgeObjectRetain();
            v25 = sub_235E61610();
            swift_bridgeObjectRelease();
            if (v25)
            {
LABEL_30:
              v26 = 4;
              while (1)
              {
                result = (v24 & 0xC000000000000001) != 0
                       ? (id)MEMORY[0x23B7E35E4](v26 - 4, v24)
                       : *(id *)(v24 + 8 * v26);
                v27 = result;
                v28 = v26 - 3;
                if (__OFADD__(v26 - 4, 1))
                  break;
                v29 = a2;
                v30 = objc_msgSend(result, sel_identifier);
                v31 = sub_235E6104C();
                v33 = v32;

                a2 = v29;
                if (v31 == a1 && v33 == v29)
                {
                  swift_bridgeObjectRelease();

                  swift_bridgeObjectRelease();
LABEL_49:
                  swift_release();
                  swift_bridgeObjectRelease();
                  return v27;
                }
                v35 = sub_235E616D0();
                swift_bridgeObjectRelease();
                if ((v35 & 1) != 0)
                {
                  swift_bridgeObjectRelease();

                  goto LABEL_49;
                }

                ++v26;
                if (v28 == v25)
                  goto LABEL_22;
              }
              __break(1u);
              break;
            }
          }
          else
          {
            v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v25)
              goto LABEL_30;
          }
LABEL_22:

          result = (id)swift_bridgeObjectRelease();
          v8 = v43;
          v16 = v45;
          v18 = v46;
          v19 = v41;
          if (v46 == v42)
            goto LABEL_45;
        }
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        return result;
      }
    }
    else
    {
      v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = (id)swift_bridgeObjectRetain();
      if (v17)
        goto LABEL_21;
    }
LABEL_45:
    result = (id)swift_bridgeObjectRelease();
    v3 = v44;
    v10 = v40;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_55;
    if (v13 >= v39)
      goto LABEL_51;
    v14 = *(_QWORD *)(v38 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v39)
        goto LABEL_51;
      v14 = *(_QWORD *)(v38 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v39)
          goto LABEL_51;
        v14 = *(_QWORD *)(v38 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v8 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 < v39)
  {
    v14 = *(_QWORD *)(v38 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        v10 = v15 + 1;
        if (__OFADD__(v15, 1))
          goto LABEL_56;
        if (v10 >= v39)
          goto LABEL_51;
        v14 = *(_QWORD *)(v38 + 8 * v10);
        ++v15;
        if (v14)
          goto LABEL_18;
      }
    }
    v10 = v15;
    goto LABEL_18;
  }
LABEL_51:
  swift_release();
  return 0;
}

void sub_235E46AF4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_235E614A8();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_235E46E08(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v27 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(a1 + 56);
  sub_235E26AC8(0, &qword_2563869F0);
  v11 = 0;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v12 = a2 + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_39;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v28)
        return;
      v16 = *(_QWORD *)(v27 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v28)
          return;
        v16 = *(_QWORD *)(v27 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v28)
            return;
          v16 = *(_QWORD *)(v27 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_38:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_39:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v19 = sub_235E612BC();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_46;
    v29 = v11;
    v22 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
    v23 = sub_235E612C8();

    if ((v23 & 1) == 0)
    {
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
        v26 = sub_235E612C8();

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
LABEL_46:

      return;
    }
LABEL_20:

    v11 = v29;
  }
  v17 = v15 + 4;
  if (v17 >= v28)
    return;
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_38;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_38;
  }
LABEL_49:
  __break(1u);
}

void sub_235E46E08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_235E61490())
    return;
  v4 = 0;
  v5 = a2 + 56;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_6:
    v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v11);
    v13 = sub_235E614C0();

    if ((v13 & 1) == 0)
      return;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v4;
  if (v15)
    goto LABEL_19;
  v4 = v14 + 1;
  if (v14 + 1 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  v16 = v14 + 2;
  if (v16 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      return;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_235E46F58(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

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
    v9 = sub_235E6149C();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_235E26AC8(0, &qword_2563869F0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_235E61490();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_235E471F4(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_235E473E8();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_235E47684((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_235E612BC();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_235E26AC8(0, &qword_2563869F0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_235E612C8();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_235E612C8();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_235E47704((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_235E471F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386A00);
    v2 = sub_235E614E4();
    v14 = v2;
    sub_235E61484();
    if (sub_235E614B4())
    {
      sub_235E26AC8(0, &qword_2563869F0);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_235E473E8();
          v2 = v14;
        }
        result = sub_235E612BC();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_235E614B4());
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

uint64_t sub_235E473E8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386A00);
  v3 = sub_235E614D8();
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
      result = sub_235E612BC();
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

unint64_t sub_235E47684(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_235E612BC();
  result = sub_235E61478();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_235E47704(uint64_t a1, unint64_t a2, char a3)
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
    sub_235E473E8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_235E47888();
      goto LABEL_14;
    }
    sub_235E47A30();
  }
  v8 = *v3;
  v9 = sub_235E612BC();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_235E26AC8(0, &qword_2563869F0);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_235E612C8();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_235E616F4();
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
        v15 = sub_235E612C8();

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

id sub_235E47888()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386A00);
  v2 = *v0;
  v3 = sub_235E614CC();
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

uint64_t sub_235E47A30()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386A00);
  v3 = sub_235E614D8();
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
    result = sub_235E612BC();
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

uint64_t sub_235E47CA8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235E47CDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_235E47D00()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235E47D24(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386828);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235E47D64()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E47D88()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_235E47DB4(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  id v5;

  if (qword_2563854C0 != -1)
    swift_once();
  if (qword_256386728)
  {
    v3 = (id)qword_256386728;
    sub_235E5A5B4(v3, a1, 1);

    if (!v1)
    {
      v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC13B0]), sel_init);
      if (qword_256386728)
      {
        v5 = (id)qword_256386728;
        sub_235E5A5B4(v5, v4, 0);

      }
      else
      {
        sub_235E48BDC();
        swift_allocError();
        swift_willThrow();

      }
    }
  }
  else
  {
    sub_235E48BDC();
    swift_allocError();
    swift_willThrow();
  }
}

uint64_t sub_235E47EDC(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v2)
      break;
    v7 = MEMORY[0x24BEE4AF8];
    result = sub_235E61544();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x23B7E35E4](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      sub_235E27C54(v5, 1);

      sub_235E6152C();
      sub_235E61550();
      sub_235E6155C();
      sub_235E61538();
      if (v2 == v4)
        return v7;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235E48018(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_235E61610();
    swift_bridgeObjectRelease();
  }
  sub_235E26AC8(0, &qword_2563869F0);
  sub_235E48C20(&qword_2563869F8, &qword_2563869F0, 0x24BEC15E0, MEMORY[0x24BEE5BD8]);
  result = sub_235E6116C();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_235E61610();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x23B7E35E4](i, a1);
        sub_235E46F58(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_235E46F58(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E48198(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return swift_task_switch();
}

uint64_t sub_235E481B0()
{
  char *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  int64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char isUniquelyReferenced_nonNull_native;
  char v50;
  unint64_t v51;
  uint64_t v52;
  _BOOL8 v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t *v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v64;
  id v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  id *v70;
  uint64_t *v71;
  id *v72;
  int64_t v73;
  os_log_type_t typea;
  os_log_type_t type[8];
  char *v76;
  NSObject *loga;
  os_log_t log;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;

  if (qword_2563854D0 != -1)
LABEL_51:
    swift_once();
  v1 = (void *)*((_QWORD *)v0 + 9);
  v2 = sub_235E60AA0();
  *((_QWORD *)v0 + 11) = __swift_project_value_buffer(v2, (uint64_t)qword_256386DC8);
  v3 = v1;
  swift_bridgeObjectRetain_n();
  v4 = v3;
  v5 = sub_235E60A88();
  v6 = sub_235E6119C();
  v7 = os_log_type_enabled(v5, v6);
  v8 = (void *)*((_QWORD *)v0 + 9);
  v76 = v0;
  if (v7)
  {
    loga = v5;
    v9 = v0 + 56;
    v10 = (uint64_t *)(v0 + 64);
    typea = v6;
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v79 = swift_slowAlloc();
    v81 = (_QWORD *)v79;
    *(_DWORD *)v11 = 138412546;
    *v9 = v8;
    v13 = v8;
    sub_235E61430();
    *v12 = v8;
    v14 = v12;

    *(_WORD *)(v11 + 12) = 2080;
    sub_235E26AC8(0, &qword_2563867F0);
    sub_235E26AC8(0, (unint64_t *)&qword_256385650);
    sub_235E48C20(&qword_2563868E8, &qword_2563867F0, 0x24BEC15E8, MEMORY[0x24BEE5BD8]);
    swift_bridgeObjectRetain();
    v0 = v76;
    v15 = sub_235E61004();
    v17 = v16;
    swift_bridgeObjectRelease();
    *v10 = sub_235E2AEC4(v15, v17, (uint64_t *)&v81);
    sub_235E61430();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v5 = loga;
    _os_log_impl(&dword_235E24000, loga, typea, "Configuring %@ with %s...", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v79, -1, -1);
    MEMORY[0x23B7E3DAC](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  v18 = *((_QWORD *)v0 + 10);
  v19 = (_QWORD *)sub_235E493D4(MEMORY[0x24BEE4AF8]);
  v20 = *((_QWORD *)v0 + 10);
  if ((v18 & 0xC000000000000001) != 0)
  {
    v21 = sub_235E61574();
    *(_QWORD *)type = 0;
    v22 = 0;
    v23 = 0;
    v18 = v21 | 0x8000000000000000;
  }
  else
  {
    *(_QWORD *)type = v20 + 64;
    v24 = -1 << *(_BYTE *)(v20 + 32);
    v22 = ~v24;
    v25 = -v24;
    if (v25 < 64)
      v26 = ~(-1 << v25);
    else
      v26 = -1;
    v23 = v26 & *(_QWORD *)(v20 + 64);
  }
  v71 = (uint64_t *)(v0 + 32);
  v72 = (id *)(v0 + 24);
  v69 = v0 + 48;
  v70 = (id *)(v0 + 40);
  v68 = v22;
  v73 = (unint64_t)(v22 + 64) >> 6;
  swift_bridgeObjectRetain();
  v27 = 0;
  for (log = (os_log_t)v18; ; v18 = (unint64_t)log)
  {
    *((_QWORD *)v0 + 12) = v19;
    v80 = (uint64_t)v19;
    if ((v18 & 0x8000000000000000) == 0)
      break;
    v33 = sub_235E615D4();
    if (!v33)
      goto LABEL_47;
    v35 = v34;
    *v71 = v33;
    sub_235E26AC8(0, &qword_2563867F0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v36 = *v72;
    swift_unknownObjectRelease();
    *v69 = v35;
    sub_235E26AC8(0, (unint64_t *)&qword_256385650);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v37 = *v70;
    swift_unknownObjectRelease();
    v32 = v27;
    v30 = v23;
    if (!v36)
      goto LABEL_47;
LABEL_35:
    v0 = v32;
    v43 = v36;
    v44 = objc_msgSend(v36, sel_key, v68);
    v45 = sub_235E6104C();
    v47 = v46;

    v48 = v37;
    v19 = (_QWORD *)v80;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v81 = (_QWORD *)v80;
    v51 = sub_235E5D3E8(v45, v47);
    v52 = *(_QWORD *)(v80 + 16);
    v53 = (v50 & 1) == 0;
    v54 = v52 + v53;
    if (__OFADD__(v52, v53))
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    v55 = v50;
    if (*(_QWORD *)(v80 + 24) >= v54)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v50 & 1) != 0)
          goto LABEL_12;
      }
      else
      {
        sub_235E51224();
        v19 = v81;
        if ((v55 & 1) != 0)
          goto LABEL_12;
      }
    }
    else
    {
      sub_235E501AC(v54, isUniquelyReferenced_nonNull_native);
      v56 = (uint64_t)v81;
      v57 = sub_235E5D3E8(v45, v47);
      if ((v55 & 1) != (v58 & 1))
        return sub_235E61700();
      v51 = v57;
      v19 = (_QWORD *)v56;
      if ((v55 & 1) != 0)
      {
LABEL_12:
        v28 = v19;
        v29 = v19[7];

        *(_QWORD *)(v29 + 8 * v51) = v48;
        v19 = v28;
        goto LABEL_13;
      }
    }
    v19[(v51 >> 6) + 8] |= 1 << v51;
    v59 = (uint64_t *)(v19[6] + 16 * v51);
    *v59 = v45;
    v59[1] = v47;
    *(_QWORD *)(v19[7] + 8 * v51) = v48;
    v60 = v19[2];
    v61 = __OFADD__(v60, 1);
    v62 = v60 + 1;
    if (v61)
      goto LABEL_49;
    v19[2] = v62;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v27 = v0;
    v23 = v30;
    v0 = v76;
  }
  if (v23)
  {
    v30 = (v23 - 1) & v23;
    v31 = __clz(__rbit64(v23)) | ((_QWORD)v27 << 6);
    v32 = v27;
    goto LABEL_34;
  }
  v38 = (int64_t)(v27 + 1);
  if (__OFADD__(v27, 1))
    goto LABEL_50;
  if (v38 >= v73)
    goto LABEL_47;
  v39 = *(_QWORD *)(*(_QWORD *)type + 8 * v38);
  v32 = v27 + 1;
  if (v39)
    goto LABEL_33;
  v32 = v27 + 2;
  if ((uint64_t)(v27 + 2) >= v73)
    goto LABEL_47;
  v39 = *(_QWORD *)(*(_QWORD *)type + 8 * (_QWORD)v32);
  if (v39)
    goto LABEL_33;
  v32 = v27 + 3;
  if ((uint64_t)(v27 + 3) >= v73)
    goto LABEL_47;
  v39 = *(_QWORD *)(*(_QWORD *)type + 8 * (_QWORD)v32);
  if (v39)
    goto LABEL_33;
  v32 = v27 + 4;
  if ((uint64_t)(v27 + 4) >= v73)
    goto LABEL_47;
  v39 = *(_QWORD *)(*(_QWORD *)type + 8 * (_QWORD)v32);
  if (v39)
  {
LABEL_33:
    v30 = (v39 - 1) & v39;
    v31 = __clz(__rbit64(v39)) + ((_QWORD)v32 << 6);
LABEL_34:
    v41 = 8 * v31;
    v42 = *(void **)(*(_QWORD *)(v18 + 56) + v41);
    v36 = *(id *)(*(_QWORD *)(v18 + 48) + v41);
    v37 = v42;
    if (!v36)
      goto LABEL_47;
    goto LABEL_35;
  }
  v40 = v27 + 5;
  while ((char *)v73 != v40)
  {
    v39 = *(_QWORD *)(*(_QWORD *)type + 8 * (_QWORD)v40++);
    if (v39)
    {
      v32 = v40 - 1;
      goto LABEL_33;
    }
  }
LABEL_47:
  v64 = *((_QWORD *)v0 + 9);
  sub_235E48BC8();
  v65 = objc_msgSend((id)objc_opt_self(), sel_standardClient);
  *((_QWORD *)v0 + 13) = v65;
  v66 = (_QWORD *)swift_task_alloc();
  *((_QWORD *)v0 + 14) = v66;
  v66[2] = v65;
  v66[3] = v64;
  v66[4] = v80;
  v67 = (_QWORD *)swift_task_alloc();
  *((_QWORD *)v0 + 15) = v67;
  sub_235E26AC8(0, &qword_2563868D8);
  *v67 = v0;
  v67[1] = sub_235E489BC;
  return sub_235E616E8();
}

uint64_t sub_235E489BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_235E48A28()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  id v8;

  v1 = (void *)v0[13];
  swift_bridgeObjectRelease();

  v2 = (void *)v0[2];
  v3 = sub_235E60A88();
  v4 = sub_235E6119C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_235E24000, v3, v4, "Successfully configured template action", v5, 2u);
    MEMORY[0x23B7E3DAC](v5, -1, -1);
  }

  if ((sub_235E61154() & 1) == 0)
  {
    if (qword_2563854C0 != -1)
      swift_once();
    if (qword_256386728)
    {
      v7 = v0[16];
      v8 = (id)qword_256386728;
      sub_235E5A5B4(v8, v2, 0);

      if (!v7)
        goto LABEL_5;
    }
    else
    {
      sub_235E48BDC();
      swift_allocError();
      swift_willThrow();

    }
    v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }

LABEL_5:
  v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_235E48B84()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 104);
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235E48BC8()
{
  return swift_release();
}

void sub_235E48BD0(uint64_t a1)
{
  uint64_t v1;

  sub_235E2D1BC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_235E48BDC()
{
  unint64_t result;

  result = qword_2563868E0;
  if (!qword_2563868E0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63B6C, &type metadata for StaccatoStorage.Errors);
    atomic_store(result, (unint64_t *)&qword_2563868E0);
  }
  return result;
}

uint64_t sub_235E48C20(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_235E26AC8(255, a2);
    result = MEMORY[0x23B7E3CE0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235E48C60()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E48C84()
{
  return swift_deallocObject();
}

uint64_t sub_235E48C94@<X0>(uint64_t *a1@<X8>)
{
  return sub_235E45D8C(a1);
}

void sub_235E48C9C(id a1, char a2)
{
  if (a2 != -1)

}

uint64_t storeEnumTagSinglePayload for StaccatoStorage.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235E48CF0 + 4 * byte_235E63AC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235E48D10 + 4 * byte_235E63AC5[v4]))();
}

_BYTE *sub_235E48CF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235E48D10(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E48D18(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E48D20(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E48D28(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E48D30(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StaccatoStorage.Errors()
{
  return &type metadata for StaccatoStorage.Errors;
}

unint64_t sub_235E48D50()
{
  unint64_t result;

  result = qword_256386A90;
  if (!qword_256386A90)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63B44, &type metadata for StaccatoStorage.Errors);
    atomic_store(result, (unint64_t *)&qword_256386A90);
  }
  return result;
}

uint64_t sub_235E48D9C(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_11;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_235E61610())
  {
    for (i = 4; ; ++i)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B7E35E4](i - 4, a1) : *(id *)(a1 + 8 * i);
      v5 = v4;
      v6 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v7 = objc_msgSend(v4, sel_values);
      sub_235E26AC8(0, (unint64_t *)&qword_256385650);
      v8 = sub_235E610AC();

      sub_235E295C8(v8, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_235E29790);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_235E48F04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  v1 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5)
      goto LABEL_23;
    v10 = *(_QWORD *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      v7 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_23;
      v10 = *(_QWORD *)(v1 + 8 * v7);
      if (!v10)
      {
        v7 = v9 + 2;
        if (v9 + 2 >= v5)
          goto LABEL_23;
        v10 = *(_QWORD *)(v1 + 8 * v7);
        if (!v10)
        {
          v7 = v9 + 3;
          if (v9 + 3 >= v5)
            goto LABEL_23;
          v10 = *(_QWORD *)(v1 + 8 * v7);
          if (!v10)
            break;
        }
      }
    }
LABEL_22:
    v4 = (v10 - 1) & v10;
LABEL_5:
    v8 = swift_bridgeObjectRetain();
    result = sub_235E295C8(v8, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_235E524EC);
  }
  v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return v12;
  }
  v10 = *(_QWORD *)(v1 + 8 * v11);
  if (v10)
  {
    v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v7 >= v5)
      goto LABEL_23;
    v10 = *(_QWORD *)(v1 + 8 * v7);
    ++v11;
    if (v10)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_235E49084(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C18);
  v2 = (_QWORD *)sub_235E61634();
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
    swift_retain();
    result = sub_235E2A174((uint64_t)v6);
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

unint64_t sub_235E4918C(uint64_t a1)
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
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C90);
  v2 = (_QWORD *)sub_235E61634();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 72);
  while (1)
  {
    v5 = *(v4 - 5);
    v6 = *(v4 - 4);
    v7 = *(v4 - 3);
    v8 = *(v4 - 2);
    v9 = *(v4 - 1);
    v10 = *v4;
    swift_bridgeObjectRetain();
    result = sub_235E5D3E8(v5, v6);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v2[6] + 16 * result);
    *v13 = v5;
    v13[1] = v6;
    v14 = (_QWORD *)(v2[7] + 32 * result);
    *v14 = v7;
    v14[1] = v8;
    v14[2] = v9;
    v14[3] = v10;
    v15 = v2[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v2[2] = v17;
    v4 += 6;
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

unint64_t sub_235E492B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C98);
  v2 = sub_235E61634();
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
    sub_235E52D98(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_235E2A174(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_235E52DE0(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_235E493C8(uint64_t a1)
{
  return sub_235E493E0(a1, &qword_256386CA8);
}

unint64_t sub_235E493D4(uint64_t a1)
{
  return sub_235E493E0(a1, &qword_256386C78);
}

unint64_t sub_235E493E0(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_235E61634();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_235E5D3E8(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
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

unint64_t sub_235E494F4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386B98);
  v2 = (_QWORD *)sub_235E61634();
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
    result = sub_235E274BC((uint64_t)v6);
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

BOOL sub_235E495FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_235E49614()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386828);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_235E611E4();
  v42 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235E61238();
  v39 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386CF8);
  v9 = *(_QWORD *)(v8 - 8);
  v40 = v8;
  v41 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D00);
  v45 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D08);
  v15 = *(_QWORD *)(v14 - 8);
  v47 = v14;
  v48 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D10);
  v19 = *(_QWORD *)(v18 - 8);
  v49 = v18;
  v50 = v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D18);
  v23 = *(_QWORD *)(v22 - 8);
  v51 = v22;
  v52 = v23;
  MEMORY[0x24BDAC7A8](v22);
  v46 = (char *)&v39 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_235E61244();

  sub_235E611D8();
  sub_235E26AC8(0, (unint64_t *)&qword_2563859F0);
  v53 = (id)sub_235E611FC();
  v26 = sub_235E611CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v2, 1, 1, v26);
  sub_235E44FA0();
  sub_235E52DF0();
  sub_235E60CA4();
  sub_235E30A00((uint64_t)v2, &qword_256386828);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v4, v44);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v5);
  sub_235E29CC0(&qword_256386D20, &qword_256386CF8, MEMORY[0x24BDB9920]);
  v27 = v40;
  sub_235E60C38();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v27);
  v28 = MEMORY[0x24BDB96C0];
  sub_235E29CC0(&qword_256386D28, &qword_256386D00, MEMORY[0x24BDB96C0]);
  v29 = v43;
  sub_235E60C8C();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v29);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386D30);
  sub_235E29CC0(&qword_256386D38, &qword_256386D08, MEMORY[0x24BDB9530]);
  v30 = v47;
  sub_235E60C38();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v30);
  v31 = sub_235E29CC0(&qword_256386D40, &qword_256386D10, v28);
  v32 = sub_235E29CC0(&qword_256386D48, &qword_256386D30, MEMORY[0x24BDB9450]);
  v33 = v46;
  v34 = v49;
  MEMORY[0x23B7E2DB0](v49, v31, v32);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v21, v34);
  v35 = swift_allocObject();
  swift_weakInit();
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = sub_235E52E50;
  *(_QWORD *)(v36 + 24) = v35;
  sub_235E29CC0(&qword_256386D50, &qword_256386D18, MEMORY[0x24BDB9610]);
  v37 = v51;
  sub_235E60CF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v33, v37);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  return swift_release();
}

void sub_235E49BB0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)(v3 + 16) + 16))
    __asm { BR              X10 }
}

void sub_235E4A040(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;

  v53 = v52;
  v54 = *(_QWORD *)(*(_QWORD *)(v52 + 16) + 16);
  if (v54)
  {
    swift_bridgeObjectRetain();
    v56 = objc_msgSend(a1, sel_sectionIdentifier);
    if (*(_QWORD *)(*(_QWORD *)(v53 + 16) + 16))
    {
      v57 = v56;
      v58 = swift_bridgeObjectRetain();
      v59 = sub_235E5292C(v58);
      v61 = v60;
      swift_bridgeObjectRelease();

      if ((v61 & 1) == 0)
      {
        if ((v59 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v59 < *(_QWORD *)(v54 + 16))
        {
          v62 = v54 + 24 * v59;
          v63 = *(unsigned __int8 *)(v62 + 48);
          sub_235E34E50(*(id *)(v62 + 32), *(_QWORD *)(v62 + 40), *(_BYTE *)(v62 + 48));
          swift_bridgeObjectRelease();
          __asm { BR              X9 }
        }
        __break(1u);
        JUMPOUT(0x235E4A764);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v64 = v56;
      swift_bridgeObjectRelease();

    }
  }
}

uint64_t sub_235E4A838@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
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
  char v50;
  uint64_t v51;

  v38 = a2;
  v48 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D60);
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v41 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D68);
  v46 = *(_QWORD *)(v6 - 8);
  v47 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v36 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563868F0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D70);
  v37 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386D78);
  v40 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v39 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v36 - v20;
  v22 = *a1;
  if (qword_2563854C8 != -1)
    swift_once();
  v23 = qword_2563874A0;
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = v22;
  *(_QWORD *)(v24 + 24) = v23;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386908);
  sub_235E29CC0(&qword_256386910, &qword_256386908, MEMORY[0x24BDB9568]);
  sub_235E60BF0();
  sub_235E29CC0(&qword_256386918, &qword_2563868F0, MEMORY[0x24BDB9E90]);
  v25 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v49 = v25;
  v51 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386920);
  v26 = MEMORY[0x24BDB9AF8];
  sub_235E29CC0(&qword_256386930, &qword_256386920, MEMORY[0x24BDB9AF8]);
  sub_235E60C2C();
  swift_release();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386D80);
  v27 = MEMORY[0x24BDB95A8];
  sub_235E29CC0(&qword_256386D88, &qword_256386D70, MEMORY[0x24BDB95A8]);
  sub_235E60C38();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v16, v14);
  v49 = sub_235E45C70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386A10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386D90);
  sub_235E29CC0(&qword_256386A18, &qword_256386A10, v26);
  v28 = v41;
  sub_235E60C38();
  swift_release();
  v49 = 0;
  v50 = -1;
  v29 = MEMORY[0x24BDB96C0];
  sub_235E29CC0(&qword_256386D98, &qword_256386D60, MEMORY[0x24BDB96C0]);
  v30 = v45;
  v31 = v43;
  sub_235E60C2C();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v28, v31);
  v32 = v40;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v39, v21, v17);
  v34 = v46;
  v33 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v44, v30, v47);
  sub_235E29CC0(&qword_256386DA0, &qword_256386D78, v29);
  sub_235E29CC0(&qword_256386DA8, &qword_256386D68, v27);
  sub_235E60B30();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v30, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v21, v17);
}

uint64_t sub_235E4AD40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  void **v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t *v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t result;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35[5];

  v5 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = (uint64_t *)MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v35[0] = MEMORY[0x24BEE4AF8];
    v7 = v35;
    sub_235E4F840(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
    {
      __break(1u);
LABEL_31:
      v7 = sub_235E4F704(0, v7[2] + 1, 1, v7);
      goto LABEL_19;
    }
    v33 = a2;
    v34 = a3;
    v7 = (uint64_t *)v35[0];
    if ((v5 & 0xC000000000000001) != 0)
    {
      v8 = 0;
      v9 = MEMORY[0x24BEE4B00];
      do
      {
        v10 = MEMORY[0x23B7E35E4](v8, v5);
        v35[0] = (uint64_t)v7;
        v12 = v7[2];
        v11 = v7[3];
        if (v12 >= v11 >> 1)
        {
          sub_235E4F840(v11 > 1, v12 + 1, 1);
          v7 = (uint64_t *)v35[0];
        }
        ++v8;
        v7[2] = v12 + 1;
        v13 = &v7[3 * v12];
        v13[4] = v10;
        v13[5] = v9;
        *((_BYTE *)v13 + 48) = 2;
      }
      while (v6 != v8);
    }
    else
    {
      v14 = (void **)(v5 + 32);
      v15 = MEMORY[0x24BEE4B00];
      do
      {
        v16 = *v14;
        v35[0] = (uint64_t)v7;
        v17 = v7[2];
        v18 = v7[3];
        v19 = v16;
        if (v17 >= v18 >> 1)
        {
          sub_235E4F840(v18 > 1, v17 + 1, 1);
          v7 = (uint64_t *)v35[0];
        }
        v7[2] = v17 + 1;
        v20 = &v7[3 * v17];
        v20[4] = (uint64_t)v19;
        v20[5] = v15;
        *((_BYTE *)v20 + 48) = 2;
        ++v14;
        --v6;
      }
      while (v6);
    }
    a2 = v33;
    a3 = v34;
  }
  v35[3] = (uint64_t)&type metadata for Features;
  v35[4] = sub_235E2A368();
  v21 = sub_235E60A4C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  if ((v21 & 1) == 0 || *(_BYTE *)(a2 + 96) != 1)
    goto LABEL_22;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_31;
LABEL_19:
  v23 = v7[2];
  v22 = v7[3];
  if (v23 >= v22 >> 1)
    v7 = sub_235E4F704((_QWORD *)(v22 > 1), v23 + 1, 1, v7);
  v7[2] = v23 + 1;
  v24 = &v7[3 * v23];
  v24[4] = 0;
  v24[5] = 0;
  *((_BYTE *)v24 + 48) = 0;
LABEL_22:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = sub_235E4F704(0, v7[2] + 1, 1, v7);
  v26 = v7[2];
  v25 = v7[3];
  if (v26 >= v25 >> 1)
    v7 = sub_235E4F704((_QWORD *)(v25 > 1), v26 + 1, 1, v7);
  v7[2] = v26 + 1;
  v27 = &v7[3 * v26];
  v27[4] = 0;
  v27[5] = 0;
  *((_BYTE *)v27 + 48) = 1;
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC13B0]), sel_init);
  v30 = v7[2];
  v29 = v7[3];
  if (v30 >= v29 >> 1)
    v7 = sub_235E4F704((_QWORD *)(v29 > 1), v30 + 1, 1, v7);
  v7[2] = v30 + 1;
  v31 = &v7[3 * v30];
  v31[4] = (uint64_t)v28;
  v31[5] = 0;
  *((_BYTE *)v31 + 48) = 3;
  v35[0] = (uint64_t)v7;
  swift_bridgeObjectRetain();
  sub_235E51594(v35);
  result = swift_bridgeObjectRelease();
  *a3 = v35[0];
  return result;
}

id sub_235E4B0AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  char v3;

  v2 = *(void **)a1;
  v3 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_BYTE *)(a2 + 8) = v3;
  return v2;
}

uint64_t sub_235E4B0C0(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_235E4B138(a1, a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_235E4B138(uint64_t a1, unsigned __int8 *a2, int a3)
{
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t info;
  _QWORD *isa;
  char *data;
  void *length;
  uint64_t v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  void *v41;
  uint64_t v42;
  int v43;
  uint64_t Strong;
  id v45;
  id v46;
  unint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  int v52;
  uint64_t v53;
  uint8_t *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint8_t *v60;
  const __CFString *v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  unint64_t v68;
  char v69;
  uint64_t *v70;
  char *v71;
  BOOL v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  unint64_t v77;
  char v78;
  uint64_t *v79;
  char *v80;
  char *v81;
  id v82;
  id v83;
  void *v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint8_t *v112;
  uint8_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const __CFString *v117;
  const __CFString **v118;
  id v119;
  uint64_t v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124[5];
  const __CFString *v125;
  uint64_t v126;
  uint64_t v127;
  __CFString *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

  v4 = v3;
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BA0);
  v110 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  v109 = (uint64_t)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386950);
  v100 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v99 = (uint64_t)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386928);
  v103 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v102 = (uint64_t)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2563854D0 != -1)
    goto LABEL_56;
  while (1)
  {
    v11 = sub_235E60AA0();
    v116 = __swift_project_value_buffer(v11, (uint64_t)qword_256386DC8);
    v12 = sub_235E60A88();
    v13 = sub_235E6119C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_235E24000, v12, v13, "Resetting the store", v14, 2u);
      MEMORY[0x23B7E3DAC](v14, -1, -1);
    }

    info = v4[1].info;
    LOBYTE(v134) = 1;
    *(_BYTE *)(info + 16) = 1;
    swift_retain();
    swift_retain();
    sub_235E60B90();
    swift_release();
    swift_release();
    isa = v4[1].isa;
    v134 = MEMORY[0x24BEE4B00];
    isa[2] = MEMORY[0x24BEE4B00];
    swift_retain();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_235E60B90();
    swift_release();
    swift_release();
    data = v4->data;
    v134 = a1;
    *((_QWORD *)data + 2) = a1;
    swift_bridgeObjectRetain_n();
    swift_retain();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_235E60B90();
    swift_release();
    v115 = a1;
    swift_bridgeObjectRelease();
    swift_release();
    v117 = v4;
    length = (void *)v4[2].length;
    if (length)
    {
      v19 = *((_QWORD *)v117->data + 2);
      if (v19)
      {
        if (*(_QWORD *)(v19 + 16))
        {
          v119 = a2;
          LODWORD(v122) = a3;
          swift_bridgeObjectRetain_n();
          v121 = length;
          v120 = v19;
          __asm { BR              X8 }
        }
      }
    }
    if ((_BYTE)a3 != 0xFF)
    {
      if ((a3 & 1) != 0)
      {
        v27 = (_QWORD *)*((_QWORD *)v117->data + 2);
        if (v27 && v27[2])
        {
          swift_bridgeObjectRetain();
          LODWORD(v122) = a3;
          sub_235E52ED8(a2, a3);
          swift_bridgeObjectRetain();
          v121 = v27;
          __asm { BR              X8 }
        }
      }
      else
      {
        v20 = a2;
        sub_235E4A040(v20, 1, v21, v22, v23, v24, v25, v26, v98, v99, v100, v101, v102, v103, v104, v105, v106, *((uint64_t *)&v106 + 1), v107,
          (uint64_t)v108,
          v109,
          v110,
          v111,
          (uint64_t)v112,
          (uint64_t)v113,
          v114,
          v115,
          v116,
          (uint64_t)v117,
          (uint64_t)v118,
          v119,
          v120,
          (uint64_t)v121,
          (char)v122,
          v123,
          v124[0],
          v124[1],
          v124[2],
          v124[3],
          v124[4],
          (uint64_t)v125,
          v126,
          v127,
          (uint64_t)v128,
          v129,
          v130,
          v131,
          v132,
          v133,
          v134,
          v135,
          v136);
        sub_235E48C9C(a2, a3);
      }
    }
    v28 = (uint64_t)v117;
    v29 = v117->length;
    v30 = v115;
    switch(*(_BYTE *)(v29 + 32))
    {
      case 0:
        v31 = CFSTR("Controls");
        goto LABEL_17;
      case 1:
        v31 = CFSTR("Shortcuts");
LABEL_17:
        v32 = v31;
        goto LABEL_19;
      case 2:
      case 3:
        v31 = (__CFString *)objc_msgSend(*(id *)(v29 + 16), sel_sectionIdentifier);
LABEL_19:
        v33 = *(_QWORD **)(*(_QWORD *)(v28 + 16) + 16);
        if (v33 && v33[2])
        {
          swift_bridgeObjectRetain_n();
          v122 = v33;
          __asm { BR              X8 }
        }

        break;
      default:
        break;
    }
    v34 = *(_QWORD *)(*(_QWORD *)(v28 + 16) + 16);
    if (v34 && *(_QWORD *)(v34 + 16))
    {
      swift_bridgeObjectRetain_n();
      __asm { BR              X8 }
    }
    if (!*(_QWORD *)(v30 + 16))
    {
      __break(1u);
      JUMPOUT(0x235E4C40CLL);
    }
    v35 = *(void **)(v30 + 32);
    v36 = *(_QWORD *)(v30 + 40);
    v37 = *(_BYTE *)(v30 + 48);
    sub_235E34E50(v35, v36, v37);
    sub_235E4C45C(v35, v36, v37);
    sub_235E34EA4(v35, v36, v37);
    swift_weakInit();
    v38 = MEMORY[0x24BEE4AF8];
    v137 = MEMORY[0x24BEE4AF8];
    v39 = v115;
    a1 = *(_QWORD *)(v115 + 16);
    if (!a1)
      break;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v108 = v124;
    v118 = &v125;
    a2 = (unsigned __int8 *)(v39 + 48);
    *(_QWORD *)&v40 = 136315138;
    v106 = v40;
    v105 = MEMORY[0x24BEE4AD8] + 8;
    v119 = (id)0x8000000235E65CD0;
    while (1)
    {
      v41 = (void *)*((_QWORD *)a2 - 2);
      v42 = *((_QWORD *)a2 - 1);
      v43 = *a2;
      Strong = swift_weakLoadStrong();
      if (!Strong)
        goto LABEL_30;
      a3 = Strong;
      if (v43 != 2)
      {
        swift_release();
        goto LABEL_30;
      }
      sub_235E34E50(v41, v42, 2);
      v45 = v41;
      v46 = objc_msgSend(v45, sel_parameters);
      sub_235E26AC8(0, &qword_2563867F0);
      v47 = sub_235E610AC();

      v121 = v41;
      v120 = v42;
      if (v47 >> 62)
      {
        swift_bridgeObjectRetain();
        v48 = sub_235E61610();
        swift_bridgeObjectRelease();
      }
      else
      {
        v48 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v122 = v45;
      if (v48 >= 2)
      {
        v49 = v45;
        v50 = sub_235E60A88();
        v51 = sub_235E61184();
        v52 = v51;
        if (os_log_type_enabled(v50, v51))
        {
          v53 = swift_slowAlloc();
          HIDWORD(v114) = v52;
          v54 = (uint8_t *)v53;
          v55 = swift_slowAlloc();
          v124[0] = v55;
          v113 = v54;
          *(_DWORD *)v54 = v106;
          v112 = v54 + 4;
          v56 = objc_msgSend(v49, sel_actionIdentifier);
          v57 = sub_235E6104C();
          v59 = v58;

          v123 = sub_235E2AEC4(v57, v59, v124);
          sub_235E61430();

          swift_bridgeObjectRelease();
          v60 = v113;
          _os_log_impl(&dword_235E24000, v50, BYTE4(v114), "%s has multiple parameters; will only displaying first parameter",
            v113,
            0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7E3DAC](v55, -1, -1);
          MEMORY[0x23B7E3DAC](v60, -1, -1);

        }
        else
        {

        }
      }
      v4 = CFSTR("Focus");
      v125 = CFSTR("Focus");
      v126 = 0xD000000000000031;
      v127 = (uint64_t)v119;
      v128 = CFSTR("Camera");
      v129 = 0x746F685072616572;
      v130 = 0xE90000000000006FLL;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256386C38);
      v61 = (const __CFString *)sub_235E61634();
      v62 = (__CFString *)v125;
      v63 = v126;
      v64 = v127;
      v65 = CFSTR("Focus");
      v66 = CFSTR("Camera");
      v67 = v62;
      swift_bridgeObjectRetain();
      v68 = sub_235E2A174((uint64_t)v67);
      if ((v69 & 1) != 0)
        break;
      v4 = v61 + 2;
      *(void **)((char *)&v61[2].isa + ((v68 >> 3) & 0x1FFFFFFFFFFFFFF8)) = (void *)(*(uint64_t *)((char *)&v61[2].isa
                                                                                                  + ((v68 >> 3) & 0x1FFFFFFFFFFFFFF8)) | (1 << v68));
      *(_QWORD *)&v61[1].data[8 * v68] = v67;
      v70 = (uint64_t *)(v61[1].length + 16 * v68);
      *v70 = v63;
      v70[1] = v64;
      v71 = v61->data;
      v72 = __OFADD__(v71, 1);
      v73 = v71 + 1;
      if (v72)
        goto LABEL_53;
      v61->data = v73;
      v74 = v129;
      v75 = v130;
      v76 = v128;
      swift_bridgeObjectRetain();
      v77 = sub_235E2A174((uint64_t)v76);
      if ((v78 & 1) != 0)
        goto LABEL_54;
      *(void **)((char *)&v4->isa + ((v77 >> 3) & 0x1FFFFFFFFFFFFFF8)) = (void *)(*(uint64_t *)((char *)&v4->isa
                                                                                               + ((v77 >> 3) & 0x1FFFFFFFFFFFFFF8)) | (1 << v77));
      *(_QWORD *)&v61[1].data[8 * v77] = v76;
      v79 = (uint64_t *)(v61[1].length + 16 * v77);
      *v79 = v74;
      v79[1] = v75;
      v80 = v61->data;
      v72 = __OFADD__(v80, 1);
      v81 = v80 + 1;
      if (v72)
        goto LABEL_55;
      v61->data = v81;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256386D58);
      swift_arrayDestroy();
      v82 = v122;
      v83 = objc_msgSend(v122, sel_sectionIdentifier);
      v84 = v83;
      if (v61->data && (sub_235E2A174((uint64_t)v83), (v85 & 1) != 0))
      {

        swift_release();
        v86 = swift_allocObject();
        swift_weakInit();
        v87 = swift_allocObject();
        *(_QWORD *)(v87 + 16) = v86;
        *(_QWORD *)(v87 + 24) = v82;
        v88 = v82;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256386968);
        sub_235E29CC0(&qword_256386978, &qword_256386968, MEMORY[0x24BDB9AF8]);
        v89 = v109;
        sub_235E60BF0();
        sub_235E29CC0(&qword_256386BA8, &qword_256386BA0, MEMORY[0x24BDB9E90]);
        v90 = v111;
        sub_235E60BFC();
        (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v89, v90);

        swift_release();
        sub_235E34EA4(v121, v120, 2);
        MEMORY[0x23B7E3170]();
        if (*(_QWORD *)(v137 + 16) >= *(_QWORD *)(v137 + 24) >> 1)
          sub_235E610D0();
        sub_235E610E8();
        sub_235E610C4();
      }
      else
      {

        swift_release();
        swift_release();

        sub_235E34EA4(v121, v120, 2);
      }
LABEL_30:
      a2 += 24;
      if (!--a1)
      {
        swift_bridgeObjectRelease();
        v38 = v137;
        goto LABEL_51;
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_once();
  }
LABEL_51:
  swift_weakDestroy();
  v131 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386958);
  sub_235E29CC0(&qword_256386960, &qword_256386958, MEMORY[0x24BEE12C8]);
  v91 = v99;
  sub_235E61088();
  swift_bridgeObjectRelease();
  sub_235E60B60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386968);
  sub_235E29CC0(&qword_256386970, &qword_256386950, MEMORY[0x24BDB9970]);
  sub_235E29CC0(&qword_256386978, &qword_256386968, MEMORY[0x24BDB9AF8]);
  v92 = v102;
  v93 = v101;
  sub_235E60D04();
  (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v91, v93);
  sub_235E29CC0(&qword_256386938, &qword_256386928, MEMORY[0x24BDB98F0]);
  v94 = v104;
  sub_235E60C44();
  (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v92, v94);
  v95 = (uint64_t)v117;
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  v96 = *(_QWORD *)(v95 + 40);
  LOBYTE(v131) = 0;
  *(_BYTE *)(v96 + 16) = 0;
  swift_retain();
  swift_retain();
  sub_235E60B90();
  swift_release();
  return swift_release();
}

void sub_235E4C45C(void *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  char v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  id v24;
  __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  char v36;
  uint64_t v37;
  char *v38;
  __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void (**v55)(char *, uint64_t);
  uint64_t v56;
  void (**v57)(char *, uint64_t);
  int v58;
  uint64_t v59;
  uint64_t v60;
  char v61;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BA0);
  v57 = *(void (***)(char *, uint64_t))(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v3 + 24);
  v12 = *(unsigned __int8 *)(v11 + 32);
  if (v12 != 255)
  {
    v14 = *(void **)(v11 + 16);
    v13 = *(_QWORD *)(v11 + 24);
    sub_235E34E50(a1, a2, a3);
    sub_235E52BF0(v14, v13, v12);
    sub_235E5D678((uint64_t)v14, v13, v12);
    v16 = v15;
    sub_235E34EA4(a1, a2, a3);
    sub_235E52C04(v14, v13, v12);
    if ((v16 & 1) != 0)
      return;
    v11 = *(_QWORD *)(v4 + 24);
    v12 = *(unsigned __int8 *)(v11 + 32);
  }
  v18 = *(void **)(v11 + 16);
  v17 = *(_QWORD *)(v11 + 24);
  v59 = (uint64_t)a1;
  v60 = a2;
  v61 = a3;
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *(_BYTE *)(v11 + 32) = a3;
  sub_235E34E50(a1, a2, a3);
  sub_235E34E50(a1, a2, a3);
  sub_235E34E50(a1, a2, a3);
  swift_retain();
  sub_235E52BF0(v18, v17, v12);
  v58 = v12;
  sub_235E52C04(v18, v17, v12);
  swift_retain();
  sub_235E60B90();
  swift_release();
  sub_235E34EA4(a1, a2, a3);
  sub_235E34EA4(a1, a2, a3);
  swift_release();
  v19 = *(_QWORD *)(v4 + 24);
  v20 = *(void **)(v19 + 16);
  v21 = *(_QWORD *)(v19 + 24);
  v22 = *(unsigned __int8 *)(v19 + 32);
  if (v22)
  {
    if (v22 == 2)
    {
      v50 = v10;
      v23 = v8;
      v24 = v20;
      v52 = v20;
      sub_235E52BF0(v20, v21, 2);
      v51 = v24;
      v55 = (void (**)(char *, uint64_t))objc_msgSend(v24, sel_sectionIdentifier);
      v56 = v17;
      v53 = v18;
      v54 = v21;
      v25 = CFSTR("Controls");
      v26 = v23;
      switch(v58)
      {
        case 0:
          goto LABEL_8;
        case 1:
          v25 = CFSTR("Shortcuts");
LABEL_8:
          v27 = v25;
          goto LABEL_21;
        case 2:
        case 3:
          v27 = (__CFString *)objc_msgSend(v18, (SEL)0x25073EE48);
LABEL_21:
          v39 = v27;
          v38 = v50;
          v40 = sub_235E6104C();
          v42 = v41;
          if (v40 == sub_235E6104C() && v42 == v43)
          {

            swift_bridgeObjectRelease_n();
LABEL_25:

            sub_235E52C04(v52, v54, 2);
            goto LABEL_27;
          }
          v44 = sub_235E616D0();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v44 & 1) != 0)
            goto LABEL_25;
LABEL_26:
          v45 = swift_allocObject();
          swift_weakInit();
          v46 = swift_allocObject();
          v47 = v51;
          *(_QWORD *)(v46 + 16) = v45;
          *(_QWORD *)(v46 + 24) = v47;
          v55 = (void (**)(char *, uint64_t))v47;
          __swift_instantiateConcreteTypeFromMangledName(&qword_256386968);
          sub_235E29CC0(&qword_256386978, &qword_256386968, MEMORY[0x24BDB9AF8]);
          sub_235E60BF0();
          sub_235E29CC0(&qword_256386BA8, &qword_256386BA0, MEMORY[0x24BDB9E90]);
          v48 = sub_235E60BFC();
          v57[1](v38, v26);
          v59 = v48;
          v49 = sub_235E60C44();

          sub_235E52C04(v52, v54, 2);
          swift_release();
          *(_QWORD *)(v4 + 72) = v49;
          swift_release();
LABEL_27:
          v18 = v53;
          break;
        default:

          v26 = v23;
          v38 = v50;
          goto LABEL_26;
      }
      goto LABEL_28;
    }
    *(_QWORD *)(v4 + 72) = 0;
    swift_release();
LABEL_29:
    sub_235E4EB6C(a1, a2, a3);
    v36 = v58;
    goto LABEL_30;
  }
  if (!v20)
    goto LABEL_29;
  v56 = v17;
  if (v58)
  {
    sub_235E52BF0(v20, v21, 0);
    sub_235E34E50(v20, v21, 0);
    sub_235E34E50(v20, v21, 0);
LABEL_17:
    v28 = v20;
LABEL_18:
    v59 = sub_235E4E8C4(v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385C80);
    sub_235E29CC0(&qword_256385C88, &qword_256385C80, MEMORY[0x24BDB9AF8]);
    v37 = sub_235E60C44();
    sub_235E52C04(v28, v21, 0);
    sub_235E52C04(v28, v21, 0);
    sub_235E34EA4(v28, v21, 0);
    swift_release();
    *(_QWORD *)(v4 + 72) = v37;
    swift_release();
LABEL_28:
    v17 = v56;
    goto LABEL_29;
  }
  if (!v18)
  {
    sub_235E52BF0(v20, v21, 0);
    sub_235E52BF0(v20, v21, 0);
    sub_235E52BF0(0, v17, 0);
    sub_235E52BF0(v20, v21, 0);
    goto LABEL_17;
  }
  sub_235E52BF0(v20, v21, 0);
  sub_235E52BF0(v20, v21, 0);
  sub_235E52BF0(v18, v17, 0);
  sub_235E52BF0(v20, v21, 0);
  v28 = v20;
  v29 = objc_msgSend(v20, sel_controlType);
  v57 = (void (**)(char *, uint64_t))objc_msgSend(v29, sel_unsignedIntegerValue);

  v30 = sub_235E36A18();
  v54 = v21;
  v31 = v18;
  v32 = v30;
  v33 = objc_msgSend(v31, sel_controlType);
  v55 = (void (**)(char *, uint64_t))objc_msgSend(v33, sel_unsignedIntegerValue);

  v34 = sub_235E36A18();
  sub_235E26AC8(0, (unint64_t *)&qword_256385C68);
  v35 = v32;
  LOBYTE(v33) = sub_235E612C8();
  sub_235E52C04(v31, v17, 0);

  v18 = v31;
  v21 = v54;

  if ((v33 & 1) == 0 || v57 != v55)
    goto LABEL_18;
  sub_235E52C04(v28, v21, 0);
  sub_235E52C04(v28, v21, 0);
  sub_235E34EA4(v28, v21, 0);
  v36 = 0;
  v17 = v56;
LABEL_30:
  sub_235E52C04(v18, v17, v36);
}

void sub_235E4CBCC(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t Strong;
  _QWORD *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint8_t *v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  os_log_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  os_log_t v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  os_log_type_t v62;
  BOOL v63;
  uint8_t *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  os_log_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v89;
  uint64_t v90;
  uint8_t *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint8_t *v101;
  uint64_t v102;
  uint64_t isa;
  os_log_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107[3];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563867E0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BB0);
  v94 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v93 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BB8);
  isa = (uint64_t)v9[-1].isa;
  v104 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v100 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BC0);
  v98 = *(_QWORD *)(v11 - 8);
  v99 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v95 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BC8);
  v101 = *(uint8_t **)(v13 - 8);
  v102 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v97 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BD0);
  v90 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386BD8);
  v91 = *(uint8_t **)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v19 = (char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    goto LABEL_13;
  v21 = (_QWORD *)Strong;
  v105 = a2;
  v22 = objc_msgSend(a1, sel_parameters);
  sub_235E26AC8(0, &qword_2563867F0);
  v23 = sub_235E610AC();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v24)
  {
    swift_release();
    a2 = v105;
LABEL_13:
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386810);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
    sub_235E60BD8();
    sub_235E29CC0(&qword_256386820, &qword_2563867E0, MEMORY[0x24BDB9E20]);
    v44 = sub_235E60BFC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_31;
  }
  v25 = *(_QWORD *)(v21[4] + 16);
  if (*(_QWORD *)(v25 + 16))
  {
    v26 = a1;
    swift_bridgeObjectRetain();
    v27 = sub_235E277B4((uint64_t)v26);
    if ((v28 & 1) != 0)
    {
      v29 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v27);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v29 + 16))
      {
        if (qword_2563854D0 != -1)
          swift_once();
        v30 = sub_235E60AA0();
        __swift_project_value_buffer(v30, (uint64_t)qword_256386DC8);
        v31 = v26;
        v32 = sub_235E60A88();
        v33 = sub_235E6119C();
        v34 = v33;
        if (os_log_type_enabled(v32, v33))
        {
          v104 = v32;
          v35 = swift_slowAlloc();
          LODWORD(v102) = v34;
          v36 = (uint8_t *)v35;
          isa = swift_slowAlloc();
          v107[0] = isa;
          *(_DWORD *)v36 = 136315138;
          v100 = (char *)(v36 + 4);
          v101 = v36;
          v37 = objc_msgSend(v31, sel_sectionIdentifier);
          v38 = sub_235E6104C();
          v40 = v39;

          v106 = sub_235E2AEC4(v38, v40, v107);
          sub_235E61430();

          swift_bridgeObjectRelease();
          v41 = v104;
          v42 = v101;
          _os_log_impl(&dword_235E24000, v104, (os_log_type_t)v102, "Already have cached sections for %s", v101, 0xCu);
          v43 = isa;
          swift_arrayDestroy();
          MEMORY[0x23B7E3DAC](v43, -1, -1);
          MEMORY[0x23B7E3DAC](v42, -1, -1);

        }
        else
        {

        }
        a2 = v105;
        v107[0] = v29;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256386810);
        sub_235E60BCC();
        __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
        sub_235E60BC0();
        (*(void (**)(char *, uint64_t))(v90 + 8))(v17, v15);
        sub_235E29CC0(&qword_256386C10, &qword_256386BD8, MEMORY[0x24BDBA1D0]);
        v89 = v92;
        v44 = sub_235E60BFC();
        swift_release();
        (*((void (**)(char *, uint64_t))v91 + 1))(v19, v89);
        goto LABEL_31;
      }
    }
    else
    {

    }
    swift_bridgeObjectRelease();
  }
  v45 = objc_msgSend(a1, sel_sectionIdentifier);
  swift_beginAccess();
  v46 = v21[8];
  if (*(_QWORD *)(v46 + 16) && (v47 = sub_235E2A174((uint64_t)v45), (v48 & 1) != 0))
  {
    v44 = *(_QWORD *)(*(_QWORD *)(v46 + 56) + 8 * v47);
    swift_endAccess();
    swift_retain();

    if (qword_2563854D0 != -1)
      swift_once();
    v49 = sub_235E60AA0();
    __swift_project_value_buffer(v49, (uint64_t)qword_256386DC8);
    v50 = a1;
    v51 = sub_235E60A88();
    v52 = sub_235E6119C();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v104 = (os_log_t)swift_slowAlloc();
      v107[0] = (uint64_t)v104;
      *(_DWORD *)v53 = 136315138;
      isa = (uint64_t)(v53 + 4);
      v54 = objc_msgSend(v50, sel_sectionIdentifier);
      v55 = sub_235E6104C();
      v57 = v56;

      v106 = sub_235E2AEC4(v55, v57, v107);
      sub_235E61430();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235E24000, v51, v52, "Section request for %s is still running", v53, 0xCu);
      v58 = v104;
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v58, -1, -1);
      MEMORY[0x23B7E3DAC](v53, -1, -1);
      swift_release();

    }
    else
    {

      swift_release();
    }
    a2 = v105;
  }
  else
  {

    swift_endAccess();
    if (qword_2563854D0 != -1)
      swift_once();
    v59 = sub_235E60AA0();
    __swift_project_value_buffer(v59, (uint64_t)qword_256386DC8);
    v60 = a1;
    v61 = sub_235E60A88();
    v62 = sub_235E6119C();
    v63 = os_log_type_enabled(v61, v62);
    v92 = (uint64_t)(v21 + 8);
    if (v63)
    {
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v107[0] = v65;
      *(_DWORD *)v64 = 136315138;
      v91 = v64 + 4;
      v66 = objc_msgSend(v60, sel_sectionIdentifier);
      v67 = sub_235E6104C();
      v69 = v68;

      v106 = sub_235E2AEC4(v67, v69, v107);
      sub_235E61430();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235E24000, v61, v62, "Starting section request for %s", v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v65, -1, -1);
      MEMORY[0x23B7E3DAC](v64, -1, -1);

    }
    else
    {

    }
    a2 = v105;
    if (qword_2563854C8 != -1)
      swift_once();
    sub_235E27C54(v60, 0);
    v107[0] = v70;
    v71 = swift_allocObject();
    swift_weakInit();
    v72 = swift_allocObject();
    *(_QWORD *)(v72 + 16) = v71;
    *(_QWORD *)(v72 + 24) = v60;
    v73 = swift_allocObject();
    swift_weakInit();
    v74 = swift_allocObject();
    *(_QWORD *)(v74 + 16) = v73;
    *(_QWORD *)(v74 + 24) = v60;
    v75 = swift_allocObject();
    swift_weakInit();
    v76 = swift_allocObject();
    *(_QWORD *)(v76 + 16) = v75;
    *(_QWORD *)(v76 + 24) = v60;
    v105 = (uint64_t *)v60;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386968);
    v77 = MEMORY[0x24BDB9AF8];
    sub_235E29CC0(&qword_256386978, &qword_256386968, MEMORY[0x24BDB9AF8]);
    v78 = v95;
    sub_235E60C14();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v107[0] = *(_QWORD *)(v21[5] + 24);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385AB8);
    sub_235E29CC0(&qword_256385AC0, &qword_256385AB8, MEMORY[0x24BDB9D10]);
    v107[0] = sub_235E60BFC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385AC8);
    sub_235E29CC0(&qword_256385AD0, &qword_256385AC8, v77);
    v79 = v93;
    sub_235E60CB0();
    swift_release();
    sub_235E29CC0(&qword_256386BE0, &qword_256386BB0, MEMORY[0x24BDB96F8]);
    v80 = v100;
    v81 = v96;
    sub_235E60C68();
    (*(void (**)(char *, uint64_t))(v94 + 8))(v79, v81);
    sub_235E29CC0(&qword_256386BE8, &qword_256386BC0, MEMORY[0x24BDB9568]);
    sub_235E29CC0(&qword_256386BF0, &qword_256386BB8, MEMORY[0x24BDB97F8]);
    v82 = v97;
    v83 = v99;
    v84 = v104;
    sub_235E60C74();
    (*(void (**)(char *, os_log_t))(isa + 8))(v80, v84);
    (*(void (**)(char *, uint64_t))(v98 + 8))(v78, v83);
    sub_235E29CC0(&qword_256386BF8, &qword_256386BC8, MEMORY[0x24BDB9678]);
    v85 = v102;
    v86 = sub_235E60C5C();
    (*((void (**)(char *, uint64_t))v101 + 1))(v82, v85);
    v107[0] = v86;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386C00);
    sub_235E29CC0(&qword_256386C08, &qword_256386C00, MEMORY[0x24BDB97C8]);
    v44 = sub_235E60BFC();
    swift_release();
    v87 = objc_msgSend(v105, sel_sectionIdentifier);
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v106 = v21[8];
    v21[8] = 0x8000000000000000;
    sub_235E50D78(v44, v87, isUniquelyReferenced_nonNull_native);
    v21[8] = v106;

    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
  }
LABEL_31:
  *a2 = v44;
}

void sub_235E4D9D4(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t Strong;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  os_log_type_t v46;
  uint8_t *v47;
  NSObject *log;
  uint64_t v49;
  uint64_t v50;

  v4 = *a1;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return;
  v6 = Strong;
  if (qword_2563854D0 != -1)
    swift_once();
  v7 = sub_235E60AA0();
  __swift_project_value_buffer(v7, (uint64_t)qword_256386DC8);
  v8 = a3;
  swift_bridgeObjectRetain_n();
  v9 = v8;
  v10 = sub_235E60A88();
  v11 = sub_235E6119C();
  if (os_log_type_enabled(v10, v11))
  {
    v46 = v11;
    log = v10;
    v12 = swift_slowAlloc();
    v45 = swift_slowAlloc();
    v50 = v45;
    *(_DWORD *)v12 = 136315394;
    v13 = objc_msgSend(v9, sel_sectionIdentifier);
    v14 = sub_235E6104C();
    v16 = v15;

    sub_235E2AEC4(v14, v16, &v50);
    sub_235E61430();

    swift_bridgeObjectRelease();
    v47 = (uint8_t *)v12;
    *(_WORD *)(v12 + 12) = 2080;
    v17 = sub_235E48F04(v4);
    v18 = sub_235E48D9C(v17);
    swift_bridgeObjectRelease();
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      v19 = sub_235E61610();
      swift_bridgeObjectRelease();
      if (v19)
        goto LABEL_7;
    }
    else
    {
      v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v19)
      {
LABEL_7:
        v44 = v9;
        v49 = MEMORY[0x24BEE4AF8];
        sub_235E4F85C(0, v19 & ~(v19 >> 63), 0);
        if (v19 < 0)
        {
          __break(1u);
          JUMPOUT(0x235E4E3ACLL);
        }
        v20 = 0;
        v21 = v49;
        do
        {
          if ((v18 & 0xC000000000000001) != 0)
            v22 = (id)MEMORY[0x23B7E35E4](v20, v18);
          else
            v22 = *(id *)(v18 + 8 * v20 + 32);
          v23 = v22;
          v24 = objc_msgSend(v22, sel_identifier);
          v25 = sub_235E6104C();
          v27 = v26;

          v29 = *(_QWORD *)(v49 + 16);
          v28 = *(_QWORD *)(v49 + 24);
          if (v29 >= v28 >> 1)
            sub_235E4F85C(v28 > 1, v29 + 1, 1);
          ++v20;
          *(_QWORD *)(v49 + 16) = v29 + 1;
          v30 = v49 + 16 * v29;
          *(_QWORD *)(v30 + 32) = v25;
          *(_QWORD *)(v30 + 40) = v27;
        }
        while (v19 != v20);
        swift_bridgeObjectRelease();
        v9 = v44;
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
    v21 = MEMORY[0x24BEE4AF8];
LABEL_19:
    v31 = MEMORY[0x23B7E3194](v21, MEMORY[0x24BEE0D00]);
    v33 = v32;
    swift_bridgeObjectRelease();
    sub_235E2AEC4(v31, v33, &v50);
    sub_235E61430();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235E24000, log, v46, "Caching sections for %s: %s", v47, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v45, -1, -1);
    MEMORY[0x23B7E3DAC](v47, -1, -1);

    goto LABEL_20;
  }

  swift_bridgeObjectRelease_n();
LABEL_20:
  v34 = *(_QWORD *)(v6 + 32);
  v35 = *(_QWORD *)(v34 + 16);
  v36 = v9;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v50 = v35;
  sub_235E27654(v4, v36, isUniquelyReferenced_nonNull_native);
  v38 = v50;

  swift_bridgeObjectRelease();
  v50 = v38;
  *(_QWORD *)(v34 + 16) = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_retain();
  sub_235E60B90();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v39 = sub_235E465AC();
  if (v40 && (v41 = sub_235E466EC(v39, v40, v4), swift_bridgeObjectRelease(), v41))
  {
    v42 = objc_msgSend(v36, sel_sectionIdentifier);
    v43 = *(_QWORD *)(*(_QWORD *)(v6 + 16) + 16);
    if (v43)
    {
      if (*(_QWORD *)(v43 + 16))
      {
        swift_bridgeObjectRetain_n();
        __asm { BR              X8 }
      }
    }
    swift_release();

  }
  else
  {
    swift_release();
  }
}

uint64_t sub_235E4E424(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  char **v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17[3];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_2563854D0 != -1)
      swift_once();
    v5 = sub_235E60AA0();
    __swift_project_value_buffer(v5, (uint64_t)qword_256386DC8);
    v6 = a3;
    v7 = sub_235E60A88();
    v8 = sub_235E6119C();
    v9 = &selRef_setFont_;
    if (os_log_type_enabled(v7, v8))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v17[0] = v11;
      *(_DWORD *)v10 = 136315138;
      v12 = objc_msgSend(v6, sel_sectionIdentifier);
      v13 = sub_235E6104C();
      v15 = v14;

      v9 = &selRef_setFont_;
      sub_235E2AEC4(v13, v15, v17);
      sub_235E61430();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235E24000, v7, v8, "Completing section request for %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v11, -1, -1);
      MEMORY[0x23B7E3DAC](v10, -1, -1);

    }
    else
    {

    }
    v16 = objc_msgSend(v6, v9[19]);
    swift_beginAccess();
    sub_235E507DC((uint64_t)v16);
    swift_endAccess();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t sub_235E4E674(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  char **v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16[3];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_2563854D0 != -1)
      swift_once();
    v4 = sub_235E60AA0();
    __swift_project_value_buffer(v4, (uint64_t)qword_256386DC8);
    v5 = a2;
    v6 = sub_235E60A88();
    v7 = sub_235E6119C();
    v8 = &selRef_setFont_;
    if (os_log_type_enabled(v6, v7))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v16[0] = v10;
      *(_DWORD *)v9 = 136315138;
      v11 = objc_msgSend(v5, sel_sectionIdentifier);
      v12 = sub_235E6104C();
      v14 = v13;

      v8 = &selRef_setFont_;
      sub_235E2AEC4(v12, v14, v16);
      sub_235E61430();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235E24000, v6, v7, "Cancelling section request for %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v10, -1, -1);
      MEMORY[0x23B7E3DAC](v9, -1, -1);

    }
    else
    {

    }
    v15 = objc_msgSend(v5, v8[19]);
    swift_beginAccess();
    sub_235E507DC((uint64_t)v15);
    swift_endAccess();
    swift_release();

    return swift_release();
  }
  return result;
}

uint64_t sub_235E4E8C4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386C50);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_controlType);
  v7 = objc_msgSend(v6, sel_unsignedIntegerValue);

  v8 = sub_235E36A18();
  v11[1] = sub_235E35408(v8, (uint64_t)v7);
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385C80);
  sub_235E29CC0(&qword_256385C88, &qword_256385C80, MEMORY[0x24BDB9AF8]);
  sub_235E60C14();
  swift_release();
  swift_release();
  sub_235E29CC0(&qword_256386C58, &qword_256386C50, MEMORY[0x24BDB9568]);
  v9 = sub_235E60BFC();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9;
}

#error "235E4EB10: call analysis failed (funcsize=64)"

void sub_235E4EB6C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  __CFString *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  __CFString *v35;
  uint64_t v36;
  id v37;
  id v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386C60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2563854C8 != -1)
    swift_once();
  v10 = qword_2563874A0;
  v11 = (uint64_t)a1;
  if (a3 >= 2u)
  {
    if (a3 != 2)
    {
      v19 = qword_2563854C0;
      v20 = a1;
      if (v19 != -1)
        swift_once();
      if (qword_256386728)
      {
        v21 = (id)qword_256386728;
        sub_235E5A5B4(v21, a1, 0);

        sub_235E34EA4(a1, a2, 3);
        return;
      }
      sub_235E48BDC();
      v27 = (void *)swift_allocError();
      swift_willThrow();
      v28 = a1;
      v29 = a2;
      v30 = 3;
LABEL_43:
      sub_235E34EA4(v28, v29, v30);
      if (qword_2563854D0 != -1)
        swift_once();
      v36 = sub_235E60AA0();
      __swift_project_value_buffer(v36, (uint64_t)qword_256386DC8);
      v37 = v27;
      v38 = v27;
      v46 = sub_235E60A88();
      v39 = sub_235E61184();
      if (os_log_type_enabled(v46, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        v41 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v40 = 138412290;
        v42 = v27;
        v43 = _swift_stdlib_bridgeErrorToNSError();
        v47 = v43;
        sub_235E61430();
        *v41 = v43;

        _os_log_impl(&dword_235E24000, v46, v39, "Failed to save action: %@", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
        swift_arrayDestroy();
        MEMORY[0x23B7E3DAC](v41, -1, -1);
        MEMORY[0x23B7E3DAC](v40, -1, -1);

        return;
      }

LABEL_49:
      return;
    }
    v15 = a1;
    v16 = objc_msgSend(v15, sel_parameters);
    sub_235E26AC8(0, &qword_2563867F0);
    v17 = sub_235E610AC();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v44 = sub_235E61610();

      swift_bridgeObjectRelease_n();
      if (!v44)
        goto LABEL_31;
    }
    else
    {
      v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

      if (!v18)
        goto LABEL_31;
    }
    if ((a2 & 0xC000000000000001) != 0)
      v11 = sub_235E61490();
    else
      v11 = *(_QWORD *)(a2 + 16);
  }
  if (!v11)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        v46 = objc_msgSend(a1, sel_sectionIdentifier);
        goto LABEL_39;
      }
      v22 = CFSTR("Shortcuts");
    }
    else
    {
      v22 = CFSTR("Controls");
    }
    v46 = v22;
    v35 = v22;
LABEL_39:
    sub_235E47DB4(v46);
    goto LABEL_49;
  }
  if (!a3)
  {
    if (!a1)
      return;
    v23 = qword_2563854C0;
    v24 = a1;
    if (v23 != -1)
      swift_once();
    if (qword_256386728)
    {
      v25 = (id)qword_256386728;
      sub_235E5A5B4(v25, a1, 0);

      sub_235E34EA4(a1, a2, 0);
      return;
    }
    sub_235E48BDC();
    v27 = (void *)swift_allocError();
    swift_willThrow();
    v28 = a1;
    v29 = a2;
    v30 = 0;
    goto LABEL_43;
  }
  if (a3 == 1)
  {
    if (!a1)
      return;
    v12 = qword_2563854C0;
    v13 = a1;
    if (v12 != -1)
      swift_once();
    if (qword_256386728)
    {
      v14 = (id)qword_256386728;
      sub_235E5A5B4(v14, a1, 0);

      sub_235E34EA4(a1, a2, 1);
      return;
    }
    sub_235E48BDC();
    v27 = (void *)swift_allocError();
    swift_willThrow();
    v28 = a1;
    v29 = a2;
    v30 = 1;
    goto LABEL_43;
  }
  v15 = a1;
LABEL_31:
  if (*(_QWORD *)(v3 + 56))
  {
    v26 = v15;
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386818);
    sub_235E61148();
    swift_release();
  }
  else
  {
    v31 = v15;
    swift_bridgeObjectRetain();
  }
  v32 = sub_235E6113C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v9, 1, 1, v32);
  v33 = swift_allocObject();
  swift_weakInit();
  v34 = (_QWORD *)swift_allocObject();
  v34[2] = 0;
  v34[3] = 0;
  v34[4] = v10;
  v34[5] = v15;
  v34[6] = a2;
  v34[7] = v33;
  swift_retain();
  *(_QWORD *)(v3 + 56) = sub_235E4F37C((uint64_t)v9, (uint64_t)&unk_256386C70, (uint64_t)v34);
  swift_release();
}

uint64_t sub_235E4F238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t);

  *(_QWORD *)(v7 + 40) = a7;
  v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2563868D0 + dword_2563868D0);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 48) = v10;
  *v10 = v7;
  v10[1] = sub_235E4F2A8;
  return v12(a5, a6);
}

uint64_t sub_235E4F2A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_235E4F314()
{
  uint64_t v0;
  uint64_t Strong;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_QWORD *)(Strong + 56) = 0;
    swift_release();
    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235E4F37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_235E6113C();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_235E61130();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_235E30A00(a1, &qword_256386C60);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_235E610F4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_235E4F4B0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return v0;
}

uint64_t sub_235E4F514()
{
  sub_235E4F4B0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActionStore()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for ConfigurationViewModel.ConfigurationMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ActionStore.ConfigurationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E4F630 + 4 * byte_235E63BB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235E4F664 + 4 * byte_235E63BB0[v4]))();
}

uint64_t sub_235E4F664(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E4F66C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E4F674);
  return result;
}

uint64_t sub_235E4F680(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E4F688);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235E4F68C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E4F694(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_235E4F6A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ActionStore.ConfigurationMode()
{
  return &type metadata for ActionStore.ConfigurationMode;
}

unint64_t sub_235E4F6C0()
{
  unint64_t result;

  result = qword_256386B88;
  if (!qword_256386B88)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63C94, &type metadata for ActionStore.ConfigurationMode);
    atomic_store(result, (unint64_t *)&qword_256386B88);
  }
  return result;
}

_QWORD *sub_235E4F704(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256386C80);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_235E52AFC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E4F824(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_235E4F894(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_235E4F840(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_235E4FA34(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_235E4F85C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_235E4FBAC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_235E4F878(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_235E4FD14(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_235E4F894(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386CB0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386CB8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_235E61640();
  __break(1u);
  return result;
}

uint64_t sub_235E4FA34(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386C80);
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
  v14 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_235E61640();
  __break(1u);
  return result;
}

uint64_t sub_235E4FBAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386C20);
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
  result = sub_235E61640();
  __break(1u);
  return result;
}

uint64_t sub_235E4FD14(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386C88);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_235E61640();
  __break(1u);
  return result;
}

uint64_t sub_235E4FE98(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C90);
  v38 = a2;
  v6 = sub_235E61628();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v11)
        goto LABEL_33;
      v25 = *(_QWORD *)(v37 + 8 * v14);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v14 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v25 = *(_QWORD *)(v37 + 8 * v14);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v14 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = (__int128 *)(*(_QWORD *)(v5 + 56) + 32 * v22);
    v39 = *v34;
    v40 = v34[1];
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_235E6173C();
    sub_235E61064();
    result = sub_235E61754();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v17 == v28;
        if (v17 == v28)
          v17 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v33;
    v19[1] = v32;
    v20 = (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v18);
    *v20 = v39;
    v20[1] = v40;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235E501AC(uint64_t a1, char a2)
{
  return sub_235E501B8(a1, a2, &qword_256386C78);
}

uint64_t sub_235E501B8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
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
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_235E61628();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
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
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_235E6173C();
    sub_235E61064();
    result = sub_235E61754();
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
          goto LABEL_41;
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
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_235E504C0(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C18);
  v37 = a2;
  v6 = sub_235E61628();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_33;
        v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_33;
          v23 = v36[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v34;
              if ((v37 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v23 = v36[v13];
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
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = 8 * v21;
      v30 = *(void **)(*(_QWORD *)(v5 + 48) + v29);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        v32 = v30;
        swift_retain();
      }
      sub_235E6104C();
      sub_235E6173C();
      sub_235E61064();
      v14 = sub_235E61754();
      result = swift_bridgeObjectRelease();
      v15 = -1 << *(_BYTE *)(v7 + 32);
      v16 = v14 & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v30;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v31;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235E507DC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_235E2A174(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_235E513D8();
    v7 = v10;
  }

  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_235E508A0(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_235E508A0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_235E6146C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(void **)(*(_QWORD *)(a2 + 48) + 8 * v6);
        sub_235E6104C();
        sub_235E6173C();
        v10 = v9;
        sub_235E61064();
        v11 = sub_235E61754();

        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (_QWORD *)(v16 + 8 * v3);
          v18 = (_QWORD *)(v16 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= v18 + 1))
          {
            *v17 = *v18;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_235E50A90(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6, double a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t result;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  double *v25;
  char v26;
  uint64_t *v27;
  double *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v8 = v7;
  v16 = *v7;
  v18 = sub_235E5D3E8(a1, a2);
  v19 = *(_QWORD *)(v16 + 16);
  v20 = (v17 & 1) == 0;
  result = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v22 = v17;
  v23 = *(_QWORD *)(v16 + 24);
  if (v23 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v23 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_235E50EC8();
LABEL_7:
    v24 = (_QWORD *)*v8;
    if ((v22 & 1) != 0)
    {
LABEL_8:
      v25 = (double *)(v24[7] + 32 * v18);
      *v25 = a4;
      v25[1] = a5;
      v25[2] = a6;
      v25[3] = a7;
      return result;
    }
LABEL_11:
    v24[(v18 >> 6) + 8] |= 1 << v18;
    v27 = (uint64_t *)(v24[6] + 16 * v18);
    *v27 = a1;
    v27[1] = a2;
    v28 = (double *)(v24[7] + 32 * v18);
    *v28 = a4;
    v28[1] = a5;
    v28[2] = a6;
    v28[3] = a7;
    v29 = v24[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v24[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_235E4FE98(result, a3 & 1);
  result = sub_235E5D3E8(a1, a2);
  if ((v22 & 1) == (v26 & 1))
  {
    v18 = result;
    v24 = (_QWORD *)*v8;
    if ((v22 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_235E61700();
  __break(1u);
  return result;
}

void sub_235E50C0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_235E5D3E8(a2, a3);
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
    sub_235E51230(&qword_256386CA8);
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
  sub_235E501B8(v15, a4 & 1, &qword_256386CA8);
  v20 = sub_235E5D3E8(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_235E61700();
  __break(1u);
}

id sub_235E50D78(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_235E2A174((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_235E513D8();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_release();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_235E504C0(v12, a3 & 1);
  v18 = sub_235E2A174((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for WFStaccatoActionSectionIdentifier(0);
  result = (id)sub_235E61700();
  __break(1u);
  return result;
}

void *sub_235E50EC8()
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
  __int128 *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C90);
  v2 = *v0;
  v3 = sub_235E6161C();
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
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = (__int128 *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v23 = *v21;
    v24 = v21[1];
    *v22 = v19;
    v22[1] = v18;
    v25 = (_OWORD *)(*(_QWORD *)(v4 + 56) + v20);
    *v25 = v23;
    v25[1] = v24;
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_235E5107C()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C40);
  v2 = *v0;
  v3 = sub_235E6161C();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_235E51224()
{
  return sub_235E51230(&qword_256386C78);
}

id sub_235E51230(uint64_t *a1)
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_235E6161C();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_235E513D8()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386C18);
  v2 = *v0;
  v3 = sub_235E6161C();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_235E51580(_QWORD *a1)
{
  return sub_235E4F704(0, a1[2], 0, a1);
}

void sub_235E51594(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235E52708(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v4[0] = v2 + 32;
  v4[1] = v3;
  sub_235E515FC(v4);
  *a1 = v2;
}

void sub_235E515FC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char v29;
  char v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  char v53;
  __int128 v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  char v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  unint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void **v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  char v128;

  v3 = a1[1];
  v4 = sub_235E616C4();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_131;
    if (v3)
      sub_235E51E24(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_139;
  v115 = v4;
  v113 = a1;
  if (v3 < 2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v123 = (void **)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v10 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v9 = (char *)MEMORY[0x24BEE4AF8];
LABEL_98:
      v118 = v7;
      if (v10 >= 2)
      {
        v105 = *v113;
        do
        {
          v106 = v10 - 2;
          if (v10 < 2)
            goto LABEL_126;
          if (!v105)
            goto LABEL_138;
          v107 = v9;
          v108 = v9 + 32;
          v109 = *(_QWORD *)&v9[16 * v106 + 32];
          v110 = *(_QWORD *)&v9[16 * v10 + 24];
          sub_235E51F7C((void **)(v105 + 24 * v109), (void **)(v105 + 24 * *(_QWORD *)&v108[16 * v10 - 16]), v105 + 24 * v110, v123);
          if (v1)
            break;
          if (v110 < v109)
            goto LABEL_127;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v107 = sub_235E524D8((uint64_t)v107);
          if (v106 >= *((_QWORD *)v107 + 2))
            goto LABEL_128;
          v111 = &v107[16 * v106 + 32];
          *(_QWORD *)v111 = v109;
          *((_QWORD *)v111 + 1) = v110;
          v112 = *((_QWORD *)v107 + 2);
          if (v10 > v112)
            goto LABEL_129;
          v9 = v107;
          memmove(&v107[16 * v10 + 16], &v107[16 * v10 + 32], 16 * (v112 - v10));
          *((_QWORD *)v107 + 2) = v112 - 1;
          v10 = v112 - 1;
        }
        while (v112 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v118 + 16) = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_235E610DC();
    *(_QWORD *)(v7 + 16) = v6;
    v123 = (void **)(v7 + 32);
  }
  v118 = v7;
  v8 = 0;
  v126 = *a1;
  v114 = *a1 + 64;
  v9 = (char *)MEMORY[0x24BEE4AF8];
  v121 = v3;
  while (1)
  {
    v11 = v8 + 1;
    v120 = v8;
    if (v8 + 1 >= v3)
    {
      v12 = v126;
    }
    else
    {
      v116 = v9;
      v12 = v126;
      v13 = v126 + 24 * v11;
      v15 = *(id *)v13;
      v14 = *(_QWORD *)(v13 + 8);
      v16 = v126 + 24 * v8;
      v17 = *(void **)v16;
      v18 = *(_QWORD *)(v16 + 8);
      v19 = *(_BYTE *)(v13 + 16);
      v20 = *(_BYTE *)(v16 + 16);
      sub_235E34E50(*(id *)v13, v14, v19);
      sub_235E34E50(v17, v18, v20);
      sub_235E5D908((uint64_t)v15, v14, v19);
      v127 = v21;
      sub_235E34EA4(v17, v18, v20);
      v22 = v14;
      v3 = v121;
      sub_235E34EA4(v15, v22, v19);
      v11 = v8 + 2;
      if (v8 + 2 < v121)
      {
        v23 = (char *)(v114 + 24 * v8);
        while (1)
        {
          v24 = v11;
          v25 = (void *)*((_QWORD *)v23 - 2);
          v26 = *((_QWORD *)v23 - 1);
          v27 = (void *)*((_QWORD *)v23 - 5);
          v28 = *((_QWORD *)v23 - 4);
          v29 = *v23;
          v30 = *(v23 - 24);
          sub_235E34E50(v25, v26, *v23);
          sub_235E34E50(v27, v28, v30);
          sub_235E5D908((uint64_t)v25, v26, v29);
          v32 = v31;
          sub_235E34EA4(v27, v28, v30);
          sub_235E34EA4(v25, v26, v29);
          if (((v127 ^ v32) & 1) != 0)
            break;
          v23 += 24;
          v11 = v24 + 1;
          v3 = v121;
          if (v121 == v24 + 1)
          {
            v11 = v121;
            v12 = v126;
            goto LABEL_23;
          }
        }
        v3 = v121;
        v12 = v126;
        v11 = v24;
LABEL_23:
        v8 = v120;
      }
      v9 = v116;
      if ((v127 & 1) != 0)
      {
        if (v11 < v8)
          goto LABEL_132;
        if (v8 < v11)
        {
          v33 = 24 * v11;
          v34 = 24 * v8;
          v35 = v11;
          v36 = v8;
          do
          {
            if (v36 != --v35)
            {
              if (!v12)
                goto LABEL_137;
              v37 = v12 + v34;
              v38 = v12 + v33;
              v39 = *(_BYTE *)(v12 + v34 + 16);
              v40 = *(_OWORD *)(v12 + v34);
              v41 = *(_QWORD *)(v12 + v33 - 8);
              *(_OWORD *)v37 = *(_OWORD *)(v12 + v33 - 24);
              *(_QWORD *)(v37 + 16) = v41;
              *(_OWORD *)(v38 - 24) = v40;
              *(_BYTE *)(v38 - 8) = v39;
            }
            ++v36;
            v33 -= 24;
            v34 += 24;
          }
          while (v36 < v35);
        }
      }
    }
    if (v11 < v3)
    {
      if (__OFSUB__(v11, v8))
        goto LABEL_130;
      if (v11 - v8 < v115)
        break;
    }
LABEL_49:
    if (v11 < v8)
      goto LABEL_125;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_235E52328(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v56 = *((_QWORD *)v9 + 2);
    v55 = *((_QWORD *)v9 + 3);
    v10 = v56 + 1;
    if (v56 >= v55 >> 1)
      v9 = sub_235E52328((char *)(v55 > 1), v56 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v10;
    v57 = v9 + 32;
    v58 = &v9[16 * v56 + 32];
    *(_QWORD *)v58 = v8;
    *((_QWORD *)v58 + 1) = v11;
    v125 = v11;
    if (v56)
    {
      while (1)
      {
        v59 = v10 - 1;
        if (v10 >= 4)
        {
          v64 = &v57[16 * v10];
          v65 = *((_QWORD *)v64 - 8);
          v66 = *((_QWORD *)v64 - 7);
          v70 = __OFSUB__(v66, v65);
          v67 = v66 - v65;
          if (v70)
            goto LABEL_114;
          v69 = *((_QWORD *)v64 - 6);
          v68 = *((_QWORD *)v64 - 5);
          v70 = __OFSUB__(v68, v69);
          v62 = v68 - v69;
          v63 = v70;
          if (v70)
            goto LABEL_115;
          v71 = v10 - 2;
          v72 = &v57[16 * v10 - 32];
          v74 = *(_QWORD *)v72;
          v73 = *((_QWORD *)v72 + 1);
          v70 = __OFSUB__(v73, v74);
          v75 = v73 - v74;
          if (v70)
            goto LABEL_117;
          v70 = __OFADD__(v62, v75);
          v76 = v62 + v75;
          if (v70)
            goto LABEL_120;
          if (v76 >= v67)
          {
            v94 = &v57[16 * v59];
            v96 = *(_QWORD *)v94;
            v95 = *((_QWORD *)v94 + 1);
            v70 = __OFSUB__(v95, v96);
            v97 = v95 - v96;
            if (v70)
              goto LABEL_124;
            v87 = v62 < v97;
            goto LABEL_86;
          }
        }
        else
        {
          if (v10 != 3)
          {
            v88 = *((_QWORD *)v9 + 4);
            v89 = *((_QWORD *)v9 + 5);
            v70 = __OFSUB__(v89, v88);
            v81 = v89 - v88;
            v82 = v70;
            goto LABEL_80;
          }
          v61 = *((_QWORD *)v9 + 4);
          v60 = *((_QWORD *)v9 + 5);
          v70 = __OFSUB__(v60, v61);
          v62 = v60 - v61;
          v63 = v70;
        }
        if ((v63 & 1) != 0)
          goto LABEL_116;
        v71 = v10 - 2;
        v77 = &v57[16 * v10 - 32];
        v79 = *(_QWORD *)v77;
        v78 = *((_QWORD *)v77 + 1);
        v80 = __OFSUB__(v78, v79);
        v81 = v78 - v79;
        v82 = v80;
        if (v80)
          goto LABEL_119;
        v83 = &v57[16 * v59];
        v85 = *(_QWORD *)v83;
        v84 = *((_QWORD *)v83 + 1);
        v70 = __OFSUB__(v84, v85);
        v86 = v84 - v85;
        if (v70)
          goto LABEL_122;
        if (__OFADD__(v81, v86))
          goto LABEL_123;
        if (v81 + v86 >= v62)
        {
          v87 = v62 < v86;
LABEL_86:
          if (v87)
            v59 = v71;
          goto LABEL_88;
        }
LABEL_80:
        if ((v82 & 1) != 0)
          goto LABEL_118;
        v90 = &v57[16 * v59];
        v92 = *(_QWORD *)v90;
        v91 = *((_QWORD *)v90 + 1);
        v70 = __OFSUB__(v91, v92);
        v93 = v91 - v92;
        if (v70)
          goto LABEL_121;
        if (v93 < v81)
          goto LABEL_14;
LABEL_88:
        v98 = v59 - 1;
        if (v59 - 1 >= v10)
        {
          __break(1u);
LABEL_111:
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
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
          goto LABEL_134;
        }
        if (!v126)
          goto LABEL_136;
        v99 = v9;
        v100 = &v57[16 * v98];
        v101 = *(_QWORD *)v100;
        v102 = &v57[16 * v59];
        v103 = *((_QWORD *)v102 + 1);
        sub_235E51F7C((void **)(v126 + 24 * *(_QWORD *)v100), (void **)(v126 + 24 * *(_QWORD *)v102), v126 + 24 * v103, v123);
        if (v1)
          goto LABEL_109;
        if (v103 < v101)
          goto LABEL_111;
        if (v59 > *((_QWORD *)v99 + 2))
          goto LABEL_112;
        *(_QWORD *)v100 = v101;
        *(_QWORD *)&v57[16 * v98 + 8] = v103;
        v104 = *((_QWORD *)v99 + 2);
        if (v59 >= v104)
          goto LABEL_113;
        v9 = v99;
        v10 = v104 - 1;
        memmove(&v57[16 * v59], v102 + 16, 16 * (v104 - 1 - v59));
        *((_QWORD *)v99 + 2) = v104 - 1;
        if (v104 <= 2)
          goto LABEL_14;
      }
    }
    v10 = 1;
LABEL_14:
    v3 = v121;
    v8 = v125;
    v7 = v118;
    if (v125 >= v121)
      goto LABEL_98;
  }
  v42 = v8 + v115;
  if (__OFADD__(v8, v115))
    goto LABEL_133;
  if (v42 >= v3)
    v42 = v3;
  if (v42 >= v8)
  {
    if (v11 != v42)
    {
      v117 = v9;
      v43 = v12 + 24 * v11;
      v119 = v42;
      do
      {
        v122 = v43;
        v45 = v43;
        v124 = v11;
        while (1)
        {
          v46 = *(id *)v43;
          v47 = *(_QWORD *)(v43 + 8);
          v48 = *(void **)(v45 - 24);
          v45 -= 24;
          v49 = *(_QWORD *)(v43 - 16);
          v50 = *(_BYTE *)(v43 + 16);
          v51 = *(_BYTE *)(v43 - 8);
          sub_235E34E50(*(id *)v43, v47, v50);
          sub_235E34E50(v48, v49, v51);
          sub_235E5D908((uint64_t)v46, v47, v50);
          v128 = v52;
          sub_235E34EA4(v48, v49, v51);
          sub_235E34EA4(v46, v47, v50);
          if ((v128 & 1) == 0)
            break;
          v44 = v124;
          if (!v126)
            goto LABEL_135;
          v53 = *(_BYTE *)(v43 + 16);
          v54 = *(_OWORD *)v43;
          *(_OWORD *)v43 = *(_OWORD *)v45;
          *(_QWORD *)(v43 + 16) = *(_QWORD *)(v45 + 16);
          *(_OWORD *)(v43 - 24) = v54;
          *(_BYTE *)(v43 - 8) = v53;
          ++v8;
          v43 = v45;
          if (v124 == v8)
            goto LABEL_42;
        }
        v44 = v124;
LABEL_42:
        v11 = v44 + 1;
        v43 = v122 + 24;
        v8 = v120;
      }
      while (v11 != v119);
      v11 = v119;
      v9 = v117;
    }
    goto LABEL_49;
  }
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
  sub_235E615EC();
  __break(1u);
}

void sub_235E51E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  char v14;
  __int128 v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v20 = a3;
  if (a3 != a2)
  {
    v19 = *a4;
    v4 = *a4 + 24 * a3;
LABEL_5:
    v5 = a1;
    v18 = v4;
    v6 = v4;
    while (1)
    {
      v7 = *(id *)v4;
      v8 = *(_QWORD *)(v4 + 8);
      v9 = *(void **)(v6 - 24);
      v6 -= 24;
      v10 = *(_QWORD *)(v4 - 16);
      v11 = *(_BYTE *)(v4 + 16);
      v12 = *(_BYTE *)(v4 - 8);
      sub_235E34E50(*(id *)v4, v8, v11);
      sub_235E34E50(v9, v10, v12);
      sub_235E5D908((uint64_t)v7, v8, v11);
      v21 = v13;
      sub_235E34EA4(v9, v10, v12);
      sub_235E34EA4(v7, v8, v11);
      if ((v21 & 1) == 0)
      {
LABEL_4:
        v4 = v18 + 24;
        if (++v20 == a2)
          return;
        goto LABEL_5;
      }
      if (!v19)
        break;
      v14 = *(_BYTE *)(v4 + 16);
      v15 = *(_OWORD *)v4;
      *(_OWORD *)v4 = *(_OWORD *)v6;
      *(_QWORD *)(v4 + 16) = *(_QWORD *)(v6 + 16);
      *(_OWORD *)(v4 - 24) = v15;
      *(_BYTE *)(v4 - 8) = v14;
      ++v5;
      v4 = v6;
      if (v20 == v5)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_235E51F7C(void **__src, void **a2, unint64_t a3, void **__dst)
{
  void **v4;
  void **v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  void **v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  void **v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  __int128 v34;
  __int128 v35;
  uint64_t result;
  void **v37;
  void **v38;
  char v39;
  void **v40;
  char *v41;
  void **v43;
  void **v44;
  void **v45;
  void **v46;
  void **v47;
  void **v48;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = ((char *)a2 - (char *)__src) / 24;
  v9 = a3 - (_QWORD)a2;
  v10 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  v48 = __src;
  v47 = __dst;
  if (v8 >= v10)
  {
    if (v9 >= -23)
    {
      v23 = 3 * v10;
      if (__dst != a2 || &a2[v23] <= __dst)
        memmove(__dst, a2, 24 * v10);
      v37 = v4;
      v38 = v6;
      v24 = (char *)&v4[v23];
      v46 = &v4[v23];
      v48 = v5;
      if (v6 < v5 && v9 >= 24)
      {
        v25 = a3 - 24;
        v26 = v5;
        do
        {
          v45 = v5;
          v41 = v24;
          v43 = (void **)(v25 + 24);
          v27 = (void *)*((_QWORD *)v24 - 3);
          v28 = *((_QWORD *)v24 - 2);
          v24 -= 24;
          v29 = *(v26 - 3);
          v30 = (uint64_t)*(v26 - 2);
          v26 -= 3;
          v31 = v24[16];
          v32 = *((_BYTE *)v26 + 16);
          sub_235E34E50(v27, v28, v31);
          sub_235E34E50(v29, v30, v32);
          sub_235E5D908((uint64_t)v27, v28, v31);
          v39 = v33;
          sub_235E34EA4(v29, v30, v32);
          sub_235E34EA4(v27, v28, v31);
          if ((v39 & 1) != 0)
          {
            v24 = v41;
            if (v43 != v45 || v25 >= (unint64_t)v45)
            {
              v34 = *(_OWORD *)v26;
              *(_QWORD *)(v25 + 16) = v26[2];
              *(_OWORD *)v25 = v34;
            }
            v48 = v26;
          }
          else
          {
            v46 = (void **)v24;
            v26 = v45;
            if (v43 < (void **)v41 || v25 >= (unint64_t)v41 || v43 != (void **)v41)
            {
              v35 = *(_OWORD *)v24;
              *(_QWORD *)(v25 + 16) = *((_QWORD *)v24 + 2);
              *(_OWORD *)v25 = v35;
            }
          }
          if (v26 <= v38)
            break;
          v25 -= 24;
          v5 = v26;
        }
        while (v24 > (char *)v37);
      }
      goto LABEL_37;
    }
  }
  else if (v7 >= -23)
  {
    v11 = 3 * v8;
    if (__dst != __src || &__src[v11] <= __dst)
      memmove(__dst, __src, v11 * 8);
    v40 = &v4[v11];
    v46 = &v4[v11];
    if ((unint64_t)v5 < a3 && v7 >= 24)
    {
      do
      {
        v44 = v5;
        v12 = *v5;
        v13 = (uint64_t)v5[1];
        v14 = *v4;
        v15 = (uint64_t)v4[1];
        v16 = *((_BYTE *)v5 + 16);
        v17 = *((_BYTE *)v4 + 16);
        sub_235E34E50(v12, v13, v16);
        sub_235E34E50(v14, v15, v17);
        sub_235E5D908((uint64_t)v12, v13, v16);
        v19 = v18;
        sub_235E34EA4(v14, v15, v17);
        sub_235E34EA4(v12, v13, v16);
        if ((v19 & 1) != 0)
        {
          v20 = v44 + 3;
          if (v6 < v44 || v6 >= v20 || v6 != v44)
          {
            v21 = *(_OWORD *)v44;
            v6[2] = v44[2];
            *(_OWORD *)v6 = v21;
          }
        }
        else
        {
          if (v6 != v4)
          {
            v22 = *(_OWORD *)v4;
            v6[2] = v4[2];
            *(_OWORD *)v6 = v22;
          }
          v4 += 3;
          v47 = v4;
          v20 = v44;
        }
        v6 += 3;
        if (v4 >= v40)
          break;
        v5 = v20;
      }
      while ((unint64_t)v20 < a3);
      v48 = v6;
    }
LABEL_37:
    sub_235E52420((void **)&v48, (const void **)&v47, &v46);
    return 1;
  }
  result = sub_235E61640();
  __break(1u);
  return result;
}

char *sub_235E52328(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386DB0);
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

char *sub_235E52420(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  size_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -24)
  {
    result = (char *)sub_235E61640();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = 24 * (v4 / 24);
    if (result != v3 || result >= &v3[v6])
      return (char *)memmove(result, v3, v6);
  }
  return result;
}

char *sub_235E524D8(uint64_t a1)
{
  return sub_235E52328(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235E524EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_235E29CC0(&qword_256386C30, &qword_256385808, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256385808);
          v12 = sub_235E299B0(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_235E26AC8(0, &qword_256385638);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_235E61640();
  __break(1u);
  return result;
}

uint64_t sub_235E52708(uint64_t a1)
{
  return sub_235E4FA34(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_235E5271C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  __CFString *v15;

  v3 = v2;
  v6 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CC8);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CD0);
  swift_allocObject();
  *(_QWORD *)(v7 + 24) = sub_235E60B9C();
  *(_QWORD *)(v2 + 16) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CD8);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_BYTE *)(v8 + 32) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CE0);
  swift_allocObject();
  *(_QWORD *)(v8 + 40) = sub_235E60B9C();
  *(_QWORD *)(v2 + 24) = v8;
  v9 = MEMORY[0x24BEE4AF8];
  v10 = sub_235E273AC(MEMORY[0x24BEE4AF8], &qword_256386C40, (uint64_t (*)(id))sub_235E277B4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CE8);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CF0);
  swift_allocObject();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v11 + 24) = sub_235E60B9C();
  *(_QWORD *)(v3 + 32) = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256385AF0);
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385AB8);
  swift_allocObject();
  *(_QWORD *)(v12 + 24) = sub_235E60B9C();
  v13 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v3 + 40) = v12;
  *(_QWORD *)(v3 + 48) = v13;
  *(_QWORD *)(v3 + 56) = 0;
  v14 = 0;
  *(_QWORD *)(v3 + 64) = sub_235E49084(v9);
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = a1;
  if ((a2 & 1) == 0)
  {
    v14 = CFSTR("SilentMode");
    v15 = CFSTR("SilentMode");
  }
  *(_QWORD *)(v3 + 88) = v14;
  *(_BYTE *)(v3 + 96) = v6;
  swift_retain();
  sub_235E49614();
  return v3;
}

uint64_t sub_235E5292C(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    __asm { BR              X8 }
  return 0;
}

uint64_t sub_235E52AFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_235E61640();
  __break(1u);
  return result;
}

id sub_235E52BF0(id result, uint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_235E34E50(result, a2, a3);
  return result;
}

void sub_235E52C04(void *a1, uint64_t a2, char a3)
{
  if (a3 != -1)
    sub_235E34EA4(a1, a2, a3);
}

uint64_t sub_235E52C18()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_235E52C40(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_235E4CBCC(*(void **)(v1 + 24), a1);
}

void sub_235E52C4C(uint64_t *a1)
{
  uint64_t v1;

  sub_235E4D9D4(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235E52C58(uint64_t a1)
{
  uint64_t v1;

  return sub_235E4E424(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235E52C64()
{
  uint64_t v0;

  return sub_235E4E674(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235E52C6C(uint64_t a1)
{
  uint64_t v1;

  return sub_235E4EA6C(a1, v1);
}

uint64_t sub_235E52C74()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E52CB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[7];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_235E52D50;
  v5[5] = v4;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2563868D0 + dword_2563868D0);
  v6 = (_QWORD *)swift_task_alloc();
  v5[6] = v6;
  *v6 = v5;
  v6[1] = sub_235E4F2A8;
  return v8(v2, v3);
}

uint64_t sub_235E52D50()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_235E52D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_235E52DE0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_235E52DF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563868A8;
  if (!qword_2563868A8)
  {
    v1 = sub_235E26AC8(255, (unint64_t *)&qword_2563859F0);
    result = MEMORY[0x23B7E3CE0](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_2563868A8);
  }
  return result;
}

uint64_t sub_235E52E48@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235E4A838(a1, v2, a2);
}

uint64_t sub_235E52E50(uint64_t a1, unsigned __int8 *a2, int a3)
{
  return sub_235E4B0C0(a1, a2, a3);
}

uint64_t sub_235E52E58()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E52E7C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_235E52ED8(id result, char a2)
{
  if (a2 != -1)
    return result;
  return result;
}

uint64_t sub_235E52EEC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_235E4AD40(a1, v2, a2);
}

uint64_t static Logger.subsystem.getter()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = qword_256386DB8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static Logger.subsystem.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  qword_256386DB8 = a1;
  qword_256386DC0 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Logger.subsystem.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2563854D0 != -1)
    swift_once();
  v2 = sub_235E60AA0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256386DC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id sub_235E53058(void *a1)
{
  char *v1;
  char *v3;
  objc_class *v4;
  id v5;
  objc_super v7;

  swift_unknownObjectWeakInit();
  v3 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler];
  v4 = (objc_class *)type metadata accessor for ShortcutsConfigurationViewController();
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v7.receiver = v1;
  v7.super_class = v4;
  v5 = objc_msgSendSuper2(&v7, sel_initWithConfigurationContext_, a1);
  objc_msgSend(v5, sel_setDelegate_, v5);

  return v5;
}

void sub_235E531AC(char a1)
{
  char *v1;
  char *v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v2 = v1;
  v15.receiver = v2;
  v15.super_class = (Class)type metadata accessor for ShortcutsConfigurationViewController();
  objc_msgSendSuper2(&v15, sel_viewWillAppear_, a1 & 1);
  v4 = (void *)MEMORY[0x23B7E3E6C](&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_presenter]);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_view);

    if (!v6)
    {
      __break(1u);
      return;
    }
    v7 = objc_msgSend(v6, sel_window);

    v8 = objc_msgSend(v7, sel__rootSheetPresentationController);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, sel__setShouldScaleDownBehindDescendantSheets_, 1);

  objc_msgSend(v2, sel_setOverrideUserInterfaceStyle_, 2);
  v9 = objc_msgSend(v2, sel_sheetPresentationController);
  if (v9)
  {
    v10 = v9;
    sub_235E6128C();

  }
  v11 = objc_msgSend(v2, sel_sheetPresentationController);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel__setGrabberTopSpacing_, 10.0);

  }
  v13 = objc_msgSend(v2, sel_sheetPresentationController);
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, sel__setAdditionalMinimumTopInset_, -6.0);

  }
}

void sub_235E53378(char a1)
{
  char *v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ShortcutsConfigurationViewController();
  objc_msgSendSuper2(&v8, sel_viewDidDisappear_, a1 & 1);
  v3 = (void *)MEMORY[0x23B7E3E6C](&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_presenter]);
  if (!v3)
  {
    v7 = 0;
    goto LABEL_5;
  }
  v4 = v3;
  v5 = objc_msgSend(v3, sel_view);

  if (v5)
  {
    v6 = objc_msgSend(v5, sel_window);

    v7 = objc_msgSend(v6, sel__rootSheetPresentationController);
LABEL_5:
    objc_msgSend(v7, sel__setShouldScaleDownBehindDescendantSheets_, 0);

    return;
  }
  __break(1u);
}

id sub_235E53510()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShortcutsConfigurationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ShortcutsConfigurationViewController()
{
  return objc_opt_self();
}

void sub_235E5359C(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void *, uint64_t);
  id v6;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = v2;
  v4 = *(void (**)(void *, uint64_t))(v2
                                              + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_completionHandler);
  if (a1)
  {
    if (v4)
    {
      v6 = a1;
      sub_235E34C94((uint64_t)v4);
      v4(a1, 0);
      sub_235E34DD0((uint64_t)v4);

    }
  }
  else if (v4)
  {
    if (a2)
    {
      v8 = a2;
    }
    else
    {
      sub_235E536DC();
      v8 = (void *)swift_allocError();
    }
    sub_235E34C94((uint64_t)v4);
    v9 = a2;
    v4(v8, 1);
    sub_235E34DD0((uint64_t)v4);

  }
  v10 = (void *)MEMORY[0x23B7E3E6C](v3 + OBJC_IVAR____TtC27ActionButtonConfigurationUI36ShortcutsConfigurationViewController_presenter);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

unint64_t sub_235E536DC()
{
  unint64_t result;

  result = qword_256386E78;
  if (!qword_256386E78)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63D64, &type metadata for ShortcutsConfigurationViewController.Errors);
    atomic_store(result, (unint64_t *)&qword_256386E78);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ShortcutsConfigurationViewController.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235E53760 + 4 * byte_235E63CC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235E53780 + 4 * byte_235E63CC5[v4]))();
}

_BYTE *sub_235E53760(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235E53780(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E53788(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E53790(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235E53798(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235E537A0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ShortcutsConfigurationViewController.Errors()
{
  return &type metadata for ShortcutsConfigurationViewController.Errors;
}

unint64_t sub_235E537C0()
{
  unint64_t result;

  result = qword_256386E80;
  if (!qword_256386E80)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63D3C, &type metadata for ShortcutsConfigurationViewController.Errors);
    atomic_store(result, (unint64_t *)&qword_256386E80);
  }
  return result;
}

void *sub_235E53804(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_235E274BC((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_235E615BC();

  if (!v4)
    return 0;
  sub_235E26AC8(0, (unint64_t *)&qword_256385650);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_235E538D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v33 = a4;
  v34 = a7;
  v32 = a3;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386828);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387238);
  v37 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387240);
  v38 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E4569C(a6, (uint64_t)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = (*(unsigned __int8 *)(v15 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = a1;
  v22[3] = a2;
  v23 = v33;
  v22[4] = v32;
  v22[5] = v23;
  v22[6] = a5;
  sub_235E590C0((uint64_t)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v22 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256387248);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = (void *)sub_235E60BE4();
  v39 = v34;
  v40 = v24;
  v25 = sub_235E611CC();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v26(v13, 1, 1, v25);
  sub_235E26AC8(0, (unint64_t *)&qword_2563859F0);
  sub_235E29CC0(&qword_256387250, &qword_256387248, MEMORY[0x24BDB9E58]);
  sub_235E48C20((unint64_t *)&qword_2563868A8, (unint64_t *)&qword_2563859F0, 0x24BDAC4D0, MEMORY[0x24BEE5670]);
  sub_235E60CBC();
  sub_235E30A00((uint64_t)v13, &qword_256386828);
  swift_release();
  v40 = (id)sub_235E611FC();
  v26(v13, 1, 1, v25);
  sub_235E29CC0(&qword_256387258, &qword_256387238, MEMORY[0x24BDB9548]);
  v27 = v35;
  sub_235E60C98();
  sub_235E30A00((uint64_t)v13, &qword_256386828);

  (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v27);
  sub_235E29CC0(&qword_256387260, &qword_256387240, MEMORY[0x24BDB9A08]);
  v28 = v36;
  v29 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v28);
  return v29;
}

void sub_235E53C60(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void (*v20)(void **);
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void (*v24)(void **);
  id v25;
  _QWORD v26[3];
  void *v27;
  uint64_t v28;
  uint64_t v29;

  v26[0] = a1;
  v26[1] = a2;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_235E60A10();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = a3;
  v28 = a4;
  v29 = a5;
  sub_235E454E4(a8, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_235E30A00((uint64_t)v14, &qword_2563862C0);
    sub_235E45ADC();
    v19 = (void *)swift_allocError();
    swift_willThrow();
    v20 = (void (*)(void **))v26[0];
    v27 = v19;
    LOBYTE(v28) = 1;
    v25 = v19;
    v20(&v27);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    sub_235E60980();
    swift_allocObject();
    sub_235E60974();
    sub_235E59164();
    v21 = sub_235E60968();
    v23 = v22;
    swift_release();
    sub_235E60A40();
    v24 = (void (*)(void **))v26[0];
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    sub_235E58FD4(v21, v23);
    v27 = 0;
    LOBYTE(v28) = 0;
    v24(&v27);
  }
}

uint64_t sub_235E53ED4(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  void *v5;
  id v6;

  result = sub_235E58948(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = (void *)sub_235E593A8(result, v3, 0, a1);
  v6 = v5;
  return (uint64_t)v5;
}

uint64_t sub_235E53F40(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_235E61568();
    v5 = v4;
    v6 = sub_235E615E0();
    v8 = MEMORY[0x23B7E3668](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_235E59E5C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_235E5878C(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_235E59E5C(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_235E58948(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_235E5404C()
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
  uint64_t v12;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  int v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t result;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  _QWORD *v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(char *, uint64_t);
  void (*v170)(char *, uint64_t);
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  char *v178;
  uint64_t v179;
  _QWORD *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  __int16 v186;
  uint64_t v187;
  uint64_t (*v188)();
  uint64_t v189;

  v175 = *v0;
  v154 = sub_235E61238();
  v153 = *(_QWORD *)(v154 - 8);
  MEMORY[0x24BDAC7A8](v154);
  v152 = (char *)&v128 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563870F8);
  MEMORY[0x24BDAC7A8](v156);
  v155 = (char *)&v128 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387100);
  v158 = *(_QWORD *)(v159 - 8);
  MEMORY[0x24BDAC7A8](v159);
  v157 = (char *)&v128 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387108);
  v162 = *(_QWORD *)(v165 - 8);
  MEMORY[0x24BDAC7A8](v165);
  v160 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387110);
  v163 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v161 = (char *)&v128 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387118);
  v167 = *(_QWORD *)(v168 - 8);
  MEMORY[0x24BDAC7A8](v168);
  v164 = (char *)&v128 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387120);
  v130 = *(_QWORD *)(v133 - 8);
  v7 = MEMORY[0x24BDAC7A8](v133);
  v132 = (char *)&v128 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v131 = (char *)&v128 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v129 = (char *)&v128 - v11;
  v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387128);
  v145 = *(_QWORD *)(v144 - 8);
  MEMORY[0x24BDAC7A8](v144);
  v141 = (char *)&v128 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387130);
  v149 = *(_QWORD *)(v147 - 8);
  MEMORY[0x24BDAC7A8](v147);
  v142 = (char *)&v128 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_256387138);
  v148 = *(v150 - 1);
  v14 = MEMORY[0x24BDAC7A8](v150);
  v146 = (char *)&v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v143 = (char *)&v128 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387140);
  v18 = *(_QWORD **)(v17 - 8);
  v179 = v17;
  v180 = v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v174 = (char *)&v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v178 = (char *)&v128 - v21;
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387148);
  v139 = *(_QWORD *)(v140 - 8);
  v22 = MEMORY[0x24BDAC7A8](v140);
  v138 = (char *)&v128 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v137 = (char *)&v128 - v24;
  v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387150);
  v170 = *(void (**)(char *, uint64_t))(v182 - 8);
  MEMORY[0x24BDAC7A8](v182);
  v26 = (char *)&v128 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387158);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v128 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235E43B10();
  v31 = v0[28];
  v183 = *(_QWORD *)(*(_QWORD *)(v31 + 16) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CD0);
  sub_235E29CC0(&qword_256387160, &qword_256386CD0, MEMORY[0x24BDB9D10]);
  v183 = sub_235E60BFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256387168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386D80);
  sub_235E29CC0(&qword_256387170, &qword_256387168, MEMORY[0x24BDB9AF8]);
  sub_235E60C08();
  swift_release();
  swift_allocObject();
  v32 = v0;
  swift_weakInit();
  sub_235E29CC0(&qword_256387178, &qword_256387158, MEMORY[0x24BDB94C8]);
  sub_235E60CF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  v33 = v31;
  v177 = v31;
  v183 = *(_QWORD *)(*(_QWORD *)(v31 + 24) + 40);
  v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_256386CE0);
  v172 = sub_235E29CC0(&qword_256387180, &qword_256386CE0, MEMORY[0x24BDB9D10]);
  v183 = sub_235E60BFC();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387188);
  v35 = sub_235E29CC0(&qword_256387190, &qword_256387188, MEMORY[0x24BDB9AF8]);
  sub_235E60C08();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  v136 = sub_235E29CC0(&qword_256387198, &qword_256387150, MEMORY[0x24BDB94C8]);
  v36 = v182;
  sub_235E60CF8();
  swift_release();
  v37 = (void (*)(char *, uint64_t))*((_QWORD *)v170 + 1);
  v37(v26, v36);
  v170 = v37;
  swift_beginAccess();
  v151 = v0 + 30;
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  v183 = *(_QWORD *)(*(_QWORD *)(v33 + 24) + 40);
  v183 = sub_235E60BFC();
  v176 = v26;
  v173 = v34;
  v171 = v35;
  sub_235E60C08();
  swift_release();
  v38 = swift_allocObject();
  swift_weakInit();
  v39 = swift_allocObject();
  v40 = v175;
  *(_QWORD *)(v39 + 16) = v38;
  *(_QWORD *)(v39 + 24) = v40;
  v41 = v178;
  v42 = v182;
  sub_235E60B3C();
  swift_release();
  v37(v26, v42);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563871A0);
  v43 = swift_allocObject();
  v134 = xmmword_235E637D0;
  *(_OWORD *)(v43 + 16) = xmmword_235E637D0;
  *(_QWORD *)(v43 + 32) = 0;
  *(_QWORD *)(v43 + 40) = 0xE000000000000000;
  *(_QWORD *)(v43 + 48) = 0;
  v44 = MEMORY[0x24BEE4AF8];
  *(_WORD *)(v43 + 56) = 256;
  *(_QWORD *)(v43 + 64) = v44;
  *(_QWORD *)(v43 + 72) = nullsub_1;
  *(_QWORD *)(v43 + 80) = 0;
  sub_235E29CC0(&qword_2563871A8, &qword_256387140, MEMORY[0x24BDB94C8]);
  v45 = v137;
  v46 = v179;
  sub_235E60C8C();
  swift_bridgeObjectRelease();
  v169 = (void (*)(char *, uint64_t))v180[1];
  v169(v41, v46);
  type metadata accessor for ButtonViewModel();
  v47 = swift_allocObject();
  v48 = v139;
  v49 = (uint64_t)v138;
  v50 = v140;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))(v138, v45, v140);
  v51 = sub_235E5851C(v49, v47, &qword_256387148, &qword_256387288, MEMORY[0x24BDB9530], (uint64_t)sub_235E58F88);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v50);
  v32[15] = v51;
  v52 = v32;
  swift_release();
  v53 = v177;
  v183 = *(_QWORD *)(*(_QWORD *)(v177 + 24) + 40);
  v183 = sub_235E60BFC();
  sub_235E60C08();
  swift_release();
  v183 = *(_QWORD *)(*(_QWORD *)(v53 + 32) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386CF0);
  sub_235E29CC0(&qword_2563871B0, &qword_256386CF0, MEMORY[0x24BDB9D10]);
  v183 = sub_235E60BFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563871B8);
  sub_235E29CC0(&qword_2563871C0, &qword_2563871B8, MEMORY[0x24BDB9AF8]);
  v54 = v141;
  v55 = v182;
  sub_235E60B30();
  v56 = swift_allocObject();
  swift_weakInit();
  v57 = swift_allocObject();
  v58 = v175;
  *(_QWORD *)(v57 + 16) = v56;
  *(_QWORD *)(v57 + 24) = v58;
  v59 = swift_allocObject();
  *(_QWORD *)(v59 + 16) = sub_235E586CC;
  *(_QWORD *)(v59 + 24) = v57;
  sub_235E29CC0(&qword_2563871C8, &qword_256387128, MEMORY[0x24BDB9450]);
  v60 = v142;
  v61 = v144;
  sub_235E60C38();
  swift_release();
  (*(void (**)(char *, uint64_t))(v145 + 8))(v54, v61);
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = v134;
  *(_QWORD *)(v62 + 32) = 0;
  *(_QWORD *)(v62 + 40) = 0xE000000000000000;
  *(_QWORD *)(v62 + 48) = 0;
  *(_WORD *)(v62 + 56) = 256;
  v63 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v62 + 64) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v62 + 72) = nullsub_1;
  *(_QWORD *)(v62 + 80) = 0;
  sub_235E29CC0(&qword_2563871D0, &qword_256387130, MEMORY[0x24BDB96C0]);
  v64 = v143;
  v65 = v147;
  sub_235E60C8C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v149 + 8))(v60, v65);
  v66 = swift_allocObject();
  v67 = v148;
  v68 = (uint64_t)v146;
  v69 = v150;
  (*(void (**)(char *, char *, _QWORD *))(v148 + 16))(v146, v64, v150);
  v70 = sub_235E5851C(v68, v66, &qword_256387138, &qword_256387280, MEMORY[0x24BDB9530], (uint64_t)sub_235E58F88);
  (*(void (**)(char *, _QWORD *))(v67 + 8))(v64, v69);
  v52[16] = v70;
  swift_release();
  v183 = *(_QWORD *)(*(_QWORD *)(v177 + 24) + 40);
  v183 = sub_235E60BFC();
  v71 = v176;
  sub_235E60C08();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  v72 = v178;
  sub_235E60B3C();
  swift_release();
  v170(v71, v55);
  v73 = swift_allocObject();
  v74 = v179;
  v75 = (void (*)(char *, char *, uint64_t))v180[2];
  v76 = (uint64_t)v174;
  v75(v174, v72, v179);
  v77 = sub_235E5851C(v76, v73, &qword_256387140, &qword_2563871A8, MEMORY[0x24BDB94C8], (uint64_t)sub_235E58F88);
  v169(v72, v74);
  v52[17] = v77;
  swift_release();
  v180 = v52;
  v78 = *((unsigned __int8 *)v52 + 176);
  if ((v78 & 1) == 0)
  {
    v150 = v75;
    LODWORD(v175) = v78;
    if (qword_256385470 != -1)
      swift_once();
    v79 = (id)qword_256387470;
    v80 = sub_235E609A4();
    v82 = v81;

    v83 = swift_allocObject();
    v84 = v180;
    swift_weakInit();
    v183 = v80;
    v184 = v82;
    v185 = 0;
    v186 = 1;
    v187 = v63;
    v188 = sub_235E58F60;
    v189 = v83;
    v85 = v129;
    sub_235E60BCC();
    v86 = swift_allocObject();
    v87 = v130;
    v88 = *(void (**)(char *, char *, uint64_t))(v130 + 16);
    v89 = (uint64_t)v131;
    v90 = v133;
    v88(v131, v85, v133);
    v91 = sub_235E5851C(v89, v86, &qword_256387120, &qword_256387218, MEMORY[0x24BDB9DF8], (uint64_t)sub_235E58F88);
    v92 = *(void (**)(char *, uint64_t))(v87 + 8);
    v92(v85, v90);
    v84[12] = v91;
    swift_release();
    v93 = (id)qword_256387470;
    v94 = sub_235E609A4();
    v96 = v95;

    v97 = swift_allocObject();
    swift_weakInit();
    v183 = v94;
    v184 = v96;
    v185 = 0;
    v186 = 1;
    v187 = MEMORY[0x24BEE4AF8];
    v188 = sub_235E58F68;
    v189 = v97;
    v98 = v132;
    sub_235E60BCC();
    v99 = swift_allocObject();
    v88((char *)v89, v98, v90);
    v100 = sub_235E5851C(v89, v99, &qword_256387120, &qword_256387218, MEMORY[0x24BDB9DF8], (uint64_t)sub_235E58F88);
    v92(v98, v90);
    v84[13] = v100;
    swift_release();
    v183 = *(_QWORD *)(*(_QWORD *)(v177 + 24) + 40);
    v183 = sub_235E60BFC();
    v101 = v176;
    sub_235E60C08();
    swift_release();
    swift_allocObject();
    swift_weakInit();
    v102 = v178;
    v103 = v182;
    sub_235E60B3C();
    swift_release();
    v170(v101, v103);
    v104 = swift_allocObject();
    v105 = (uint64_t)v174;
    v106 = v179;
    ((void (*)(char *, char *, uint64_t))v150)(v174, v102, v179);
    v107 = sub_235E5851C(v105, v104, &qword_256387140, &qword_2563871A8, MEMORY[0x24BDB94C8], (uint64_t)sub_235E58F88);
    v169(v102, v106);
    v84[14] = v107;
    swift_release();
    v78 = v175;
  }
  v108 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v109 = v152;
  sub_235E61244();

  sub_235E2B7F4((unint64_t *)&qword_256386698, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0078], MEMORY[0x24BDD0070]);
  v110 = v154;
  sub_235E60C38();
  (*(void (**)(char *, uint64_t))(v153 + 8))(v109, v110);
  v183 = v180[5];
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256386678);
  sub_235E29CC0(&qword_2563871D8, &qword_2563870F8, MEMORY[0x24BDB96C0]);
  sub_235E29CC0(&qword_256386680, &qword_256386678, MEMORY[0x24BDB9CB0]);
  v111 = v157;
  sub_235E60B48();
  v112 = swift_allocObject();
  swift_weakInit();
  v113 = swift_allocObject();
  *(_QWORD *)(v113 + 16) = sub_235E5875C;
  *(_QWORD *)(v113 + 24) = v112;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563871E0);
  sub_235E29CC0(&qword_2563871E8, &qword_256387100, MEMORY[0x24BDB9798]);
  v114 = v160;
  v115 = v159;
  sub_235E60C08();
  swift_release();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v111, v115);
  sub_235E29CC0(&qword_2563871F0, &qword_256387108, MEMORY[0x24BDB94C8]);
  sub_235E29CC0(&qword_2563871F8, &qword_2563871E0, MEMORY[0x24BDB9AF8]);
  v116 = v161;
  v117 = v165;
  sub_235E60CE0();
  (*(void (**)(char *, uint64_t))(v162 + 8))(v114, v117);
  sub_235E29CC0(&qword_256387200, &qword_256387110, MEMORY[0x24BDB9610]);
  v118 = v164;
  v119 = v166;
  sub_235E60C20();
  (*(void (**)(char *, uint64_t))(v163 + 8))(v116, v119);
  sub_235E29CC0(&qword_256387208, &qword_256387118, MEMORY[0x24BDB9580]);
  v120 = v168;
  sub_235E60C44();
  (*(void (**)(char *, uint64_t))(v167 + 8))(v118, v120);
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  result = swift_release();
  if (v78 && (!*(_QWORD *)(v180[18] + 16) || *(_BYTE *)(v180[19] + 24) == 1))
  {
    result = sub_235E589F8();
    if (v122)
    {
      v124 = v123;
      v125 = v180;
      v126 = v180[18];
      v183 = v122;
      *(_QWORD *)(v126 + 16) = v122;
      swift_bridgeObjectRetain_n();
      swift_retain();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_235E60B90();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      v127 = v125[19];
      v183 = v124;
      LOBYTE(v184) = 0;
      *(_QWORD *)(v127 + 16) = v124;
      *(_BYTE *)(v127 + 24) = 0;
      swift_retain();
      swift_retain();
      sub_235E60B90();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_235E55788(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      sub_235E61544();
      __asm { BR              X8 }
    }
    *(_QWORD *)(*(_QWORD *)(result + 144) + 16) = MEMORY[0x24BEE4AF8];
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_235E60B90();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_235E55B78(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 224) + 16) + 16);
    if (v6)
    {
      swift_bridgeObjectRetain();
      sub_235E34E50(v1, v2, v3);
      v7 = sub_235E593FC(v6);
      v9 = v8;
      sub_235E34EA4(v1, v2, v3);
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
        v10 = 0;
      else
        v10 = v7;
      v11 = *(_QWORD *)(v5 + 152);
      *(_QWORD *)(v11 + 16) = v10;
      *(_BYTE *)(v11 + 24) = 0;
      swift_retain();
      swift_retain();
      sub_235E60B90();
      swift_release();
      swift_release();
      *(_BYTE *)(*(_QWORD *)(v5 + 168) + 16) = 1;
      swift_retain();
      swift_retain();
      sub_235E60B90();
      swift_release();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_235E55CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;

  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 16);
  if (v5 >= 2)
  {
    if (v5 != 2)
      goto LABEL_6;
    v6 = v3;
    v7 = objc_msgSend(v6, sel_parameters);
    sub_235E26AC8(0, &qword_2563867F0);
    v8 = sub_235E610AC();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      v20 = sub_235E61610();

      swift_bridgeObjectRelease_n();
      if (!v20)
        goto LABEL_6;
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

      if (!v9)
        goto LABEL_6;
    }
  }
  sub_235E5C040((uint64_t)v3, v4, v5);
  if ((v10 & 1) == 0)
  {
    sub_235E59654((uint64_t)v3, v4, v5);
    v11 = v12;
    goto LABEL_8;
  }
LABEL_6:
  v11 = 1;
LABEL_8:
  sub_235E59860((uint64_t)v3, v4, v5);
  v14 = v13;
  v16 = v15;
  v17 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  result = swift_release();
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v16;
  *(_QWORD *)(a2 + 16) = 0;
  *(_BYTE *)(a2 + 24) = 1;
  v19 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(a2 + 25) = v11 & 1;
  *(_QWORD *)(a2 + 32) = v19;
  *(_QWORD *)(a2 + 40) = sub_235E59838;
  *(_QWORD *)(a2 + 48) = v17;
  return result;
}

void sub_235E55E98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[5];
  uint64_t v54;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(unsigned __int8 *)(v3 + 32);
  v6 = *(void **)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  sub_235E52BF0(v6, v5, *(_BYTE *)(v3 + 32));
  sub_235E59654((uint64_t)v6, v5, v4);
  if ((v7 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 208));
        v8 = swift_allocObject();
        swift_weakInit();
        v9 = swift_allocObject();
        swift_weakInit();
        sub_235E52BF0(v6, v5, 0);
        swift_retain();
        swift_retain();
        sub_235E33224(v6, (uint64_t)sub_235E591C8, v8, (uint64_t)sub_235E591A8, v9);
        sub_235E52C04(v6, v5, 0);
        swift_release_n();
        swift_release_n();
        sub_235E52C04(v6, v5, 0);
        return;
      case 1:
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 208));
        v10 = swift_allocObject();
        swift_weakInit();
        sub_235E52BF0(v6, v5, 1);
        swift_retain();
        sub_235E337E8((uint64_t)v6, (uint64_t)sub_235E591C8, v10);
        sub_235E52C04(v6, v5, 1);
        swift_release_n();
        sub_235E52C04(v6, v5, 1);
        return;
      case 2:
        v11 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 16);
        v12 = *(_QWORD *)(v11 + 16);
        v13 = v6;
        v14 = v13;
        if (!v12)
          goto LABEL_16;
        v15 = v13;
        swift_bridgeObjectRetain();
        v16 = sub_235E277B4((uint64_t)v15);
        if ((v17 & 1) != 0)
        {
          v18 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v16);
          swift_bridgeObjectRetain();

          swift_bridgeObjectRelease();
          sub_235E34E50(v6, v5, 2);
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(v18 + 16))
          {
            v19 = sub_235E53ED4(v18);
            if (v19)
            {
              v20 = (void *)v19;
              sub_235E34F3C(v1 + 184, (uint64_t)v53);
              __swift_project_boxed_opaque_existential_1(v53, v53[3]);
              sub_235E5B528((uint64_t)v6, v5, 2);
              v50 = v21;
              v23 = v22;
              v24 = v20;
              v25 = sub_235E53804(v24, v5);
              if (*(_QWORD *)(v18 + 16))
              {
                v26 = v25;
                v27 = sub_235E274BC((uint64_t)v24);
                if ((v28 & 1) != 0)
                {
                  v29 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v27);
                  swift_bridgeObjectRetain();

                  swift_bridgeObjectRelease();
                  v30 = swift_allocObject();
                  swift_weakInit();
                  v31 = swift_allocObject();
                  *(_QWORD *)(v31 + 16) = v30;
                  *(_QWORD *)(v31 + 24) = v15;
                  v32 = v15;
                  swift_retain();
                  sub_235E32FFC(v50, v23, v26, v29, (uint64_t)sub_235E59E54, v31);
                  swift_bridgeObjectRelease();

                  sub_235E52C04(v6, v5, 2);
                  swift_bridgeObjectRelease();
                  swift_release();
                  swift_release();
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
                  return;
                }
              }

              swift_bridgeObjectRelease();
              __break(1u);
            }
            __break(1u);
            JUMPOUT(0x235E565E8);
          }
          swift_bridgeObjectRelease();
          if (qword_2563854D0 != -1)
            swift_once();
          v42 = sub_235E60AA0();
          __swift_project_value_buffer(v42, (uint64_t)qword_256386DC8);
          v34 = v15;
          v43 = sub_235E60A88();
          v44 = sub_235E61184();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = (uint8_t *)swift_slowAlloc();
            v52 = swift_slowAlloc();
            v53[0] = v52;
            *(_DWORD *)v45 = 136315138;
            v46 = objc_msgSend(v34, sel_sectionIdentifier);
            v47 = sub_235E6104C();
            v49 = v48;

            v54 = sub_235E2AEC4(v47, v49, v53);
            sub_235E61430();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_235E24000, v43, v44, "Template for %s has no parameters; this should never happen",
              v45,
              0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B7E3DAC](v52, -1, -1);
            MEMORY[0x23B7E3DAC](v45, -1, -1);

            sub_235E52C04(v6, v5, 2);
            goto LABEL_20;
          }

        }
        else
        {

          swift_bridgeObjectRelease();
LABEL_16:
          if (qword_2563854D0 != -1)
            swift_once();
          v33 = sub_235E60AA0();
          __swift_project_value_buffer(v33, (uint64_t)qword_256386DC8);
          v34 = v14;
          v35 = sub_235E60A88();
          v36 = sub_235E61184();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = (uint8_t *)swift_slowAlloc();
            v51 = swift_slowAlloc();
            v53[0] = v51;
            *(_DWORD *)v37 = 136315138;
            v38 = objc_msgSend(v34, sel_sectionIdentifier);
            v39 = sub_235E6104C();
            v41 = v40;

            v54 = sub_235E2AEC4(v39, v41, v53);
            sub_235E61430();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_235E24000, v35, v36, "No parameter value sections for %s", v37, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B7E3DAC](v51, -1, -1);
            MEMORY[0x23B7E3DAC](v37, -1, -1);

            sub_235E52C04(v6, v5, 2);
LABEL_20:

            return;
          }

        }
        sub_235E52C04(v6, v5, 2);
        return;
      case 3:
        sub_235E52C04(v6, v5, 3);
        return;
      default:
        return;
    }
  }
  sub_235E52C04(v6, v5, v4);
}

uint64_t sub_235E565F8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  char v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  sub_235E59654((uint64_t)a1, a2, a3);
  v11 = v10;
  if ((v10 & 1) != 0)
  {
    v12 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    swift_retain();
    v13 = sub_235E59B20(a1, a2, a3, a4, (uint64_t)sub_235E59858, v12);
    swift_release_n();
  }
  else
  {
    v13 = MEMORY[0x24BEE4AF8];
  }
  sub_235E5C170((uint64_t)a1, a2, a3);
  v15 = v14;
  v17 = v16;
  v31 = sub_235E5C334(a1, a2, a3);
  v18 = *(_QWORD *)(v13 + 16);
  if (a3 < 2u)
    goto LABEL_9;
  if (a3 != 2)
    goto LABEL_10;
  v29 = v15;
  v30 = v11;
  v28 = a1;
  v19 = objc_msgSend(v28, sel_parameters);
  sub_235E26AC8(0, &qword_2563867F0);
  v20 = sub_235E610AC();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    v27 = sub_235E61610();

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v27 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();

  }
  v11 = v30;
  v15 = v29;
  if (v27)
  {
LABEL_9:
    sub_235E5C040((uint64_t)a1, a2, a3);
    v22 = v21 ^ 1;
  }
  else
  {
LABEL_10:
    v22 = 1;
  }
  if (v17)
    v23 = v17;
  else
    v23 = 0xE000000000000000;
  if (!v17)
    v15 = 0;
  v24 = (v18 != 0) | ~v11;
  v25 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  result = swift_release();
  *(_QWORD *)a5 = v15;
  *(_QWORD *)(a5 + 8) = v23;
  *(_QWORD *)(a5 + 16) = v31;
  *(_BYTE *)(a5 + 24) = v24 & 1;
  *(_BYTE *)(a5 + 25) = v22 & 1;
  *(_QWORD *)(a5 + 32) = v13;
  *(_QWORD *)(a5 + 40) = sub_235E59838;
  *(_QWORD *)(a5 + 48) = v25;
  return result;
}

void sub_235E568A4(void *a1, void *a2)
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  uint64_t inited;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;

  swift_beginAccess();
  if (!swift_weakLoadStrong())
    return;
  swift_retain();
  swift_release();
  v4 = objc_msgSend(a1, sel_parameters);
  sub_235E26AC8(0, &qword_2563867F0);
  v5 = sub_235E610AC();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (v13)
      goto LABEL_4;
LABEL_9:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_9;
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x23B7E35E4](0, v5);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(id *)(v5 + 32);
LABEL_7:
    v7 = v6;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386B90);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235E637D0;
    *(_QWORD *)(inited + 32) = v7;
    *(_QWORD *)(inited + 40) = a2;
    v9 = a1;
    v10 = v7;
    v11 = a2;
    v12 = sub_235E494F4(inited);
    sub_235E49BB0((uint64_t)v9, v12, 2);
    swift_release();

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

uint64_t sub_235E56A64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  unint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;

  v4 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 16);
  if (qword_256385470 != -1)
    swift_once();
  v6 = (id)qword_256387470;
  v7 = sub_235E609A4();
  v9 = v8;

  if (v5)
  {
    v10 = 1;
    goto LABEL_15;
  }
  v10 = 1;
  if (v4)
  {
    v11 = v4;
    v12 = objc_msgSend(v11, sel_intent, 0x8000000235E66280);
    if (v12)
    {
      v13 = v12;
      objc_opt_self();
      v14 = swift_dynamicCastObjCClass();

      if (v14)
      {
        sub_235E34EA4(v4, v3, 0);
LABEL_11:
        sub_235E5C040((uint64_t)v4, v3, 0);
        v10 = v22 ^ 1;
        goto LABEL_15;
      }
    }
    v15 = objc_msgSend(v11, sel_intent);
    if (v15
      && (v16 = v15,
          v17 = objc_msgSend(v15, sel__codableDescription),
          v16,
          v18 = objc_msgSend(v17, sel_attributes),
          v17,
          v18))
    {
      sub_235E26AC8(0, &qword_256385928);
      sub_235E26AC8(0, &qword_256387270);
      sub_235E48C20(&qword_256387278, &qword_256385928, 0x24BDD16E0, MEMORY[0x24BEE5BD8]);
      v19 = sub_235E60FF8();

      sub_235E58278(v19);
      v21 = v20;
      sub_235E34EA4(v4, v3, 0);
      swift_bridgeObjectRelease();
      if ((v21 & 1) != 0)
        goto LABEL_11;
    }
    else
    {
      sub_235E34EA4(v4, v3, 0);
    }
    v10 = 1;
  }
LABEL_15:
  v23 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  result = swift_release();
  *(_QWORD *)a2 = v7;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = 0;
  *(_BYTE *)(a2 + 24) = 1;
  v25 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(a2 + 25) = v10 & 1;
  *(_QWORD *)(a2 + 32) = v25;
  *(_QWORD *)(a2 + 40) = sub_235E591A8;
  *(_QWORD *)(a2 + 48) = v23;
  return result;
}

void sub_235E56D7C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  char v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(_QWORD *)(v0[28] + 24);
  if (!*(_BYTE *)(v1 + 32))
  {
    v3 = *(void **)(v1 + 16);
    v2 = *(_QWORD *)(v1 + 24);
    if (v3)
    {
      sub_235E34E50(*(id *)(v1 + 16), *(_QWORD *)(v1 + 24), 0);
      v4 = v3;
      v5 = objc_msgSend(v4, sel_intent);
      if (v5)
      {
        v6 = v5;
        objc_opt_self();
        v7 = swift_dynamicCastObjCClass();

        if (v7)
        {
          sub_235E52C04(v3, v2, 0);
          goto LABEL_9;
        }
      }
      v8 = objc_msgSend(v4, sel_intent);
      if (v8
        && (v9 = v8,
            v10 = objc_msgSend(v8, sel__codableDescription),
            v9,
            v11 = objc_msgSend(v10, sel_attributes),
            v10,
            v11))
      {
        sub_235E26AC8(0, &qword_256385928);
        sub_235E26AC8(0, &qword_256387270);
        sub_235E48C20(&qword_256387278, &qword_256385928, 0x24BDD16E0, MEMORY[0x24BEE5BD8]);
        v12 = sub_235E60FF8();

        sub_235E58278(v12);
        v14 = v13;
        sub_235E52C04(v3, v2, 0);
        swift_bridgeObjectRelease();
        if ((v14 & 1) != 0)
        {
LABEL_9:
          v15 = (_QWORD *)v0[29];
          v16 = v15[3];
          if (v16)
          {
            v17 = v15[6];
            v18 = v15[4];
            v20 = v15[5];
            v21 = v15[7];
            *(_QWORD *)&v22 = v15[2];
            *((_QWORD *)&v22 + 1) = v16;
            v23 = v18;
            v24 = v20;
            v25 = v17;
            v26 = v21;
            __swift_project_boxed_opaque_existential_1(v0 + 23, v0[26]);
            v19 = swift_allocObject();
            swift_weakInit();
            sub_235E52BF0(v3, v2, 0);
            sub_235E52BF0(v3, v2, 0);
            sub_235E3684C(v22, v16);
            swift_retain();
            sub_235E335A8(v4, &v22, (uint64_t)sub_235E591C8, v19);
            sub_235E52C04(v3, v2, 0);
            sub_235E52C04(v3, v2, 0);
            swift_bridgeObjectRelease();
            swift_release_n();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
      }
      else
      {
        sub_235E52C04(v3, v2, 0);
      }
    }
    sub_235E52C04(v3, v2, 0);
  }
}

uint64_t sub_235E57080()
{
  uint64_t result;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_235E34F3C(result + 184, (uint64_t)v5);
    swift_release();
    v1 = __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    v2 = MEMORY[0x23B7E3E6C](v1);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = *(id *)(v2 + OBJC_IVAR___BCConfigurationViewController_selectorViewController);

      objc_msgSend(v4, sel_zoomIn);
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return result;
}

id sub_235E57128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;
  char v4;

  v3 = *(void **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  v4 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a2 + 16) = v4;
  return sub_235E52BF0(v3, v2, v4);
}

uint64_t sub_235E57140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_BYTE *)(a1 + 16);
  if (qword_256385470 != -1)
    swift_once();
  v6 = (id)qword_256387470;
  v7 = sub_235E609A4();
  v9 = v8;

  sub_235E5C040(v3, v4, v5);
  v11 = v10;
  v12 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  result = swift_release();
  *(_QWORD *)a2 = v7;
  *(_QWORD *)(a2 + 8) = v9;
  *(_QWORD *)(a2 + 16) = 0;
  *(_BYTE *)(a2 + 24) = v11 & 1;
  v14 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(a2 + 25) = 0;
  *(_QWORD *)(a2 + 32) = v14;
  *(_QWORD *)(a2 + 40) = sub_235E58F68;
  *(_QWORD *)(a2 + 48) = v12;
  return result;
}

uint64_t sub_235E572BC()
{
  uint64_t result;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  void (*v4)(void);
  _QWORD v5[5];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_235E34F3C(result + 184, (uint64_t)v5);
    swift_release();
    v1 = __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    v2 = MEMORY[0x23B7E3E6C](v1);
    if (v2)
    {
      v3 = (void *)v2;
      v4 = *(void (**)(void))(v2 + OBJC_IVAR___BCConfigurationViewController_dismissHandler);
      swift_retain();

      v4();
      swift_release();
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return result;
}

uint64_t sub_235E57368()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387228);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
    return 0;
  v8 = *(_QWORD *)(*(_QWORD *)(Strong + 144) + 16);
  if (!v8 || (v9 = *(_QWORD *)(Strong + 152), (*(_BYTE *)(v9 + 24) & 1) != 0))
  {
    swift_release();
    return 0;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v13 = sub_235E60A10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v2, 1, 1, v13);
  v14 = qword_2563854B8;
  swift_bridgeObjectRetain();
  if (v14 != -1)
    swift_once();
  v15 = (id)qword_2563866F8;
  v16 = sub_235E538D8(1, v8, v12, 0xD000000000000013, 0x8000000235E658D0, (uint64_t)v2, (uint64_t)v15);

  sub_235E30A00((uint64_t)v2, &qword_2563862C0);
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563871E0);
  sub_235E29CC0(&qword_2563871F8, &qword_2563871E0, MEMORY[0x24BDB9AF8]);
  sub_235E60C14();
  swift_release();
  sub_235E29CC0(&qword_256387230, &qword_256387228, MEMORY[0x24BDB9568]);
  v10 = sub_235E60BFC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_235E575E0(uint64_t a1, void (*a2)(void))
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    a2();
    return swift_release();
  }
  return result;
}

void sub_235E57638(void *a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t inited;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;

  swift_beginAccess();
  if (!swift_weakLoadStrong())
    return;
  v5 = objc_msgSend(a3, sel_parameters);
  sub_235E26AC8(0, &qword_2563867F0);
  v6 = sub_235E610AC();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_235E61610();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_4;
LABEL_9:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_9;
LABEL_4:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x23B7E35E4](0, v6);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v6 + 32);
LABEL_7:
    v8 = v7;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256386B90);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235E637D0;
    *(_QWORD *)(inited + 32) = v8;
    *(_QWORD *)(inited + 40) = a1;
    v10 = a3;
    v11 = v8;
    v12 = a1;
    v13 = sub_235E494F4(inited);
    sub_235E49BB0((uint64_t)v10, v13, 2);
    swift_release();

    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

id sub_235E577E4@<X0>(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  id v36;
  uint64_t v37;

  v10 = *a1;
  v11 = objc_msgSend(*a1, sel_localizedTitle);
  v12 = sub_235E6104C();
  v37 = v13;

  v14 = objc_msgSend(v10, sel_image);
  if (v14)
  {
    v15 = v14;
    v36 = objc_msgSend(v14, sel_UIImage);

  }
  else
  {
    v36 = 0;
  }
  v33 = v12;
  v34 = a3;
  if (a2)
  {
    v16 = a5;
    v17 = objc_msgSend(v10, sel_identifier);
    v18 = sub_235E6104C();
    v20 = v19;

    v21 = objc_msgSend(a2, sel_identifier);
    v22 = sub_235E6104C();
    v24 = v23;

    if (v18 == v22 && v20 == v24)
      LOBYTE(a2) = 1;
    else
      LOBYTE(a2) = sub_235E616D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = a5;
  }
  v25 = objc_msgSend(v10, sel_identifier);
  v26 = sub_235E6104C();
  v28 = v27;

  if (v26 == 0xD000000000000031 && v28 == 0x8000000235E65CD0)
  {
    swift_bridgeObjectRelease();
    v29 = 1;
  }
  else
  {
    v29 = sub_235E616D0();
    swift_bridgeObjectRelease();
  }
  v30 = (_QWORD *)swift_allocObject();
  v30[2] = v34;
  v30[3] = a4;
  v30[4] = v16;
  v30[5] = v10;
  *(_QWORD *)a6 = v33;
  *(_QWORD *)(a6 + 8) = v37;
  *(_QWORD *)(a6 + 16) = v36;
  *(_BYTE *)(a6 + 24) = a2 & 1;
  *(_BYTE *)(a6 + 25) = v29 & 1;
  *(_QWORD *)(a6 + 32) = sub_235E59E00;
  *(_QWORD *)(a6 + 40) = v30;
  swift_retain();
  v31 = v16;
  return v10;
}

#error "235E57A94: call analysis failed (funcsize=24)"

uint64_t sub_235E57AB0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235E57B2C()
{
  uint64_t v0;

  v0 = ScreenViewModel.deinit();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_235E57BC0()
{
  sub_235E57B2C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConfigurationViewModel()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for ConfigurationViewModel.ConfigurationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E57C48 + 4 * byte_235E63DB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235E57C7C + 4 * byte_235E63DB0[v4]))();
}

uint64_t sub_235E57C7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E57C84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E57C8CLL);
  return result;
}

uint64_t sub_235E57C98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E57CA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235E57CA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E57CAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfigurationViewModel.ConfigurationMode()
{
  return &type metadata for ConfigurationViewModel.ConfigurationMode;
}

unint64_t sub_235E57CCC()
{
  unint64_t result;

  result = qword_2563870F0;
  if (!qword_2563870F0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63EE4, &type metadata for ConfigurationViewModel.ConfigurationMode);
    atomic_store(result, (unint64_t *)&qword_2563870F0);
  }
  return result;
}

uint64_t sub_235E57D10()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E57D34(uint64_t *a1)
{
  return sub_235E55788(a1);
}

uint64_t sub_235E57D3C(uint64_t a1)
{
  return sub_235E55B78(a1);
}

uint64_t sub_235E57D44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E57D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235E55CD4(a1, a2);
}

void sub_235E57D70(void **a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *oslog;
  uint64_t v14;

  v1 = *a1;
  if (*a1)
  {
    v2 = v1;
    if (qword_2563854D0 != -1)
      swift_once();
    v3 = sub_235E60AA0();
    __swift_project_value_buffer(v3, (uint64_t)qword_256386DC8);
    v4 = v1;
    v5 = v1;
    oslog = sub_235E60A88();
    v6 = sub_235E61184();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = v1;
      v14 = _swift_stdlib_bridgeErrorToNSError();
      sub_235E61430();
      *v8 = v14;

      _os_log_impl(&dword_235E24000, oslog, v6, "Failed to save placeholder data: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v8, -1, -1);
      MEMORY[0x23B7E3DAC](v7, -1, -1);

      return;
    }

  }
  else
  {
    if (qword_2563854D0 != -1)
      swift_once();
    v10 = sub_235E60AA0();
    __swift_project_value_buffer(v10, (uint64_t)qword_256386DC8);
    oslog = sub_235E60A88();
    v11 = sub_235E6119C();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_235E24000, oslog, v11, "Successfully saved placeholder data", v12, 2u);
      MEMORY[0x23B7E3DAC](v12, -1, -1);
    }
  }

}

uint64_t sub_235E57FF8(char a1)
{
  return *(_QWORD *)&aVersion_0[8 * a1];
}

uint64_t sub_235E58018(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];
  char v11;
  char v12;
  char v13;

  v10[0] = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563872B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235E5A338();
  sub_235E6176C();
  v13 = 0;
  sub_235E616AC();
  if (!v3)
  {
    v10[1] = v10[0];
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385A70);
    sub_235E5A37C(&qword_2563872B8, &qword_2563872C0, (uint64_t)&unk_235E63314, MEMORY[0x24BEE12A0]);
    sub_235E616B8();
    v11 = 2;
    sub_235E616AC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_235E581A8()
{
  char *v0;

  return sub_235E57FF8(*v0);
}

uint64_t sub_235E581B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235E59FE4(a1, a2);
  *a3 = result;
  return result;
}

void sub_235E581D4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_235E581E0()
{
  sub_235E5A338();
  return sub_235E61778();
}

uint64_t sub_235E58208()
{
  sub_235E5A338();
  return sub_235E61784();
}

uint64_t sub_235E58230@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_235E5A150(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_235E5825C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_235E58018(a1, *v1, v1[1]);
}

void sub_235E58278(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  void *v18;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v17 = 0;
    v1 = 0;
    v2 = 0;
    v3 = sub_235E61574() | 0x8000000000000000;
  }
  else
  {
    v4 = -1 << *(_BYTE *)(a1 + 32);
    v1 = ~v4;
    v17 = a1 + 64;
    v5 = -v4;
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v2 = v6 & *(_QWORD *)(a1 + 64);
    v3 = a1;
  }
  swift_bridgeObjectRetain();
  v7 = 0;
  v16 = (unint64_t)(v1 + 64) >> 6;
  while (1)
  {
    v12 = v7;
    if ((v3 & 0x8000000000000000) == 0)
      break;
    if (!sub_235E615D4())
      goto LABEL_31;
    swift_unknownObjectRelease();
    sub_235E26AC8(0, &qword_256387270);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v10 = v18;
    swift_unknownObjectRelease();
    if (!v18)
      goto LABEL_31;
LABEL_10:
    v11 = objc_msgSend(v10, sel_isConfigurable);

    if (v11)
      goto LABEL_31;
  }
  if (v2)
  {
    v8 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    v9 = v8 | (v7 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v3 + 56) + 8 * v9);
    if (!v10)
      goto LABEL_31;
    goto LABEL_10;
  }
  v13 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v13 >= v16)
      goto LABEL_31;
    v14 = *(_QWORD *)(v17 + 8 * v13);
    ++v7;
    if (!v14)
    {
      v7 = v12 + 2;
      if (v12 + 2 >= v16)
        goto LABEL_31;
      v14 = *(_QWORD *)(v17 + 8 * v7);
      if (!v14)
      {
        v7 = v12 + 3;
        if (v12 + 3 >= v16)
          goto LABEL_31;
        v14 = *(_QWORD *)(v17 + 8 * v7);
        if (!v14)
        {
          v7 = v12 + 4;
          if (v12 + 4 >= v16)
            goto LABEL_31;
          v14 = *(_QWORD *)(v17 + 8 * v7);
          if (!v14)
          {
            v7 = v12 + 5;
            if (v12 + 5 >= v16)
              goto LABEL_31;
            v14 = *(_QWORD *)(v17 + 8 * v7);
            if (!v14)
            {
              v15 = v12 + 6;
              while (v16 != v15)
              {
                v14 = *(_QWORD *)(v17 + 8 * v15++);
                if (v14)
                {
                  v7 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_235E48BC8();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v2 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_235E5851C(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v17[1] = a6;
  v11 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256387210);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = 0u;
  *(_OWORD *)(v15 + 32) = 0u;
  *(_OWORD *)(v15 + 48) = 0u;
  *(_QWORD *)(v15 + 64) = 0;
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256385DD0);
  swift_allocObject();
  *(_QWORD *)(v15 + 72) = sub_235E60B9C();
  *(_QWORD *)(a2 + 16) = v15;
  *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4B08];
  swift_allocObject();
  swift_weakInit();
  sub_235E29CC0(a4, a3, a5);
  sub_235E60CF8();
  swift_release();
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return a2;
}

uint64_t sub_235E586CC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_235E565F8(a1, a2, a3, a4, a5);
}

uint64_t sub_235E586D4()
{
  swift_release();
  return swift_deallocObject();
}

double sub_235E586F8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v4;
  double result;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  (*(void (**)(_OWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v6, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(_QWORD *)(a1 + 24));
  v4 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v4;
  result = *(double *)&v7;
  *(_OWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 48) = v8;
  return result;
}

uint64_t sub_235E58754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235E56A64(a1, a2);
}

uint64_t sub_235E5875C()
{
  return sub_235E57368();
}

uint64_t sub_235E58764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

void sub_235E5878C(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  void *v9;

  v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_235E61580();
      sub_235E26AC8(0, &qword_2563867F0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
    goto LABEL_10;
  if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a1) & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
LABEL_12:
    v8 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v5);
    return;
  }
  __break(1u);
LABEL_10:
  if (sub_235E61598() != *(_DWORD *)(a4 + 36))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_235E615A4();
  sub_235E26AC8(0, &qword_2563867F0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  v5 = sub_235E274BC((uint64_t)v9);
  v7 = v6;

  if ((v7 & 1) != 0)
    goto LABEL_12;
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

uint64_t sub_235E58948(uint64_t a1)
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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
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

uint64_t sub_235E589F8()
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
  char *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v0 = sub_235E60A10();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v34 - v8;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))((char *)&v34 - v8, 1, 1, v0);
  sub_235E454E4((uint64_t)v9, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v7, 1, v0) == 1)
  {
    sub_235E30A00((uint64_t)v7, &qword_2563862C0);
    sub_235E45ADC();
    v10 = (void *)swift_allocError();
    swift_willThrow();
    sub_235E30A00((uint64_t)v9, &qword_2563862C0);
    if (qword_2563854D0 != -1)
      swift_once();
    v11 = sub_235E60AA0();
    __swift_project_value_buffer(v11, (uint64_t)qword_256386DC8);
    v12 = v10;
    v13 = v10;
    v14 = sub_235E60A88();
    v15 = sub_235E61184();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      v18 = v10;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v35 = v19;
      sub_235E61430();
      *v17 = v19;

      _os_log_impl(&dword_235E24000, v14, v15, "Failed to load placeholder data: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v17, -1, -1);
      MEMORY[0x23B7E3DAC](v16, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v7, v0);
  v25 = sub_235E60A1C();
  v27 = v26;
  sub_235E6095C();
  swift_allocObject();
  sub_235E60950();
  sub_235E58F90();
  sub_235E60944();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  sub_235E58FD4(v25, v27);
  v28 = v35;
  v29 = v36;
  sub_235E30A00((uint64_t)v9, &qword_2563862C0);
  if (!v29)
  {
    if (qword_2563854D0 != -1)
      swift_once();
    v20 = sub_235E60AA0();
    __swift_project_value_buffer(v20, (uint64_t)qword_256386DC8);
    v21 = sub_235E60A88();
    v22 = sub_235E61178();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_235E24000, v21, v22, "No placeholder data found", v23, 2u);
      MEMORY[0x23B7E3DAC](v23, -1, -1);
    }

    return 0;
  }
  if (qword_2563854D0 != -1)
    swift_once();
  v30 = sub_235E60AA0();
  __swift_project_value_buffer(v30, (uint64_t)qword_256386DC8);
  v31 = sub_235E60A88();
  v32 = sub_235E6119C();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_235E24000, v31, v32, "Successfully loaded placeholder data", v33, 2u);
    MEMORY[0x23B7E3DAC](v33, -1, -1);
  }

  return v28;
}

uint64_t sub_235E58F60()
{
  return sub_235E57080();
}

uint64_t sub_235E58F68()
{
  return sub_235E572BC();
}

uint64_t sub_235E58F80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_235E57140(a1, a2);
}

uint64_t sub_235E58F88(uint64_t *a1)
{
  return sub_235E372EC(a1);
}

unint64_t sub_235E58F90()
{
  unint64_t result;

  result = qword_256387220;
  if (!qword_256387220)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63F4C, &type metadata for ActionPlaceholders);
    atomic_store(result, (unint64_t *)&qword_256387220);
  }
  return result;
}

uint64_t sub_235E58FD4(uint64_t a1, unint64_t a2)
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

uint64_t sub_235E59018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0) - 8) + 80);
  v2 = (v1 + 56) & ~v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_235E60A10();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_235E590C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_235E59108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2563862C0) - 8) + 80);
  sub_235E53C60(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), v2 + ((v5 + 56) & ~v5));
}

unint64_t sub_235E59164()
{
  unint64_t result;

  result = qword_256387268;
  if (!qword_256387268)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63F24, &type metadata for ActionPlaceholders);
    atomic_store(result, (unint64_t *)&qword_256387268);
  }
  return result;
}

uint64_t sub_235E591A8()
{
  uint64_t v0;

  return sub_235E575E0(v0, sub_235E56D7C);
}

uint64_t sub_235E591C8(uint64_t a1)
{
  uint64_t v1;

  return sub_235E57A50(a1, v1);
}

uint64_t sub_235E591E0(unint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v31;
  _QWORD v32[3];
  char v33;
  char v34;
  __int128 v35;
  uint64_t v36;

  v6 = v5;
  v7 = a1;
  if (a1 >> 62)
    goto LABEL_18;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    if (!v8)
      return v9;
    v36 = MEMORY[0x24BEE4AF8];
    result = sub_235E4F878(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0)
      break;
    v11 = 0;
    v9 = v36;
    v25 = v7;
    v26 = v7 & 0xC000000000000001;
    v24 = v8;
    while (v8 != v11)
    {
      if (v26)
        v12 = (id)MEMORY[0x23B7E35E4](v11, v7);
      else
        v12 = *(id *)(v7 + 8 * v11 + 32);
      v13 = v12;
      v31 = v12;
      sub_235E577E4(&v31, a2, a3, a4, a5, (uint64_t)v32);
      if (v6)
      {
        swift_release();

        return v9;
      }

      v14 = v32[0];
      v15 = v32[1];
      v16 = v32[2];
      v17 = v33;
      v18 = v34;
      v19 = v35;
      v36 = v9;
      v21 = *(_QWORD *)(v9 + 16);
      v20 = *(_QWORD *)(v9 + 24);
      if (v21 >= v20 >> 1)
      {
        v23 = v35;
        sub_235E4F878(v20 > 1, v21 + 1, 1);
        v19 = v23;
        v9 = v36;
      }
      ++v11;
      *(_QWORD *)(v9 + 16) = v21 + 1;
      v22 = v9 + 48 * v21;
      *(_QWORD *)(v22 + 32) = v14;
      *(_QWORD *)(v22 + 40) = v15;
      *(_QWORD *)(v22 + 48) = v16;
      *(_BYTE *)(v22 + 56) = v17;
      *(_BYTE *)(v22 + 57) = v18;
      *(_OWORD *)(v22 + 64) = v19;
      v8 = v24;
      v7 = v25;
      v6 = 0;
      if (v24 == v11)
        return v9;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v8 = sub_235E61610();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_235E593A8(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_235E593FC(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    __asm { BR              X8 }
  return 0;
}

void sub_235E59654(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_235E59680()
{
  __CFString *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v0 = CFSTR("Controls");
  v1 = sub_235E6104C();
  v3 = v2;
  if (v1 == sub_235E6104C() && v3 == v4)
    goto LABEL_8;
  v6 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v7 = sub_235E6104C();
  v9 = v8;
  if (v7 == sub_235E6104C() && v9 == v10)
  {
LABEL_8:
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  v13 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
    goto LABEL_9;
  v14 = sub_235E6104C();
  v16 = v15;
  if (v14 != sub_235E6104C() || v16 != v17)
  {
    v18 = sub_235E616D0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = v18 ^ 1;
    return v11 & 1;
  }

  swift_bridgeObjectRelease_n();
LABEL_10:
  v11 = 0;
  return v11 & 1;
}

uint64_t sub_235E59838()
{
  uint64_t v0;

  return sub_235E575E0(v0, sub_235E55E98);
}

void sub_235E59858(void *a1, void *a2)
{
  sub_235E568A4(a1, a2);
}

void sub_235E59860(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_235E5989C()
{
  id v0;
  uint64_t v1;

  if (qword_256385470 != -1)
    swift_once();
  v0 = (id)qword_256387470;
  v1 = sub_235E609A4();

  return v1;
}

uint64_t sub_235E59B20(void *a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  id v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;

  if (a3 != 2)
    return MEMORY[0x24BEE4AF8];
  v10 = a1;
  swift_bridgeObjectRetain();
  v11 = objc_msgSend(v10, sel_parameters);
  sub_235E26AC8(0, &qword_2563867F0);
  v12 = sub_235E610AC();

  if (!(v12 >> 62))
  {
    v13 = *(void **)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
      goto LABEL_4;
LABEL_16:

    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  v13 = (void *)sub_235E61610();
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_16;
LABEL_4:
  if ((v12 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x23B7E35E4](0, v12);
  }
  else
  {
    if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    v14 = *(id *)(v12 + 32);
  }
  v13 = v14;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a4 + 16))
  {
    v12 = (unint64_t)v10;
    v15 = sub_235E277B4(v12);
    if ((v16 & 1) != 0)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v15);
      swift_bridgeObjectRetain();

      v18 = sub_235E48F04(v17);
      a4 = sub_235E48D9C(v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!(a4 >> 62))
      {
        if (*(uint64_t *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10) <= 1)
        {
LABEL_11:

          swift_bridgeObjectRelease();
LABEL_17:
          swift_bridgeObjectRelease();
          return MEMORY[0x24BEE4AF8];
        }
LABEL_23:
        v22 = v13;
        v23 = sub_235E53804(v22, a2);

        swift_bridgeObjectRelease();
        v24 = v23;
        swift_retain();
        v25 = (id)v12;
        v19 = sub_235E591E0(a4, v23, a5, a6, v25);
        swift_bridgeObjectRelease();

        swift_release();
        return v19;
      }
LABEL_22:
      swift_bridgeObjectRetain();
      v21 = sub_235E61610();
      swift_bridgeObjectRelease();
      if (v21 <= 1)
        goto LABEL_11;
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();

    v13 = (void *)v12;
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_235E59DCC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235E59E00()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_235E59E28()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_235E59E54(void *a1)
{
  uint64_t v1;

  sub_235E57638(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235E59E5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t destroy for ActionPlaceholders()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s27ActionButtonConfigurationUI18ActionPlaceholdersVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ActionPlaceholders(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for ActionPlaceholders(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionPlaceholders(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActionPlaceholders(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActionPlaceholders()
{
  return &type metadata for ActionPlaceholders;
}

uint64_t sub_235E59FE4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v3 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74496E6F69746361 && a2 == 0xEB00000000736D65 || (sub_235E616D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64657463656C6573 && a2 == 0xED00007865646E49)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_235E616D0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_235E5A150(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256387290);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_235E5A338();
  sub_235E61760();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    v7 = sub_235E6167C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385A70);
    v9[15] = 1;
    sub_235E5A37C(&qword_2563872A0, &qword_2563872A8, (uint64_t)&unk_235E6333C, MEMORY[0x24BEE12D0]);
    sub_235E61688();
    v9[14] = 2;
    swift_bridgeObjectRetain();
    sub_235E6167C();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_235E5A338()
{
  unint64_t result;

  result = qword_256387298;
  if (!qword_256387298)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E64038, &type metadata for ActionPlaceholders.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256387298);
  }
  return result;
}

uint64_t sub_235E5A37C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256385A70);
    v10 = sub_235E2B7F4(a2, (uint64_t (*)(uint64_t))type metadata accessor for ActionSelectorItem, a3);
    result = MEMORY[0x23B7E3CE0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ActionPlaceholders.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235E5A44C + 4 * byte_235E63DC7[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235E5A480 + 4 * byte_235E63DC2[v4]))();
}

uint64_t sub_235E5A480(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E5A488(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235E5A490);
  return result;
}

uint64_t sub_235E5A49C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235E5A4A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235E5A4A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235E5A4B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActionPlaceholders.CodingKeys()
{
  return &type metadata for ActionPlaceholders.CodingKeys;
}

unint64_t sub_235E5A4D0()
{
  unint64_t result;

  result = qword_2563872C8;
  if (!qword_2563872C8)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E64010, &type metadata for ActionPlaceholders.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563872C8);
  }
  return result;
}

unint64_t sub_235E5A518()
{
  unint64_t result;

  result = qword_2563872D0;
  if (!qword_2563872D0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63F80, &type metadata for ActionPlaceholders.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563872D0);
  }
  return result;
}

unint64_t sub_235E5A560()
{
  unint64_t result;

  result = qword_2563872D8;
  if (!qword_2563872D8)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E63FA8, &type metadata for ActionPlaceholders.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563872D8);
  }
  return result;
}

void sub_235E5A5B4(void *a1, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  const char *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;

  v4 = v3;
  v8 = qword_2563854D0;
  v9 = a2;
  if ((a3 & 1) != 0)
  {
    if (v8 != -1)
      swift_once();
    v36 = a1;
    v17 = sub_235E60AA0();
    __swift_project_value_buffer(v17, (uint64_t)qword_256386DC8);
    v11 = v9;
    v18 = sub_235E60A88();
    v19 = sub_235E6119C();
    if (os_log_type_enabled(v18, v19))
    {
      v33 = v9;
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v37 = v21;
      *(_DWORD *)v20 = 136315138;
      v22 = sub_235E6104C();
      sub_235E2AEC4(v22, v23, (uint64_t *)&v37);
      sub_235E61430();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235E24000, v18, v19, "Saving %s...", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v21, -1, -1);
      v24 = v20;
      v9 = v33;
      MEMORY[0x23B7E3DAC](v24, -1, -1);

    }
    else
    {

    }
    sub_235E6104C();
    v30 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
    v31 = (void *)sub_235E61028();
    objc_msgSend(v36, sel_setObject_forKey_, v30, v31);

    v26 = sub_235E60A88();
    v27 = sub_235E6119C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      v29 = "Successfully saved section identifier";
      goto LABEL_17;
    }
LABEL_18:
    v9 = v26;
    goto LABEL_19;
  }
  v34 = a2;
  if (v8 != -1)
    swift_once();
  v10 = sub_235E60AA0();
  __swift_project_value_buffer(v10, (uint64_t)qword_256386DC8);
  v11 = v9;
  v12 = sub_235E60A88();
  v13 = sub_235E6119C();
  if (os_log_type_enabled(v12, v13))
  {
    v35 = a1;
    v14 = (uint8_t *)swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v14 = 138412290;
    v37 = v11;
    v15 = v11;
    sub_235E61430();
    *v32 = v34;

    v4 = v3;
    _os_log_impl(&dword_235E24000, v12, v13, "Saving %@...", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
    swift_arrayDestroy();
    MEMORY[0x23B7E3DAC](v32, -1, -1);
    v16 = v14;
    a1 = v35;
    MEMORY[0x23B7E3DAC](v16, -1, -1);

  }
  else
  {

  }
  sub_235E5AC40(a1);
  if (!v4)
  {
    v25 = (void *)sub_235E61028();
    objc_msgSend(a1, sel_setURL_forKey_, 0, v25);

    v26 = sub_235E60A88();
    v27 = sub_235E6119C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      v29 = "Successfully saved configured action";
LABEL_17:
      _os_log_impl(&dword_235E24000, v26, v27, v29, v28, 2u);
      MEMORY[0x23B7E3DAC](v28, -1, -1);
      v11 = v26;
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_18;
  }
LABEL_20:

}

uint64_t sub_235E5AA7C(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  _OWORD v9[2];
  _BYTE v10[24];
  uint64_t v11;

  v3 = (void *)sub_235E61028();
  v4 = objc_msgSend(a1, sel_objectForKey_, v3);

  if (v4)
  {
    sub_235E61448();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_235E5B134((uint64_t)v9, (uint64_t)v10);
  if (!v11)
    goto LABEL_11;
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  sub_235E26AC8(0, &qword_2563872E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563872E8);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_235E637D0;
  *(_QWORD *)(v5 + 32) = sub_235E26AC8(0, &qword_2563868D8);
  sub_235E611A8();
  sub_235E58FD4(v7, v8);
  result = swift_bridgeObjectRelease();
  if (v1)
    return result;
  if (!v11)
  {
LABEL_11:
    sub_235E5B17C((uint64_t)v10);
    return 0;
  }
  if (swift_dynamicCast())
    return *(_QWORD *)&v9[0];
  else
    return 0;
}

uint64_t sub_235E5AC40(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  id v13[2];

  v2 = v1;
  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v13[0] = 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v2, 1, v13);
  v5 = v13[0];
  if (v4)
  {
    v6 = sub_235E60A34();
    v8 = v7;

    v9 = (void *)sub_235E60A28();
    v10 = (void *)sub_235E61028();
    objc_msgSend(a1, sel_setObject_forKey_, v9, v10);

    return sub_235E58FD4(v6, v8);
  }
  else
  {
    v12 = v5;
    sub_235E609D4();

    return swift_willThrow();
  }
}

id sub_235E5AD78(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;

  v3 = (void *)sub_235E61028();
  v4 = objc_msgSend(a1, sel_stringForKey_, v3);

  if (v4)
  {
    v5 = sub_235E6104C();
    v7 = v6;
    if (qword_2563854D0 != -1)
      swift_once();
    v8 = sub_235E60AA0();
    __swift_project_value_buffer(v8, (uint64_t)qword_256386DC8);
    swift_bridgeObjectRetain();
    v9 = sub_235E60A88();
    v10 = sub_235E6119C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v22 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      sub_235E2AEC4(v5, v7, &v22);
      sub_235E61430();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_235E24000, v9, v10, "Successfully loaded section identifier %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7E3DAC](v12, -1, -1);
      MEMORY[0x23B7E3DAC](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    sub_235E26AC8(0, &qword_2563868D8);
    v13 = sub_235E5AA7C(a1);
    if (!v1)
    {
      v4 = (id)v13;
      if (v13)
      {
        if (qword_2563854D0 != -1)
          swift_once();
        v15 = sub_235E60AA0();
        __swift_project_value_buffer(v15, (uint64_t)qword_256386DC8);
        v16 = v4;
        v17 = sub_235E60A88();
        v18 = sub_235E6119C();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc();
          v20 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v19 = 138412290;
          v22 = (uint64_t)v16;
          v21 = v16;
          sub_235E61430();
          *v20 = v4;

          _os_log_impl(&dword_235E24000, v17, v18, "Successfully loaded configured acton %@", v19, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256385648);
          swift_arrayDestroy();
          MEMORY[0x23B7E3DAC](v20, -1, -1);
          MEMORY[0x23B7E3DAC](v19, -1, -1);

        }
        else
        {

        }
      }
    }
  }
  return v4;
}

uint64_t sub_235E5B134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235E5B17C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563862A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for PersistentActionData(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for PersistentActionData(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for PersistentActionData(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for PersistentActionData(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PersistentActionData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_235E5B304(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_235E5B30C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PersistentActionData()
{
  return &type metadata for PersistentActionData;
}

void destroy for Action(uint64_t a1)
{
  sub_235E34EA4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s27ActionButtonConfigurationUI6ActionOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_235E34E50(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Action(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_235E34E50(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_235E34EA4(v6, v7, v8);
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

uint64_t assignWithTake for Action(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_235E34EA4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Action(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Action(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_235E5B4C0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_235E5B4C8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Action()
{
  return &type metadata for Action;
}

unint64_t sub_235E5B4E4()
{
  unint64_t result;

  result = qword_2563872F0;
  if (!qword_2563872F0)
  {
    result = MEMORY[0x23B7E3CE0](&unk_235E6419C, &type metadata for Action);
    atomic_store(result, (unint64_t *)&qword_2563872F0);
  }
  return result;
}

void sub_235E5B528(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_235E5B560()
{
  id v0;
  uint64_t v1;

  if (qword_256385470 != -1)
    swift_once();
  v0 = (id)qword_256387470;
  v1 = sub_235E609A4();

  return v1;
}

void sub_235E5B758(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_235E5B794()
{
  id v0;
  uint64_t v1;

  if (qword_256385470 != -1)
    swift_once();
  v0 = (id)qword_256387470;
  v1 = sub_235E609A4();

  return v1;
}

void sub_235E5B96C(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

id sub_235E5B99C()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithRed_green_blue_alpha_, 0.5018, 0.5292, 0.5813, 1.0);
}

id sub_235E5BA10(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_sectionIdentifier);
  v3 = sub_235E6104C();
  v5 = v4;
  if (v3 == sub_235E6104C() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v8 = sub_235E616D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      v9 = sub_235E6104C();
      v11 = v10;
      if (v9 == sub_235E6104C() && v11 == v12)
      {
        swift_bridgeObjectRelease_n();
LABEL_14:

        v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithSystemColor_, 10);
        goto LABEL_12;
      }
      v20 = sub_235E616D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        goto LABEL_14;
      v21 = sub_235E6104C();
      v23 = v22;
      if (v21 == sub_235E6104C() && v23 == v24)
      {
        swift_bridgeObjectRelease_n();
LABEL_20:

        v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithRed_green_blue_alpha_, 0.4236, 0.4618, 0.6515, 1.0);
        goto LABEL_12;
      }
      v25 = sub_235E616D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v25 & 1) != 0)
        goto LABEL_20;
      v26 = sub_235E6104C();
      v28 = v27;
      if (v26 == sub_235E6104C() && v28 == v29)
      {
        swift_bridgeObjectRelease_n();
LABEL_25:

        v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithRed_green_blue_alpha_, 0.8, 0.64, 0.0, 1.0);
        goto LABEL_12;
      }
      v30 = sub_235E616D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v30 & 1) != 0)
        goto LABEL_25;
      v31 = sub_235E6104C();
      v33 = v32;
      if (v31 == sub_235E6104C() && v33 == v34)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v35 = sub_235E616D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v35 & 1) == 0)
        {
          v36 = sub_235E6104C();
          v38 = v37;
          if (v36 == sub_235E6104C() && v38 == v39)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            v40 = sub_235E616D0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v40 & 1) == 0)
            {
              v41 = sub_235E6104C();
              v43 = v42;
              if (v41 == sub_235E6104C() && v43 == v44)
              {
                swift_bridgeObjectRelease_n();
              }
              else
              {
                v45 = sub_235E616D0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v45 & 1) == 0)
                {
                  v46 = sub_235E6104C();
                  v48 = v47;
                  if (v46 == sub_235E6104C() && v48 == v49)
                  {
                    swift_bridgeObjectRelease_n();
                  }
                  else
                  {
                    v50 = sub_235E616D0();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if ((v50 & 1) == 0)
                    {
                      v51 = sub_235E6104C();
                      v53 = v52;
                      if (v51 == sub_235E6104C() && v53 == v54)
                      {

                        swift_bridgeObjectRelease_n();
                      }
                      else
                      {
                        v55 = sub_235E616D0();

                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        if ((v55 & 1) == 0)
                        {
                          v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithWhite_alpha_, 0.0, 0.0);
                          goto LABEL_12;
                        }
                      }
                      v13 = objc_allocWithZone(MEMORY[0x24BEC1398]);
                      v15 = 0.5007;
                      v16 = 0.9938;
                      goto LABEL_31;
                    }
                  }

                  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithSystemColor_, 4);
                  goto LABEL_12;
                }
              }

              v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithRed_green_blue_alpha_, 0.5018, 0.5292, 0.5813, 1.0);
              goto LABEL_12;
            }
          }

          v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEC1398]), sel_initWithRed_green_blue_alpha_, 0.8, 0.0, 0.0581, 1.0);
          goto LABEL_12;
        }
      }

      v13 = objc_allocWithZone(MEMORY[0x24BEC1398]);
      v15 = 0.5525;
      v16 = 0.65;
LABEL_31:
      v14 = 0.0;
      goto LABEL_11;
    }
  }

  v13 = objc_allocWithZone(MEMORY[0x24BEC1398]);
  v14 = 0.9533;
  v15 = 0.4296;
  v16 = 0.0542;
LABEL_11:
  v17 = objc_msgSend(v13, sel_initWithRed_green_blue_alpha_, v14, v15, v16, 1.0);
LABEL_12:
  v18 = v17;

  return v18;
}

void sub_235E5C040(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X11 }
}

BOOL sub_235E5C074@<W0>(uint64_t a1@<X8>)
{
  return a1 != 0;
}

void sub_235E5C170(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_235E5C1A8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  if (!v1)
    return 0;
  v2 = objc_msgSend(v1, sel_name);
  v3 = sub_235E6104C();
  sub_235E34EA4(v1, v0, 0);

  return v3;
}

uint64_t sub_235E5C334(void *a1, uint64_t a2, char a3)
{
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t result;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD v27[6];

  if (a3 == 1)
  {
    if (a1)
    {
      v6 = objc_msgSend(a1, sel_previewIcon);
      if (v6)
      {
        v7 = v6;
        objc_opt_self();
        v8 = swift_dynamicCastObjCClass();
        if (!v8)
        {
          objc_opt_self();
          v18 = swift_dynamicCastObjCClass();
          if (v18)
          {
            v19 = (void *)v18;
            v7 = v7;
            v20 = objc_msgSend(v19, sel_image);
            v21 = objc_msgSend(v20, sel_UIImage);
          }
          else
          {
            objc_opt_self();
            v22 = swift_dynamicCastObjCClass();
            if (!v22)
            {
              objc_opt_self();
              v4 = (id)swift_dynamicCastObjCClass();
              if (v4)
              {
                v25 = sub_235E61124();
                MEMORY[0x24BDAC7A8](v25);
                v27[2] = v4;
                v26 = v7;
                v4 = (id)sub_235E5C72C((void (*)(_QWORD *__return_ptr))sub_235E5E118, (uint64_t)v27);
                sub_235E34EA4(a1, a2, 1);

                return (uint64_t)v4;
              }
              sub_235E34EA4(a1, a2, 1);
              goto LABEL_22;
            }
            v23 = (void *)v22;
            v7 = v7;
            v24 = objc_msgSend(v23, sel_bundleIdentifier);
            if (!v24)
            {
              sub_235E6104C();
              v24 = (id)sub_235E61028();
              swift_bridgeObjectRelease();
            }
            v20 = objc_msgSend((id)objc_opt_self(), sel_applicationIconImageForBundleIdentifier_, v24);

            if (!v20)
            {
              sub_235E34EA4(a1, a2, 1);

              return 0;
            }
            v21 = objc_msgSend(v20, sel_UIImage);
          }
          v4 = v21;
          sub_235E34EA4(a1, a2, 1);

          goto LABEL_22;
        }
        v9 = (void *)v8;
        v10 = v7;
        v11 = objc_msgSend(v9, sel_symbolName);
        sub_235E6104C();

        v12 = (void *)sub_235E61028();
        swift_bridgeObjectRelease();
        v4 = objc_msgSend((id)objc_opt_self(), sel__systemImageNamed_, v12);

        sub_235E34EA4(a1, a2, 1);
        return (uint64_t)v4;
      }
      v17 = a1;
    }
    else
    {
      v17 = 0;
    }
    sub_235E34EA4(v17, a2, 1);
    return 0;
  }
  v4 = 0;
  if (a3 != 2)
    return (uint64_t)v4;
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(uint64_t *)(a2 + 16) >= 1)
      goto LABEL_11;
    return 0;
  }
  if (sub_235E61490() < 1)
    return 0;
LABEL_11:
  v13 = swift_bridgeObjectRetain();
  v14 = (void *)sub_235E53F40(v13);
  result = swift_bridgeObjectRelease();
  if (v14)
  {
    v16 = sub_235E53804(v14, a2);

    if (!v16)
      return 0;
    v7 = objc_msgSend(v16, sel_image);

    if (!v7)
      return 0;
    v4 = objc_msgSend(v7, sel_UIImage);
LABEL_22:

    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_235E5C72C(void (*a1)(_QWORD *__return_ptr), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v9[2];

  sub_235E61118();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) != 0)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v6 = a2;
    a1(v9);
    if (v2)
    {
      swift_release();
      return v6;
    }
    v6 = v9[0];
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return v6;
    __break(1u);
  }
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_235E614F0();
  sub_235E61070();
  sub_235E61790();
  sub_235E61070();
  swift_bridgeObjectRelease();
  sub_235E61070();
  result = sub_235E615F8();
  __break(1u);
  return result;
}

uint64_t sub_235E5C8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_235E6104C();
  v5 = v4;
  if (v3 == sub_235E6104C() && v5 == v6)
  {
    v9 = 0;
LABEL_17:
    swift_bridgeObjectRelease_n();
    return v9;
  }
  v8 = sub_235E616D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = 0;
  if ((v8 & 1) == 0)
  {
    v10 = v2 - 1;
    while (1)
    {
      if (v10 == v9)
        return 0;
      v11 = sub_235E6104C();
      v13 = v12;
      if (v11 == sub_235E6104C() && v13 == v14)
        break;
      v16 = sub_235E616D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v9;
      if ((v16 & 1) != 0)
        return v9;
    }
    ++v9;
    goto LABEL_17;
  }
  return v9;
}

uint64_t sub_235E5CA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235E5CA1C(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235E5D678);
}

uint64_t sub_235E5CA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235E5CA1C(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235E5D908);
}

uint64_t sub_235E5CA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(unsigned __int8 *)(a2 + 16));
}

BOOL sub_235E5CA3C(uint64_t a1, uint64_t a2)
{
  char v2;

  sub_235E5D908(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
  return (v2 & 1) == 0;
}

BOOL sub_235E5CA70(uint64_t a1)
{
  char v1;

  sub_235E5D908(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return (v1 & 1) == 0;
}

void sub_235E5CAA4(uint64_t a1, uint64_t a2)
{
  sub_235E5D908(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

void sub_235E5CAC0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  unint64_t v23;
  char v24;
  char v25;
  id v26;
  char v27;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_235E614A8();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_235E5D208(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v8 = 0;
  v9 = a1 + 64;
  v10 = 1 << *(_BYTE *)(a1 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a1 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v8 << 6);
      goto LABEL_37;
    }
    v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v16 >= v13)
      return;
    v17 = *(_QWORD *)(v9 + 8 * v16);
    ++v8;
    if (!v17)
    {
      v8 = v16 + 1;
      if (v16 + 1 >= v13)
        return;
      v17 = *(_QWORD *)(v9 + 8 * v8);
      if (!v17)
      {
        v8 = v16 + 2;
        if (v16 + 2 >= v13)
          return;
        v17 = *(_QWORD *)(v9 + 8 * v8);
        if (!v17)
        {
          v8 = v16 + 3;
          if (v16 + 3 >= v13)
            return;
          v17 = *(_QWORD *)(v9 + 8 * v8);
          if (!v17)
            break;
        }
      }
    }
LABEL_36:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_37:
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(a1 + 56) + v19);
    v21 = *(id *)(*(_QWORD *)(a1 + 48) + v19);
    v22 = v20;
    v23 = sub_235E274BC((uint64_t)v21);
    v25 = v24;

    if ((v25 & 1) == 0)
    {

      return;
    }
    sub_235E26AC8(0, (unint64_t *)&qword_256385650);
    v26 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v23);
    v27 = sub_235E612C8();

    if ((v27 & 1) == 0)
      return;
  }
  v18 = v16 + 4;
  if (v18 >= v13)
    return;
  v17 = *(_QWORD *)(v9 + 8 * v18);
  if (v17)
  {
    v8 = v18;
    goto LABEL_36;
  }
  while (1)
  {
    v8 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v8 >= v13)
      return;
    v17 = *(_QWORD *)(v9 + 8 * v8);
    ++v18;
    if (v17)
      goto LABEL_36;
  }
LABEL_44:
  __break(1u);
}

void sub_235E5CD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  unint64_t v28;
  id v29;
  void *v30;
  char v31;
  id v32;
  id v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  char v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  unint64_t v48;
  int64_t v49;

  if (a1 == a2)
    return;
  v2 = a2;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v3 = 0;
  v44 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v45 = (unint64_t)(v4 + 63) >> 6;
  v46 = a1;
  while (1)
  {
    if (v6)
    {
      v7 = __clz(__rbit64(v6));
      v8 = (v6 - 1) & v6;
      v9 = v7 | (v3 << 6);
    }
    else
    {
      v10 = v3 + 1;
      if (__OFADD__(v3, 1))
      {
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      if (v10 >= v45)
        return;
      v11 = *(_QWORD *)(v44 + 8 * v10);
      ++v3;
      if (!v11)
      {
        v3 = v10 + 1;
        if (v10 + 1 >= v45)
          return;
        v11 = *(_QWORD *)(v44 + 8 * v3);
        if (!v11)
        {
          v3 = v10 + 2;
          if (v10 + 2 >= v45)
            return;
          v11 = *(_QWORD *)(v44 + 8 * v3);
          if (!v11)
          {
            v3 = v10 + 3;
            if (v10 + 3 >= v45)
              return;
            v11 = *(_QWORD *)(v44 + 8 * v3);
            if (!v11)
            {
              v12 = v10 + 4;
              if (v12 >= v45)
                return;
              v11 = *(_QWORD *)(v44 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  v3 = v12 + 1;
                  if (__OFADD__(v12, 1))
                    goto LABEL_86;
                  if (v3 >= v45)
                    return;
                  v11 = *(_QWORD *)(v44 + 8 * v3);
                  ++v12;
                  if (v11)
                    goto LABEL_24;
                }
              }
              v3 = v12;
            }
          }
        }
      }
LABEL_24:
      v8 = (v11 - 1) & v11;
      v9 = __clz(__rbit64(v11)) + (v3 << 6);
    }
    v13 = 8 * v9;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v13);
    v15 = *(id *)(*(_QWORD *)(a1 + 48) + v13);
    swift_bridgeObjectRetain();
    v16 = sub_235E274BC((uint64_t)v15);
    v18 = v17;

    if ((v18 & 1) == 0)
      goto LABEL_75;
    v19 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v16);
    v49 = v3;
    if ((unint64_t)v19 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v20 = sub_235E61610();
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v48 = v8;
    if ((unint64_t)v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v43 = sub_235E61610();
      swift_bridgeObjectRelease();
      if (v20 != v43)
        goto LABEL_74;
    }
    else if (v20 != *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_74;
    }
    if (v20)
    {
      v21 = v19 & 0xFFFFFFFFFFFFFF8;
      v22 = (v19 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v19 < 0)
        v21 = v19;
      if ((unint64_t)v19 >> 62)
        v22 = v21;
      v23 = v14 & 0xFFFFFFFFFFFFFF8;
      v24 = (v14 & 0xFFFFFFFFFFFFFF8) + 32;
      if (v14 < 0)
        v23 = v14;
      if ((unint64_t)v14 >> 62)
        v24 = v23;
      if (v22 != v24)
      {
        if (v20 < 0)
          goto LABEL_81;
        v25 = v19 & 0xC000000000000001;
        if ((v19 & 0xC000000000000001) != 0)
        {
          v26 = (id)MEMORY[0x23B7E35E4](0, v19);
        }
        else
        {
          if (!*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_82;
          v26 = *(id *)(v19 + 32);
        }
        v27 = v26;
        v28 = v14 & 0xC000000000000001;
        if ((v14 & 0xC000000000000001) != 0)
        {
          v29 = (id)MEMORY[0x23B7E35E4](0, v14);
        }
        else
        {
          if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_83;
          v29 = *(id *)(v14 + 32);
        }
        v30 = v29;
        sub_235E26AC8(0, &qword_256385638);
        v31 = sub_235E612C8();

        if ((v31 & 1) == 0)
          goto LABEL_74;
        if (v20 != 1)
          break;
      }
    }
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v46;
    v2 = a2;
    v6 = v48;
    v3 = v49;
  }
  if (!v25)
  {
    if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      v32 = *(id *)(v19 + 40);
      if (!v28)
        goto LABEL_54;
LABEL_51:
      v33 = (id)MEMORY[0x23B7E35E4](1, v14);
LABEL_56:
      v34 = v33;
      v35 = sub_235E612C8();

      if ((v35 & 1) == 0)
      {
LABEL_74:
        swift_bridgeObjectRelease();
LABEL_75:
        swift_bridgeObjectRelease();
        return;
      }
      v36 = 2 - v20;
      v37 = 6;
      while (1)
      {
        if (v36 + v37 == 6)
          goto LABEL_6;
        v41 = v37 - 4;
        if (v25)
        {
          v42 = (id)MEMORY[0x23B7E35E4](v37 - 4, v19);
          if (v28)
            goto LABEL_58;
        }
        else
        {
          if (v41 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_79:
            __break(1u);
            goto LABEL_80;
          }
          v42 = *(id *)(v19 + 8 * v37);
          if (v28)
          {
LABEL_58:
            v38 = (id)MEMORY[0x23B7E35E4](v37 - 4, v14);
            goto LABEL_59;
          }
        }
        if (v41 >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_79;
        v38 = *(id *)(v14 + 8 * v37);
LABEL_59:
        v39 = v38;
        v40 = sub_235E612C8();

        ++v37;
        if ((v40 & 1) == 0)
          goto LABEL_74;
      }
    }
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  v32 = (id)MEMORY[0x23B7E35E4](1, v19);
  if (v28)
    goto LABEL_51;
LABEL_54:
  if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v33 = *(id *)(v14 + 40);
    goto LABEL_56;
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

void sub_235E5D208(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  void *v21;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_235E61490())
    return;
  v4 = 0;
  v5 = a2 + 64;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_19;
    }
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v12 >= v9)
      return;
    v13 = *(_QWORD *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v9)
        return;
      v13 = *(_QWORD *)(v5 + 8 * v4);
      if (!v13)
        break;
    }
LABEL_18:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_19:
    v15 = 8 * v11;
    v16 = *(void **)(*(_QWORD *)(a2 + 56) + v15);
    v17 = *(id *)(*(_QWORD *)(a2 + 48) + v15);
    v18 = v16;
    v19 = sub_235E615BC();

    if (!v19)
    {

      return;
    }
    sub_235E26AC8(0, (unint64_t *)&qword_256385650);
    swift_dynamicCast();
    v20 = sub_235E612C8();

    if ((v20 & 1) == 0)
      return;
  }
  v14 = v12 + 2;
  if (v14 >= v9)
    return;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      return;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_18;
  }
LABEL_26:
  __break(1u);
}

unint64_t sub_235E5D3E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235E6173C();
  sub_235E61064();
  v4 = sub_235E61754();
  return sub_235E5D44C(a1, a2, v4);
}

unint64_t sub_235E5D44C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235E616D0() & 1) == 0)
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
      while (!v14 && (sub_235E616D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_235E5D52C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256387300);
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
  result = sub_235E61640();
  __break(1u);
  return result;
}

void sub_235E5D678(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_235E5D6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  if (a6)
    return 0;
  if (v8)
  {
    if (v9)
    {
      sub_235E26AC8(0, &qword_256386088);
      sub_235E34E50(v9, v7, 0);
      sub_235E34E50(v8, v6, 0);
      v10 = sub_235E612C8();
      sub_235E34EA4(v9, v7, 0);
      sub_235E34EA4(v8, v6, 0);
      if ((v10 & 1) != 0)
        return 1;
    }
    return 0;
  }
  if (v9)
  {
    sub_235E34EA4(0, v6, 0);
    return 0;
  }
  return 1;
}

void sub_235E5D908(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563872F8);
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 32) = CFSTR("SilentMode");
  *(_OWORD *)(inited + 16) = xmmword_235E64260;
  *(_QWORD *)(inited + 40) = CFSTR("Focus");
  *(_QWORD *)(inited + 48) = CFSTR("Camera");
  *(_QWORD *)(inited + 56) = CFSTR("Flashlight");
  *(_QWORD *)(inited + 64) = CFSTR("VoiceMemos");
  *(_QWORD *)(inited + 72) = CFSTR("MusicRecognition");
  *(_QWORD *)(inited + 80) = CFSTR("Translate");
  *(_QWORD *)(inited + 88) = CFSTR("Magnifier");
  *(_QWORD *)(inited + 96) = CFSTR("Controls");
  *(_QWORD *)(inited + 104) = CFSTR("Shortcuts");
  *(_QWORD *)(inited + 112) = CFSTR("Accessibility");
  *(_QWORD *)(inited + 120) = CFSTR("Nothing");
  __asm { BR              X10 }
}

uint64_t sub_235E5DA08(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  uint64_t v44;
  char v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  char v62;
  char v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  _DWORD *v67;
  void *v69;
  char v70;

  v49 = CFSTR("Controls");
  v50 = CFSTR("Controls");
  v51 = CFSTR("SilentMode");
  v52 = CFSTR("Focus");
  v53 = CFSTR("Camera");
  v54 = CFSTR("Flashlight");
  v55 = CFSTR("VoiceMemos");
  v56 = CFSTR("MusicRecognition");
  v57 = CFSTR("Translate");
  v58 = CFSTR("Magnifier");
  v59 = CFSTR("Shortcuts");
  v60 = CFSTR("Accessibility");
  v61 = CFSTR("Nothing");
  sub_235E5C8BC((uint64_t)CFSTR("Controls"), v48);
  v63 = v62;

  if ((v63 & 1) == 0)
    __asm { BR              X10 }
  swift_setDeallocating();
  type metadata accessor for WFStaccatoActionSectionIdentifier(0);
  swift_arrayDestroy();
  if (qword_2563854D0 != -1)
    swift_once();
  v64 = sub_235E60AA0();
  __swift_project_value_buffer(v64, (uint64_t)qword_256386DC8);
  sub_235E34E50(v47, v44, v45);
  sub_235E34E50(v69, v46, v70);
  sub_235E34E50(v47, v44, v45);
  sub_235E34E50(v69, v46, v70);
  v65 = sub_235E60A88();
  v66 = sub_235E61184();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (_DWORD *)swift_slowAlloc();
    swift_slowAlloc();
    *v67 = 136315394;
    __asm { BR              X10 }
  }
  sub_235E34EA4(v47, v44, v45);
  sub_235E34EA4(v47, v44, v45);
  sub_235E34EA4(v69, v46, v70);
  sub_235E34EA4(v69, v46, v70);

  return 0;
}

uint64_t sub_235E5E118@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_235E60A7C();
  result = sub_235E60A70();
  *a1 = result;
  return result;
}

uint64_t sub_235E5E174()
{
  return swift_deallocObject();
}

id sub_235E5E184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v14;
  id v15;
  uint64_t v16;
  id v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v14 = &v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_cancellableBag] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions] = a1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_initialIndex] = a2;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButtonViewModel] = a3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButtonViewModel] = a4;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButtonViewModel] = a5;
  *(_QWORD *)&v6[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButtonViewModel] = a6;
  v19.receiver = v6;
  v19.super_class = ObjectType;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v15 = objc_msgSendSuper2(&v19, sel_initWithFrame_, 0.0, 0.0, 100.0, 100.0);
  v16 = *MEMORY[0x24BEBE090];
  v17 = v15;
  objc_msgSend(v17, sel_setMaximumContentSizeCategory_, v16, v19.receiver, v19.super_class);
  sub_235E5E354();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v17;
}

void sub_235E5E354()
{
  char *v0;
  char *v1;
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
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void (*v30)(uint64_t *, _QWORD);
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  double v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  void *v152;
  void *v153;
  id v154;
  id v155;
  double v156;
  double v157;
  uint64_t v158;
  void *v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  void *v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  id v174;
  id v175;
  void *v176;
  void *v177;
  id v178;
  _QWORD v179[2];
  id v180;
  uint64_t v181;
  __int128 v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385DC8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v179 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256385E10);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v179 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235E60AF4();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_235E613E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v179 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7D0]), sel_init);
  v14 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
  v15 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl] = v13;

  if (!*(_QWORD *)&v0[v14])
  {
    __break(1u);
    goto LABEL_74;
  }
  objc_msgSend(v0, sel_addSubview_);
  v16 = *(void **)&v0[v14];
  if (!v16)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  v17 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions;
  objc_msgSend(v16, sel_setNumberOfPages_, *(_QWORD *)(*(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions] + 16));
  v18 = *(void **)&v1[v14];
  if (!v18)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  objc_msgSend(v18, sel__setPreferredNumberOfVisibleIndicators_, *(_QWORD *)(*(_QWORD *)&v1[v17] + 16));
  v19 = *(void **)&v1[v14];
  if (!v19)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  objc_msgSend(v19, sel_setCurrentPage_, *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_initialIndex]);
  v20 = *(void **)&v1[v14];
  if (!v20)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  objc_msgSend(v20, sel_setBackgroundStyle_, 2);
  v21 = *(void **)&v1[v14];
  if (!v21)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  v183 = (uint64_t)v4;
  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v181 = v14;
  v22 = *(void **)&v1[v14];
  if (!v22)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  objc_msgSend(v22, sel_addTarget_action_forControlEvents_, v1, sel_pageControlValueChanged, 4096);
  v23 = sub_235E2C48C();
  v24 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel];
  v184 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel] = v23;

  v25 = sub_235E2C5B4();
  v26 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel];
  *(_QWORD *)&v182 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel] = v25;

  v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for HighlightAnimatingMenuButton();
  sub_235E26AC8(0, (unint64_t *)&qword_256385DF8);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_235E60810;
  *(_QWORD *)(v28 + 24) = v27;
  swift_retain_n();
  sub_235E612D4();
  v29 = (void *)sub_235E6140C();
  sub_235E613DC();
  sub_235E61364();
  sub_235E6134C();
  sub_235E60AE8();
  sub_235E612F8();
  v30 = (void (*)(uint64_t *, _QWORD))sub_235E612EC();
  sub_235E60AC4();
  v30(v185, 0);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_235E60B24();
  v31 = sub_235E60B18();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v7, 0, 1, v31);
  sub_235E61388();
  v32 = v183;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v183, v12, v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
  v33 = v29;
  sub_235E61400();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release_n();
  v34 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton;
  v35 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton] = v29;

  v37 = *(void **)&v1[v34];
  if (!v37)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  LODWORD(v36) = 1148846080;
  objc_msgSend(v37, sel_setContentHuggingPriority_forAxis_, 1, v36);
  v38 = *(void **)&v1[v34];
  if (!v38)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  v39 = *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButtonViewModel];
  v40 = v38;
  sub_235E37790(v39);

  v41 = &v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_cancellableBag];
  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  type metadata accessor for ConfigureButton();
  v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v43 = sub_235E41C34(0, (uint64_t)sub_235E6085C, v42);
  swift_release_n();
  v44 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton;
  v45 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton] = v43;

  v47 = *(void **)&v1[v44];
  if (!v47)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  LODWORD(v46) = 1148846080;
  objc_msgSend(v47, sel_setContentHuggingPriority_forAxis_, 1, v46);
  v48 = *(void **)&v1[v44];
  if (!v48)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  v49 = *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButtonViewModel];
  v50 = v48;
  sub_235E37790(v49);

  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  v51 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v52 = sub_235E41C34(1, (uint64_t)sub_235E6087C, v51);
  swift_release_n();
  v53 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton;
  v54 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton] = v52;

  v56 = *(void **)&v1[v53];
  if (!v56)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  LODWORD(v55) = 1148846080;
  objc_msgSend(v56, sel_setContentHuggingPriority_forAxis_, 1, v55);
  v57 = *(void **)&v1[v53];
  if (!v57)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  v58 = *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButtonViewModel];
  v59 = v57;
  sub_235E37790(v58);

  swift_beginAccess();
  sub_235E60B6C();
  swift_endAccess();
  swift_release();
  v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  LODWORD(v61) = 1132068864;
  objc_msgSend(v60, sel_setContentHuggingPriority_forAxis_, 1, v61);
  v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563859D8);
  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_235E64270;
  v63 = *(void **)&v1[v184];
  if (!v63)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  v179[1] = v41;
  *(_QWORD *)(v62 + 32) = v63;
  v64 = *(void **)&v1[v182];
  if (!v64)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  *(_QWORD *)(v62 + 40) = v64;
  v65 = *(void **)&v1[v34];
  if (!v65)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  *(_QWORD *)(v62 + 48) = v65;
  v66 = *(void **)&v1[v44];
  if (!v66)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v182 = xmmword_235E64270;
  *(_QWORD *)(v62 + 56) = v66;
  v67 = *(void **)&v1[v53];
  if (!v67)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  *(_QWORD *)(v62 + 64) = v67;
  *(_QWORD *)(v62 + 72) = v60;
  v185[0] = v62;
  sub_235E610C4();
  v68 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  sub_235E26AC8(0, &qword_256386268);
  v180 = v60;
  v69 = v63;
  v70 = v64;
  v71 = v65;
  v72 = v66;
  v73 = v67;
  v74 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  v75 = objc_msgSend(v68, sel_initWithArrangedSubviews_, v74);

  v76 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView;
  v77 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView] = v75;

  v78 = *(void **)&v1[v76];
  if (!v78)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  objc_msgSend(v78, sel_setAxis_, 1);
  v79 = *(void **)&v1[v76];
  v80 = v181;
  if (!v79)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  objc_msgSend(v79, sel_setAlignment_, 3);
  v81 = *(void **)&v1[v76];
  if (!v81)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  objc_msgSend(v81, sel_setSpacing_, 24.0);
  v82 = *(void **)&v1[v76];
  if (!v82)
  {
LABEL_94:
    __break(1u);
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  v83 = qword_256385460;
  v84 = v82;
  if (v83 != -1)
    swift_once();
  if (!*(_QWORD *)&v1[v184])
    goto LABEL_95;
  objc_msgSend(v84, sel_setCustomSpacing_afterView_, *(double *)&qword_256387460);

  v85 = *(void **)&v1[v76];
  if (!v85)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  objc_msgSend(v85, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v86 = *(void **)&v1[v76];
  if (!v86)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  v87 = objc_msgSend(v86, sel_layer);
  objc_msgSend(v87, sel_setAllowsGroupOpacity_, 0);

  v88 = *(void **)&v1[v76];
  if (!v88)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v89 = objc_msgSend(v88, sel_layer);
  objc_msgSend(v89, sel_setAllowsGroupBlending_, 0);

  v90 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD918]), sel_init);
  v91 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer;
  v92 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer];
  *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer] = v90;

  v93 = *(void **)&v1[v91];
  if (!v93)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  objc_msgSend(v93, sel_setUserInteractionEnabled_, 1);
  v94 = *(void **)&v1[v91];
  if (!v94)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  objc_msgSend(v94, sel_setDirectionalLockEnabled_, 1);
  v95 = *(void **)&v1[v91];
  if (!v95)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  objc_msgSend(v95, sel_setShowsVerticalScrollIndicator_, 0);
  v96 = *(void **)&v1[v91];
  if (!v96)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  if (!*(_QWORD *)&v1[v76])
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  objc_msgSend(v96, sel_addSubview_);
  v97 = *(void **)&v1[v91];
  if (!v97)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  objc_msgSend(v97, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  if (!*(_QWORD *)&v1[v91])
  {
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  objc_msgSend(v1, sel_addSubview_);
  v98 = objc_msgSend(v1, sel_traitCollection);
  v99 = objc_msgSend(v98, sel_preferredContentSizeCategory);

  v100 = *MEMORY[0x24BEBE0A0];
  LOBYTE(v98) = sub_235E6125C();

  if ((v98 & 1) != 0)
    v101 = 32.0;
  else
    v101 = 44.0;
  v102 = swift_allocObject();
  *(_OWORD *)(v102 + 16) = v182;
  v103 = *(void **)&v1[v80];
  if (!v103)
    goto LABEL_106;
  v104 = objc_msgSend(v103, sel_topAnchor);
  v105 = objc_msgSend(v1, sel_topAnchor);
  v106 = objc_msgSend(v104, sel_constraintEqualToAnchor_, v105);

  *(_QWORD *)(v102 + 32) = v106;
  v107 = *(void **)&v1[v80];
  if (!v107)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  v184 = v100;
  v108 = objc_msgSend(v107, sel_centerXAnchor);
  v109 = objc_msgSend(v1, sel_centerXAnchor);
  v110 = objc_msgSend(v108, sel_constraintEqualToAnchor_, v109);

  *(_QWORD *)(v102 + 40) = v110;
  v111 = *(void **)&v1[v91];
  if (!v111)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v112 = objc_msgSend(v111, sel_leadingAnchor);
  v113 = objc_msgSend(v1, sel_leadingAnchor);
  v114 = objc_msgSend(v112, sel_constraintEqualToAnchor_constant_, v113, v101);

  *(_QWORD *)(v102 + 48) = v114;
  v115 = *(void **)&v1[v91];
  if (!v115)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v116 = objc_msgSend(v115, sel_trailingAnchor);
  v117 = objc_msgSend(v1, sel_trailingAnchor);
  v118 = objc_msgSend(v116, sel_constraintEqualToAnchor_constant_, v117, -v101);

  *(_QWORD *)(v102 + 56) = v118;
  v119 = *(void **)&v1[v91];
  if (!v119)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v120 = objc_msgSend(v119, sel_topAnchor);
  v121 = *(void **)&v1[v80];
  if (!v121)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  v122 = objc_msgSend(v121, sel_bottomAnchor);
  v123 = objc_msgSend(v120, sel_constraintEqualToAnchor_constant_, v122, 24.0);

  *(_QWORD *)(v102 + 64) = v123;
  v124 = *(void **)&v1[v76];
  if (!v124)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  v125 = objc_msgSend(v124, sel_widthAnchor);
  v126 = *(void **)&v1[v91];
  if (!v126)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  v127 = v125;
  v128 = (void *)objc_opt_self();
  v129 = objc_msgSend(v126, sel_widthAnchor);
  v130 = objc_msgSend(v127, sel_constraintEqualToAnchor_, v129);

  *(_QWORD *)(v102 + 72) = v130;
  v185[0] = v102;
  sub_235E610C4();
  v131 = sub_235E26AC8(0, &qword_256386270);
  v132 = (void *)sub_235E610A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v128, sel_activateConstraints_, v132);

  v133 = *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButtonViewModel];
  if (v133)
  {
    v134 = *(_QWORD *)(v133 + 16);
    v135 = *(_QWORD *)(v134 + 24);
    v181 = v131;
    *(_QWORD *)&v182 = v128;
    if (v135)
    {
      v136 = *(_QWORD *)(v134 + 16);
      swift_bridgeObjectRetain();
    }
    else
    {
      v136 = 0;
      v135 = 0xE000000000000000;
    }
    v143 = (void *)objc_opt_self();
    swift_retain();
    v144 = objc_msgSend(v143, sel_whiteColor);
    v145 = objc_msgSend(v143, sel_grayColor);
    v146 = objc_msgSend(v143, sel_systemBlueColor);
    v147 = objc_msgSend(v143, sel_grayColor);
    v148 = objc_msgSend(v147, sel_colorWithAlphaComponent_, 0.1);

    v149 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    v150 = sub_235E38A04(v136, v135, v144, v145, v146, v148, (uint64_t)sub_235E6089C, v149);
    swift_bridgeObjectRelease();

    swift_release_n();
    v151 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton;
    v152 = *(void **)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton];
    *(_QWORD *)&v1[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton] = v150;

    v153 = *(void **)&v1[v151];
    if (v153)
    {
      objc_msgSend(v153, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      if (*(_QWORD *)&v1[v151])
      {
        objc_msgSend(v1, sel_addSubview_);
        v154 = objc_msgSend(v1, sel_traitCollection);
        v155 = objc_msgSend(v154, sel_preferredContentSizeCategory);

        LOBYTE(v154) = sub_235E61250();
        v156 = 0.0;
        if ((v154 & 1) != 0)
        {
          if (qword_256385490 != -1)
            swift_once();
          v157 = *(double *)&qword_256387488;
          if (qword_256385498 != -1)
            swift_once();
          v156 = v157 + *(double *)&qword_256387490;
        }
        v158 = swift_allocObject();
        *(_OWORD *)(v158 + 16) = xmmword_235E63640;
        v159 = *(void **)&v1[v91];
        if (v159)
        {
          v160 = objc_msgSend(v159, sel_bottomAnchor);
          v161 = *(void **)&v1[v151];
          if (v161)
          {
            v162 = objc_msgSend(v161, sel_topAnchor);
            v163 = objc_msgSend(v160, sel_constraintEqualToAnchor_, v162);

            *(_QWORD *)(v158 + 32) = v163;
            v164 = *(void **)&v1[v151];
            if (v164)
            {
              v165 = objc_msgSend(v164, sel_leadingAnchor);
              v166 = objc_msgSend(v1, sel_leadingAnchor);
              if (qword_256385480 != -1)
                swift_once();
              v167 = objc_msgSend(v165, sel_constraintEqualToAnchor_constant_, v166, *(double *)&qword_256387478);

              *(_QWORD *)(v158 + 40) = v167;
              v168 = *(void **)&v1[v151];
              if (v168)
              {
                v169 = objc_msgSend(v168, sel_trailingAnchor);
                v170 = objc_msgSend(v1, sel_trailingAnchor);
                v171 = objc_msgSend(v169, sel_constraintEqualToAnchor_constant_, v170, -*(double *)&qword_256387478);

                *(_QWORD *)(v158 + 48) = v171;
                v172 = *(void **)&v1[v151];
                if (v172)
                {
                  v173 = objc_msgSend(v172, sel_bottomAnchor);
                  v174 = objc_msgSend(v1, sel_bottomAnchor);
                  if (qword_256385488 != -1)
                    swift_once();
                  v175 = objc_msgSend(v173, sel_constraintEqualToAnchor_constant_, v174, -(v156 + *(double *)&qword_256387480));

                  *(_QWORD *)(v158 + 56) = v175;
                  v185[0] = v158;
                  sub_235E610C4();
                  v176 = (void *)sub_235E610A0();
                  swift_bridgeObjectRelease();
                  objc_msgSend((id)v182, sel_activateConstraints_, v176);

                  v177 = *(void **)&v1[v151];
                  if (v177)
                  {
                    v178 = v177;
                    sub_235E37790(v133);

                    swift_beginAccess();
                    sub_235E60B6C();
                    swift_endAccess();
                    swift_release();
                    swift_release();
                    goto LABEL_72;
                  }
                  goto LABEL_121;
                }
LABEL_120:
                __break(1u);
LABEL_121:
                __break(1u);
                goto LABEL_122;
              }
LABEL_119:
              __break(1u);
              goto LABEL_120;
            }
LABEL_118:
            __break(1u);
            goto LABEL_119;
          }
LABEL_117:
          __break(1u);
          goto LABEL_118;
        }
LABEL_116:
        __break(1u);
        goto LABEL_117;
      }
LABEL_115:
      __break(1u);
      goto LABEL_116;
    }
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  v137 = swift_allocObject();
  *(_OWORD *)(v137 + 16) = xmmword_235E62C40;
  v138 = *(void **)&v1[v91];
  if (v138)
  {
    v139 = objc_msgSend(v138, sel_bottomAnchor);
    v140 = objc_msgSend(v1, sel_bottomAnchor);
    v141 = objc_msgSend(v139, sel_constraintEqualToAnchor_, v140);

    *(_QWORD *)(v137 + 32) = v141;
    v185[0] = v137;
    sub_235E610C4();
    v142 = (void *)sub_235E610A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v128, sel_activateConstraints_, v142);

LABEL_72:
    return;
  }
LABEL_122:
  __break(1u);
}

uint64_t sub_235E5F754(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(void);

  v3 = a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x23B7E3E6C](v3);
  if (result)
  {
    v5 = (void *)result;
    v6 = *(_QWORD *)(result + *a2);
    swift_retain();

    v7 = *(_QWORD **)(v6 + 16);
    v8 = v7[2];
    v9 = v7[3];
    v10 = (void *)v7[4];
    v11 = (void (*)(void))v7[7];
    sub_235E380A0(v8, v9, v10);
    result = swift_release();
    if (v9)
    {
      swift_retain();
      sub_235E37740(v8, v9, v10);
      v11();
      return swift_release();
    }
  }
  return result;
}

void sub_235E5F840(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (*v9)(void);

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x23B7E3E6C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButtonViewModel);
    swift_retain();

    if (v4)
    {
      v5 = *(_QWORD **)(v4 + 16);
      v6 = v5[2];
      v7 = v5[3];
      v8 = (void *)v5[4];
      v9 = (void (*)(void))v5[7];
      sub_235E380A0(v6, v7, v8);
      swift_release();
      if (v7)
      {
        swift_retain();
        sub_235E37740(v6, v7, v8);
        v9();
        swift_release();
      }
    }
  }
}

void sub_235E5F930()
{
  char *v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  double Width;
  void *v30;
  double v31;
  double MaxY;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  id v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[3];
  uint64_t v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v50.receiver = v0;
  v50.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v50, sel_layoutSubviews);
  v2 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
  if (!v2)
  {
    __break(1u);
    goto LABEL_33;
  }
  v3 = (unint64_t)objc_msgSend(v2, sel_currentPage);
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_actions];
    if (v3 < *(_QWORD *)(v4 + 16))
    {
      sub_235E34F3C(v4 + 40 * v3 + 32, (uint64_t)v48);
      v5 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel];
      if (v5)
      {
        __swift_project_boxed_opaque_existential_1(v48, v49);
        v6 = qword_256385450;
        swift_bridgeObjectRetain();
        v1 = v5;
        if (v6 == -1)
          goto LABEL_6;
        goto LABEL_31;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_31:
  swift_once();
LABEL_6:
  v7 = *(double *)&qword_256387450;
  v8 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  swift_bridgeObjectRetain();
  v9 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithString_, v9);

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  objc_msgSend(v11, sel_setLineSpacing_, v7);
  objc_msgSend(v11, sel_setAlignment_, 1);
  objc_msgSend(v11, sel_setLineBreakStrategy_, 1);
  v12 = *MEMORY[0x24BEBB3A8];
  v13 = v11;
  objc_msgSend(v10, sel_addAttribute_value_range_, v12, v13, 0, objc_msgSend(v10, sel_length));

  objc_msgSend(v1, sel_setAttributedText_, v10);
  swift_bridgeObjectRelease();

  v14 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel];
  if (!v14)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v15 = qword_256385458;
  swift_bridgeObjectRetain();
  v16 = v14;
  if (v15 != -1)
    swift_once();
  v17 = *(double *)&qword_256387458;
  v18 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  swift_bridgeObjectRetain();
  v19 = (void *)sub_235E61028();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v18, sel_initWithString_, v19);

  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  objc_msgSend(v21, sel_setLineSpacing_, v17);
  objc_msgSend(v21, sel_setAlignment_, 1);
  objc_msgSend(v21, sel_setLineBreakStrategy_, 1);
  v22 = v21;
  objc_msgSend(v20, sel_addAttribute_value_range_, v12, v22, 0, objc_msgSend(v20, sel_length));

  objc_msgSend(v16, sel_setAttributedText_, v20);
  swift_bridgeObjectRelease();

  v23 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView;
  v24 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView];
  if (!v24)
    goto LABEL_35;
  objc_msgSend(v24, sel_layoutSubviews);
  v25 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer;
  v26 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer];
  if (!v26)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v27 = *(void **)&v0[v23];
  if (!v27)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v28 = v26;
  objc_msgSend(v27, sel_bounds);
  Width = CGRectGetWidth(v51);
  v30 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton];
  if (!v30)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v31 = Width;
  objc_msgSend(v30, sel_frame);
  MaxY = CGRectGetMaxY(v52);
  v33 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton];
  if (!v33)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v34 = MaxY;
  objc_msgSend(v33, sel_frame);
  v35 = CGRectGetMaxY(v53);
  v36 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton];
  if (!v36)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v37 = v35;
  objc_msgSend(v36, sel_frame);
  v38 = CGRectGetMaxY(v54);
  if (v37 > v38)
    v38 = v37;
  if (v34 <= v38)
    v34 = v38;
  if (qword_256385468 != -1)
    swift_once();
  objc_msgSend(v28, sel_setContentSize_, v31, v34 + *(double *)&qword_256387468);

  v39 = *(void **)&v0[v25];
  if (!v39)
    goto LABEL_41;
  v40 = v39;
  objc_msgSend(v40, sel_contentSize);
  v42 = *(void **)&v0[v25];
  if (!v42)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v43 = v41;
  objc_msgSend(v42, sel_bounds);
  objc_msgSend(v40, sel_setScrollEnabled_, CGRectGetHeight(v55) < v43);

  v44 = *(void **)&v0[v25];
  if (!v44)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v45 = v44;
  objc_msgSend(v45, sel_setShowsVerticalScrollIndicator_, objc_msgSend(v45, sel_isScrollEnabled));

  v46 = *(void **)&v0[v25];
  if (!v46)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!objc_msgSend(v46, sel_isScrollEnabled))
  {
LABEL_28:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    return;
  }
  v47 = *(void **)&v0[v25];
  if (v47)
  {
    objc_msgSend(v47, sel_flashScrollIndicators);
    goto LABEL_28;
  }
LABEL_45:
  __break(1u);
}

void sub_235E5FF6C()
{
  char *v0;
  void (*v1)(id);
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void (**)(id))&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler];
  if (v1)
  {
    v2 = OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl;
    v3 = *(void **)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
    if (v3)
    {
      swift_retain();
      if (!objc_msgSend(v3, sel_interactionState))
      {
LABEL_6:
        sub_235E34DD0((uint64_t)v1);
        return;
      }
      v4 = *(void **)&v0[v2];
      if (v4)
      {
        v1(objc_msgSend(v4, sel_currentPage));
        objc_msgSend(v0, sel_setNeedsLayout);
        goto LABEL_6;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_235E6005C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  uint64_t KeyPath;
  uint64_t v14;
  id v15;
  unsigned int v16;
  double v17;
  id v18;
  id v20;

  v6 = sub_235E609BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v10 = MEMORY[0x23B7E3E6C](a2 + 16);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!v10)
    return v11(a3, a1, v6);
  v12 = (void *)v10;
  v11((uint64_t)v9, a1, v6);
  KeyPath = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x24BDAC7A8](KeyPath);
  swift_getKeyPath();
  v20 = sub_235E2C364(*MEMORY[0x24BEBE1D0]);
  sub_235E415F8();
  sub_235E609B0();
  v14 = swift_getKeyPath();
  *(&v20 - 2) = (id)MEMORY[0x24BDAC7A8](v14);
  swift_getKeyPath();
  v15 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  v16 = objc_msgSend(v12, sel_isHighlighted);
  v17 = 1.0;
  if (v16)
    v17 = 0.5;
  v18 = objc_msgSend(v15, sel_colorWithAlphaComponent_, v17);

  v20 = v18;
  sub_235E38F4C();
  sub_235E609B0();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t type metadata accessor for ActionDetailsView()
{
  return objc_opt_self();
}

void sub_235E603D8()
{
  char *v0;
  char *v1;

  v1 = &v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_selectionHandler];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_titleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_subtitleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_cancellableBag] = MEMORY[0x24BEE4B08];

  sub_235E615F8();
  __break(1u);
}

_OWORD *sub_235E604CC(double a1, double a2)
{
  char *v2;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  _OWORD *result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  CGPoint v43;
  CGRect v44;

  if (objc_msgSend(v2, sel_isUserInteractionEnabled))
  {
    objc_msgSend(v2, sel_convertPoint_toView_, 0, a1, a2);
    v6 = v5;
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563859D8);
    result = (_OWORD *)swift_allocObject();
    result[1] = xmmword_235E63660;
    v10 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButton];
    if (!v10)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    *((_QWORD *)result + 4) = v10;
    v11 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButton];
    if (!v11)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    *((_QWORD *)result + 5) = v11;
    v12 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButton];
    if (!v12)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    *((_QWORD *)result + 6) = v12;
    v13 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_pageControl];
    if (!v13)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    *((_QWORD *)result + 7) = v13;
    v14 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_stackViewScrollContainer];
    if (!v14)
    {
LABEL_33:
      __break(1u);
      return result;
    }
    *((_QWORD *)result + 8) = v14;
    v42 = (unint64_t)result;
    sub_235E610C4();
    v15 = v42;
    v16 = *(void **)&v2[OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_primaryButton];
    if (v16)
    {
      v17 = v16;
      v18 = v10;
      v19 = v11;
      v20 = v12;
      v21 = v13;
      v22 = v14;
      v15 = (unint64_t)v17;
      MEMORY[0x23B7E3170]();
      if (*(_QWORD *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_27:
        sub_235E610D0();
      sub_235E610E8();
      sub_235E610C4();

      v15 = v42;
      if (!(v42 >> 62))
      {
LABEL_10:
        v23 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v23)
          goto LABEL_11;
LABEL_19:
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    else
    {
      v37 = v10;
      v38 = v11;
      v39 = v12;
      v40 = v13;
      v41 = v14;
      if (!(v42 >> 62))
        goto LABEL_10;
    }
    swift_bridgeObjectRetain();
    v23 = sub_235E61610();
    if (v23)
    {
LABEL_11:
      v24 = 4;
      while (1)
      {
        if ((v15 & 0xC000000000000001) != 0)
          v25 = (id)MEMORY[0x23B7E35E4](v24 - 4, v15);
        else
          v25 = *(id *)(v15 + 8 * v24);
        v26 = v25;
        v27 = v24 - 3;
        if (__OFADD__(v24 - 4, 1))
        {
          __break(1u);
          goto LABEL_27;
        }
        result = objc_msgSend(v25, sel_superview);
        if (!result)
          break;
        v28 = result;
        objc_msgSend(v26, sel_frame);
        objc_msgSend(v28, sel_convertRect_toView_, 0);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        v36 = v35;

        v44.origin.x = v30;
        v44.origin.y = v32;
        v44.size.width = v34;
        v44.size.height = v36;
        v43.x = v6;
        v43.y = v8;
        if (CGRectContainsPoint(v44, v43))
        {
          swift_bridgeObjectRelease_n();
          return v26;
        }

        ++v24;
        if (v27 == v23)
          goto LABEL_19;
      }
      __break(1u);
      goto LABEL_29;
    }
    goto LABEL_19;
  }
  return 0;
}

uint64_t sub_235E607EC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235E60810()
{
  uint64_t v0;

  return sub_235E5F754(v0, &OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_emptyStateConfigureButtonViewModel);
}

uint64_t sub_235E60830()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235E60854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_235E6005C(a1, v2, a2);
}

uint64_t sub_235E6085C()
{
  uint64_t v0;

  return sub_235E5F754(v0, &OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_configureButtonViewModel);
}

uint64_t sub_235E6087C()
{
  uint64_t v0;

  return sub_235E5F754(v0, &OBJC_IVAR____TtC27ActionButtonConfigurationUI17ActionDetailsView_secondaryConfigureButtonViewModel);
}

void sub_235E6089C()
{
  uint64_t v0;

  sub_235E5F840(v0);
}

uint64_t sub_235E608B0()
{
  return 8;
}

uint64_t sub_235E608BC()
{
  return swift_release();
}

uint64_t sub_235E608C4(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_235E608D8(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_235E608F0()
{
  return 8;
}

uint64_t sub_235E60914()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_235E60944()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_235E60950()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_235E6095C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_235E60968()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_235E60974()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_235E60980()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_235E6098C()
{
  return MEMORY[0x24BEBBE40]();
}

uint64_t sub_235E60998()
{
  return MEMORY[0x24BEBBE48]();
}

uint64_t sub_235E609A4()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_235E609B0()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_235E609BC()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_235E609C8()
{
  return MEMORY[0x24BEBBE70]();
}

uint64_t sub_235E609D4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_235E609E0()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_235E609EC()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_235E609F8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_235E60A04()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_235E60A10()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235E60A1C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_235E60A28()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_235E60A34()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_235E60A40()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_235E60A4C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_235E60A58()
{
  return MEMORY[0x24BE16898]();
}

uint64_t sub_235E60A64()
{
  return MEMORY[0x24BE168A0]();
}

uint64_t sub_235E60A70()
{
  return MEMORY[0x24BEC52E8]();
}

uint64_t sub_235E60A7C()
{
  return MEMORY[0x24BEC52F0]();
}

uint64_t sub_235E60A88()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235E60A94()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235E60AA0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235E60AAC()
{
  return MEMORY[0x24BEBC108]();
}

uint64_t sub_235E60AB8()
{
  return MEMORY[0x24BEBC210]();
}

uint64_t sub_235E60AC4()
{
  return MEMORY[0x24BEBC3A0]();
}

uint64_t sub_235E60AD0()
{
  return MEMORY[0x24BEBC3A8]();
}

uint64_t sub_235E60ADC()
{
  return MEMORY[0x24BEBC3E8]();
}

uint64_t sub_235E60AE8()
{
  return MEMORY[0x24BEBC3F0]();
}

uint64_t sub_235E60AF4()
{
  return MEMORY[0x24BEBC408]();
}

uint64_t sub_235E60B00()
{
  return MEMORY[0x24BEBC8E0]();
}

uint64_t sub_235E60B0C()
{
  return MEMORY[0x24BEBC8F0]();
}

uint64_t sub_235E60B18()
{
  return MEMORY[0x24BEBCB48]();
}

uint64_t sub_235E60B24()
{
  return MEMORY[0x24BEBCB58]();
}

uint64_t sub_235E60B30()
{
  return MEMORY[0x24BDB9448]();
}

uint64_t sub_235E60B3C()
{
  return MEMORY[0x24BDB94B0]();
}

uint64_t sub_235E60B48()
{
  return MEMORY[0x24BDB9790]();
}

uint64_t sub_235E60B54()
{
  return MEMORY[0x24BDB9840]();
}

uint64_t sub_235E60B60()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_235E60B6C()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_235E60B78()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_235E60B84()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_235E60B90()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_235E60B9C()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_235E60BA8()
{
  return MEMORY[0x24BDB9D98]();
}

uint64_t sub_235E60BB4()
{
  return MEMORY[0x24BDB9DB8]();
}

uint64_t sub_235E60BC0()
{
  return MEMORY[0x24BDB9DC0]();
}

uint64_t sub_235E60BCC()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_235E60BD8()
{
  return MEMORY[0x24BDB9E08]();
}

uint64_t sub_235E60BE4()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_235E60BF0()
{
  return MEMORY[0x24BDB9E78]();
}

uint64_t sub_235E60BFC()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_235E60C08()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_235E60C14()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_235E60C20()
{
  return MEMORY[0x24BDB9F40]();
}

uint64_t sub_235E60C2C()
{
  return MEMORY[0x24BDB9F50]();
}

uint64_t sub_235E60C38()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_235E60C44()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_235E60C50()
{
  return MEMORY[0x24BDB9FD8]();
}

uint64_t sub_235E60C5C()
{
  return MEMORY[0x24BDBA010]();
}

uint64_t sub_235E60C68()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_235E60C74()
{
  return MEMORY[0x24BDBA038]();
}

uint64_t sub_235E60C80()
{
  return MEMORY[0x24BDBA078]();
}

uint64_t sub_235E60C8C()
{
  return MEMORY[0x24BDBA080]();
}

uint64_t sub_235E60C98()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_235E60CA4()
{
  return MEMORY[0x24BDBA0A0]();
}

uint64_t sub_235E60CB0()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_235E60CBC()
{
  return MEMORY[0x24BDBA0D0]();
}

uint64_t sub_235E60CC8()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_235E60CD4()
{
  return MEMORY[0x24BDBA0F0]();
}

uint64_t sub_235E60CE0()
{
  return MEMORY[0x24BDBA0F8]();
}

uint64_t sub_235E60CEC()
{
  return MEMORY[0x24BDBA100]();
}

uint64_t sub_235E60CF8()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_235E60D04()
{
  return MEMORY[0x24BDBA130]();
}

uint64_t sub_235E60D10()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_235E60D1C()
{
  return MEMORY[0x24BDEB1C8]();
}

uint64_t sub_235E60D28()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_235E60D34()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_235E60D40()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_235E60D4C()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_235E60D58()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_235E60D64()
{
  return MEMORY[0x24BDECC00]();
}

uint64_t sub_235E60D70()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_235E60D7C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_235E60D88()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_235E60D94()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_235E60DA0()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_235E60DAC()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_235E60DB8()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_235E60DC4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_235E60DD0()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_235E60DDC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_235E60DE8()
{
  return MEMORY[0x24BDEEF48]();
}

uint64_t sub_235E60DF4()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_235E60E00()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_235E60E0C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_235E60E18()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_235E60E24()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_235E60E30()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_235E60E3C()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_235E60E48()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_235E60E54()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_235E60E60()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_235E60E6C()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_235E60E78()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_235E60E84()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_235E60E90()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_235E60E9C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_235E60EA8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_235E60EB4()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_235E60EC0()
{
  return MEMORY[0x24BDF2948]();
}

uint64_t sub_235E60ECC()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_235E60ED8()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_235E60EE4()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_235E60EF0()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_235E60EFC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_235E60F08()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_235E60F14()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_235E60F20()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_235E60F2C()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_235E60F38()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_235E60F44()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_235E60F50()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_235E60F5C()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_235E60F68()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_235E60F74()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_235E60F80()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_235E60F8C()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_235E60F98()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235E60FA4()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_235E60FB0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235E60FBC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235E60FC8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_235E60FD4()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_235E60FE0()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_235E60FEC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235E60FF8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235E61004()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_235E61010()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_235E6101C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235E61028()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235E61034()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_235E61040()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_235E6104C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235E61058()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_235E61064()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235E61070()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235E6107C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235E61088()
{
  return MEMORY[0x24BDBA170]();
}

uint64_t sub_235E61094()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_235E610A0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235E610AC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235E610B8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_235E610C4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_235E610D0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_235E610DC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_235E610E8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_235E610F4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_235E61100()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_235E6110C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_235E61118()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_235E61124()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_235E61130()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_235E6113C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_235E61148()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_235E61154()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_235E61160()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_235E6116C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_235E61178()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_235E61184()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235E61190()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_235E6119C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235E611A8()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t sub_235E611B4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_235E611C0()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_235E611CC()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_235E611D8()
{
  return MEMORY[0x24BEE5710]();
}

uint64_t sub_235E611E4()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_235E611F0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_235E611FC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_235E61208()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_235E61214()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_235E61220()
{
  return MEMORY[0x24BE16908]();
}

uint64_t sub_235E6122C()
{
  return MEMORY[0x24BE16918]();
}

uint64_t sub_235E61238()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_235E61244()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_235E61250()
{
  return MEMORY[0x24BEBCD58]();
}

uint64_t sub_235E6125C()
{
  return MEMORY[0x24BEBCD60]();
}

uint64_t sub_235E61268()
{
  return MEMORY[0x24BE19B90]();
}

uint64_t sub_235E61274()
{
  return MEMORY[0x24BEBCDC0]();
}

uint64_t sub_235E61280()
{
  return MEMORY[0x24BEBCDC8]();
}

uint64_t sub_235E6128C()
{
  return MEMORY[0x24BEBCE00]();
}

uint64_t sub_235E61298()
{
  return MEMORY[0x24BE19B98]();
}

uint64_t sub_235E612A4()
{
  return MEMORY[0x24BEBCF80]();
}

uint64_t sub_235E612B0()
{
  return MEMORY[0x24BEBCFA0]();
}

uint64_t sub_235E612BC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_235E612C8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_235E612D4()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_235E612E0()
{
  return MEMORY[0x24BEBD038]();
}

uint64_t sub_235E612EC()
{
  return MEMORY[0x24BEBD040]();
}

uint64_t sub_235E612F8()
{
  return MEMORY[0x24BEBD048]();
}

uint64_t sub_235E61304()
{
  return MEMORY[0x24BEBD050]();
}

uint64_t sub_235E61310()
{
  return MEMORY[0x24BEBD080]();
}

uint64_t sub_235E6131C()
{
  return MEMORY[0x24BEBD088]();
}

uint64_t sub_235E61328()
{
  return MEMORY[0x24BEBD090]();
}

uint64_t sub_235E61334()
{
  return MEMORY[0x24BEBD098]();
}

uint64_t sub_235E61340()
{
  return MEMORY[0x24BEBD0B0]();
}

uint64_t sub_235E6134C()
{
  return MEMORY[0x24BEBD0B8]();
}

uint64_t sub_235E61358()
{
  return MEMORY[0x24BEBD0D8]();
}

uint64_t sub_235E61364()
{
  return MEMORY[0x24BEBD120]();
}

uint64_t sub_235E61370()
{
  return MEMORY[0x24BEBD128]();
}

uint64_t sub_235E6137C()
{
  return MEMORY[0x24BEBD138]();
}

uint64_t sub_235E61388()
{
  return MEMORY[0x24BEBD168]();
}

uint64_t sub_235E61394()
{
  return MEMORY[0x24BEBD190]();
}

uint64_t sub_235E613A0()
{
  return MEMORY[0x24BEBD1A0]();
}

uint64_t sub_235E613AC()
{
  return MEMORY[0x24BEBD1A8]();
}

uint64_t sub_235E613B8()
{
  return MEMORY[0x24BEBD1B0]();
}

uint64_t sub_235E613C4()
{
  return MEMORY[0x24BEBD1B8]();
}

uint64_t sub_235E613D0()
{
  return MEMORY[0x24BEBD1C0]();
}

uint64_t sub_235E613DC()
{
  return MEMORY[0x24BEBD1C8]();
}

uint64_t sub_235E613E8()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_235E613F4()
{
  return MEMORY[0x24BEBD210]();
}

uint64_t sub_235E61400()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_235E6140C()
{
  return MEMORY[0x24BEBD220]();
}

uint64_t sub_235E61418()
{
  return MEMORY[0x24BDBA180]();
}

uint64_t sub_235E61424()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235E61430()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235E6143C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235E61448()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_235E61454()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_235E61460()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235E6146C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_235E61478()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_235E61484()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_235E61490()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_235E6149C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_235E614A8()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_235E614B4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_235E614C0()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_235E614CC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_235E614D8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_235E614E4()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_235E614F0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235E614FC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235E61508()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235E61514()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_235E61520()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235E6152C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_235E61538()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_235E61544()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_235E61550()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_235E6155C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_235E61568()
{
  return MEMORY[0x24BEE2EA0]();
}

uint64_t sub_235E61574()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_235E61580()
{
  return MEMORY[0x24BEE2EB0]();
}

uint64_t sub_235E6158C()
{
  return MEMORY[0x24BEE2EC8]();
}

uint64_t sub_235E61598()
{
  return MEMORY[0x24BEE2ED0]();
}

uint64_t sub_235E615A4()
{
  return MEMORY[0x24BEE2ED8]();
}

uint64_t sub_235E615B0()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_235E615BC()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_235E615C8()
{
  return MEMORY[0x24BEE2F10]();
}

uint64_t sub_235E615D4()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_235E615E0()
{
  return MEMORY[0x24BEE2F30]();
}

uint64_t sub_235E615EC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235E615F8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_235E61604()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_235E61610()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235E6161C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235E61628()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235E61634()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235E61640()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235E6164C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_235E61658()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_235E61664()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_235E61670()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_235E6167C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_235E61688()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_235E61694()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_235E616A0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_235E616AC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_235E616B8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_235E616C4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_235E616D0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235E616DC()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_235E616E8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_235E616F4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_235E61700()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235E6170C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235E61718()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235E61724()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235E61730()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_235E6173C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235E61748()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235E61754()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235E61760()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_235E6176C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_235E61778()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_235E61784()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_235E61790()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t ABLoadResourcesWithCompletion()
{
  return MEMORY[0x24BE00F48]();
}

uint64_t ABReleaseResources()
{
  return MEMORY[0x24BE00F50]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _UIImageIsSystemSymbol()
{
  return MEMORY[0x24BEBEA98]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_deallocBox()
{
  return MEMORY[0x24BEE4BF8]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x24BEE7240]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
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

