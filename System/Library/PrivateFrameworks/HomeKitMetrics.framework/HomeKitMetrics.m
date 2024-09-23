void sub_1CD02BD5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD02BDDC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id MappedDisplayReasonRadarRequestFilter.__allocating_init(defaultRequestFilter:)(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason] = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v3[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id MappedDisplayReasonRadarRequestFilter.init(defaultRequestFilter:)(uint64_t a1)
{
  char *v1;
  objc_super v3;

  *(_QWORD *)&v1[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason] = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&v1[OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MappedDisplayReasonRadarRequestFilter();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for MappedDisplayReasonRadarRequestFilter()
{
  return objc_opt_self();
}

uint64_t sub_1CD02BF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v7 = (uint64_t *)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v7;
  *v7 = 0x8000000000000000;
  sub_1CD02C830(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *v7 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1CD02BFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v3 = v2;
  v6 = (uint64_t *)(v2 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  v7 = *v6;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_1CD02C4B8(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v10 = *(_QWORD *)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter);
    swift_unknownObjectRetain();
    return v10;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1CD02C0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v3 = v2;
  v6 = (uint64_t *)(v2 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  v7 = *v6;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_1CD02C4B8(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v10 = *(void **)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter);
    swift_unknownObjectRetain();
    goto LABEL_6;
  }
  v10 = *(void **)(*(_QWORD *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  v11 = (void *)sub_1CD041A08();
  v12 = objc_msgSend(v10, sel_shouldRequestRadarForDisplayReason_, v11);
  swift_unknownObjectRelease();

  return v12;
}

void sub_1CD02C250(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  void *v11;

  v3 = v2;
  v6 = (uint64_t *)(v2 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_filtersByDisplayReason);
  swift_beginAccess();
  v7 = *v6;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_1CD02C4B8(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v10 = *(void **)(v3 + OBJC_IVAR___HMMMappedDisplayReasonRadarRequestFilter_defaultRequestFilter);
    swift_unknownObjectRetain();
    goto LABEL_6;
  }
  v10 = *(void **)(*(_QWORD *)(v7 + 56) + 8 * v8);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  v11 = (void *)sub_1CD041A08();
  objc_msgSend(v10, sel_radarRequestedForDisplayReason_, v11);
  swift_unknownObjectRelease();

}

id MappedDisplayReasonRadarRequestFilter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MappedDisplayReasonRadarRequestFilter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MappedDisplayReasonRadarRequestFilter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MappedDisplayReasonRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1CD02C4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1CD041A68();
  sub_1CD041A20();
  v4 = sub_1CD041A74();
  return sub_1CD02C9F4(a1, a2, v4);
}

uint64_t sub_1CD02C51C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8B0CA8);
  v36 = a2;
  v6 = sub_1CD041A44();
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
      swift_unknownObjectRetain();
    }
    sub_1CD041A68();
    sub_1CD041A20();
    result = sub_1CD041A74();
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

uint64_t sub_1CD02C830(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CD02C4B8(a2, a3);
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
    sub_1CD02CAD4();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_unknownObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CD02C51C(v15, a4 & 1);
  v21 = sub_1CD02C4B8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CD041A5C();
  __break(1u);
  return result;
}

uint64_t method lookup function for MappedDisplayReasonRadarRequestFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.__allocating_init(defaultRequestFilter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.add(requestFilter:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.shouldRequestRadar(forDisplayReason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MappedDisplayReasonRadarRequestFilter.radarRequested(forDisplayReason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

unint64_t sub_1CD02C9F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1CD041A50() & 1) == 0)
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
      while (!v14 && (sub_1CD041A50() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1CD02CAD4()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8B0CA8);
  v2 = *v0;
  v3 = sub_1CD041A38();
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
    result = (void *)swift_unknownObjectRetain();
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17B7C08]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1CD02CCC8()
{
  return 1;
}

id PassThroughRadarRequestFilter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PassThroughRadarRequestFilter.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PassThroughRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PassThroughRadarRequestFilter()
{
  return objc_opt_self();
}

id PassThroughRadarRequestFilter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PassThroughRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PassThroughRadarRequestFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PassThroughRadarRequestFilter.shouldRequestRadar(forDisplayReason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of PassThroughRadarRequestFilter.radarRequested(forDisplayReason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.__allocating_init(lastRequestDateKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  MinimumTimeIntervalRadarRequestFilterPreferencesStorage.init(lastRequestDateKey:)(a1, a2);
  return v4;
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.init(lastRequestDateKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  void (*v16)(char *, char *, uint64_t);
  _OWORD v18[2];
  _BYTE v19[24];
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8B0C80);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CD0419FC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v11 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v12 = objc_msgSend(v11, sel_standardUserDefaults);
  v13 = (void *)sub_1CD041A08();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_objectForKey_, v13);

  if (v14)
  {
    sub_1CD041A2C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_1CD02D078((uint64_t)v18, (uint64_t)v19);
  if (!v20)
  {
    sub_1CD02D0C0((uint64_t)v19, &qword_1ED8B0CB8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_8;
  }
  v15 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, v15 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_8:
    sub_1CD0419CC();
    sub_1CD02D0C0((uint64_t)v6, (uint64_t *)&unk_1ED8B0C80);
    v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    goto LABEL_9;
  }
  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v10, v6, v7);
LABEL_9:
  v16((char *)(v2+ OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate), v10, v7);
  return v2;
}

uint64_t sub_1CD02D078(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8B0CB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CD02D0C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1CD02D128@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  v4 = sub_1CD0419FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_1CD02D190(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  sub_1CD0419FC();
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return sub_1CD02D274((uint64_t)v3);
}

uint64_t sub_1CD02D210@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  v4 = sub_1CD0419FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1CD02D274(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  uint64_t v14;

  v2 = v1;
  v4 = sub_1CD0419FC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v2 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(v8, a1, v4);
  swift_endAccess();
  v9 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v10 = (void *)sub_1CD0419E4();
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v7, v4);
  v12 = (void *)sub_1CD041A08();
  objc_msgSend(v9, sel_setObject_forKey_, v10, v12);

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1, v4);
}

void (*sub_1CD02D3B4(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = sub_1CD0419FC();
  v3[4] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[5] = v5;
  v6 = malloc(*(_QWORD *)(v5 + 64));
  v7 = OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  v3[6] = v6;
  v3[7] = v7;
  swift_beginAccess();
  return sub_1CD02D438;
}

void sub_1CD02D438(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) != 0)
  {
    v4 = (void *)v3[6];
  }
  else
  {
    v4 = (void *)v3[6];
    v5 = v3[4];
    v6 = v3[5];
    v7 = v3[3] + v3[7];
    v8 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    (*(void (**)(void *, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    v9 = (void *)sub_1CD0419E4();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
    v10 = (void *)sub_1CD041A08();
    objc_msgSend(v8, sel_setObject_forKey_, v9, v10);

  }
  free(v4);
  free(v3);
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  v2 = sub_1CD0419FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t MinimumTimeIntervalRadarRequestFilterPreferencesStorage.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  v2 = sub_1CD0419FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1CD02D5C4@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC14HomeKitMetrics55MinimumTimeIntervalRadarRequestFilterPreferencesStorage_lastRequestDate;
  swift_beginAccess();
  v4 = sub_1CD0419FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1CD02D62C(uint64_t a1)
{
  return sub_1CD02D274(a1);
}

void (*sub_1CD02D64C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1CD02D3B4(v2);
  return sub_1CD02D694;
}

void sub_1CD02D694(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

double MinimumTimeIntervalRadarRequestFilter.minimumRequestInterval.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval);
}

uint64_t sub_1CD02D6D0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  __int128 v5[2];

  sub_1CD02D78C(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_1CD02D850(v5, v3);
  return swift_endAccess();
}

uint64_t sub_1CD02D73C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  return sub_1CD02D78C(v3, a1);
}

uint64_t sub_1CD02D78C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CD02D7D0(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_1CD02D850(a1, v3);
  return swift_endAccess();
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

uint64_t sub_1CD02D850(__int128 *a1, uint64_t a2)
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

uint64_t (*sub_1CD02D868())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t MinimumTimeIntervalRadarRequestFilter.dateFactory.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory);
  swift_retain();
  return v1;
}

uint64_t MinimumTimeIntervalRadarRequestFilter.__allocating_init(minimumRequestInterval:lastRequestDatePreferencesKey:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];

  v4 = v3;
  v8 = type metadata accessor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage();
  v9 = swift_allocObject();
  MinimumTimeIntervalRadarRequestFilterPreferencesStorage.init(lastRequestDateKey:)(a1, a2);
  v11[3] = v8;
  v11[4] = &protocol witness table for MinimumTimeIntervalRadarRequestFilterPreferencesStorage;
  v11[0] = v9;
  return (*(uint64_t (**)(_QWORD *, uint64_t (*)(), _QWORD, double))(v4 + 128))(v11, sub_1CD02D9C8, 0, a3);
}

uint64_t type metadata accessor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage()
{
  uint64_t result;

  result = qword_1ED8B0C90;
  if (!qword_1ED8B0C90)
    return swift_getSingletonMetadata();
  return result;
}

id MinimumTimeIntervalRadarRequestFilter.__allocating_init(minimumRequestInterval:filterStorage:dateFactory:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  id v11;
  objc_super v13;

  v9 = (char *)objc_allocWithZone(v4);
  *(double *)&v9[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval] = a4;
  sub_1CD02D78C(a1, (uint64_t)&v9[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage]);
  v10 = &v9[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory];
  *(_QWORD *)v10 = a2;
  *((_QWORD *)v10 + 1) = a3;
  v13.receiver = v9;
  v13.super_class = v4;
  v11 = objc_msgSendSuper2(&v13, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v11;
}

id MinimumTimeIntervalRadarRequestFilter.init(minimumRequestInterval:filterStorage:dateFactory:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  char *v4;
  char *v8;
  id v9;
  objc_super v11;

  *(double *)&v4[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval] = a4;
  sub_1CD02D78C(a1, (uint64_t)&v4[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage]);
  v8 = &v4[OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for MinimumTimeIntervalRadarRequestFilter();
  v9 = objc_msgSendSuper2(&v11, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

uint64_t type metadata accessor for MinimumTimeIntervalRadarRequestFilter()
{
  return objc_opt_self();
}

uint64_t sub_1CD02DB50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = sub_1CD0419FC();
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v0
                                  + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory))(v2);
  v5 = v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  v6 = *(_QWORD *)(v5 + 24);
  v7 = *(_QWORD *)(v5 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v4, v6, v7);
  return swift_endAccess();
}

id MinimumTimeIntervalRadarRequestFilter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MinimumTimeIntervalRadarRequestFilter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MinimumTimeIntervalRadarRequestFilter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MinimumTimeIntervalRadarRequestFilter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_1CD02DDE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void (*v15)(_BYTE *, uint64_t);
  _BYTE v17[24];
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_1CD0419FC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = &v17[-v8];
  (*(void (**)(uint64_t))(v0
                                  + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_dateFactory))(v7);
  v10 = v0 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  sub_1CD02D78C(v10, (uint64_t)v18);
  v11 = v19;
  v12 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_1CD0419D8();
  v14 = v13;
  v15 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
  v15(v6, v2);
  v15(v9, v2);
  return *(double *)(v1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_minimumRequestInterval) <= v14;
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

uint64_t sub_1CD02DF5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC14HomeKitMetrics37MinimumTimeIntervalRadarRequestFilter_filterStorage;
  swift_beginAccess();
  return sub_1CD02D78C(v3, a2);
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterStorage.lastRequestDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterStorage.lastRequestDate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterStorage.lastRequestDate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_1CD02DFCC()
{
  return type metadata accessor for MinimumTimeIntervalRadarRequestFilterPreferencesStorage();
}

uint64_t sub_1CD02DFD4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CD0419FC();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MinimumTimeIntervalRadarRequestFilterPreferencesStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.__allocating_init(lastRequestDateKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.lastRequestDate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.lastRequestDate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilterPreferencesStorage.lastRequestDate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t method lookup function for MinimumTimeIntervalRadarRequestFilter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.filterStorage.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.filterStorage.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.filterStorage.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.__allocating_init(minimumRequestInterval:filterStorage:dateFactory:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.shouldRequestRadar(forDisplayReason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MinimumTimeIntervalRadarRequestFilter.radarRequested(forDisplayReason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1CD02F274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1CD02F954(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMMLogEventEndDateAfterStartDate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "compare:", v1) == -1)
  {
    v3 = (void *)MEMORY[0x1D17B78FC]();
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v5;
      v10 = 2114;
      v11 = v2;
      v12 = 2114;
      v13 = v1;
      _os_log_impl(&dword_1CD029000, v4, OS_LOG_TYPE_ERROR, "%{public}@Log event end date %{public}@ is before start date %{public}@", (uint8_t *)&v8, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v6 = v1;

    v2 = v6;
  }

  return v2;
}

id HMMSafeHomeUUIDFromLogEvent(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "homeUUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1CD03033C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0310DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD031720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

id HMDTaggedLoggingCreateDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  size_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id *v16;
  id v17;
  void *v18;
  size_t v19;
  char *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v22[0] = 0;
  v10 = 8 * a1;
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v11, v10);
  MEMORY[0x1E0C80A78](v12);
  bzero(v11, v10);
  v22[0] = &a9;
  v13 = 0;
  if (a1)
  {
    v14 = a1;
    do
    {
      --v14;
      v15 = (id *)v22[0];
      v22[0] += 8;
      objc_storeStrong((id *)&v11[8 * v13], *v15);
      v16 = (id *)v22[0];
      v22[0] += 8;
      v17 = *v16;
      objc_storeStrong((id *)&v11[8 * v13], *v16);
      if (v17)
        ++v13;
    }
    while (v14);
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v11, v11, v13);
  if (a1)
  {
    v19 = v10;
    do
    {

      v19 -= 8;
    }
    while (v19);
    v20 = v11 - 8;
    do
    {

      v10 -= 8;
    }
    while (v10);
  }
  return v18;
}

void sub_1CD03239C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CD032418(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0326D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0327E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD032914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD032A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD032BAC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD032C38(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD032CA4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD032E24(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD032ED8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD032F5C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__466(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__467(uint64_t a1)
{

}

void sub_1CD033E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD0343EC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD034B14(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD034DE0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD035584(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD03565C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD035708(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD035B6C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CD035BE8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD035F4C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036030(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0360B8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0361B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD0362C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD036410(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036648(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD036A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD036B8C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036C18(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036C84(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036E04(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036EFC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD036FEC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__777(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__778(uint64_t a1)
{

}

void sub_1CD038430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CD0389F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD038B94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t HMMDispatchQueueName(void *a1, void *a2)
{
  void *v3;
  __CFString *v4;
  id v5;
  objc_class *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = a1;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v8 = CFSTR(".");
  else
    v8 = &stru_1E898A970;
  if (v4)
    v9 = v4;
  else
    v9 = &stru_1E898A970;
  v10 = objc_msgSend(v5, "hash");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.HomeKitMetrics.%@%@%@.%tu"), v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = objc_msgSend(v12, "UTF8String");

  return v13;
}

void sub_1CD03A72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1172(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1173(uint64_t a1)
{

}

void HMMLogTagWithError(void *a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0D28540];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = a1;
  objc_msgSend(v7, "currentTagProcessorList");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  _HMMLogTagActivityWithError(v11, v10, v9, v8, 0, 0, v12);

}

void _HMMLogTagActivityWithError(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  HMMTaggedEvent *v22;
  void *v23;
  id v24;
  __CFString *v25;
  NSObject *v26;
  _BOOL4 v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMMTaggedEvent *v35;
  uint64_t v36;
  void *v37;
  HMMTaggedEvent *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  HMMTaggedEvent *v48;
  HMMTaggedEvent *v49;
  void *v50;
  id v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  HMMTaggedEvent *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  NSObject *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  HMMTaggedEvent *v75;
  void *v76;
  void *v77;
  void *v78;
  HMMTaggedEvent *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  HMMTaggedEvent *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  HMMTaggedEvent *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  __CFString *v111;
  void *v112;
  HMMTaggedEvent *v113;
  id v114;
  id v115;
  void *v116;
  id v117;
  id v118;
  void *v119;
  void *v120;
  uint8_t buf[4];
  void *v122;
  __int16 v123;
  id v124;
  __int16 v125;
  id v126;
  __int16 v127;
  const __CFString *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  const __CFString *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  const __CFString *v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  const __CFString *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  __CFString *v144;
  __int16 v145;
  id v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v119 = v13;
  v120 = v14;
  if (v14)
  {
    objc_msgSend(v14, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v18;
    v118 = v15;
    v116 = v20;
    if (v20
      && (objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CB3388]), (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = (HMMTaggedEvent *)v21;
      v23 = (void *)MEMORY[0x1D17B78FC]();
      v24 = v119;
      HMFGetOSLogHandle();
      v25 = v17;
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      v110 = v16;
      v111 = v25;
      v114 = v19;
      if (v25)
      {
        v28 = 0x1E0CB3000;
        if (v27)
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "domain");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTaggedEvent domain](v22, "domain");
          v112 = v23;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMTaggedEvent code](v22, "code"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138546434;
          v122 = v29;
          v123 = 2114;
          v124 = v118;
          v125 = 2112;
          v126 = v16;
          v127 = 2114;
          v128 = CFSTR("errorDomain");
          v129 = 2112;
          v130 = v30;
          v131 = 2114;
          v132 = CFSTR("errorCode");
          v133 = 2112;
          v134 = v31;
          v135 = 2114;
          v136 = CFSTR("underlyingErrorDomain");
          v137 = 2112;
          v138 = v32;
          v139 = 2114;
          v140 = CFSTR("underlyingErrorCode");
          v141 = 2112;
          v142 = v33;
          v143 = 2114;
          v144 = v111;
          v145 = 2112;
          v146 = v18;
          _os_log_impl(&dword_1CD029000, v26, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x84u);

          v23 = v112;
          v28 = 0x1E0CB3000uLL;
        }

        objc_autoreleasePoolPop(v23);
        +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v22;
        v35 = [HMMTaggedEvent alloc];
        objc_msgSend(v120, "domain");
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v28 + 2024), "numberWithInteger:", objc_msgSend(v120, "code"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTaggedEvent domain](v113, "domain");
        v38 = (HMMTaggedEvent *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v28 + 2024), "numberWithInteger:", -[HMMTaggedEvent code](v113, "code"));
        v17 = v111;
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)v36;
        HMDTaggedLoggingCreateDictionary(5, v40, v41, v42, v43, v44, v45, v46, (uint64_t)CFSTR("errorDomain"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v118;
        v48 = -[HMMTaggedEvent initWithTag:data:](v35, "initWithTag:data:", v118, v47);
        v19 = v114;
        objc_msgSend(v34, "submitTaggedEvent:processorList:", v48, v114);

        v16 = v110;
        v49 = v113;
        goto LABEL_22;
      }
      if (v27)
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "domain");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTaggedEvent domain](v22, "domain");
        v91 = v23;
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMTaggedEvent code](v22, "code"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138545922;
        v122 = v88;
        v123 = 2114;
        v124 = v118;
        v125 = 2112;
        v126 = v16;
        v127 = 2114;
        v128 = CFSTR("errorDomain");
        v129 = 2112;
        v130 = v89;
        v131 = 2114;
        v132 = CFSTR("errorCode");
        v133 = 2112;
        v134 = v90;
        v135 = 2114;
        v136 = CFSTR("underlyingErrorDomain");
        v137 = 2112;
        v138 = v92;
        v139 = 2114;
        v140 = CFSTR("underlyingErrorCode");
        v141 = 2112;
        v142 = v93;
        _os_log_impl(&dword_1CD029000, v26, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x70u);

        v23 = v91;
      }

      objc_autoreleasePoolPop(v23);
      +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = [HMMTaggedEvent alloc];
      objc_msgSend(v120, "domain");
      v96 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v120, "code"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTaggedEvent domain](v22, "domain");
      v38 = (HMMTaggedEvent *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMMTaggedEvent code](v22, "code"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)v96;
      HMDTaggedLoggingCreateDictionary(4, v97, v98, v99, v100, v101, v102, v103, (uint64_t)CFSTR("errorDomain"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = -[HMMTaggedEvent initWithTag:data:](v95, "initWithTag:data:", v118, v104);
      v106 = v22;
      v107 = (void *)v105;
      v34 = v94;
      objc_msgSend(v94, "submitTaggedEvent:processorList:", v105, v114);

      v49 = v106;
      v19 = v114;

      v15 = v118;
      v17 = 0;
    }
    else
    {
      v50 = (void *)MEMORY[0x1D17B78FC]();
      v51 = v13;
      HMFGetOSLogHandle();
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
      if (v17)
      {
        if (v53)
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "domain");
          v115 = v19;
          v55 = v17;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545410;
          v122 = v54;
          v123 = 2114;
          v124 = v118;
          v125 = 2112;
          v126 = v16;
          v127 = 2114;
          v128 = CFSTR("errorDomain");
          v129 = 2112;
          v130 = v56;
          v131 = 2114;
          v132 = CFSTR("errorCode");
          v133 = 2112;
          v134 = v57;
          v135 = 2114;
          v136 = v55;
          v137 = 2112;
          v138 = v117;
          _os_log_impl(&dword_1CD029000, v52, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x5Cu);

          v17 = (__CFString *)v55;
          v19 = v115;

        }
        objc_autoreleasePoolPop(v50);
        +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
        v49 = (HMMTaggedEvent *)objc_claimAutoreleasedReturnValue();
        v58 = [HMMTaggedEvent alloc];
        objc_msgSend(v14, "domain");
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
        v18 = v117;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)v59;
        HMDTaggedLoggingCreateDictionary(3, v60, v61, v62, v63, v64, v65, v66, (uint64_t)CFSTR("errorDomain"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v118;
        v38 = -[HMMTaggedEvent initWithTag:data:](v58, "initWithTag:data:", v118, v37);
        -[HMMTaggedEvent submitTaggedEvent:processorList:](v49, "submitTaggedEvent:processorList:", v38, v19);
        goto LABEL_22;
      }
      if (v53)
      {
        HMFGetLogIdentifier();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "domain");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v122 = v76;
        v123 = 2114;
        v124 = v118;
        v125 = 2112;
        v126 = v16;
        v127 = 2114;
        v128 = CFSTR("errorDomain");
        v129 = 2112;
        v130 = v77;
        v131 = 2114;
        v132 = CFSTR("errorCode");
        v133 = 2112;
        v134 = v78;
        _os_log_impl(&dword_1CD029000, v52, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\"", buf, 0x48u);

        v17 = 0;
      }

      objc_autoreleasePoolPop(v50);
      +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
      v49 = (HMMTaggedEvent *)objc_claimAutoreleasedReturnValue();
      v79 = [HMMTaggedEvent alloc];
      objc_msgSend(v14, "domain");
      v80 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "code"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v80;
      HMDTaggedLoggingCreateDictionary(2, v81, v82, v83, v84, v85, v86, v87, (uint64_t)CFSTR("errorDomain"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v118;
      v38 = -[HMMTaggedEvent initWithTag:data:](v79, "initWithTag:data:", v118, v37);
      -[HMMTaggedEvent submitTaggedEvent:processorList:](v49, "submitTaggedEvent:processorList:", v38, v19);
    }
    v18 = v117;
LABEL_22:

    v74 = v116;
    goto LABEL_23;
  }
  v67 = (void *)MEMORY[0x1D17B78FC]();
  v68 = v13;
  HMFGetOSLogHandle();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v70 = v18;
    v71 = v19;
    v72 = v16;
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v122 = v73;
    v123 = 2114;
    v124 = v15;
    v125 = 2112;
    v126 = v72;
    _os_log_impl(&dword_1CD029000, v69, OS_LOG_TYPE_ERROR, "%{public}@tag=\"%{public}@\" desc=\"%@\"", buf, 0x20u);

    v16 = v72;
    v19 = v71;
    v18 = v70;
  }

  objc_autoreleasePoolPop(v67);
  +[HMMTagManager sharedInstance](HMMTagManager, "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = [HMMTaggedEvent alloc];
  v49 = -[HMMTaggedEvent initWithTag:data:](v75, "initWithTag:data:", v15, MEMORY[0x1E0C9AA70]);
  objc_msgSend(v74, "submitTaggedEvent:processorList:", v49, v19);
LABEL_23:

}

void HMMLogTagActivityWithError(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = a1;
  objc_msgSend(a5, "tagProcessorList");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  _HMMLogTagActivityWithError(v12, v11, v10, v9, 0, 0, v13);

}

void HMMLogTagWithErrorAndField(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v11 = (void *)MEMORY[0x1E0D28540];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = a2;
  v17 = a1;
  objc_msgSend(v11, "currentTagProcessorList");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  _HMMLogTagActivityWithError(v17, v16, v15, v14, v13, v12, v18);

}

void HMMLogTagActivityWithErrorAndField(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = a2;
  v18 = a1;
  objc_msgSend(a7, "tagProcessorList");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  _HMMLogTagActivityWithError(v18, v17, v16, v15, v14, v13, v19);

}

void sub_1CD03F9A8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD03FA44(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD03FC74(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD040084(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD04035C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD040620(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0408F8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD040B20(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD040D44(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD040F58(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD040FD4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD041048(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1CD0412D4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1CD0419CC()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1CD0419D8()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1CD0419E4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CD0419F0()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1CD0419FC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CD041A08()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CD041A14()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CD041A20()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CD041A2C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CD041A38()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CD041A44()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CD041A50()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CD041A5C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CD041A68()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CD041A74()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1E0D27E08]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1E0D27FD0]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1E0D27FD8]();
}

uint64_t HMFUptime()
{
  return MEMORY[0x1E0D28530]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1E0D28700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
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

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

