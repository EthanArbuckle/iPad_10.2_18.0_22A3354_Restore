ValueMetadata *type metadata accessor for EngagementPropertyConfiguration()
{
  return &type metadata for EngagementPropertyConfiguration;
}

uint64_t destroy for EngagementPropertyConfiguration()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for StatePropertyValue()
{
  return &type metadata for StatePropertyValue;
}

uint64_t sub_1BBFCDBB8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_1BBFCFAF0(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1BBFCDBC4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1BBFCDCD0(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
        return sub_1BBFD4F74(a1, v16[7] + 16 * v10);
      return sub_1BBFD0B98(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1BBFD4B78();
      goto LABEL_7;
    }
    sub_1BBFCDDDC(v13, a3 & 1);
    v18 = sub_1BBFCDCD0(a2);
    if ((v14 & 1) == (v19 & 1))
    {
      v10 = v18;
      v16 = *v4;
      if ((v14 & 1) != 0)
        return sub_1BBFD4F74(a1, v16[7] + 16 * v10);
      return sub_1BBFD0B98(v10, a2, a1, v16);
    }
  }
  result = sub_1BBFD553C();
  __break(1u);
  return result;
}

unint64_t sub_1BBFCDCD0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BBFD5578();
  return sub_1BBFCDD00(a1, v2);
}

unint64_t sub_1BBFCDD00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_1BBFCDD9C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBFCDDDC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  _BYTE v32[16];

  v3 = v2;
  v5 = *v2;
  sub_1BBFD0B34();
  result = sub_1BBFD5500();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = v3;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_34;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_34;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v31;
                goto LABEL_41;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v30;
              v3 = v31;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_43;
                if (v8 >= v13)
                  goto LABEL_34;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
      v22 = *(_QWORD *)(v5 + 56) + 16 * v17;
      if ((a2 & 1) != 0)
        sub_1BBFCE350(v22, (uint64_t)v32);
      else
        sub_1BBFD0E28(v22, (uint64_t)v32);
      result = sub_1BBFD5578();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v21;
      result = sub_1BBFCE350((uint64_t)v32, *(_QWORD *)(v7 + 56) + 16 * v15);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v7;
  return result;
}

uint64_t sub_1BBFCE098()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BBFD529C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1BBFCE100()
{
  unint64_t result;

  result = qword_1ED699690;
  if (!qword_1ED699690)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED699690);
  }
  return result;
}

uint64_t sub_1BBFCE13C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBFCE180()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BBFD529C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1BBFCE214(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  BOOL v5;
  char v6;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v3 = v2;
  if (*a1)
    v5 = 0;
  else
    v5 = a1[1] == 1;
  if (v5)
  {
    sub_1BBFD4EE4((uint64_t)a1, (uint64_t (*)(_QWORD))sub_1BBFD4F20);
    v8 = sub_1BBFCDCD0(a2);
    if ((v9 & 1) != 0)
    {
      v10 = v8;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v12 = *v2;
      v14 = *v3;
      *v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_1BBFD4B78();
        v12 = v14;
      }
      sub_1BBFCE350(*(_QWORD *)(v12 + 56) + 16 * v10, (uint64_t)&v15);
      sub_1BBFD46B0(v10, v12);
      *v3 = v12;
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = xmmword_1BBFD5A30;
    }
    return sub_1BBFD4EE4((uint64_t)&v15, (uint64_t (*)(_QWORD))sub_1BBFD4F20);
  }
  else
  {
    sub_1BBFCE350((uint64_t)a1, (uint64_t)&v15);
    v6 = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_1BBFCDBC4((uint64_t)&v15, a2, v6);
    *v2 = v13;
    return swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for BaseDonor()
{
  return objc_opt_self();
}

uint64_t sub_1BBFCE350(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
  return a2;
}

uint64_t *sub_1BBFCE388(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7[2];
  uint64_t v8;

  v4 = *result;
  if (*result)
  {
    swift_beginAccess();
    result = (uint64_t *)swift_weakLoadStrong();
    if (result)
    {
      v7[1] = a4;
      v8 = v4;
      v7[0] = a3;
      sub_1BBFCED9C((uint64_t)&v8, v7);
      return (uint64_t *)swift_release();
    }
  }
  return result;
}

_QWORD *sub_1BBFCE408(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_1BBFD0D04(0, &qword_1ED699318, (uint64_t (*)(uint64_t))sub_1BBFD0E78, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1BBFD0BFC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BBFCE53C()
{
  uint64_t v0;

  v0 = sub_1BBFD535C();
  __swift_allocate_value_buffer(v0, qword_1ED6996A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED6996A8);
  if (qword_1ED699498 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_1BBFD5350();
}

_QWORD *BaseDonor.init(type:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  sub_1BBFD52E4();
  MEMORY[0x1E0C80A78]();
  v2[5] = MEMORY[0x1E0DEE9E0];
  sub_1BBFD52D8();
  sub_1BBFD52FC();
  swift_allocObject();
  v2[6] = sub_1BBFD52F0();
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = MEMORY[0x1E0DEE9D8];
  return v2;
}

void sub_1BBFCE6A0()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    v2 = sub_1BBFD53E0();
    v4 = v3;

  }
  else
  {
    v4 = 0x80000001BBFD5CB0;
    v2 = 0xD00000000000001DLL;
  }
  qword_1ED699488 = v2;
  unk_1ED699490 = v4;
}

uint64_t EngagementPropertyConfiguration.eventName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EngagementCollector.register(donor:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD **v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  _QWORD *v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34[3];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (qword_1ED699680 != -1)
    swift_once();
  v4 = sub_1BBFD535C();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED6996A8);
  sub_1BBFCEB1C((uint64_t)a1, (uint64_t)&v35);
  v5 = sub_1BBFD5344();
  v6 = sub_1BBFD5404();
  v7 = os_log_type_enabled(v5, v6);
  v38 = v2;
  if (v7)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v34[0] = v33;
    *(_DWORD *)v8 = 136315138;
    v10 = v36;
    v9 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, v36);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v9);
    sub_1BBFCFE34(v11, v12, v34);
    sub_1BBFD5488();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v35);
    _os_log_impl(&dword_1BBFCC000, v5, v6, "EngagementCollector registering new donor: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE7720](v33, -1, -1);
    MEMORY[0x1BCCE7720](v8, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v35);
  }

  v13 = (_QWORD **)(v1 + 24);
  swift_beginAccess();
  v14 = *(_QWORD *)(v1 + 24);
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    v16 = (_QWORD *)(v14 + 32);
    swift_bridgeObjectRetain();
    while (1)
    {
      v17 = v16[3];
      v18 = v16[4];
      __swift_project_boxed_opaque_existential_1(v16, v17);
      v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
      v21 = v20;
      v22 = a1[3];
      v23 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v22);
      if (v19 == (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v22, v23) && v21 == v24)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_22;
      }
      v26 = sub_1BBFD5530();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
        break;
      v16 += 5;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        v13 = (_QWORD **)(v1 + 24);
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
LABEL_22:
    sub_1BBFD1E60();
    swift_allocError();
    *v32 = xmmword_1BBFD5A30;
    return swift_willThrow();
  }
  else
  {
LABEL_15:
    sub_1BBFCEB1C((uint64_t)a1, (uint64_t)&v35);
    swift_beginAccess();
    v27 = *v13;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v13 = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v27 = sub_1BBFCE408(0, v27[2] + 1, 1, v27);
      *v13 = v27;
    }
    v30 = v27[2];
    v29 = v27[3];
    if (v30 >= v29 >> 1)
    {
      v27 = sub_1BBFCE408((_QWORD *)(v29 > 1), v30 + 1, 1, v27);
      *v13 = v27;
    }
    v27[2] = v30 + 1;
    sub_1BBFD0E60(&v35, (uint64_t)&v27[5 * v30 + 4]);
    return swift_endAccess();
  }
}

uint64_t sub_1BBFCEB1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *EngagementDataManager.init(config:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v18 = a1;
  v3 = sub_1BBFD52E4();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1BBFD544C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BBFD5398();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1BBFD5440();
  MEMORY[0x1E0C80A78](v9);
  v10 = type metadata accessor for EngagementCollector();
  v11 = swift_allocObject();
  sub_1BBFCE100();
  sub_1BBFD5434();
  sub_1BBFD538C();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF8D0], v4);
  v12 = sub_1BBFD5464();
  v13 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v11 + 16) = v12;
  *(_QWORD *)(v11 + 24) = v13;
  v2[5] = v10;
  v2[6] = &protocol witness table for EngagementCollector;
  v2[2] = v11;
  sub_1BBFD52D8();
  sub_1BBFD52FC();
  swift_allocObject();
  v14 = sub_1BBFD52F0();
  v15 = MEMORY[0x1E0DEE9E0];
  v2[7] = v14;
  v2[8] = v15;
  sub_1BBFD0F4C(v18, (uint64_t)v2 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig);
  return v2;
}

_QWORD *initializeBufferWithCopyOfBuffer for EngagementPropertyConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void sub_1BBFCED9C(uint64_t a1, uint64_t *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  id v28[3];

  v28[2] = *(id *)MEMORY[0x1E0C80C00];
  v3 = *a2;
  v2 = a2[1];
  v4 = qword_1ED699680;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v5 = sub_1BBFD535C();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED6996A8);
  swift_bridgeObjectRetain_n();
  v6 = sub_1BBFD5344();
  v7 = sub_1BBFD541C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (void *)swift_slowAlloc();
    v28[0] = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_1BBFCFE34(v3, v2, (uint64_t *)v28);
    sub_1BBFD5488();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBFCC000, v6, v7, "EngagementDataManager storing properties for: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE7720](v9, -1, -1);
    MEMORY[0x1BCCE7720](v8, -1, -1);

  }
  else
  {

    v10 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x1E0C80A78](v10);
  sub_1BBFD52FC();
  sub_1BBFD0618(0, &qword_1ED699480, (void (*)(uint64_t))sub_1BBFD0664);
  swift_retain();
  sub_1BBFD5338();
  swift_release();
  if (v28[0])
  {
    v11 = (void *)objc_opt_self();
    v12 = (void *)sub_1BBFD53C8();
    v28[0] = 0;
    v13 = objc_msgSend(v11, sel_dataWithJSONObject_options_error_, v12, 0, v28);

    v14 = v28[0];
    if (v13)
    {
      swift_bridgeObjectRelease();
      v15 = (void *)sub_1BBFD52B4();
      v17 = v16;

      v28[0] = v15;
      v28[1] = v17;
      sub_1BBFD5320();
      swift_release();
      sub_1BBFD1108((uint64_t)v15, (unint64_t)v17);
    }
    else
    {
      v22 = v14;
      v23 = sub_1BBFD5290();

      swift_willThrow();
      MEMORY[0x1BCCE7654](v23);
      swift_bridgeObjectRetain();
      v24 = sub_1BBFD5344();
      v25 = sub_1BBFD5410();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = (void *)swift_slowAlloc();
        v28[0] = v27;
        *(_DWORD *)v26 = 136315138;
        swift_bridgeObjectRetain();
        sub_1BBFCFE34(v3, v2, (uint64_t *)v28);
        sub_1BBFD5488();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1BBFCC000, v24, v25, "EngagementDataManager failed serializing value for: %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1BCCE7720](v27, -1, -1);
        MEMORY[0x1BCCE7720](v26, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_release();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    v18 = sub_1BBFD5344();
    v19 = sub_1BBFD5410();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = (void *)swift_slowAlloc();
      v28[0] = v21;
      *(_DWORD *)v20 = 136315138;
      swift_bridgeObjectRetain();
      sub_1BBFCFE34(v3, v2, (uint64_t *)v28);
      sub_1BBFD5488();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBFCC000, v18, v19, "EngagementDataManager no store found for: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE7720](v21, -1, -1);
      MEMORY[0x1BCCE7720](v20, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t EngagementDataManager.register(donor:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = type metadata accessor for EngagementDataManagerConfig();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v19[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1BBFCEB1C(v1 + 16, (uint64_t)v20);
  v7 = v21;
  v8 = v22;
  __swift_project_boxed_opaque_existential_1(v20, v21);
  v19[3] = type metadata accessor for BaseDonor();
  v19[4] = &protocol witness table for BaseDonor;
  v19[0] = a1;
  v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 16);
  swift_retain();
  v9(v19, v7, v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  if (!v2)
  {
    sub_1BBFD52C0();
    v19[1] = &off_1E749C678;
    swift_unknownObjectWeakInit();
    swift_beginAccess();
    sub_1BBFCE214(v19, v1);
    swift_endAccess();
    sub_1BBFD52CC();
    result = swift_beginAccess();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(v11 + 16);
    if (v12)
    {
      v13 = v1 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig;
      swift_bridgeObjectRetain();
      v14 = (unint64_t *)(v11 + 40);
      do
      {
        v15 = *(v14 - 1);
        v16 = *v14;
        sub_1BBFCF52C(v13, (uint64_t)v6);
        swift_bridgeObjectRetain();
        sub_1BBFD00F8(v15, v16, (uint64_t)v6);
        v17 = sub_1BBFD529C();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v6, v17);
        swift_bridgeObjectRelease();
        v14 += 2;
        --v12;
      }
      while (v12);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_1BBFCF52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EngagementDataManagerConfig();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t initializeWithCopy for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t type metadata accessor for EngagementDataManagerConfig()
{
  uint64_t result;

  result = qword_1ED699570;
  if (!qword_1ED699570)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BBFCF5F0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  void (*v28)(uint64_t *, uint64_t *(*)(uint64_t *), _QWORD *);
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36[2];
  uint64_t v37;
  _QWORD v38[2];
  char v39[8];
  _QWORD v40[2];

  v2 = v1;
  v3 = a1[1];
  v34 = *a1;
  sub_1BBFD52C0();
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v4 + 64);
  v32 = v4 + 64;
  v6 = 1 << *(_BYTE *)(v4 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v9 = (unint64_t)(v6 + 63) >> 6;
  v29 = v9 - 1;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  v33 = v9;
  v35 = result;
  v30 = result + 104;
  v31 = v9 - 5;
  if (v8)
    goto LABEL_24;
LABEL_6:
  v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
  }
  else
  {
    if (v12 >= v33)
    {
      v15 = v11;
    }
    else
    {
      v13 = *(_QWORD *)(v32 + 8 * v12);
      if (v13)
      {
LABEL_9:
        v8 = (v13 - 1) & v13;
        v14 = __clz(__rbit64(v13)) + (v12 << 6);
        v11 = v12;
        goto LABEL_25;
      }
      v15 = v11 + 1;
      if ((uint64_t)(v11 + 2) < v33)
      {
        v13 = *(_QWORD *)(v32 + 8 * (v11 + 2));
        if (v13)
        {
          v12 = v11 + 2;
          goto LABEL_9;
        }
        v15 = v11 + 2;
        if ((uint64_t)(v11 + 3) < v33)
        {
          v13 = *(_QWORD *)(v32 + 8 * (v11 + 3));
          if (v13)
          {
            v12 = v11 + 3;
            goto LABEL_9;
          }
          v12 = v11 + 4;
          v15 = v11 + 3;
          if ((uint64_t)(v11 + 4) < v33)
          {
            v13 = *(_QWORD *)(v32 + 8 * v12);
            if (v13)
              goto LABEL_9;
            while (v31 != v11)
            {
              v13 = *(_QWORD *)(v30 + 8 * v11++);
              if (v13)
              {
                v12 = v11 + 4;
                goto LABEL_9;
              }
            }
            v15 = v29;
          }
        }
      }
    }
    v8 = 0;
    v37 = 0;
    v38[0] = 0;
    v11 = v15;
    v38[1] = 1;
    while (1)
    {
      sub_1BBFCFA58((uint64_t)&v37, (uint64_t)v39);
      if (!v40[0] && v40[1] == 1)
        break;
      sub_1BBFCE350((uint64_t)v40, (uint64_t)&v37);
      if (MEMORY[0x1BCCE7780](&v37))
      {
        v19 = qword_1ED699680;
        swift_retain_n();
        if (v19 != -1)
          swift_once();
        v20 = sub_1BBFD535C();
        __swift_project_value_buffer(v20, (uint64_t)qword_1ED6996A8);
        swift_bridgeObjectRetain_n();
        v21 = sub_1BBFD5344();
        v22 = sub_1BBFD541C();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = swift_slowAlloc();
          v24 = swift_slowAlloc();
          v36[0] = v24;
          *(_DWORD *)v23 = 136315138;
          swift_bridgeObjectRetain();
          v25 = v34;
          *(_QWORD *)(v23 + 4) = sub_1BBFCFE34(v34, v3, v36);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1BBFCC000, v21, v22, "EngagementDataManager property did Change: %s", (uint8_t *)v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1BCCE7720](v24, -1, -1);
          MEMORY[0x1BCCE7720](v23, -1, -1);

        }
        else
        {
          swift_bridgeObjectRelease_n();

          v25 = v34;
        }
        v36[0] = v25;
        v36[1] = v3;
        v26 = swift_allocObject();
        swift_weakInit();
        v27 = (_QWORD *)swift_allocObject();
        v27[2] = v26;
        v27[3] = v25;
        v27[4] = v3;
        v28 = *(void (**)(uint64_t *, uint64_t *(*)(uint64_t *), _QWORD *))(*(_QWORD *)v2 + 192);
        swift_bridgeObjectRetain();
        swift_retain();
        v28(v36, sub_1BBFD1074, v27);
        swift_release();
        swift_release();
        swift_release();
        swift_unknownObjectRelease();
        sub_1BBFD0E04((uint64_t)&v37);
        result = swift_release();
        if (!v8)
          goto LABEL_6;
      }
      else
      {
        result = sub_1BBFD0E04((uint64_t)&v37);
        if (!v8)
          goto LABEL_6;
      }
LABEL_24:
      v16 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v16 | (v11 << 6);
LABEL_25:
      v17 = *(_QWORD *)(v35 + 56);
      v37 = *(_QWORD *)(*(_QWORD *)(v35 + 48) + 8 * v14);
      sub_1BBFD0E28(v17 + 16 * v14, (uint64_t)v38);
    }
    swift_release();
    return sub_1BBFD52CC();
  }
  return result;
}

uint64_t sub_1BBFCFA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BBFCFA9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1BBFCFA9C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED699358)
  {
    sub_1BBFD0D5C();
    v0 = sub_1BBFD547C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED699358);
  }
}

uint64_t sub_1BBFCFAF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;

  swift_beginAccess();
  v8 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    v9 = sub_1BBFCFCF0(a2, a3);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_retain();
    }
    else
    {
      v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  *a4 = v11;
  return swift_endAccess();
}

uint64_t sub_1BBFCFB94(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1BBFCFCF0(a2, a3);
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
    sub_1BBFD4D34();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
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
  sub_1BBFD06C8(v15, a4 & 1);
  v21 = sub_1BBFCFCF0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1BBFD553C();
  __break(1u);
  return result;
}

unint64_t sub_1BBFCFCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BBFD5584();
  sub_1BBFD53EC();
  v4 = sub_1BBFD5590();
  return sub_1BBFCFD54(a1, a2, v4);
}

unint64_t sub_1BBFCFD54(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1BBFD5530() & 1) == 0)
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
      while (!v14 && (sub_1BBFD5530() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1BBFCFE34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1BBFCFF40(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BBFCFF04((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1BBFCFF04((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1BBFCFF04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BBFCFF40(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BBFD5494();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1BBFD1EA4(a5, a6);
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
  v8 = sub_1BBFD54D0();
  if (!v8)
  {
    sub_1BBFD54DC();
    __break(1u);
LABEL_17:
    result = sub_1BBFD5518();
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

void sub_1BBFD00F8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v30[2];
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40[3];
  uint64_t v41;

  v4 = v3;
  v35 = a3;
  sub_1BBFD0618(0, &qword_1ED6996A0, (void (*)(uint64_t))MEMORY[0x1E0DF2258]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v30 - v8;
  v10 = sub_1BBFD529C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = *(_QWORD *)(v4 + 56);
  v37 = v4;
  v38 = a1;
  v36 = a1;
  v39 = a2;
  sub_1BBFD52FC();
  sub_1BBFD0618(0, &qword_1ED699480, (void (*)(uint64_t))sub_1BBFD0664);
  swift_retain();
  sub_1BBFD5338();
  swift_release();
  v14 = v40[0];
  swift_release();
  if (v14)
  {
    if (qword_1ED699680 != -1)
      swift_once();
    v15 = sub_1BBFD535C();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED6996A8);
    swift_bridgeObjectRetain_n();
    v16 = sub_1BBFD5344();
    v17 = sub_1BBFD541C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v40[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v41 = sub_1BBFCFE34(v36, a2, v40);
      sub_1BBFD5488();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBFCC000, v16, v17, "Already registered store for event: %s. Skipping.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE7720](v19, -1, -1);
      MEMORY[0x1BCCE7720](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v32 = v13;
    v33 = v11;
    v31 = v10;
    v20 = v35;
    v34 = v9;
    if (qword_1ED699680 != -1)
      swift_once();
    v21 = sub_1BBFD535C();
    __swift_project_value_buffer(v21, (uint64_t)qword_1ED6996A8);
    swift_bridgeObjectRetain_n();
    v22 = sub_1BBFD5344();
    v23 = sub_1BBFD541C();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v40[0] = v25;
      *(_DWORD *)v24 = 136315138;
      v30[1] = v24 + 4;
      swift_bridgeObjectRetain();
      v41 = sub_1BBFCFE34(v36, a2, v40);
      sub_1BBFD5488();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBFCC000, v22, v23, "Registering store for event: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE7720](v25, -1, -1);
      MEMORY[0x1BCCE7720](v24, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v26 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v32, v20, v31);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v26, 1, 1, v21);
    sub_1BBFD0664();
    swift_allocObject();
    swift_bridgeObjectRetain();
    v27 = v36;
    v28 = sub_1BBFD5314();
    sub_1BBFD52C0();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v41 = *(_QWORD *)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0x8000000000000000;
    sub_1BBFCFB94(v28, v27, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(v4 + 64) = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_1BBFD52CC();
    swift_release();
  }
}

void sub_1BBFD0618(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1BBFD547C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1BBFD0664()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED699478)
  {
    sub_1BBFD1080();
    sub_1BBFD10C4();
    v0 = sub_1BBFD532C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED699478);
  }
}

uint64_t sub_1BBFD06C8(uint64_t a1, char a2)
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
  sub_1BBFD09D8();
  v36 = a2;
  v6 = sub_1BBFD5500();
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
      swift_retain();
    }
    sub_1BBFD5584();
    sub_1BBFD53EC();
    result = sub_1BBFD5590();
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

void sub_1BBFD09D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED699698)
  {
    sub_1BBFD0664();
    v0 = sub_1BBFD550C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED699698);
  }
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t getEnumTagSinglePayload for BaseDonor.Observation(uint64_t a1, int a2)
{
  int v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000007) != 0)
    v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  else
    v2 = -1;
  return (v2 + 1);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void sub_1BBFD0B34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED699370)
  {
    v0 = sub_1BBFD550C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED699370);
  }
}

uint64_t sub_1BBFD0B98(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_1BBFCE350(a3, a4[7] + 16 * a1);
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_1BBFD0BFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_1BBFD0E78();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1BBFD5518();
  __break(1u);
  return result;
}

void sub_1BBFD0D04(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_1BBFD0D5C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED699310)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED699310);
  }
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of BaseDonor.propertyDidChange(propertyConfiguration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t initializeWithTake for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_1BBFD0E04(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1BBFD0E28(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
  return a2;
}

uint64_t sub_1BBFD0E60(__int128 *a1, uint64_t a2)
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

unint64_t sub_1BBFD0E78()
{
  unint64_t result;

  result = qword_1ED699320;
  if (!qword_1ED699320)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED699320);
  }
  return result;
}

NewsEngagementCollector::StatePropertyValue __swiftcall StatePropertyValue.init(_:)(NewsEngagementCollector::StatePropertyValue result)
{
  NewsEngagementCollector::StatePropertyValue *v1;

  v1->value._rawValue = result.value._rawValue;
  return result;
}

uint64_t StatePropertyValue.value.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of EngagementCollectorType.donors.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of EngagementCollectorManagerType.collector.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of EngagementCollectorManagerType.register(donor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for EngagementCollector()
{
  return objc_opt_self();
}

uint64_t sub_1BBFD0F24(_QWORD *a1)
{
  return EngagementCollector.register(donor:)(a1);
}

NewsEngagementCollector::EngagementPropertyConfiguration __swiftcall EngagementPropertyConfiguration.init(eventName:)(NewsEngagementCollector::EngagementPropertyConfiguration eventName)
{
  NewsEngagementCollector::EngagementPropertyConfiguration *v1;

  *v1 = eventName;
  return eventName;
}

uint64_t sub_1BBFD0F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EngagementDataManagerConfig();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t EngagementDataManagerConfig.init(localStorageDirectory:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

uint64_t type metadata accessor for EngagementDataManager()
{
  uint64_t result;

  result = qword_1ED6994A8;
  if (!qword_1ED6994A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BBFD1008@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *v1 + 16;
  swift_beginAccess();
  return sub_1BBFCEB1C(v3, a1);
}

uint64_t sub_1BBFD1054(uint64_t a1)
{
  return EngagementDataManager.register(donor:)(a1);
}

uint64_t *sub_1BBFD1074(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1BBFCE388(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_1BBFD1080()
{
  unint64_t result;

  result = qword_1ED699470;
  if (!qword_1ED699470)
  {
    result = MEMORY[0x1BCCE76A8](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED699470);
  }
  return result;
}

unint64_t sub_1BBFD10C4()
{
  unint64_t result;

  result = qword_1ED699468;
  if (!qword_1ED699468)
  {
    result = MEMORY[0x1BCCE76A8](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED699468);
  }
  return result;
}

uint64_t sub_1BBFD1108(uint64_t a1, unint64_t a2)
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

uint64_t EngagementPropertyConfiguration.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1BBFD53EC();
  return swift_bridgeObjectRelease();
}

uint64_t static EngagementPropertyConfiguration.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1BBFD5530();
}

uint64_t EngagementPropertyConfiguration.hashValue.getter()
{
  sub_1BBFD5584();
  sub_1BBFD53EC();
  return sub_1BBFD5590();
}

uint64_t sub_1BBFD1208()
{
  sub_1BBFD5584();
  sub_1BBFD53EC();
  return sub_1BBFD5590();
}

uint64_t sub_1BBFD1250()
{
  return sub_1BBFD53EC();
}

uint64_t sub_1BBFD1258()
{
  sub_1BBFD5584();
  sub_1BBFD53EC();
  return sub_1BBFD5590();
}

unint64_t sub_1BBFD12A0()
{
  unint64_t result;

  result = qword_1EF3ED890;
  if (!qword_1EF3ED890)
  {
    result = MEMORY[0x1BCCE76A8]("qiL+H\t", &type metadata for EngagementPropertyConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EF3ED890);
  }
  return result;
}

uint64_t sub_1BBFD12E4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1BBFD5530();
}

_QWORD *assignWithCopy for EngagementPropertyConfiguration(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for EngagementPropertyConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementPropertyConfiguration(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EngagementPropertyConfiguration(uint64_t result, int a2, int a3)
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

uint64_t EngagementCollector.donors.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t EngagementCollector.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  EngagementCollector.init()();
  return v0;
}

uint64_t EngagementCollector.init()()
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
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_1BBFD544C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BBFD5398();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1BBFD5440();
  MEMORY[0x1E0C80A78](v7);
  sub_1BBFCE100();
  sub_1BBFD5434();
  sub_1BBFD538C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D0], v2);
  v8 = sub_1BBFD5464();
  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + 16) = v8;
  *(_QWORD *)(v1 + 24) = v9;
  return v1;
}

uint64_t EngagementCollector.collect(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BBFD2254(a3, a4);
}

void sub_1BBFD15E4(uint64_t a1, void *a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  dispatch_group_t v32;
  void (*v33)(uint64_t *, uint64_t (*)(uint64_t *), _QWORD *, uint64_t, uint64_t);
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  _QWORD v51[3];
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(_QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  dispatch_group_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[2];
  char v76;
  uint64_t v77;
  uint64_t v78;

  v64 = a2;
  v7 = sub_1BBFD53B0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v51 - v12;
  if (qword_1ED699680 != -1)
    swift_once();
  v14 = sub_1BBFD535C();
  v65 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED6996A8);
  v15 = sub_1BBFD5344();
  v16 = sub_1BBFD5404();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = a1;
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1BBFCC000, v15, v16, "Start collecting data", v18, 2u);
    v19 = v18;
    a1 = v17;
    MEMORY[0x1BCCE7720](v19, -1, -1);
  }

  v68 = dispatch_group_create();
  v20 = swift_allocObject();
  v66 = v20;
  *(_QWORD *)(v20 + 16) = MEMORY[0x1E0DEE9E0];
  v59 = *(_QWORD *)(a1 + 16);
  if (v59)
  {
    v51[1] = v20 + 16;
    v52 = v11;
    v53 = v13;
    v54 = v8;
    v55 = v7;
    v56 = a4;
    v57 = a3;
    v58 = a1 + 32;
    v51[2] = a1;
    swift_bridgeObjectRetain();
    v21 = 0;
    *(_QWORD *)&v22 = 136315138;
    v63 = v22;
    v62 = MEMORY[0x1E0DEE9B8] + 8;
    do
    {
      v60 = v21;
      sub_1BBFCEB1C(v58 + 40 * v21, (uint64_t)v75);
      v23 = v77;
      v24 = v78;
      __swift_project_boxed_opaque_existential_1(v75, v77);
      v61 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 16))(v23, v24);
      v25 = *(_QWORD *)(v61 + 16);
      if (v25)
      {
        v26 = (uint64_t *)(v61 + 40);
        do
        {
          v37 = *(v26 - 1);
          v36 = *v26;
          swift_bridgeObjectRetain();
          dispatch_group_enter(v68);
          sub_1BBFCEB1C((uint64_t)v75, (uint64_t)&v70);
          v38 = sub_1BBFD5344();
          v39 = sub_1BBFD5404();
          v40 = os_log_type_enabled(v38, v39);
          v67 = v25;
          if (v40)
          {
            v41 = swift_slowAlloc();
            v42 = swift_slowAlloc();
            v69 = v42;
            *(_DWORD *)v41 = v63;
            v43 = v73;
            v44 = v74;
            __swift_project_boxed_opaque_existential_1(&v70, v73);
            v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v43, v44);
            *(_QWORD *)(v41 + 4) = sub_1BBFCFE34(v45, v46, &v69);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v70);
            _os_log_impl(&dword_1BBFCC000, v38, v39, "Getting data from donor: %s", (uint8_t *)v41, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1BCCE7720](v42, -1, -1);
            MEMORY[0x1BCCE7720](v41, -1, -1);
          }
          else
          {
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v70);
          }

          v26 += 2;
          v27 = v77;
          v28 = v78;
          __swift_project_boxed_opaque_existential_1(v75, v77);
          v70 = v37;
          v71 = v36;
          v29 = (_QWORD *)swift_allocObject();
          v30 = v64;
          v31 = v66;
          v29[2] = v64;
          v29[3] = v31;
          v29[4] = v37;
          v29[5] = v36;
          v32 = v68;
          v29[6] = v68;
          v33 = *(void (**)(uint64_t *, uint64_t (*)(uint64_t *), _QWORD *, uint64_t, uint64_t))(v28 + 24);
          swift_bridgeObjectRetain();
          v34 = v30;
          swift_retain();
          v35 = v32;
          v33(&v70, sub_1BBFD28A0, v29, v27, v28);
          swift_bridgeObjectRelease();
          swift_release();
          v25 = v67 - 1;
        }
        while (v67 != 1);
      }
      v21 = v60 + 1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v75);
    }
    while (v21 != v59);
    swift_bridgeObjectRelease();
    a3 = v57;
    v7 = v55;
    v8 = v54;
    v13 = v53;
    v11 = v52;
  }
  sub_1BBFD53A4();
  MEMORY[0x1BCCE727C](v11, 5.0);
  v47 = *(void (**)(char *, uint64_t))(v8 + 8);
  v47(v11, v7);
  sub_1BBFD5428();
  v47(v13, v7);
  if ((sub_1BBFD5368() & 1) != 0)
  {
    swift_beginAccess();
    v70 = *(_QWORD *)(v66 + 16);
    v71 = 0;
    v72 = 0;
    swift_bridgeObjectRetain();
    a3(&v70);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v48 = sub_1BBFD5344();
    v49 = sub_1BBFD5410();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_1BBFCC000, v48, v49, "A Donor failed to call completion block in time. Donation might be partial.", v50, 2u);
      MEMORY[0x1BCCE7720](v50, -1, -1);
    }

    v75[0] = 0;
    v75[1] = 0;
    v76 = 1;
    a3(v75);
    swift_release();
  }

}

uint64_t sub_1BBFD1BB8(uint64_t *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t result;
  _QWORD v17[6];

  v10 = *a1;
  v11 = a3 + 16;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = a4;
  v12[5] = a5;
  v12[6] = a6;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1BBFD28E4;
  *(_QWORD *)(v13 + 24) = v12;
  v17[4] = sub_1BBFD2904;
  v17[5] = v13;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 1107296256;
  v17[2] = sub_1BBFD1D9C;
  v17[3] = &block_descriptor_15;
  v14 = _Block_copy(v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = a6;
  swift_retain();
  swift_release();
  dispatch_sync(a2, v14);
  _Block_release(v14);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  return result;
}

void sub_1BBFD1D0C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, dispatch_group_t group)
{
  if (a1)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BBFD3020(a1, a3, a4);
    swift_endAccess();
  }
  dispatch_group_leave(group);
}

uint64_t sub_1BBFD1D9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1BBFD1DBC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t EngagementCollector.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EngagementCollector.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1BBFD1E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1BBFD2254(a3, a4);
}

unint64_t sub_1BBFD1E60()
{
  unint64_t result;

  result = qword_1EF3ED898;
  if (!qword_1EF3ED898)
  {
    result = MEMORY[0x1BCCE76A8](&protocol conformance descriptor for CollectorError, &type metadata for CollectorError);
    atomic_store(result, (unint64_t *)&qword_1EF3ED898);
  }
  return result;
}

uint64_t sub_1BBFD1EA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BBFD1F38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BBFD210C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1BBFD210C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BBFD1F38(uint64_t a1, unint64_t a2)
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
      v3 = sub_1BBFD20AC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1BBFD54C4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1BBFD54DC();
      __break(1u);
LABEL_10:
      v2 = sub_1BBFD53F8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1BBFD5518();
    __break(1u);
LABEL_14:
    result = sub_1BBFD54DC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1BBFD20AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1BBFD2924();
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BBFD210C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1BBFD2924();
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
  result = sub_1BBFD5518();
  __break(1u);
  return result;
}

uint64_t sub_1BBFD2254(uint64_t a1, uint64_t a2)
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
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v22 = a1;
  v23 = a2;
  v3 = sub_1BBFD5374();
  v26 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BBFD5398();
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BBFD5380();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v13 = *(void **)(v2 + 16);
  v14 = *(_QWORD *)(v2 + 24);
  sub_1BBFCE100();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0DEF520], v9);
  swift_bridgeObjectRetain();
  v15 = (void *)sub_1BBFD5470();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v13;
  v17 = v23;
  v16[4] = v22;
  v16[5] = v17;
  aBlock[4] = sub_1BBFD2774;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BBFD1DBC;
  aBlock[3] = &block_descriptor;
  v18 = _Block_copy(aBlock);
  v19 = v13;
  swift_retain();
  sub_1BBFD538C();
  v27 = MEMORY[0x1E0DEE9D8];
  sub_1BBFD2798();
  sub_1BBFD0D04(0, &qword_1ED699360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEAEC8]);
  sub_1BBFD27E0();
  sub_1BBFD54AC();
  MEMORY[0x1BCCE7318](0, v8, v5, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v25);
  return swift_release();
}

unint64_t destroy for CollectorError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s23NewsEngagementCollector14CollectorErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for CollectorError(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CollectorError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CollectorError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CollectorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_1BBFD26E0(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1BBFD26FC(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CollectorError()
{
  return &type metadata for CollectorError;
}

uint64_t method lookup function for EngagementCollector()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EngagementCollector.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1BBFD2740()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_1BBFD2774()
{
  uint64_t v0;

  sub_1BBFD15E4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40));
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

unint64_t sub_1BBFD2798()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED699350;
  if (!qword_1ED699350)
  {
    v1 = sub_1BBFD5374();
    result = MEMORY[0x1BCCE76A8](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1ED699350);
  }
  return result;
}

unint64_t sub_1BBFD27E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED699368;
  if (!qword_1ED699368)
  {
    sub_1BBFD0D04(255, &qword_1ED699360, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1BCCE76A8](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED699368);
  }
  return result;
}

uint64_t sub_1BBFD2840()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BBFD2864()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1BBFD28A0(uint64_t *a1)
{
  uint64_t v1;

  return sub_1BBFD1BB8(a1, *(NSObject **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_1BBFD28B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_1BBFD28E4()
{
  uint64_t v0;

  sub_1BBFD1D0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(dispatch_group_t *)(v0 + 48));
}

uint64_t sub_1BBFD28F4()
{
  return swift_deallocObject();
}

uint64_t sub_1BBFD2904()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1BBFD2924()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED699378[0])
  {
    v0 = sub_1BBFD5524();
    if (!v1)
      atomic_store(v0, qword_1ED699378);
  }
}

uint64_t sub_1BBFD2980(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBFD29DC()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1BBFD2A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BBFD2A74())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1BBFD2AB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BBFD2B0C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_1BBFD2B40())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *BaseDonor.__allocating_init(type:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = sub_1BBFD52E4();
  MEMORY[0x1E0C80A78](v4);
  v5 = (_QWORD *)swift_allocObject();
  v5[5] = MEMORY[0x1E0DEE9E0];
  sub_1BBFD52D8();
  sub_1BBFD52FC();
  swift_allocObject();
  v5[6] = sub_1BBFD52F0();
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = MEMORY[0x1E0DEE9D8];
  return v5;
}

void sub_1BBFD2C48()
{
  sub_1BBFD54E8();
  __break(1u);
}

uint64_t sub_1BBFD2CA0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t BaseDonor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t BaseDonor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1BBFD2D34()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1BBFD2D80()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBFD2DC0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 192))();
}

uint64_t sub_1BBFD2DE8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BBFD2E14@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BBFD2E60@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of Donor.type.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Donor.eventConfigurations.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Donor.donate(configuration:donationCompleteBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t method lookup function for BaseDonor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BaseDonor.type.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of BaseDonor.type.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of BaseDonor.type.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of BaseDonor.eventConfigurations.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of BaseDonor.__allocating_init(type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of BaseDonor.donate(configuration:donationCompleteBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t initializeBufferWithCopyOfBuffer for BaseDonor.Observation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t assignWithCopy for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t assignWithTake for BaseDonor.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t storeEnumTagSinglePayload for BaseDonor.Observation(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = 1;
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseDonor.Observation()
{
  return &type metadata for BaseDonor.Observation;
}

uint64_t sub_1BBFD3020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  if (a1)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    *v3 = 0x8000000000000000;
    sub_1BBFD486C(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BBFD40F4(a2, a3, &v9);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t EngagementDataManager.collector.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_1BBFCEB1C(v1 + 16, a1);
}

uint64_t EngagementDataManager.collector.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 16;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  sub_1BBFD0E60(a1, v3);
  return swift_endAccess();
}

uint64_t (*EngagementDataManager.collector.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

NewsEngagementCollector::StatePropertyValue_optional __swiftcall EngagementDataManager.getProperties(config:)(NewsEngagementCollector::EngagementPropertyConfiguration config)
{
  _QWORD *v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t *v19;
  void *v20;
  void *v21;
  Swift::Bool v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  id v33;
  uint64_t v34;
  os_log_type_t v35;
  uint8_t *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  unint64_t v42;
  uint64_t v43;
  NewsEngagementCollector::StatePropertyValue_optional result;

  v2 = v1;
  v43 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)config.eventName._countAndFlagsBits;
  v3 = *(_QWORD *)(config.eventName._countAndFlagsBits + 8);
  v5 = qword_1ED699680;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = sub_1BBFD535C();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED6996A8);
  swift_bridgeObjectRetain_n();
  v7 = sub_1BBFD5344();
  v8 = sub_1BBFD541C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (void *)swift_slowAlloc();
    v41 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_1BBFCFE34(v4, v3, (uint64_t *)&v41);
    sub_1BBFD5488();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBFCC000, v7, v8, "EngagementDataManager fetching properties for: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE7720](v10, -1, -1);
    MEMORY[0x1BCCE7720](v9, -1, -1);

  }
  else
  {

    v11 = swift_bridgeObjectRelease_n();
  }
  v40 = *(_QWORD *)(v38 + 56);
  MEMORY[0x1E0C80A78](v11);
  sub_1BBFD52FC();
  sub_1BBFD0618(0, &qword_1ED699480, (void (*)(uint64_t))sub_1BBFD0664);
  swift_retain();
  sub_1BBFD5338();
  swift_release();
  if (!v41)
  {
    swift_bridgeObjectRetain();
    v17 = sub_1BBFD5344();
    v18 = sub_1BBFD541C();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = (void *)swift_slowAlloc();
      v41 = v20;
      *(_DWORD *)v19 = 136315138;
      swift_bridgeObjectRetain();
      sub_1BBFCFE34(v4, v3, (uint64_t *)&v41);
      sub_1BBFD5488();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBFCC000, v17, (os_log_type_t)v18, "EngagementDataManager no store found for: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE7720](v20, -1, -1);
      MEMORY[0x1BCCE7720](v19, -1, -1);

    }
    else
    {

      v21 = (void *)swift_bridgeObjectRelease_n();
    }
    goto LABEL_24;
  }
  sub_1BBFD5308();
  v12 = v42;
  if (v42 >> 60 == 15)
  {
    swift_bridgeObjectRetain();
    v13 = sub_1BBFD5344();
    v14 = sub_1BBFD541C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = (void *)swift_slowAlloc();
      v41 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_1BBFCFE34(v4, v3, (uint64_t *)&v41);
      sub_1BBFD5488();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBFCC000, v13, v14, "EngagementDataManager no stored value found for: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE7720](v16, -1, -1);
      MEMORY[0x1BCCE7720](v15, -1, -1);
LABEL_20:

LABEL_23:
      v21 = (void *)swift_release();
LABEL_24:
      v28 = 0;
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  v23 = (uint64_t)v41;
  v24 = (void *)objc_opt_self();
  v25 = (void *)sub_1BBFD52A8();
  v41 = 0;
  v26 = objc_msgSend(v24, sel_JSONObjectWithData_options_error_, v25, 0, &v41);

  if (!v26)
  {
    v33 = v41;
    v34 = sub_1BBFD5290();

    swift_willThrow();
    MEMORY[0x1BCCE7654](v34);
    goto LABEL_18;
  }
  v27 = v41;
  sub_1BBFD54A0();
  swift_unknownObjectRelease();
  sub_1BBFD4070();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v13 = sub_1BBFD5344();
    v35 = sub_1BBFD5410();
    if (os_log_type_enabled(v13, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (void *)swift_slowAlloc();
      v41 = v37;
      *(_DWORD *)v36 = 136315138;
      swift_bridgeObjectRetain();
      sub_1BBFCFE34(v4, v3, (uint64_t *)&v41);
      sub_1BBFD5488();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BBFCC000, v13, v35, "EngagementDataManager failed deserializing data for: %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BCCE7720](v37, -1, -1);
      MEMORY[0x1BCCE7720](v36, -1, -1);
      sub_1BBFD405C(v23, v12);
      goto LABEL_20;
    }
    sub_1BBFD405C(v23, v12);
LABEL_22:

    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
  v39 = v23;
  v28 = v40;
  swift_bridgeObjectRetain();
  v29 = sub_1BBFD5344();
  v30 = sub_1BBFD541C();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (void *)swift_slowAlloc();
    v41 = v32;
    *(_DWORD *)v31 = 136315138;
    swift_bridgeObjectRetain();
    sub_1BBFCFE34(v4, v3, (uint64_t *)&v41);
    sub_1BBFD5488();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBFCC000, v29, v30, "EngagementDataManager fetched properties for: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE7720](v32, -1, -1);
    MEMORY[0x1BCCE7720](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  sub_1BBFD405C(v39, v12);

  v21 = (void *)swift_release();
LABEL_25:
  *v2 = v28;
  result.value.value._rawValue = v21;
  result.is_nil = v22;
  return result;
}

uint64_t EngagementDataManager.getProperties(propertyName:completion:)(uint64_t a1, unint64_t a2, void (*a3)(id *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  void *v31;
  _QWORD v32[2];
  void (*v33)(id *);
  void *v34;
  id v35;
  unint64_t v36;
  uint64_t v37;

  v5 = v4;
  v32[1] = a4;
  v33 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = type metadata accessor for EngagementDataManagerConfig();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED699680 != -1)
    swift_once();
  v11 = sub_1BBFD535C();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1ED6996A8);
  swift_bridgeObjectRetain_n();
  v32[0] = v12;
  v13 = sub_1BBFD5344();
  v14 = sub_1BBFD541C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = (void *)swift_slowAlloc();
    v35 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_bridgeObjectRetain();
    v34 = (void *)sub_1BBFCFE34(a1, a2, (uint64_t *)&v35);
    sub_1BBFD5488();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBFCC000, v13, v14, "EngagementDataManager fetching properties for: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE7720](v16, -1, -1);
    MEMORY[0x1BCCE7720](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1BBFCF52C(v5 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig, (uint64_t)v10);
  sub_1BBFD00F8(a1, a2, (uint64_t)v10);
  v17 = sub_1BBFD529C();
  v18 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v10, v17);
  v34 = *(void **)(v5 + 56);
  MEMORY[0x1E0C80A78](v18);
  v32[-4] = v5;
  v32[-3] = a1;
  v32[-2] = a2;
  sub_1BBFD52FC();
  sub_1BBFD0618(0, &qword_1ED699480, (void (*)(uint64_t))sub_1BBFD0664);
  swift_retain();
  sub_1BBFD5338();
  swift_release();
  if (v35)
  {
    sub_1BBFD5308();
    v19 = v36;
    if (v36 >> 60 == 15)
    {
      swift_release();
    }
    else
    {
      v20 = (uint64_t)v35;
      v21 = (void *)objc_opt_self();
      v22 = (void *)sub_1BBFD52A8();
      v35 = 0;
      v23 = objc_msgSend(v21, sel_JSONObjectWithData_options_error_, v22, 0, &v35);

      if (v23)
      {
        v24 = v35;
        sub_1BBFD54A0();
        swift_unknownObjectRelease();
        sub_1BBFD4070();
        if ((swift_dynamicCast() & 1) != 0)
        {
          v35 = v34;
          v33(&v35);
          swift_release();
          sub_1BBFD405C(v20, v19);
          return swift_bridgeObjectRelease();
        }
        swift_release();
        sub_1BBFD405C(v20, v19);
      }
      else
      {
        v26 = v35;
        v27 = sub_1BBFD5290();

        swift_willThrow();
        swift_release();
        sub_1BBFD405C(v20, v19);
        MEMORY[0x1BCCE7654](v27);
      }
    }
  }
  swift_bridgeObjectRetain_n();
  v28 = sub_1BBFD5344();
  v29 = sub_1BBFD541C();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = (void *)swift_slowAlloc();
    v35 = v31;
    *(_DWORD *)v30 = 136315138;
    swift_bridgeObjectRetain();
    v34 = (void *)sub_1BBFCFE34(a1, a2, (uint64_t *)&v35);
    sub_1BBFD5488();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BBFCC000, v28, v29, "EngagementDataManager no properties found for: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BCCE7720](v31, -1, -1);
    MEMORY[0x1BCCE7720](v30, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v35 = 0;
  return ((uint64_t (*)(id *))v33)(&v35);
}

uint64_t EngagementDataManager.__allocating_init(config:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  EngagementDataManager.init(config:)(a1);
  return v2;
}

uint64_t EngagementDataManager.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BBFD4EE4(v0 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig, (uint64_t (*)(_QWORD))type metadata accessor for EngagementDataManagerConfig);
  return v0;
}

uint64_t EngagementDataManager.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1BBFD4EE4(v0 + OBJC_IVAR____TtC23NewsEngagementCollector21EngagementDataManager_managerConfig, (uint64_t (*)(_QWORD))type metadata accessor for EngagementDataManagerConfig);
  return swift_deallocClassInstance();
}

unint64_t sub_1BBFD401C(uint64_t a1, uint64_t a2)
{
  return (unint64_t)EngagementDataManager.getProperties(config:)(*(NewsEngagementCollector::EngagementPropertyConfiguration *)&a1);
}

uint64_t sub_1BBFD403C(uint64_t a1, unint64_t a2, void (*a3)(id *), uint64_t a4)
{
  return EngagementDataManager.getProperties(propertyName:completion:)(a1, a2, a3, a4);
}

uint64_t sub_1BBFD405C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1BBFD1108(a1, a2);
  return a1;
}

void sub_1BBFD4070()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED699688)
  {
    v0 = sub_1BBFD53D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED699688);
  }
}

uint64_t sub_1BBFD40D8()
{
  return type metadata accessor for EngagementDataManager();
}

uint64_t method lookup function for EngagementDataManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EngagementDataManager.__allocating_init(config:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1BBFD40F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1BBFCFCF0(a1, a2);
  LOBYTE(a2) = v9;
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1BBFD49C8();
      v12 = v13;
    }
    swift_bridgeObjectRelease();
    *a3 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v8);
    sub_1BBFD44DC(v8, v12);
    *v4 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

uint64_t sub_1BBFD41CC(uint64_t a1, char a2)
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
  sub_1BBFD4FB0();
  v36 = a2;
  v6 = sub_1BBFD5500();
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
    sub_1BBFD5584();
    sub_1BBFD53EC();
    result = sub_1BBFD5590();
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

unint64_t sub_1BBFD44DC(unint64_t result, uint64_t a2)
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
    result = sub_1BBFD54B8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1BBFD5584();
        swift_bridgeObjectRetain();
        sub_1BBFD53EC();
        v9 = sub_1BBFD5590();
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

unint64_t sub_1BBFD46B0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
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
    result = sub_1BBFD54B8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_1BBFD5578();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        result = v15 + 16 * v3;
        if (v3 < (uint64_t)v6 || result >= v15 + 16 * v6 + 16)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v16 = v3 == v6;
          v3 = v6;
          if (v16)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
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

uint64_t sub_1BBFD486C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1BBFCFCF0(a2, a3);
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
    sub_1BBFD49C8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
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
  sub_1BBFD41CC(v15, a4 & 1);
  v21 = sub_1BBFCFCF0(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1BBFD553C();
  __break(1u);
  return result;
}

void *sub_1BBFD49C8()
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
  sub_1BBFD4FB0();
  v2 = *v0;
  v3 = sub_1BBFD54F4();
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

void *sub_1BBFD4B78()
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
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _BYTE v22[16];

  v1 = v0;
  sub_1BBFD0B34();
  v2 = *v0;
  v3 = sub_1BBFD54F4();
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    sub_1BBFD0E28(*(_QWORD *)(v2 + 56) + 16 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = (void *)sub_1BBFCE350((uint64_t)v22, *(_QWORD *)(v4 + 56) + v18);
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BBFD4D34()
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
  sub_1BBFD09D8();
  v2 = *v0;
  v3 = sub_1BBFD54F4();
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
    result = (void *)swift_retain();
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

uint64_t sub_1BBFD4EE4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1BBFD4F20()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF3ED8A0)
  {
    v0 = sub_1BBFD547C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF3ED8A0);
  }
}

uint64_t sub_1BBFD4F74(uint64_t a1, uint64_t a2)
{
  assignWithTake for BaseDonor.Observation(a2, a1);
  return a2;
}

void sub_1BBFD4FB0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF3ED8A8)
  {
    sub_1BBFD5010();
    v0 = sub_1BBFD550C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF3ED8A8);
  }
}

unint64_t sub_1BBFD5010()
{
  unint64_t result;

  result = qword_1EF3ED8B0;
  if (!qword_1EF3ED8B0)
  {
    result = MEMORY[0x1BCCE76A8](&protocol conformance descriptor for EngagementPropertyConfiguration, &type metadata for EngagementPropertyConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EF3ED8B0);
  }
  return result;
}

uint64_t EngagementDataManagerConfig.localStorageDirectory.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1BBFD529C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t dispatch thunk of EngagementCollectorManagerType.getProperties(config:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of EngagementCollectorManagerType.getProperties(propertyName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of EngagementCollectorType.collect(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of EngagementCollectorType.register(donor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t initializeBufferWithCopyOfBuffer for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for EngagementDataManagerConfig(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BBFD529C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t assignWithCopy for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for EngagementDataManagerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementDataManagerConfig()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BBFD5208(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for EngagementDataManagerConfig()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BBFD5250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBFD529C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1BBFD5290()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1BBFD529C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BBFD52A8()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BBFD52B4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BBFD52C0()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1BBFD52CC()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1BBFD52D8()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1BBFD52E4()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1BBFD52F0()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1BBFD52FC()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1BBFD5308()
{
  return MEMORY[0x1E0DB3C88]();
}

uint64_t sub_1BBFD5314()
{
  return MEMORY[0x1E0DB3C90]();
}

uint64_t sub_1BBFD5320()
{
  return MEMORY[0x1E0DB3C98]();
}

uint64_t sub_1BBFD532C()
{
  return MEMORY[0x1E0DB3CB0]();
}

uint64_t sub_1BBFD5338()
{
  return MEMORY[0x1E0DB4928]();
}

uint64_t sub_1BBFD5344()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BBFD5350()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BBFD535C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BBFD5368()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1BBFD5374()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1BBFD5380()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1BBFD538C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1BBFD5398()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1BBFD53A4()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1BBFD53B0()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1BBFD53BC()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1BBFD53C8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BBFD53D4()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1BBFD53E0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BBFD53EC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BBFD53F8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BBFD5404()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BBFD5410()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BBFD541C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BBFD5428()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1BBFD5434()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1BBFD5440()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1BBFD544C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1BBFD5458()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1BBFD5464()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1BBFD5470()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1BBFD547C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BBFD5488()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BBFD5494()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BBFD54A0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BBFD54AC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BBFD54B8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1BBFD54C4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BBFD54D0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BBFD54DC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BBFD54E8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BBFD54F4()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1BBFD5500()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1BBFD550C()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1BBFD5518()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BBFD5524()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1BBFD5530()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BBFD553C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1BBFD5548()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1BBFD5554()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1BBFD5560()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1BBFD556C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1BBFD5578()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1BBFD5584()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BBFD5590()
{
  return MEMORY[0x1E0DEDF40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

