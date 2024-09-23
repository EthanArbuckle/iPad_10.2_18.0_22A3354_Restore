uint64_t isInternal()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t seedFeedbackPromptingEnabled()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

BOOL sub_21E270260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v21 = a3;
  v19[1] = a2;
  v20 = sub_21E280378();
  v3 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21E280210();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E280360();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1900);
  v10 = sub_21E28036C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_21E280D80;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v11 + 104))(v13 + v12, *MEMORY[0x24BDCF230], v10);
  sub_21E27071C(v13);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_21E280354();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
  v14 = sub_21E280204();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((v16 & 1) != 0)
    v17 = 0;
  else
    v17 = v14;
  return v17 < v21;
}

BOOL sub_21E27042C()
{
  _QWORD v1[4];

  sub_21E2760AC();
  v1[2] = 24;
  return sub_21E2762CC(0xD000000000000012, 0x800000021E2816B0, 2, (uint64_t)sub_21E2709EC, (uint64_t)v1);
}

void sub_21E27049C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_21E2704A4(uint64_t a1)
{
  MEMORY[0x2207ADA6C](&unk_21E280E28, a1);
  return sub_21E28039C();
}

uint64_t sub_21E2704E0()
{
  MEMORY[0x2207ADA6C](&unk_21E280E28);
  return sub_21E280390();
}

uint64_t sub_21E270528(uint64_t a1, uint64_t a2)
{
  sub_21E2806FC();
  MEMORY[0x2207ADA6C](&unk_21E280E28, a2);
  sub_21E280390();
  return sub_21E280714();
}

_QWORD *sub_21E270580@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for CriticalPolicy()
{
  return &type metadata for CriticalPolicy;
}

void type metadata accessor for CFString()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2553D18E8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2553D18E8);
  }
}

uint64_t sub_21E2705F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2207ADA6C](&unk_21E280E28, a3);
  return sub_21E280384();
}

uint64_t sub_21E27063C()
{
  return sub_21E270A34(&qword_2553D18F0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21E280E54);
}

uint64_t sub_21E270668()
{
  return sub_21E270A34(&qword_2553D18F8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21E280DEC);
}

unint64_t sub_21E270694(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x2207ADAF0](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x2207ADAF0](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21E27071C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_21E28036C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1908);
    v10 = sub_21E2805F4();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_21E270A34(&qword_2553D1910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_21E280408();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_21E270A34(&qword_2553D1918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_21E280414();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_21E270984()
{
  uint64_t result;
  char v1;
  uint64_t v2;
  unint64_t v3;

  result = sub_21E2765BC(0xD000000000000023, 0x800000021E281680);
  if ((v1 & 1) != 0)
    v2 = 10;
  else
    v2 = result;
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    v3 = sub_21E270694(0x64uLL);
    return v3 < 0x7FFFFFFFFFFFFFFFLL && v2 >= (uint64_t)(v3 + 1);
  }
  return result;
}

BOOL sub_21E2709EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21E270260(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207ADA54]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E270A34(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207ADA6C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E270A74(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21E270AAC + 4 * byte_21E280E98[a1]))(0xD000000000000013, 0x800000021E281720);
}

uint64_t sub_21E270AAC()
{
  return 0x73736563637573;
}

uint64_t sub_21E270AC4()
{
  return 0x6572756C696166;
}

uint64_t sub_21E270ADC()
{
  return 0x2D6572756C696166;
}

uint64_t sub_21E270B14()
{
  return 0x2D64656C706D6173;
}

uint64_t sub_21E270B34()
{
  return 0x662D6C65636E6163;
}

uint64_t sub_21E270B50()
{
  return 0x642D6C65636E6163;
}

uint64_t sub_21E270B6C(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;

  swift_bridgeObjectRetain();
  v8 = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *a4;
  *a4 = 0x8000000000000000;
  sub_21E270F10((uint64_t)v8, a1, a2, isUniquelyReferenced_nonNull_native);
  *a4 = v11;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E270C04(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1938);
  v38 = a2;
  v6 = sub_21E280648();
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
    sub_21E2806FC();
    sub_21E280498();
    result = sub_21E280714();
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

void sub_21E270F10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_21E279F70(a2, a3);
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
    sub_21E27106C();
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
  sub_21E270C04(v15, a4 & 1);
  v20 = sub_21E279F70(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_21E2806B4();
  __break(1u);
}

id sub_21E27106C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1938);
  v2 = *v0;
  v3 = sub_21E28063C();
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

uint64_t sub_21E27121C(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v20 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7)
      return swift_release();
    v18 = *(_QWORD *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v7)
        return swift_release();
      v18 = *(_QWORD *)(v20 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v7)
          return swift_release();
        v18 = *(_QWORD *)(v20 + 8 * v9);
        if (!v18)
        {
          v9 = v17 + 3;
          if (v17 + 3 >= v7)
            return swift_release();
          v18 = *(_QWORD *)(v20 + 8 * v9);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    v16 = v15;
    a2(v13, v14, v16);

    result = swift_bridgeObjectRelease();
  }
  v19 = v17 + 4;
  if (v19 >= v7)
    return swift_release();
  v18 = *(_QWORD *)(v20 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v18 = *(_QWORD *)(v20 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_21E2713CC(char a1)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E280D80;
  *(_QWORD *)(inited + 32) = 0x737574617473;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  __asm { BR              X10 }
}

void sub_21E27146C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = sub_21E280444();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = v4;
  v5 = sub_21E278CD8(v2);
  *(_QWORD *)(v3 - 72) = v5;
  if (*(_QWORD *)(v1 + 24))
  {
    sub_21E271720(v1, v3 - 176);
    v6 = *(_QWORD *)(v3 - 152);
    if (!v6)
    {
      __break(1u);
      JUMPOUT(0x21E2716ACLL);
    }
    v7 = *(_QWORD *)(v3 - 144);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 - 176), *(_QWORD *)(v3 - 152));
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 56))(v6, v7);
    v9 = MEMORY[0x24BDAC7A8](v8);
    sub_21E27121C(v9, (void (*)(uint64_t, uint64_t, id))sub_21E2717AC);
    swift_bridgeObjectRelease();
    v5 = __swift_destroy_boxed_opaque_existential_1(v3 - 176);
  }
  MEMORY[0x24BDAC7A8](v5);
  sub_21E27121C(v0, (void (*)(uint64_t, uint64_t, id))sub_21E2716CC);
  v10 = (void *)sub_21E280444();
  sub_21E2716E4();
  swift_bridgeObjectRetain();
  v11 = (void *)sub_21E2803FC();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();
  swift_bridgeObjectRelease();

}

uint64_t sub_21E2716CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  return sub_21E270B6C(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

unint64_t sub_21E2716E4()
{
  unint64_t result;

  result = qword_2553D1928;
  if (!qword_2553D1928)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2553D1928);
  }
  return result;
}

uint64_t sub_21E271720(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

BOOL sub_21E2717B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21E2717C4()
{
  sub_21E2806FC();
  sub_21E280708();
  return sub_21E280714();
}

uint64_t sub_21E271808()
{
  return sub_21E280708();
}

uint64_t sub_21E271830()
{
  sub_21E2806FC();
  sub_21E280708();
  return sub_21E280714();
}

uint64_t sub_21E271870@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  void (*v16)(char *, uint64_t, uint64_t);
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  ValueMetadata *v21;
  _UNKNOWN **v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v38[12];
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  _UNKNOWN **v48;

  v43 = a3;
  v5 = a1;
  v6 = sub_21E2802D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v39 = &v38[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = (int *)type metadata accessor for CrashLog();
  v42 = *((_QWORD *)v9 - 1);
  v10 = (int *)MEMORY[0x24BDAC7A8](v9);
  v12 = &v38[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = &v12[v10[6]];
  *(_QWORD *)v13 = 0x6873617243;
  *((_QWORD *)v13 + 1) = 0xE500000000000000;
  v14 = &v12[v10[10]];
  if (v5 == 4)
    v15 = 3;
  else
    v15 = a1;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *v12 = v15;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16(&v12[v10[5]], a2, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1940);
  v40 = v7;
  v17 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_21E280D80;
  v41 = v6;
  v16((char *)(v18 + v17), a2, v6);
  *(_QWORD *)&v12[v9[7]] = v18;
  v19 = sub_21E278DF0(MEMORY[0x24BEE4AF8]);
  v20 = v9[8];
  *(_QWORD *)&v12[v20] = v19;
  v21 = &type metadata for DefaultPolicy;
  if ((v15 & 0xFE) != 0)
  {
    v22 = &off_24E2452A8;
  }
  else
  {
    v21 = &type metadata for CriticalPolicy;
    v22 = &off_24E244C10;
  }
  *((_QWORD *)&v47 + 1) = v21;
  v48 = v22;
  sub_21E271EB0(&v46, (uint64_t)&v12[v9[9]]);
  v23 = sub_21E27B44C(a2);
  v39 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v12[v20] = v23;
  v24 = sub_21E28045C();
  v26 = v25;
  sub_21E2801EC();
  swift_allocObject();
  v27 = sub_21E2801E0();
  v46 = 0uLL;
  v28 = MEMORY[0x24BDAC7A8](v27);
  *(_QWORD *)&v38[-48] = a2;
  *(_QWORD *)&v38[-40] = v24;
  *(_QWORD *)&v38[-32] = v26;
  *(_QWORD *)&v38[-24] = 128;
  *(_QWORD *)&v38[-16] = &v46;
  v44 = 0;
  v45 = v28;
  sub_21E273D10((uint64_t (*)(uint64_t, uint64_t))sub_21E272518);
  swift_bridgeObjectRelease();
  swift_release();
  v29 = *((_QWORD *)&v46 + 1);
  if (!*((_QWORD *)&v46 + 1))
  {
    v32 = v41;
    v31 = v39;
    if (v23[2] && (v33 = sub_21E279F70(1701667182, 0xE400000000000000), (v34 & 1) != 0))
    {
      sub_21E272940(v23[7] + 32 * v33, (uint64_t)&v46);
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
    }
    v35 = v40;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(a2, v32);
    if (*((_QWORD *)&v47 + 1))
    {
      if (swift_dynamicCast())
      {
        v30 = v44;
        v29 = v45;
        goto LABEL_18;
      }
    }
    else
    {
      sub_21E2728BC((uint64_t)&v46);
    }
    v29 = 0;
    v30 = 0;
    v44 = 0;
    v45 = 0;
    goto LABEL_18;
  }
  v30 = v46;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(a2, v41);
  v44 = v30;
  v45 = v29;
  v31 = v39;
LABEL_18:
  swift_bridgeObjectRelease();
  *(_QWORD *)v31 = v30;
  *((_QWORD *)v31 + 1) = v29;
  v36 = v43;
  sub_21E2728FC((uint64_t)v12, v43);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v42 + 56))(v36, 0, 1, v9);
  return sub_21E2724DC((uint64_t)v12);
}

uint64_t type metadata accessor for CrashLog()
{
  uint64_t result;

  result = qword_2553D19A8;
  if (!qword_2553D19A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21E271EB0(__int128 *a1, uint64_t a2)
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

uint64_t sub_21E271EC8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21E272554(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21E272554(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21E272554(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21E2735B4(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_21E271FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  _BYTE v14[32];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E280EA0;
  *(_QWORD *)(inited + 32) = 0x737365636F7270;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  v3 = *(int *)(type metadata accessor for CrashLog() + 32);
  v4 = *(_QWORD *)(v0 + v3);
  if (*(_QWORD *)(v4 + 16)
    && (v5 = sub_21E279F70(1701667182, 0xE400000000000000), (v6 & 1) != 0)
    && (sub_21E272940(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)v14), sub_21E2735C8(), swift_dynamicCast()))
  {
    v7 = v13;
  }
  else
  {
    sub_21E2735C8();
    v7 = sub_21E280594();
  }
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = 0x746E656469636E69;
  *(_QWORD *)(inited + 64) = 0xEB0000000064695FLL;
  v8 = *(_QWORD *)(v1 + v3);
  if (*(_QWORD *)(v8 + 16)
    && (v9 = sub_21E279F70(0x746E656469636E69, 0xEB0000000064695FLL), (v10 & 1) != 0)
    && (sub_21E272940(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)v14), sub_21E2735C8(), swift_dynamicCast()))
  {
    v11 = v13;
  }
  else
  {
    sub_21E2735C8();
    v11 = sub_21E280594();
  }
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = 1701869940;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = sub_21E280444();
  return sub_21E278CD8(inited);
}

unint64_t sub_21E2721D8()
{
  _BYTE *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = 0x61576D6574737953;
  v3 = 0x647261646E617453;
  if (!*v0)
    v3 = 4541505;
  if (v1 != 1)
    v2 = v3;
  if (v1 == 2)
    return 0xD000000000000014;
  else
    return v2;
}

uint64_t sub_21E27225C()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  int v10;
  int v11;
  unsigned __int8 v12;
  char v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[2];
  _BYTE v24[32];

  v1 = type metadata accessor for CrashLog();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)v23 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v23 - v8;
  v10 = *v0;
  sub_21E2728FC((uint64_t)v0, (uint64_t)v23 - v8);
  if (!v10)
  {
    v12 = 1;
    v4 = v9;
    goto LABEL_19;
  }
  v11 = *v9;
  sub_21E2724DC((uint64_t)v9);
  if (v11 != 1)
  {
    v13 = sub_21E273290(*(_QWORD *)&v0[*(int *)(v1 + 32)]);
    sub_21E2728FC((uint64_t)v0, (uint64_t)v7);
    if ((v13 & 1) != 0)
    {
      sub_21E2724DC((uint64_t)v7);
      sub_21E2728FC((uint64_t)v0, (uint64_t)v4);
    }
    else
    {
      v14 = sub_21E2731FC(*(_QWORD *)&v7[*(int *)(v1 + 32)]);
      sub_21E2724DC((uint64_t)v7);
      sub_21E2728FC((uint64_t)v0, (uint64_t)v4);
      if ((v14 & 1) == 0)
      {
        v15 = *(_QWORD *)&v4[*(int *)(v1 + 32)];
        if (*(_QWORD *)(v15 + 16) && (v16 = sub_21E279F70(0x4449656C646E7562, 0xE800000000000000), (v17 & 1) != 0))
        {
          sub_21E272940(*(_QWORD *)(v15 + 56) + 32 * v16, (uint64_t)v24);
          v18 = swift_dynamicCast();
          v19 = v18 == 0;
          if (v18)
            v20 = v23[0];
          else
            v20 = 0;
          if (v19)
            v21 = 0;
          else
            v21 = (void *)v23[1];
        }
        else
        {
          v20 = 0;
          v21 = 0;
        }
        v12 = sub_21E27349C(v20, v21);
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    v12 = 0;
LABEL_19:
    sub_21E2724DC((uint64_t)v4);
    return v12 & 1;
  }
  v12 = 1;
  return v12 & 1;
}

uint64_t sub_21E27243C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21E272470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21E273604(v2 + *(int *)(a1 + 36), a2);
}

uint64_t sub_21E272488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 40));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21E2724DC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CrashLog();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E272518(uint64_t a1)
{
  return sub_21E2738F8(a1);
}

uint64_t sub_21E272538(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21E272570(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21E272554(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21E272750(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21E272570(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A08);
  v10 = *(_QWORD *)(sub_21E280330() - 8);
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
  v16 = *(_QWORD *)(sub_21E280330() - 8);
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
  result = sub_21E280660();
  __break(1u);
  return result;
}

uint64_t sub_21E272750(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D19F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21E280660();
  __break(1u);
  return result;
}

uint64_t sub_21E2728BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1948);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21E2728FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CrashLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E272940(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_21E27297C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_21E2802D0();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = a3[7];
    v13 = (uint64_t *)((char *)v4 + v11);
    v14 = (uint64_t *)((char *)a2 + v11);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    v16 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    v17 = (char *)v4 + v16;
    v18 = (char *)a2 + v16;
    v19 = *(_OWORD *)((char *)a2 + v16 + 24);
    *(_OWORD *)((char *)v4 + v16 + 24) = v19;
    v20 = v19;
    v21 = **(void (***)(char *, char *, uint64_t))(v19 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21(v17, v18, v20);
    v22 = a3[10];
    v23 = (uint64_t *)((char *)v4 + v22);
    v24 = (uint64_t *)((char *)a2 + v22);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_21E272AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21E2802D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 36));
  return swift_bridgeObjectRelease();
}

_BYTE *sub_21E272B30(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  __int128 v18;
  uint64_t v19;
  void (*v20)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_21E2802D0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = &a1[v10];
  v13 = &a2[v10];
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  *(_QWORD *)&a1[v11] = *(_QWORD *)&a2[v11];
  v15 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = *(_OWORD *)&a2[v15 + 24];
  *(_OWORD *)&a1[v15 + 24] = v18;
  v19 = v18;
  v20 = **(void (***)(_BYTE *, _BYTE *, uint64_t))(v18 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20(v16, v17, v19);
  v21 = a3[10];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *sub_21E272C2C(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_21E2802D0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = &a2[v10];
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)&a1[a3[9]], (uint64_t *)&a2[a3[9]]);
  v13 = a3[10];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_BYTE *sub_21E272EA0(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  __int128 v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_21E2802D0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  v11 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  return a1;
}

_BYTE *sub_21E272F50(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  __int128 v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_21E2802D0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = (uint64_t *)&a2[v10];
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  v15 = a3[9];
  v16 = &a1[v15];
  v17 = &a2[v15];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&a1[v15]);
  v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((_QWORD *)v16 + 4) = *((_QWORD *)v17 + 4);
  v19 = a3[10];
  v20 = &a1[v19];
  v21 = (uint64_t *)&a2[v19];
  v23 = *v21;
  v22 = v21[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21E273040()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21E27304C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_21E2802D0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21E2730D0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21E2730DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21E2802D0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_21E27315C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21E2802D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21E2731FC(uint64_t a1)
{
  unint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;
  _BYTE v6[32];

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v2 = sub_21E279F70(0x617465625F7369, 0xE700000000000000);
  if ((v3 & 1) == 0)
    return 0;
  sub_21E272940(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return v5 == 1;
  return result;
}

uint64_t sub_21E273290(uint64_t a1)
{
  unint64_t v2;
  char v3;
  unsigned __int8 v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;
  _BYTE v13[32];

  if (*(_QWORD *)(a1 + 16))
  {
    v2 = sub_21E279F70(0x4449656C646E7562, 0xE800000000000000);
    if ((v3 & 1) != 0)
    {
      sub_21E272940(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v13);
      swift_dynamicCast();
    }
  }
  v4 = sub_21E280504();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 16)
    || (v5 = sub_21E279F70(0x74737269665F7369, 0xEE0079747261705FLL), (v6 & 1) == 0)
    || (sub_21E272940(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)v13), (swift_dynamicCast() & 1) == 0))
  {
    if ((v4 & 1) == 0)
      goto LABEL_8;
    return 0;
  }
  if ((v4 & (v12 != 0)) != 0)
    return 0;
LABEL_8:
  if (qword_2553D18D8 != -1)
    swift_once();
  v7 = sub_21E2803C0();
  __swift_project_value_buffer(v7, (uint64_t)qword_2553D2688);
  v8 = sub_21E2803A8();
  v9 = sub_21E280570();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21E26E000, v8, v9, "3rd party app crash report.", v10, 2u);
    MEMORY[0x2207ADAE4](v10, -1, -1);
  }

  return 1;
}

id sub_21E27349C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v2 = a2;
  if (a2)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0A80]), sel_init);
    v4 = objc_msgSend(v3, sel_allHomeScreenApplicationBundleIdentifiers);

    v5 = sub_21E280540();
    sub_21E271EC8(v5);
    swift_bridgeObjectRelease();
    v6 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v7 = (void *)sub_21E280534();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v6, sel_initWithArray_, v7);

    v9 = (void *)sub_21E280444();
    v2 = objc_msgSend(v8, sel_containsObject_, v9);

  }
  return v2;
}

_OWORD *sub_21E2735B4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21E2735C8()
{
  unint64_t result;

  result = qword_2553D1A00;
  if (!qword_2553D1A00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2553D1A00);
  }
  return result;
}

uint64_t sub_21E273604(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CrashLog.Type(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CrashLog.Type(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21E273734 + 4 * byte_21E280EC5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21E273768 + 4 * byte_21E280EC0[v4]))();
}

uint64_t sub_21E273768(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E273770(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21E273778);
  return result;
}

uint64_t sub_21E273784(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21E27378CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21E273790(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E273798(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E2737A4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21E2737AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrashLog.Type()
{
  return &type metadata for CrashLog.Type;
}

unint64_t sub_21E2737C8()
{
  unint64_t result;

  result = qword_2553D1A10;
  if (!qword_2553D1A10)
  {
    result = MEMORY[0x2207ADA6C](&unk_21E280FB0, &type metadata for CrashLog.Type);
    atomic_store(result, (unint64_t *)&qword_2553D1A10);
  }
  return result;
}

Swift::String_optional __swiftcall URL.extendedAttribute(_:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  sub_21E2801EC();
  swift_allocObject();
  sub_21E2801E0();
  sub_21E273D10((uint64_t (*)(uint64_t, uint64_t))sub_21E272518);
  swift_release();
  v1 = 0;
  v2 = 0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.setExtendedAttribute(name:value:)()
{
  return sub_21E2802B8();
}

uint64_t sub_21E2738F8(uint64_t result)
{
  if (result)
  {
    MEMORY[0x24BDAC7A8](result);
    return sub_21E2802B8();
  }
  return result;
}

uint64_t sub_21E273964(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, _QWORD *a6)
{
  uint64_t v10;
  ssize_t v11;
  uint64_t result;
  uint64_t v13;

  v10 = sub_21E280474();
  v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  result = swift_release();
  if (v11 >= 1)
  {
    *a6 = MEMORY[0x2207AD3DC](a4);
    a6[1] = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_21E2739FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

uint64_t sub_21E273A60(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t value, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t result;
  _QWORD *v30;
  uint64_t v31;
  __int16 v32;
  char v33;
  char v34;
  char v35;
  char v36;

  v31 = v25;
  v32 = v26;
  v33 = BYTE2(v26);
  v34 = BYTE3(v26);
  v35 = BYTE4(v26);
  v36 = BYTE5(v26);
  v27 = sub_21E280474();
  v28 = setxattr(v24, (const char *)(v27 + 32), &v31, BYTE6(v26), 0, 0);
  result = swift_release();
  if (v28 < 0)
  {
    sub_21E273E44();
    swift_allocError();
    *v30 = v28;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_21E273D10(uint64_t (*a1)(uint64_t, uint64_t))
{
  int *v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = sub_21E2802E8();
  v4 = *v1;
  v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = sub_21E2801B0();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v6 = result;
  result = sub_21E2801D4();
  v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v8 = v5 - v4;
  v9 = sub_21E2801C8();
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  return a1(v6 + v7, v6 + v7 + v10);
}

void sub_21E273DB8(uint64_t a1)
{
  uint64_t v1;

  sub_21E2739FC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s22ExtendedAttributeErrorOwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s22ExtendedAttributeErrorOwst(uint64_t result, int a2, int a3)
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

uint64_t sub_21E273E2C()
{
  return 0;
}

ValueMetadata *type metadata accessor for URL.ExtendedAttributeError()
{
  return &type metadata for URL.ExtendedAttributeError;
}

unint64_t sub_21E273E44()
{
  unint64_t result;

  result = qword_2553D1A18;
  if (!qword_2553D1A18)
  {
    result = MEMORY[0x2207ADA6C](&protocol conformance descriptor for URL.ExtendedAttributeError, &type metadata for URL.ExtendedAttributeError);
    atomic_store(result, (unint64_t *)&qword_2553D1A18);
  }
  return result;
}

uint64_t sub_21E273E88(uint64_t a1, unint64_t a2)
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

uint64_t sub_21E273ECC(uint64_t a1, unint64_t a2)
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

uint64_t sub_21E273F10(const char *a1)
{
  uint64_t v1;

  return sub_21E273964(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD **)(v1 + 48));
}

void sub_21E273F30(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  char v39;
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;

  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) == 0x63696E6150 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  v6 = sub_21E2806A8();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
LABEL_21:
    v22 = (void *)sub_21E280444();
    v23 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v22);

    if (v23)
    {
      sub_21E280228();

      __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A20);
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_21E280D80;
      v25 = (void *)sub_21E280444();
      v26 = (void *)MGGetStringAnswer();

      if (v26)
      {
        v27 = sub_21E28045C();
        v29 = v28;

        *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v24 + 64) = sub_21E274840();
        *(_QWORD *)(v24 + 32) = v27;
        *(_QWORD *)(v24 + 40) = v29;
        sub_21E280450();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8) == 0x6873617243 && v9 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    sub_21E273604((uint64_t)a1, (uint64_t)v43);
  }
  else
  {
    v11 = sub_21E2806A8();
    swift_bridgeObjectRelease();
    sub_21E273604((uint64_t)a1, (uint64_t)v43);
    if ((v11 & 1) == 0)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      goto LABEL_12;
    }
  }
  v30 = v44;
  v31 = v45;
  __swift_project_boxed_opaque_existential_1(v43, v44);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v31 + 64))(v30, v31) == 4541505 && v32 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    sub_21E273604((uint64_t)v43, (uint64_t)v40);
LABEL_32:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    goto LABEL_33;
  }
  v33 = sub_21E2806A8();
  swift_bridgeObjectRelease();
  sub_21E273604((uint64_t)v43, (uint64_t)v40);
  if ((v33 & 1) != 0)
    goto LABEL_32;
  v34 = v41;
  v35 = v42;
  __swift_project_boxed_opaque_existential_1(v40, v41);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 64))(v34, v35) == 0x61576D6574737953
    && v36 == 0xEE00676F64686374)
  {
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  v39 = sub_21E2806A8();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  if ((v39 & 1) == 0)
  {
LABEL_12:
    v12 = a1[3];
    v13 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v12);
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 72))(v12, v13);
    v16 = v15;
    v17 = (void *)sub_21E280444();
    v18 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v17);

    if (v18)
    {
      if (v16)
        v19 = v16;
      else
        v19 = 0xE700000000000000;
      if (v16)
        v20 = v14;
      else
        v20 = 0x6E776F6E6B6E55;
      sub_21E280228();

      __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A20);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_21E280D80;
      *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v21 + 64) = sub_21E274840();
      *(_QWORD *)(v21 + 32) = v20;
      *(_QWORD *)(v21 + 40) = v19;
      sub_21E280450();
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
LABEL_42:
    __break(1u);
    return;
  }
LABEL_33:
  v37 = (void *)sub_21E280444();
  v38 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v37);

  if (!v38)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  sub_21E280228();

  sub_21E280450();
LABEL_35:
  swift_bridgeObjectRelease();
}

void sub_21E27457C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_21E280348();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_21E280438();
  MEMORY[0x24BDAC7A8](v5);
  v6 = (void *)sub_21E280444();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleWithIdentifier_, v6);

  if (v8)
  {
    sub_21E280228();

    v9 = sub_21E280450();
    v24 = v10;
    v25 = v9;
    swift_bridgeObjectRelease();
    sub_21E273F30(a1);
    v12 = v11;
    v14 = v13;
    sub_21E28042C();
    v15 = (void *)sub_21E280444();
    v16 = objc_msgSend(v7, sel_bundleWithIdentifier_, v15);

    sub_21E28033C();
    v17 = sub_21E280468();
    v19 = v18;
    sub_21E28042C();
    v20 = (void *)sub_21E280444();
    v21 = objc_msgSend(v7, sel_bundleWithIdentifier_, v20);

    sub_21E28033C();
    v22 = sub_21E280468();
    *a2 = v12;
    a2[1] = v14;
    a2[2] = v25;
    a2[3] = v24;
    a2[4] = v17;
    a2[5] = v19;
    a2[6] = v22;
    a2[7] = v23;
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_21E274840()
{
  unint64_t result;

  result = qword_2553D1A28;
  if (!qword_2553D1A28)
  {
    result = MEMORY[0x2207ADA6C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2553D1A28);
  }
  return result;
}

uint64_t sub_21E274884@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v15;
  void *v16;
  id v17;
  unsigned __int8 v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  unint64_t v22;
  const char *v23;
  uint64_t v24;
  char *v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v39;
  char *v40;
  char *v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A40);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21E2802D0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v39 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v39 - v14;
  v42 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if ((sub_21E2802A0() & 1) != 0)
  {
    sub_21E280294();
    sub_21E2802C4();
    v16 = (void *)sub_21E280444();
    swift_bridgeObjectRelease();
    v17 = v42;
    v18 = objc_msgSend(v42, sel_fileExistsAtPath_, v16);

    if ((v18 & 1) != 0)
    {
      sub_21E2802C4();
      v19 = (void *)sub_21E280444();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v17, sel_isReadableFileAtPath_, v19);

      if ((v20 & 1) != 0)
      {

        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a2, v15, v7);
LABEL_15:
        v37 = 0;
        return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v37, 1, v7);
      }
      v43 = 0;
      v44 = 0xE000000000000000;
      sub_21E280600();
      swift_bridgeObjectRelease();
      v22 = 0xD000000000000018;
      v23 = "File is not readable at ";
    }
    else
    {
      v43 = 0;
      v44 = 0xE000000000000000;
      sub_21E280600();
      swift_bridgeObjectRelease();
      v22 = 0xD000000000000016;
      v23 = "File doesn't exist at ";
    }
    v43 = v22;
    v44 = (unint64_t)(v23 - 32) | 0x8000000000000000;
    sub_21E2802C4();
    sub_21E2804B0();
    swift_bridgeObjectRelease();
    v21 = sub_21E276BC8(v43, v44);
    swift_bridgeObjectRelease();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  else
  {
    v21 = sub_21E276BC8(0xD000000000000018, 0x800000021E281900);
    swift_willThrow();
  }
  sub_21E2754B4((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {

    v36 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v36(v13, v6, v7);
    v36(a2, v13, v7);
    goto LABEL_15;
  }
  sub_21E2775D8((uint64_t)v6, &qword_2553D1A40);
  if (qword_2553D18D0 != -1)
    swift_once();
  v24 = sub_21E2803C0();
  __swift_project_value_buffer(v24, (uint64_t)qword_2553D2670);
  v25 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v41, a1, v7);
  v26 = v21;
  v27 = v21;
  v28 = sub_21E2803A8();
  v29 = sub_21E280564();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v43 = v39;
    *(_DWORD *)v30 = 136446466;
    sub_21E2774CC();
    v31 = sub_21E28069C();
    v45 = sub_21E27F7B4(v31, v32, &v43);
    v40 = a2;
    sub_21E2805B8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v7);
    *(_WORD *)(v30 + 12) = 2082;
    swift_getErrorValue();
    v33 = sub_21E2806C0();
    v45 = sub_21E27F7B4(v33, v34, &v43);
    a2 = v40;
    sub_21E2805B8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21E26E000, v28, v29, "Error accessing %{public}s. %{public}s", (uint8_t *)v30, 0x16u);
    v35 = v39;
    swift_arrayDestroy();
    MEMORY[0x2207ADAE4](v35, -1, -1);
    MEMORY[0x2207ADAE4](v30, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v7);
  }
  v37 = 1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v37, 1, v7);
}

void sub_21E274DF8(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _OWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unsigned __int8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v54)();
  uint64_t v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;

  v62 = a1;
  v64 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A30);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v61 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v60 = (char *)&v59 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v59 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v59 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A38);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A40);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_21E2802D0();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v63 = (char *)&v59 - v25;
  v26 = &a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess();
  if (!*((_QWORD *)v26 + 1))
  {
LABEL_4:
    if (qword_2553D18D8 != -1)
      swift_once();
    v28 = sub_21E2803C0();
    __swift_project_value_buffer(v28, (uint64_t)qword_2553D2688);
    v29 = sub_21E2803A8();
    v30 = sub_21E280564();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_21E26E000, v29, v30, "Invalid log_path.", v31, 2u);
      MEMORY[0x2207ADAE4](v31, -1, -1);
    }

LABEL_9:
    v32 = (_OWORD *)v64;
    *(_QWORD *)(v64 + 32) = 0;
    *v32 = 0u;
    v32[1] = 0u;
    return;
  }
  swift_bridgeObjectRetain();
  sub_21E280258();
  swift_bridgeObjectRelease();
  sub_21E274884((uint64_t)v24, v19);
  v27 = *(void (**)(char *, uint64_t))(v21 + 8);
  v27(v24, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    sub_21E2775D8((uint64_t)v19, &qword_2553D1A40);
    goto LABEL_4;
  }
  v33 = v20;
  v34 = v63;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v63, v19, v33);
  v35 = v62;
  switch(v62)
  {
    case 0:
      sub_21E27B6CC(0, a2, (uint64_t)v16);
      v36 = type metadata accessor for PanicLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 48))(v16, 1, v36) == 1)
      {
        v27(v34, v33);
        v37 = &qword_2553D1A38;
        v38 = (uint64_t)v16;
        goto LABEL_26;
      }
      v56 = (uint64_t *)v64;
      *(_QWORD *)(v64 + 24) = v36;
      v56[4] = (uint64_t)&off_24E245148;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v56);
      v54 = type metadata accessor for PanicLog;
      v55 = (uint64_t)v16;
      goto LABEL_31;
    case 1:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v34, v33);
      sub_21E271870(3u, (uint64_t)v24, (uint64_t)v11);
      v45 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 48))(v11, 1, v45) == 1)
      {
        v27(v34, v33);
        v37 = &qword_2553D1A30;
        v38 = (uint64_t)v11;
        goto LABEL_26;
      }
      v57 = (uint64_t *)v64;
      *(_QWORD *)(v64 + 24) = v45;
      v57[4] = (uint64_t)&off_24E244C78;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v57);
      v54 = type metadata accessor for CrashLog;
      v55 = (uint64_t)v11;
      goto LABEL_31;
    case 2:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v34, v33);
      sub_21E271870(0, (uint64_t)v24, (uint64_t)v13);
      v46 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 48))(v13, 1, v46) == 1)
      {
        v27(v34, v33);
        v37 = &qword_2553D1A30;
        v38 = (uint64_t)v13;
        goto LABEL_26;
      }
      v58 = (uint64_t *)v64;
      *(_QWORD *)(v64 + 24) = v46;
      v58[4] = (uint64_t)&off_24E244C78;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v58);
      v54 = type metadata accessor for CrashLog;
      v55 = (uint64_t)v13;
      goto LABEL_31;
    case 3:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v34, v33);
      v47 = v60;
      v48 = (uint64_t)v60;
      v49 = 1;
      goto LABEL_24;
    case 4:
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v34, v33);
      v47 = v61;
      v48 = (uint64_t)v61;
      v49 = 2;
LABEL_24:
      sub_21E271870(v49, (uint64_t)v24, v48);
      v50 = type metadata accessor for CrashLog();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 48))(v47, 1, v50) == 1)
      {
        v27(v34, v33);
        v37 = &qword_2553D1A30;
        v38 = (uint64_t)v47;
LABEL_26:
        sub_21E2775D8(v38, v37);
        v51 = v64;
        *(_OWORD *)v64 = 0u;
        *(_OWORD *)(v51 + 16) = 0u;
        *(_QWORD *)(v51 + 32) = 0;
      }
      else
      {
        v52 = (uint64_t *)v64;
        *(_QWORD *)(v64 + 24) = v50;
        v52[4] = (uint64_t)&off_24E244C78;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v52);
        v54 = type metadata accessor for CrashLog;
        v55 = (uint64_t)v47;
LABEL_31:
        sub_21E277488(v55, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))v54);
        v27(v34, v33);
      }
      break;
    default:
      if (qword_2553D18D8 != -1)
        swift_once();
      v39 = sub_21E2803C0();
      __swift_project_value_buffer(v39, (uint64_t)qword_2553D2688);
      v40 = sub_21E2803A8();
      v41 = sub_21E280564();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = v33;
        v43 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v43 = 134217984;
        v65 = v35;
        sub_21E2805B8();
        _os_log_impl(&dword_21E26E000, v40, v41, "Invalid Log Type %ld", v43, 0xCu);
        v44 = v43;
        v33 = v42;
        v34 = v63;
        MEMORY[0x2207ADAE4](v44, -1, -1);
      }

      v27(v34, v33);
      goto LABEL_9;
  }
}

uint64_t sub_21E2754B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t);
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v18;

  v2 = sub_21E2802D0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v18 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  sub_21E2802AC();
  sub_21E28027C();
  v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  sub_21E280264();
  sub_21E280288();
  swift_bridgeObjectRelease();
  v12(v9, v2);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_21E2802C4();
  v14 = (void *)sub_21E280444();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  if (v15)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v11, v2);
    v16 = 0;
  }
  else
  {
    v12(v11, v2);
    v16 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, v16, 1, v2);
}

uint64_t sub_21E275678(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  int v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _BYTE v25[32];
  uint64_t v26;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A58);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21E280330();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  v12 = *(_QWORD *)(a1 + 16);
  v26 = MEMORY[0x24BEE4AF8];
  sub_21E272538(0, v12, 0);
  if (!v12)
    return v26;
  v13 = a1 + 32;
  v23 = v9;
  v24 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    sub_21E272940(v13, (uint64_t)v25);
    v14 = swift_dynamicCast();
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    if (!v14)
      break;
    v15(v4, 0, 1, v5);
    v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v16(v11, v4, v5);
    v16(v9, v11, v5);
    v17 = v26;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21E272538(0, *(_QWORD *)(v17 + 16) + 1, 1);
      v17 = v26;
    }
    v19 = *(_QWORD *)(v17 + 16);
    v18 = *(_QWORD *)(v17 + 24);
    if (v19 >= v18 >> 1)
    {
      sub_21E272538(v18 > 1, v19 + 1, 1);
      v17 = v26;
    }
    *(_QWORD *)(v17 + 16) = v19 + 1;
    v20 = v17
        + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
        + *(_QWORD *)(v6 + 72) * v19;
    v9 = v23;
    v16((char *)v20, v23, v5);
    v26 = v17;
    v13 += 32;
    if (!--v12)
      return v17;
  }
  v15(v4, 1, 1, v5);
  swift_release();
  sub_21E2775D8((uint64_t)v4, &qword_2553D1A58);
  return 0;
}

uint64_t sub_21E2758C0(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  char v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t (*v33)(char *);
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v4 = v3;
  v33 = a1;
  v34 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A58);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21E280330();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v31 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v11);
  v35 = (char *)&v26 - v14;
  v36 = MEMORY[0x24BEE4AF8];
  v32 = *(_QWORD *)(a3 + 16);
  if (v32)
  {
    v15 = 0;
    v30 = a3;
    while (v15 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v17 = *(_QWORD *)(v10 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, a3 + v16 + v17 * v15, v9);
      v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      v29(v8, 0, 1, v9);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
        goto LABEL_17;
      v18 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
      v19 = v35;
      v18(v35, v8, v9);
      v20 = v33(v19);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v35, v9);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      if ((v20 & 1) != 0)
      {
        v18(v31, v35, v9);
        v21 = v36;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v28 = 0;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_21E272538(0, *(_QWORD *)(v21 + 16) + 1, 1);
          v21 = v36;
        }
        v24 = *(_QWORD *)(v21 + 16);
        v23 = *(_QWORD *)(v21 + 24);
        v25 = v24 + 1;
        if (v24 >= v23 >> 1)
        {
          v27 = v24 + 1;
          sub_21E272538(v23 > 1, v24 + 1, 1);
          v25 = v27;
          v21 = v36;
        }
        *(_QWORD *)(v21 + 16) = v25;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v18)(v21 + v16 + v24 * v17, v31, v9);
        v36 = v21;
        v4 = v28;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v35, v9);
      }
      a3 = v30;
      if (v32 == ++v15)
      {
        v29(v8, 1, 1, v9);
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_17:
    swift_bridgeObjectRelease();
    sub_21E2775D8((uint64_t)v8, &qword_2553D1A58);
    return v36;
  }
  return result;
}

unsigned __int8 *sub_21E275B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21E28051C();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21E275EEC();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21E280618();
  }
LABEL_7:
  v11 = sub_21E275C70(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_21E275C70(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_21E275EEC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21E280528();
  v4 = sub_21E275F68(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21E275F68(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21E27DB14(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21E27FC44(v9, 0);
      v12 = sub_21E27DC00((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2207AD3E8](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2207AD3E8);
LABEL_9:
      sub_21E280618();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2207AD3E8]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

void sub_21E2760AC()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_operatingSystemVersionString);

  v2 = v1;
  if (!v1)
  {
    sub_21E28045C();
    v2 = (void *)sub_21E280444();
    swift_bridgeObjectRelease();
  }
  v3 = sub_21E28045C();
  v5 = v4;
  if (qword_2553D18E0 != -1)
    swift_once();
  v6 = (void *)qword_2553D26A0;
  v7 = (void *)sub_21E280444();
  v8 = objc_msgSend(v6, sel_stringForKey_, v7);

  if (v8)
  {
    v9 = sub_21E28045C();
    v11 = v10;

    if (v9 == v3 && v11 == v5)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v13 = sub_21E2806A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        v14 = (void *)qword_2553D26A0;
        v15 = (void *)sub_21E280444();
        objc_msgSend(v14, sel_removeObjectForKey_, v15);

      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v16 = (void *)qword_2553D26A0;
  v17 = (id)sub_21E280444();
  objc_msgSend(v16, sel_setValue_forKey_, v2, v17);

}

BOOL sub_21E2762CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a5;
  v8 = sub_21E280330();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  if (qword_2553D18E0 != -1)
    swift_once();
  v15 = (void *)qword_2553D26A0;
  v16 = (void *)sub_21E280444();
  v17 = objc_msgSend(v15, sel_arrayForKey_, v16);

  if (!v17 || (v18 = sub_21E280540(), v17, v19 = sub_21E275678(v18), swift_bridgeObjectRelease(), !v19))
  {
    swift_bridgeObjectRelease();
    v19 = MEMORY[0x24BEE4AF8];
  }
  v20 = sub_21E280324();
  v21 = *(_QWORD *)(v19 + 16);
  v32 = a1;
  if (v21 >= a3)
  {
    MEMORY[0x24BDAC7A8](v20);
    v22 = v31;
    *(&v30 - 4) = a4;
    *(&v30 - 3) = v22;
    *(&v30 - 2) = (uint64_t)v14;
    swift_bridgeObjectRetain();
    v23 = sub_21E2758C0((uint64_t (*)(char *))sub_21E2775A4, (uint64_t)(&v30 - 6), v19);
    swift_bridgeObjectRelease();
    v21 = *(_QWORD *)(v23 + 16);
    v19 = v23;
  }
  if (v21 < a3)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v19 = sub_21E27D768(0, v21 + 1, 1, v19);
    v25 = *(_QWORD *)(v19 + 16);
    v24 = *(_QWORD *)(v19 + 24);
    if (v25 >= v24 >> 1)
      v19 = sub_21E27D768(v24 > 1, v25 + 1, 1, v19);
    *(_QWORD *)(v19 + 16) = v25 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v25, v12, v8);
    v26 = (void *)qword_2553D26A0;
    v27 = (void *)sub_21E280534();
    swift_bridgeObjectRelease();
    v28 = (void *)sub_21E280444();
    objc_msgSend(v26, sel_setValue_forKey_, v27, v28);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v21 >= a3;
}

uint64_t sub_21E2765BC(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  unsigned int v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[32];

  if (qword_2553D18E0 != -1)
    swift_once();
  v4 = (void *)qword_2553D26A0;
  v5 = (void *)sub_21E280444();
  v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_21E2805D0();
    swift_unknownObjectRelease();
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
  }
  sub_21E277514((uint64_t)&v40, (uint64_t)v42);
  sub_21E27755C((uint64_t)v42, (uint64_t)&v40);
  v7 = *((_QWORD *)&v41 + 1);
  sub_21E2775D8((uint64_t)&v40, &qword_2553D1948);
  if (v7)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v8 = sub_21E2803C0();
    __swift_project_value_buffer(v8, (uint64_t)qword_2553D2688);
    swift_bridgeObjectRetain_n();
    v9 = sub_21E2803A8();
    v10 = sub_21E280570();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      *(_QWORD *)&v40 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      v38 = sub_21E27F7B4(a1, a2, (uint64_t *)&v40);
      sub_21E2805B8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E26E000, v9, v10, "Using defaults value for %s.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207ADAE4](v12, -1, -1);
      MEMORY[0x2207ADAE4](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v13 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v14 = (void *)sub_21E280444();
    v15 = objc_msgSend(v13, sel_getTaskingKey_, v14);

    if (v15)
    {
      sub_21E2805D0();
      swift_unknownObjectRelease();
      sub_21E2775D8((uint64_t)v42, &qword_2553D1948);
    }
    else
    {
      sub_21E2775D8((uint64_t)v42, &qword_2553D1948);
      v40 = 0u;
      v41 = 0u;
    }
    sub_21E277514((uint64_t)&v40, (uint64_t)v42);
  }
  sub_21E27755C((uint64_t)v42, (uint64_t)&v40);
  if (!*((_QWORD *)&v41 + 1))
  {
    sub_21E2775D8((uint64_t)&v40, &qword_2553D1948);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    v24 = 0;
LABEL_66:
    sub_21E2775D8((uint64_t)v42, &qword_2553D1948);
    return v24;
  }
  result = v38;
  v17 = HIBYTE(v39) & 0xF;
  v18 = v38 & 0xFFFFFFFFFFFFLL;
  if ((v39 & 0x2000000000000000) != 0)
    v19 = HIBYTE(v39) & 0xF;
  else
    v19 = v38 & 0xFFFFFFFFFFFFLL;
  if (!v19)
  {
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  if ((v39 & 0x1000000000000000) != 0)
  {
    v21 = (uint64_t)sub_21E275B8C(v38, v39, 10);
    v23 = v37;
LABEL_63:
    swift_bridgeObjectRelease();
    if ((v23 & 1) != 0)
      v24 = 0;
    else
      v24 = v21;
    goto LABEL_66;
  }
  if ((v39 & 0x2000000000000000) == 0)
  {
    if ((v38 & 0x1000000000000000) != 0)
      v20 = (unsigned __int8 *)((v39 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v20 = (unsigned __int8 *)sub_21E280618();
    v21 = (uint64_t)sub_21E275C70(v20, v18, 10);
    v23 = v22 & 1;
    goto LABEL_63;
  }
  *(_QWORD *)&v40 = v38;
  *((_QWORD *)&v40 + 1) = v39 & 0xFFFFFFFFFFFFFFLL;
  if (v38 == 43)
  {
    if (!v17)
      goto LABEL_77;
    if (v17 == 1 || (BYTE1(v38) - 48) > 9u)
      goto LABEL_50;
    v21 = (BYTE1(v38) - 48);
    if (v17 != 2)
    {
      if ((BYTE2(v38) - 48) > 9u)
        goto LABEL_50;
      v21 = 10 * (BYTE1(v38) - 48) + (BYTE2(v38) - 48);
      v25 = v17 - 3;
      if (v25)
      {
        v26 = (unsigned __int8 *)&v40 + 3;
        while (1)
        {
          v27 = *v26 - 48;
          if (v27 > 9)
            goto LABEL_50;
          v28 = 10 * v21;
          if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63)
            goto LABEL_50;
          v21 = v28 + v27;
          if (__OFADD__(v28, v27))
            goto LABEL_50;
          v23 = 0;
          ++v26;
          if (!--v25)
            goto LABEL_63;
        }
      }
    }
LABEL_62:
    v23 = 0;
    goto LABEL_63;
  }
  if (v38 != 45)
  {
    if (!v17 || (v38 - 48) > 9u)
      goto LABEL_50;
    v21 = (v38 - 48);
    if (v17 != 1)
    {
      if ((BYTE1(v38) - 48) > 9u)
        goto LABEL_50;
      v21 = 10 * (v38 - 48) + (BYTE1(v38) - 48);
      v29 = v17 - 2;
      if (v29)
      {
        v30 = (unsigned __int8 *)&v40 + 2;
        while (1)
        {
          v31 = *v30 - 48;
          if (v31 > 9)
            goto LABEL_50;
          v32 = 10 * v21;
          if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63)
            goto LABEL_50;
          v21 = v32 + v31;
          if (__OFADD__(v32, v31))
            goto LABEL_50;
          v23 = 0;
          ++v30;
          if (!--v29)
            goto LABEL_63;
        }
      }
    }
    goto LABEL_62;
  }
  if (v17)
  {
    if (v17 != 1 && (BYTE1(v38) - 48) <= 9u)
    {
      if (v17 == 2)
      {
        v23 = 0;
        v21 = -(uint64_t)(BYTE1(v38) - 48);
        goto LABEL_63;
      }
      if ((BYTE2(v38) - 48) <= 9u)
      {
        v21 = -10 * (BYTE1(v38) - 48) - (BYTE2(v38) - 48);
        v33 = v17 - 3;
        if (!v33)
          goto LABEL_62;
        v34 = (unsigned __int8 *)&v40 + 3;
        while (1)
        {
          v35 = *v34 - 48;
          if (v35 > 9)
            break;
          v36 = 10 * v21;
          if ((unsigned __int128)(v21 * (__int128)10) >> 64 != (10 * v21) >> 63)
            break;
          v21 = v36 - v35;
          if (__OFSUB__(v36, v35))
            break;
          v23 = 0;
          ++v34;
          if (!--v33)
            goto LABEL_63;
        }
      }
    }
LABEL_50:
    v21 = 0;
    v23 = 1;
    goto LABEL_63;
  }
  __break(1u);
LABEL_77:
  __break(1u);
  return result;
}

id sub_21E276BC8(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E280D80;
  *(_QWORD *)(inited + 32) = sub_21E28045C();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  sub_21E278DF0(inited);
  v6 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v7 = (void *)sub_21E280444();
  v8 = (void *)sub_21E2803FC();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithDomain_code_userInfo_, v7, 1, v8);

  return v9;
}

uint64_t sub_21E276CDC(_QWORD *a1)
{
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
  uint64_t v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39[3];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if ((seedFeedbackPromptingEnabled() & 1) == 0)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v20 = sub_21E2803C0();
    __swift_project_value_buffer(v20, (uint64_t)qword_2553D2688);
    v21 = sub_21E2803A8();
    v22 = sub_21E280564();
    if (!os_log_type_enabled(v21, v22))
      goto LABEL_19;
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v39[0] = v24;
    *(_DWORD *)v23 = 136315138;
    v42 = sub_21E27F7B4(0xD00000000000001ALL, 0x800000021E2818E0, v39);
    sub_21E2805B8();
    v25 = "%s Not running on a seed build and feedback prompting is disabled.";
    goto LABEL_18;
  }
  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v2, v3) & 1) == 0)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v26 = sub_21E2803C0();
    __swift_project_value_buffer(v26, (uint64_t)qword_2553D2688);
    v21 = sub_21E2803A8();
    v22 = sub_21E280564();
    if (!os_log_type_enabled(v21, v22))
      goto LABEL_19;
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v39[0] = v24;
    *(_DWORD *)v23 = 136315138;
    v42 = sub_21E27F7B4(0xD00000000000001ALL, 0x800000021E2818E0, v39);
    sub_21E2805B8();
    v25 = "%s Failed isUseful check.";
LABEL_18:
    _os_log_impl(&dword_21E26E000, v21, v22, v25, v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207ADAE4](v24, -1, -1);
    MEMORY[0x2207ADAE4](v23, -1, -1);
LABEL_19:

    return 0;
  }
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 48))(v39, v4, v5);
  v6 = v40;
  v7 = v41;
  __swift_project_boxed_opaque_existential_1(v39, v40);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  if ((v8 & 1) == 0)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v27 = sub_21E2803C0();
    __swift_project_value_buffer(v27, (uint64_t)qword_2553D2688);
    v28 = sub_21E2803A8();
    v29 = sub_21E280564();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v39[0] = v31;
      *(_DWORD *)v30 = 136315138;
      v42 = sub_21E27F7B4(0xD00000000000001ALL, 0x800000021E2818E0, v39);
      sub_21E2805B8();
      _os_log_impl(&dword_21E26E000, v28, v29, "%s Sampled out.", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207ADAE4](v31, -1, -1);
      MEMORY[0x2207ADAE4](v30, -1, -1);
    }

    sub_21E273604((uint64_t)a1, (uint64_t)v39);
    sub_21E278CD8(MEMORY[0x24BEE4AF8]);
    v19 = 5;
    goto LABEL_25;
  }
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v10 + 48))(v39, v9, v10);
  v11 = v40;
  v12 = v41;
  __swift_project_boxed_opaque_existential_1(v39, v40);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  if ((v13 & 1) != 0)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v14 = sub_21E2803C0();
    __swift_project_value_buffer(v14, (uint64_t)qword_2553D2688);
    v15 = sub_21E2803A8();
    v16 = sub_21E280564();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v39[0] = v18;
      *(_DWORD *)v17 = 136315138;
      v42 = sub_21E27F7B4(0xD00000000000001ALL, 0x800000021E2818E0, v39);
      sub_21E2805B8();
      _os_log_impl(&dword_21E26E000, v15, v16, "%s Exceeded show limit.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207ADAE4](v18, -1, -1);
      MEMORY[0x2207ADAE4](v17, -1, -1);
    }

    sub_21E273604((uint64_t)a1, (uint64_t)v39);
    sub_21E278CD8(MEMORY[0x24BEE4AF8]);
    v19 = 4;
LABEL_25:
    sub_21E2713CC(v19);
    swift_bridgeObjectRelease();
    sub_21E2775D8((uint64_t)v39, &qword_2553D1930);
    return 0;
  }
  if (qword_2553D18D8 != -1)
    swift_once();
  v34 = sub_21E2803C0();
  __swift_project_value_buffer(v34, (uint64_t)qword_2553D2688);
  v35 = sub_21E2803A8();
  v36 = sub_21E280570();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v39[0] = v38;
    *(_DWORD *)v37 = 136315138;
    v42 = sub_21E27F7B4(0xD00000000000001ALL, 0x800000021E2818E0, v39);
    sub_21E2805B8();
    _os_log_impl(&dword_21E26E000, v35, v36, "%s Success.", v37, 0xCu);
    v32 = 1;
    swift_arrayDestroy();
    MEMORY[0x2207ADAE4](v38, -1, -1);
    MEMORY[0x2207ADAE4](v37, -1, -1);

  }
  else
  {

    return 1;
  }
  return v32;
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

uint64_t sub_21E277488(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_21E2774CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553D1A48;
  if (!qword_2553D1A48)
  {
    v1 = sub_21E2802D0();
    result = MEMORY[0x2207ADA6C](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2553D1A48);
  }
  return result;
}

uint64_t sub_21E277514(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E27755C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E2775A4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(a1, *(_QWORD *)(v1 + 32)) & 1;
}

uint64_t sub_21E2775D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21E277614(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_21E27761C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_21E277624(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_21E27762C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_21E277634(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_21E27763C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_21E277644(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_21E27764C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_21E277654(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_21E27765C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_21E277664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t sub_21E27767C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_21E277684(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_21E2776F4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E2777A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E2777F0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21E277858())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21E2778A8()
{
  return sub_21E27799C(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t sub_21E2778C0(uint64_t a1, uint64_t a2)
{
  return sub_21E277A7C(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t (*sub_21E2778CC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_21E27791C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;

  v3 = a1 + *a3;
  swift_beginAccess();
  if (!*(_QWORD *)(v3 + 8))
    return 0;
  swift_bridgeObjectRetain();
  v4 = (void *)sub_21E280444();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21E277990()
{
  return sub_21E27799C(&OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_21E27799C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_21E2779F8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  if (a3)
  {
    v6 = sub_21E28045C();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E277A70(uint64_t a1, uint64_t a2)
{
  return sub_21E277A7C(a1, a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t sub_21E277A7C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21E277AD4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21E277B38())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id DiagnosticsReporterLaunchOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DiagnosticsReporterLaunchOptions.init()()
{
  char *v0;
  char *v1;
  char *v2;
  objc_class *v3;
  objc_super v5;

  *(_QWORD *)&v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = MEMORY[0x24BEE4AF8];
  v1 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  v3 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v5.receiver = v0;
  v5.super_class = v3;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for DiagnosticsReporterLaunchOptions()
{
  return objc_opt_self();
}

uint64_t sub_21E277C9C(char a1)
{
  return qword_21E2812C0[a1];
}

uint64_t sub_21E277CBC()
{
  char *v0;

  return sub_21E277C9C(*v0);
}

uint64_t sub_21E277CC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21E278934(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21E277CE8()
{
  return 0;
}

void sub_21E277CF4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_21E277D00()
{
  sub_21E278004();
  return sub_21E280738();
}

uint64_t sub_21E277D28()
{
  sub_21E278004();
  return sub_21E280744();
}

id DiagnosticsReporterLaunchOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporterLaunchOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21E277DD0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t *v9;
  _BYTE v11[8];
  char v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21E278004();
  sub_21E28072C();
  v9 = (uint64_t *)(v3 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  v13 = *v9;
  v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A88);
  sub_21E2783EC(&qword_2553D1A90, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_21E280690();
  if (v2)
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  swift_beginAccess();
  v12 = 1;
  swift_bridgeObjectRetain();
  sub_21E280684();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v11[7] = 2;
  swift_bridgeObjectRetain();
  sub_21E280684();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  return swift_bridgeObjectRelease();
}

unint64_t sub_21E278004()
{
  unint64_t result;

  result = qword_2553D1A80;
  if (!qword_2553D1A80)
  {
    result = MEMORY[0x2207ADA6C](&unk_21E28126C, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2553D1A80);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207ADA60](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id DiagnosticsReporterLaunchOptions.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DiagnosticsReporterLaunchOptions.init(from:)(a1);
}

id DiagnosticsReporterLaunchOptions.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  objc_class *v27;
  uint64_t v28;
  char *v29;
  _QWORD *v30;
  char *v31;
  uint64_t *v32;
  objc_super v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t *v37;

  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A98);
  v4 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  v30 = a1;
  *(_QWORD *)&v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach] = MEMORY[0x24BEE4AF8];
  v7 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v32 = (uint64_t *)v7;
  v8 = &v1[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v37 = (uint64_t *)v8;
  v9 = (id)a1[3];
  __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v9);
  sub_21E278004();
  v31 = v1;
  sub_21E280720();
  if (v2)
  {
    v13 = v31;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for DiagnosticsReporterLaunchOptions();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v10 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A88);
    v36 = 0;
    sub_21E2783EC(&qword_2553D1AA0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    v11 = v28;
    v12 = v6;
    sub_21E280678();
    v15 = v35;
    v16 = v29;
    swift_beginAccess();
    *(_QWORD *)v16 = v15;
    swift_bridgeObjectRelease();
    LOBYTE(v35) = 1;
    v17 = sub_21E28066C();
    v19 = v18;
    v20 = v32;
    swift_beginAccess();
    *v20 = v17;
    v20[1] = v19;
    swift_bridgeObjectRelease();
    v34 = 2;
    v21 = sub_21E28066C();
    v22 = v37;
    v23 = v21;
    v25 = v24;
    swift_beginAccess();
    *v22 = v23;
    v22[1] = v25;
    v26 = v31;

    swift_bridgeObjectRelease();
    v27 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
    v33.receiver = v26;
    v33.super_class = v27;
    v9 = objc_msgSendSuper2(&v33, sel_init);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  return v9;
}

uint64_t sub_21E2783EC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2553D1A88);
    v8 = a2;
    result = MEMORY[0x2207ADA6C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

id sub_21E27844C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for DiagnosticsReporterLaunchOptions());
  result = DiagnosticsReporterLaunchOptions.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_21E27849C(_QWORD *a1)
{
  return sub_21E277DD0(a1);
}

uint64_t sub_21E2784BC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E278514@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path, a2);
}

uint64_t sub_21E278520(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E277AD4(a1, a2, a3, a4, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

uint64_t sub_21E27853C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string, a2);
}

uint64_t keypath_get_1Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E278598(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_21E277AD4(a1, a2, a3, a4, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

uint64_t method lookup function for DiagnosticsReporterLaunchOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.files_to_attach.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.files_to_attach.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.files_to_attach.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.log_path.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.log_path.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.log_path.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.panic_string.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.panic_string.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.panic_string.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of DiagnosticsReporterLaunchOptions.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t getEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DiagnosticsReporterLaunchOptions.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21E2787DC + 4 * byte_21E2810F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21E278810 + 4 * asc_21E2810F0[v4]))();
}

uint64_t sub_21E278810(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E278818(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21E278820);
  return result;
}

uint64_t sub_21E27882C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21E278834);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21E278838(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E278840(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticsReporterLaunchOptions.CodingKeys()
{
  return &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys;
}

unint64_t sub_21E278860()
{
  unint64_t result;

  result = qword_2553D1AD0;
  if (!qword_2553D1AD0)
  {
    result = MEMORY[0x2207ADA6C](&unk_21E281244, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2553D1AD0);
  }
  return result;
}

unint64_t sub_21E2788A8()
{
  unint64_t result;

  result = qword_2553D1AD8;
  if (!qword_2553D1AD8)
  {
    result = MEMORY[0x2207ADA6C](&unk_21E2811B4, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2553D1AD8);
  }
  return result;
}

unint64_t sub_21E2788F0()
{
  unint64_t result;

  result = qword_2553D1AE0;
  if (!qword_2553D1AE0)
  {
    result = MEMORY[0x2207ADA6C](&unk_21E2811DC, &type metadata for DiagnosticsReporterLaunchOptions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2553D1AE0);
  }
  return result;
}

uint64_t sub_21E278934(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F745F73656C6966 && a2 == 0xEF6863617474615FLL;
  if (v3 || (sub_21E2806A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x687461705F676F6CLL && a2 == 0xE800000000000000 || (sub_21E2806A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74735F63696E6170 && a2 == 0xEC000000676E6972)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_21E2806A8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_21E278AA4(uint64_t a1)
{
  return sub_21E278B18(a1, qword_2553D2670);
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

uint64_t sub_21E278AFC(uint64_t a1)
{
  return sub_21E278B18(a1, qword_2553D2688);
}

uint64_t sub_21E278B18(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21E2803C0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21E2803B4();
}

uint64_t Array.appendIfNotNil(_:)(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = sub_21E2805A0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  v10 = MEMORY[0x24BDAC7A8](v6);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v8, v3);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v3);
  sub_21E28054C();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v3);
}

unint64_t sub_21E278CD8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1938);
  v2 = (_QWORD *)sub_21E280654();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_21E279F70(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_21E278DF0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B50);
  v2 = sub_21E280654();
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
    sub_21E27B32C(v6, (uint64_t)&v15, &qword_2553D1B58);
    v7 = v15;
    v8 = v16;
    result = sub_21E279F70(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21E2735B4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_21E278F24(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B68);
  v2 = sub_21E280654();
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
    sub_21E27B32C(v6, (uint64_t)&v13, &qword_2553D1B70);
    v7 = v13;
    result = sub_21E279FD4(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_21E2735B4(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_21E279050(uint64_t a1, void *a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  id v36;
  char *v37;
  void *v38;
  uint64_t result;
  id v40;
  void *v41;
  uint64_t (*v42)();
  void (*v43)(_QWORD);
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  void *v58;
  uint64_t (*v59)();
  _QWORD *v60;
  _BYTE v61[40];
  _BYTE v62[40];
  _BYTE v63[40];
  _BYTE v64[40];
  _BYTE v65[24];
  uint64_t v66;

  v55 = a4;
  v7 = sub_21E2803CC();
  v52 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_21E2803F0();
  v54 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v53 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21E2803D8();
  v48 = *(_QWORD *)(v11 - 8);
  v49 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v47 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2553D18D8 != -1)
    swift_once();
  v13 = sub_21E2803C0();
  __swift_project_value_buffer(v13, (uint64_t)qword_2553D2688);
  v14 = a2;
  v15 = sub_21E2803A8();
  v16 = sub_21E280570();
  v17 = v14;
  if (os_log_type_enabled(v15, v16))
  {
    v44 = a1;
    v18 = swift_slowAlloc();
    v43 = a3;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v46 = v7;
    v21 = (_QWORD *)v20;
    *(_DWORD *)v19 = 138412290;
    v57[0] = v14;
    v22 = v14;
    v45 = v9;
    v23 = v22;
    a1 = v44;
    sub_21E2805B8();
    *v21 = v14;

    v9 = v45;
    _os_log_impl(&dword_21E26E000, v15, v16, "Launching app with options: %@", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B10);
    swift_arrayDestroy();
    v24 = v21;
    v7 = v46;
    MEMORY[0x2207ADAE4](v24, -1, -1);
    v25 = v19;
    a3 = v43;
    MEMORY[0x2207ADAE4](v25, -1, -1);

  }
  else
  {

  }
  sub_21E274DF8(a1, (char *)v14, (uint64_t)v65);
  sub_21E27B32C((uint64_t)v65, (uint64_t)v64, &qword_2553D1930);
  sub_21E27B32C((uint64_t)v64, (uint64_t)v63, &qword_2553D1930);
  v26 = swift_allocObject();
  sub_21E2796B4((uint64_t)v64, v26 + 16);
  v27 = v55;
  *(_QWORD *)(v26 + 56) = a3;
  *(_QWORD *)(v26 + 64) = v27;
  v28 = v66;
  sub_21E27B32C((uint64_t)v65, (uint64_t)v62, &qword_2553D1930);
  if (v28)
  {
    sub_21E27B32C((uint64_t)v62, (uint64_t)v57, &qword_2553D1930);
    v29 = v58;
    swift_retain();
    if (!v29)
    {
      result = sub_21E279708((uint64_t)v63);
      __break(1u);
      return result;
    }
    v30 = sub_21E276CDC(v57);
    sub_21E279708((uint64_t)v62);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    if ((v30 & 1) != 0)
    {
      sub_21E279708((uint64_t)v63);
      sub_21E27A394();
      v32 = v47;
      v31 = v48;
      v33 = v49;
      (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, *MEMORY[0x24BEE5490], v49);
      v55 = sub_21E280588();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
      sub_21E27B32C((uint64_t)v65, (uint64_t)v61, &qword_2553D1930);
      v34 = (_QWORD *)swift_allocObject();
      v34[2] = v51;
      sub_21E2796B4((uint64_t)v61, (uint64_t)(v34 + 3));
      v34[8] = sub_21E2796FC;
      v34[9] = v26;
      v34[10] = a1;
      v34[11] = v17;
      v59 = sub_21E27A3D4;
      v60 = v34;
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 1107296256;
      v57[2] = sub_21E279954;
      v58 = &block_descriptor;
      v35 = _Block_copy(v57);
      v36 = v17;
      swift_retain();
      v37 = v53;
      sub_21E2803E4();
      v56 = MEMORY[0x24BEE4AF8];
      sub_21E270A34(&qword_2553D1AF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B00);
      sub_21E27A3F0();
      sub_21E2805DC();
      v38 = (void *)v55;
      MEMORY[0x2207AD4D8](0, v37, v9, v35);
      _Block_release(v35);
      swift_release();

      (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v7);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v37, v50);
      sub_21E279708((uint64_t)v65);
      return swift_release();
    }
  }
  else
  {
    swift_retain();
    sub_21E279708((uint64_t)v62);
  }
  v40 = sub_21E27A27C();
  if ((isInternal() & 1) == 0)
  {
    sub_21E27B32C((uint64_t)v63, (uint64_t)v57, &qword_2553D1930);
    v41 = v58;
    if (v58)
    {
      v42 = v59;
      __swift_project_boxed_opaque_existential_1(v57, (uint64_t)v58);
      (*((void (**)(void *, uint64_t (*)()))v42 + 13))(v41, v42);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    }
    else
    {
      sub_21E279708((uint64_t)v57);
    }
  }
  a3(v40);
  swift_release();

  sub_21E279708((uint64_t)v63);
  return sub_21E279708((uint64_t)v65);
}

uint64_t sub_21E279608(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  if ((isInternal() & 1) == 0)
  {
    sub_21E27B32C(a2, (uint64_t)v9, &qword_2553D1930);
    v6 = v10;
    if (v10)
    {
      v7 = v11;
      __swift_project_boxed_opaque_existential_1(v9, v10);
      (*(void (**)(uint64_t, uint64_t))(v7 + 104))(v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    else
    {
      sub_21E279708((uint64_t)v9);
    }
  }
  return a3(a1);
}

uint64_t sub_21E2796B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E2796FC(uint64_t a1)
{
  uint64_t v1;

  return sub_21E279608(a1, v1 + 16, *(uint64_t (**)(uint64_t))(v1 + 56));
}

uint64_t sub_21E279708(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1930);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_21E279748(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  __CFUserNotification *v11;
  __CFUserNotification *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  CFOptionFlags responseFlags;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  sub_21E27B32C(a2, (uint64_t)v19, &qword_2553D1930);
  if (!v20)
    __break(1u);
  v11 = sub_21E27AB1C(v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  if (!v11)
  {
    v12 = (__CFUserNotification *)sub_21E27A27C();
    v11 = v12;
    goto LABEL_7;
  }
  responseFlags = 0;
  CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
  if (responseFlags)
  {
    if (responseFlags != 1)
    {
      v17 = sub_21E27A27C();
      a3();

      goto LABEL_15;
    }
    CFUserNotificationCancel(v11);
    v12 = 0;
LABEL_7:
    ((void (*)(__CFUserNotification *))a3)(v12);
LABEL_15:

    return;
  }
  if (qword_2553D18D8 != -1)
    swift_once();
  v13 = sub_21E2803C0();
  __swift_project_value_buffer(v13, (uint64_t)qword_2553D2688);
  v14 = sub_21E2803A8();
  v15 = sub_21E280558();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_21E26E000, v14, v15, "Chose default response. Showing app.", v16, 2u);
    MEMORY[0x2207ADAE4](v16, -1, -1);
  }

  sub_21E27B32C(a2, (uint64_t)v19, &qword_2553D1930);
  if (v20)
  {
    sub_21E27AE4C((uint64_t)v19, a5, a6, (uint64_t)a3, a4);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21E279954(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21E279A04(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B48);
    v2 = sub_21E280654();
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
    sub_21E272940(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21E2735B4(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_21E2735B4(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_21E2735B4(v36, v37);
    sub_21E2735B4(v37, &v33);
    result = sub_21E2805E8();
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
    result = (uint64_t)sub_21E2735B4(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_21E27B324();
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

id DiagnosticsReporter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DiagnosticsReporter.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporter();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiagnosticsReporter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticsReporter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21E279E88(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21E279E98(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_21E279ECC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_21E279EDC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_21E280660();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

unint64_t sub_21E279F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21E2806FC();
  sub_21E280498();
  v4 = sub_21E280714();
  return sub_21E27A05C(a1, a2, v4);
}

unint64_t sub_21E279FD4(uint64_t a1)
{
  uint64_t v2;

  sub_21E2806FC();
  type metadata accessor for CFString();
  sub_21E270A34(&qword_2553D1B78, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21E280E28);
  sub_21E280390();
  v2 = sub_21E280714();
  return sub_21E27A13C(a1, v2);
}

unint64_t sub_21E27A05C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21E2806A8() & 1) == 0)
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
      while (!v14 && (sub_21E2806A8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21E27A13C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString();
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_21E270A34(&qword_2553D1B78, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21E280E28);
    v7 = v6;
    v8 = sub_21E280384();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_21E280384();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

id sub_21E27A27C()
{
  uint64_t inited;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E280D80;
  *(_QWORD *)(inited + 32) = sub_21E28045C();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000017;
  *(_QWORD *)(inited + 56) = 0x800000021E281BA0;
  sub_21E278DF0(inited);
  v2 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v3 = (void *)sub_21E280444();
  v4 = (void *)sub_21E2803FC();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, 1, v4);

  return v5;
}

unint64_t sub_21E27A394()
{
  unint64_t result;

  result = qword_2553D1AF0;
  if (!qword_2553D1AF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2553D1AF0);
  }
  return result;
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

unint64_t sub_21E27A3F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553D1B08;
  if (!qword_2553D1B08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2553D1B00);
    result = MEMORY[0x2207ADA6C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2553D1B08);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticsReporter()
{
  return objc_opt_self();
}

uint64_t method lookup function for DiagnosticsReporter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static DiagnosticsReporter.launchApp(with:options:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_21E27A470(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char *v33;
  _QWORD *v34;
  void *v35;
  id v36;
  char *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t (*v42)();
  uint64_t result;
  void (**v44)(_QWORD, _QWORD);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[3];
  void *v59;
  uint64_t (*v60)();
  _QWORD *v61;
  _BYTE v62[40];
  _BYTE v63[40];
  _BYTE v64[40];
  _BYTE v65[40];
  _BYTE v66[24];
  uint64_t v67;

  v52 = a3;
  v56 = a1;
  v47 = sub_21E2803CC();
  v49 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21E2803F0();
  v54 = *(_QWORD *)(v8 - 8);
  v55 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21E2803D8();
  v50 = *(_QWORD *)(v10 - 8);
  v51 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  _Block_copy(a4);
  if (qword_2553D18D8 != -1)
    swift_once();
  v13 = sub_21E2803C0();
  __swift_project_value_buffer(v13, (uint64_t)qword_2553D2688);
  v14 = a2;
  v15 = sub_21E2803A8();
  v16 = sub_21E280570();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v45 = v7;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v46 = v12;
    v20 = (_QWORD *)v19;
    *(_DWORD *)v18 = 138412290;
    v58[0] = v14;
    v21 = v14;
    v44 = a4;
    v22 = v21;
    sub_21E2805B8();
    *v20 = v14;

    a4 = v44;
    _os_log_impl(&dword_21E26E000, v15, v16, "Launching app with options: %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B10);
    swift_arrayDestroy();
    v23 = v20;
    v12 = v46;
    MEMORY[0x2207ADAE4](v23, -1, -1);
    v24 = v18;
    v7 = v45;
    MEMORY[0x2207ADAE4](v24, -1, -1);

  }
  else
  {

  }
  v25 = v56;
  sub_21E274DF8(v56, (char *)v14, (uint64_t)v66);
  sub_21E27B32C((uint64_t)v66, (uint64_t)v65, &qword_2553D1930);
  sub_21E27B32C((uint64_t)v65, (uint64_t)v64, &qword_2553D1930);
  v26 = swift_allocObject();
  sub_21E2796B4((uint64_t)v65, v26 + 16);
  *(_QWORD *)(v26 + 56) = sub_21E27AA80;
  *(_QWORD *)(v26 + 64) = v12;
  v27 = v67;
  sub_21E27B32C((uint64_t)v66, (uint64_t)v63, &qword_2553D1930);
  if (!v27)
  {
    swift_retain();
    sub_21E279708((uint64_t)v63);
    goto LABEL_11;
  }
  sub_21E27B32C((uint64_t)v63, (uint64_t)v58, &qword_2553D1930);
  v28 = v59;
  swift_retain();
  if (v28)
  {
    v29 = sub_21E276CDC(v58);
    sub_21E279708((uint64_t)v63);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    if ((v29 & 1) != 0)
    {
      sub_21E279708((uint64_t)v64);
      sub_21E27A394();
      v31 = v50;
      v30 = v51;
      v32 = v14;
      v33 = v48;
      (*(void (**)(char *, _QWORD, uint64_t))(v50 + 104))(v48, *MEMORY[0x24BEE5490], v51);
      v46 = sub_21E280588();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
      sub_21E27B32C((uint64_t)v66, (uint64_t)v62, &qword_2553D1930);
      v34 = (_QWORD *)swift_allocObject();
      v34[2] = v52;
      sub_21E2796B4((uint64_t)v62, (uint64_t)(v34 + 3));
      v34[8] = sub_21E27B370;
      v34[9] = v26;
      v34[10] = v25;
      v34[11] = v32;
      v60 = sub_21E27A3D4;
      v61 = v34;
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 1107296256;
      v58[2] = sub_21E279954;
      v59 = &block_descriptor_17;
      v35 = _Block_copy(v58);
      v36 = v32;
      swift_retain();
      v37 = v53;
      sub_21E2803E4();
      v57 = MEMORY[0x24BEE4AF8];
      sub_21E270A34(&qword_2553D1AF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B00);
      sub_21E27A3F0();
      v38 = v47;
      sub_21E2805DC();
      v39 = (void *)v46;
      MEMORY[0x2207AD4D8](0, v37, v7, v35);
      _Block_release(v35);
      swift_release();

      (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v38);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v37, v55);
      sub_21E279708((uint64_t)v66);
      swift_release();
      return swift_release();
    }
LABEL_11:
    v40 = sub_21E27A27C();
    if ((isInternal() & 1) == 0)
    {
      sub_21E27B32C((uint64_t)v64, (uint64_t)v58, &qword_2553D1930);
      v41 = v59;
      if (v59)
      {
        v42 = v60;
        __swift_project_boxed_opaque_existential_1(v58, (uint64_t)v59);
        (*((void (**)(void *, uint64_t (*)()))v42 + 13))(v41, v42);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
      }
      else
      {
        sub_21E279708((uint64_t)v58);
      }
    }
    ((void (**)(_QWORD, id))a4)[2](a4, v40);
    swift_release();

    sub_21E279708((uint64_t)v64);
    sub_21E279708((uint64_t)v66);
    return swift_release();
  }
  _Block_release(a4);
  result = sub_21E279708((uint64_t)v64);
  __break(1u);
  return result;
}

uint64_t sub_21E27AA5C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21E27AA80()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 48))
    __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();

  return swift_deallocObject();
}

void sub_21E27AB08()
{
  uint64_t v0;

  sub_21E279748(*(_QWORD *)(v0 + 16), v0 + 24, *(void (**)(void))(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
}

CFUserNotificationRef sub_21E27AB1C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  void *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  const __CFDictionary *v20;
  CFUserNotificationRef v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  SInt32 error;
  _QWORD v28[10];

  v28[8] = *MEMORY[0x24BDAC8D0];
  sub_21E27457C(a1, v28);
  v2 = v28[0];
  v1 = v28[1];
  v4 = v28[2];
  v3 = v28[3];
  v6 = v28[4];
  v5 = v28[5];
  v7 = v28[6];
  v8 = v28[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E281310;
  v10 = (void *)*MEMORY[0x24BDBD6D8];
  if (!*MEMORY[0x24BDBD6D8])
  {
    __break(1u);
    goto LABEL_13;
  }
  v11 = (_QWORD *)inited;
  *(_QWORD *)(inited + 32) = v10;
  v12 = v10;
  swift_bridgeObjectRetain();
  v13 = MEMORY[0x24BEE0D00];
  v11[8] = MEMORY[0x24BEE0D00];
  v11[5] = v2;
  v11[6] = v1;
  v14 = (void *)*MEMORY[0x24BDBD6E0];
  if (!*MEMORY[0x24BDBD6E0])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v11[9] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11[13] = v13;
  v11[10] = v4;
  v11[11] = v3;
  v16 = (void *)*MEMORY[0x24BDBD6F8];
  if (!*MEMORY[0x24BDBD6F8])
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  v11[14] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11[18] = v13;
  v11[15] = v6;
  v11[16] = v5;
  v18 = (void *)*MEMORY[0x24BDBD6F0];
  if (!*MEMORY[0x24BDBD6F0])
    goto LABEL_15;
  v11[19] = v18;
  v19 = v18;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11[23] = v13;
  v11[20] = v7;
  v11[21] = v8;
  sub_21E278F24((uint64_t)v11);
  error = 0;
  type metadata accessor for CFString();
  sub_21E270A34(&qword_2553D18F0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_21E280E54);
  v20 = (const __CFDictionary *)sub_21E2803FC();
  swift_bridgeObjectRelease();
  v21 = CFUserNotificationCreate(0, 0.0, 2uLL, &error, v20);

  if (!v21)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v22 = sub_21E2803C0();
    __swift_project_value_buffer(v22, (uint64_t)qword_2553D2688);
    v23 = sub_21E2803A8();
    v24 = sub_21E280564();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v25 = 67109120;
      swift_beginAccess();
      sub_21E2805B8();
      _os_log_impl(&dword_21E26E000, v23, v24, "Failed to show CFUserNotification. Error: %d", v25, 8u);
      MEMORY[0x2207ADAE4](v25, -1, -1);
    }

    return 0;
  }
  return v21;
}

void sub_21E27AE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t inited;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  objc_class *v23;
  char *v24;
  char *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  objc_super v30;
  uint64_t v31;

  sub_21E28018C();
  swift_allocObject();
  sub_21E280180();
  v31 = a3;
  type metadata accessor for DiagnosticsReporterLaunchOptions();
  sub_21E270A34(&qword_2553D1B40, (uint64_t (*)(uint64_t))type metadata accessor for DiagnosticsReporterLaunchOptions, (uint64_t)&protocol conformance descriptor for DiagnosticsReporterLaunchOptions);
  v9 = sub_21E280174();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E281320;
  v13 = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(inited + 32) = 0x736E6F6974706FLL;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v11;
  *(_QWORD *)(inited + 72) = v13;
  *(_QWORD *)(inited + 80) = 1701869940;
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = a2;
  sub_21E273E88(v9, v11);
  v14 = sub_21E278DF0(inited);
  v15 = objc_allocWithZone(MEMORY[0x24BEB0AE8]);
  v16 = (void *)sub_21E280444();
  v29 = a4;
  v17 = (void *)sub_21E280444();
  v18 = objc_msgSend(v15, sel_initWithServiceName_viewControllerClassName_, v16, v17);

  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0AD0]), sel_init);
  sub_21E279A04(v14);
  swift_bridgeObjectRelease();
  v20 = (void *)sub_21E2803FC();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setUserInfo_, v20);

  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0AC8]), sel_init);
  v22 = objc_msgSend((id)objc_opt_self(), sel_newHandleWithDefinition_configurationContext_, v18, v19);
  v23 = (objc_class *)type metadata accessor for RemoteAlertDeactivationHandler();
  v24 = (char *)objc_allocWithZone(v23);
  v25 = &v24[OBJC_IVAR____TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler_completion];
  *(_QWORD *)v25 = v29;
  *((_QWORD *)v25 + 1) = a5;
  v30.receiver = v24;
  v30.super_class = v23;
  swift_retain();
  v26 = objc_msgSendSuper2(&v30, sel_init);
  v27 = (void *)qword_2553D1AE8;
  qword_2553D1AE8 = (uint64_t)v26;

  if (qword_2553D1AE8)
  {
    objc_msgSend(v22, sel_registerObserver_);
    v28 = v21;
    objc_msgSend(v22, sel_activateWithContext_, v28);
    sub_21E273ECC(v9, v11);
    swift_release();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21E27B324()
{
  return swift_release();
}

uint64_t sub_21E27B32C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_21E27B37C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_21E280444();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    qword_2553D26A0 = (uint64_t)v2;
  }
  else
  {
    sub_21E280630();
    __break(1u);
  }
}

id sub_21E27B44C(uint64_t a1)
{
  return sub_21E27B49C(a1, sub_21E27EB4C);
}

id sub_21E27B49C(uint64_t a1, uint64_t (*a2)(_QWORD *))
{
  uint64_t v2;
  id v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v5 = sub_21E280420();
  if (!v2)
  {
    v7 = v5;
    v8 = v6;
    v24[0] = 10;
    v24[1] = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v5);
    v22[2] = v24;
    swift_bridgeObjectRetain();
    v9 = (_QWORD *)sub_21E27D174(0x7FFFFFFFFFFFFFFFLL, 1, a2, (uint64_t)v22, v7, v8);
    swift_bridgeObjectRelease();
    if (!v9[2])
      __break(1u);
    v10 = v9[4];
    v11 = v9[5];
    v12 = v9[6];
    v13 = v9[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v14 = sub_21E27C434(v10, v11, v12, v13);
    v16 = v15;
    v17 = (void *)objc_opt_self();
    v18 = (void *)sub_21E280318();
    v23[0] = 0;
    v3 = objc_msgSend(v17, sel_JSONObjectWithData_options_error_, v18, 0, v23);

    v19 = v23[0];
    if (v3)
    {
      sub_21E2805D0();
      swift_unknownObjectRelease();
      sub_21E272940((uint64_t)v24, (uint64_t)v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B80);
      if ((swift_dynamicCast() & 1) != 0)
        v3 = (id)v22[4];
      else
        v3 = (id)sub_21E278DF0(MEMORY[0x24BEE4AF8]);
      sub_21E273ECC(v14, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    }
    else
    {
      v20 = v19;
      sub_21E280240();

      swift_willThrow();
      sub_21E273ECC(v14, v16);
    }
  }
  return v3;
}

void sub_21E27B6CC(char a1@<W0>, char *a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v19;
  int *v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  _BYTE *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  char *v31;
  id v32;
  void *v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  int *v42;
  uint8_t *v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  unsigned __int8 v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char v73;
  unint64_t v74;
  unint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[2];
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  _QWORD *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  int *v93;
  char *v94;
  uint64_t *v95;
  uint64_t v96;
  char *v97;
  _BYTE *v98;
  uint64_t v99;
  uint64_t v100[4];

  v92 = a3;
  v5 = sub_21E2803C0();
  v86 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v85 = (char *)v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v87 = (char *)v79 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A40);
  MEMORY[0x24BDAC7A8](v9);
  v84 = (uint64_t)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = sub_21E2802D0();
  v11 = *(_QWORD *)(v99 - 8);
  v12 = MEMORY[0x24BDAC7A8](v99);
  v94 = (char *)v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v97 = (char *)v79 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v81 = (char *)v79 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v79 - v18;
  v20 = (int *)type metadata accessor for PanicLog();
  v21 = *((_QWORD *)v20 - 1);
  v22 = (int *)MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v23) = a1 & 1;
  v25 = &v24[v22[6]];
  *v25 = 0x63696E6150;
  v25[1] = 0xE500000000000000;
  v88 = v25;
  v26 = (uint64_t)&v24[v22[9]];
  *(_QWORD *)(v26 + 24) = &type metadata for CriticalPolicy;
  *(_QWORD *)(v26 + 32) = &off_24E244C10;
  v27 = &v24[v22[10]];
  *v27 = 0;
  v27[1] = 0;
  *v24 = v23;
  v28 = MEMORY[0x24BEE4AF8];
  v29 = sub_21E278DF0(MEMORY[0x24BEE4AF8]);
  v90 = v20[8];
  *(_QWORD *)&v24[v90] = v29;
  v96 = v20[7];
  *(_QWORD *)&v24[v96] = v28;
  v91 = a2;
  v30 = (uint64_t *)&a2[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path];
  swift_beginAccess();
  if (!v30[1])
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    __swift_project_value_buffer(v5, (uint64_t)qword_2553D2688);
    v39 = sub_21E2803A8();
    v40 = sub_21E280564();
    v41 = os_log_type_enabled(v39, v40);
    v36 = v92;
    if (v41)
    {
      v42 = v20;
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_21E26E000, v39, v40, "Invalid log path", v43, 2u);
      v44 = v43;
      v20 = v42;
      MEMORY[0x2207ADAE4](v44, -1, -1);
    }

    goto LABEL_43;
  }
  v83 = v5;
  v80 = v26;
  v98 = v24;
  v95 = v30;
  swift_bridgeObjectRetain();
  v89 = v19;
  sub_21E280258();
  swift_bridgeObjectRelease();
  v31 = (char *)objc_opt_self();
  v32 = objc_msgSend(v31, sel_defaultManager);
  if (!v95[1])
  {
    __break(1u);

    __break(1u);
    goto LABEL_45;
  }
  v33 = v32;
  swift_bridgeObjectRetain();
  v34 = (void *)sub_21E280444();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(v33, sel_fileExistsAtPath_, v34);

  v36 = v92;
  v37 = v87;
  v82 = v21;
  v79[1] = v27;
  if (!v35)
  {
    v45 = v84;
    sub_21E2754B4(v84);
    v46 = v99;
    v47 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v45, 1, v99);
    v38 = (uint64_t)v98;
    if (v47 != 1)
    {
      v58 = v45;
      v59 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 32);
      v60 = v81;
      v59(v81, v58, v46);
      v59((char *)(v38 + v20[5]), (uint64_t)v60, v46);
      goto LABEL_17;
    }
    sub_21E2775D8(v45, &qword_2553D1A40);
    if (qword_2553D18D8 != -1)
      swift_once();
    v48 = v83;
    v49 = __swift_project_value_buffer(v83, (uint64_t)qword_2553D2688);
    v50 = v86;
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v37, v49, v48);
    v31 = v91;
    v51 = sub_21E2803A8();
    v52 = sub_21E280564();
    if (!os_log_type_enabled(v51, v52))
    {

      (*(void (**)(char *, uint64_t))(v50 + 8))(v37, v48);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v89, v99);
      v21 = v82;
      goto LABEL_42;
    }
    v93 = v20;
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    v100[0] = v54;
    *(_DWORD *)v53 = 136446210;
    v55 = v95[1];
    if (v55)
    {
      v56 = v54;
      v57 = *v95;
      swift_bridgeObjectRetain();
      v100[3] = sub_21E27F7B4(v57, v55, v100);
      sub_21E2805B8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E26E000, v51, v52, "Failed reading from URL: %{public}s and retired path.", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207ADAE4](v56, -1, -1);
      MEMORY[0x2207ADAE4](v53, -1, -1);

      (*(void (**)(char *, uint64_t))(v86 + 8))(v87, v83);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v89, v99);
      v20 = v93;
      v21 = v82;
LABEL_42:
      v26 = v80;
LABEL_43:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v26);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(v21 + 56))(v36, 1, 1, v20);
      return;
    }
LABEL_45:

    __break(1u);
    return;
  }
  v38 = (uint64_t)v98;
  (*(void (**)(_BYTE *, char *, uint64_t))(v11 + 16))(&v98[v20[5]], v89, v99);
LABEL_17:
  v61 = &v91[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach];
  swift_beginAccess();
  v62 = *(_QWORD *)(*(_QWORD *)v61 + 16);
  v93 = v20;
  if (!v62)
    goto LABEL_40;
  v87 = (char *)swift_bridgeObjectRetain();
  v63 = (uint64_t *)(v87 + 40);
  v64 = MEMORY[0x24BEE4AF8];
  do
  {
    v66 = *(v63 - 1);
    v65 = *v63;
    swift_bridgeObjectRetain();
    v67 = objc_msgSend(v31, sel_defaultManager);
    v68 = (void *)sub_21E280444();
    v69 = objc_msgSend(v67, sel_fileExistsAtPath_, v68);

    if ((v69 & 1) != 0)
    {
      sub_21E280258();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v64 = sub_21E27D888(0, *(_QWORD *)(v64 + 16) + 1, 1, v64, &qword_2553D1940, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
      v38 = (uint64_t)v98;
      v71 = *(_QWORD *)(v64 + 16);
      v70 = *(_QWORD *)(v64 + 24);
      if (v71 >= v70 >> 1)
        v64 = sub_21E27D888(v70 > 1, v71 + 1, 1, v64, &qword_2553D1940, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
      *(_QWORD *)(v64 + 16) = v71 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v64+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v71, v97, v99);
      goto LABEL_20;
    }
    v72 = v95[1];
    if (v72)
    {
      if (v66 == *v95 && v72 == v65)
      {
        swift_bridgeObjectRelease();
LABEL_33:
        v38 = (uint64_t)v98;
        (*(void (**)(char *, _BYTE *, uint64_t))(v11 + 16))(v94, &v98[v93[5]], v99);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v64 = sub_21E27D888(0, *(_QWORD *)(v64 + 16) + 1, 1, v64, &qword_2553D1940, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
        v75 = *(_QWORD *)(v64 + 16);
        v74 = *(_QWORD *)(v64 + 24);
        if (v75 >= v74 >> 1)
          v64 = sub_21E27D888(v74 > 1, v75 + 1, 1, v64, &qword_2553D1940, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0]);
        *(_QWORD *)(v64 + 16) = v75 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v64+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v75, v94, v99);
LABEL_20:
        *(_QWORD *)(v38 + v96) = v64;
        goto LABEL_21;
      }
      v73 = sub_21E2806A8();
      swift_bridgeObjectRelease();
      if ((v73 & 1) != 0)
        goto LABEL_33;
      v38 = (uint64_t)v98;
    }
    else
    {
      swift_bridgeObjectRelease();
      v38 = (uint64_t)v98;
    }
LABEL_21:
    v63 += 2;
    --v62;
  }
  while (v62);
  swift_bridgeObjectRelease();
  v20 = v93;
LABEL_40:
  v76 = sub_21E27B49C(v38 + v20[5], sub_21E27EB4C);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v89, v99);
  v77 = v90;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v38 + v77) = v76;
  v78 = v92;
  sub_21E27DA94(v38, v92);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v82 + 56))(v78, 0, 1, v20);
  sub_21E27DAD8(v38);
}

uint64_t sub_21E27C434(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16[2];
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v18 = a1;
  *((_QWORD *)&v18 + 1) = a2;
  v19 = a3;
  v20 = a4;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1B88);
  if (swift_dynamicCast())
  {
    sub_21E271EB0(v16, (uint64_t)&v13);
    __swift_project_boxed_opaque_existential_1(&v13, v15);
    sub_21E28021C();
    swift_bridgeObjectRelease();
    v16[0] = v18;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  }
  else
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
    sub_21E2775D8((uint64_t)v16, &qword_2553D1B90);
    sub_21E27E3A4(a1, a2, a3, a4, &v13);
    v5 = v13;
    v4 = v14;
    if (v14 >> 60 == 15)
    {
      v6 = sub_21E27DB14(a1, a2, a3, a4);
      *(_QWORD *)&v16[0] = sub_21E27E8A0(v6);
      *((_QWORD *)&v16[0] + 1) = v7;
      MEMORY[0x24BDAC7A8](*(_QWORD *)&v16[0]);
      sub_21E27DED8();
      __asm { BR              X12 }
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)&v16[0] = v5;
    *((_QWORD *)&v16[0] + 1) = v4;
  }
  return *(_QWORD *)&v16[0];
}

uint64_t type metadata accessor for PanicLog()
{
  uint64_t result;

  result = qword_2553D1BF8;
  if (!qword_2553D1BF8)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_21E27C8C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_21E27C8D8()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  _BYTE v8[32];

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21E281320;
  *(_QWORD *)(inited + 32) = 0x746E656469636E69;
  *(_QWORD *)(inited + 40) = 0xEB0000000064695FLL;
  v2 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for PanicLog() + 32));
  if (*(_QWORD *)(v2 + 16)
    && (v3 = sub_21E279F70(0x746E656469636E69, 0xEB0000000064695FLL), (v4 & 1) != 0)
    && (sub_21E272940(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)v8), sub_21E2735C8(), swift_dynamicCast()))
  {
    v5 = v7;
  }
  else
  {
    sub_21E2735C8();
    v5 = sub_21E280594();
  }
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = 1701869940;
  *(_QWORD *)(inited + 64) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = sub_21E280444();
  return sub_21E278CD8(inited);
}

uint64_t sub_21E27CA1C()
{
  _BYTE *v0;

  if (*v0)
    return 0x79616C70736944;
  else
    return 1953722184;
}

uint64_t sub_21E27CA50()
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
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v15[2];
  uint64_t v16;

  v1 = sub_21E2802D0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1A40);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for PanicLog() + 28));
  v9 = *(_QWORD *)(v8 + 16);
  v15[1] = v8;
  v16 = v0;
  if (v9)
  {
    v10 = v8 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v11 = *(_QWORD *)(v2 + 72);
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    swift_bridgeObjectRetain_n();
    while (1)
    {
      v12(v7, v10, v1);
      v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
      v13(v7, 0, 1, v1);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
      sub_21E27CC10((uint64_t)v4, v16);
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v10 += v11;
      if (!--v9)
        goto LABEL_7;
    }
  }
  else
  {
    v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    swift_bridgeObjectRetain_n();
LABEL_7:
    v13(v7, 1, 1, v1);
  }
  return swift_bridgeObjectRelease_n();
}

void sub_21E27CC10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  unsigned int v28;
  void (*v29)(char *, uint64_t, uint64_t);
  id v30;
  id v31;
  void *v32;
  char *v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  _QWORD v45[3];
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  id v51[2];

  v51[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_21E2802D0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v45 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v45 - v12;
  v14 = type metadata accessor for PanicLog();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v15(v13, a2 + *(int *)(v14 + 20), v5);
  sub_21E27EDF0(&qword_2553D1C48, MEMORY[0x24BDCDB00]);
  LOBYTE(a2) = sub_21E280414();
  v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v13, v5);
  if ((a2 & 1) == 0)
  {
    if (qword_2553D18D8 != -1)
      swift_once();
    v17 = sub_21E2803C0();
    v18 = __swift_project_value_buffer(v17, (uint64_t)qword_2553D2688);
    v47 = v15;
    v15(v11, a1, v5);
    v45[2] = v18;
    v19 = sub_21E2803A8();
    v20 = sub_21E280558();
    v21 = os_log_type_enabled(v19, v20);
    v48 = v16;
    if (v21)
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (void *)swift_slowAlloc();
      v51[0] = v23;
      v46 = v2;
      *(_DWORD *)v22 = 136315138;
      v45[1] = v22 + 4;
      sub_21E27EDF0((unint64_t *)&qword_2553D1A48, MEMORY[0x24BDCDB28]);
      v24 = sub_21E28069C();
      v50 = sub_21E27F7B4(v24, v25, (uint64_t *)v51);
      sub_21E2805B8();
      swift_bridgeObjectRelease();
      v48(v11, v5);
      _os_log_impl(&dword_21E26E000, v19, v20, "Removing file at %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207ADAE4](v23, -1, -1);
      MEMORY[0x2207ADAE4](v22, -1, -1);
    }
    else
    {
      v16(v11, v5);
    }

    v26 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v27 = (void *)sub_21E280270();
    v51[0] = 0;
    v28 = objc_msgSend(v26, sel_removeItemAtURL_error_, v27, v51);

    v29 = v47;
    if (v28)
    {
      v30 = v51[0];
    }
    else
    {
      v31 = v51[0];
      v32 = (void *)sub_21E280240();

      swift_willThrow();
      v33 = v49;
      v29(v49, a1, v5);
      v34 = v32;
      v35 = v32;
      v36 = sub_21E2803A8();
      v37 = sub_21E280564();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = swift_slowAlloc();
        v39 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
        v46 = 0;
        v47 = v39;
        v51[0] = v39;
        *(_DWORD *)v38 = 136446466;
        v40 = sub_21E28024C();
        v50 = sub_21E27F7B4(v40, v41, (uint64_t *)v51);
        sub_21E2805B8();
        swift_bridgeObjectRelease();
        v48(v33, v5);
        *(_WORD *)(v38 + 12) = 2082;
        swift_getErrorValue();
        v42 = sub_21E2806C0();
        v50 = sub_21E27F7B4(v42, v43, (uint64_t *)v51);
        sub_21E2805B8();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21E26E000, v36, v37, "Failed to remove panic file url: %{public}s. Error: %{public}s", (uint8_t *)v38, 0x16u);
        v44 = v47;
        swift_arrayDestroy();
        MEMORY[0x2207ADAE4](v44, -1, -1);
        MEMORY[0x2207ADAE4](v38, -1, -1);

      }
      else
      {

        v48(v33, v5);
      }
    }
  }
}

BOOL sub_21E27D160()
{
  _BYTE *v0;

  return (*v0 & 1) == 0;
}

uint64_t sub_21E27D174(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_21E27D610(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_21E280510();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_21E2804A4();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_21E2804A4();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_21E280528();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_21E27D77C(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_21E27D77C((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_21E2804A4();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_21E280528();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_21E27D77C(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_21E27D77C((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_21E280624();
  __break(1u);
LABEL_42:
  result = sub_21E280624();
  __break(1u);
  return result;
}

uint64_t sub_21E27D610(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_21E280528();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_21E27D77C(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_21E27D77C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_21E280624();
  __break(1u);
  return result;
}

uint64_t sub_21E27D768(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_21E27D888(a1, a2, a3, a4, &qword_2553D1A08, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

_QWORD *sub_21E27D77C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(qword_2553D1B98);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21E27E6F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21E27D888(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
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
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_21E280624();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21E27EA34(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_21E27DA94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PanicLog();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E27DAD8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PanicLog();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21E27DB14(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_21E27FCA8(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21E27FCA8(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_21E2804E0();
  }
  __break(1u);
  return result;
}

unint64_t sub_21E27DC00(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21E27FCA8(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21E2804EC();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21E280618();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21E27FCA8(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21E2804C8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21E27DE10@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!__src)
    goto LABEL_7;
  if (!a2)
  {
    __src = 0;
LABEL_7:
    v6 = 0xC000000000000000;
    goto LABEL_10;
  }
  if (a2 <= 14)
  {
    __src = sub_21E27E7E0((_BYTE *)__src, (_BYTE *)(__src + a2));
    v6 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else
  {
    sub_21E2801EC();
    swift_allocObject();
    v5 = sub_21E2801A4();
    if ((unint64_t)a2 >= 0x7FFFFFFF)
    {
      sub_21E2802F4();
      __src = swift_allocObject();
      *(_QWORD *)(__src + 16) = 0;
      *(_QWORD *)(__src + 24) = a2;
      v6 = v5 | 0x8000000000000000;
    }
    else
    {
      __src = a2 << 32;
      v6 = v5 | 0x4000000000000000;
    }
  }
LABEL_10:
  *a3 = __src;
  a3[1] = v6;
  return __src;
}

void sub_21E27DED8()
{
  __asm { BR              X11 }
}

_QWORD *sub_21E27DF3C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(__int128 *__return_ptr, uint64_t *, char *);
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  unsigned int v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;

  v17 = v5;
  LOWORD(v18) = a1;
  BYTE2(v18) = BYTE2(a1);
  HIBYTE(v18) = BYTE3(a1);
  v19 = BYTE4(a1);
  v20 = BYTE5(a1);
  v21 = BYTE6(a1);
  result = v3(&v13, &v17, (char *)&v17 + BYTE6(a1));
  if (v2)
  {
    v7 = v18 | ((unint64_t)v19 << 32) | ((unint64_t)v20 << 40) | ((unint64_t)v21 << 48);
    *v1 = v17;
    v1[1] = v7;
  }
  else
  {
    v8 = v13;
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v18 | ((unint64_t)v19 << 32) | ((unint64_t)v20 << 40) | ((unint64_t)v21 << 48);
    *v1 = v17;
    v1[1] = v12;
    *(_OWORD *)v4 = v8;
    *(_QWORD *)(v4 + 16) = v9;
    *(_QWORD *)(v4 + 24) = v10;
    *(_OWORD *)(v4 + 32) = v11;
  }
  return result;
}

_BYTE *sub_21E27E1F4@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_21E27E7E0(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_21E27E93C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_21E27E9B4((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

double sub_21E27E268@<D0>(void (*a1)(__int128 *__return_ptr, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  double result;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  if (a2)
  {
    a1(&v10, a2, a3 - a2);
    if (v4)
      return result;
LABEL_5:
    v7 = v11;
    v8 = v12;
    result = *(double *)&v10;
    v9 = v13;
    *(_OWORD *)a4 = v10;
    *(_QWORD *)(a4 + 16) = v7;
    *(_QWORD *)(a4 + 24) = v8;
    *(_OWORD *)(a4 + 32) = v9;
    return result;
  }
  a1(&v10, 0, 0);
  if (!v4)
    goto LABEL_5;
  return result;
}

char *sub_21E27E2E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *(*a3)(__int128 *__return_ptr, char *, char *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  char *result;
  char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  result = (char *)sub_21E2801B0();
  if (!result)
    goto LABEL_12;
  v10 = result;
  result = (char *)sub_21E2801D4();
  v11 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v14 = sub_21E2801C8();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  result = (char *)a3(&v19, &v10[v11], &v10[v11 + v15]);
  if (!v4)
  {
    v16 = v20;
    v17 = v21;
    v18 = v22;
    *(_OWORD *)a4 = v19;
    *(_QWORD *)(a4 + 16) = v16;
    *(_QWORD *)(a4 + 24) = v17;
    *(_OWORD *)(a4 + 32) = v18;
  }
  return result;
}

uint64_t sub_21E27E3A4@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  unint64_t v9;
  _QWORD *v10;
  _QWORD v11[2];

  if ((a4 & 0x1000000000000000) != 0)
  {
    *(_OWORD *)a5 = xmmword_21E281390;
  }
  else
  {
    v9 = result;
    if ((a4 & 0x2000000000000000) != 0)
    {
      v11[0] = a3;
      v11[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      v10 = v11;
    }
    else if ((a3 & 0x1000000000000000) != 0)
    {
      v10 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      v10 = (_QWORD *)sub_21E280618();
    }
    return sub_21E27E45C((uint64_t)v10, v9, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_21E27E45C@<X0>(uint64_t result@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, unint64_t a4@<X4>, unint64_t a5@<X5>, _QWORD *a6@<X8>)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a2;
  v10 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  v15 = a2;
  if (v14 == 4 << v12)
  {
    result = sub_21E27FCA8(a2, a4, a5);
    v15 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v16 = v15 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v17 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v17 = HIBYTE(a5) & 0xF;
  if (v17 < v15 >> 16)
    goto LABEL_31;
  result = sub_21E2804E0();
  v16 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_21E27FCA8(v9, a4, a5);
    v9 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_21E27FCA8(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v9 >> 16);
    goto LABEL_21;
  }
  v18 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v18 = a4 & 0xFFFFFFFFFFFFLL;
  if (v18 < v9 >> 16)
    goto LABEL_29;
  if (v18 < a3 >> 16)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  result = sub_21E2804E0();
LABEL_21:
  if (__OFADD__(v16, result))
  {
    __break(1u);
    goto LABEL_28;
  }
  v19 = result;
  if (v16 + result < v16)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10)
    v20 = v10 + v16;
  else
    v20 = 0;
  return sub_21E27DE10(v20, v19, a6);
}

double sub_21E27E60C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *((_QWORD *)a3 + 2);
  v6 = *((_QWORD *)a3 + 3);
  v15 = *a3;
  v16 = v5;
  v17 = v6;
  sub_21E27E268((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))sub_21E27EB90, a1, a2, (uint64_t)&v11);
  v7 = v12;
  v8 = v13;
  result = *(double *)&v11;
  v10 = v14;
  *(_OWORD *)a4 = v11;
  *(_QWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 24) = v8;
  *(_OWORD *)(a4 + 32) = v10;
  return result;
}

uint64_t sub_21E27E684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v9[2];
  uint64_t v10;

  v5 = sub_21E27DC00((unint64_t)v9, a1, a2, *a3, a3[1], a3[2], a3[3]);
  v6 = v10;
  v7 = v9[1];
  *(_OWORD *)a4 = v9[0];
  *(_OWORD *)(a4 + 16) = v7;
  *(_QWORD *)(a4 + 32) = v6;
  *(_QWORD *)(a4 + 40) = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21E27E6F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21E280660();
  __break(1u);
  return result;
}

uint64_t sub_21E27E7E0(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_21E27E8A0(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_21E2801EC();
      swift_allocObject();
      sub_21E2801BC();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_21E2802F4();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_21E27E93C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_21E2801EC();
  swift_allocObject();
  result = sub_21E2801A4();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21E2802F4();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_21E27E9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_21E2801EC();
  swift_allocObject();
  result = sub_21E2801A4();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_21E27EA34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_21E280660();
  __break(1u);
  return result;
}

uint64_t sub_21E27EB4C(_QWORD *a1)
{
  return sub_21E27EBE0(a1) & 1;
}

double sub_21E27EB64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21E27E60C(a1, a2, *(__int128 **)(v3 + 16), a3);
}

uint64_t sub_21E27EB7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21E273ECC(a1, a2);
  return a1;
}

uint64_t sub_21E27EB90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_21E27E684(a1, a2, *(unint64_t **)(v3 + 16), a3);
}

uint64_t sub_21E27EBAC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21E27EBD0()
{
  return swift_deallocObject();
}

uint64_t sub_21E27EBE0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_21E2806A8() & 1;
}

uint64_t sub_21E27EC34()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21E27EC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_21E2802D0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21E27ECC4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21E27ECD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21E2802D0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_21E27ED50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21E2802D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21E27EDF0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_21E2802D0();
    result = MEMORY[0x2207ADA6C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PanicLog.Type(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PanicLog.Type(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21E27EF0C + 4 * byte_21E2813A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21E27EF40 + 4 * byte_21E2813A0[v4]))();
}

uint64_t sub_21E27EF40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E27EF48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21E27EF50);
  return result;
}

uint64_t sub_21E27EF5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21E27EF64);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21E27EF68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21E27EF70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21E27EF7C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PanicLog.Type()
{
  return &type metadata for PanicLog.Type;
}

unint64_t sub_21E27EF9C()
{
  unint64_t result;

  result = qword_2553D1C50;
  if (!qword_2553D1C50)
  {
    result = MEMORY[0x2207ADA6C](&unk_21E281490, &type metadata for PanicLog.Type);
    atomic_store(result, (unint64_t *)&qword_2553D1C50);
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultPolicy()
{
  return &type metadata for DefaultPolicy;
}

uint64_t sub_21E27EFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v17 = a2;
  v18 = sub_21E280378();
  v2 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21E280210();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E280360();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553D1900);
  v9 = sub_21E28036C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_21E280D80;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v10 + 104))(v12 + v11, *MEMORY[0x24BDCF220], v9);
  sub_21E27071C(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_21E280354();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  v13 = sub_21E2801F8();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v15 & 1 | (v13 < 7);
}

BOOL sub_21E27F1B4()
{
  sub_21E2760AC();
  return sub_21E2762CC(0xD000000000000011, 0x800000021E281DA0, 1, (uint64_t)sub_21E27EFF0, 0);
}

uint64_t sub_21E27F20C()
{
  uint64_t result;
  char v1;
  uint64_t v2;
  unint64_t v3;

  result = sub_21E2765BC(0xD000000000000022, 0x800000021E281D70);
  if ((v1 & 1) != 0)
    v2 = 3;
  else
    v2 = result;
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    v3 = sub_21E270694(0x64uLL);
    return v3 < 0x7FFFFFFFFFFFFFFFLL && v2 >= (uint64_t)(v3 + 1);
  }
  return result;
}

uint64_t sub_21E27F278(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  if (qword_2553D18D8 != -1)
    swift_once();
  v4 = sub_21E2803C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_2553D2688);
  v5 = sub_21E2803A8();
  v6 = sub_21E280570();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 136315138;
    sub_21E27F7B4(0xD000000000000022, 0x800000021E282040, &v10);
    sub_21E2805B8();
    _os_log_impl(&dword_21E26E000, v5, v6, "%s Going to run completion handler...", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207ADAE4](v8, -1, -1);
    MEMORY[0x2207ADAE4](v7, -1, -1);
  }

  objc_msgSend(a1, sel_unregisterObserver_, v2);
  return (*(uint64_t (**)(_QWORD))(v2
                                           + OBJC_IVAR____TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler_completion))(0);
}

void sub_21E27F470(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void (*v11)(void *);
  uint64_t v12;

  v3 = v2;
  if (qword_2553D18D8 != -1)
    swift_once();
  v6 = sub_21E2803C0();
  __swift_project_value_buffer(v6, (uint64_t)qword_2553D2688);
  v7 = sub_21E2803A8();
  v8 = sub_21E280570();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_21E27F7B4(0xD00000000000002CLL, 0x800000021E281E30, &v12);
    sub_21E2805B8();
    _os_log_impl(&dword_21E26E000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207ADAE4](v10, -1, -1);
    MEMORY[0x2207ADAE4](v9, -1, -1);
  }

  objc_msgSend(a1, sel_unregisterObserver_, v3);
  v11 = *(void (**)(void *))(v3
                                      + OBJC_IVAR____TtC27DiagnosticsReporterServices30RemoteAlertDeactivationHandler_completion);
  if (a2)
    a2 = (void *)sub_21E280234();
  v11(a2);

}

id sub_21E27F6C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertDeactivationHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RemoteAlertDeactivationHandler()
{
  return objc_opt_self();
}

uint64_t sub_21E27F724(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21E27F744(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_21E27F7B4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_21E2805B8();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21E27F7B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21E27F884(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21E272940((uint64_t)v12, *a3);
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
      sub_21E272940((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21E27F884(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21E2805C4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21E27FA3C(a5, a6);
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
  v8 = sub_21E280618();
  if (!v8)
  {
    sub_21E280624();
    __break(1u);
LABEL_17:
    result = sub_21E280660();
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

uint64_t sub_21E27FA3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21E27FAD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21E27FD20(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21E27FD20(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21E27FAD0(uint64_t a1, unint64_t a2)
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
      v3 = sub_21E27FC44(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21E28060C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21E280624();
      __break(1u);
LABEL_10:
      v2 = sub_21E2804BC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21E280660();
    __break(1u);
LABEL_14:
    result = sub_21E280624();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21E27FC44(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553D1CF0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21E27FCA8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_21E2804F8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2207AD430](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_21E27FD20(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553D1CF0);
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
  result = sub_21E280660();
  __break(1u);
  return result;
}

unint64_t DiagnosticLogType.init(rawValue:)(unint64_t a1)
{
  return sub_21E28010C(a1);
}

BOOL sub_21E280010(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21E280024()
{
  sub_21E2806FC();
  sub_21E280708();
  return sub_21E280714();
}

uint64_t sub_21E280068()
{
  return sub_21E280708();
}

uint64_t sub_21E280090()
{
  sub_21E2806FC();
  sub_21E280708();
  return sub_21E280714();
}

unint64_t sub_21E2800D0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_21E28010C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_21E280100(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_21E28010C(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

unint64_t sub_21E280120()
{
  unint64_t result;

  result = qword_2553D1D60;
  if (!qword_2553D1D60)
  {
    result = MEMORY[0x2207ADA6C](&protocol conformance descriptor for DiagnosticLogType, &type metadata for DiagnosticLogType);
    atomic_store(result, (unint64_t *)&qword_2553D1D60);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticLogType()
{
  return &type metadata for DiagnosticLogType;
}

uint64_t sub_21E280174()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21E280180()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_21E28018C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21E280198()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_21E2801A4()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_21E2801B0()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21E2801BC()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_21E2801C8()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21E2801D4()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21E2801E0()
{
  return MEMORY[0x24BDCBBF8]();
}

uint64_t sub_21E2801EC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_21E2801F8()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_21E280204()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_21E280210()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21E28021C()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_21E280228()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21E280234()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21E280240()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21E28024C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_21E280258()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21E280264()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_21E280270()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21E28027C()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_21E280288()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21E280294()
{
  return MEMORY[0x24BDCD948]();
}

uint64_t sub_21E2802A0()
{
  return MEMORY[0x24BDCD958]();
}

uint64_t sub_21E2802AC()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_21E2802B8()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_21E2802C4()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21E2802D0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21E2802DC()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_21E2802E8()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_21E2802F4()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_21E280300()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_21E28030C()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_21E280318()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21E280324()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21E280330()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21E28033C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21E280348()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21E280354()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_21E280360()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21E28036C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21E280378()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21E280384()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_21E280390()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_21E28039C()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_21E2803A8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21E2803B4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21E2803C0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21E2803CC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21E2803D8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21E2803E4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21E2803F0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21E2803FC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21E280408()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21E280414()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21E280420()
{
  return MEMORY[0x24BDCF878]();
}

uint64_t sub_21E28042C()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_21E280438()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_21E280444()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21E280450()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_21E28045C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21E280468()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_21E280474()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_21E280480()
{
  return MEMORY[0x24BEE0A60]();
}

uint64_t sub_21E28048C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21E280498()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21E2804A4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_21E2804B0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21E2804BC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21E2804C8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21E2804D4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21E2804E0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21E2804EC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21E2804F8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21E280504()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_21E280510()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21E28051C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21E280528()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21E280534()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21E280540()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21E28054C()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21E280558()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21E280564()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21E280570()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21E28057C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21E280588()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21E280594()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_21E2805A0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21E2805AC()
{
  return MEMORY[0x24BEE1DE8]();
}

uint64_t sub_21E2805B8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21E2805C4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21E2805D0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21E2805DC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21E2805E8()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21E2805F4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21E280600()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21E28060C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21E280618()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21E280624()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21E280630()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21E28063C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21E280648()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21E280654()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21E280660()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21E28066C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21E280678()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21E280684()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21E280690()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21E28069C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21E2806A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21E2806B4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21E2806C0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21E2806CC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21E2806D8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21E2806E4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21E2806F0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21E2806FC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21E280708()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21E280714()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21E280720()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21E28072C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21E280738()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21E280744()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

