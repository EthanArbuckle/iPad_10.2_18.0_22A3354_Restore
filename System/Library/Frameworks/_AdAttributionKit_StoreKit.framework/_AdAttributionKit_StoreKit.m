uint64_t SKStoreProductViewController.loadProduct(parameters:impression:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  sub_23557AA1C();
  v3[22] = sub_23557AA10();
  v3[23] = sub_23557AA04();
  v3[24] = v4;
  return swift_task_switch();
}

uint64_t sub_235579190()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  v1 = *(void **)(v0 + 168);
  swift_bridgeObjectRetain();
  v2 = sub_23557A9A4();
  v4 = v3;
  v5 = sub_23557A98C();
  *(_QWORD *)(v0 + 104) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 80) = v5;
  *(_QWORD *)(v0 + 88) = v6;
  sub_2355793D0((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 120));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_235579AD4((_OWORD *)(v0 + 120), v2, v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_23557A9E0();
  *(_QWORD *)(v0 + 200) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_2355792F0;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_2355793E0;
  *(_QWORD *)(v0 + 104) = &block_descriptor;
  objc_msgSend(v1, sel_loadProductWithParameters_completionBlock_, v8, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_2355792F0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23557934C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_235579388()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_release();
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

_OWORD *sub_2355793D0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2355793E0(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256247778);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t SKStoreProductViewController.loadProduct(parameters:impression:reengagementURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  sub_23557AA1C();
  v4[23] = sub_23557AA10();
  v4[24] = sub_23557AA04();
  v4[25] = v5;
  return swift_task_switch();
}

uint64_t sub_2355794D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v13;

  v13 = *(id *)(v0 + 176);
  swift_bridgeObjectRetain();
  v1 = sub_23557A9A4();
  v3 = v2;
  v4 = sub_23557A98C();
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 104) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 80) = v4;
  *(_QWORD *)(v0 + 88) = v6;
  sub_2355793D0((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 120));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_235579AD4((_OWORD *)(v0 + 120), v1, v3, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_23557A95C();
  *(_QWORD *)(v0 + 104) = v5;
  *(_QWORD *)(v0 + 80) = v8;
  *(_QWORD *)(v0 + 88) = v9;
  sub_2355793D0((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 120));
  v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_235579AD4((_OWORD *)(v0 + 120), 0xD000000000000013, 0x800000023557ACA0, v10);
  swift_bridgeObjectRelease();
  v11 = sub_23557A9E0();
  *(_QWORD *)(v0 + 208) = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_235579694;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_2355793E0;
  *(_QWORD *)(v0 + 104) = &block_descriptor_2;
  objc_msgSend(v13, sel_loadProductWithParameters_completionBlock_, v11, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_235579694()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2355796F0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 208);
  swift_release();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23557972C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 208);
  swift_release();
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_235579774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23557AA88();
  sub_23557A9F8();
  v4 = sub_23557AA94();
  return sub_235579CAC(a1, a2, v4);
}

uint64_t sub_2355797D8(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256247780);
  v6 = sub_23557AA58();
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
        sub_2355793D0(v24, v35);
      }
      else
      {
        sub_235579F90((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_23557AA88();
      sub_23557A9F8();
      result = sub_23557AA94();
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
      result = (uint64_t)sub_2355793D0(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_235579AD4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_235579774(a2, a3);
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
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_2355793D0(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_235579D8C();
      goto LABEL_7;
    }
    sub_2355797D8(v15, a4 & 1);
    v21 = sub_235579774(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_235579C44(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_23557AA7C();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CE1C0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_OWORD *sub_235579C44(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_2355793D0(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_235579CAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23557AA70() & 1) == 0)
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
      while (!v14 && (sub_23557AA70() & 1) == 0);
    }
  }
  return v6;
}

void *sub_235579D8C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256247780);
  v2 = *v0;
  v3 = sub_23557AA4C();
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
    sub_235579F90(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_2355793D0(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_235579F90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SKOverlayAppConfiguration.appImpression.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _OWORD v12[2];
  _QWORD v13[4];

  sub_23557A9D4();
  MEMORY[0x24BDAC7A8]();
  v3 = sub_23557A998();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 48;
  sub_23557A9A4();
  v7 = (void *)sub_23557A9EC();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v1, sel_additionalValueForKey_, v7);

  if (v8)
  {
    sub_23557AA40();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  sub_23557A324((uint64_t)v12, (uint64_t)v13);
  if (!v13[3])
  {
    sub_23557A898((uint64_t)v13, &qword_256247788);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v9 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(a1, v9, 1, v3);
  }
  sub_23557A980();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
  v9 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(a1, v9, 1, v3);
}

uint64_t sub_23557A324(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256247788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SKOverlayAppConfiguration.appImpression.setter(uint64_t a1)
{
  return sub_23557A5D8(a1, &qword_256247798, (uint64_t (*)(_QWORD))MEMORY[0x24BDB4A48], MEMORY[0x24BDB4A40], (void (*)(uint64_t))MEMORY[0x24BDB4A58]);
}

void (*SKOverlayAppConfiguration.appImpression.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256247798) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  SKOverlayAppConfiguration.appImpression.getter((uint64_t)v4);
  return sub_23557A3FC;
}

void sub_23557A3FC(uint64_t a1, char a2)
{
  sub_23557A7A8(a1, a2, (void (*)(void *))SKOverlayAppConfiguration.appImpression.setter, &qword_256247798);
}

uint64_t SKOverlayAppConfiguration.adAttributionReengagementURL.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v3;
  id v4;
  uint64_t v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  sub_23557A9B0();
  v3 = (void *)sub_23557A9EC();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_additionalValueForKey_, v3);

  if (v4)
  {
    sub_23557AA40();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_23557A324((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_23557A968();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_23557A898((uint64_t)v8, &qword_256247788);
  }
  v6 = sub_23557A974();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, 1, 1, v6);
}

uint64_t sub_23557A528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9;
  char *v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23557A854(a1, (uint64_t)v10, a5);
  return a6(v10);
}

uint64_t SKOverlayAppConfiguration.adAttributionReengagementURL.setter(uint64_t a1)
{
  return sub_23557A5D8(a1, &qword_2562477A0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCD820], (void (*)(uint64_t))MEMORY[0x24BDB4A60]);
}

uint64_t sub_23557A5D8(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(void), void (*a5)(uint64_t))
{
  void *v5;
  void *v10;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];

  v10 = v5;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23557A854(a1, (uint64_t)v13, a2);
  v14 = a3(0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    v16 = sub_23557A898((uint64_t)v13, a2);
    v17 = 0;
  }
  else
  {
    v21[0] = a4();
    v21[1] = v18;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
    v17 = sub_23557AA64();
    v16 = sub_23557A820((uint64_t)v21);
  }
  a5(v16);
  v19 = (void *)sub_23557A9EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setAdditionalValue_forKey_, v17, v19);
  swift_unknownObjectRelease();

  return sub_23557A898(a1, a2);
}

void (*SKOverlayAppConfiguration.adAttributionReengagementURL.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2562477A0) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  SKOverlayAppConfiguration.adAttributionReengagementURL.getter((uint64_t)v4);
  return sub_23557A794;
}

void sub_23557A794(uint64_t a1, char a2)
{
  sub_23557A7A8(a1, a2, (void (*)(void *))SKOverlayAppConfiguration.adAttributionReengagementURL.setter, &qword_2562477A0);
}

void sub_23557A7A8(uint64_t a1, char a2, void (*a3)(void *), uint64_t *a4)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 8);
  v6 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_23557A854(*(_QWORD *)(a1 + 16), (uint64_t)v5, a4);
    a3(v5);
    sub_23557A898((uint64_t)v6, a4);
  }
  else
  {
    a3(*(void **)(a1 + 16));
  }
  free(v6);
  free(v5);
}

uint64_t sub_23557A820(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE0D00] - 8) + 8))();
  return a1;
}

uint64_t sub_23557A854(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23557A898(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23557A8D4@<X0>(uint64_t a1@<X8>)
{
  return SKOverlayAppConfiguration.appImpression.getter(a1);
}

uint64_t sub_23557A8F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23557A528(a1, a2, a3, a4, &qword_256247798, (uint64_t (*)(char *))SKOverlayAppConfiguration.appImpression.setter);
}

uint64_t sub_23557A918@<X0>(uint64_t a1@<X8>)
{
  return SKOverlayAppConfiguration.adAttributionReengagementURL.getter(a1);
}

uint64_t sub_23557A938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23557A528(a1, a2, a3, a4, &qword_2562477A0, (uint64_t (*)(char *))SKOverlayAppConfiguration.adAttributionReengagementURL.setter);
}

uint64_t sub_23557A95C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_23557A968()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23557A974()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23557A980()
{
  return MEMORY[0x24BDB4A38]();
}

uint64_t sub_23557A98C()
{
  return MEMORY[0x24BDB4A40]();
}

uint64_t sub_23557A998()
{
  return MEMORY[0x24BDB4A48]();
}

uint64_t sub_23557A9A4()
{
  return MEMORY[0x24BDB4A58]();
}

uint64_t sub_23557A9B0()
{
  return MEMORY[0x24BDB4A60]();
}

uint64_t sub_23557A9BC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23557A9C8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23557A9D4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23557A9E0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23557A9EC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23557A9F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23557AA04()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23557AA10()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_23557AA1C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_23557AA28()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23557AA34()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23557AA40()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23557AA4C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23557AA58()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23557AA64()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23557AA70()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23557AA7C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23557AA88()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23557AA94()
{
  return MEMORY[0x24BEE4328]();
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

