uint64_t static ReferenceClock.now.getter()
{
  static ReferenceClock.timeInterval.getter();
  return sub_23B691988();
}

double static ReferenceClock.timeInterval.getter()
{
  uint64_t v0;
  char *v1;
  double Current;
  os_unfair_lock_s *v3;
  double v4;
  double v5;
  double v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFC10);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)v11 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B680458();
  Current = CFAbsoluteTimeGetCurrent();
  if (qword_2542FFBA8 != -1)
    swift_once();
  v3 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
  sub_23B680650(v11);
  v4 = *(double *)v11;
  v5 = *(double *)&v11[1];
  os_unfair_lock_unlock(v3);
  v6 = Current - v4;
  if (v6 - v5 > 86400.0)
  {
    v7 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
    byte_2542FFCD0 = 1;
    os_unfair_lock_unlock(v7);
    v8 = sub_23B691B08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v1, 1, 1, v8);
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = 0;
    *(_QWORD *)(v9 + 24) = 0;
    sub_23B68F180((uint64_t)v1, (uint64_t)&unk_256A3EC38, v9);
    swift_release();
  }
  return v6;
}

BOOL sub_23B680458()
{
  os_unfair_lock_s *v0;
  char v1;
  double v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  void (*v13)();
  uint64_t v14;

  if (qword_2542FFBA8 != -1)
    swift_once();
  v0 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
  sub_23B6805EC((uint64_t)&v9);
  v1 = v9;
  v2 = *(double *)&v10;
  os_unfair_lock_unlock(v0);
  if ((v1 & 1) == 0)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v4 = *MEMORY[0x24BDBCBB8];
    v13 = sub_23B69037C;
    v14 = 0;
    v9 = MEMORY[0x24BDAC760];
    v10 = 1107296256;
    v11 = sub_23B68FF08;
    v12 = &block_descriptor_0;
    v5 = _Block_copy(&v9);
    swift_release();
    v6 = objc_msgSend(v3, sel_addObserverForName_object_queue_usingBlock_, v4, 0, 0, v5);
    _Block_release(v5);

    swift_unknownObjectRelease();
  }
  if (qword_2542FFBC8 != -1)
    swift_once();
  v7 = *(double *)&qword_2542FFBC0;
  if (*(double *)&qword_2542FFBC0 >= v2)
    sub_23B68F698(0);
  return v7 < v2;
}

double sub_23B6805EC@<D0>(uint64_t a1@<X8>)
{
  char v2;
  double result;

  v2 = byte_2542FFBA0;
  byte_2542FFBA0 = 1;
  *(_BYTE *)a1 = v2;
  if (qword_2542FFBD8 != -1)
    swift_once();
  result = *(double *)&qword_2542FFBD0;
  *(_QWORD *)(a1 + 8) = qword_2542FFBD0;
  return result;
}

double sub_23B680650@<D0>(_QWORD *a1@<X8>)
{
  double result;

  *a1 = qword_2542FFBB0;
  if (qword_2542FFBD8 != -1)
    swift_once();
  result = *(double *)&qword_2542FFBD0;
  a1[1] = qword_2542FFBD0;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B86A4F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t AnalyticsEvent.name.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 120));
}

uint64_t AnalyticsEvent.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 128);
  v4 = sub_23B6919DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23B680750@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  swift_beginAccess();
  return sub_23B685578(v3, a1);
}

uint64_t sub_23B6807A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  swift_beginAccess();
  sub_23B685858(a1, v3);
  return swift_endAccess();
}

uint64_t sub_23B6807F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
  swift_beginAccess();
  return sub_23B685578(v3, a1);
}

uint64_t sub_23B680848(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
  swift_beginAccess();
  sub_23B685858(a1, v3);
  return swift_endAccess();
}

uint64_t AnalyticsEvent.__allocating_init(name:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AnalyticsEvent.init(name:)(a1);
  return v2;
}

uint64_t *AnalyticsEvent.init(name:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);

  v3 = *v1;
  swift_defaultActor_initialize();
  sub_23B6919D0();
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 136);
  v5 = sub_23B691C64();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  v6((uint64_t)v1 + *(_QWORD *)(*v1 + 144), 1, 1, v5);
  *(uint64_t *)((char *)v1 + *(_QWORD *)(*v1 + 152)) = MEMORY[0x24BEE4B00];
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 32))((uint64_t)v1 + *(_QWORD *)(*v1 + 120), a1);
  return v1;
}

uint64_t sub_23B6809AC()
{
  return sub_23B6809C4((uint64_t (*)(char *))sub_23B6807A0);
}

uint64_t sub_23B6809B8()
{
  return sub_23B6809C4((uint64_t (*)(char *))sub_23B680848);
}

uint64_t sub_23B6809C4(uint64_t (*a1)(char *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = sub_23B691C7C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDB8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B691C70();
  sub_23B691C4C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v8 = sub_23B691C64();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  return a1(v7);
}

uint64_t sub_23B680AB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;
  uint64_t v9;

  sub_23B691AD8();
  v3 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152));
  swift_beginAccess();
  v4 = *v3;
  if (*(_QWORD *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    v5 = sub_23B683654(v8, v9);
    if ((v6 & 1) != 0)
    {
      sub_23B684C78(*(_QWORD *)(v4 + 56) + 48 * v5, a1);
    }
    else
    {
      *(_QWORD *)(a1 + 32) = 0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_BYTE *)(a1 + 40) = -1;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_BYTE *)(a1 + 40) = -1;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B680BB0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[22] = a2;
  v3[23] = v2;
  v3[21] = a1;
  v4 = *v2;
  v3[24] = *v2;
  v5 = *(_QWORD *)(v4 + 88);
  v3[25] = v5;
  v3[26] = *(_QWORD *)(v5 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_getTupleTypeMetadata2();
  v6 = sub_23B691BA4();
  v3[29] = v6;
  v3[30] = *(_QWORD *)(v6 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B680C78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v8)(void);
  uint64_t (*v10)(void);
  uint64_t v11;

  if (qword_2542FFCE8 != -1)
    swift_once();
  v1 = qword_2542FFFA8;
  sub_23B691AD8();
  LOBYTE(v1) = sub_23B681440(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), v1);
  swift_bridgeObjectRelease();
  if ((v1 & 1) != 0)
  {
    if (qword_2542FFD88 != -1)
      swift_once();
    v2 = sub_23B691A00();
    __swift_project_value_buffer(v2, (uint64_t)qword_2542FFFC8);
    swift_retain_n();
    v3 = sub_23B6919E8();
    v4 = sub_23B691B2C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v11 = v6;
      *(_DWORD *)v5 = 136446210;
      sub_23B691AD8();
      *(_QWORD *)(v0 + 160) = sub_23B683014(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152), &v11);
      sub_23B691BB0();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_23B67E000, v3, v4, "AnalyticsEvent not computing disallowed analytics event %{public}s.", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86A58C](v6, -1, -1);
      MEMORY[0x23B86A58C](v5, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v8 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v10 = (uint64_t (*)(void))(**(int **)(v0 + 168) + *(_QWORD *)(v0 + 168));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v7;
    *v7 = v0;
    v7[1] = sub_23B680F1C;
    v8 = v10;
  }
  return v8();
}

uint64_t sub_23B680F1C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_23B680F7C()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = 0;
  v2 = v0 + 16;
  v42 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 224);
  v45 = v0 + 64;
  v46 = *(_QWORD *)(v0 + 208);
  v41 = *(_QWORD *)(v0 + 272);
  v39 = v41 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v41 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v41 + 64);
  v40 = (unint64_t)(63 - v5) >> 6;
  v7 = (_QWORD *)MEMORY[0x24BEE4B00];
  v43 = *(_QWORD *)(v0 + 224);
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v44 = v1;
      v11 = v10 | (v1 << 6);
      goto LABEL_8;
    }
    v14 = v1 + 1;
    if (__OFADD__(v1, 1))
      goto LABEL_44;
    if (v14 >= v40)
    {
      v44 = v1;
LABEL_14:
      v6 = 0;
      v13 = 1;
      goto LABEL_15;
    }
    v15 = *(_QWORD *)(v39 + 8 * v14);
    if (v15)
      goto LABEL_12;
    if (v1 + 2 < v40)
      break;
    v6 = 0;
    v13 = 1;
    v44 = v1 + 1;
LABEL_15:
    v17 = *(_QWORD *)(v0 + 248);
    v16 = *(_QWORD *)(v0 + 256);
    v19 = *(_QWORD *)(v0 + 224);
    v18 = *(_QWORD *)(v0 + 232);
    v20 = *(_QWORD *)(v3 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v17, v13, 1, v19);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v16, v17, v18);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19) == 1)
    {
      swift_release();
      sub_23B68164C((uint64_t)v7);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
      return;
    }
    v21 = *(_QWORD *)(v0 + 256) + *(int *)(v3 + 48);
    (*(void (**)(_QWORD))(v46 + 32))(*(_QWORD *)(v0 + 216));
    sub_23B684CF0(v21, v2);
    sub_23B691AD8();
    v23 = *(_QWORD *)(v0 + 128);
    v22 = *(_QWORD *)(v0 + 136);
    v24 = v2;
    sub_23B684CB4(v2, v45);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = sub_23B683654(v23, v22);
    v28 = v7[2];
    v29 = (v26 & 1) == 0;
    v30 = v28 + v29;
    if (__OFADD__(v28, v29))
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    v31 = v26;
    if (v7[3] >= v30)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v26 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_23B6848E0();
        if ((v31 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_23B683BAC(v30, isUniquelyReferenced_nonNull_native);
      v32 = sub_23B683654(v23, v22);
      if ((v31 & 1) != (v33 & 1))
      {
        sub_23B691D00();
        return;
      }
      v27 = v32;
      if ((v31 & 1) != 0)
      {
LABEL_4:
        sub_23B684D60(v45, v7[7] + 48 * v27);
        goto LABEL_5;
      }
    }
    v7[(v27 >> 6) + 8] |= 1 << v27;
    v34 = (uint64_t *)(v7[6] + 16 * v27);
    *v34 = v23;
    v34[1] = v22;
    sub_23B684CF0(v45, v7[7] + 48 * v27);
    v35 = v7[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_43;
    v7[2] = v37;
    swift_bridgeObjectRetain();
LABEL_5:
    v8 = *(_QWORD *)(v0 + 216);
    v9 = *(_QWORD *)(v0 + 200);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v2 = v24;
    sub_23B684D2C(v24);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v8, v9);
    v3 = v43;
    v1 = v44;
  }
  v15 = *(_QWORD *)(v39 + 8 * (v1 + 2));
  if (v15)
  {
    v14 = v1 + 2;
    goto LABEL_12;
  }
  v38 = v1 + 3;
  if (v1 + 3 >= v40)
  {
    v44 = v1 + 2;
    goto LABEL_14;
  }
  v15 = *(_QWORD *)(v39 + 8 * v38);
  if (v15)
  {
    v14 = v1 + 3;
LABEL_12:
    v6 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v14 << 6);
    v44 = v14;
LABEL_8:
    v12 = *(_QWORD *)(v0 + 248);
    (*(void (**)(uint64_t, unint64_t, _QWORD))(v46 + 16))(v12, *(_QWORD *)(v41 + 48) + *(_QWORD *)(v46 + 72) * v11, *(_QWORD *)(v0 + 200));
    v3 = v43;
    sub_23B684CB4(*(_QWORD *)(v41 + 56) + 48 * v11, v12 + *(int *)(v43 + 48));
    v13 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    v14 = v38 + 1;
    if (__OFADD__(v38, 1))
      break;
    if (v14 >= v40)
    {
      v6 = 0;
      v13 = 1;
      v44 = v40 - 1;
      goto LABEL_15;
    }
    v15 = *(_QWORD *)(v39 + 8 * v14);
    ++v38;
    if (v15)
      goto LABEL_12;
  }
LABEL_45:
  __break(1u);
}

uint64_t sub_23B681440(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_23B691D60();
    sub_23B691A90();
    v6 = sub_23B691D84();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_23B691CDC() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_23B691CDC() & 1) != 0)
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

uint64_t sub_23B681574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _BYTE v9[48];

  if (*(unsigned __int8 *)(a1 + 40) == 255)
  {
    sub_23B685604(a1, &qword_2542FFD90);
    sub_23B683798(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_23B685604((uint64_t)v9, &qword_2542FFD90);
  }
  else
  {
    sub_23B685640(a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_23B6843D0((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23B68164C(uint64_t a1)
{
  uint64_t v1;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _BYTE *v27;
  unint64_t v28;
  void (*v29)(_BYTE *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  char v47;
  unint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  char v54;
  uint64_t *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  double v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  _BYTE *v70;
  _BYTE *v71;
  void (*v72)(_BYTE *, uint64_t);
  uint64_t v73;
  _BYTE *v74;
  void (*v75)(_BYTE *, uint64_t);
  _BYTE *v76;
  BOOL v77;
  uint64_t AssociatedTypeWitness;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t v82;
  _BYTE *v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE *v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  void (*v102)(_BYTE *, uint64_t);
  uint64_t v103;
  _BYTE *v104;
  _BYTE *v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(_BYTE *, uint64_t);
  uint64_t v109;
  uint64_t *v110;
  char v111;
  unint64_t v112;
  uint64_t v113;
  _BOOL8 v114;
  uint64_t v115;
  char v116;
  unint64_t v117;
  char v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t result;
  _BYTE v123[12];
  int v124;
  _BYTE *v125;
  unint64_t v126;
  _BYTE *v127;
  _BYTE *v128;
  _BYTE *v129;
  int64_t v130;
  _BYTE *v131;
  uint64_t v132;
  _BYTE *v133;
  uint64_t v134;
  _BYTE *v135;
  _BYTE *v136;
  uint64_t v137;
  _BYTE *v138;
  _BYTE *v139;
  _BYTE *v140;
  uint64_t v141;
  void (*v142)(_BYTE *, uint64_t);
  int64_t v143;
  unint64_t v144;
  _OWORD *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  __int128 v151;
  uint64_t v152;
  unint64_t v153;
  char v154;
  _QWORD v155[3];
  uint64_t v156;
  uint64_t v157;
  _BYTE v158[48];
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  unsigned __int8 v162;
  char v163;
  _QWORD v164[3];
  uint64_t v165;
  unint64_t v166;
  char v167;
  __int128 v168;
  _OWORD v169[3];
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;

  v3 = a1;
  v4 = *(_QWORD *)(a1 + 64);
  v137 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & v4;
  v149 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152));
  v145 = v169;
  v147 = &v172;
  v143 = (unint64_t)(v5 + 63) >> 6;
  v130 = v143 - 1;
  v8 = 0;
  v146 = swift_bridgeObjectRetain();
  if (!v7)
    goto LABEL_6;
LABEL_4:
  while (2)
  {
    v9 = __clz(__rbit64(v7));
    v10 = (v7 - 1) & v7;
    v11 = v9 | (v8 << 6);
LABEL_5:
    v12 = *(_QWORD *)(v3 + 56);
    v13 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v14 = v13[1];
    *(_QWORD *)&v168 = *v13;
    *((_QWORD *)&v168 + 1) = v14;
    sub_23B684CB4(v12 + 48 * v11, (uint64_t)v145);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23B6856F8((uint64_t)&v168, (uint64_t)&v170);
      v18 = v171;
      if (!v171)
        return swift_release();
      v19 = v170;
      sub_23B684CF0((uint64_t)v147, (uint64_t)&v168);
      v20 = (uint64_t *)(v148 + *(_QWORD *)(*(_QWORD *)v148 + 152));
      swift_beginAccess();
      v21 = *v20;
      if (!*(_QWORD *)(v21 + 16))
        break;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v22 = sub_23B683654(v19, v18);
      if ((v23 & 1) != 0)
      {
        sub_23B684C78(*(_QWORD *)(v21 + 56) + 48 * v22, (uint64_t)&v159);
      }
      else
      {
        v161 = 0;
        v159 = 0u;
        v160 = 0u;
        v162 = -1;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v162 == 255)
        goto LABEL_40;
      sub_23B685640((uint64_t)&v159, (uint64_t)v164);
      sub_23B684CB4((uint64_t)&v168, (uint64_t)&v159);
      v144 = v10;
      if (!v163)
      {
        sub_23B685640((uint64_t)&v159, (uint64_t)v158);
        goto LABEL_91;
      }
      if (v163 == 1)
      {
        v24 = v159;
        sub_23B684C78((uint64_t)v164, (uint64_t)&v151);
        if (v154 != 2)
          goto LABEL_107;
        v136 = (_BYTE *)v8;
        v134 = v24;
        v132 = v19;
        sub_23B685840(&v151, (uint64_t)v155);
        isUniquelyReferenced_nonNull_native = v156;
        v141 = v157;
        v25 = __swift_project_boxed_opaque_existential_1(v155, v156);
        v135 = v123;
        v26 = *(_QWORD **)(isUniquelyReferenced_nonNull_native - 8);
        v27 = (_BYTE *)v26[8];
        MEMORY[0x24BDAC7A8](v25, v25);
        v28 = (unint64_t)(v27 + 15) & 0xFFFFFFFFFFFFFFF0;
        v29 = (void (*)(_BYTE *))v26[2];
        v29(&v123[-v28]);
        v30 = sub_23B691BEC();
        LODWORD(v142) = v30;
        v133 = v123;
        v140 = v27;
        MEMORY[0x24BDAC7A8](v30, v31);
        v138 = &v123[-v28];
        v139 = v29;
        ((void (*)(_BYTE *, _BYTE *, uint64_t))v29)(&v123[-v28], &v123[-v28], isUniquelyReferenced_nonNull_native);
        v131 = v26;
        if ((v142 & 1) != 0)
        {
          v32 = sub_23B691BE0();
          v142 = (void (*)(_BYTE *, uint64_t))v26[1];
          v33 = ((uint64_t (*)(_BYTE *, uint64_t))v142)(&v123[-v28], isUniquelyReferenced_nonNull_native);
          if (v32 > 64)
          {
            MEMORY[0x24BDAC7A8](v33, v34);
            v36 = &v123[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
            v37 = v138;
            ((void (*)(_BYTE *, _BYTE *, uint64_t))v139)(v36, v138, isUniquelyReferenced_nonNull_native);
            *(_QWORD *)&v151 = 0x8000000000000000;
            v38 = sub_23B691BEC();
            v8 = (int64_t)v136;
            if ((v38 & 1) != 0)
            {
              v39 = sub_23B691BE0();
              if (v39 >= 64)
              {
                v129 = v123;
                MEMORY[0x24BDAC7A8](v39, v40);
                v74 = &v123[-((v73 + 15) & 0xFFFFFFFFFFFFFFF0)];
                sub_23B685740();
                sub_23B691BC8();
                v1 = sub_23B691A54();
                v75 = v142;
                v142(v74, isUniquelyReferenced_nonNull_native);
                v75(v36, isUniquelyReferenced_nonNull_native);
                v37 = v138;
                if ((v1 & 1) != 0)
                  goto LABEL_115;
              }
              else
              {
                v1 = sub_23B691BD4();
                v142(v36, isUniquelyReferenced_nonNull_native);
                if (v1 < (uint64_t)v151)
                  goto LABEL_115;
              }
            }
            else
            {
              v128 = v123;
              v65 = sub_23B691BEC();
              v129 = v36;
              v66 = sub_23B691BE0();
              if ((v65 & 1) != 0)
              {
                if (v66 > 64)
                {
                  MEMORY[0x24BDAC7A8](v66, v67);
                  v69 = &v123[-((v68 + 15) & 0xFFFFFFFFFFFFFFF0)];
                  sub_23B685740();
                  sub_23B691BC8();
                  v70 = v129;
                  v1 = sub_23B691A54();
                  v71 = v69;
                  v72 = v142;
                  v142(v71, isUniquelyReferenced_nonNull_native);
                  v72(v70, isUniquelyReferenced_nonNull_native);
                  v37 = v138;
                  if ((v1 & 1) != 0)
                    goto LABEL_115;
                  goto LABEL_76;
                }
                AssociatedTypeWitness = swift_getAssociatedTypeWitness();
                v127 = v123;
                MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v79);
                swift_getAssociatedConformanceWitness();
                v80 = sub_23B691CE8();
                v125 = v123;
                v81 = v140;
                MEMORY[0x24BDAC7A8](v80, v82);
                v126 = (unint64_t)(v81 + 15) & 0xFFFFFFFFFFFFFFF0;
                v83 = &v123[-v126];
                sub_23B691CD0();
                v84 = v129;
                v124 = sub_23B691A54();
                v85 = ((uint64_t (*)(_BYTE *, uint64_t))v142)(v83, isUniquelyReferenced_nonNull_native);
                MEMORY[0x24BDAC7A8](v85, v86);
                v1 = (uint64_t)&v123[-v126];
                (*((void (**)(_BYTE *, _BYTE *, uint64_t))v131 + 4))(&v123[-v126], v84, isUniquelyReferenced_nonNull_native);
                if ((v124 & 1) != 0)
                  goto LABEL_117;
                v87 = v151;
                v88 = sub_23B691BD4();
                v142((_BYTE *)v1, isUniquelyReferenced_nonNull_native);
                v77 = v88 < v87;
                v8 = (int64_t)v136;
              }
              else
              {
                if (v66 >= 64)
                {
                  v142(v129, isUniquelyReferenced_nonNull_native);
                  goto LABEL_76;
                }
                v76 = v129;
                v1 = sub_23B691BD4();
                v142(v76, isUniquelyReferenced_nonNull_native);
                v77 = v1 < (uint64_t)v151;
              }
              if (v77)
                goto LABEL_115;
            }
LABEL_76:
            v89 = sub_23B691BE0();
            MEMORY[0x24BDAC7A8](v89, v90);
            v92 = &v123[-((v91 + 15) & 0xFFFFFFFFFFFFFFF0)];
            ((void (*)(_BYTE *, _BYTE *, uint64_t))v139)(v92, v37, isUniquelyReferenced_nonNull_native);
            if (v89 >= 65)
            {
              v93 = ((uint64_t (*)(_BYTE *, uint64_t))v142)(v92, isUniquelyReferenced_nonNull_native);
              goto LABEL_78;
            }
            v103 = sub_23B691BE0();
            v142(v92, isUniquelyReferenced_nonNull_native);
            if (v103 != 64 || (v93 = sub_23B691BEC(), (v93 & 1) != 0))
            {
LABEL_89:
              v109 = sub_23B691BD4();
              v142(v37, isUniquelyReferenced_nonNull_native);
              v57 = __OFADD__(v109, v134);
              v1 = v109 + v134;
              if (v57)
                goto LABEL_113;
              v152 = MEMORY[0x24BEE4008];
              v153 = sub_23B685740();
              *(_QWORD *)&v151 = v1;
              v154 = 2;
              sub_23B685640((uint64_t)&v151, (uint64_t)v158);
              __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v155);
              v3 = v146;
              v19 = v132;
              goto LABEL_91;
            }
LABEL_78:
            v136 = v123;
            MEMORY[0x24BDAC7A8](v93, v94);
            v96 = &v123[-((v95 + 15) & 0xFFFFFFFFFFFFFFF0)];
            ((void (*)(_BYTE *, _BYTE *, uint64_t))v139)(v96, v37, isUniquelyReferenced_nonNull_native);
            *(_QWORD *)&v151 = 0x7FFFFFFFFFFFFFFFLL;
            v97 = sub_23B691BEC();
            v98 = sub_23B691BE0();
            if ((v97 & 1) != 0)
            {
              if (v98 > 64)
              {
                v139 = v123;
                MEMORY[0x24BDAC7A8](v98, v99);
                v101 = &v123[-((v100 + 15) & 0xFFFFFFFFFFFFFFF0)];
                sub_23B685740();
                sub_23B691BC8();
                LODWORD(v140) = sub_23B691A54();
                v37 = v138;
                v1 = (uint64_t)v123;
                v102 = v142;
                v142(v101, isUniquelyReferenced_nonNull_native);
                v102(v96, isUniquelyReferenced_nonNull_native);
                if ((v140 & 1) != 0)
                  goto LABEL_114;
                goto LABEL_89;
              }
            }
            else if (v98 > 63)
            {
              v139 = v123;
              v150 = 0x7FFFFFFFFFFFFFFFLL;
              v104 = v140;
              MEMORY[0x24BDAC7A8](v98, v99);
              v105 = &v123[-((unint64_t)(v104 + 15) & 0xFFFFFFFFFFFFFFF0)];
              v106 = (*((uint64_t (**)(_BYTE *, _BYTE *, uint64_t))v131 + 4))(v105, v96, isUniquelyReferenced_nonNull_native);
              v131 = v123;
              MEMORY[0x24BDAC7A8](v106, v107);
              sub_23B685740();
              v140 = v123;
              v108 = v142;
              sub_23B691BC8();
              v1 = sub_23B691A54();
              v37 = v138;
              v108(v105, isUniquelyReferenced_nonNull_native);
              v108(v105, isUniquelyReferenced_nonNull_native);
              if ((v1 & 1) != 0)
                goto LABEL_114;
              goto LABEL_89;
            }
            v1 = sub_23B691BD4();
            v142(v96, isUniquelyReferenced_nonNull_native);
            if ((uint64_t)v151 < v1)
              goto LABEL_114;
            goto LABEL_89;
          }
        }
        else
        {
          v142 = (void (*)(_BYTE *, uint64_t))v26[1];
          v142(&v123[-v28], isUniquelyReferenced_nonNull_native);
        }
        v37 = v138;
        v8 = (int64_t)v136;
        goto LABEL_76;
      }
      v59 = *(double *)&v159;
      sub_23B684C78((uint64_t)v164, (uint64_t)&v151);
      if (v154 != 3)
      {
LABEL_107:
        swift_bridgeObjectRelease();
        sub_23B685784((uint64_t)&v151);
        sub_23B6857B8();
        swift_allocError();
        swift_willThrow();
        sub_23B685784((uint64_t)v164);
        sub_23B684D2C((uint64_t)&v168);
        return swift_release();
      }
      sub_23B685840(&v151, (uint64_t)v155);
      v60 = __swift_project_boxed_opaque_existential_1(v155, v156);
      MEMORY[0x24BDAC7A8](v60, v60);
      (*(void (**)(_BYTE *))(v62 + 16))(&v123[-((v61 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      v63 = sub_23B6855C0();
      v64 = MEMORY[0x24BEE13C8];
      sub_23B691A24();
      v152 = v64;
      v153 = v63;
      *(double *)&v151 = v59 + *(double *)&v151;
      v154 = 3;
      sub_23B685640((uint64_t)&v151, (uint64_t)v158);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v155);
      v3 = v146;
LABEL_91:
      v110 = v149;
      swift_beginAccess();
      sub_23B684C78((uint64_t)v158, (uint64_t)&v159);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v155[0] = *v110;
      v1 = v155[0];
      *v110 = 0x8000000000000000;
      v112 = sub_23B683654(v19, v18);
      v113 = *(_QWORD *)(v1 + 16);
      v114 = (v111 & 1) == 0;
      v115 = v113 + v114;
      if (__OFADD__(v113, v114))
        goto LABEL_110;
      v116 = v111;
      if (*(_QWORD *)(v1 + 24) >= v115)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = v155[0];
          if ((v111 & 1) == 0)
            goto LABEL_95;
        }
        else
        {
          v1 = (uint64_t)v155;
          sub_23B6846F8();
          isUniquelyReferenced_nonNull_native = v155[0];
          if ((v116 & 1) == 0)
            goto LABEL_95;
        }
      }
      else
      {
        sub_23B683888(v115, isUniquelyReferenced_nonNull_native);
        v1 = v155[0];
        v117 = sub_23B683654(v19, v18);
        if ((v116 & 1) != (v118 & 1))
          goto LABEL_118;
        v112 = v117;
        isUniquelyReferenced_nonNull_native = v155[0];
        if ((v116 & 1) == 0)
        {
LABEL_95:
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 8 * (v112 >> 6) + 64) |= 1 << v112;
          v119 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v112);
          *v119 = v19;
          v119[1] = v18;
          sub_23B685640((uint64_t)&v159, *(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 48 * v112);
          v120 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
          v57 = __OFADD__(v120, 1);
          v121 = v120 + 1;
          if (v57)
            goto LABEL_112;
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v121;
          swift_bridgeObjectRetain();
          goto LABEL_100;
        }
      }
      sub_23B68567C((uint64_t)&v159, *(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 48 * v112);
LABEL_100:
      v1 = *v149;
      *v149 = isUniquelyReferenced_nonNull_native;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_23B685784((uint64_t)v158);
      sub_23B685784((uint64_t)v164);
      sub_23B684D2C((uint64_t)&v168);
      v7 = v144;
      if (v144)
        goto LABEL_4;
LABEL_6:
      v15 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_109;
      if (v15 < v143)
      {
        v16 = *(_QWORD *)(v137 + 8 * v15);
        if (v16)
          goto LABEL_9;
        v17 = v8 + 2;
        ++v8;
        if (v15 + 1 < v143)
        {
          v16 = *(_QWORD *)(v137 + 8 * v17);
          if (v16)
            goto LABEL_12;
          v8 = v15 + 1;
          if (v15 + 2 < v143)
          {
            v16 = *(_QWORD *)(v137 + 8 * (v15 + 2));
            if (v16)
            {
              v15 += 2;
              goto LABEL_9;
            }
            v17 = v15 + 3;
            v8 = v15 + 2;
            if (v15 + 3 < v143)
            {
              v16 = *(_QWORD *)(v137 + 8 * v17);
              if (!v16)
              {
                while (1)
                {
                  v15 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_116;
                  if (v15 >= v143)
                  {
                    v8 = v130;
                    goto LABEL_23;
                  }
                  v16 = *(_QWORD *)(v137 + 8 * v15);
                  ++v17;
                  if (v16)
                    goto LABEL_9;
                }
              }
LABEL_12:
              v15 = v17;
LABEL_9:
              v10 = (v16 - 1) & v16;
              v11 = __clz(__rbit64(v16)) + (v15 << 6);
              v8 = v15;
              goto LABEL_5;
            }
          }
        }
      }
LABEL_23:
      v10 = 0;
      memset(v169, 0, 42);
      v168 = 0u;
    }
    v161 = 0;
    v159 = 0u;
    v160 = 0u;
    v162 = -1;
LABEL_40:
    sub_23B685604((uint64_t)&v159, &qword_2542FFD90);
    sub_23B684CB4((uint64_t)&v168, (uint64_t)&v159);
    if (v163)
    {
      v41 = (_BYTE *)v8;
      v42 = v10;
      if (v163 == 1)
      {
        v43 = v159;
        v165 = MEMORY[0x24BEE4008];
        v166 = sub_23B685740();
        v164[0] = v43;
        v44 = 2;
      }
      else
      {
        v45 = v159;
        v165 = MEMORY[0x24BEE13C8];
        v166 = sub_23B6855C0();
        v164[0] = v45;
        v44 = 3;
      }
      v167 = v44;
    }
    else
    {
      v41 = (_BYTE *)v8;
      v42 = v10;
      sub_23B685640((uint64_t)&v159, (uint64_t)v164);
    }
    v46 = v149;
    swift_beginAccess();
    sub_23B684C78((uint64_t)v164, (uint64_t)&v159);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v151 = *v46;
    v1 = v151;
    *v46 = 0x8000000000000000;
    v48 = sub_23B683654(v19, v18);
    v49 = *(_QWORD *)(v1 + 16);
    v50 = (v47 & 1) == 0;
    v51 = v49 + v50;
    if (!__OFADD__(v49, v50))
    {
      v52 = v47;
      if (*(_QWORD *)(v1 + 24) >= v51)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = v151;
          if ((v47 & 1) == 0)
            goto LABEL_50;
        }
        else
        {
          v1 = (uint64_t)&v151;
          sub_23B6846F8();
          isUniquelyReferenced_nonNull_native = v151;
          if ((v52 & 1) == 0)
            goto LABEL_50;
        }
      }
      else
      {
        sub_23B683888(v51, isUniquelyReferenced_nonNull_native);
        v1 = v151;
        v53 = sub_23B683654(v19, v18);
        if ((v52 & 1) != (v54 & 1))
          goto LABEL_118;
        v48 = v53;
        isUniquelyReferenced_nonNull_native = v151;
        if ((v52 & 1) == 0)
        {
LABEL_50:
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 8 * (v48 >> 6) + 64) |= 1 << v48;
          v55 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v48);
          *v55 = v19;
          v55[1] = v18;
          sub_23B685640((uint64_t)&v159, *(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 48 * v48);
          v56 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
          v57 = __OFADD__(v56, 1);
          v58 = v56 + 1;
          if (v57)
            goto LABEL_111;
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v58;
          swift_bridgeObjectRetain();
          goto LABEL_55;
        }
      }
      sub_23B68567C((uint64_t)&v159, *(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 48 * v48);
LABEL_55:
      v1 = *v149;
      *v149 = isUniquelyReferenced_nonNull_native;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_23B685784((uint64_t)v164);
      sub_23B684D2C((uint64_t)&v168);
      v7 = v42;
      v8 = (int64_t)v41;
      v3 = v146;
      if (v7)
        continue;
      goto LABEL_6;
    }
    break;
  }
  __break(1u);
LABEL_109:
  __break(1u);
LABEL_110:
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
  v142((_BYTE *)v1, isUniquelyReferenced_nonNull_native);
  __break(1u);
LABEL_118:
  result = sub_23B691D00();
  __break(1u);
  return result;
}

uint64_t sub_23B6827B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;

  swift_getErrorValue();
  v2 = sub_23B691D18();
  v4 = v3;
  v5 = MEMORY[0x24BEE0D00];
  v13 = MEMORY[0x24BEE0D00];
  v6 = sub_23B684DB4();
  v14 = v6;
  v11 = v2;
  v12 = v4;
  v15 = 1;
  swift_beginAccess();
  sub_23B681574((uint64_t)&v11, 0x6D6F44726F727265, 0xEB000000006E6961);
  swift_endAccess();
  swift_getErrorValue();
  v7 = sub_23B691D0C();
  v13 = MEMORY[0x24BEE1768];
  v14 = sub_23B684DF8();
  v11 = v7;
  v15 = 2;
  swift_beginAccess();
  sub_23B681574((uint64_t)&v11, 0x646F43726F727265, 0xE900000000000065);
  swift_endAccess();
  v11 = a1;
  MEMORY[0x23B86A46C](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9C0);
  v8 = sub_23B691A78();
  v13 = v5;
  v14 = v6;
  v11 = v8;
  v12 = v9;
  v15 = 1;
  swift_beginAccess();
  sub_23B681574((uint64_t)&v11, 0xD000000000000010, 0x800000023B693130);
  return swift_endAccess();
}

uint64_t sub_23B68296C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v2 = v1;
  v4 = sub_23B682A6C();
  sub_23B68164C(v4);
  swift_bridgeObjectRelease();
  sub_23B691AD8();
  v5 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 128);
  v6 = type metadata accessor for AnyAnalyticsEvent();
  v7 = (char *)a1 + *(int *)(v6 + 20);
  v8 = sub_23B6919DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, v5, v8);
  v9 = (uint64_t *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 152));
  swift_beginAccess();
  v10 = *v9;
  *a1 = v12;
  a1[1] = v13;
  *(_QWORD *)((char *)a1 + *(int *)(v6 + 24)) = v10;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B682A6C()
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  double v42;
  char v43;
  void (*v44)(char *, uint64_t);
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[48];
  _QWORD v51[3];
  uint64_t v52;
  unint64_t v53;
  __int16 v54;
  uint64_t v55;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDB8);
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  v48 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v46 - v8;
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v46 - v11;
  v13 = sub_23B691C64();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v47 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v46 - v19;
  v21 = sub_23B6919C4();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v23);
  v25 = (char *)&v46 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B6919B8();
  v26 = sub_23B6919A0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  v51[0] = v26;
  v27 = sub_23B691CC4();
  v29 = v28;
  v52 = MEMORY[0x24BEE0D00];
  v53 = sub_23B684DB4();
  v51[0] = v27;
  v51[1] = v29;
  v54 = 1;
  sub_23B684CF0((uint64_t)v51, (uint64_t)v50);
  v30 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v55 = v30;
  sub_23B6844F8((uint64_t)v50, 0x6D695468636F7065, 0xE900000000000065, isUniquelyReferenced_nonNull_native);
  v32 = v55;
  swift_bridgeObjectRelease();
  v33 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  swift_beginAccess();
  sub_23B685578(v33, (uint64_t)v12);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v34(v12, 1, v13) == 1)
  {
    sub_23B685604((uint64_t)v12, &qword_2542FFDB8);
  }
  else
  {
    v35 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v46 = v20;
    v35(v20, v12, v13);
    v36 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
    swift_beginAccess();
    sub_23B685578(v36, (uint64_t)v9);
    LODWORD(v36) = v34(v9, 1, v13);
    sub_23B685604((uint64_t)v9, &qword_2542FFDB8);
    if ((_DWORD)v36 == 1)
      sub_23B6809B8();
    v37 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
    swift_beginAccess();
    v38 = v37;
    v39 = v48;
    sub_23B685578(v38, v48);
    if (v34((char *)v39, 1, v13) == 1)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v46, v13);
      sub_23B685604(v39, &qword_2542FFDB8);
    }
    else
    {
      v40 = v47;
      v35(v47, (char *)v39, v13);
      v41 = v46;
      sub_23B691C58();
      v42 = (double)sub_23B691DA8() / 1000.0;
      v52 = MEMORY[0x24BEE13C8];
      v53 = sub_23B6855C0();
      *(double *)v51 = v42;
      v54 = 3;
      sub_23B684CF0((uint64_t)v51, (uint64_t)v50);
      v43 = swift_isUniquelyReferenced_nonNull_native();
      v49 = v32;
      sub_23B6844F8((uint64_t)v50, 0x6E6F697461727564, 0xE800000000000000, v43);
      v32 = v49;
      swift_bridgeObjectRelease();
      v44 = *(void (**)(char *, uint64_t))(v14 + 8);
      v44(v40, v13);
      v44(v41, v13);
    }
  }
  return v32;
}

uint64_t AnalyticsEvent.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 128);
  v2 = sub_23B6919DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_23B685604(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136), &qword_2542FFDB8);
  sub_23B685604(v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), &qword_2542FFDB8);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AnalyticsEvent.__deallocating_deinit()
{
  AnalyticsEvent.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t AnalyticsEvent.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B682F68()
{
  return AnalyticsEvent.unownedExecutor.getter();
}

uint64_t AnyAnalyticsEvent.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AnyAnalyticsEvent.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AnyAnalyticsEvent() + 20);
  v4 = sub_23B6919DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AnyAnalyticsEvent.eventData.getter()
{
  type metadata accessor for AnyAnalyticsEvent();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B683014(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B6830E4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B6856B8((uint64_t)v12, *a3);
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
      sub_23B6856B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_23B6830E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B691BBC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B68329C(a5, a6);
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
  v8 = sub_23B691C40();
  if (!v8)
  {
    sub_23B691C88();
    __break(1u);
LABEL_17:
    result = sub_23B691CB8();
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

uint64_t sub_23B68329C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B683330(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B683508(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B683508(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B683330(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B6834A4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B691C34();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B691C88();
      __break(1u);
LABEL_10:
      v2 = sub_23B691AB4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B691CB8();
    __break(1u);
LABEL_14:
    result = sub_23B691C88();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B6834A4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B683508(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9D0);
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
  result = sub_23B691CB8();
  __break(1u);
  return result;
}

unint64_t sub_23B683654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23B691D60();
  sub_23B691A90();
  v4 = sub_23B691D84();
  return sub_23B6836B8(a1, a2, v4);
}

unint64_t sub_23B6836B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23B691CDC() & 1) == 0)
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
      while (!v14 && (sub_23B691CDC() & 1) == 0);
    }
  }
  return v6;
}

double sub_23B683798@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  v8 = sub_23B683654(a1, a2);
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
      sub_23B6846F8();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_23B685640(*(_QWORD *)(v11 + 56) + 48 * v8, a3);
    sub_23B6841DC(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_BYTE *)(a3 + 40) = -1;
  }
  return result;
}

uint64_t sub_23B683888(uint64_t a1, char a2)
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
  uint64_t v25;
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
  _BYTE v38[56];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDC8);
  v37 = a2;
  v6 = sub_23B691CAC();
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
    v25 = *(_QWORD *)(v5 + 56) + 48 * v17;
    if ((v37 & 1) != 0)
    {
      sub_23B685640(v25, (uint64_t)v38);
    }
    else
    {
      sub_23B684C78(v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_23B691D60();
    sub_23B691A90();
    result = sub_23B691D84();
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
    result = sub_23B685640((uint64_t)v38, *(_QWORD *)(v7 + 56) + 48 * v14);
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

uint64_t sub_23B683BAC(uint64_t a1, char a2)
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
  uint64_t v25;
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
  _BYTE v38[56];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDD0);
  v37 = a2;
  v6 = sub_23B691CAC();
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
    v25 = *(_QWORD *)(v5 + 56) + 48 * v17;
    if ((v37 & 1) != 0)
    {
      sub_23B684CF0(v25, (uint64_t)v38);
    }
    else
    {
      sub_23B684CB4(v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_23B691D60();
    sub_23B691A90();
    result = sub_23B691D84();
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
    result = sub_23B684CF0((uint64_t)v38, *(_QWORD *)(v7 + 56) + 48 * v14);
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

uint64_t sub_23B683ED0(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542FFDD8);
  v38 = a2;
  v6 = sub_23B691CAC();
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
    sub_23B691D60();
    sub_23B691A90();
    result = sub_23B691D84();
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

unint64_t sub_23B6841DC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  __int128 *v17;
  __int128 *v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23B691C1C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23B691D60();
        swift_bridgeObjectRetain();
        sub_23B691A90();
        v11 = sub_23B691D84();
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
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (__int128 *)(v16 + 48 * v3);
          v18 = (__int128 *)(v16 + 48 * v6);
          if (48 * v3 < (uint64_t)(48 * v6) || v17 >= v18 + 3 || (v19 = v3 == v6, v3 = v6, !v19))
          {
            v9 = *v18;
            v10 = v18[2];
            v17[1] = v18[1];
            v17[2] = v10;
            *v17 = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23B6843D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_23B683654(a2, a3);
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
        return sub_23B68567C(a1, v18[7] + 48 * v12);
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23B6846F8();
      goto LABEL_7;
    }
    sub_23B683888(v15, a4 & 1);
    v20 = sub_23B683654(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_23B68567C(a1, v18[7] + 48 * v12);
LABEL_11:
      sub_23B684620(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B691D00();
  __break(1u);
  return result;
}

uint64_t sub_23B6844F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_23B683654(a2, a3);
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
        return sub_23B684D60(a1, v18[7] + 48 * v12);
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23B6848E0();
      goto LABEL_7;
    }
    sub_23B683BAC(v15, a4 & 1);
    v20 = sub_23B683654(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_23B684D60(a1, v18[7] + 48 * v12);
LABEL_11:
      sub_23B68468C(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B691D00();
  __break(1u);
  return result;
}

uint64_t sub_23B684620(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_23B685640(a4, a5[7] + 48 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23B68468C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_23B684CF0(a4, a5[7] + 48 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_23B6846F8()
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
  _BYTE v26[48];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDC8);
  v2 = *v0;
  v3 = sub_23B691CA0();
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
    v20 = 48 * v15;
    sub_23B684C78(*(_QWORD *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23B685640((uint64_t)v26, *(_QWORD *)(v4 + 56) + v20);
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

void *sub_23B6848E0()
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
  _BYTE v26[48];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDD0);
  v2 = *v0;
  v3 = sub_23B691CA0();
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
    v20 = 48 * v15;
    sub_23B684CB4(*(_QWORD *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23B684CF0((uint64_t)v26, *(_QWORD *)(v4 + 56) + v20);
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

id sub_23B684AC8()
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2542FFDD8);
  v2 = *v0;
  v3 = sub_23B691CA0();
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

uint64_t sub_23B684C78(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for Analytics.DiscreteType(a2, a1);
  return a2;
}

uint64_t sub_23B684CB4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for Analytics.Mode(a2, a1);
  return a2;
}

uint64_t sub_23B684CF0(uint64_t a1, uint64_t a2)
{
  __swift_memcpy42_8(a2, a1);
  return a2;
}

uint64_t sub_23B684D2C(uint64_t a1)
{
  destroy for Analytics.Mode(a1);
  return a1;
}

uint64_t sub_23B684D60(uint64_t a1, uint64_t a2)
{
  assignWithTake for Analytics.Mode(a2, a1);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_23B684DB4()
{
  unint64_t result;

  result = qword_2542FFD98;
  if (!qword_2542FFD98)
  {
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2542FFD98);
  }
  return result;
}

unint64_t sub_23B684DF8()
{
  unint64_t result;

  result = qword_256A3E9B8;
  if (!qword_256A3E9B8)
  {
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_256A3E9B8);
  }
  return result;
}

uint64_t type metadata accessor for AnyAnalyticsEvent()
{
  uint64_t result;

  result = qword_2542FFCD8;
  if (!qword_2542FFCD8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23B684E7C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_23B6919DC();
    if (v1 <= 0x3F)
    {
      sub_23B685054();
      if (v2 <= 0x3F)
        swift_initClassMetadata2();
    }
  }
}

void type metadata accessor for AnalyticsEvent()
{
  JUMPOUT(0x23B86A4B4);
}

uint64_t method lookup function for AnalyticsEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnalyticsEvent.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of AnalyticsEvent.startTiming()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AnalyticsEvent.stopTiming()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AnalyticsEvent.value(key:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AnalyticsEvent.append(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 264) + *(_QWORD *)(*(_QWORD *)v2 + 264));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B684FF4;
  return v8(a1, a2);
}

uint64_t sub_23B684FF4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of AnalyticsEvent.append(error:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AnalyticsEvent.anyAnalyticsEvent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

void sub_23B685054()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2542FFDC0)
  {
    sub_23B691C64();
    v0 = sub_23B691BA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2542FFDC0);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for AnyAnalyticsEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_23B6919DC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AnyAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_23B6919DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AnyAnalyticsEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23B6919DC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AnyAnalyticsEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23B6919DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for AnyAnalyticsEvent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23B6919DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for AnyAnalyticsEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_23B6919DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyAnalyticsEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B6853FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23B6919DC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AnyAnalyticsEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B685484(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23B6919DC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23B6854F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B6919DC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_23B685578(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23B6855C0()
{
  unint64_t result;

  result = qword_2542FFCF0;
  if (!qword_2542FFCF0)
  {
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_2542FFCF0);
  }
  return result;
}

uint64_t sub_23B685604(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B685640(uint64_t a1, uint64_t a2)
{
  __swift_memcpy41_8(a2, a1);
  return a2;
}

uint64_t sub_23B68567C(uint64_t a1, uint64_t a2)
{
  assignWithTake for Analytics.DiscreteType(a2, a1);
  return a2;
}

uint64_t sub_23B6856B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B6856F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23B685740()
{
  unint64_t result;

  result = qword_256A3E9D8;
  if (!qword_256A3E9D8)
  {
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_256A3E9D8);
  }
  return result;
}

uint64_t sub_23B685784(uint64_t a1)
{
  destroy for Analytics.DiscreteType(a1);
  return a1;
}

unint64_t sub_23B6857B8()
{
  unint64_t result;

  result = qword_256A3E9E0;
  if (!qword_256A3E9E0)
  {
    result = MEMORY[0x23B86A508](&unk_23B692B40, &type metadata for Analytics.Error);
    atomic_store(result, (unint64_t *)&qword_256A3E9E0);
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

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23B685840(__int128 *a1, uint64_t a2)
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

uint64_t sub_23B685858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2542FFC18)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2542FFC18);
  }
}

uint64_t sub_23B6858F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9E8);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v21 = 0u;
    v22 = 0u;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  v12 = sub_23B683654(a2, a3);
  if ((v13 & 1) == 0)
  {
    v21 = 0u;
    v22 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_23B6856B8(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)&v21);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v22 + 1))
  {
LABEL_9:
    v16 = &qword_256A3E9F0;
    v17 = (char *)&v21;
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    sub_23B685BCC();
    swift_allocError();
    *(_QWORD *)v18 = a2;
    *(_QWORD *)(v18 + 8) = a3;
    *(_BYTE *)(v18 + 16) = 2;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  sub_23B691958();
  swift_bridgeObjectRelease();
  v14 = sub_23B691964();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) == 1)
  {
    v16 = &qword_256A3E9E8;
    v17 = v11;
LABEL_10:
    sub_23B685604((uint64_t)v17, v16);
    goto LABEL_11;
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a4, v11, v14);
}

uint64_t sub_23B685AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v11 = 0u;
    v12 = 0u;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v6 = sub_23B683654(a2, a3);
  if ((v7 & 1) == 0)
  {
    v11 = 0u;
    v12 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_23B6856B8(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v11);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v12 + 1))
  {
LABEL_8:
    sub_23B685604((uint64_t)&v11, &qword_256A3E9F0);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) != 0)
    return v10;
LABEL_9:
  sub_23B685BCC();
  swift_allocError();
  *(_QWORD *)v9 = a2;
  *(_QWORD *)(v9 + 8) = a3;
  *(_BYTE *)(v9 + 16) = 2;
  swift_bridgeObjectRetain();
  return swift_willThrow();
}

unint64_t sub_23B685BCC()
{
  unint64_t result;

  result = qword_256A3E9F8;
  if (!qword_256A3E9F8)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for AppleAccount.Error, &type metadata for AppleAccount.Error);
    atomic_store(result, (unint64_t *)&qword_256A3E9F8);
  }
  return result;
}

uint64_t SearchpartyAccount.icloudIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SearchpartyAccount.dsid.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SearchpartyAccount.token.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SearchpartyAccount.findmy_key_sharing_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 28);
  v4 = sub_23B691964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SearchpartyAccount()
{
  uint64_t result;

  result = qword_256A3EA00;
  if (!qword_256A3EA00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SearchpartyAccount.findmy_owner_device_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 32);
  v4 = sub_23B691964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SearchpartyAccount.findmyservice_gateway_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 36);
  v4 = sub_23B691964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SearchpartyAccount.fmadminws_gateway_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 40);
  v4 = sub_23B691964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SearchpartyAccount.icloud_acsn_gateway_url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 44);
  v4 = sub_23B691964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SearchpartyAccount.icloud_fmip_al_service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SearchpartyAccount() + 48);
  v4 = sub_23B691964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SearchpartyAccount.init(icloudIdentifier:dsid:token:findmy_key_sharing_url:findmy_owner_device_url:findmyservice_gateway_url:fmadminws_gateway_url:icloud_acsn_gateway_url:icloud_fmip_al_service:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int *v16;
  char *v17;
  uint64_t v18;
  void (*v20)(char *, uint64_t, uint64_t);

  *(_QWORD *)a9 = a1;
  *((_QWORD *)a9 + 1) = a2;
  *((_QWORD *)a9 + 2) = a3;
  *((_QWORD *)a9 + 3) = a4;
  *((_QWORD *)a9 + 4) = a5;
  *((_QWORD *)a9 + 5) = a6;
  v16 = (int *)type metadata accessor for SearchpartyAccount();
  v17 = &a9[v16[7]];
  v18 = sub_23B691964();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32);
  v20(v17, a7, v18);
  v20(&a9[v16[8]], a8, v18);
  v20(&a9[v16[9]], a10, v18);
  v20(&a9[v16[10]], a11, v18);
  v20(&a9[v16[11]], a12, v18);
  return ((uint64_t (*)(char *, uint64_t, uint64_t))v20)(&a9[v16[12]], a13, v18);
}

char *initializeBufferWithCopyOfBuffer for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = a3[7];
    v11 = &a1[v10];
    v12 = &a2[v10];
    *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
    *((_QWORD *)a1 + 5) = v9;
    v13 = sub_23B691964();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v14(&v4[a3[8]], &a2[a3[8]], v13);
    v14(&v4[a3[9]], &a2[a3[9]], v13);
    v14(&v4[a3[10]], &a2[a3[10]], v13);
    v14(&v4[a3[11]], &a2[a3[11]], v13);
    v14(&v4[a3[12]], &a2[a3[12]], v13);
  }
  return v4;
}

uint64_t destroy for SearchpartyAccount(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[7];
  v5 = sub_23B691964();
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  v7(a1 + a2[8], v5);
  v7(a1 + a2[9], v5);
  v7(a1 + a2[10], v5);
  v7(a1 + a2[11], v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + a2[12], v5);
}

char *initializeWithCopy for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  v8 = *((_QWORD *)a2 + 5);
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = v8;
  v12 = sub_23B691964();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v13(&a1[a3[8]], &a2[a3[8]], v12);
  v13(&a1[a3[9]], &a2[a3[9]], v12);
  v13(&a1[a3[10]], &a2[a3[10]], v12);
  v13(&a1[a3[11]], &a2[a3[11]], v12);
  v13(&a1[a3[12]], &a2[a3[12]], v12);
  return a1;
}

char *assignWithCopy for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[7];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23B691964();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  v10(&a1[a3[10]], &a2[a3[10]], v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  v10(&a1[a3[12]], &a2[a3[12]], v9);
  return a1;
}

char *initializeWithTake for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  v7 = a3[7];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_23B691964();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[8]], &a2[a3[8]], v10);
  v11(&a1[a3[9]], &a2[a3[9]], v10);
  v11(&a1[a3[10]], &a2[a3[10]], v10);
  v11(&a1[a3[11]], &a2[a3[11]], v10);
  v11(&a1[a3[12]], &a2[a3[12]], v10);
  return a1;
}

char *assignWithTake for SearchpartyAccount(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = *((_QWORD *)a2 + 5);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_23B691964();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  v13(&a1[a3[8]], &a2[a3[8]], v12);
  v13(&a1[a3[9]], &a2[a3[9]], v12);
  v13(&a1[a3[10]], &a2[a3[10]], v12);
  v13(&a1[a3[11]], &a2[a3[11]], v12);
  v13(&a1[a3[12]], &a2[a3[12]], v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchpartyAccount()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B6865D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_23B691964();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SearchpartyAccount()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B686660(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_23B691964();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_23B6866D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B691964();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_23B686754(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  void (*v51)(_QWORD, _QWORD, _QWORD);
  uint64_t v52;
  int *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(_QWORD, _QWORD, _QWORD);
  _OWORD v76[2];
  __int128 v77;
  __int128 v78;
  uint64_t *v79;

  v79 = a3;
  v5 = sub_23B691964();
  v74 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5, v6);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v7, v10);
  v73 = (uint64_t)&v62 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v62 - v15;
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v62 - v19;
  v22 = MEMORY[0x24BDAC7A8](v18, v21);
  v24 = (char *)&v62 - v23;
  MEMORY[0x24BDAC7A8](v22, v25);
  v27 = (char *)&v62 - v26;
  v28 = objc_msgSend(a2, sel_aa_personID);
  if (!v28)
    goto LABEL_9;
  v29 = v28;
  v70 = v9;
  v71 = sub_23B691A6C();
  v31 = v30;

  v32 = objc_msgSend(a2, sel_username);
  if (!v32)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    sub_23B685BCC();
    swift_allocError();
    v45 = xmmword_23B6923A0;
LABEL_12:
    *(_OWORD *)v44 = v45;
    *(_BYTE *)(v44 + 16) = 3;
    swift_willThrow();

LABEL_13:
    return;
  }
  v33 = v32;
  v68 = sub_23B691A6C();
  v72 = v34;

  v35 = objc_msgSend(a1, sel_credentialForAccount_, a2);
  if (!v35)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B685BCC();
    swift_allocError();
    v45 = xmmword_23B692390;
    goto LABEL_12;
  }
  v69 = v31;
  v36 = a1;
  v37 = v35;
  v38 = objc_msgSend(v35, sel_credentialItemForKey_, *MEMORY[0x24BDB4360]);
  if (!v38)
  {

    a1 = v36;
    goto LABEL_11;
  }
  v39 = v38;
  v66 = v37;
  v64 = v5;
  v63 = sub_23B691A6C();
  v67 = v40;

  v41 = objc_msgSend(a2, sel_dataclassProperties);
  if (!v41)
  {
    v77 = 0u;
    v78 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    sub_23B686F28((uint64_t)&v77);
LABEL_23:
    sub_23B685BCC();
    swift_allocError();
    *(_QWORD *)v52 = 0xD00000000000001FLL;
    *(_QWORD *)(v52 + 8) = 0x800000023B6933D0;
    *(_BYTE *)(v52 + 16) = 1;
    swift_willThrow();

    goto LABEL_13;
  }
  v42 = v41;
  v65 = v36;
  *(_QWORD *)&v76[0] = 0xD00000000000001FLL;
  *((_QWORD *)&v76[0] + 1) = 0x800000023B6933D0;
  v43 = objc_msgSend(v41, sel___swift_objectForKeyedSubscript_, sub_23B691CF4());
  swift_unknownObjectRelease();

  if (v43)
  {
    sub_23B691BF8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v76, 0, sizeof(v76));
  }
  v46 = v69;
  sub_23B686F68((uint64_t)v76, (uint64_t)&v77);
  v36 = v65;
  v47 = v72;
  if (!*((_QWORD *)&v78 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EA10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  v48 = *(_QWORD *)&v76[0];
  v49 = v79;
  v50 = v67;
  *v79 = v68;
  v49[1] = v47;
  v49[2] = v71;
  v49[3] = v46;
  v49[4] = v63;
  v49[5] = v50;
  v71 = v48;
  v51 = v75;
  sub_23B6858F4(v48, 0xD000000000000016, 0x800000023B6933F0, (uint64_t)v27);
  if (v51)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  v53 = (int *)type metadata accessor for SearchpartyAccount();
  v54 = (char *)v49 + v53[7];
  v55 = v27;
  v56 = v64;
  v75 = *(void (**)(_QWORD, _QWORD, _QWORD))(v74 + 32);
  v75(v54, v55, v64);
  sub_23B6858F4(v71, 0xD000000000000017, 0x800000023B693410, (uint64_t)v24);
  v75((char *)v49 + v53[8], v24, v56);
  v68 = 0;
  sub_23B6858F4(v71, 0xD000000000000019, 0x800000023B693430, (uint64_t)v20);
  v57 = v65;
  v75((char *)v49 + v53[9], v20, v56);
  v58 = v71;
  sub_23B6858F4(v71, 0xD000000000000015, 0x800000023B693450, (uint64_t)v16);
  v63 = (uint64_t)v53;
  v75((char *)v49 + v53[10], v16, v56);
  v59 = v73;
  sub_23B6858F4(v58, 0xD000000000000017, 0x800000023B693470, v73);
  v60 = v63;
  v75((char *)v79 + *(int *)(v63 + 44), v59, v64);
  v61 = (uint64_t)v70;
  sub_23B6858F4(v58, 0xD000000000000016, 0x800000023B693490, (uint64_t)v70);
  swift_bridgeObjectRelease();

  v75((char *)v79 + *(int *)(v60 + 48), v61, v64);
}

uint64_t sub_23B686F28(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23B686F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B686FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_256A3ECA8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256A3ECA8);
  if (qword_256A3E988 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_256A3EA18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t static AppleAccount.fmipAccount.getter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_23B687088;
  return sub_23B6877C8();
}

uint64_t sub_23B687088(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = v2;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v4 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23B687100()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(void **)(v0 + 40);
  if (!v1)
  {
    v4 = *(_OWORD **)(v0 + 16);

    v4[3] = 0u;
    v4[4] = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    *v4 = 0u;
LABEL_6:
    v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  v2 = *(_QWORD *)(v0 + 48);
  sub_23B688390(v1, *(void **)(v0 + 32), (uint64_t *)&v12);
  if (!v2)
  {
    v5 = *(_QWORD *)(v0 + 16);
    v6 = v13;
    v7 = v14;
    v8 = v17;
    v9 = v18;
    *(_OWORD *)v5 = v12;
    *(_QWORD *)(v5 + 16) = v6;
    *(_QWORD *)(v5 + 24) = v7;
    v10 = v16;
    *(_OWORD *)(v5 + 32) = v15;
    *(_OWORD *)(v5 + 48) = v10;
    *(_QWORD *)(v5 + 64) = v8;
    *(_QWORD *)(v5 + 72) = v9;
    goto LABEL_6;
  }
  v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t static AppleAccount.searchpartyAccount.getter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_23B6871EC;
  return sub_23B6877C8();
}

uint64_t sub_23B6871EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  *(_QWORD *)(v4 + 48) = v2;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v4 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_23B687264()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(v0 + 40);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    v3 = *(void **)(v0 + 32);
    v4 = *(uint64_t **)(v0 + 16);
    v5 = v1;
    sub_23B686754(v3, v5, v4);
    if (!v2)
    {
      v8 = *(_QWORD *)(v0 + 16);
      v9 = type metadata accessor for SearchpartyAccount();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
    }
  }
  else
  {
    v5 = *(id *)(v0 + 32);
    v6 = *(_QWORD *)(v0 + 16);
    v7 = type metadata accessor for SearchpartyAccount();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void AppleAccount.Error.description.getter()
{
  __asm { BR              X10 }
}

unint64_t sub_23B687368()
{
  sub_23B691C28();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  sub_23B691A9C();
  return 0xD000000000000014;
}

uint64_t sub_23B687444()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)&loc_23B687430 + 4 * byte_23B692438[v0]))(0xD000000000000016, 0x800000023B693570);
}

void sub_23B687478()
{
  JUMPOUT(0x23B687430);
}

uint64_t sub_23B6874D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A3E9C0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v10 = a2;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v9 = a2;
    sub_23B688308((uint64_t)&v10, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23B687578()
{
  uint64_t v0;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_256A3EA18);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A3EA18);
  return sub_23B6919F4();
}

uint64_t sub_23B6875F4()
{
  char *v0;
  uint64_t result;
  uint64_t v2;
  unint64_t v3;
  char v4;
  _BYTE v5[24];
  uint64_t v6;

  v0 = ".framework.FindMyCommon";
  sub_23B691934();
  if (!v6)
  {
    sub_23B686F28((uint64_t)v5);
LABEL_10:
    sub_23B685BCC();
    swift_allocError();
    v3 = 0xD00000000000002ALL;
LABEL_11:
    *(_QWORD *)v2 = v3;
LABEL_12:
    *(_QWORD *)(v2 + 8) = (unint64_t)v0 | 0x8000000000000000;
    *(_BYTE *)(v2 + 16) = 0;
    return swift_willThrow();
  }
  if ((swift_dynamicCast() & 1) == 0 || (v4 & 1) == 0)
    goto LABEL_10;
  v0 = "ts.appleaccount.fullaccess";
  sub_23B691934();
  if ((swift_dynamicCast() & 1) == 0 || (v4 & 1) == 0)
  {
    sub_23B685BCC();
    swift_allocError();
    v3 = 0xD000000000000022;
    goto LABEL_11;
  }
  v0 = "ts.idms.fullaccess";
  sub_23B691934();
  result = swift_dynamicCast();
  if ((result & 1) == 0 || (v4 & 1) == 0)
  {
    sub_23B685BCC();
    swift_allocError();
    *(_QWORD *)v2 = 0xD000000000000020;
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_23B6877C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_23B691DC0();
  v0[17] = v1;
  v0[18] = *(_QWORD *)(v1 - 8);
  v0[19] = swift_task_alloc();
  v2 = sub_23B691C64();
  v0[20] = v2;
  v0[21] = *(_QWORD *)(v2 - 8);
  v0[22] = swift_task_alloc();
  v0[23] = swift_task_alloc();
  v0[24] = swift_task_alloc();
  v3 = sub_23B691C7C();
  v0[25] = v3;
  v0[26] = *(_QWORD *)(v3 - 8);
  v0[27] = swift_task_alloc();
  v0[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6878A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((MEMORY[0x23B869C80]() & 1) != 0)
  {
    v1 = sub_23B6918F8();
    sub_23B6882C8(&qword_256A3EA50, (uint64_t (*)(uint64_t))MEMORY[0x24BE31808], MEMORY[0x24BE31810]);
    swift_allocError();
    *v2 = 0xD00000000000001ELL;
    v2[1] = 0x800000023B6935D0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v2, *MEMORY[0x24BE31800], v1);
    swift_willThrow();
LABEL_4:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_23B6875F4();
  sub_23B691C70();
  if (qword_256A3E980 != -1)
    swift_once();
  v4 = sub_23B691A00();
  *(_QWORD *)(v0 + 232) = __swift_project_value_buffer(v4, (uint64_t)qword_256A3ECA8);
  v5 = sub_23B6919E8();
  v6 = sub_23B691B5C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B67E000, v5, v6, "Retrieving aa_primaryAppleAccount...", v7, 2u);
    MEMORY[0x23B86A58C](v7, -1, -1);
  }

  sub_23B691C4C();
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  *(_QWORD *)(v0 + 240) = v8;
  if (!v8)
  {
    v12 = *(_QWORD *)(v0 + 224);
    v13 = *(_QWORD *)(v0 + 200);
    v14 = *(_QWORD *)(v0 + 208);
    v15 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 160);
    v17 = *(_QWORD *)(v0 + 168);
    sub_23B685BCC();
    swift_allocError();
    *(_QWORD *)v18 = 0;
    *(_QWORD *)(v18 + 8) = 0;
    *(_BYTE *)(v18 + 16) = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    goto LABEL_4;
  }
  v9 = v8;
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23B687BAC;
  v10 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v11 = (_QWORD *)(v0 + 80);
  v11[1] = 0x40000000;
  v11[2] = sub_23B6874D8;
  v11[3] = &block_descriptor;
  v11[4] = v10;
  objc_msgSend(v9, sel_aa_primaryAppleAccountWithCompletion_, v11);
  return swift_continuation_await();
}

uint64_t sub_23B687BAC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 248) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23B687C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_type_t type;
  NSObject *log;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = *(_QWORD *)(v0 + 120);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 224);
    v4 = *(_QWORD *)(v0 + 208);
    v3 = *(_QWORD *)(v0 + 216);
    v5 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 16))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
    v6 = sub_23B6919E8();
    v7 = sub_23B691B5C();
    v8 = os_log_type_enabled(v6, v7);
    v10 = *(_QWORD *)(v0 + 216);
    v9 = *(_QWORD *)(v0 + 224);
    v43 = *(_QWORD *)(v0 + 208);
    v11 = *(_QWORD *)(v0 + 192);
    v44 = *(_QWORD *)(v0 + 200);
    v12 = *(_QWORD *)(v0 + 184);
    if (v8)
    {
      v41 = *(_QWORD *)(v0 + 224);
      v42 = v1;
      log = v6;
      v13 = *(_QWORD *)(v0 + 176);
      v35 = *(_QWORD *)(v0 + 136);
      v36 = *(_QWORD *)(v0 + 168);
      v15 = *(_QWORD *)(v0 + 152);
      v14 = *(_QWORD *)(v0 + 160);
      v34 = *(_QWORD *)(v0 + 144);
      type = v7;
      v16 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v45 = v38;
      *(_DWORD *)v16 = 136315138;
      v37 = v10;
      sub_23B691C4C();
      sub_23B691DB4();
      sub_23B6882C8(&qword_256A3EA48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
      v17 = sub_23B691D9C();
      v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v15, v35);
      v20 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v20(v13, v14);
      *(_QWORD *)(v0 + 128) = sub_23B683014(v17, v19, &v45);
      sub_23B691BB0();
      swift_bridgeObjectRelease();
      v20(v12, v14);
      v21 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v21(v37, v44);
      _os_log_impl(&dword_23B67E000, log, type, "aa_primaryAppleAccount fetch duration: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86A58C](v38, -1, -1);
      MEMORY[0x23B86A58C](v16, -1, -1);

      v20(v11, v14);
      v1 = v42;
      v21(v41, v44);
    }
    else
    {
      v31 = *(_QWORD *)(v0 + 160);
      v30 = *(_QWORD *)(v0 + 168);

      v32 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v32(v12, v31);
      v33 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v33(v10, v44);
      v32(v11, v31);
      v33(v9, v44);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v0 + 240), v1);
  }
  else
  {

    v22 = *(_QWORD *)(v0 + 224);
    v23 = *(_QWORD *)(v0 + 200);
    v24 = *(_QWORD *)(v0 + 208);
    v25 = *(_QWORD *)(v0 + 192);
    v26 = *(_QWORD *)(v0 + 160);
    v27 = *(_QWORD *)(v0 + 168);
    sub_23B685BCC();
    swift_allocError();
    *(_QWORD *)v28 = 0;
    *(_QWORD *)(v28 + 8) = 0;
    *(_BYTE *)(v28 + 16) = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B687FEC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 168);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

ValueMetadata *type metadata accessor for AppleAccount()
{
  return &type metadata for AppleAccount;
}

uint64_t sub_23B6880C4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for AppleAccount.Error(uint64_t a1)
{
  return sub_23B6880EC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23B6880EC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s12FindMyCommon12AppleAccountO5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B6880C4(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AppleAccount.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23B6880C4(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_23B6880EC(v6, v7, v8);
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

uint64_t assignWithTake for AppleAccount.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_23B6880EC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleAccount.Error(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppleAccount.Error(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23B688284(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_23B6882A0(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppleAccount.Error()
{
  return &type metadata for AppleAccount.Error;
}

uint64_t sub_23B6882C8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B86A508](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B688308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EA58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
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

void sub_23B688390(id a1@<X1>, void *a2@<X0>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  char v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[2];
  __int128 v46;
  __int128 v47;
  uint64_t *v48;

  v7 = objc_msgSend(a1, sel_aa_personID);
  if (!v7)
    goto LABEL_7;
  v8 = v7;
  v9 = sub_23B691A6C();
  v11 = v10;

  v12 = objc_msgSend(a1, sel_username);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_23B685BCC();
    swift_allocError();
    v20 = xmmword_23B6923A0;
LABEL_8:
    *(_OWORD *)v19 = v20;
    v21 = 3;
LABEL_21:
    *(_BYTE *)(v19 + 16) = v21;
    swift_willThrow();
LABEL_22:

    return;
  }
  v13 = v12;
  v44 = v9;
  v48 = a3;
  v43 = sub_23B691A6C();
  v15 = v14;

  v16 = objc_msgSend(a1, sel_dataclassProperties);
  if (!v16)
  {
    v46 = 0u;
    v47 = 0u;
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B686F28((uint64_t)&v46);
LABEL_20:
    sub_23B685BCC();
    swift_allocError();
    *(_QWORD *)v19 = 0xD000000000000021;
    *(_QWORD *)(v19 + 8) = 0x800000023B6936B0;
    v21 = 1;
    goto LABEL_21;
  }
  v17 = v16;
  *(_QWORD *)&v45[0] = 0xD000000000000021;
  *((_QWORD *)&v45[0] + 1) = 0x800000023B6936B0;
  v18 = objc_msgSend(v16, sel___swift_objectForKeyedSubscript_, sub_23B691CF4());
  swift_unknownObjectRelease();

  if (v18)
  {
    sub_23B691BF8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v45, 0, sizeof(v45));
  }
  sub_23B686F68((uint64_t)v45, (uint64_t)&v46);
  if (!*((_QWORD *)&v47 + 1))
    goto LABEL_18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EA10);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v22 = *(_QWORD *)&v45[0];
  v23 = objc_msgSend(a1, sel_aa_fmipAccount);
  if (!v23)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B685BCC();
    swift_allocError();
    v20 = xmmword_23B692390;
    goto LABEL_8;
  }
  v24 = v23;
  v25 = objc_msgSend(a2, sel_credentialForAccount_, v23);
  if (!v25)
  {
    v26 = v24;
LABEL_25:

    goto LABEL_26;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, sel_credentialItemForKey_, *MEMORY[0x24BDB4238]);
  if (!v27)
  {

    goto LABEL_25;
  }
  v28 = v27;
  v42 = v26;
  v41 = sub_23B691A6C();
  v30 = v29;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31 = objc_msgSend(a1, sel_aa_authToken);
  if (v31)
  {
    v38 = v30;
    v40 = sub_23B691A6C();
    v33 = v32;

    v31 = v33;
    v30 = v38;
  }
  else
  {
    v40 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v34 = sub_23B685AB8(v22, 0x6E74736F48707061, 0xEB00000000656D61);
  if (v3)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  v39 = v34;
  v36 = v35;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  v37 = v48;
  *v48 = v43;
  v37[1] = v15;
  v37[2] = v44;
  v37[3] = v11;
  v37[4] = v40;
  v37[5] = (uint64_t)v31;
  v37[6] = v41;
  v37[7] = v30;
  v37[8] = v39;
  v37[9] = v36;
}

uint64_t FMIPAccount.icloudIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.dsid.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.authToken.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.appToken.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FMIPAccount.appHostName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t initializeBufferWithCopyOfBuffer for Analytics.DiscreteType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FMIPAccount()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for FMIPAccount(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FMIPAccount(_QWORD *a1, _QWORD *a2)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

_QWORD *assignWithTake for FMIPAccount(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FMIPAccount(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FMIPAccount(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FMIPAccount()
{
  return &type metadata for FMIPAccount;
}

uint64_t sub_23B688C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_2542FFFB0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2542FFFB0);
  if (qword_2542FFD88 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2542FFFC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B688CAC()
{
  uint64_t result;

  result = sub_23B691B20();
  qword_2542FFFA8 = result;
  return result;
}

void static AnalyticsPublisher.publish(event:)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;

  v2 = type metadata accessor for AnyAnalyticsEvent();
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  v6 = (uint64_t *)((char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v4, v7);
  v10 = (uint64_t *)((char *)&v36 - v9);
  if ((MEMORY[0x23B869C80](v8) & 1) != 0)
  {
    if (qword_2542FFD80 != -1)
      swift_once();
    v11 = sub_23B691A00();
    __swift_project_value_buffer(v11, (uint64_t)qword_2542FFFB0);
    v37 = sub_23B6919E8();
    v12 = sub_23B691B5C();
    if (os_log_type_enabled(v37, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23B67E000, v37, v12, "AnalyticsPublisher not submitting analytics during unit tests.", v13, 2u);
      MEMORY[0x23B86A58C](v13, -1, -1);
    }

  }
  else
  {
    if (qword_2542FFCE8 != -1)
      swift_once();
    v14 = qword_2542FFFA8;
    v15 = *a1;
    v16 = a1[1];
    swift_bridgeObjectRetain();
    LOBYTE(v14) = sub_23B681440(v15, v16, v14);
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
    {
      if (qword_2542FFD80 != -1)
        swift_once();
      v17 = sub_23B691A00();
      __swift_project_value_buffer(v17, (uint64_t)qword_2542FFFB0);
      sub_23B68A65C((uint64_t)a1, (uint64_t)v6);
      v18 = sub_23B6919E8();
      v19 = sub_23B691B2C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v21 = swift_slowAlloc();
        v39 = v21;
        *(_DWORD *)v20 = 136446210;
        v22 = *v6;
        v23 = v6[1];
        swift_bridgeObjectRetain();
        v38 = sub_23B683014(v22, v23, &v39);
        sub_23B691BB0();
        swift_bridgeObjectRelease();
        sub_23B68A6A0((uint64_t)v6);
        _os_log_impl(&dword_23B67E000, v18, v19, "AnalyticsPublisher not submitting disallowed analytics event %{public}s to CA.", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B86A58C](v21, -1, -1);
        MEMORY[0x23B86A58C](v20, -1, -1);
      }
      else
      {
        sub_23B68A6A0((uint64_t)v6);
      }

    }
    else
    {
      sub_23B6892DC(*(uint64_t *)((char *)a1 + *(int *)(v2 + 24)));
      if (qword_2542FFD80 != -1)
        swift_once();
      v24 = sub_23B691A00();
      __swift_project_value_buffer(v24, (uint64_t)qword_2542FFFB0);
      sub_23B68A65C((uint64_t)a1, (uint64_t)v10);
      swift_bridgeObjectRetain_n();
      v25 = sub_23B6919E8();
      v26 = sub_23B691B2C();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = swift_slowAlloc();
        v28 = swift_slowAlloc();
        v39 = v28;
        *(_DWORD *)v27 = 136446466;
        v29 = *v10;
        v30 = v10[1];
        swift_bridgeObjectRetain();
        v38 = sub_23B683014(v29, v30, &v39);
        sub_23B691BB0();
        swift_bridgeObjectRelease();
        sub_23B68A6A0((uint64_t)v10);
        *(_WORD *)(v27 + 12) = 2082;
        sub_23B68A6DC();
        swift_bridgeObjectRetain();
        v31 = sub_23B691A3C();
        v33 = v32;
        swift_bridgeObjectRelease();
        v38 = sub_23B683014(v31, v33, &v39);
        sub_23B691BB0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B67E000, v25, v26, "Analytics: %{public}s, %{public}s.", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x23B86A58C](v28, -1, -1);
        MEMORY[0x23B86A58C](v27, -1, -1);

      }
      else
      {
        sub_23B68A6A0((uint64_t)v10);

        swift_bridgeObjectRelease_n();
      }
      v34 = (void *)sub_23B691A60();
      sub_23B68A6DC();
      v35 = (void *)sub_23B691A30();
      swift_bridgeObjectRelease();
      AnalyticsSendEvent();

    }
  }
}

uint64_t sub_23B68925C()
{
  uint64_t v0;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_2542FFFC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542FFFC8);
  return sub_23B6919F4();
}

uint64_t sub_23B6892DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v14;
  uint64_t v15;
  __int128 v16;
  _OWORD v17[3];
  _QWORD v18[2];
  _BYTE v19[8];

  v14 = (_QWORD *)(a1 + 64);
  v1 = 1 << *(_BYTE *)(a1 + 32);
  v2 = -1;
  if (v1 < 64)
    v2 = ~(-1 << v1);
  v3 = v2 & *(_QWORD *)(a1 + 64);
  v4 = (unint64_t)(v1 + 63) >> 6;
  v5 = 0;
  v15 = swift_bridgeObjectRetain();
  v6 = MEMORY[0x24BEE4B00];
  if (v3)
  {
    v7 = __clz(__rbit64(v3));
LABEL_5:
    v8 = *(_QWORD *)(v15 + 56);
    v9 = (_QWORD *)(*(_QWORD *)(v15 + 48) + 16 * v7);
    v10 = v9[1];
    *(_QWORD *)&v16 = *v9;
    *((_QWORD *)&v16 + 1) = v10;
    sub_23B684C78(v8 + 48 * v7, (uint64_t)v17);
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  v11 = 1;
  if (v4 > 1)
  {
    v12 = v14[1];
    if (v12)
    {
LABEL_8:
      v7 = __clz(__rbit64(v12)) + (v11 << 6);
      goto LABEL_5;
    }
    if (v4 > 2)
    {
      v12 = v14[2];
      if (v12)
      {
        v11 = 2;
        goto LABEL_8;
      }
      if (v4 > 3)
      {
        v12 = v14[3];
        if (v12)
        {
          v11 = 3;
          goto LABEL_8;
        }
        v11 = 4;
        if (v4 > 4)
        {
          v12 = v14[4];
          if (v12)
            goto LABEL_8;
          while (v4 - 5 != v5)
          {
            v12 = *(_QWORD *)(v15 + 104 + 8 * v5++);
            if (v12)
            {
              v11 = v5 + 4;
              goto LABEL_8;
            }
          }
        }
      }
    }
  }
  memset(v17, 0, 41);
  v16 = 0u;
LABEL_10:
  sub_23B68A728((uint64_t)&v16, (uint64_t)v18);
  if (v18[1])
  {
    sub_23B685640((uint64_t)v19, (uint64_t)&v16);
    __asm { BR              X9 }
  }
  swift_release();
  return v6;
}

uint64_t sub_23B68A65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AnyAnalyticsEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B68A6A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AnyAnalyticsEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23B68A6DC()
{
  unint64_t result;

  result = qword_2542FFDB0;
  if (!qword_2542FFDB0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542FFDB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsPublisher()
{
  return &type metadata for AnalyticsPublisher;
}

uint64_t sub_23B68A728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B68A770(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t StateCaptureHint.version.getter()
{
  unsigned int *v0;

  return *v0;
}

{
  unsigned int *v0;

  return *v0;
}

uint64_t StateCaptureHint.requestor.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

void StateCaptureHint.api.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

void StateCaptureHint.reason.getter(_DWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_DWORD *)(v1 + 28);
}

{
  uint64_t v1;

  *a1 = *(_DWORD *)(v1 + 28);
}

uint64_t StateCaptureHint.description.getter()
{
  sub_23B691C28();
  swift_bridgeObjectRelease();
  sub_23B691CC4();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  StateCaptureReason.description.getter();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  return 0x6E6F69737265765BLL;
}

{
  sub_23B691C28();
  swift_bridgeObjectRelease();
  sub_23B691CC4();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  StateCaptureReason.description.getter();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  return 0x6E6F69737265765BLL;
}

uint64_t StateCaptureHint.init(version:requestor:api:reason:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, int *a5@<X4>, uint64_t a6@<X8>)
{
  char v6;
  int v7;

  v6 = *a4;
  v7 = *a5;
  *(_DWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 24) = v6;
  *(_DWORD *)(a6 + 28) = v7;
  return result;
}

{
  char v6;
  int v7;

  v6 = *a4;
  v7 = *a5;
  *(_DWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 24) = v6;
  *(_DWORD *)(a6 + 28) = v7;
  return result;
}

uint64_t StateCaptureHintAPI.description.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746C7561662ELL;
  if (*v0 != 1)
    v1 = 0x747365757165722ELL;
  if (*v0)
    return v1;
  else
    return 0x726F7272652ELL;
}

{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746C7561662ELL;
  if (*v0 != 1)
    v1 = 0x747365757165722ELL;
  if (*v0)
    return v1;
  else
    return 0x726F7272652ELL;
}

FindMyCommon::StateCaptureHintAPI_optional __swiftcall StateCaptureHintAPI.init(rawValue:)(Swift::UInt32 rawValue)
{
  _BYTE *v1;
  unsigned int v2;

  v2 = 0x2010003u >> (8 * rawValue);
  if (rawValue >= 4)
    LOBYTE(v2) = 3;
  *v1 = v2;
  return (FindMyCommon::StateCaptureHintAPI_optional)rawValue;
}

uint64_t StateCaptureHintAPI.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

{
  unsigned __int8 *v0;

  return *v0 + 1;
}

BOOL sub_23B68AA0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B68AA20()
{
  sub_23B691D60();
  sub_23B691D78();
  return sub_23B691D84();
}

uint64_t sub_23B68AA64()
{
  return sub_23B691D78();
}

uint64_t sub_23B68AA90()
{
  sub_23B691D60();
  sub_23B691D78();
  return sub_23B691D84();
}

FindMyCommon::StateCaptureHintAPI_optional sub_23B68AAD0(Swift::UInt32 *a1)
{
  return StateCaptureHintAPI.init(rawValue:)(*a1);
}

void sub_23B68AAD8(_DWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t sub_23B68AAE8()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746C7561662ELL;
  if (*v0 != 1)
    v1 = 0x747365757165722ELL;
  if (*v0)
    return v1;
  else
    return 0x726F7272652ELL;
}

uint64_t StateCaptureReason.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

{
  unsigned int *v0;

  return *v0;
}

uint64_t StateCaptureReason.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

void static StateCaptureReason.general.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

{
  *a1 = 1;
}

void static StateCaptureReason.networking.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

{
  *a1 = 2;
}

void static StateCaptureReason.cellular.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

{
  *a1 = 4;
}

void static StateCaptureReason.authentication.getter(_DWORD *a1@<X8>)
{
  *a1 = 8;
}

{
  *a1 = 8;
}

void sub_23B68AB7C()
{
  dword_256A3EA60 = 15;
}

uint64_t sub_23B68ABBC@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3;
  int v4;
  int *v5;
  int v6;
  int v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (int *)(a1 + 32);
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

uint64_t static StateCaptureReason.all.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;

  if (qword_256A3E990 != -1)
    result = swift_once();
  *a1 = dword_256A3EA60;
  return result;
}

{
  uint64_t result;

  if (qword_256A3EC50 != -1)
    result = swift_once();
  *a1 = dword_256A3EC68;
  return result;
}

uint64_t StateCaptureReason.description.getter()
{
  int *v0;
  int v1;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((v1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_23B68B40C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_23B68B40C((_QWORD *)(v3 > 1), v4 + 1, 1, v2);
  v2[2] = v4 + 1;
  v5 = &v2[2 * v4];
  v5[4] = 0x6C6172656E65672ELL;
  v5[5] = 0xE800000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_23B68B40C(0, v2[2] + 1, 1, v2);
    v7 = v2[2];
    v6 = v2[3];
    if (v7 >= v6 >> 1)
      v2 = sub_23B68B40C((_QWORD *)(v6 > 1), v7 + 1, 1, v2);
    v2[2] = v7 + 1;
    v8 = &v2[2 * v7];
    v8[4] = 0x6B726F7774656E2ELL;
    v8[5] = 0xEB00000000676E69;
  }
LABEL_12:
  if ((v1 & 4) == 0)
  {
    if ((v1 & 8) == 0)
      goto LABEL_25;
    goto LABEL_20;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B68B40C(0, v2[2] + 1, 1, v2);
  v10 = v2[2];
  v9 = v2[3];
  if (v10 >= v9 >> 1)
    v2 = sub_23B68B40C((_QWORD *)(v9 > 1), v10 + 1, 1, v2);
  v2[2] = v10 + 1;
  v11 = &v2[2 * v10];
  v11[4] = 0x616C756C6C65632ELL;
  v11[5] = 0xE900000000000072;
  if ((v1 & 8) != 0)
  {
LABEL_20:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_23B68B40C(0, v2[2] + 1, 1, v2);
    v13 = v2[2];
    v12 = v2[3];
    if (v13 >= v12 >> 1)
      v2 = sub_23B68B40C((_QWORD *)(v12 > 1), v13 + 1, 1, v2);
    v2[2] = v13 + 1;
    v14 = &v2[2 * v13];
    v14[4] = 0x746E65687475612ELL;
    v14[5] = 0xEF6E6F6974616369;
  }
LABEL_25:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EA68);
  sub_23B68B0F0();
  sub_23B691A48();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  return 91;
}

{
  int *v0;
  int v1;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((v1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_23B68B40C(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_23B68B40C((_QWORD *)(v3 > 1), v4 + 1, 1, v2);
  v2[2] = v4 + 1;
  v5 = &v2[2 * v4];
  v5[4] = 0x6C6172656E65672ELL;
  v5[5] = 0xE800000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_23B68B40C(0, v2[2] + 1, 1, v2);
    v7 = v2[2];
    v6 = v2[3];
    if (v7 >= v6 >> 1)
      v2 = sub_23B68B40C((_QWORD *)(v6 > 1), v7 + 1, 1, v2);
    v2[2] = v7 + 1;
    v8 = &v2[2 * v7];
    v8[4] = 0x6B726F7774656E2ELL;
    v8[5] = 0xEB00000000676E69;
  }
LABEL_12:
  if ((v1 & 4) == 0)
  {
    if ((v1 & 8) == 0)
      goto LABEL_25;
    goto LABEL_20;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B68B40C(0, v2[2] + 1, 1, v2);
  v10 = v2[2];
  v9 = v2[3];
  if (v10 >= v9 >> 1)
    v2 = sub_23B68B40C((_QWORD *)(v9 > 1), v10 + 1, 1, v2);
  v2[2] = v10 + 1;
  v11 = &v2[2 * v10];
  v11[4] = 0x616C756C6C65632ELL;
  v11[5] = 0xE900000000000072;
  if ((v1 & 8) != 0)
  {
LABEL_20:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_23B68B40C(0, v2[2] + 1, 1, v2);
    v13 = v2[2];
    v12 = v2[3];
    if (v13 >= v12 >> 1)
      v2 = sub_23B68B40C((_QWORD *)(v12 > 1), v13 + 1, 1, v2);
    v2[2] = v13 + 1;
    v14 = &v2[2 * v13];
    v14[4] = 0x746E65687475612ELL;
    v14[5] = 0xEF6E6F6974616369;
  }
LABEL_25:
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EA68);
  sub_23B68B0F0();
  sub_23B691A48();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  return 91;
}

_DWORD *sub_23B68AF24@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_23B68AF34(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_23B68AF3C@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_DWORD *sub_23B68AF50@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_DWORD *sub_23B68AF64@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23B68AF78(_DWORD *a1, int *a2)
{
  _DWORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_23B68AFA8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v3 == 0;
  return result;
}

int *sub_23B68AFD4@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *sub_23B68AFF8(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *sub_23B68B00C(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

_DWORD *sub_23B68B020(_DWORD *result)
{
  _DWORD *v1;

  *v1 ^= *result;
  return result;
}

_DWORD *sub_23B68B034@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23B68B048(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23B68B05C(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23B68B070(_DWORD *a1)
{
  _DWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23B68B084()
{
  _DWORD *v0;

  return *v0 == 0;
}

uint64_t sub_23B68B094()
{
  return sub_23B691C04();
}

_DWORD *sub_23B68B0AC(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= ~*result;
  return result;
}

_DWORD *sub_23B68B0C0@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_23B68B0D0(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

BOOL sub_23B68B0DC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_23B68B0F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A3EA70;
  if (!qword_256A3EA70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A3EA68);
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_256A3EA70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B86A4FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t StateCaptureStateData.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StateCaptureStateData.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23B68B518(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23B68B518(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

void StateCaptureStateData.init(type:title:data:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
}

unint64_t StateCaptureStateData.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  sub_23B691C28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  sub_23B68B518(v1, v2);
  sub_23B691970();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B68B55C(v1, v2);
  sub_23B691A9C();
  return 0xD00000000000001ALL;
}

uint64_t StateCaptureDateType.description.getter()
{
  return 0x696C61697265732ELL;
}

{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x75626F746F72702ELL;
  if (*v0 != 1)
    v1 = 0x6D6F747375632ELL;
  if (*v0)
    return v1;
  else
    return 0x696C61697265732ELL;
}

uint64_t StateCaptureDateType.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = (_DWORD)result != 1;
  return result;
}

uint64_t StateCaptureDateType.rawValue.getter()
{
  return 1;
}

uint64_t sub_23B68B324()
{
  return 1;
}

uint64_t sub_23B68B32C()
{
  sub_23B691D60();
  sub_23B691D78();
  return sub_23B691D84();
}

uint64_t sub_23B68B36C()
{
  return sub_23B691D78();
}

uint64_t sub_23B68B390()
{
  sub_23B691D60();
  sub_23B691D78();
  return sub_23B691D84();
}

_DWORD *sub_23B68B3CC@<X0>(_DWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 1;
  return result;
}

void sub_23B68B3E0(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_23B68B3EC()
{
  return 0x696C61697265732ELL;
}

_QWORD *sub_23B68B40C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EAA8);
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
    sub_23B68BD50(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B68B518(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B68B55C(uint64_t a1, unint64_t a2)
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

unint64_t sub_23B68B5A4()
{
  unint64_t result;

  result = qword_256A3EA78;
  if (!qword_256A3EA78)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureHintAPI, &type metadata for StateCaptureHintAPI);
    atomic_store(result, (unint64_t *)&qword_256A3EA78);
  }
  return result;
}

unint64_t sub_23B68B5EC()
{
  unint64_t result;

  result = qword_256A3EA80;
  if (!qword_256A3EA80)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EA80);
  }
  return result;
}

unint64_t sub_23B68B634()
{
  unint64_t result;

  result = qword_256A3EA88;
  if (!qword_256A3EA88)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EA88);
  }
  return result;
}

unint64_t sub_23B68B67C()
{
  unint64_t result;

  result = qword_256A3EA90;
  if (!qword_256A3EA90)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EA90);
  }
  return result;
}

unint64_t sub_23B68B6C4()
{
  unint64_t result;

  result = qword_256A3EA98;
  if (!qword_256A3EA98)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EA98);
  }
  return result;
}

unint64_t sub_23B68B70C()
{
  unint64_t result;

  result = qword_256A3EAA0;
  if (!qword_256A3EAA0)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureDateType, &type metadata for StateCaptureDateType);
    atomic_store(result, (unint64_t *)&qword_256A3EAA0);
  }
  return result;
}

uint64_t destroy for StateCaptureHint()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StateCaptureHint(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StateCaptureHint(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  return a1;
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

uint64_t assignWithTake for StateCaptureHint(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  return a1;
}

uint64_t getEnumTagSinglePayload for StateCaptureHint(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StateCaptureHint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StateCaptureHint()
{
  return &type metadata for StateCaptureHint;
}

{
  return &type metadata for StateCaptureHint;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StateCaptureHintAPI(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StateCaptureHintAPI(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B68BA04 + 4 * byte_23B692555[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B68BA38 + 4 * asc_23B692550[v4]))();
}

uint64_t sub_23B68BA38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B68BA40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B68BA48);
  return result;
}

uint64_t sub_23B68BA54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B68BA5CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B68BA60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B68BA68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B68BA74(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B68BA7C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StateCaptureHintAPI()
{
  return &type metadata for StateCaptureHintAPI;
}

{
  return &type metadata for StateCaptureHintAPI;
}

ValueMetadata *type metadata accessor for StateCaptureReason()
{
  return &type metadata for StateCaptureReason;
}

{
  return &type metadata for StateCaptureReason;
}

uint64_t destroy for StateCaptureStateData(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_23B68B55C(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

{
  swift_bridgeObjectRelease();
  return sub_23B68B55C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
}

_QWORD *initializeWithCopy for StateCaptureStateData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_23B68B518(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

_QWORD *assignWithCopy for StateCaptureStateData(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[2];
  v4 = a2[3];
  sub_23B68B518(v5, v4);
  v6 = a1[2];
  v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_23B68B55C(v6, v7);
  return a1;
}

_QWORD *assignWithTake for StateCaptureStateData(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a1[2];
  v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_23B68B55C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StateCaptureStateData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StateCaptureStateData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StateCaptureStateData()
{
  return &type metadata for StateCaptureStateData;
}

{
  return &type metadata for StateCaptureStateData;
}

uint64_t getEnumTagSinglePayload for StateCaptureDateType(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StateCaptureDateType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B68BCEC + 4 * byte_23B69255A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B68BD0C + 4 * byte_23B69255F[v4]))();
}

_BYTE *sub_23B68BCEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B68BD0C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B68BD14(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B68BD1C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B68BD24(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B68BD2C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23B68BD38()
{
  return 0;
}

ValueMetadata *type metadata accessor for StateCaptureDateType()
{
  return &type metadata for StateCaptureDateType;
}

{
  return &type metadata for StateCaptureDateType;
}

uint64_t sub_23B68BD50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23B691CB8();
  __break(1u);
  return result;
}

uint64_t sub_23B68BE48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_256A3EAB0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256A3EAB0);
  if (qword_256A3E9A0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_256A3EAC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t StateCapture.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_id;
  v4 = sub_23B6919DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t StateCapture.__allocating_init(_:)(NSObject *a1, uint64_t a2)
{
  swift_allocObject();
  return StateCapture.init(_:)(a1, a2);
}

uint64_t StateCapture.init(_:)(NSObject *a1, uint64_t a2)
{
  uint64_t *v2;
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
  char *v18;
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
  _QWORD *v30;
  void (*v31)(void);
  char *v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(unint64_t, char *, uint64_t);
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void (**v43)(char *, ValueMetadata *);
  void (*v44)(unint64_t, char *);
  char *v45;
  unint64_t v46;
  char *v47;
  ValueMetadata *v48;
  uint64_t v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  void (*v59)(char *, char *);
  ValueMetadata *v60;
  uint64_t v61;
  unint64_t v62;
  os_log_t v63;
  char *v64;
  void (*v65)(char *, char *);
  unint64_t v67;
  void (*v68)(void);
  char *v69;
  unint64_t v70;
  uint64_t v71;
  os_log_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  _QWORD *v76;
  void (**Description)(char *, ValueMetadata *);
  uint64_t v78;
  ValueMetadata *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v78 = a2;
  v3 = *v2;
  v72 = a1;
  v73 = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EAE0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v71 = (uint64_t)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = type metadata accessor for StateCaptureHandle();
  Description = (void (**)(char *, ValueMetadata *))v79[-1].Description;
  MEMORY[0x24BDAC7A8](v79, v7);
  v74 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23B6919DC();
  v76 = *(_QWORD **)(v9 - 8);
  v10 = v76[8];
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v69 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v75 = (char *)&v67 - v15;
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)&v67 - v17;
  v19 = sub_23B691B68();
  MEMORY[0x24BDAC7A8](v19, v20);
  v21 = sub_23B691A18();
  MEMORY[0x24BDAC7A8](v21, v22);
  v23 = sub_23B691B74();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v25);
  v27 = (char *)&v67 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = OBJC_IVAR____TtC12FindMyCommon12StateCapture_queue;
  v70 = sub_23B68C670();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v27, *MEMORY[0x24BEE5758], v23);
  sub_23B691A0C();
  v82 = MEMORY[0x24BEE4AF8];
  sub_23B6882C8(&qword_256A3EAF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EB00);
  sub_23B68C6AC();
  sub_23B691C10();
  v29 = v80;
  *(_QWORD *)(v29 + v28) = sub_23B691B80();
  sub_23B6919D0();
  v30 = v76;
  v31 = (void (*)(void))v76[2];
  v67 = v29 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_id;
  v31();
  v32 = v75;
  v70 = (unint64_t)v18;
  v68 = v31;
  ((void (*)(char *, char *, uint64_t))v31)(v75, v18, v9);
  v33 = v30;
  v34 = (*((unsigned __int8 *)v30 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v30 + 80);
  v35 = (v10 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  v36 = swift_allocObject();
  v37 = (void (*)(unint64_t, char *, uint64_t))v33[4];
  v75 = (char *)v9;
  v37(v36 + v34, v32, v9);
  v38 = (_QWORD *)(v36 + v35);
  v39 = v78;
  *v38 = v72;
  v38[1] = v39;
  *(_QWORD *)(v36 + ((v35 + 23) & 0xFFFFFFFFFFFFFFF8)) = v73;
  v40 = *(void **)(v29 + v28);
  swift_retain();
  v41 = v40;
  v42 = v71;
  os_state_add_handler(queue:block:)((uint64_t)sub_23B68CCF8, v36, v71);

  v43 = Description;
  if (((unsigned int (*)(uint64_t, uint64_t, ValueMetadata *))Description[6])(v42, 1, v79) == 1)
  {
    swift_release();
    swift_release();
    v44 = (void (*)(unint64_t, char *))v33[1];
    v45 = v75;
    v44(v70, v75);
    sub_23B68CD68(v42);
    v44(v67, v45);

    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v46 = v70;
    v47 = v74;
    v48 = v79;
    ((void (*)(char *, uint64_t, ValueMetadata *))v43[4])(v74, v42, v79);
    ((void (*)(uint64_t, char *, ValueMetadata *))v43[2])(v80 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_handle, v47, v48);
    if (qword_256A3E998 != -1)
      swift_once();
    v49 = sub_23B691A00();
    __swift_project_value_buffer(v49, (uint64_t)qword_256A3EAB0);
    v50 = v69;
    ((void (*)(char *, unint64_t, char *))v68)(v69, v46, v75);
    swift_retain_n();
    v51 = sub_23B6919E8();
    v52 = sub_23B691B38();
    v53 = v52;
    if (os_log_type_enabled(v51, v52))
    {
      v54 = swift_slowAlloc();
      v55 = swift_slowAlloc();
      v82 = v55;
      *(_DWORD *)v54 = 136446466;
      v72 = v51;
      sub_23B6882C8(&qword_256A3EB18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      LODWORD(v71) = v53;
      v56 = v75;
      v57 = sub_23B691CC4();
      v81 = sub_23B683014(v57, v58, &v82);
      v73 = v36;
      sub_23B691BB0();
      swift_bridgeObjectRelease();
      v59 = (void (*)(char *, char *))v76[1];
      v59(v50, v56);
      *(_WORD *)(v54 + 12) = 2080;
      sub_23B6882C8(&qword_256A3EB20, (uint64_t (*)(uint64_t))type metadata accessor for StateCaptureHandle, (uint64_t)&protocol conformance descriptor for StateCaptureHandle);
      v60 = v79;
      v61 = sub_23B691CC4();
      v81 = sub_23B683014(v61, v62, &v82);
      sub_23B691BB0();
      swift_release_n();
      swift_bridgeObjectRelease();
      v63 = v72;
      _os_log_impl(&dword_23B67E000, v72, (os_log_type_t)v71, "Added handler: %{public}s %s", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B86A58C](v55, -1, -1);
      MEMORY[0x23B86A58C](v54, -1, -1);

      swift_release();
      swift_release();
      Description[1](v74, v60);
      v59((char *)v46, v56);
    }
    else
    {
      swift_release_n();

      swift_release();
      swift_release();
      v64 = v75;
      v65 = (void (*)(char *, char *))v76[1];
      v65(v50, v75);
      Description[1](v74, v79);
      v65((char *)v46, v64);
    }
  }
  return v80;
}

unint64_t sub_23B68C670()
{
  unint64_t result;

  result = qword_256A3EAF0;
  if (!qword_256A3EAF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256A3EAF0);
  }
  return result;
}

unint64_t sub_23B68C6AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A3EB08;
  if (!qword_256A3EB08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A3EB00);
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256A3EB08);
  }
  return result;
}

uint64_t sub_23B68C6F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  char *v19;
  ValueMetadata *v20;
  void (**v21)(_DWORD *, ValueMetadata *);
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  ValueMetadata *v25;
  uint64_t (**v26)(_BYTE *, ValueMetadata *);
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(char *, _QWORD, ValueMetadata *);
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  dispatch_semaphore_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t (**v55)(char *, uint64_t, ValueMetadata *);
  ValueMetadata *v56;
  uint64_t (*v57)(char *, uint64_t, ValueMetadata *);
  _BYTE *v58;
  uint64_t v59;
  ValueMetadata *v60;
  ValueMetadata *v61;
  char *v62;
  uint64_t (**Description)(char *, uint64_t, ValueMetadata *);
  ValueMetadata *v64;
  char *v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  dispatch_semaphore_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  void (**v77)(char *, _QWORD, ValueMetadata *);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  ValueMetadata *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;

  v79 = a5;
  v80 = a4;
  v78 = a3;
  v76 = (char *)a2;
  v67 = a6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EBF0);
  MEMORY[0x24BDAC7A8](v7, v8);
  v65 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for StateCaptureDateType();
  Description = (uint64_t (**)(char *, uint64_t, ValueMetadata *))v64[-1].Description;
  MEMORY[0x24BDAC7A8](v64, v10);
  v62 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = type metadata accessor for StateCaptureHint();
  v77 = (void (**)(char *, _QWORD, ValueMetadata *))v84[-1].Description;
  MEMORY[0x24BDAC7A8](v84, v12);
  v74 = v13;
  v83 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_23B6919DC();
  v75 = *(_QWORD *)(v82 - 8);
  v14 = *(_QWORD *)(v75 + 64);
  MEMORY[0x24BDAC7A8](v82, v15);
  v81 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542FFC10);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for StateCaptureReason();
  v21 = (void (**)(_DWORD *, ValueMetadata *))v20[-1].Description;
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (_DWORD *)((char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = type metadata accessor for StateCaptureHintAPI();
  v26 = (uint64_t (**)(_BYTE *, ValueMetadata *))v25[-1].Description;
  MEMORY[0x24BDAC7A8](v25, v27);
  v29 = (char *)&v62 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B691928();
  v72 = dispatch_semaphore_create(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EBF8);
  swift_allocObject();
  v73 = sub_23B69191C();
  v71 = StateCaptureHint.version.getter();
  v30 = StateCaptureHint.requestor.getter();
  v69 = v31;
  v70 = v30;
  StateCaptureHint.api.getter(v29);
  v32 = StateCaptureHintAPI.rawValue.getter();
  result = v26[1](v29, v25);
  v68 = v32 - 1;
  if ((v32 - 1) > 2)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  StateCaptureHint.reason.getter(v24);
  v66 = StateCaptureReason.rawValue.getter();
  v21[1](v24, v20);
  v34 = sub_23B691B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v19, 1, 1, v34);
  v35 = v75;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v81, v76, v82);
  v76 = v19;
  v36 = v77;
  v77[2](v83, a1, v84);
  v37 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v38 = (v14 + *((unsigned __int8 *)v36 + 80) + v37) & ~(unint64_t)*((unsigned __int8 *)v36 + 80);
  v39 = (v74 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  v41 = (v40 + 39) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v41 + 15) & 0xFFFFFFFFFFFFFFF8;
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = 0;
  *(_QWORD *)(v43 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v43 + v37, v81, v82);
  ((void (**)(char *, char *, ValueMetadata *))v36)[4]((char *)(v43 + v38), v83, v84);
  v44 = (_QWORD *)(v43 + v39);
  v45 = v80;
  *v44 = v78;
  v44[1] = v45;
  v46 = v43 + v40;
  *(_DWORD *)v46 = v71;
  v47 = v69;
  *(_QWORD *)(v46 + 8) = v70;
  *(_QWORD *)(v46 + 16) = v47;
  *(_BYTE *)(v46 + 24) = v68;
  *(_DWORD *)(v46 + 28) = v66;
  v48 = v72;
  *(_QWORD *)(v43 + v41) = v73;
  *(_QWORD *)(v43 + v42) = v48;
  *(_QWORD *)(v43 + ((v42 + 15) & 0xFFFFFFFFFFFFFFF8)) = v79;
  swift_retain();
  swift_retain();
  v49 = v48;
  sub_23B68F180((uint64_t)v76, (uint64_t)&unk_256A3EC08, v43);
  swift_release();
  sub_23B691B8C();
  sub_23B691904();
  v50 = v86;
  if (v86)
  {
    v51 = v85;
    v52 = v87;
    v53 = v88;
    swift_bridgeObjectRetain();
    sub_23B68B518(v52, v53);
    v54 = v65;
    StateCaptureDateType.init(rawValue:)(1u);
    v55 = Description;
    v56 = v64;
    result = Description[6](v54, 1, v64);
    if ((_DWORD)result != 1)
    {
      v57 = v55[4];
      v58 = v62;
      v57(v62, (uint64_t)v54, v56);
      swift_bridgeObjectRetain();
      sub_23B68B518(v52, v53);
      v59 = v67;
      StateCaptureStateData.init(type:title:data:)(v58, v51, v50, v52, v53, v67);
      sub_23B68E6D0(v51, v50, v52, v53);
      swift_release();

      sub_23B68E6D0(v51, v50, v52, v53);
      v60 = type metadata accessor for StateCaptureStateData();
      return (*((uint64_t (**)(uint64_t, _QWORD, uint64_t, ValueMetadata *))v60[-1].Description + 7))(v59, 0, 1, v60);
    }
    goto LABEL_8;
  }

  swift_release();
  v61 = type metadata accessor for StateCaptureStateData();
  return (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, ValueMetadata *))v61[-1].Description + 7))(v67, 1, 1, v61);
}

uint64_t sub_23B68CC78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23B6919DC();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B68CCF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(sub_23B6919DC() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_23B68C6F8(a1, v2 + v6, *(_QWORD *)(v2 + v7), *(_QWORD *)(v2 + v7 + 8), *(_QWORD *)(v2 + ((v7 + 23) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_23B68CD68(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EAE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23B68CDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ValueMetadata *v11;
  ValueMetadata *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  *(_QWORD *)(v8 + 248) = v19;
  *(_OWORD *)(v8 + 232) = v18;
  *(_OWORD *)(v8 + 216) = v17;
  *(_DWORD *)(v8 + 552) = a8;
  *(_QWORD *)(v8 + 200) = a6;
  *(_QWORD *)(v8 + 208) = a7;
  *(_QWORD *)(v8 + 184) = a4;
  *(_QWORD *)(v8 + 192) = a5;
  v9 = sub_23B691DC0();
  *(_QWORD *)(v8 + 256) = v9;
  *(_QWORD *)(v8 + 264) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  v10 = sub_23B691A00();
  *(_QWORD *)(v8 + 280) = v10;
  *(_QWORD *)(v8 + 288) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 296) = swift_task_alloc();
  *(_QWORD *)(v8 + 304) = swift_task_alloc();
  v11 = type metadata accessor for StateCaptureReason();
  *(_QWORD *)(v8 + 312) = v11;
  *(_QWORD *)(v8 + 320) = v11[-1].Description;
  *(_QWORD *)(v8 + 328) = swift_task_alloc();
  v12 = type metadata accessor for StateCaptureHint();
  *(_QWORD *)(v8 + 336) = v12;
  *(_QWORD *)(v8 + 344) = v12[-1].Description;
  *(_QWORD *)(v8 + 352) = swift_task_alloc();
  *(_QWORD *)(v8 + 360) = swift_task_alloc();
  v13 = sub_23B6919DC();
  *(_QWORD *)(v8 + 368) = v13;
  *(_QWORD *)(v8 + 376) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 384) = swift_task_alloc();
  *(_QWORD *)(v8 + 392) = swift_task_alloc();
  *(_QWORD *)(v8 + 400) = swift_task_alloc();
  *(_QWORD *)(v8 + 408) = swift_task_alloc();
  v14 = sub_23B691C64();
  *(_QWORD *)(v8 + 416) = v14;
  *(_QWORD *)(v8 + 424) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 432) = swift_task_alloc();
  *(_QWORD *)(v8 + 440) = swift_task_alloc();
  *(_QWORD *)(v8 + 448) = swift_task_alloc();
  *(_QWORD *)(v8 + 456) = swift_task_alloc();
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  *(_QWORD *)(v8 + 480) = swift_task_alloc();
  v15 = sub_23B691C7C();
  *(_QWORD *)(v8 + 488) = v15;
  *(_QWORD *)(v8 + 496) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 504) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B68CFA8()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  int *v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_log_type_t type;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;

  sub_23B691C70();
  sub_23B691C4C();
  if (qword_256A3E998 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 408);
  v3 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 376);
  v5 = *(_QWORD *)(v0 + 344);
  v41 = *(_QWORD *)(v0 + 360);
  v43 = *(_QWORD *)(v0 + 352);
  v6 = *(_QWORD *)(v0 + 336);
  v7 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 512) = __swift_project_value_buffer(*(_QWORD *)(v0 + 280), (uint64_t)qword_256A3EAB0);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 520) = v8;
  v8(v2, v1, v3);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v9(v41, v7, v6);
  v9(v43, v7, v6);
  v10 = sub_23B6919E8();
  v11 = sub_23B691B5C();
  v12 = os_log_type_enabled(v10, v11);
  v13 = *(_QWORD *)(v0 + 408);
  v14 = *(_QWORD *)(v0 + 368);
  v15 = *(_QWORD *)(v0 + 376);
  v16 = *(_QWORD *)(v0 + 352);
  v17 = *(_QWORD *)(v0 + 360);
  v18 = *(_QWORD *)(v0 + 336);
  v44 = *(_QWORD *)(v0 + 344);
  if (v12)
  {
    v39 = *(_QWORD *)(v0 + 336);
    v19 = *(_DWORD **)(v0 + 328);
    v37 = *(_QWORD *)(v0 + 320);
    v36 = *(_QWORD *)(v0 + 312);
    v38 = *(_QWORD *)(v0 + 352);
    v20 = swift_slowAlloc();
    v42 = swift_slowAlloc();
    v46 = v42;
    *(_DWORD *)v20 = 136446722;
    type = v11;
    sub_23B6882C8(&qword_256A3EB18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v21 = sub_23B691CC4();
    *(_QWORD *)(v0 + 160) = sub_23B683014(v21, v22, &v46);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v23(v13, v14);
    *(_WORD *)(v20 + 12) = 2080;
    StateCaptureHint.reason.getter(v19);
    sub_23B6882C8(&qword_256A3EC18, (uint64_t (*)(uint64_t))type metadata accessor for StateCaptureReason, (uint64_t)&protocol conformance descriptor for StateCaptureReason);
    v24 = sub_23B691CC4();
    v26 = v25;
    (*(void (**)(_DWORD *, uint64_t))(v37 + 8))(v19, v36);
    *(_QWORD *)(v0 + 168) = sub_23B683014(v24, v26, &v46);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v27 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v27(v17, v39);
    *(_WORD *)(v20 + 22) = 2080;
    v28 = StateCaptureHint.requestor.getter();
    if (v29)
    {
      v30 = v29;
    }
    else
    {
      v28 = 1701736302;
      v30 = 0xE400000000000000;
    }
    *(_QWORD *)(v0 + 176) = sub_23B683014(v28, v30, &v46);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v27(v38, v39);
    _os_log_impl(&dword_23B67E000, v10, type, "Running state capture %{public}s: reason: %s requestor: %s", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B86A58C](v42, -1, -1);
    MEMORY[0x23B86A58C](v20, -1, -1);
  }
  else
  {
    v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v23(v13, v14);
    v31 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v31(v17, v18);
    v31(v16, v18);
  }

  *(_QWORD *)(v0 + 528) = v23;
  v32 = *(_QWORD *)(v0 + 232);
  v33 = *(int **)(v0 + 200);
  *(_DWORD *)(v0 + 48) = *(_DWORD *)(v0 + 552);
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 216);
  *(_BYTE *)(v0 + 72) = v32;
  *(_DWORD *)(v0 + 76) = HIDWORD(v32);
  v45 = (uint64_t (*)(uint64_t, uint64_t))((char *)v33 + *v33);
  v34 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 536) = v34;
  *v34 = v0;
  v34[1] = sub_23B68D3CC;
  return v45(v0 + 16, v0 + 48);
}

uint64_t sub_23B68D3CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 544) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B68D430()
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
  void (*isa)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  os_log_type_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_t log;
  NSObject *loga;
  os_log_type_t type[8];
  os_log_type_t typea;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v1 = *(_QWORD *)(v0 + 472);
  v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  v50 = *(_QWORD *)(v0 + 480);
  *(_QWORD *)type = *(_QWORD *)(v0 + 464);
  v52 = *(_QWORD *)(v0 + 456);
  v2 = *(_QWORD *)(v0 + 416);
  v42 = *(_QWORD *)(v0 + 512);
  log = *(os_log_t *)(v0 + 424);
  v3 = *(_QWORD *)(v0 + 400);
  v4 = *(_QWORD *)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 304);
  v7 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 288);
  v8 = *(_QWORD *)(v0 + 184);
  v56 = *(_QWORD *)(v0 + 24);
  v57 = *(_QWORD *)(v0 + 16);
  v54 = *(_QWORD *)(v0 + 40);
  v55 = *(_QWORD *)(v0 + 32);
  sub_23B691C4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v42, v7);
  v48(v3, v8, v4);
  isa = (void (*)(_QWORD, _QWORD, _QWORD))log[2].isa;
  isa(*(_QWORD *)type, v50, v2);
  isa(v52, v1, v2);
  v10 = sub_23B6919E8();
  v11 = sub_23B691B5C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    loga = v10;
    v13 = *(_QWORD *)(v0 + 456);
    v43 = *(_QWORD *)(v0 + 424);
    v38 = *(_QWORD *)(v0 + 416);
    v39 = *(_QWORD *)(v0 + 464);
    typea = v11;
    v14 = *(_QWORD *)(v0 + 400);
    v15 = *(_QWORD *)(v0 + 368);
    v49 = *(_QWORD *)(v0 + 288);
    v16 = *(_QWORD *)(v0 + 272);
    v51 = *(_QWORD *)(v0 + 280);
    v53 = *(_QWORD *)(v0 + 304);
    v37 = *(_QWORD *)(v0 + 264);
    v40 = *(_QWORD *)(v0 + 256);
    v17 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v58 = v41;
    *(_DWORD *)v17 = 136446466;
    sub_23B6882C8(&qword_256A3EB18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v18 = sub_23B691CC4();
    *(_QWORD *)(v0 + 144) = sub_23B683014(v18, v19, &v58);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v12(v14, v15);
    *(_WORD *)(v17 + 12) = 2080;
    sub_23B691DB4();
    sub_23B6882C8(&qword_256A3EA48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    v20 = sub_23B691D9C();
    v22 = v21;
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v16, v40);
    *(_QWORD *)(v0 + 152) = sub_23B683014(v20, v22, &v58);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v23(v39, v38);
    v23(v13, v38);
    _os_log_impl(&dword_23B67E000, loga, typea, "State capture duration: %{public}s: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86A58C](v41, -1, -1);
    MEMORY[0x23B86A58C](v17, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v53, v51);
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 456);
    v25 = *(_QWORD *)(v0 + 464);
    v26 = *(_QWORD *)(v0 + 416);
    v27 = *(_QWORD *)(v0 + 424);
    v28 = *(_QWORD *)(v0 + 304);
    v29 = *(_QWORD *)(v0 + 280);
    v30 = *(_QWORD *)(v0 + 288);
    (*(void (**)(_QWORD, _QWORD))(v0 + 528))(*(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 368));
    v23 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v23(v25, v26);
    v23(v24, v26);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
  }
  *(_QWORD *)(v0 + 80) = v57;
  *(_QWORD *)(v0 + 88) = v56;
  *(_QWORD *)(v0 + 96) = v55;
  *(_QWORD *)(v0 + 104) = v54;
  sub_23B68E708(v57, v56, v55, v54);
  sub_23B691910();
  sub_23B691B98();
  sub_23B68E6D0(v57, v56, v55, v54);
  v32 = *(_QWORD *)(v0 + 496);
  v31 = *(_QWORD *)(v0 + 504);
  v34 = *(_QWORD *)(v0 + 480);
  v33 = *(_QWORD *)(v0 + 488);
  v35 = *(_QWORD *)(v0 + 416);
  v23(*(_QWORD *)(v0 + 472), v35);
  v23(v34, v35);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_23B68D918()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(os_log_t, uint64_t, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  os_log_t log;
  os_log_t loga;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;

  v1 = *(_QWORD *)(v0 + 544);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 520))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 368));
  MEMORY[0x23B86A46C](v1);
  MEMORY[0x23B86A46C](v1);
  v2 = sub_23B6919E8();
  v3 = sub_23B691B44();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(void **)(v0 + 544);
    v55 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
    v5 = *(_QWORD *)(v0 + 384);
    v6 = *(_QWORD *)(v0 + 368);
    v7 = swift_slowAlloc();
    v58 = (_QWORD *)swift_slowAlloc();
    v61 = swift_slowAlloc();
    v64 = v61;
    *(_DWORD *)v7 = 136446466;
    sub_23B6882C8(&qword_256A3EB18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v8 = sub_23B691CC4();
    *(_QWORD *)(v0 + 120) = sub_23B683014(v8, v9, &v64);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v55(v5, v6);
    *(_WORD *)(v7 + 12) = 2112;
    MEMORY[0x23B86A46C](v4);
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 128) = v10;
    sub_23B691BB0();
    *v58 = v10;

    _os_log_impl(&dword_23B67E000, v2, v3, "Error from StateCapture handler %{public}s: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A3EC10);
    swift_arrayDestroy();
    MEMORY[0x23B86A58C](v58, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B86A58C](v61, -1, -1);
    MEMORY[0x23B86A58C](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 544);
    (*(void (**)(_QWORD, _QWORD))(v0 + 528))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 368));

  }
  v49 = *(_QWORD *)(v0 + 512);
  v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  v59 = *(_QWORD *)(v0 + 480);
  v12 = *(_QWORD *)(v0 + 448);
  log = *(os_log_t *)(v0 + 440);
  v62 = *(NSObject **)(v0 + 432);
  v13 = *(_QWORD *)(v0 + 416);
  v51 = *(_QWORD *)(v0 + 424);
  v14 = *(_QWORD *)(v0 + 392);
  v15 = *(_QWORD *)(v0 + 368);
  v16 = *(_QWORD *)(v0 + 288);
  v17 = *(_QWORD *)(v0 + 296);
  v18 = *(_QWORD *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 184);
  sub_23B691C4C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v17, v49, v18);
  v56(v14, v19, v15);
  v20 = *(void (**)(os_log_t, uint64_t, uint64_t))(v51 + 16);
  v20(log, v59, v13);
  v20(v62, v12, v13);
  v21 = sub_23B6919E8();
  v22 = sub_23B691B5C();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  v60 = *(_QWORD *)(v0 + 440);
  v63 = *(_QWORD *)(v0 + 432);
  v25 = *(_QWORD *)(v0 + 416);
  v57 = *(_QWORD *)(v0 + 424);
  v26 = *(_QWORD *)(v0 + 392);
  v27 = *(_QWORD *)(v0 + 368);
  v29 = *(_QWORD *)(v0 + 288);
  v28 = *(_QWORD *)(v0 + 296);
  v30 = *(_QWORD *)(v0 + 280);
  if (v23)
  {
    loga = *(os_log_t *)(v0 + 280);
    v31 = *(_QWORD *)(v0 + 272);
    v46 = *(_QWORD *)(v0 + 264);
    v47 = *(_QWORD *)(v0 + 256);
    v52 = *(_QWORD *)(v0 + 296);
    v32 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v64 = v48;
    *(_DWORD *)v32 = 136446466;
    v50 = v29;
    sub_23B6882C8(&qword_256A3EB18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v33 = sub_23B691CC4();
    *(_QWORD *)(v0 + 136) = sub_23B683014(v33, v34, &v64);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v24(v26, v27);
    *(_WORD *)(v32 + 12) = 2080;
    sub_23B691DB4();
    sub_23B6882C8(&qword_256A3EA48, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    v35 = sub_23B691D9C();
    v37 = v36;
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v31, v47);
    *(_QWORD *)(v0 + 112) = sub_23B683014(v35, v37, &v64);
    sub_23B691BB0();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v38(v60, v25);
    v38(v63, v25);
    _os_log_impl(&dword_23B67E000, v21, v22, "State capture duration: %{public}s: %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86A58C](v48, -1, -1);
    MEMORY[0x23B86A58C](v32, -1, -1);

    (*(void (**)(uint64_t, os_log_t))(v50 + 8))(v52, loga);
  }
  else
  {
    v24(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 368));
    v38 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v38(v60, v25);
    v38(v63, v25);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  }
  v39 = *(void **)(v0 + 544);
  sub_23B691B98();

  v41 = *(_QWORD *)(v0 + 496);
  v40 = *(_QWORD *)(v0 + 504);
  v43 = *(_QWORD *)(v0 + 480);
  v42 = *(_QWORD *)(v0 + 488);
  v44 = *(_QWORD *)(v0 + 416);
  v38(*(_QWORD *)(v0 + 448), v44);
  v38(v43, v44);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t StateCapture.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  ValueMetadata *v15;
  uint64_t v17;

  v1 = v0;
  if (qword_256A3E998 != -1)
    swift_once();
  v2 = sub_23B691A00();
  __swift_project_value_buffer(v2, (uint64_t)qword_256A3EAB0);
  swift_retain_n();
  v3 = sub_23B6919E8();
  v4 = sub_23B691B38();
  v5 = 0x256A3E000uLL;
  if (os_log_type_enabled(v3, v4))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v17 = v7;
    *(_DWORD *)v6 = 136446466;
    sub_23B6919DC();
    sub_23B6882C8(&qword_256A3EB18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v8 = sub_23B691CC4();
    sub_23B683014(v8, v9, &v17);
    sub_23B691BB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    type metadata accessor for StateCaptureHandle();
    sub_23B6882C8(&qword_256A3EB20, (uint64_t (*)(uint64_t))type metadata accessor for StateCaptureHandle, (uint64_t)&protocol conformance descriptor for StateCaptureHandle);
    v10 = sub_23B691CC4();
    sub_23B683014(v10, v11, &v17);
    v5 = 0x256A3E000;
    sub_23B691BB0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B67E000, v3, v4, "Removing handler: %{public}s %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86A58C](v7, -1, -1);
    MEMORY[0x23B86A58C](v6, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v12 = v0 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_handle;
  os_state_remove_handler(_:)();
  v13 = v1 + *(_QWORD *)(v5 + 3264);
  v14 = sub_23B6919DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);

  v15 = type metadata accessor for StateCaptureHandle();
  (*((void (**)(uint64_t, ValueMetadata *))v15[-1].Description + 1))(v12, v15);
  return v1;
}

uint64_t StateCapture.__deallocating_deinit()
{
  StateCapture.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_23B68E2A0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC12FindMyCommon12StateCapture_id;
  v4 = sub_23B6919DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_23B68E2E8()
{
  uint64_t v0;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_256A3EAC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A3EAC8);
  return sub_23B6919F4();
}

uint64_t sub_23B68E364()
{
  return sub_23B6882C8(&qword_256A3EB28, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_23B68E390()
{
  return type metadata accessor for StateCapture();
}

uint64_t type metadata accessor for StateCapture()
{
  uint64_t result;

  result = qword_256A3EB58;
  if (!qword_256A3EB58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B68E3D4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23B6919DC();
  if (v1 <= 0x3F)
  {
    result = (uint64_t)type metadata accessor for StateCaptureHandle();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for StateCapture()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StateCapture.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_23B68E47C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  ValueMetadata *v4;
  _QWORD *Description;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;

  v9 = sub_23B6919DC();
  v1 = *(_QWORD *)(v9 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = type metadata accessor for StateCaptureHint();
  Description = v4[-1].Description;
  v6 = (v2 + v3 + *((unsigned __int8 *)Description + 80)) & ~(unint64_t)*((unsigned __int8 *)Description + 80);
  v7 = (((((((Description[8] + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v1 + 8))(v0 + v2, v9);
  ((void (*)(unint64_t, ValueMetadata *))Description[1])(v0 + v6, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23B68E594(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *Description;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = *(_QWORD *)(sub_23B6919DC() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  Description = type metadata accessor for StateCaptureHint()[-1].Description;
  v7 = (v4 + v5 + *((unsigned __int8 *)Description + 80)) & ~(unint64_t)*((unsigned __int8 *)Description + 80);
  v8 = (Description[8] + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v1 + 24);
  v18 = *(_QWORD *)(v1 + 16);
  v16 = v1 + v7;
  v10 = (uint64_t *)(v1 + v8);
  v11 = *v10;
  v12 = v10[1];
  v13 = *(_DWORD *)(v1 + v9);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23B684FF4;
  return sub_23B68CDA8(a1, v18, v17, v1 + v4, v16, v11, v12, v13);
}

uint64_t sub_23B68E6D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return sub_23B68B55C(a3, a4);
  }
  return result;
}

uint64_t sub_23B68E708(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return sub_23B68B518(a3, a4);
  }
  return result;
}

ValueMetadata *type metadata accessor for Analytics()
{
  return &type metadata for Analytics;
}

uint64_t destroy for Analytics.Mode(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = *(unsigned __int8 *)(a1 + 41);
  if (v1 >= 3)
    v1 = *(_DWORD *)a1 + 3;
  if (!v1)
  {
    v2 = *(unsigned __int8 *)(a1 + 40);
    if (v2 >= 4)
      v2 = *(_DWORD *)a1 + 4;
    if (v2)
      return __swift_destroy_boxed_opaque_existential_0Tm(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for Analytics.Mode(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  char v4;
  int v5;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = *(unsigned __int8 *)(a2 + 41);
  if (v3 >= 3)
    v3 = *(_DWORD *)a2 + 3;
  if (v3 == 2)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v4 = 2;
  }
  else if (v3 == 1)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v4 = 1;
  }
  else
  {
    v5 = *(unsigned __int8 *)(a2 + 40);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *(_BYTE *)a1 = *(_BYTE *)a2;
          break;
        case 1:
          v7 = *(_OWORD *)(a2 + 24);
          *(_OWORD *)(a1 + 24) = v7;
          (**(void (***)(uint64_t))(v7 - 8))(a1);
          v6 = 1;
          break;
        case 2:
          v8 = *(_OWORD *)(a2 + 24);
          *(_OWORD *)(a1 + 24) = v8;
          (**(void (***)(uint64_t))(v8 - 8))(a1);
          v6 = 2;
          break;
        case 3:
          v9 = *(_OWORD *)(a2 + 24);
          *(_OWORD *)(a1 + 24) = v9;
          (**(void (***)(uint64_t))(v9 - 8))(a1);
          v6 = 3;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    v4 = 0;
    *(_BYTE *)(a1 + 40) = v6;
  }
  *(_BYTE *)(a1 + 41) = v4;
  return a1;
}

uint64_t assignWithCopy for Analytics.Mode(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  char v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 41);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (!v4)
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      if (v5 >= 4)
        v5 = *(_DWORD *)a1 + 4;
      if (v5)
        __swift_destroy_boxed_opaque_existential_0Tm(a1);
    }
    v6 = *(unsigned __int8 *)(a2 + 41);
    if (v6 >= 3)
      v6 = *(_DWORD *)a2 + 3;
    if (v6 == 2)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = 2;
    }
    else if (v6 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = 1;
    }
    else
    {
      v8 = *(unsigned __int8 *)(a2 + 40);
      while (2)
      {
        switch(v8)
        {
          case 0:
            v9 = 0;
            *(_BYTE *)a1 = *(_BYTE *)a2;
            break;
          case 1:
            v10 = *(_QWORD *)(a2 + 24);
            *(_QWORD *)(a1 + 24) = v10;
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
            (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1, a2);
            v9 = 1;
            break;
          case 2:
            v11 = *(_QWORD *)(a2 + 24);
            *(_QWORD *)(a1 + 24) = v11;
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
            (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
            v9 = 2;
            break;
          case 3:
            v12 = *(_QWORD *)(a2 + 24);
            *(_QWORD *)(a1 + 24) = v12;
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
            (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1, a2);
            v9 = 3;
            break;
          default:
            v8 = *(_DWORD *)a2 + 4;
            continue;
        }
        break;
      }
      v7 = 0;
      *(_BYTE *)(a1 + 40) = v9;
    }
    *(_BYTE *)(a1 + 41) = v7;
  }
  return a1;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Analytics.Mode(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  char v7;
  int v8;
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 41);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (!v4)
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      if (v5 >= 4)
        v5 = *(_DWORD *)a1 + 4;
      if (v5)
        __swift_destroy_boxed_opaque_existential_0Tm(a1);
    }
    v6 = *(unsigned __int8 *)(a2 + 41);
    if (v6 >= 3)
      v6 = *(_DWORD *)a2 + 3;
    if (v6 == 2)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = 2;
    }
    else if (v6 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = 1;
    }
    else
    {
      v8 = *(unsigned __int8 *)(a2 + 40);
      while (2)
      {
        switch(v8)
        {
          case 0:
            v9 = 0;
            *(_BYTE *)a1 = *(_BYTE *)a2;
            break;
          case 1:
            v10 = *(_OWORD *)(a2 + 16);
            *(_OWORD *)a1 = *(_OWORD *)a2;
            *(_OWORD *)(a1 + 16) = v10;
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
            v9 = 1;
            break;
          case 2:
            v11 = *(_OWORD *)(a2 + 16);
            *(_OWORD *)a1 = *(_OWORD *)a2;
            *(_OWORD *)(a1 + 16) = v11;
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
            v9 = 2;
            break;
          case 3:
            v12 = *(_OWORD *)(a2 + 16);
            *(_OWORD *)a1 = *(_OWORD *)a2;
            *(_OWORD *)(a1 + 16) = v12;
            *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
            v9 = 3;
            break;
          default:
            v8 = *(_DWORD *)a2 + 4;
            continue;
        }
        break;
      }
      v7 = 0;
      *(_BYTE *)(a1 + 40) = v9;
    }
    *(_BYTE *)(a1 + 41) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Analytics.Mode(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 42))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 41);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Analytics.Mode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 26) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 42) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 42) = 0;
    if (a2)
      *(_BYTE *)(result + 41) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B68EBE8(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 41);
  if (result >= 3)
    return (*(_DWORD *)a1 + 3);
  return result;
}

uint64_t sub_23B68EC04(uint64_t result, unsigned int a2)
{
  if (a2 > 2)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 41) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Analytics.Mode()
{
  return &type metadata for Analytics.Mode;
}

uint64_t destroy for Analytics.DiscreteType(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 4)
    v1 = *(_DWORD *)a1 + 4;
  if (v1)
    return __swift_destroy_boxed_opaque_existential_0Tm(a1);
  return a1;
}

uint64_t initializeWithCopy for Analytics.DiscreteType(uint64_t a1, uint64_t a2)
{
  int v3;
  char v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(unsigned __int8 *)(a2 + 40);
  while (2)
  {
    switch(v3)
    {
      case 0:
        v4 = 0;
        *(_BYTE *)a1 = *(_BYTE *)a2;
        break;
      case 1:
        v7 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v7;
        (**(void (***)(uint64_t))(v7 - 8))(a1);
        v4 = 1;
        break;
      case 2:
        v5 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v5;
        (**(void (***)(uint64_t))(v5 - 8))(a1);
        v4 = 2;
        break;
      case 3:
        v6 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v6;
        (**(void (***)(uint64_t))(v6 - 8))(a1);
        v4 = 3;
        break;
      default:
        v3 = *(_DWORD *)a2 + 4;
        continue;
    }
    break;
  }
  *(_BYTE *)(a1 + 40) = v4;
  return a1;
}

uint64_t assignWithCopy for Analytics.DiscreteType(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 4)
      v4 = *(_DWORD *)a1 + 4;
    if (v4)
      __swift_destroy_boxed_opaque_existential_0Tm(a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *(_BYTE *)a1 = *(_BYTE *)a2;
          break;
        case 1:
          v7 = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 24) = v7;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
          v6 = 1;
          break;
        case 2:
          v8 = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 24) = v8;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1, a2);
          v6 = 2;
          break;
        case 3:
          v9 = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(a1 + 24) = v9;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
          v6 = 3;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    *(_BYTE *)(a1 + 40) = v6;
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Analytics.DiscreteType(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 4)
      v4 = *(_DWORD *)a1 + 4;
    if (v4)
      __swift_destroy_boxed_opaque_existential_0Tm(a1);
    v5 = *(unsigned __int8 *)(a2 + 40);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *(_BYTE *)a1 = *(_BYTE *)a2;
          break;
        case 1:
          v7 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v7;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          v6 = 1;
          break;
        case 2:
          v8 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v8;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          v6 = 2;
          break;
        case 3:
          v9 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v9;
          *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
          v6 = 3;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    *(_BYTE *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for Analytics.DiscreteType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 4)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Analytics.DiscreteType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B68EFA8(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_23B68EFC4(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Analytics.DiscreteType()
{
  return &type metadata for Analytics.DiscreteType;
}

uint64_t storeEnumTagSinglePayload for Analytics.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B68F03C + 4 * byte_23B692A48[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B68F05C + 4 * byte_23B692A4D[v4]))();
}

_BYTE *sub_23B68F03C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B68F05C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B68F064(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B68F06C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B68F074(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B68F07C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Analytics.Error()
{
  return &type metadata for Analytics.Error;
}

unint64_t sub_23B68F09C()
{
  unint64_t result;

  result = qword_256A3EC20;
  if (!qword_256A3EC20)
  {
    result = MEMORY[0x23B86A508](&unk_23B692B18, &type metadata for Analytics.Error);
    atomic_store(result, (unint64_t *)&qword_256A3EC20);
  }
  return result;
}

uint64_t sub_23B68F0E0()
{
  sub_23B691D60();
  sub_23B691D6C();
  return sub_23B691D84();
}

uint64_t sub_23B68F120()
{
  return sub_23B691D6C();
}

uint64_t sub_23B68F144()
{
  sub_23B691D60();
  sub_23B691D6C();
  return sub_23B691D84();
}

uint64_t sub_23B68F180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23B691B08();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B691AFC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23B685604(a1, &qword_2542FFC10);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B691AF0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23B68F2CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_2542FFBE8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2542FFBE8);
  if (qword_2542FFC08 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2542FFF90);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B68F35C()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(qword_2542FFC20);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_2542FFBE0 = result;
  return result;
}

uint64_t sub_23B68F390()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for ReferenceClock.IsolationDomain();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  qword_256A3EC28 = v0;
  return result;
}

uint64_t sub_23B68F3CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = sub_23B6919C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B6919AC();
  sub_23B691994();
  v5 = v4;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_2542FFBC0 = v5;
  return result;
}

double sub_23B68F458()
{
  double result;

  if (qword_2542FFBC8 != -1)
    swift_once();
  result = *(double *)&qword_2542FFBC0;
  qword_2542FFBD0 = qword_2542FFBC0;
  return result;
}

double static ReferenceClock.convert(toSystem:)(double a1)
{
  os_unfair_lock_s *v2;
  double v3;
  double v5;

  if (!TMIsAutomaticTimeEnabled()())
  {
    sub_23B680458();
    if (qword_2542FFBA8 != -1)
      swift_once();
    v2 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
    sub_23B690148(&v5);
    v3 = v5;
    os_unfair_lock_unlock(v2);
    return v3 + a1;
  }
  return a1;
}

double static ReferenceClock.convert(toReference:)(double a1)
{
  os_unfair_lock_s *v2;
  double v3;
  double v5;

  if (!TMIsAutomaticTimeEnabled()())
  {
    sub_23B680458();
    if (qword_2542FFBA8 != -1)
      swift_once();
    v2 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
    sub_23B690148(&v5);
    v3 = v5;
    os_unfair_lock_unlock(v2);
    return a1 - v3;
  }
  return a1;
}

uint64_t sub_23B68F5D0()
{
  return swift_task_switch();
}

uint64_t sub_23B68F5E4()
{
  if (qword_256A3E9A8 != -1)
    swift_once();
  return swift_task_switch();
}

uint64_t sub_23B68F644()
{
  uint64_t v0;

  sub_23B68F698(1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void static ReferenceClock.calibrate()()
{
  if (!sub_23B680458())
    sub_23B68F698(0);
}

void sub_23B68F698(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  os_unfair_lock_s *v6;
  int v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  double v28;
  double v29;
  double Current;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  double v34;
  os_unfair_lock_s *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49[4];

  v2 = sub_23B6919C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
    goto LABEL_5;
  if (qword_2542FFBA8 != -1)
    swift_once();
  v6 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
  sub_23B6902D8(v49);
  v7 = LOBYTE(v49[0]);
  os_unfair_lock_unlock(v6);
  if (v7 == 1)
  {
LABEL_5:
    sub_23B691934();
    if (v49[3])
    {
      if ((swift_dynamicCast() & 1) != 0 && v48 == 1)
      {
        if (TMIsAutomaticTimeEnabled()())
        {
          if (qword_2542FFBA8 != -1)
            swift_once();
          v8 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
          os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
          sub_23B68FFAC();
          os_unfair_lock_unlock(v8);
          if (qword_2542FFC00 != -1)
            swift_once();
          v9 = sub_23B691A00();
          __swift_project_value_buffer(v9, (uint64_t)qword_2542FFBE8);
          v10 = sub_23B6919E8();
          v11 = sub_23B691B5C();
          if (os_log_type_enabled(v10, v11))
          {
            v12 = (uint8_t *)swift_slowAlloc();
            v13 = swift_slowAlloc();
            v49[0] = v13;
            *(_DWORD *)v12 = 136446210;
            static ReferenceClock.timeInterval.getter();
            sub_23B691988();
            sub_23B690290();
            v14 = sub_23B691CC4();
            v15 = v3;
            v17 = v16;
            (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v2);
            v48 = sub_23B683014(v14, v17, v49);
            sub_23B691BB0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_23B67E000, v10, v11, "ReferenceClock calibrated: %{public}s delta: 0.0 uncertainty: 0.0", v12, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B86A58C](v13, -1, -1);
            MEMORY[0x23B86A58C](v12, -1, -1);
          }

        }
        else
        {
          if (qword_2542FFC00 != -1)
            swift_once();
          v18 = sub_23B691A00();
          __swift_project_value_buffer(v18, (uint64_t)qword_2542FFBE8);
          v19 = sub_23B6919E8();
          v20 = sub_23B691B5C();
          if (os_log_type_enabled(v19, v20))
          {
            v21 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_23B67E000, v19, v20, "Automatic time is DISABLED", v21, 2u);
            MEMORY[0x23B86A58C](v21, -1, -1);
          }

          *(double *)&v22 = COERCE_DOUBLE(sub_23B690204());
          if ((v24 & 0x100000000) == 0)
          {
            v25 = v22;
            v26 = *(_QWORD *)&v23;
            v27 = v24;
            v28 = *(double *)&v22;
            v29 = v23;
            Current = CFAbsoluteTimeGetCurrent();
            if (v29 > 1.0)
            {
              v31 = sub_23B6919E8();
              v32 = sub_23B691B44();
              if (os_log_type_enabled(v31, v32))
              {
                v33 = swift_slowAlloc();
                *(_DWORD *)v33 = 134218240;
                v49[0] = v26;
                sub_23B691BB0();
                *(_WORD *)(v33 + 12) = 1024;
                LODWORD(v49[0]) = v27;
                sub_23B691BB0();
                _os_log_impl(&dword_23B67E000, v31, v32, "TMGMReferenceTime reports high uncertainty: %f (reliability: %d", (uint8_t *)v33, 0x12u);
                MEMORY[0x23B86A58C](v33, -1, -1);
              }

            }
            v34 = Current - v28;
            if (qword_2542FFBA8 != -1)
              swift_once();
            v35 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
            os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
            qword_2542FFBB0 = *(_QWORD *)&v34;
            qword_2542FFCC8 = v26;
            if (qword_2542FFBD8 != -1)
              swift_once();
            qword_2542FFBD0 = v25;
            byte_2542FFCD0 = 0;
            os_unfair_lock_unlock(v35);
            v36 = sub_23B6919E8();
            v37 = sub_23B691B5C();
            if (os_log_type_enabled(v36, v37))
            {
              v38 = swift_slowAlloc();
              v39 = swift_slowAlloc();
              v49[0] = v39;
              *(_DWORD *)v38 = 136446722;
              static ReferenceClock.timeInterval.getter();
              sub_23B691988();
              sub_23B690290();
              v40 = sub_23B691CC4();
              v41 = v3;
              v43 = v42;
              (*(void (**)(char *, uint64_t))(v41 + 8))(v5, v2);
              v48 = sub_23B683014(v40, v43, v49);
              sub_23B691BB0();
              swift_bridgeObjectRelease();
              *(_WORD *)(v38 + 12) = 2048;
              v48 = *(_QWORD *)&v34;
              sub_23B691BB0();
              *(_WORD *)(v38 + 22) = 2048;
              v48 = v26;
              sub_23B691BB0();
              _os_log_impl(&dword_23B67E000, v36, v37, "ReferenceClock calibrated: %{public}s delta: %f uncertainty: %f", (uint8_t *)v38, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x23B86A58C](v39, -1, -1);
              MEMORY[0x23B86A58C](v38, -1, -1);
            }

          }
        }
        return;
      }
    }
    else
    {
      sub_23B685604((uint64_t)v49, &qword_256A3E9F0);
    }
    if (qword_2542FFC00 != -1)
      swift_once();
    v44 = sub_23B691A00();
    __swift_project_value_buffer(v44, (uint64_t)qword_2542FFBE8);
    v45 = sub_23B6919E8();
    v46 = sub_23B691B50();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_23B67E000, v45, v46, "Missing com.apple.timed entitlement!", v47, 2u);
      MEMORY[0x23B86A58C](v47, -1, -1);
    }

    sub_23B691C94();
    __break(1u);
  }
}

CFAbsoluteTime static ReferenceClock.calibrationAge.getter()
{
  os_unfair_lock_s *v0;
  double v1;
  double v2;
  _QWORD v4[2];

  sub_23B680458();
  if (qword_2542FFBA8 != -1)
    swift_once();
  v0 = (os_unfair_lock_s *)(qword_2542FFBE0 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2542FFBE0 + 16));
  sub_23B680650(v4);
  v1 = *(double *)v4;
  v2 = *(double *)&v4[1];
  os_unfair_lock_unlock(v0);
  return CFAbsoluteTimeGetCurrent() - v1 - v2;
}

uint64_t sub_23B68FEE0()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23B68FEFC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B68FF08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_23B69194C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_23B691940();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_23B68FFAC()
{
  qword_2542FFBB0 = 0;
  qword_2542FFCC8 = 0;
  if (qword_2542FFBD8 != -1)
    swift_once();
  qword_2542FFBD0 = CFAbsoluteTimeGetCurrent();
  byte_2542FFCD0 = 0;
}

uint64_t sub_23B690018()
{
  uint64_t v0;

  v0 = sub_23B691A00();
  __swift_allocate_value_buffer(v0, qword_2542FFF90);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542FFF90);
  return sub_23B6919F4();
}

uint64_t sub_23B690098(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B6900FC;
  return v6(a1);
}

uint64_t sub_23B6900FC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

double sub_23B690148@<D0>(_QWORD *a1@<X8>)
{
  double result;

  result = *(double *)&qword_2542FFBB0;
  *a1 = qword_2542FFBB0;
  return result;
}

uint64_t sub_23B690158()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B69017C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B684FF4;
  return swift_task_switch();
}

ValueMetadata *type metadata accessor for ReferenceClock()
{
  return &type metadata for ReferenceClock;
}

uint64_t type metadata accessor for ReferenceClock.IsolationDomain()
{
  return objc_opt_self();
}

uint64_t sub_23B690204()
{
  TMGetReferenceTime(_:_:_:)();
  return 0;
}

unint64_t sub_23B690290()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542FFBB8;
  if (!qword_2542FFBB8)
  {
    v1 = sub_23B6919C4();
    result = MEMORY[0x23B86A508](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_2542FFBB8);
  }
  return result;
}

void sub_23B6902D8(_BYTE *a1@<X8>)
{
  *a1 = byte_2542FFCD0;
}

uint64_t sub_23B6902E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B69030C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B684FF4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A3EC40 + dword_256A3EC40))(a1, v4);
}

void sub_23B69037C()
{
  sub_23B68F698(0);
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

uint64_t SANDBOX_NAMED.getter()
{
  return 1;
}

void sandbox_init_with_parameters(_:_:_:_:)()
{
  sub_23B691C94();
  __break(1u);
}

__n128 __swift_memcpy66_1(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_23B690420(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 66))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23B690440(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
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
  *(_BYTE *)(result + 66) = v3;
  return result;
}

void type metadata accessor for aks_device_state_s(uint64_t a1)
{
  sub_23B6904A8(a1, &qword_256A3EC58);
}

void type metadata accessor for keybag_lock_state_t(uint64_t a1)
{
  sub_23B6904A8(a1, &qword_256A3EC60);
}

void sub_23B6904A8(uint64_t a1, unint64_t *a2)
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

NonModularSPI::StateCaptureHintAPI_optional __swiftcall StateCaptureHintAPI.init(rawValue:)(Swift::UInt32 rawValue)
{
  _BYTE *v1;
  unsigned int v2;

  v2 = 0x2010003u >> (8 * rawValue);
  if (rawValue >= 4)
    LOBYTE(v2) = 3;
  *v1 = v2;
  return (NonModularSPI::StateCaptureHintAPI_optional)rawValue;
}

NonModularSPI::StateCaptureHintAPI_optional sub_23B69074C(Swift::UInt32 *a1)
{
  return StateCaptureHintAPI.init(rawValue:)(*a1);
}

void sub_23B690794()
{
  dword_256A3EC68 = 15;
}

uint64_t sub_23B690B54()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x75626F746F72702ELL;
  if (*v0 != 1)
    v1 = 0x6D6F747375632ELL;
  if (*v0)
    return v1;
  else
    return 0x696C61697265732ELL;
}

void StateCaptureStateData.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *StateCaptureStateData.init(type:title:data:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = *result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t StateCaptureStateData.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  sub_23B691C28();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  swift_bridgeObjectRetain();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  sub_23B68B518(v1, v2);
  sub_23B691970();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B68B55C(v1, v2);
  sub_23B691A9C();
  return 0x203A657079745BLL;
}

unint64_t StateCaptureHandle.description.getter()
{
  sub_23B691C28();
  swift_bridgeObjectRelease();
  sub_23B691328();
  sub_23B691AC0();
  sub_23B691A9C();
  swift_bridgeObjectRelease();
  sub_23B691A9C();
  return 0xD000000000000017;
}

void os_state_add_handler(queue:block:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v9[4] = sub_23B691390;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23B6912D8;
  v9[3] = &block_descriptor_1;
  v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  v8 = os_state_add_handler();
  _Block_release(v7);
  *(_QWORD *)a3 = v8;
  *(_BYTE *)(a3 + 8) = v8 == 0;
}

uint64_t sub_23B690F44(int *a1, void (*a2)(_QWORD *__return_ptr, int *))
{
  int v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v4 = *a1;
  v5 = *((_QWORD *)a1 + 1);
  v7 = a1[4];
  v6 = a1[5];
  if (v5)
  {
    v5 = sub_23B691AA8();
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v10 = 0x2010002u >> (8 * v7);
  v19 = v4;
  v20 = v5;
  v21 = v9;
  if (v7 >= 4)
    LOBYTE(v10) = 2;
  v22 = v10;
  v23 = v6;
  a2(v24, &v19);
  swift_bridgeObjectRelease();
  v11 = v25;
  if (!v25)
    return 0;
  v12 = v24[0];
  v13 = v24[1];
  v14 = v26;
  v15 = v27;
  sub_23B69102C();
  v17 = v16;
  sub_23B69185C(v12, v13, v11, v14, v15);
  return v17;
}

void sub_23B69102C()
{
  __asm { BR              X10 }
}

void sub_23B691074()
{
  uint64_t v0;
  int v1;
  _DWORD *v3;

  if (!__OFADD__(BYTE6(v0), 200))
  {
    v3 = calloc(BYTE6(v0) + 200, 1uLL);
    if (v3)
    {
      *v3 = v1 + 1;
      __asm { BR              X10 }
    }
    sub_23B691C94();
    __break(1u);
    JUMPOUT(0x23B691224);
  }
  __break(1u);
  JUMPOUT(0x23B6911B8);
}

uint64_t sub_23B6912D8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t os_state_remove_handler(_:)()
{
  return os_state_remove_handler();
}

unint64_t sub_23B691328()
{
  unint64_t result;

  result = qword_256A3EC70;
  if (!qword_256A3EC70)
  {
    result = MEMORY[0x23B86A508](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_256A3EC70);
  }
  return result;
}

uint64_t sub_23B69136C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B691390(int *a1)
{
  uint64_t v1;

  return sub_23B690F44(a1, *(void (**)(_QWORD *__return_ptr, int *))(v1 + 16));
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

unint64_t sub_23B6913B4()
{
  unint64_t result;

  result = qword_256A3EC78;
  if (!qword_256A3EC78)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureHintAPI, &type metadata for StateCaptureHintAPI);
    atomic_store(result, (unint64_t *)&qword_256A3EC78);
  }
  return result;
}

unint64_t sub_23B6913FC()
{
  unint64_t result;

  result = qword_256A3EC80;
  if (!qword_256A3EC80)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EC80);
  }
  return result;
}

unint64_t sub_23B691444()
{
  unint64_t result;

  result = qword_256A3EC88;
  if (!qword_256A3EC88)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EC88);
  }
  return result;
}

unint64_t sub_23B69148C()
{
  unint64_t result;

  result = qword_256A3EC90;
  if (!qword_256A3EC90)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EC90);
  }
  return result;
}

unint64_t sub_23B6914D4()
{
  unint64_t result;

  result = qword_256A3EC98;
  if (!qword_256A3EC98)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureReason, &type metadata for StateCaptureReason);
    atomic_store(result, (unint64_t *)&qword_256A3EC98);
  }
  return result;
}

unint64_t sub_23B69151C()
{
  unint64_t result;

  result = qword_256A3ECA0;
  if (!qword_256A3ECA0)
  {
    result = MEMORY[0x23B86A508](&protocol conformance descriptor for StateCaptureDateType, &type metadata for StateCaptureDateType);
    atomic_store(result, (unint64_t *)&qword_256A3ECA0);
  }
  return result;
}

uint64_t _s13NonModularSPI19StateCaptureHintAPIOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B6915E4 + 4 * byte_23B692C85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B691618 + 4 * byte_23B692C80[v4]))();
}

uint64_t sub_23B691618(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B691620(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B691628);
  return result;
}

uint64_t sub_23B691634(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B69163CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B691640(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B691648(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t initializeWithCopy for StateCaptureStateData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_23B68B518(v4, v5);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for StateCaptureStateData(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  sub_23B68B518(v5, v4);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v4;
  sub_23B68B55C(v6, v7);
  return a1;
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

uint64_t assignWithTake for StateCaptureStateData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  sub_23B68B55C(v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for StateCaptureHandle()
{
  return &type metadata for StateCaptureHandle;
}

uint64_t sub_23B69185C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    return sub_23B68B55C(a4, a5);
  }
  return result;
}

Swift::Bool __swiftcall TMIsAutomaticTimeEnabled()()
{
  return TMIsAutomaticTimeEnabled() != 0;
}

BOOL TMGetReferenceTime(_:_:_:)()
{
  return TMGetReferenceTime() != 0;
}

uint64_t sub_23B6918EC()
{
  return MEMORY[0x24BE31780]();
}

uint64_t sub_23B6918F8()
{
  return MEMORY[0x24BE31808]();
}

uint64_t sub_23B691904()
{
  return MEMORY[0x24BE318A8]();
}

uint64_t sub_23B691910()
{
  return MEMORY[0x24BE318B0]();
}

uint64_t sub_23B69191C()
{
  return MEMORY[0x24BE318B8]();
}

uint64_t sub_23B691928()
{
  return MEMORY[0x24BE31918]();
}

uint64_t sub_23B691934()
{
  return MEMORY[0x24BE319E0]();
}

uint64_t sub_23B691940()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23B69194C()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23B691958()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23B691964()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23B691970()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_23B69197C()
{
  return MEMORY[0x24BDCDDA8]();
}

uint64_t sub_23B691988()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_23B691994()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_23B6919A0()
{
  return MEMORY[0x24BE31A60]();
}

uint64_t sub_23B6919AC()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_23B6919B8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23B6919C4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23B6919D0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23B6919DC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23B6919E8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B6919F4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B691A00()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B691A0C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23B691A18()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23B691A24()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_23B691A30()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23B691A3C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23B691A48()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23B691A54()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23B691A60()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B691A6C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B691A78()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23B691A84()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23B691A90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23B691A9C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B691AA8()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23B691AB4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B691AC0()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_23B691ACC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_23B691AD8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_23B691AE4()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_23B691AF0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B691AFC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23B691B08()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23B691B14()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_23B691B20()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23B691B2C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23B691B38()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23B691B44()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B691B50()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23B691B5C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B691B68()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23B691B74()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23B691B80()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23B691B8C()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_23B691B98()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_23B691BA4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23B691BB0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B691BBC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B691BC8()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_23B691BD4()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_23B691BE0()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_23B691BEC()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_23B691BF8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23B691C04()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23B691C10()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23B691C1C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23B691C28()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B691C34()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B691C40()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B691C4C()
{
  return MEMORY[0x24BEE6D80]();
}

uint64_t sub_23B691C58()
{
  return MEMORY[0x24BEE6DC0]();
}

uint64_t sub_23B691C64()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23B691C70()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23B691C7C()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23B691C88()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B691C94()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B691CA0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23B691CAC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23B691CB8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B691CC4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B691CD0()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_23B691CDC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B691CE8()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_23B691CF4()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_23B691D00()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23B691D0C()
{
  return MEMORY[0x24BE31B08]();
}

uint64_t sub_23B691D18()
{
  return MEMORY[0x24BE31B10]();
}

uint64_t sub_23B691D24()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B691D30()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B691D3C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B691D48()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B691D54()
{
  return MEMORY[0x24BDD0758]();
}

uint64_t sub_23B691D60()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B691D6C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B691D78()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23B691D84()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23B691D90()
{
  return MEMORY[0x24BDD0810]();
}

uint64_t sub_23B691D9C()
{
  return MEMORY[0x24BE31B20]();
}

uint64_t sub_23B691DA8()
{
  return MEMORY[0x24BE31B28]();
}

uint64_t sub_23B691DB4()
{
  return MEMORY[0x24BDD0A18]();
}

uint64_t sub_23B691DC0()
{
  return MEMORY[0x24BDD0A50]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t TMGetReferenceTime()
{
  return MEMORY[0x24BE28998]();
}

uint64_t TMIsAutomaticTimeEnabled()
{
  return MEMORY[0x24BE289A0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

